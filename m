Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432931D86C6
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738872367; cv=none; b=UG2SK0Au945N0FiGfuTZ8bPIRk1rvqpMisW/xcYFgYImQ2CehpHD1n3DFFsCsctyYzSu2+JoNPI5Yq7vHgZ4qZva65/2bAUCdXIwaRrlhBPWqZc0DwjT5xvUr9jvDhLqh4a2he16lqJ+Wh7Z3GnPAkDUobzoF8kdXpq4ESwMFI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738872367; c=relaxed/simple;
	bh=84vy0v18hsCpTXEqIcc+uJNyLnMGsvVSFK6tssMtOvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATdJ4/sj8fFAffeePAn6aEH/jjyag9+MmhmBF47k6QsHFz+eVRGkJWrP/ik3ywT+R/NtellAu6MYH+zm3l6KwDZyLXQt6CYa/qtD9GAxcl6HD4gYyMoNX0pxhOVUdSReNJ6P38Iyk4lOvhhDnt1Un+KoYrhkZhgBYNzwTVMkPlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n0+Ton2/; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n0+Ton2/"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21634338cfdso31899025ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 12:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738872365; x=1739477165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/u4VUWV7IwpnqrQYxCHgvEGqjARZvdCCoy9rQ5kXa0=;
        b=n0+Ton2/W8MdPPuUYDeFH5hXrPdhHXl3Ba52h63XG/pbcA47BDnMbFUujlHq7Md1fF
         +t0vsdC9jzPx0fwUwNwAoLvZ1xeUaSjbR/qjPy1vYS6Yy6H+hHutiazWYRD6PnSIHvjz
         watrqmiMwzJ4egZfcFNfvUom0CU52fcDWjZ7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738872365; x=1739477165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/u4VUWV7IwpnqrQYxCHgvEGqjARZvdCCoy9rQ5kXa0=;
        b=TA66ydARx837i55OmxsYC+QAf/H0F8ll5+oEmnjE3qXEv84vnwAbelI73nfpQstMYb
         LuZrm4sC/MFwS+BrDFCBBgAkFAMWXvVxomX+gWg0sgewrq3YPXwyaOUPK4Q8w6B3D+aw
         nqSej+9/77t1abSTgVI44jgmgT7ej0pp3RsarJRPwYeD/T5JeAkUTy/vusjP7IZYMtZ5
         vUrCBnbQysb36v6zSHyTNiOE+DwVSqOcpFdafO7SkM4RCo+2Z+2h249tqol79FN/IhfL
         djG5wTB95WEdbIwxPDM4t9xXrlv9uqBowYKmK6ZUNNONaveh1OozV/vnQ9Nxy2XaA/BT
         b3WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtdvDI5Un//cCn62jkAe23xOM/4cXBfaRjc4Twl4ysU3T3Q/LkEz+s3R3HkiOojA/sZPbmKy0CWr3p+uU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxOgKGuUMHw1ZDu9Pwzkr7o+/fSCvWVMwkVP5QVap88uADRN70
	MiuXJpwO+QLLOsiKxiyYokKvigG2pl1sJRrIgg2phiS9bFEfWhmcEpfoSgZkwA==
X-Gm-Gg: ASbGncvadnAADC/v8QN54AV/N7/7ISknkLkXgzYFPY0OCKsrKFfFIkgDYTpVfzpS5V0
	8mO2zUSJ4OKucmpr/DbdwIbHtN7OGdqP1jjCGkA8aQyWAnqSH9veaTzXd+PgFaSSB7r6fF/0/JH
	rgk5lhPHiUv+u3cyrIGQAxH2q0ky5kQrzSJI5o4muS1i+oi8TfFAzOE2oxhebZHAUJbOtNA2Pv2
	V6LzHziMw1rMPRlyY6e9zn/4Ruai+RWN34E9rnG2sm5hDJhZTZa4a/S5uMy1FEj10A72yUdqxQh
	v8DjOMXyOh0r/sybiCHzXnRnsVIFAspru6hiNmbfHXb2NbdrAvU=
