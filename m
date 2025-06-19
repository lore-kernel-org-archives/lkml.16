Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E3717555
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750293232; cv=none; b=AblNAwFP4AlU7saeMRPGyD8gwR9+yG7zCeXx04mat6DwBU4Thb3ade3W81IWsyqUDL9gcCGseHC65nhwRXAHaZ+t+wVgW/mnBDDTtSMXNXddnFNCwG2Z+dj8yvBZlRm5O8J6T9K9Ug4lswLXwyJDNLu3F8KL7hy9AYDKpA4BJnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750293232; c=relaxed/simple;
	bh=ineObSKhjDvFrQD/iV5qZAu78NJPkSXbC3g4ZIhvhhg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HXZ6Q4hOmst27GkxuOrrXW52zfCF+yF6juQx7K/p10DgTB06gUHJkrQi+MQ8LJDF0/Swh9D2Y/yvs9Jp3rvIGZZTnjmu22E4++Vlhx4T991P6+GtdY0cAU3TPgyscwa94WPScEmWt+XFTNZPi/MLVNusomAPLwMCfiX4xlfex1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HFmOgHLM; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HFmOgHLM"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3138c50d2a0so201869a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750293230; x=1750898030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ozyqP5iFd/oeF9jBfpH7lXrvTfbtA0oyt32HPKlGT4=;
        b=HFmOgHLM3kAvl80BfGnIheZFiGGjHCkhWPsqM1GE6JD58BVMueJARqyg3RibJJw4Kz
         rpujpncLQgrIpm/Xdrfs5dCLeKf8ELXc3DoEczQ93Api7FHZ95e6FR4YPfAWqzju4So3
         b6og7BiXZ9lOIL25RU2NET8xTOU2S5hWhpMNQy4EFqsbFvKQF6S+t8UhUCle6EPXpieK
         tXeN+e4N43rR2DZVXMLqQPoItDjE/eJTOmvy8ic7IXmumIO23BbCbUcw2jPHqTlmu+xS
         Cy2Kl28/7uZGYC/6jfwvGWAP2KZKCN1KZS0yYtyLBI7GVl78hn8bEbHi86MaEaSbb/AO
         HMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750293230; x=1750898030;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8ozyqP5iFd/oeF9jBfpH7lXrvTfbtA0oyt32HPKlGT4=;
        b=L4W910o8WKrvnErs7XiSvwOjfotImdpw0PYKs3CMYMD4O+F0m2V7QQWcazTcFVm7zV
         DVCR480wz1cXnP3cd1vLl1pY2DnMKsiZmyX6pDe+PIO6UfNYg6571gzaRdXO7cdSKqf/
         i3VxpclW3z1CZrpAd4Vayw2wXIp355gHWPmWDzMnGwfToR9zBvm6yJIKQLrizIkqk/VM
         l62glxjUDMNjLoB9NrWGV9BWoZbnN2QjvIXVvcNqFx1H+5/9XA6MegSfyfRtv/+SCP2r
         x1g+W86Sp4Gy/C5P33pzbFWXBKcqofmrngsSXuTGgyG6R+A0RRnaeMMkkzK+aCUQAni+
         8Q5w==
X-Forwarded-Encrypted: i=1; AJvYcCVD+7KvlJzFBlZWiQ97VhRibBCE9Cy/t9veeBtbH2lCEPB4+ZslukmQMn1by1aaKhWTh8hFC0f+hHXMPeY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx77OMNaWIP/btltY6EjEgmqDkyBSb05CNP/aSBrOVAG3rE4+jb
	GGgn8f0eQn2zAyaSQTaxyXyS3mcQF2kaDSryk+Q77uZYJDur2CoN9zXuVHMNSOUqmSiXFF/Z/Fr
	5C21nfQ==
