Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D083B134AC
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747847532; cv=none; b=njBPMuGfohiJrqhR3RvV0GXLbYUZPyHw5orvYVNqfNPmVYx83D2U/aR+/PMiTfds5XY9yAo87tUmeruHuRBAfx9GHWY5Nu+JVKX78SJ+QPBBYjoB3k1TThv8QKPvKm+VZyVx5KUzmhqVPrM4T4NRyPxO4Rn6m1/ZVDhTcM9OwlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747847532; c=relaxed/simple;
	bh=d78K/Ch8eyzrP9+AsaFGDE7EsISxi0Ne4K7nZRV1XIw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=efXWoZjkTYCaa9WdHgehD01KrYeQHWv3DvFie8fDTeiNJkmYK5ksOLMM0U4i1lujzPFUhReTzwVk/dyyPASl+in/pEXIpG9f7jUByYrjGMx+3a/OyYY0FRY7+cC/6OBa+HqPP4f6FhoFCIhf0iqoGR5U4V/cFq+0is+dePOvTwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G80VNuhl; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G80VNuhl"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22e3b03cd64so55185955ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747847529; x=1748452329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jNOuCCyzTb1XsnW2HWyWlahXwvYtOlPi+YMKNdC9nY=;
        b=G80VNuhlJpjIMnCZtmZFHxKhE6RYrRJe+IqbLVaeT2BPEEpAj5K7YJ2PXT8cD+dKrM
         y3f9Rs8IkRfGV7hj/hwN5vN3gdAk5cZiJNo9zwU8AO6dzQz6edW9KYOshIz3I/kR/JUP
         iahD866WssIAbiIH9umYuh1a7fHrhdo+A6qE67aAr2VVg1DCTx2rCAr/DkPMZdeLn8Xg
         c1RGXIVEcQ+lk1XQe94tFkHW9czOBOiJojGqnl106Eaj/7Wpk95D8Pf5BLdAswvzKzcn
         HR2iWnATPNyDQj9y+2DhY4toxB8tid45G7tDbqmrOIWbfFUPVdE+57HPp3efDixhcf3b
         Hl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747847529; x=1748452329;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/jNOuCCyzTb1XsnW2HWyWlahXwvYtOlPi+YMKNdC9nY=;
        b=aVHxDn1z/l5kPv4p63jGY6LeooLaBTIPW055QQA8j0JvNH31uhhcO1nlpPbHhp4883
         sqH9CPwLmzIG6aOlqLF+pxu6mX9Rsg7RryUzdf4G85pj1d2NttTi2Cb2yFLaT0z1w7Eh
         XSrctqcHUDJw4JI/PRhSr5ojvSGnZLfZquc9XNCFl5TLUUy3wzvQGr6DzJknTeifQDrM
         /8JZz6bN/IN840mPN0opl0AAJqsoaGq3r6jlY+FxW8YB+KrjfEXt+FyXCLn7AIxFQSf0
         tNXGZxs30/I1+JCYSUDwgb2+ir7uZfc8+52oY3CA5Km6BJj8aQ7gSvqHa0m05oNMHH8K
         MX4w==
X-Forwarded-Encrypted: i=1; AJvYcCUG4sE5fmq0zfKu0BZtqgDRj/CfFAUy7ssFX+mxanOYxanaEDVA18UsDx9Mq8U6tXwbbG/JarVYArK32bQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1oDCJGyQFiI5p5uvQcssdIzxGGsSTS7S1BXcn1NuaclJQFgxV
	Z5N8H0O1FwwFnk9eBrxPz3Ybug7/xOypxsBNA2suf0XUGC4TnhZeDbz0j10TH9AXhVKIcEwTVYh
	rISfeyA==
