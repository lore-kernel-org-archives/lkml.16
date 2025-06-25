Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E582529B768
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868037; cv=none; b=M6pHu+EZXaUPL5YWKa6UglVD2K+es72WMVqormTEPR33ZhCJnzhzXWe4dAPotjN3BUZLjnzX4+jqd04Taaj4bJyg+hGEYjquXLuRVyN/kNiBURjIVue59arjs6ifWLqMOMvtBUlmLDMl7LdBfPcl+dw6w99dqyjDoIG8+WZvOwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868037; c=relaxed/simple;
	bh=4QNLkEkuI4EdTUnOIb2grO6q4rrhmfxNLIwjC1OPtDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNa5emNWX0A+HMxSBZPM6rEi3WJtA7tdqzduyqU0RlkDV5USQlKvCINWJuPLZSdI1txhfYmOYHsQlB1Q5LbQiRmnnQgaJ3QQz/JkZQA41fmH+iVa+w0TghlpSR23knee903XZOvQR6i5f1iArRqDiiRFc3TxB3Y6meRl/oupeJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=baVx0Gzn; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="baVx0Gzn"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748da522e79so85504b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750868035; x=1751472835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vCD23FijRiGDMDI+6SLBJ6sq7ACBPYUWzeLA8BmQJ3k=;
        b=baVx0Gznwd0r88DchaN7RIfItLtoO0CfPZoLUZg6nuzG19L5tXdUj2/Et2NQ5BH0/p
         tvjFLK1pMiRQnTwofbYvRVHhyDe7u/qp6orgLFOSMu/KmUvChbdXxJr/ly+L4sFOsFkN
         bhfHVO1theAZQDk711odr0eVfekOPQCIs7oHmraSyDSHnNdyq4F7Ob+JS6q8RoGIOWzi
         8LkES5LctGCT4aoFNBCVA6YMFB03k8lXmHnNO/9Rijt2Z1e6Ld/e7PHJ7KZxNxaNoo6O
         ryAAA/ChFNWb7G22eCsN7x+efn5wI7eIDFS9kdvP1L/7sGFMneb1ebqMEDgK2TRLcpk/
         UJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750868035; x=1751472835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCD23FijRiGDMDI+6SLBJ6sq7ACBPYUWzeLA8BmQJ3k=;
        b=MbYilgiBAHvxqyfb5wzyHEqJRKlcnW5ZYz6hoA5LnlmZogOPUnj2TqSJCJy5neyfzu
         S9P3GThEgo+H+5q43RHKDnsdxn1UB8q243wWNac/ePIdiaTPdXIVPYZGxaNKP95zkHac
         tkD6jQoAB0a1cNTqW1FXke6Sej4Q6b0smWoDyLWtE1wLo59OGC7YBY4g78lfpxyMg+pM
         0ZmzoBnlh98NC0EYDYxKbJnVy9lYwR4FHj/wQRsmiS5sM1Uzwi7aZVqPWbLj11DHjmsd
         RR8xtoCbqJ2QmDmpacYLYQSOgJ2vuwOvppT0QiH5DNhtiOuo3mpaJRAdn8c4ySAQ1CZc
         UgwA==
X-Forwarded-Encrypted: i=1; AJvYcCXwk/4hpUmhE2vte6BhiaGPHB8kcl6Ot55TGMLzVGPZvhSWKXFUOA/58SlLv526kgECZBfXJRHECps/9G4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy94W58sFt7XKq6vxXUtgENIgt2dQpsn8IsLCMqO2mmIRJJvZh0
	eA3v4DhLeiUWft/pSYQHjvjdT2WDgRv0Sxd+Hbl93BrekPEeizlV7YLtWiPVtD4RH14=
X-Gm-Gg: ASbGncsRAPa7zGPyIJp3Hr+JLkJV2kZg7DaqcteEbivjYN0QmOy6IC/A2KXax5oTx4D
	FMzhKhX2xoq/IrFaCQh8y2ynSD8CsQ8Jczs+fcYC3sMsvpF9Wyh7bSNleKK43ACQ83vStFLbdJR
	CWbW8wEBBrmTOssuuqgr/nLh15FlEWf26PLgeMB37PHJ5UNT/EaeiPDbUc8k/qjx8rS7rbPFsoV
	fo44vhob7c9Gj443zHkxSPHK1R9hvyQCzdmIwrdTCn5sjKXslq9KOaohCzzLlMO1yBBRCSxruRx
	9p0LNi1MXQfY72W5nn3OiIVcfZpNJwwmVeFN1R86Ykes6CRgZ0hrG3ymRLSEAvl9mQ==
X-Google-Smtp-Source: AGHT+IEaq7judiTDhY4LEdwCxHhEeJO96l2aFLRZebjujuoodpXvyb7qOhHSrHTIPCIkDRJZva9x1g==
X-Received: by 2002:a17:90b:2709:b0:311:ff02:3fcc with SMTP id 98e67ed59e1d1-315f26265a6mr5857836a91.14.1750868035161;
        Wed, 25 Jun 2025 09:13:55 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2ed4:4c68:6e76:7d6f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53d94b1sm2124536a91.33.2025.06.25.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:13:54 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:13:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rpmsg: char: Export alias for RPMSG ID rpmsg-raw from
 table
Message-ID: <aFwgQJ8B7EcjM1q7@p14s>
References: <20250619205722.133827-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619205722.133827-1-afd@ti.com>

Good day,

On Thu, Jun 19, 2025 at 03:57:22PM -0500, Andrew Davis wrote:
> Module aliases are used by userspace to identify the correct module to
> load for a detected hardware. The currently supported RPMSG device IDs for
> this module include "rpmsg-raw", but the module alias is "rpmsg_chrdev".
> 
> Use the helper macro MODULE_DEVICE_TABLE(rpmsg) to export the correct
> supported IDs. And while here, to keep backwards compatibility we also add
> the other ID "rpmsg_chrdev" so that it is also still exported as an alias.
> 
> This has the side benefit of adding support for some legacy firmware
> which still uses the original "rpmsg_chrdev" ID. This was the ID used for
> this driver before it was upstreamed (as reflected by the module alias).

I was surprised to receive this patch - my question from almost a year back is
still pending.

> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> Acked-by: Hari Nagalla <hnagalla@ti.com>
> Tested-by: Hari Nagalla <hnagalla@ti.com>
> ---
> 
> Changes for v2:
>  - Rebased on v6.16-rc1
>  - Added Acked/Tested-by
> 
> [v1] https://www.spinics.net/lists/linux-remoteproc/msg18959.html
> 
>  drivers/rpmsg/rpmsg_char.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index eec7642d26863..96fcdd2d7093c 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -522,8 +522,10 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>  
>  static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
>  	{ .name	= "rpmsg-raw" },
> +	{ .name	= "rpmsg_chrdev" },
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_chrdev_id_table);

... and I still don't understand why this patch is needed.  What is broken that
this patch fixes?

Thanks,
Mathieu

>  
>  static struct rpmsg_driver rpmsg_chrdev_driver = {
>  	.probe = rpmsg_chrdev_probe,
> @@ -565,6 +567,5 @@ static void rpmsg_chrdev_exit(void)
>  }
>  module_exit(rpmsg_chrdev_exit);
>  
> -MODULE_ALIAS("rpmsg:rpmsg_chrdev");
>  MODULE_DESCRIPTION("RPMSG device interface");
>  MODULE_LICENSE("GPL v2");
> -- 
> 2.39.2
> 
