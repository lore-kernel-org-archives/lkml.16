Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D439928C5DE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748447328; cv=none; b=sckbknedZKhyfaKvwldXAdNQ/YqtDgNRCtoMLmzyHCtNVTaUWpAlWlLx1nY5UrW7GEv7RtKj1ECQCdGxOZK0w+PvsZ1WX0Goc5WZHZs0E1JxaI8NvY8EIe2yOVBy9zELAXhz6MyX1XsjzMAGo18c4BiXjXCHSXiYNAEXsiPfQY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748447328; c=relaxed/simple;
	bh=WIlV51wEuAd2rtYOVeO8B1eFmuqdgn/T2swun7fdn7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3WazzE2vUSH3mmYJEet8AbM1bbYdv9Zc2qPNThHg/P8gSOQGYack2YteKjOZ0Mt/MAs7po+SER4lfiWHTjeMQkQq/T9iy4neHxXwbwBo5ukXaasmrHKcfMQ34xuAs6YuFW6z3mrvae8u8mmlixgMCsoLsh0gWWauURIBqgfuhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hXy6SQQu; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hXy6SQQu"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70e3ac940ecso72027b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748447326; x=1749052126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJhBrTcV/2KTHPEGx8A5eIEZm9bF8mIMQSTTxnrKh3w=;
        b=hXy6SQQumd1hR4Cxd/fcVSFX4ZnarGLP7uHEpYqyvSPteonbXsnrjc1+pLD20UYR3b
         sw/lDk8cdH9JOfHmPMLmLPnXi31u+TJK1cKirGWbG96no6Aj5EgHVpDXju1ep5UM3rkW
         ESX6oZBgV4Ai1C4apsx0LG7qiHUqG0MfFMWKusoYVjza7tpgkYTv2jNuoDE0QUP28TsX
         PEqg/ym3/+fbH0RH+ljlim3nenW6LOpGtwekBKBuvZguluUojAdzEJ0vKtBIAMdZwobV
         lpvv13JqRCd78j3rz9R4BbsFraLladzbT8QMqMIezqFs3OT9NWpfwTZRfKrmsDkLjBlS
         53kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748447326; x=1749052126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJhBrTcV/2KTHPEGx8A5eIEZm9bF8mIMQSTTxnrKh3w=;
        b=bwTIq+19dvZLzSri+/ThQTl2qCim/72PtfAC4TkZ8arXOmlyxC0fs9Fux6eh+O+br8
         9w9533SYpWobH6QT+RrIW24AofWgikDeIx1tmOKXOIBKOAi2W+scqdTFhbCE43mzLBy4
         Qfxa3jkLBK9OqCObl5XNPa7uA3mSVuykhLesOGwIleVIUFAtG0F3VZ3t9vXjnQgowhEb
         TqwaC5PhfyGgvz0cjB3tbpRNJ0Ft6vg+jKsHv73Fu7LmAYdpsCRK78i7eoC5SrBzYI2W
         7huJfR/c59fr66FwpdA+q0DjwkpeuE6giQ84wE2bbkjPzrSVmjOk5pngk0XSWyU+YHmy
         Ya9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4buNunx5UjSCtJVokW435Km4rHuh2fBCRll0/GtYefJ2EndBsABodk6up0/1mk0k2LeFQj+jUQWvhjyU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5UIa4zWTC3TsA+FSp9g8UD/hGlyjjNcEY9HBI6BYmyE20SBm7
	uFxdYIAejVxtR6SqnhwBSOcCWxaZSLjnm9msX3PQdPDYKk9w/wC71rH8EBd+bZCD4hzteTNNUnU
	R1LjRWQi39TrNbzzetwKItcxq+/lPz9isGpSojTFs
X-Gm-Gg: ASbGncs8QPq7DFhcnrBZJLvSkonEdxnUpstOnP8IOvLnKohPS+H9lFHIsfvngsqiHJ0
	ii8kqiS3siBxs/vEjX4bdP/fu9td0xDgbMLWaU081umiWRiJGZ4V7G+CdLDhjxBXjNuoORVJZMt
	QtCaJHLImyvoxeu6RhskV+G5wtLL7En2M6eS6VSaPCvFHUIcFAXQRye8OBJWogYzPKNkCrqew8E
	nW/dg==
X-Google-Smtp-Source: AGHT+IELfFCth5Pbkc2q+fs3hGfuRfgdVh0Gdule7jkxxm4LWUKEs85HrAmHhTzH2guxXlvKX1XFjzs03oe3LxVeaz0=
X-Received: by 2002:a05:690c:c02:b0:6fb:9280:5bf4 with SMTP id
 00721157ae682-70e2da69ba1mr219329397b3.30.1748447325426; Wed, 28 May 2025
 08:48:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com> <aBqlkz1bqhu-9toV@google.com>