X-Google-Smtp-Source: AGHT+IE4nV+fwRjbWkVLABlGebYmkWBmOHP0+TxRnSyEu+WWnfKjacSS2b9nxUdjb696VzTZLdd0ybYAJ/0=
X-Received: from pjvv5.prod.google.com ([2002:a17:90b:5885:b0:312:187d:382d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c09:b0:313:17e3:7ae0
 with SMTP id 98e67ed59e1d1-313f1d8346bmr22826375a91.34.1750293229812; Wed, 18
 Jun 2025 17:33:49 -0700 (PDT)
Date: Wed, 18 Jun 2025 17:33:48 -0700
In-Reply-To: <0df27aaf-51be-4003-b8a7-8e623075709e@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611095158.19398-1-adrian.hunter@intel.com>
 <20250611095158.19398-2-adrian.hunter@intel.com> <CAGtprH_cpbPLvW2rSc2o7BsYWYZKNR6QAEsA4X-X77=2A7s=yg@mail.gmail.com>
 <e86aa631-bedd-44b4-b95a-9e941d14b059@intel.com> <CAGtprH_PwNkZUUx5+SoZcCmXAqcgfFkzprfNRH8HY3wcOm+1eg@mail.gmail.com>
 <0df27aaf-51be-4003-b8a7-8e623075709e@intel.com>
Message-ID: <aFNa7L74tjztduT-@google.com>
Subject: Re: [PATCH V4 1/1] KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM
From: Sean Christopherson <seanjc@google.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Vishal Annapurve <vannapurve@google.com>, pbonzini@redhat.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, kirill.shutemov@linux.intel.com, 
	kai.huang@intel.com, reinette.chatre@intel.com, xiaoyao.li@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@linux.intel.com, 
	isaku.yamahata@intel.com, linux-kernel@vger.kernel.org, yan.y.zhao@intel.com, 
	chao.gao@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025, Adrian Hunter wrote:
> On 18/06/2025 09:00, Vishal Annapurve wrote:
> > On Tue, Jun 17, 2025 at 10:50=E2=80=AFPM Adrian Hunter <adrian.hunter@i=
ntel.com> wrote:
> >>> Ability to clean up memslots from userspace without closing
> >>> VM/guest_memfd handles is useful to keep reusing the same guest_memfd=
s
> >>> for the next boot iteration of the VM in case of reboot.
> >>
> >> TD lifecycle does not include reboot.  In other words, reboot is
> >> done by shutting down the TD and then starting again with a new TD.
> >>
> >> AFAIK it is not currently possible to shut down without closing
> >> guest_memfds since the guest_memfd holds a reference (users_count)
> >> to struct kvm, and destruction begins when users_count hits zero.
> >>
> >=20
> > gmem link support[1] allows associating existing guest_memfds with new
> > VM instances.
> >=20
> > Breakdown of the userspace VMM flow:
> > 1) Create a new VM instance before closing guest_memfd files.
> > 2) Link existing guest_memfd files with the new VM instance. -> This
> > creates new set of files backed by the same inode but associated with
> > the new VM instance.
>=20
> So what about:
>=20
> 2.5) Call KVM_TDX_TERMINATE_VM IOCTL
>=20
> Memory reclaimed after KVM_TDX_TERMINATE_VM will be done efficiently,
> so avoid causing it to be reclaimed earlier.

The problem is that setting kvm->vm_dead will prevent (3) from succeeding. =
 If
kvm->vm_dead is set, KVM will reject all vCPU, VM, and device (not /dev/kvm=
 the
device, but rather devices bound to the VM) ioctls.

I intended that behavior, e.g. to guard against userspace blowing up KVM be=
cause
the hkid was released, I just didn't consider the memslots angle.