X-Google-Smtp-Source: AGHT+IHDs5Jb7xvrwadyJkSiEZ5Vz7JPHeYqsMXZFvAZu+zEsXp9YOcnzrTDl8UmMqxxrzlzgJgtmw==
X-Received: by 2002:a05:6a20:d49a:b0:1e1:a0b6:9872 with SMTP id adf61e73a8af0-1ee03a45e2dmr1219140637.11.1738872365500;
        Thu, 06 Feb 2025 12:06:05 -0800 (PST)
Received: from localhost ([2a00:79e0:2e14:7:21:1cae:b81c:a516])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-ad51af667f1sm1510961a12.54.2025.02.06.12.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 12:06:05 -0800 (PST)
Date: Thu, 6 Feb 2025 12:06:03 -0800
From: Brian Norris <briannorris@chromium.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dwc: Use level-triggered handler for MSI IRQs
Message-ID: <Z6UWK6EvOLRrtRDH@google.com>
References: <20250205151635.v2.1.Id60295bee6aacf44aa3664e702012cb4710529c3@changeid>
 <87ed0btpfj.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ed0btpfj.wl-maz@kernel.org>

Hi Marc,

First off, thanks for reviewing. I'm a bit unsure about some of this
area, which is one reason I sent this patch. Maybe it could have been
"RFC".

(See also v1: https://lore.kernel.org/all/Z3ho7eJMWvAy3HHC@google.com/

I'm dealing with HW bugs that cause me to have to configure the output
signal -- msi_ctrl_int -- as EDGE-triggered on my GIC. This is adjacent
to that problem, but doesn't really solve it.)

On Thu, Feb 06, 2025 at 09:04:00AM +0000, Marc Zyngier wrote:
> On Wed, 05 Feb 2025 23:16:36 +0000,
> Brian Norris <briannorris@chromium.org> wrote:
> > 
> > From: Brian Norris <briannorris@google.com>
> > 
> > Per Synopsis's documentation [1], the msi_ctrl_int signal is
> > level-triggered, not edge-triggered.
> > 
> > The use of handle_edge_trigger() was chosen in commit 7c5925afbc58
> > ("PCI: dwc: Move MSI IRQs allocation to IRQ domains hierarchical API"),
> > which actually dropped preexisting use of handle_level_trigger().
> > Looking at the patch history, this change was only made by request:
> > 
> >   Subject: Re: [PATCH v6 1/9] PCI: dwc: Add IRQ chained API support
> >   https://lore.kernel.org/all/04d3d5b6-9199-218d-476f-c77d04b8d2e7@arm.com/
> > 
> >   "Are you sure about this "handle_level_irq"? MSIs are definitely edge
> >    triggered, not level."
> > 
> > However, while the underlying MSI protocol is edge-triggered in a sense,
> > the DesignWare IP is actually level-triggered.
> 
> You are confusing two things:
> 
> - MSIs are edge triggered. No ifs, no buts. That's because you can't
>   "unwrite" something. Even the so-called level-triggered MSIs are
>   build on a pair of edges (one up, one down).
> 
> - The DisgustWare IP multiplexes MSIs onto a single interrupt, and
>   *latches* them, presenting a level sensitive signal *for the
>   latch*. Not for the MSIs themselves.

Indeed, I probably was a little confused, and distracted by my
aforementioned HW bug, which can be at least partially mitigated by
masking (which this patch does). I also didn't understand the original
choices in various DW-based PCIe drivers, since their choice of
handle_level_irq vs handle_edge_irq seemed a bit arbitrary.

...

> It also breaks the semantics of
> interrupt being made pending while we were handling them (retrigger
> being one).

What do you mean here? Are you referring to SW state (a la
IRQS_PENDING), or HW state? For HW state, MSIs are accumulated in the
STATUS register even when we're masked, so they'll "retrigger" when
we're done handling. But I'm less clear about some of the IRQ framework
semantics here.

All in all, I'm OK with dropping this patch, but I'd like to understand
a little more of what you think breaks here.

Thanks again,
Brian