In-Reply-To: <aBqlkz1bqhu-9toV@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 28 May 2025 11:48:09 -0400
X-Gm-Features: AX0GCFuLPsZ5TxH5z7efpKpwgvPpjgQZqJBp0wjKrKAAM8LNrge9ZlG7omP9Ut0
Message-ID: <CADrL8HXjLjVyFiFee9Q58TQ9zBfXiO+VG=25Rw4UD+fbDmxQFg@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] KVM: Introduce KVM Userfault
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 8:13=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Jan 09, 2025, James Houghton wrote:
> >   KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
> >   KVM: Add KVM_MEMORY_EXIT_FLAG_USERFAULT
> >   KVM: Allow late setting of KVM_MEM_USERFAULT on guest_memfd memslot
> >   KVM: Advertise KVM_CAP_USERFAULT in KVM_CHECK_EXTENSION
> >   KVM: x86/mmu: Add support for KVM_MEM_USERFAULT
> >   KVM: arm64: Add support for KVM_MEM_USERFAULT
> >   KVM: selftests: Fix vm_mem_region_set_flags docstring
> >   KVM: selftests: Fix prefault_mem logic
> >   KVM: selftests: Add va_start/end into uffd_desc
> >   KVM: selftests: Add KVM Userfault mode to demand_paging_test
> >   KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
> >   KVM: selftests: Add KVM_MEM_USERFAULT + guest_memfd toggle tests
> >   KVM: Documentation: Add KVM_CAP_USERFAULT and KVM_MEM_USERFAULT
> >     details
> >
> >  Documentation/virt/kvm/api.rst                |  33 +++-
> >  arch/arm64/kvm/Kconfig                        |   1 +
> >  arch/arm64/kvm/mmu.c                          |  26 +++-
> >  arch/x86/kvm/Kconfig                          |   1 +
> >  arch/x86/kvm/mmu/mmu.c                        |  27 +++-
> >  arch/x86/kvm/mmu/mmu_internal.h               |  20 ++-
> >  arch/x86/kvm/x86.c                            |  36 +++--
> >  include/linux/kvm_host.h                      |  19 ++-
> >  include/uapi/linux/kvm.h                      |   6 +-
> >  .../selftests/kvm/demand_paging_test.c        | 145 ++++++++++++++++--
> >  .../testing/selftests/kvm/include/kvm_util.h  |   5 +
> >  .../selftests/kvm/include/userfaultfd_util.h  |   2 +
> >  tools/testing/selftests/kvm/lib/kvm_util.c    |  42 ++++-
> >  .../selftests/kvm/lib/userfaultfd_util.c      |   2 +
> >  .../selftests/kvm/set_memory_region_test.c    |  33 ++++
> >  virt/kvm/Kconfig                              |   3 +
> >  virt/kvm/kvm_main.c                           |  54 ++++++-
> >  17 files changed, 419 insertions(+), 36 deletions(-)
>
> I didn't look at the selftests changes, but nothing in this series scares=
 me.  We
> bikeshedded most of this death this in the "exit on missing" series, so f=
or me at
> least, the only real question is whether or not we want to add the uAPI. =
 AFAIK,
> this is best proposal for post-copy guest_memfd support (and not just bec=
ause it's
> the only proposal :-D).

The only thing that I want to call out again is that this UAPI works
great for when we are going from userfault --> !userfault. That is, it
works well for postcopy (both for guest_memfd and for standard
memslots where userfaultfd scalability is a concern).

But there is another use case worth bringing up: unmapping pages that
the VMM is emulating as poisoned.

Normally this can be handled by mm (e.g. with UFFDIO_POISON), but for
4K poison within a HugeTLB-backed memslot (if the HugeTLB page remains
mapped in userspace), KVM Userfault is the only option (if we don't
want to punch holes in memslots). This leaves us with three problems:

1. If using KVM Userfault to emulate poison, we are stuck with small
pages in stage 2 for the entire memslot.
2. We must unmap everything when toggling on KVM Userfault just to
unmap a single page.
3. If KVM Userfault is already enabled, we have no choice but to
toggle KVM Userfault off and on again to unmap the newly poisoned
pages (i.e., there is no ioctl to scan the bitmap and unmap
newly-userfault pages).

All of these are non-issues if we emulate poison by removing memslots,
and I think that's possible. But if that proves too slow, we'd need to
be a little bit more clever with hugepage recovery and with unmapping
newly-userfault pages, both of which I think can be solved by adding
some kind of bitmap re-scan ioctl. We can do that later if the need
arises.

> So... yes?

Thanks Sean!

> Attached are a variation on the series using the common "struct kvm_page_=
fault"
> idea.  The documentation change could be squashed with the final enableme=
nt patch.
>
> Compile tested only.  I would not be the least bit surprised if I complet=
ely
> butchered something.

Looks good! The new selftests work just fine.
