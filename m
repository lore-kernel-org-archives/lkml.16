Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139AA3EA98
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748005096; cv=none; b=J1w+SzW+Y/oKzy3uFLE54El6+gxpdTuYWxFgTHayBFv46e2rQwkSO96hRfkgMi6pPyJM9Ioy40faNd1s3rXOT5HSdWkIOmkXzBI0GyWTS5zqSHBMyu+ta9rbH0ZnsHWAsUQHmuKUwiKIbZdEo6xXePjO1/k8oarRz21Xj7Mt1+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748005096; c=relaxed/simple;
	bh=AjuluDSOKXF5gIrKwkKLbJdPyDs3pmborOKkucV8Xws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUGZPB9ld5A+ex2h5PqFPLiT/PyVir6lQsmq8fGc0yqL2H2G34mH5hpiAqNuCqrwLEi7fi7n21i3v1a0dpzat3fylIDuRs4Qhd7ngMRr2zJFF0d6I3PTvJvs17mzpJi2nifZuSG6ep/VRZL5h57p9fYYDrAHBLU49Guf1DozkWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAv8lZdg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAv8lZdg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so105137875e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748005093; x=1748609893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/m0lhD5TLZ440p1Ln9LZrKk9CxCA5FWlLg85ARTR08E=;
        b=mAv8lZdgoXhUYDYP3aZQ83F+LPePDZHhw30uVYoqluLb+tRuG/vc0DSNmE8pArUGHj
         zHZcCh4D7CgYCxUSqc6nzDU2zQB47ItnZfpbedofM+uxFDOVlYyYLMagYjKrJ1Z5KCsD
         DUyClSaCAVLjSaUOq2TbxVQ/qQp5aUQbL/QypqJCN1mnNQgV4vqCvKzP3ioM1cGSukdZ
         gjrtVgley2lX6xQQaU5L67IdtSmjyZ137hKKWMq1irNRwjjIjsUbjJnosqKgDaQ8m5uJ
         GK7upVu5hzefS/FHH+xkU0BDZgL+47m7fz1STCEgmtbttj8xqB+9D5cbbAXOn/fBfOCq
         1zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005093; x=1748609893;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/m0lhD5TLZ440p1Ln9LZrKk9CxCA5FWlLg85ARTR08E=;
        b=tQOHNQULEI1SHnaWSEUr+yPZJ+6p/U1Px8TaANnfVQaIla8Td0YE7EMHPV+HALqnk4
         Vp0U/S3OmYLhb8NO9wf+05goHqY0rWhdxRz6RE4kHqFqwALSzZEKujR8FH4NZGSeah6/
         nabO7iBcwyvdsSh70RU/qITLtCexusRoy/uWLqUwJJz3xAr++KY6wEXn9orVUNkW4DlR
         WJiOy0dvzun6/AJt/PpCfFBeNjA+bTOMauzZLQPlB5zu6eA1dokA3WJ+QNZwEKHSPMEK
         gqLmDIF6W5gWLLkLQZP6hPxXo4eUwLx68CT6Ccce10XMZj84Y9DtVDgkSFRSLjh41ODJ
         51tA==
X-Forwarded-Encrypted: i=1; AJvYcCUvsZ0VQgx/flmwHD6Sdg03ktVBzLARWUU7siO82BESfbdZyDNaXCbznlEewT4Ut+Q3k2FuD1dJzi/iXsg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8rJ4SakYhp1V3qxodicajoCvtyaGLV5jRHIFcc0wNNB1i/rNG
	XjwSaSg0GxlZVvJLHpF1fN08jf/ItJkc5wktTnZ40evCo4l2NhDMhXv4/WFhIA==
X-Gm-Gg: ASbGncuRYCFaG8lFXW+BaM0icDniSvfRqzXvOogl5LDvwJJBhyausGsY0gejb4y3sI3
	D2ZLGLWWBtZanYzq1oY77WQqJG2t6q49NyU3GNXav+xaJBG3L6f1adHsyTKufihedOrYBulEODZ
	bxVr4M+9uWl9KxEMa3m3xBdqnS/Lx3TDDN+EMEdxf2HGsoj2dz3D2XdqVtAc8Lz+Zwk+NPaelua
	tG+jMfB2Bs3hRSHIBJoNwZM0WMDd5uy3M+PuPOTjfKSmvAuHTpeU0EGuhKURg2pUz4192yW2pKH
	oCwUcD9O0Oa30r3UYLkL73Gi/jCoCGvZZ5qujzIrbRADbRAZ9rYAvdy2XbA1k/dPdlTog1vP
X-Google-Smtp-Source: AGHT+IGf1pWMo4SXQAxm9lw7KSPXQcTfdAiwZDS6HUYzhHSDlhRC9FPIJF7bCo4eoueCnm0Os3tKtg==
X-Received: by 2002:a5d:5f94:0:b0:3a3:7593:81a1 with SMTP id ffacd0b85a97d-3a4c2343b5fmr2624012f8f.43.1748005092950;
        Fri, 23 May 2025 05:58:12 -0700 (PDT)
