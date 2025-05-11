Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265F81D5CEA
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 11:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746962033; cv=none; b=T2+tcF5ZjqKBledN6pWRv18kJtamwYRRf2hjRxt0kH/6Kq08gDMW45oPe4IH9CeiRFJACmM31ouCIODnhxcPG8hkBDuyv8wudIlkvlv/xto77Opyyd/FmPayS/n8pQ2KNqLhyO58DhA0fW5pYUq08f5WF2bBftrn1kkjCpEYLFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746962033; c=relaxed/simple;
	bh=b9I/zEXGQIc7hEokRw3SGv9msRQTW6TBrbYa5QahSTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKxtkdRlT1QX3sVr1abzhclO1lUtqK0+aJl3AavKb+4nfD38LHC33l4Q7CnapWsdmYzlA0KbMoCt6mNUCIldV3j4c0HMP3S5t9nd9sk8FiS9k3as1bLbzesiJ5b7LR1zA4LcvzI+yI2NqdnUooTqckJrXwhSSOSTIxmDvfpbpgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ew4AvpcZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ew4AvpcZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746962030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Airg4webqukAlFGEQw+CSdLqTsx5ThZe2jBG9nkZHPY=;
	b=Ew4AvpcZG3Bh0Us0YDZkNTXe1YXRXt61BT3++OnxBZmEfGmI4sqKLLASrfIcnw4uOjZ4gD
	GvmT/n9B+0gvDnYtbk3R5DPSY+m7fR8pc7/FCustJA0NKUcOXnM3XaJlFsWhTt0IEMbNsx
	CSlZ5thOdrSAGY0I3vPCoPsdAZxasu0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-8_JG-6TWM92d6ybzAKXFsw-1; Sun, 11 May 2025 07:13:48 -0400
X-MC-Unique: 8_JG-6TWM92d6ybzAKXFsw-1
X-Mimecast-MFC-AGG-ID: 8_JG-6TWM92d6ybzAKXFsw_1746962027
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a0b570a73eso1966512f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 04:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746962026; x=1747566826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Airg4webqukAlFGEQw+CSdLqTsx5ThZe2jBG9nkZHPY=;
        b=Qk9xRSnGzV81xAkE/bZinU1FPHMm4vX61G6pPFG58HgVYcJRzfYMHmNJzawSLrGsJ9
         Gwaq7cN75LqGaR1UWGC46Y2jaZSlXg/LFhYky3GWYIcnkzx2lkqlfCSa+8Ai/h4ShEA3
         h/xdCQ5XzDvpjqYYlcDc+gbTusCrCJ076QZBwA6n3g+8U3Y1o8K7vSwUHxBsI+5R8UOj
         FPrZiC362WlnZWoDDogeCQnG1VdKo69oDJUep1SOiMyXd/f9KzpAaUIxzN2URmgv1Ubf
         mjT9PqZXnQQlspjO202+TANL+dBPl3YIeGAD1M+lDvBuzVwZa/dUBdm50YhLMDzVu7Oi
         NMZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp2tfDvuRzuTGtzygSgtjclxDQZ2nVKnSIkBYlIDhkaytNdDisqRjAjHSJLuQ6uzffHU3cSTTXBV35IVc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc+cvm8PkacNBUTOXxs28ovOtSLlY1fkhMDW8h6TrPOcEdyOas
	UEwW/GsMKGcV74eKE1cCn0RCwd8IN+iD8JhtJjstbOeR/IoloqSMhbtfmtmAIn+Okan95HeWNeE
	jkhDSQqjvj1COP3UbdEcKfaXjsSm2dTbdzbWrwjw759sWIAmg7JLQ+0w7DfSh1guWYC92pqr0uB
	1QX3OKd4mYKej08UkPAq+hStgbtZqCL6kpsUHIAcvnlZCtZmI=
X-Gm-Gg: ASbGnct+TbBN7HI9/6E0zFZdtf6Alx+K1sLTTKCYN4NKPlHHj11lel0QqncwPo5HYUj
	qHbwnj+nx2PiSBOOwKueYkAgUvFQiTnuxCVqONHvjqcdvhhtg4bKTOAMo6zTYPIedVIDZ
X-Received: by 2002:a05:6000:a83:b0:3a0:9dd5:5dc2 with SMTP id ffacd0b85a97d-3a1f64d1cd2mr6298351f8f.59.1746962026585;
        Sun, 11 May 2025 04:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNuKTsKl3oRGcCkzR3cb5pXOsob8y4/sdGyAJENPTXcSA9xBtJkpAmGLE6sfC6oyC8lN+o2usBjNacCZNXpm8=
