Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0131EA7EC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288495; cv=none; b=PPpzer5b9sAA5GzgpfinEJdpITXVc+C0Ckdnm/BMpCntyOta1+moNe85RsUGtrXlP2z/+b1JrlIovlXWC3YgYPkoX6EOrp2cuganPsMLN11bt3iKEckfl1onBXHDukv2ljSC39Zkzq6Qlp4gXzSCt7RGxbcQ4FESGxZjMYDLWXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288495; c=relaxed/simple;
	bh=TqoqYW7a4gp6/76bsxLTxXOnix/eiOkPYqrN2pTRfCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sny6YHeOrlDL3mjoz+ERZXBET4sOcj5c+f8oT4MQqrLLwkXbzOPgDeeA/A4QKwCmqYuTS0fNhSorS+1ZrdQOBj95f4yRQ0/j9MOJdvWFwaWem7rYkVFiYQdlBSXzG2AMEEOQhoJNb9cKHodMRFFlrd48c5lhZg1j3uv4NL+H6Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l2/Kcs5N; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2/Kcs5N"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ff0c9d1761so7547237b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288492; x=1744893292; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rqOD9OxXJmvSDblyShGiywTB8bqKw04tVNsGe+lxyzo=;
        b=l2/Kcs5NS1BVHCjFe5dJa8p+HlIAExNJWwoI9rjqzkS0MS+jmqbEhMLRUuqd5RxJkz
         u11v2ariigV0L1O0vaZ/IpD+POHqUJD2MQ8a9RWNBE7FYZKK11hjeTjZ1DVWxOxOFVIh
         ZX0p6ZkYS1DlL0payF6SWub4T/qR7VnreZV3LJxXT/NMp4T5Z6zh2F3CLGuvCfb3i7vg
         per/dhbsHxcBXiWsQtnCsK63MWj0JqVd1cRhjchPM7hmiST3wpGtCLmPuElWlSpYWVqZ
         LLmDKdVPd+L+tY22Dtfi2R4MwsYhqCeOKuJ5clxE7zBY7X/t620sBhWmjXLLNTQDHHq3
         ARrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288492; x=1744893292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqOD9OxXJmvSDblyShGiywTB8bqKw04tVNsGe+lxyzo=;
        b=ZE0nJyPhGCL6doIVFf4VztpL4ontXNxrGwlHCr/AE4XoyvhCx0WWclJYhrro7qRquy
         24kwatofVS/w9xd7jt3LhQ6iZirAwkhCfZbmSfyc3YXToMhUOSx8rEGDBOYwdzJnIiUR
         nYe+M7kDlnGuutEhuQBdV1j1XYRQ3a0HJ1QDqjwXjPhttC6rqTW0IhJRCHzEa39gKWZd
         0E44coTlwaq74/VoX9SAtgbpFuPcZaLX8HH9H/wSGig5V5AtRq/mntJOkLYggu8dFqGN
         qncyytbFf42q3RjHZdTBYF6lo+bS5LtFajaQMDpILTAlWpCbqqhy3GDqTWbjfSg9MluY
         CmCg==
X-Forwarded-Encrypted: i=1; AJvYcCXcFd8tHd16K2G1au8X1vAK7vrj5lasZxbduZOTitLVfMvyfNceXEjwTHZl8dD8Hiam1UuXwkY8tFJxGUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQD7YKgaaWDdC6TZLJXBoWg8Z9GaaIAY4nRe1ldcXAhwRreCIy
	o1X8hVFbl9MmPwkd00Fo2r2tuFyz1gergApfx6Vrxzx8teB2FnuNwUOrSdBgh9UdLeAbEDsrra6
	uyoTrfxKlC5xrZiFRQU0oTPMv6bJLwOMgf+lhwg==
X-Gm-Gg: ASbGnctlWcGdZM9V+7OTJ8UAat/zvZRt6+yqyK3Hjv/aS1TmpvIki2Rgy5ufthZTIC+
	UnWgzg4+i2r89+0Wr6yqXmfKvAXylON9BXBFTrGxScD/eAvG9YOZqgI3NKRgxUqRrjPmpiIu3Ya
	UB3j1zO3U7wwMxpyjT0+oUmqu5x2XSnm7g6g==
X-Google-Smtp-Source: AGHT+IE96uvkSKWw6YPtFVcby7pWdKNYA2UEmsGaoJPHRvl5S/OcYn8T2l4wlOx/RbleIvNqeqZYcO8OmfDh5/zO70A=
X-Received: by 2002:a05:690c:3582:b0:702:4eb0:4a60 with SMTP id
 00721157ae682-7054c7d0e89mr28286317b3.33.1744288492295; Thu, 10 Apr 2025
 05:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250409093031eucas1p2222e9dc4d354e9b66b7183922c0fb3cf@eucas1p2.samsung.com>
 <20250409093025.2917087-1-m.wilczynski@samsung.com> <20250409093025.2917087-2-m.wilczynski@samsung.com>
 <CAPDyKFpoSwKAmiWyvNt1fVyu6=NU1oVOmQLVuzX_bG=-5KrM2Q@mail.gmail.com> <75f97336-6cb5-47fc-ac88-5fe7842e2838@samsung.com>
