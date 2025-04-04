Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DAC1F30DE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778106; cv=none; b=V15/rhEoEZ21lZWwHyZbY4wCI0wArxOHEBCyr9Z2johDEC8RoREF3cys2Kb+0bTts0EnPb/cGnVGlAhguB1+B3QOJ/JFJwxl3CqiIcohj2AqkWdr0S1MEHLWOIGa7jNHrU08cwuHomrX3ZORuKq+mGlRilgabVsC77TbjD6RnJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778106; c=relaxed/simple;
	bh=7GoSdsG/z6MpG2BagU+D4l810H5dr152SZ9Pl+lLkHw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SZZvGTCl8Pb5oD/OrJMEHt/l6k4o2BavFfh1BzLI8Huiru8oa+BeWUbePVG+LM9KhwSj/TKE/13eUexjx2jIVKU7t8y6F8rl5zV9zjomW9a9U2QSAbYBDQckVRSlScM4+mKsfgKkrByhRW35YBSDoe/G1DREW2yaSihO47fTSUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cTu5lGVY; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cTu5lGVY"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73009f59215so2663786b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743778104; x=1744382904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJhPpgrch93rw9qEOeOeCjiRRouixDVFkUmIy3HUxXE=;
        b=cTu5lGVYLdmbLfYh2hUqzaSQ9t3uYG73iXUTiuVj+B13ux9VIsF5/A3Ku7P+APCmj3
         pR2k1BH/cjeSh2vXr/yCxAZYzze9WyMwJFGd+/47XEN8WaOuy0UUN1BDr4NbPmI5YNyR
         KWjO8T9lhIxfvb6wNTcyXJiFYc6+IvAebUeYp8xJIX9uvOU1T4XQqqwysWK6oUTHIQTt
         agxZYLmaVH9HmgaKeLNdegK/aXuMnSyAvvWXdnahsu7AOgmYgI4wxfR+EJsBtGFiNocI
         TGvxJvFnkK3zFg5hrdhvw70zI4E8YhbCFbh94VJDA5RcCkIOvfQbaQDycF9Rb/x9cG0e
         EB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743778104; x=1744382904;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AJhPpgrch93rw9qEOeOeCjiRRouixDVFkUmIy3HUxXE=;
        b=eYl+YJkk+XzzW/QaGybEfFyplaz6jUpFCeV0XMK9EHfJTGjpO+QHd1+7zKhRjL9Onm
         LKp/bi8+80K3y/xAzSRWRkZiY8NvTD3qAeUsVIp3bc15gXGjWJU/t0qg6CXS3nX+eYx6
         0mG27pLXIKQW9Sj/h5ytrA8xK99Lu1tzQdNHl4McAAgaW0sLT84rG4nrP5D4bSZoRjQE
         iR7qKagKHDKfX0aqaLIpIsHCVDIFp7SoQrijFPyHctEC8k/71Dsh9+8QBqoypapvK/71
         rzfmtQ73AsEGprAxGGOtKSHpSNm/irwuJe+yx62WFaqK8ahh9O9S7B+uePO7jmqeLqbC
         JsMA==
X-Forwarded-Encrypted: i=1; AJvYcCWIHPy7FH2HR3imzk04mcCYaxCAVrPI/k/1VVazzPoEEj0StBUgQ7QunuzZ52awDrVbkQHqJjU4ex0XLSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXcpI8XIeO4+Rzw/BH/eSuBtoLis0DPefxIl/npCNNydNjet1A
	8KtSTqLsf1jLX7m6u/SNquJ4Wzn+LlTZcBjzaoPcVNyjwCQTr4OzxuPKT6Uo2/3EY+LIx4hvs3W
	Hvg==
X-Google-Smtp-Source: AGHT+IHFvdwrET8Y6QcdUiOgpiO855/145zExvENJh/buRtt+mH/PTvvhnAGZvIkGKaQJbDWqiOBm8BuNwU=
X-Received: from pffk21.prod.google.com ([2002:aa7:88d5:0:b0:736:6fb6:804])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c991:b0:1f5:87a0:60ed
 with SMTP id adf61e73a8af0-2010800c6b8mr4326139637.19.1743778104358; Fri, 04
 Apr 2025 07:48:24 -0700 (PDT)
