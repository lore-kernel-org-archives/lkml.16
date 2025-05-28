Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D6D28BAA3
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445037; cv=none; b=MiOKo5mcmadiZG8WBs4z41ra504mjrc+8QgO+vvEH4Dwj47qfifUzuEtKURJ+pOAHa8C0wbjmLJdFAQ1xQQVPpk/8nNsdIgQYJU1bG+88iUNWigp4yfKhpuXc6o1vyW4YFX5v1SbBeZOIg0zblEI6Z1v69EEeZu90n5wWRXE3yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445037; c=relaxed/simple;
	bh=oRij2I0TpTX32X/NhxasXgfEJxa8A5RThaAlheT8LBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjrIB7IluL/+1gyu++iD9p9xRrUscffoZrVx4x3OJJP+C8uVoRBlvqXxu8zpJ3o5XCQ/xyDrPBglCiJYgatmOvTz7i4euq66+6ByqRuiXAYfZvGQC2tIhfYbn8H1EylVPwmr2jEGPA1iq/wC+bo0AYryr5vJgZ/6FsKosfbRtQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XSHUHdzh; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XSHUHdzh"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7dcd60c092so1440562276.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748445034; x=1749049834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkOH/F0mBjSGdYPCUEiDsSIcD6SIWcpvbL1Z7KSMawk=;
        b=XSHUHdzh4M3Tz1CxqHeZu5QTLHzRV3Z8TIcZdNftoj7tZJUy1qxF7vAtEIvnAlUmTE
         JdJ/7C3uWpNaHD7A0OgWrMpPOQSSOCNiRkVqlgam5TmRHWM4uNeLXI4FgN4H6pg9dvOc
         /YNI8k4NDPiydQqZD4S9zOl+A5gQDsBNgNtowZwexAva5z9XQKZLChtezIFfZ061EFpY
         aTQxb3ee98rHEGg85oBwRrIFAsYtUYTDRDOXQOgCJGmEmWCg3qr8Ez/LcFK8QZoqDMEJ
         rvqjRx5+n+1UF3ppt/Do5fixTZf9bDsTo9IdGYvIVYoXkmMrod0ABMGWssVFg2SXP5JO
         1yKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748445034; x=1749049834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkOH/F0mBjSGdYPCUEiDsSIcD6SIWcpvbL1Z7KSMawk=;
        b=TNjXcDHfZn0MTDCP1DFF2wmy8j8jaWTyLyRKZK2CD9hFHbYXkbQJN/X0bX4Vhw7Zgp
         80LaNa3q1O9Rb5lIzLjneMplIqIdCdcWBEPSNTcEQDly1kheJsGvm2na0R6rmk1FIWDi
         OZ3YmTb+s6B2tpxyMktRpbde54n7Fnl2/VdAWrLNuwSU2QZzWKuVwjK7edDCg/6rbmGk
         P5W8HbQocoZBh+SRH66p0QPafPku7oROFMPieBhKZtzF/4gyz6tyfkR0Ko7zAQ8BlC3N
         eAurqsKk2Xi86F36TQCXUFsi0mJKwqOzqZ2AA/POBeJOy1DAMSHFBsS7H4ul5aG/ad9T
         8dLA==
X-Forwarded-Encrypted: i=1; AJvYcCUfPWb/afBqM7UggpqJ4huyYx61vkwHQGHnbecQ6M4tSwQWZQ51yVRXtd46MMS6w6lqepqHaJT/+QLfqQo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu5D6asFVHBGqV21Ufg1zhCJzczdwgUm+dBwZY35pQEGjD/lVk
	PI/IF/FfkFIRVcfV3Z0LCFCNcvRSloHeDoKUIVp+D6ZJqG1ifSBfIAKclUeGLT9jw++b6t26sVB
	Z9KEnNUm0HbcK5yvhq5zAzksc4EDCfhNwCScxnSBH
X-Gm-Gg: ASbGncvb+yTG1NCgKjFGO/Qp6ZWWusU/3tJ+dFWBaIWnOXxcLPnCYUn72kDs3NRAcfc
	Wc76VZODs+tA8adN3FBtljnP6v6Y8s51g0AP+ivfnRX0xu8PAZUXyQXxPaHqWyd6sPwqzdrQXAB
	tqV5E3kCiWtvQ+O4fcbdWZg0xB47luDij1l1LPmNVyQq+cnraA92FNgn5/88Te1eJRP5VkkhJ/4
	5qVzuVFkzBksTv8
X-Google-Smtp-Source: AGHT+IGR99lWrX4uBQGr2kH0bGfT4JkEfaCzPmaHW/nbBCSd4QahIO99ZAocGBZAuHyfUiwPf1Ucb1uKFWWP5NDU59M=
X-Received: by 2002:a05:6902:2841:b0:e7d:6fe3:fc81 with SMTP id
 3f1490d57ef6-e7d91b459aamr21754237276.30.1748445033884; Wed, 28 May 2025
 08:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
 <20250109204929.1106563-7-jthoughton@google.com> <aBqkINKO9PUAzZeS@google.com>
In-Reply-To: <aBqkINKO9PUAzZeS@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 28 May 2025 11:09:58 -0400
X-Gm-Features: AX0GCFt9PLVfklSGC-mOnCNW0mGP_16cIQYPD6tP1ev5K3PmI8fYxDutOCJrYcQ
Message-ID: <CADrL8HXDDRC6Ey5HYWvtzQzjcM2RNX7c7ngGyjUsD3WiBF3VYA@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 8:06=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Jan 09, 2025, James Houghton wrote:
> > @@ -2073,6 +2080,23 @@ void kvm_arch_commit_memory_region(struct kvm *k=
vm,
> >                                  enum kvm_mr_change change)
> >  {
> >       bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRTY_PA=
GES;
> > +     u32 new_flags =3D new ? new->flags : 0;
> > +     u32 changed_flags =3D (new_flags) ^ (old ? old->flags : 0);
>
> This is a bit hard to read, and there's only one use of log_dirty_pages. =
 With
> zapping handled in common KVM, just do:

Thanks, Sean. Yeah what you have below looks a lot better, thanks for
applying it for me. I'll post a new version soon. One note below.

>
> @@ -2127,14 +2131,19 @@ void kvm_arch_commit_memory_region(struct kvm *kv=
m,
>                                    const struct kvm_memory_slot *new,
>                                    enum kvm_mr_change change)
>  {
> -       bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRTY_PA=
GES;
> +       u32 old_flags =3D old ? old->flags : 0;
> +       u32 new_flags =3D new ? new->flags : 0;
> +
> +       /* Nothing to do if not toggling dirty logging. */
> +       if (!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
> +               return;

This is my bug, not yours, but I think this condition must also check
that `change =3D=3D KVM_MR_FLAGS_ONLY` for it to be correct. This, for
example, will break the case where we are deleting a memslot that
still has KVM_MEM_LOG_DIRTY_PAGES enabled. Will fix in the next
version.

>
>         /*
>          * At this point memslot has been committed and there is an
>          * allocated dirty_bitmap[], dirty pages will be tracked while th=
e
>          * memory slot is write protected.
>          */
> -       if (log_dirty_pages) {
> +       if (new_flags & KVM_MEM_LOG_DIRTY_PAGES) {
>
>                 if (change =3D=3D KVM_MR_DELETE)
>                         return;