In-Reply-To: <75f97336-6cb5-47fc-ac88-5fe7842e2838@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Apr 2025 14:34:14 +0200
X-Gm-Features: ATxdqUFgmaVfbL47_mXJup4YjWo6ZMMfedtXYPTwprySI8RzBXkwm9C8hCD80Tk
Message-ID: <CAPDyKFq=BF5f2i_Sr1cmVqtVAMgr=0FqsksL7RHZLKn++y0uwg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: firmware: thead,th1520: Add clocks
 and resets
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Stephen Boyd <sboyd@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, 
	p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Apr 2025 at 12:42, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
>
>
> On 4/9/25 12:41, Ulf Hansson wrote:
> > On Wed, 9 Apr 2025 at 11:30, Michal Wilczynski <m.wilczynski@samsung.com> wrote:
> >>
> >> Prepare for handling GPU clock and reset sequencing through a generic
> >> power domain by adding clock and reset properties to the TH1520 AON
> >> firmware bindings.
> >>
> >> The T-HEAD TH1520 GPU requires coordinated management of two clocks
> >> (core and sys) and two resets (GPU and GPU CLKGEN). Due to SoC-specific
> >> requirements, the CLKGEN reset must be carefully managed alongside clock
> >> enables to ensure proper GPU operation, as discussed on the mailing list
> >> [1].
> >>
> >> Since the coordination is now handled through a power domain, only the
> >> programmable clocks (core and sys) are exposed. The GPU MEM clock is
> >> ignored, as it is not controllable on the TH1520 SoC.
> >>
> >> This approach follows upstream maintainers' recommendations [1] to
> >> avoid SoC-specific details leaking into the GPU driver or clock/reset
> >> frameworks directly.
> >>
> >> [1] - https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel.org/
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  .../bindings/firmware/thead,th1520-aon.yaml   | 28 +++++++++++++++++++
> >>  1 file changed, 28 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> >> index bbc183200400..8075874bcd6b 100644
> >> --- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> >> +++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> >> @@ -25,6 +25,16 @@ properties:
> >>    compatible:
> >>      const: thead,th1520-aon
> >>
> >> +  clocks:
> >> +    items:
> >> +      - description: GPU core clock
> >> +      - description: GPU sys clock
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: gpu-core
> >> +      - const: gpu-sys
> >
> > These clocks don't look like they belong to the power-domain node, but
> > rather the GPU's node.
> >
> > Or is this in fact the correct description of the HW?
>
> Hi,
> Thank you for your input. Based on my understanding of Stephen
> presentation the power-domain layer could act as a middleware layer
> (like ACPI) that could own resources. That being said it was also stated
> that the proposed approach should work with already existing device
> trees, which implies that the DT should remain as is.
>
> So I could get the resources using attach_dev and detach_dev, but there
> are two problems with that:
>
> 1) The GPU driver will try to manage clocks/reset on it's own using those functions
>    if I provide non-stub working clocks and reset:
> static const struct dev_pm_ops pvr_pm_ops = {
>         RUNTIME_PM_OPS(pvr_power_device_suspend, pvr_power_device_resume,
>                        pvr_power_device_idle)
> };
>
> So obviously I should invent a way to tell the drm/imagination driver to
> NOT manage. One obvious way to do this is to introduce new flag to genpd.flags
> called let's say GENPD_FLAG_EXCLUSIVE_CONTROL, which would tell the consumer
> driver that the power management is being done only done from the PM
> middleware driver.

Something along those lines. Although, I think the below twist to the
approach would be better.

Some flag (maybe just a bool) should be set dynamically when the
->attach_dev() callback is invoked and it should be a per device flag,
not a per genpd flag. In this way, the genpd provider driver can make
runtime decisions, perhaps even based on some DT compatible string for
the device being attached to it, whether it should manage PM resources
or not.

Additionally, we need a new genpd helper function that allows the
consumer driver to check if the PM resources are managed from the PM
domain level (genpd) or not.

If it sounds complicated, just let me know I can try to help put the
pieces together.

>
> 2) The GPU node doesn't want to own the gpu-clkgen reset. In fact nobody
>    seems to want to own it, even though theoretically it should be owned by
>    the clk_vo as this would describe the hardware best (it's resetting the
>    GPU clocks). But then it would be trickier to get it from the PM driver,
>    making the code more complex and harder to understand. Nonetheless I
>    think it would work.

I guess it doesn't really matter to me. Perhaps model it as a reset
and make the GPU be the consumer of it?

>
> If this sounds good to you I will work on the code.

Sure, let's give this a try - I am here to help review and guide the best I can.

[...]

Kind regards
Uffe
