function [] = numrange(A, clr)
%            An Effective Algorithm for Calculating the Numerical Range
%                        Carl C. Cowen and Elad Harel
%                             Purdue University
%
%  	This script finds the numerical range of an n x n matrix by 
%   finding the real and imaginary parts of rotates of the matrix
%   and finding the associated boundary point of that rotate by 
%   finding the largest eigenvalue of the real part and using the
%   corresponding eigenvector's contribution to the numerical range.
%   Multiplicity of the largest eigenvalue, as occurs in a normal 
%   matrix, is handled by plotting the end points of the corresponding
%   segment in the boundary of the numerical range.
%
if nargin<2, clr = 'y'; end
	
nm=ceil(norm(A));
th=[0:.01:6.29];
k=1;
w=zeros(1,630);
for j=1:630
    Ath=(exp(i*(-th(j))))*A;
    Hth=(Ath+Ath')/2;
    [r e]=eig(Hth);
    e=real(diag(e));
    m=max(e);
	s=find(e==m);
 if size(s,1)==1 
	    w(k)=r(:,s)'*A*r(:,s);
  %
  %  This is the point of the numerical range contributed by 
  %   v_t=r(:,s) when the eigenspace of Hth (H_t) is one dimensional.
  %
	else
	 Kth=i*(Hth-Ath);
  pKp=r(:,s)'*Kth*r(:,s);
  %
  %  The matrix Q described above is  r(:,s)
  %
		[rr ee]=eig(pKp);
		ee=real(diag(ee));
		mm=min(ee);
		sm=find(ee==mm);
		temp=rr(:,sm(:,1))'*r(:,s)'*A*r(:,s)*rr(:,sm(:,1));
		w(k)=temp(1,1);
  %
  %  This is the point of the numerical range contributed by
  %    v_t^- = r(:,s)*rr(:,sm(:,1))
  %
		k=k+1;
		mM=max(ee);
		sM=find(ee==mM);
		temp=rr(:,sM(:,1))'*r(:,s)'*A*r(:,s)*rr(:,sM(:,1));
		w(k)=temp(1,1);
  %
  %  This is the point of the numerical range contributed by v_t^+
  %
 end
	k=k+1;
end
fill(real(w),imag(w),clr)
axis([-nm,nm,-nm,nm])
axis('equal')
