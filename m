Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFB21E8320
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 23:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748044372; cv=none; b=Unstj3viMH7aRzKc0Add18fGLhOGvDgV/TjJCo1Dz1lw0CC3DUNPXS7VsExzrdjU1FUysz1lRQFJ4THeHKWEGG+I+jCmdkYgs31oFIT/6tFWqi89uxbY+D1vzjnz4lkjLpHYODyHoMCys1oaJw3kzbCA36mdvrnOEtnWdb9GkbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748044372; c=relaxed/simple;
	bh=M9hXUG12dQEzCbLn0FttmzohKmhmYluNMb8mwDu8KaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dvMCEn2PcLYCtmw6lNsbtu46NGVbJJDteYjZihS1BXjIO0CjudWAuU0PkhMOj+1//atp6JhS3KdRczyRTqerbI36hnxtZ5X/Nqtd1fMase0GzgMakNTXQ6v/+UqwW+j1TD1rMDfO9tY0ZV77OrzwLSuNpXsuja+OMcctbkrXKnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DgYjQqdb; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DgYjQqdb"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-329157c9f79so1589601fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748044368; x=1748649168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0Fs7pz/z0EIB4gIzQ5oUac1XgvPmbJA7QXLi0jslE0=;
        b=DgYjQqdb59Hi2azpuFqbKyuLgbbc48aVe5/am3tWG3zkKXHvj7ht4qcZyozvZahoeV
         pdHeXHX3vUE9zU1EA4KbXwXq6TgHJP43HXuXOUMq/N8pJAWpMA12zTxzpoTovSdUYsZ/
         BCSLnqKN7YqtW7kg02ApyT68BEeT0wcGmAQZqqJ91UmBec1rzXRZHmPNzyTlQjY4sysw
         xdO7aA7sR4dtpEh5U5xJFK6hWCinuehG8Ff7mXflDJh5MSjwsD9nLIXo532VWlBC7njt
         5eisrpTVzqXH89NSLCoJGR1N9PHoChMFmeoMAqR1FKCP1IuwMBbmN8kTqBW9BZdz4HLB
         pzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748044368; x=1748649168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0Fs7pz/z0EIB4gIzQ5oUac1XgvPmbJA7QXLi0jslE0=;
        b=rBrvm/43Db7KvcKDn/hSmeqC5h1sx3GYOrlGkQ/M+CZSnMMPFtROOmgwRwBtpXDu50
         0DosmLotEHUlE4OQfDxGuSBIxfZMAZ2LhmJJlu31Z+rvTzzFnaoNl2+mzDf6soBhqV/d
         jAETFm41qBLeBEsrJMllCtXxVTfF8Fz3LDdWirmkRN7pgFBLRtGJ8GKHYPz5mt5eR4Od
         9zKSlkVAFPIvNJGuuuIgXdgldY+6CKZE0T4nwTzNprPHWVTT1LJKnS1Qk/5Ug5/MUL2v
         35h7ymG7bE33dggbJR+A7i39zIaqrebkvC+F63vieRFLoZTmjchFS0rcInFKaPsmoqz6
         xNXg==
X-Forwarded-Encrypted: i=1; AJvYcCUxkzX7bfyTI0ZfJsx/HxQP0RH9sKwvnii8e+i/lytfUqkRBKe7LP69GLxLxmov+i55wZYPF858s0tbZvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmpvAh7Xj9sItekWizZfJ1iedCTh5+rD9V7YK+ZU8VK99NGZR2
	NMfsfhAe0MvqNqtwDcKcOh8OIOCwNYDEXPazrJ5lANLIlzPN3+VLIbYjKrI1Tax0VKjFKU3LYQ8
	1gu1AjMnZ4K+CwTTM4RSSyyE5bw/Q0eLyT8y7YSR8
X-Gm-Gg: ASbGncuJHqVUPY1dJXUMH3w+RYdnLMKvnn15bLTEH9bLg1qEWrEDzO6YNPKuvRC9iV1
	+vU+15qwc6DhDF3nub6cVabfo1ltWvBdivy5z0zwDZoxCnwybFm8FQsI3Wii9DeKodo1h6P6B94
	EqVo0ELPzFuOdUfdPuxAxLAq2DV7CXmF1M46RwHE3Dxyo=
X-Google-Smtp-Source: AGHT+IH8NaXciis2Ap4OiAGLGhnQ9Gb49M8mILiHND/efN8rg1+lP6OwzfG1AqHxHePd1mY4UTi2wwWCDeKWqQoTLAs=
X-Received: by 2002:a05:651c:2109:b0:30c:1358:6400 with SMTP id
 38308e7fff4ca-3295b9aaa59mr2604071fa.5.1748044368078; Fri, 23 May 2025
 16:52:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com> <CALzav=dMSLy7kt6sJtRqAK8tOZwFz9Ktp3vzqggdD+J_aPVycg@mail.gmail.com>
In-Reply-To: <CALzav=dMSLy7kt6sJtRqAK8tOZwFz9Ktp3vzqggdD+J_aPVycg@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 23 May 2025 16:52:20 -0700
X-Gm-Features: AX0GCFuV-LnW4e9goCqhdbKeeGQfbApHZTPlR-dVtjKEnQHhsOcPMKn8qNDcilc
Message-ID: <CALzav=d22zi4zzebPJthKGF-uiD3qRTeTJM3Q-LB6UVBiwaAvg@mail.gmail.com>
Subject: Re: [PATCH 00/67] KVM: iommu: Overhaul device posted IRQs support
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 10:13=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Fri, Apr 4, 2025 at 12:39=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > This series is well tested except for one notable gap: I was not able t=
o
> > fully test the AMD IOMMU changes.  Long story short, getting upstream
> > kernels into our full test environments is practically infeasible.  And
> > exposing a device or VF on systems that are available to developers is =
a
> > bit of a mess.
> >
> > The device the selftest (see the last patch) uses is an internel test V=
F
> > that's hosted on a smart NIC using non-production (test-only) firmware.
> > Unfortunately, only some of our developer systems have the right NIC, a=
nd
> > for unknown reasons I couldn't get the test firmware to install cleanly=
 on
> > Rome systems.  I was able to get it functional on Milan (and Intel CPUs=
),
> > but APIC virtualization is disabled on Milan.  Thanks to KVM's force_av=
ic
> > I could test the KVM flows, but the IOMMU was having none of my attempt=
s
> > to force enable APIC virtualization against its will.
>
> (Sean already knows this but just sharing for the broader visibility.)
>
> I am working on a VFIO selftests framework and helper library that we
> can link into the KVM selftests to make this kind of testing much
> easier. It will support a driver framework so we can support testing
> against different devices in a common way. Developers/companies can
> carry their own out-of-tree drivers for non-standard/custom test
> devices, e.g. the "Mercury device" used in this series.
>
> I will send an RFC in the coming weeks. If/when my proposal is merged,
> then I think we'll have a clean way to get the vfio_irq_test merged
> upstream as well.

This RFC can be found here:
https://lore.kernel.org/kvm/20250523233018.1702151-1-dmatlack@google.com/