The other thing I didn't consider at the time, is that vm_dead doesn't full=
y
protect against ioctls that are already in flight.  E.g. see commit
17c80d19df6f ("KVM: SVM: Reject SEV{-ES} intra host migration if vCPU creat=
ion
is in-flight").  Though without a failure/splat of some kind, it's impossib=
le to
to know if this is actually a problem.  I.e. I don't think we should *entir=
ely*
scrap blocking ioctls just because it *might* not be perfect (we can always=
 make
KVM better).

I can think of a few options:

 1. Skip the vm_dead check if userspace is deleting a memslot.
 2. Provide a way for userspace to delete all memslots, and have that bypas=
s
    vm_dead.
 3. Delete all memslots on  KVM_TDX_TERMINATE_VM.
 4. Remove vm_dead and instead reject ioctls based on vm_bugged, and simply=
 rely
    on KVM_REQ_VM_DEAD to prevent running the guest.  I.e. tweak kvm_vm_dea=
d()
    to be that it only prevents running the VM, and have kvm_vm_bugged() be=
 the
    "something is badly broken, try to limit the damage".

I'm heavily leaning toward #4.  #1 is doable, but painful.  #2 is basically=
 #1,
but with new uAPI.  #3 is all kinds of gross, e.g. userspace might want to =
simply
kill the VM and move on.  KVM would still block ioctls, but only if a bug w=
as
detected.  And the few use cases where KVM just wants to prevent entering t=
he
guest won't prevent gracefully tearing down the VM.

Hah!  And there's actually a TDX bug fix here, because "checking" for KVM_R=
EQ_VM_DEAD
in kvm_tdp_map_page() and tdx_handle_ept_violation() will *clear* the reque=
st,
which isn't what we want, e.g. a vCPU could actually re-enter the guest at =
that
point.

This is what I'm thinking.  If I don't hate it come Friday (or Monday), I'l=
l turn
this patch into a mini-series and post v5.

Adrian, does that work for you?

---
 arch/arm64/kvm/arm.c            |  2 +-
 arch/arm64/kvm/vgic/vgic-init.c |  2 +-
 arch/x86/kvm/x86.c              |  2 +-
 include/linux/kvm_host.h        |  2 --
 virt/kvm/kvm_main.c             | 10 +++++-----
 5 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index de2b4e9c9f9f..18bd80388b59 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1017,7 +1017,7 @@ static int kvm_vcpu_suspend(struct kvm_vcpu *vcpu)
 static int check_vcpu_requests(struct kvm_vcpu *vcpu)
 {
 	if (kvm_request_pending(vcpu)) {
-		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu))
+		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
 			return -EIO;
=20
 		if (kvm_check_request(KVM_REQ_SLEEP, vcpu))
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-ini=
t.c
index eb1205654ac8..c2033bae73b2 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -612,7 +612,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
 	mutex_unlock(&kvm->arch.config_lock);
 out_slots:
 	if (ret)
-		kvm_vm_dead(kvm);
+		kvm_vm_bugged(kvm);
=20
 	mutex_unlock(&kvm->slots_lock);
=20
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b58a74c1722d..37f835d77b65 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10783,7 +10783,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 	bool req_immediate_exit =3D false;
=20
 	if (kvm_request_pending(vcpu)) {
-		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu)) {
+		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu)) {
 			r =3D -EIO;
 			goto out;
 		}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3bde4fb5c6aa..56898e4ab524 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -853,7 +853,6 @@ struct kvm {
 	u32 dirty_ring_size;
 	bool dirty_ring_with_bitmap;
 	bool vm_bugged;
-	bool vm_dead;
=20
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
 	struct notifier_block pm_notifier;
@@ -893,7 +892,6 @@ struct kvm {
=20
 static inline void kvm_vm_dead(struct kvm *kvm)
 {
-	kvm->vm_dead =3D true;
 	kvm_make_all_cpus_request(kvm, KVM_REQ_VM_DEAD);
 }
=20
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index eec82775c5bf..4220579a9a74 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4403,7 +4403,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 	struct kvm_fpu *fpu =3D NULL;
 	struct kvm_sregs *kvm_sregs =3D NULL;
=20
-	if (vcpu->kvm->mm !=3D current->mm || vcpu->kvm->vm_dead)
+	if (vcpu->kvm->mm !=3D current->mm || vcpu->kvm->vm_bugged)
 		return -EIO;
=20
 	if (unlikely(_IOC_TYPE(ioctl) !=3D KVMIO))
@@ -4646,7 +4646,7 @@ static long kvm_vcpu_compat_ioctl(struct file *filp,
 	void __user *argp =3D compat_ptr(arg);
 	int r;
=20
-	if (vcpu->kvm->mm !=3D current->mm || vcpu->kvm->vm_dead)
+	if (vcpu->kvm->mm !=3D current->mm || vcpu->kvm->vm_bugged)
 		return -EIO;
=20
 	switch (ioctl) {
@@ -4712,7 +4712,7 @@ static long kvm_device_ioctl(struct file *filp, unsig=
ned int ioctl,
 {
 	struct kvm_device *dev =3D filp->private_data;
=20
-	if (dev->kvm->mm !=3D current->mm || dev->kvm->vm_dead)
+	if (dev->kvm->mm !=3D current->mm || dev->kvm->vm_bugged)
 		return -EIO;
=20
 	switch (ioctl) {
@@ -5131,7 +5131,7 @@ static long kvm_vm_ioctl(struct file *filp,
 	void __user *argp =3D (void __user *)arg;
 	int r;
=20
-	if (kvm->mm !=3D current->mm || kvm->vm_dead)
+	if (kvm->mm !=3D current->mm || kvm->vm_bugged)
 		return -EIO;
 	switch (ioctl) {
 	case KVM_CREATE_VCPU:
@@ -5395,7 +5395,7 @@ static long kvm_vm_compat_ioctl(struct file *filp,
 	struct kvm *kvm =3D filp->private_data;
 	int r;
=20
-	if (kvm->mm !=3D current->mm || kvm->vm_dead)
+	if (kvm->mm !=3D current->mm || kvm->vm_bugged)
 		return -EIO;
=20
 	r =3D kvm_arch_vm_compat_ioctl(filp, ioctl, arg);

base-commit: 8046d29dde17002523f94d3e6e0ebe486ce52166
--
