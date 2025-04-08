Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580AA191F79
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744132418; cv=none; b=OjWSv9VPzAEauJYWYa1h0Scv+4gbP18Ey4faAmoIayn0j0k72f1b1064F9KfYoPTFExjAtskeiChEMu5OB4YYLQnA56KDnbkRfPyTRLbVvU/dHp26U4PKp+Bi2x5xmyHOEaYoPRnh7+g+Gb0TUI7hDgUFMKlRziFHFOHWAdlfHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744132418; c=relaxed/simple;
	bh=nnw9eJ8KOGN5QlUkiDoYliONcmf9ltltrlpJBMq/rPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFftBj9oNV+h8zpMicoZJGHiKK4ptQjz6LcIOWSaHjcyAw+sHzErCyce0kKVD/Aj0dwbxnYyobchnQEsE+Ik6xAKIGQnugjCPKN2iQJx5IRpqhg4d7+Np8v1L1t0/qozQx1DcwpQGGBYp/INvoB+8pigLSK05PzzCRdFElscBUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kI/HtAgw; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kI/HtAgw"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54af20849bbso3393404e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744132414; x=1744737214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=st5xjw/A21tQtkt6th/OJeKKznmds9c4r1pftIhJsuU=;
        b=kI/HtAgwIOsnmQnLkr//6XQbruueUKe4xMIixkgkwSRgiFXgDQ63tb1W6NUmV9pvVa
         Q42g66MCuhlxaM3ORiJTlx49xQz4+kC3btZ3CPLJiSVd+bfChpwKL2kXlPuZvDbR4ODR
         h4E8uIbcW1tvKhysLknPq3XcDmB6sTScn3Eokc0fEoKIfTv/o504GWLLnz9PlPYjaVqY
         xNZPB06LYp2IoNCFSYcl/QdpTKZ4Go67xMwkLytO12IMeBYsS4fwx0B1Wn0yXNE9pJ9Q
         na4Zs5Qd/heScTm+tSSDhqDsTLLmyyHHvKqrZYhtAGMub4/roLJ4lwaNcjmMyXc92y0D
         ZNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744132414; x=1744737214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=st5xjw/A21tQtkt6th/OJeKKznmds9c4r1pftIhJsuU=;
        b=LP4Iy/j5HGeHMKdDk57QuDKaXUAMzOicTwbjxbcE0+8gOGjIWnQpawcVMqejemzRjU
         GEl2emjdz5UjFW/x2UU3+y2nJlEXPzoG0mAyiXEzQZ/ExDW1vdBFMiGNxBdrBfunZstO
         Hqbe1ef9DFQH3eq9BweiMIT0l5lnurEpl7uVzbtyCXm3yzs9Jn+5KubtEppihSKJlYCv
         pDBI7xnI/8pBncWQgIHQy9K7y5O/Rel4VHMUj/unTj0dbzcn3j6B/NDYbO1GHifstE4g
         GAWJm+GzQsjkmNBZvLFmm9qnW7M5CMsyb3+87PlanFyzSL5XnC4y9AXCzd5DwvXr0V6v
         foEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNtSZryCsDfnrKB7PxPcf2lqCHgEDswh+TzZyT1aGsMbNy6GDgPvVK/DSKumfxLtOy+UhPOU8YPo4SYsI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/lG7WFg5bEvlCDJSbcEGljDWJtefggLxnicvx7yzcbdbJkLp6
	/mRr/mEQNVL7GsaY5qTEO9HNJN/HHHQEuFuMj3IyyaPa5oaJsgiIdivrQj2RpAfsLAhTacgXL+S
	0gwe1qj+X335YXaZi/9FnkVdI8tS5odWbAsNj
X-Gm-Gg: ASbGncthSrmlzE+QbY+dMc2Kx/ivdQjtoM0j4+BeNDf7hOVDLmUKFfps30ubVy21gJS
	csSiXYHu9osmcMexFctrgJrpFyjovstavpqaHc/iqCfusutxV77ulcFMs4/6MfYiJmfrPHMPXGM
	GmO+vay5C8KKqBVkAortw5yYVfVA==
X-Google-Smtp-Source: AGHT+IEojOGt6jWAwX5Gcm/P2e+H5jOlOGkH6KU9klaguOraWZfMNwVU/6kY9rYk7qohNkpmZ9j0DjdTIdgt0Ju7HmA=
X-Received: by 2002:a05:6512:118b:b0:549:8f01:6a71 with SMTP id
 2adb3069b0e04-54c22808c0amr4933383e87.51.1744132413969; Tue, 08 Apr 2025
 10:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 8 Apr 2025 10:13:05 -0700
X-Gm-Features: ATxdqUHtXVL6zBbBDHxkUQLM1RAtccgSreGFrNU_ZXaEoEaE0jP24eQuxtxkag8
Message-ID: <CALzav=dMSLy7kt6sJtRqAK8tOZwFz9Ktp3vzqggdD+J_aPVycg@mail.gmail.com>
Subject: Re: [PATCH 00/67] KVM: iommu: Overhaul device posted IRQs support
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 12:39=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> This series is well tested except for one notable gap: I was not able to
> fully test the AMD IOMMU changes.  Long story short, getting upstream
> kernels into our full test environments is practically infeasible.  And
> exposing a device or VF on systems that are available to developers is a
> bit of a mess.
>
> The device the selftest (see the last patch) uses is an internel test VF
> that's hosted on a smart NIC using non-production (test-only) firmware.
> Unfortunately, only some of our developer systems have the right NIC, and
> for unknown reasons I couldn't get the test firmware to install cleanly o=
n
> Rome systems.  I was able to get it functional on Milan (and Intel CPUs),
> but APIC virtualization is disabled on Milan.  Thanks to KVM's force_avic
> I could test the KVM flows, but the IOMMU was having none of my attempts
> to force enable APIC virtualization against its will.

(Sean already knows this but just sharing for the broader visibility.)

I am working on a VFIO selftests framework and helper library that we
can link into the KVM selftests to make this kind of testing much
easier. It will support a driver framework so we can support testing
against different devices in a common way. Developers/companies can
carry their own out-of-tree drivers for non-standard/custom test
devices, e.g. the "Mercury device" used in this series.

I will send an RFC in the coming weeks. If/when my proposal is merged,
then I think we'll have a clean way to get the vfio_irq_test merged
upstream as well.