Received: from [192.168.0.14] ([178.233.24.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca9417dsm26093920f8f.101.2025.05.23.05.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 05:58:12 -0700 (PDT)
Message-ID: <8f9ae0f1-130f-482c-b0a2-d5a403639099@gmail.com>
Date: Fri, 23 May 2025 15:58:10 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mt6358-regulator does not probe automatically on MT8183 and
 MT8186 Chromebooks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <f3c6ea1d-da0f-40cc-ba70-7cabb5c3189f@gmail.com>
 <dc21b01f-e89f-42f5-b6d1-f6a00a524235@collabora.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <dc21b01f-e89f-42f5-b6d1-f6a00a524235@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello again,

On 2024-12-23 14:21 +03:00, AngeloGioacchino Del Regno wrote:
> Il 21/12/24 16:38, Alper Nebi Yasak ha scritto:
>> Hello,
>>
>> I'm left with one small problem trying to boot Debian on MT8183 and
>> MT8186 Chromebooks (Cozmo and Magneton respectively). I see a lot of
>> probe deferrals and get dropped into an initramfs shell. All of them
>> get resolved if I run `modprobe mt6358-regulator`, after which I can
>> exit the initramfs shell to continue booting.
>>
>> It has been happening for a long time, still unsolved as of v6.12 and
>> next-20241220. I am using `softdep mediatek-drm pre: mt6358-regulator`
>> and so on in /etc/modprobe.d/ to trigger it to probe, as a workaround.
>>
>> But I would like if it was solved upstream so distro kernels can work
>> "out of the box". Any ideas why isn't it probing automatically, and how
>> to make it so it works?
>>
>> More info from a serial connection below (on mt8183-kukui-jacuzzi-cozmo):
>>
> 
> It's a bit odd, thanks for reporting.
> 
> I'll check that next year........ (which is really in 2 weeks anyway, but it's fun
> to say)

I couldn't manage to ping you for this, let alone look further into it
until now. It has been a while, I assume it's still not fixed, do you
need me to test again?

> Btw, that softdep is obviously not right, but I think I shouldn't even have pointed
> that out; still, better safe than sorry, anyway.

Yep, that was just a debug trick I use. My current workaround is using
CONFIG_MFD_MT6397=y and CONFIG_REGULATOR_MT6358=y like everyone else (as
in the defconfig).


On 2024-12-23 19:00 +03:00, Mark Brown wrote:
> As indicated in that thread the MFD should register the regulator
> function driver with the name "mt6358-regulator" used by the driver,
> then the existing MODULE_DEVICE_TABLE() will DTRT.

As far as I can see, mt6397-core.c is doing a devm_mfd_add_devices()
call with the necessary data, roughly paraphrasing:

> static const struct mfd_cell mt6358_devs[] = {
>  [...]
> 	}, {
> 		.name = "mt6358-regulator",
> 		.of_compatible = "mediatek,mt6358-regulator"
> 	}, {
>  [...]
> };
> 
> static const struct chip_data mt6358_core = {
> 	.cid_addr = MT6358_SWCID,
> 	.cid_shift = 8,
> 	.cells = mt6358_devs,
> 	.cell_size = ARRAY_SIZE(mt6358_devs),
> 	.irq_init = mt6358_irq_init,
> };
> 
> static int mt6397_probe(struct platform_device *pdev)
> {
> 	int ret;
> 	unsigned int id = 0;
> 	struct mt6397_chip *pmic;
> 	const struct chip_data *pmic_core;
>  [...]
> 	pmic_core = of_device_get_match_data(&pdev->dev);
> 	if (!pmic_core)
> 		return -ENODEV;
>  [...]
> 	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
> 				   pmic_core->cells, pmic_core->cell_size,
> 				   NULL, 0, pmic->irq_domain);
>  [...]
> 	return ret;
> }
> 
> static const struct of_device_id mt6397_of_match[] = {
>  [...]
> 	}, {
> 		.compatible = "mediatek,mt6358",
> 		.data = &mt6358_core,
> 	}, {
>  [...]
> };
> MODULE_DEVICE_TABLE(of, mt6397_of_match);
> 
> static const struct platform_device_id mt6397_id[] = {
> 	{ "mt6397", 0 },
> 	{ },
> };
> MODULE_DEVICE_TABLE(platform, mt6397_id);
> 
> static struct platform_driver mt6397_driver = {
> 	.probe = mt6397_probe,
> 	.driver = {
> 		.name = "mt6397",
> 		.of_match_table = mt6397_of_match,
> 	},
> 	.id_table = mt6397_id,
> };
> 
> module_platform_driver(mt6397_driver);

It has more things like "mt6359-auxadc" and "mtk-pmic-keys", that also
list compatibles in the non-mfd driver's MODULE_DEVICE_TABLE(of, ...).
See `git grep -C5 '\"mediatek,mt63..\+-' -- drivers/`.

Maybe if the target driver isn't available by the time MFD registers it,
it doesn't try again later? And so people have added the compatibles to
subdevices to let them get another chance to probe?
