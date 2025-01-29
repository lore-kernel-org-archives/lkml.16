Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08EF1E2842
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 18:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175773; cv=none; b=aK/pRBHFwQUJbpXnS7ly/uIv1mRqd92rtILp8U/e6xd2Hrs4+bdsCFcmcwU+rInhs2uD8xZgJlop4lsGIwa6iEWhJkYf9lL8wmYpqb1Lh2cq3AOf5SS1d8RDUiAZZvOIvj2VuhMdaQ7OyXgrNETZT5WqQo2FYDCg2B+tahEvMw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175773; c=relaxed/simple;
	bh=Xq6f1VgmDWn5aSkDLSE4hseUnIhrvhpSc0MgefCHqTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJG7xxUACkGs+UXKfVf/yoBoOW+K96Z+oSyHzo+hnQ0trxGiBUDpBlZZYPCkp5HF+uqvDdQXdyTMMpRnWilah9GcAcvgFSzDBQMNyWdD7f/hQPo2aXDWVgSj1W632G/4tFz9uK2NxatWKM9PIlU3gRkFQRZod9zP+IxVV22/ozU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eytTVggR; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eytTVggR"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401af8544bso449e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 10:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738175770; x=1738780570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqjEzI3JyTEx3ZTozRjpbk7/EoIe+bijn7jTt9DwQA0=;
        b=eytTVggRgf6PnfLfyj8VcdIP00T6MIJYYGIRPDOp0FLHwpk/K2ydtS9W8l+uKqxBfv
         CyRDrqJJItfrKLGdVShlo9cggaDJBhfBxY6QdlXt1m+ntS1PYbpUOUejud4JLe7gyNHb
         byuHWD62N4/NoADh4xw36GVfVSuQCqUxn9DfnzVWF6AX5DJZzeAzmkz/JmCbNCal3R/3
         1f6JspurlmH6jBAW5hVBoUt5oAk7aMBlYBsqGrzBIJOvLMY7BNyBDWDfMtByTdYT5Uxh
         uLnG1fW1HrVY7Dvdr5nRCIjm3YnRJ/Jh6iCTdpLvdy8mznZMfG7TgxAvteD6hKSezeco
         yFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738175770; x=1738780570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqjEzI3JyTEx3ZTozRjpbk7/EoIe+bijn7jTt9DwQA0=;
        b=ZEadB9e/9JLe9gk2nINhVPlytJ2TJLMDJ5cFGifOA+C/OXUaZDvmncgMo0oc4BM3JI
         t5W2Pm7NE8x1O0XibUCDZ7E2/h5vHJRsp0LPxZKW4Q3g3bJ3TxJClVgQ6/XNP5YsIR+U
         9HCgepUqRum85xT1gVUERyrjWeaVLbgd0E9R0yuZMv7hy2p1EP4tiKqXt1sWVwgxHV6e
         cNcJz/CCv3/Lis7M0jHJMw/G2Y4i3UdL1ABkOleMG+Lq9zO7udHf7q4RIrJRLlUEhosv
         XJs6PmPusi+VpUwy+v53fSRPVYTf9kE1FgAHUs/63U+XW4IUr/V8NvPjIqJz0P5DWZq6
         T6/A==
X-Forwarded-Encrypted: i=1; AJvYcCUkCnaJ6zhifoyyO2znEis13UKxwjaMqrVxjDN1XsOl4lWcfj6KkeOxpGDC3fXE/crn8ddW56fa+WwFUWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YymWt5gjSVyyS18zT4PR6GhC2YaXVgDGQxXS7/ddytOW1bvM+2h
	N2WUEQhaxnmFVxkoYmLoKm84nS5//zXA4BBDqT+ytRk61LdjTUtNgTBn6HUXRUfAfz40QRAgIFF
	HvLOgeE3C0I5hZqYYGSCCPUyWj/5LUDzE1rW+
X-Gm-Gg: ASbGncty/9W21rlXTTMA2+RqAi+Z0u12Wsv2AgdkkELXbgjEamnxqOnXJ7cis0uaj7y
	ve72/XBQumWMzuRGhj3mbeDqwMKf2gTV2bLMuesdFGSlnmM6MDJ+b0fEFK9aVHM1UmPqKhSjU4Z
	eFuDQy1J0JqlCexOeJMeg+gSw=
X-Google-Smtp-Source: AGHT+IEaxVpoTZz2vvLQoRHYpSSYaUmVzpFsNeonjDND8BXCSX4yjfHvPD46R6vIr1m7DgQtokCSJk9fW7h8ivJaTEw=
X-Received: by 2002:ac2:4356:0:b0:542:9910:b298 with SMTP id
 2adb3069b0e04-543e5476f8dmr200608e87.7.1738175769784; Wed, 29 Jan 2025
 10:36:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128213652.1880545-1-vannapurve@google.com>
 <4e07bbe6-9f74-45e5-b8d4-f992d2be78fc@intel.com> <CAGtprH_1hc35um_47n=TMJzXAvpa7LY6kyXUafjJt3sPCosC_w@mail.gmail.com>
 <Z5l6L3Hen9_Y3SGC@google.com> <slfw63tenzxur6fvfjf6ni3lp2exqcpzodgetx6p5eqchw66y3@oqjvn6ezgmod>
 <Z5o0fZouJV2Fqe7b@google.com>
In-Reply-To: <Z5o0fZouJV2Fqe7b@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 29 Jan 2025 10:35:57 -0800
X-Gm-Features: AWEUYZm4D6rQCg2uG7L_LEbrzQWMBzZEnqI5W6C9QIwDr33R9NwZbD9nAQOwu0U
Message-ID: <CAGtprH-z8bgHQoLiTjnVNK7AK9p0CioFHRRdCKOW5g6j7fO=4g@mail.gmail.com>
Subject: Re: [PATCH 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt
To: Sean Christopherson <seanjc@google.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, Dave Hansen <dave.hansen@intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 6:00=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> ...
> >
> > I've asked (some time ago) TDX module folks to provide interruptibility
> > state as part of the guest so we can handle STI shadow properly, not as=
 a
> > hack around HLT.
> >
> > The immediate problem can be addressed by fixing the BIOS to not advert=
ise
> > C-states (if I read the situation right).
>
> No, something like Vishal proposed is a better fix.  It's still desirable=
 for the
> vCPU to call out to the hypervisor when going idle, otherwise a vCPU that=
 is idle
> for an extended duration will never let the pCPU go idle.

I think Kirill's suggestion will ensure that cpuidle_idle_call() will
invoke default_idle_call() [1] which is correctly patched to call
tdx_safe_halt(), instead of using cpuidle driver subsystem. I am yet
to vet the ACPI cstate configuration for TDX VMs, but unless there is
something critically wrong with exposing cstates to the VM I think
it's better to handle acpi_safe_halt for TDX VMs.

Until there is a better solution to emulate the "sti; hlt;" behavior
for TDX VMs, it's important to deploy warnings as these scenarios are
easy to miss and hard to debug otherwise.

[1] https://elixir.bootlin.com/linux/v6.13/source//kernel/sched/idle.c#L182