X-Received: by 2002:a05:6000:a83:b0:3a0:9dd5:5dc2 with SMTP id
 ffacd0b85a97d-3a1f64d1cd2mr6298334f8f.59.1746962026122; Sun, 11 May 2025
 04:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509190108.1582362-1-seanjc@google.com>
In-Reply-To: <20250509190108.1582362-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 11 May 2025 13:13:33 +0200
X-Gm-Features: AX0GCFt6COEoqchgrJJ27SkGNJFtfxEjqyYPA--QXU7uz3ASU9I3N4-OVIu1PQo
Message-ID: <CABgObfbKCRggZm7kbeVkAykxO1tEi1v7q=emcSxWWgMLX20WPA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM: x86: Fixes for 6.15-rcN
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:01=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
> Please pull a random variety of fixes for 6.15.  The SRSO change is the
> most urgent fix, everything else has either existed for some time, or isn=
't
> actively causing problems.

Cool, thanks; pulled.

Paolo

> The following changes since commit 2d7124941a273c7233849a7a2bbfbeb7e28f1c=
aa:
>
>   Merge tag 'kvmarm-fixes-6.15-2' of https://git.kernel.org/pub/scm/linux=
/kernel/git/kvmarm/kvmarm into HEAD (2025-04-24 13:28:53 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-x86/linux.git tags/kvm-x86-fixes-6.15-rcN
>
> for you to fetch changes up to e3417ab75ab2e7dca6372a1bfa26b1be3ac5889e:
>
>   KVM: SVM: Set/clear SRSO's BP_SPEC_REDUCE on 0 <=3D> 1 VM count transit=
ions (2025-05-08 07:17:10 -0700)
>
> ----------------------------------------------------------------
> KVM x86 fixes for 6.15-rcN
>
>  - Forcibly leave SMM on SHUTDOWN interception on AMD CPUs to avoid causi=
ng
>    problems due to KVM stuffing INIT on SHUTDOWN (KVM needs to sanitize t=
he
>    VMCB as its state is undefined after SHUTDOWN, emulating INIT is the
>    least awful choice).
>
>  - Track the valid sync/dirty fields in kvm_run as a u64 to ensure KVM
>    KVM doesn't goof a sanity check in the future.
>
>  - Free obsolete roots when (re)loading the MMU to fix a bug where
>    pre-faulting memory can get stuck due to always encountering a stale
>    root.
>
>  - When dumping GHCB state, use KVM's snapshot instead of the raw GHCB pa=
ge
>    to print state, so that KVM doesn't print stale/wrong information.
>
>  - When changing memory attributes (e.g. shared <=3D> private), add poten=
tial
>    hugepage ranges to the mmu_invalidate_range_{start,end} set so that KV=
M
>    doesn't create a shared/private hugepage when the the corresponding
>    attributes will become mixed (the attributes are commited *after* KVM
>    finishes the invalidation).
>
>  - Rework the SRSO mitigation to enable BP_SPEC_REDUCE only when KVM has =
at
>    least one active VM.  Effectively BP_SPEC_REDUCE when KVM is loaded le=
d
>    to very measurable performance regressions for non-KVM workloads.
>
> ----------------------------------------------------------------
> Dan Carpenter (1):
>       KVM: x86: Check that the high 32bits are clear in kvm_arch_vcpu_ioc=
tl_run()
>
> Mikhail Lobanov (1):
>       KVM: SVM: Forcibly leave SMM mode on SHUTDOWN interception
>
> Sean Christopherson (2):
>       KVM: x86/mmu: Prevent installing hugepages when mem attributes are =
changing
>       KVM: SVM: Set/clear SRSO's BP_SPEC_REDUCE on 0 <=3D> 1 VM count tra=
nsitions
>
> Tom Lendacky (1):
>       KVM: SVM: Update dump_ghcb() to use the GHCB snapshot fields
>
> Yan Zhao (1):
>       KVM: x86/mmu: Check and free obsolete roots in kvm_mmu_reload()
>
>  arch/x86/kvm/mmu.h     |  3 ++
>  arch/x86/kvm/mmu/mmu.c | 70 +++++++++++++++++++++++++++++++++++---------=
--
>  arch/x86/kvm/smm.c     |  1 +
>  arch/x86/kvm/svm/sev.c | 32 ++++++++++++---------
>  arch/x86/kvm/svm/svm.c | 75 ++++++++++++++++++++++++++++++++++++++++++++=
++----
>  arch/x86/kvm/svm/svm.h |  2 ++
>  arch/x86/kvm/x86.c     |  4 +--
>  7 files changed, 150 insertions(+), 37 deletions(-)
>

