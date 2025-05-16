Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF9A157E6B;
	Fri, 16 May 2025 03:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747366906; cv=none; b=J2geOovr+6XVxDlLJF0O9fqIVmhKWe7HKQwO7lub1TK/uK3ujD1MfRhzs8QKi/CvZaf6AgLofjmwRXJw507Nw6wxIjxA+OIJz4iMOt18qfJyohzBV9+ab+ztZQXTDJZAz9s+EE6AaDygZnQpIZsbwepCn/tbib71peQUqlQvlZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747366906; c=relaxed/simple;
	bh=WyVN/f3JMKOQ48HmDKOEVVs++v/H2ZPMhA4CZ9WQfqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuWWiii6UiZ7rkG1EHCpLfFqCCZDuuUZNwh+Sne64EGst/Og52WJaAWuZn0ZH0igmYiLBc6Lf+TJol+VL6G9j6+CXIRJCY7q4gd6smdCJ1CqmakYdYi2JHBZWzxhLDv9k5YAFxrO+oLKO5qcFHZOTvhdggCCYmNl5e4kYyBij1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpNeCEYM; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpNeCEYM"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54ea69e9352so2208565e87.2;
        Thu, 15 May 2025 20:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747366901; x=1747971701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cv+Z5EyhamaRdEUyPKUKKXRXh2hCvdemmvs6xDGcfz0=;
        b=LpNeCEYMjDBWnYg7fd1DSAwDbA+L2rGlhSVAmHgP3S0TBAVB7AHlGz+sUFO+BS3wq/
         Vz+2MnkHYEaQ+hN94JX7NAb/fR2yNYxsfkY7i8UAyHiiFb3rRbxWeLSDEbXOOf3uYrbH
         7BBEt0zImi4wk9IG2sTIVCXaVFE9wyWaPtCicqWQK/XCkuB76925INEhIuTmidy+B5/o
         1qfvmSVvvArDr66+50++5cZ6PZEnvDIu/zNUSdrgrcyTbIZjAFWL3cyiT7WrTYhCwTMm
         rt/tNRLUUvChr0fNi+FhJ8Qtlfp59w6PAyLmw8b56vjfXczaBPoTt0WHy6bLidwIUvrj
         kvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747366901; x=1747971701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cv+Z5EyhamaRdEUyPKUKKXRXh2hCvdemmvs6xDGcfz0=;
        b=oigZOvtFoyO6HtKAoHWlGSKj7qHVIZnimGfIsFklf0r+/+mV1XLPvdX/CmTkxtIIQw
         28Esuk1deqn1qU2m/T+HVdeREL9Jz//uSDMXU98MpjZOh9NzHL7+F3TwsMuTR9etP/Rb
         FYXse33lbO/ArPxehUNRz68yy6s3uPfDeuXCxtf6UHuNlyblBh2JCG1edhAYC7r4IBN2
         zm5vkvB1s2cRh7+VHuHXJtC4wnAuMHdUL8PI+AWY4e7ARKT1Vt9PWOHUJAeNeKcLojtP
         ghWNeD6OQ899G2W1XDjnYRAe2F2fz7c2T3JjC+0YRQe/IDZwIT8xkgVGuxqqkGqWmmRz
         WvEA==
X-Forwarded-Encrypted: i=1; AJvYcCUZlxc4IbgvP2tk1ppvqs6s1ED6dYh1l7Hr2RnLirVi+dwB/wq6Lr52AJDrhK5845Zf1GWDik4iqxzqZNU=@vger.kernel.org, AJvYcCVNvbIu6VSFEdF8e+mrO5Srb1/RSKHeXp4at/SYGdYe3hXRy/P9Ln3B6nBODm9gVwipZS9Qi19nuQXX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqnrwd/UPEQMQHX/019MZjRTpN44eq3iN/7PYShVb3KuY4+61X
	83IMYKOi34Hn4XCE+bsQRsjoBqqaq4Wd3XfqfzLuIN+RUm416x86LOCf0RCQdJfAWByKzRg6iVM
	avp8AlMWjOQWVCw8Nu6HNNpnP3zR6r+o=
X-Gm-Gg: ASbGncstVR4N2DszSjJTAUnhi6vwguuS5iQBKKcJqzvCm26qe/wc5TT3QAp28miMhfy
	aGoFuTWampk/VDAv1sAO+l0AkTMAvh55KSCfZqolP4R0h0FNMkKiwL4nFPjlqh6/4AX4SB4AZ4g
	Nnxr5gAZaAkvudvwRlxGFpV2S4z34lr5SBPHDiHCSC3o53aoCy+gP53Rs+oxkpTsjrzlc=
X-Google-Smtp-Source: AGHT+IEYUFZ8fuKrx/1pcVQ6FEvGvLjYdBQdtB8zshOOJU4Yd+djbgw8jzpXtv1Xkjh3nzmr/oJYjoiNaMpJGWIccKE=
X-Received: by 2002:a05:6512:228a:b0:549:8d16:7267 with SMTP id
 2adb3069b0e04-550e962697cmr235202e87.10.1747366900677; Thu, 15 May 2025
 20:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514134011.16285-1-shawn2000100@gmail.com> <2025051444-among-posh-afcb@gregkh>
In-Reply-To: <2025051444-among-posh-afcb@gregkh>
From: =?UTF-8?B?6Zmz5a2Q5r2U?= <shawn2000100@gmail.com>
Date: Fri, 16 May 2025 11:41:29 +0800
X-Gm-Features: AX0GCFvQ2npPTUqwgxDkpb5F4pgkUEaZ5qECP3wQm-QLOHQh80mchMkIrgmMY7U
Message-ID: <CAPwXWsD2JHO+MQS5+5+Zi8ic4uFY6G24Ug2Jd2dZ3zfSDvuxtQ@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci: Set avg_trb_len = 8 for EP0 during Address
 Device Command
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

I got it, thank you so much for the effort!

I already patched a newer version
Link: https://lore.kernel.org/linux-usb/20250516033908.7386-1-shawn2000100@=
gmail.com/T/#u


On Wed, May 14, 2025 at 10:46=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Wed, May 14, 2025 at 09:40:08PM +0800, jay.chen wrote:
> > According to the xHCI 1.2 spec (Section 6.2.3, p.454), the Average
> > TRB Length (avg_trb_len) for control endpoints should be set to 8.
> >
> > Currently, during the Address Device Command, EP0's avg_trb_len remains=
 0,
> > which may cause some xHCI hardware to reject the Input Context, resulti=
ng
> > in device enumeration failures. In extreme cases, using a zero avg_trb_=
len
> > in calculations may lead to division-by-zero errors and unexpected syst=
em
> > crashes.
> >
> > This patch sets avg_trb_len to 8 for EP0 in
> > xhci_setup_addressable_virt_dev(), ensuring compliance with the spec
> > and improving compatibility across various host controller implementati=
ons.
> >
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220033
> > Signed-off-by: jay.chen <shawn2000100@gmail.com>
>
> Please use your name, not your email alias.
>
> And as you are now using a gmail account, please set the "From:" line at
> the top of the patch properly as is documented.  Please work with others
> at your company that know how to do all of this if you have questions.
>
> Also, this is a v2 patch, so always document what changed to warrant a
> new version.
>
> thanks,
>
> greg k-h