X-Google-Smtp-Source: AGHT+IETbMHTy/wN84eri4+XJ0dfgyM1nswfh9RHqUQIPWwj4IQFkSc004LmUCE4Wu6BrDmB0awj2qSQ5PU=
X-Received: from ploy13.prod.google.com ([2002:a17:903:1b2d:b0:22e:5728:685d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d483:b0:232:17d8:486
 with SMTP id d9443c01a7336-23217d81153mr249809655ad.22.1747847529062; Wed, 21
 May 2025 10:12:09 -0700 (PDT)
Date: Wed, 21 May 2025 10:12:07 -0700
In-Reply-To: <5546ad0e36f667a6b426ef47f1f40aee8d83efc9.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516215422.2550669-1-seanjc@google.com> <20250516215422.2550669-3-seanjc@google.com>
 <219b6bd5-9afe-4d1c-aaab-03e5c580ce5c@redhat.com> <aCtQlanun-Kaq4NY@google.com>
 <dca247173aace1269ce8512ae2d3797289bb1718.camel@intel.com>
 <aC0MIUOTQbb9-a7k@google.com> <5546ad0e36f667a6b426ef47f1f40aee8d83efc9.camel@intel.com>
Message-ID: <aC4JZ4ztJiFGVMkB@google.com>
Subject: Re: [PATCH v3 2/3] KVM: x86: Use kvzalloc() to allocate VM struct
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"vipinsh@google.com" <vipinsh@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025, Kai Huang wrote:
> On Tue, 2025-05-20 at 16:11 -0700, Sean Christopherson wrote:
> > On Tue, May 20, 2025, Kai Huang wrote:
> > > On Mon, 2025-05-19 at 08:39 -0700, Sean Christopherson wrote:
> > > > +static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn=
,
> > > > +					enum pg_level level, kvm_pfn_t pfn)
> > > >  {
> > > >  	struct page *page =3D pfn_to_page(pfn);
> > > >  	int ret;
> > > > @@ -3507,10 +3507,14 @@ int __init tdx_bringup(void)
> > > >  	r =3D __tdx_bringup();
> > > >  	if (r) {
> > > >  		/*
> > > > -		 * Disable TDX only but don't fail to load module if
> > > > -		 * the TDX module could not be loaded.  No need to print
> > > > -		 * message saying "module is not loaded" because it was
> > > > -		 * printed when the first SEAMCALL failed.
> > > > +		 * Disable TDX only but don't fail to load module if the TDX
> > > > +		 * module could not be loaded.  No need to print message saying
> > > > +		 * "module is not loaded" because it was printed when the first
> > > > +		 * SEAMCALL failed.  Don't bother unwinding the S-EPT hooks or
> > > > +		 * vm_size, as kvm_x86_ops have already been finalized (and are
> > > > +		 * intentionally not exported).  The S-EPT code is unreachable,
> > > > +		 * and allocating a few more bytes per VM in a should-be-rare
> > > > +		 * failure scenario is a non-issue.
> > > >  		 */
> > > >  		if (r =3D=3D -ENODEV)
> > > >  			goto success_disable_tdx;
> > > > @@ -3524,3 +3528,19 @@ int __init tdx_bringup(void)
> > > >  	enable_tdx =3D 0;
> > > >  	return 0;
> > > >  }
> > > > +
> > > > +
> > > > +void __init tdx_hardware_setup(void)
> > > > +{
> > > > +	/*
> > > > +	 * Note, if the TDX module can't be loaded, KVM TDX support will =
be
> > > > +	 * disabled but KVM will continue loading (see tdx_bringup()).
> > > > +	 */
> > >=20
> > > This comment seems a little bit weird to me.  I think what you meant =
here is the
> > > @vm_size and those S-EPT ops are not unwound while TDX cannot be brou=
ght up but
> > > KVM is still loaded.
> >=20
> > This comment is weird?  Or the one in tdx_bringup() is weird? =C2=A0
> >=20
>=20
> I definitely agree tdx_bringup() is weird :-)
>=20
> > The sole intent of _this_ comment is to clarify that KVM could still en=
d up
> > running load with TDX disabled. =C2=A0
> >=20
>=20
> But this behaviour itself doesn't mean anything,

I disagree.  The overwhelming majority of code in KVM expects that either t=
he
associated feature will be fully enabled, or KVM will abort the overall flo=
w,
e.g. refuse to load, fail vCPU/VM creation, etc.

Continuing on is very exceptional IMO, and warrants a comment.

> e.g., if we export kvm_x86_ops, we could unwind them.

Maaaybe.  I mean, yes, we could fully unwind kvm_x86_ops, but doing so woul=
d make
the overall code far more brittle.  E.g. simply updating kvm_x86_ops won't =
suffice,
as the static_calls also need to be patched, and we would have to be very c=
areful
not to touch anything in kvm_x86_ops that might have been consumed between =
here
and the call to tdx_bringup().

> So without mentioning "those are not unwound", it doesn't seem useful to =
me.
>=20
> But it does have "(see tdx_bringup())" at the end, so OK to me.  I guess =
I just
> wish it could be more verbose.

Yeah, redirecting to another comment isn't a great experience for readers, =
but I
don't want to duplicate the explanation and details because that risks crea=
ting
stale and/or contradicting comments in the future, and in general increases=
 the
maintenance cost (small though it should be in this case).