Date: Fri, 4 Apr 2025 07:48:22 -0700
In-Reply-To: <676ed22f-9c3f-4013-99d8-37c4c73bb9ac@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250317091917.72477-1-liamni-oc@zhaoxin.com> <Z9gl5dbTfZsUCJy-@google.com>
 <676ed22f-9c3f-4013-99d8-37c4c73bb9ac@zhaoxin.com>
Message-ID: <Z-_xNpgsYDW0_4Jn@google.com>
Subject: Re: [PATCH] KVM: x86:Cancel hrtimer in the process of saving PIT
 state to reduce the performance overhead caused by hrtimer during guest stop.
From: Sean Christopherson <seanjc@google.com>
To: LiamNioc <LiamNi-oc@zhaoxin.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, 
	pbonzini@redhat.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, LiamNi@zhaoxin.com, 
	CobeChen@zhaoxin.com, LouisQi@zhaoxin.com, EwanHai@zhaoxin.com, 
	FrankZhu@zhaoxin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025, LiamNioc wrote:
> On 2025/3/17 21:38, Sean Christopherson wrote:
> > On Mon, Mar 17, 2025, Liam Ni wrote:
> > > When using the dump-guest-memory command in QEMU to dump
> > > the virtual machine's memory,the virtual machine will be
> > > paused for a period of time.If the guest (i.e., UEFI) uses
> > > the PIT as the system clock,it will be observed that the
> > > HRTIMER used by the PIT continues to run during the guest
> > > stop process, imposing an additional burden on the system.
> > > Moreover, during the guest restart process,the previously
> > > established HRTIMER will be canceled,and the accumulated
> > > timer events will be flushed.However, before the old
> > > HRTIMER is canceled,the accumulated timer events
> > > will "surreptitiously" inject interrupts into the guest.
> > >=20
> > > SO during the process of saving the KVM PIT state,
> > > the HRTIMER need to be canceled to reduce the performance overhead
> > > caused by HRTIMER during the guest stop process.
> > >=20
> > > i.e. if guest
> > >=20
> > > Signed-off-by: Liam Ni <liamni-oc@zhaoxin.com>
> > > ---
> > >   arch/x86/kvm/x86.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > > index 045c61cc7e54..75355b315aca 100644
> > > --- a/arch/x86/kvm/x86.c
> > > +++ b/arch/x86/kvm/x86.c
> > > @@ -6405,6 +6405,8 @@ static int kvm_vm_ioctl_get_pit(struct kvm *kvm=
, struct kvm_pit_state *ps)
> > >=20
> > >        mutex_lock(&kps->lock);
> > >        memcpy(ps, &kps->channels, sizeof(*ps));
> > > +     hrtimer_cancel(&kvm->arch.vpit->pit_state.timer);
> > > +     kthread_flush_work(&kvm->arch.vpit->expired);
> >=20
> > KVM cannot assume userspace wants to stop the PIT when grabbing a snaps=
hot.  It's
> > a significant ABI change, and not desirable in all cases.
>=20
> When VM Pause, all devices of the virtual machine are frozen, so the PIT
> freeze only saves the PIT device status, but does not cancel HRTIMER, but
> chooses to cancel HRTIMER when VM resumes and refresh the pending task.
> According to my observation, before refreshing the pending task, these
> pending tasks will secretly inject interrupts into the guest.
>=20
> So do we need to cancel the HRTIMER when VM pause=EF=BC=9F

The problem is that KVM has no real concept of pausing a VM.  There are a v=
ariety
of hacky hooks here and there, but no KVM-wide notion of "pause".

For this case, after getting PIT state, you should be able to use KVM_SET_P=
IT2 to
set the mode of channel[0] to 0xff, which call destroy_pit_timer() via
pit_load_count().
