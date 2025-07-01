Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9409523B60B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403848; cv=none; b=sfbXpsUcKR4uhphrRFWUs80Q1+WMxlVYEnvaPQLEklFrFtTFOp9+QW3Fr4zk7lPe661m45+EaaYWfrav6s1MNE/XeoxT8VU+8e9Z7+Tt/fkjF+vKH3gPDcVL62R2okXpZNw8ISw1bDEy5hu+uTymHLYPPwdKszeLLYWoZNIin+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403848; c=relaxed/simple;
	bh=8FCqo8HglwUC7lV2qsEc0sMIhpTVdmCKgwRAnut7D8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVGWkFEA4Yb+tYTu0eL7KA0KbeHxkJqwBClsexfcZzVDNdnXjuT+qJ3V/ygPW8DrUZV8YgVnrcY2cHNAU8SHymVffaJsEczUH4qa9dILLQrw+tmOSnxx3Qn/Se1l1a0IQzP00voMchFwhohHtNSIba6K/Qd4NZNJspa4E0rSSe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNkXuVMq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNkXuVMq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-747e41d5469so4184811b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751403846; x=1752008646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u8haZuXHqwNt+r6E2/YPONG0WE5U91vsPV7q00D+974=;
        b=UNkXuVMqiVGP3iHqsA7Ib563jCcB+Yzqf6NvSCA+gRGnant4hzND0vGtGB0LhM5YJp
         6fmQbmOuqVFaI0Evzgwkv+xkf1BIvZMu2iJPqXUC3qHUkUN5C0Ybs9qNKW0CcdBAEba1
         GDZow9TfahJpj+wFWNeyO2ighYmHSIqxJQVZfEAe4oGYEwZOZgSRO5IhlwbcFqpz9K/O
         QPfRV5LE6jVGGfhURhliXzNV/tFOJhxa/8+LkAWhiHocFDTbYuZCdf2/kUreD/aTo6yC
         XKn2KCxl8NbMHNNBWpxTh2BOj6V0lMX2dkQn4Xwp3ZOEnKp2weW8XqmtGD6ADmUNiift
         jEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751403846; x=1752008646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8haZuXHqwNt+r6E2/YPONG0WE5U91vsPV7q00D+974=;
        b=X4DkQbKpmkrtF6KYQQ/hbiN3v14gyeqgC0SCy74vslUTMKJnYJwsn73A/0DrefdnW/
         Drg93nG5COY6mlNuf9kfTUkWswpcAEQvySrRD/tmjxdS+YCdupgbYy2++gOw6Aubexsz
         cDg0a6PG6qZA4OFjej7Rmj/uPIXAao4bvTI6RSA8LAUP8GLSg3AvxmL2da3Q34qpdk2/
         sNC0EmewE0pOijbutzaxbC+RGyQAuxpuCjn8JLsOkODtZDfemBgMQXEdTJzPhr3f7VMM
         D2PLViLzslj0e6rzf2E7WevzHHClRdyQLgHoNKQp/LfaDRqp+VtcaKEyHF9cscYs8V28
         tQTg==
X-Forwarded-Encrypted: i=1; AJvYcCXeTl9LaeQudkKlbi0Rut+WCU7y2iKuMxh8BSfCAQP16ANgV2t3V2p0tXtf0HPc17ptEu7Snj9Pey0EBOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFiJWoDt677dWOciBwshcCm0Vfn8gGDNh1cvzP6F6V5a8JmeGA
	3U86XDCfFYUdaSGRIWlx3CXHpels8ufc5ifmx3/r2STqNNkCqJ4HPY2v
X-Gm-Gg: ASbGnct+yO/UW8WpcEELEBFwznxCy3UpHM9h1LnVZWwCk9vF/C931TMwnQQpxcuasT1
	xhxg3+uXvwn1Z08X4h4ltKPEnUD7DuGUZ1YBoSPOgcgdAucThm+lONqvucAZkNGfxWwUbqC/BEy
	9WKfKKH4eW0HT8iwnI2uCmAXKimfgG6FlUs/OIcyunt5GtEVTm3zYpYTPI6yoTNLAicOBKa1Csc
	pOz1heH+qeq0GzZH6Arsr5EYEPqeByUIPXQlpNheLTPnpoOS/trS+7vRfrT5ARW7IS4NlD1sJUZ
	eZiHw6BiZQZ2uuWHexDsaH1xHkPJZFgVNtcArgAKvjNzUNeXEs4Ofocjk8HLZaEJFiwZkbix3w=
	=
X-Google-Smtp-Source: AGHT+IFGG15vn4olJHlquF7uHoRYBkOkcoz/0VL4VevfvrjtjKRPxqONxSTucdBuX4zgx/REtRNYGw==
X-Received: by 2002:a05:6a00:2349:b0:74a:e29c:287d with SMTP id d2e1a72fcca58-74b5149d55dmr272257b3a.11.1751403845652;
        Tue, 01 Jul 2025 14:04:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7bb0:b5bc:35bb:1cb4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5573e71sm13467887b3a.98.2025.07.01.14.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 14:04:05 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:04:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Fabien Parent <fparent@baylibre.com>, Reported-by: 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org;
Subject: Re: [PATCH] MFD: mt6397: do not use generic name for keypad
 sub-devices
Message-ID: <vhbngoyykm3n2rqcxoabkimt5mzamsqy4talluzy2gt3ddtbfg@4ouxfz57s5uz>
References: <r4k3pgd3ew3ypne7ernxuzwgniiyvzosbce4cfajbcu7equblt@yato35tjb3lw>
 <20250701105811.GI10134@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701105811.GI10134@google.com>

On Tue, Jul 01, 2025 at 11:58:11AM +0100, Lee Jones wrote:
> On Mon, 30 Jun 2025, Dmitry Torokhov wrote:
> 
> > Do not use "mtk-pmic-keys" when creating sub-device for the keypad to
> > make sure the keypad driver will only bind to the sub-device if it has
> > support for the variant/has matching compatible.
> > 
> > Reported-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> > Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
> > Fixes: de58cee8c6b8 ("mfd: mt6397-core: Add MT6357 PMIC support")
> > Fixes: 4a901e305011 ("mfd: mt6397-core: Add resources for PMIC keys for MT6359")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> > 
> > This is not tested so if someone with hardware could try it out that
> > would be great. I *think* it should work...
> 
> My suspicion is that this will not work.  Providing compatible strings
> here is only for device to node matching.  I do not believe the drivers
> will probe using them.

Actually it should. If we check the drivers for "mt6323-rtc" you will
see that MFD core defines a sub-device with this name and similar
compatible, but the RTC platform driver only lists compatible:

dtor@dtor-ws:~/kernel/work $ git grep mt6323-rtc -- drivers/
drivers/mfd/mt6397-core.c:              .name = "mt6323-rtc",
drivers/mfd/mt6397-core.c:              .of_compatible = "mediatek,mt6323-rtc",
drivers/rtc/rtc-mt6397.c:       { .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },

Driver name that is defined in drivers/rtc/rtc-mt6397.c is "mt6397-rtc"
not "mt6323-rtc". 

And if we look into MFD core we can see how it works: mfd_add_device()
scans the main (parent) device tree node children, locates devices with
matching compatibles, and calls mfd_match_of_node_to_dev() for them. The
latter essentially copies/assigns device tree node to the platform
device that is being created, compatibles and all. From that point
normal binding rules will work and they take into account OF
compatibles; we no longer need to have matching platform driver name to
match.

Thanks.

-- 
Dmitry
