Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A790628F520
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146297; cv=none; b=ilsuqQhcArP1EqSXo5VKWy4VaN+qkgDWjgSm2I8neNQic/GW8oXWYQ6wL15v8j14tm2uGqW8j84s+wu4OS1EVAMVhvRpn/UezG4poCpLA3JOb4GORgiX8+QECNvHbxL6VzzmCL76cVNnjF12GtKeK28KW53pmUkD6m52VNdPsYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146297; c=relaxed/simple;
	bh=GxwcSYNe2p0XJBrJx4bSenouSf2vBwH0LKTpfUMyLn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4jF+zKd+gP1Pv/kf4jKpy8wERMchJAfaLiTOvC88POcpHgC5j45b+7FxnYYTA/KwtBysG0P3Ms/mylvdeIIus2m3jihoBVDcMH1k0NwjkgsGypoit74jmq4rOIGSI+OFJJ1sjYOUFrBCK3m3xpFUFEPdy0o0Gv1OO83SJqGF1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GbbiUOd0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GbbiUOd0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so5421995e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146294; x=1747751094; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/NWh098gqRLftvvY4dIkjtdvgIAwUVSrP7NdWik+NTk=;
        b=GbbiUOd0zktufQFK9LZO0f6IqfSKNNyks3R+IYGWOLbDrfHJeJ3WqDzARkp3llsvLB
         iL1wnox3ggk7x9CUZXYGf5iNRZFT4qf3BvPxOFwWWoKLTXBpwF14g/iyI6oQ2McqM3xf
         jMXov9f1UtvHF6v9DCYlbrZmOOpPHPiuZ3lDa439MgtgDTD1KgHkp9lrJCAlLcXHyAVz
         2HdpIcPVmWIOc+thpXTvBmqKxgHl8NCby9wHY7vQhsHf8S4Xw9zdE+ztu8Fuf7LvMLZS
         /MSnKxyLDv8XxtytFJ4l4wwM/YibtWaVobNTnkB9d0gzZguceEaSuKubnrLJ/H54bmNC
         mT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146294; x=1747751094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/NWh098gqRLftvvY4dIkjtdvgIAwUVSrP7NdWik+NTk=;
        b=lHEbcKg/QZyngSeKzkPAaYVJPFU6X+i7+NP4vcHN070aVH/CkI9fc1+3LmQ/h9fH5P
         SCBDaxeXGoe/FDhCdSghTVdK8UO2wkH67Hvl1DDsbObBX/HANkku5fEO0FeC3Zotd9H0
         NHbaOE4m0Lc34svV5WVH+W7P5G3mr6ydWB22CkkoW6/J7xovWHIScLH2QwV/2kF7Uz4B
         OpZ6a/ajVLH+REqIn9Hf2+U4KRaYiSfGC8atwjHeTqmMedLwq51x6rWX4gz1sDnob0J6
         iePqP4aKsD2/XKkSh56kQlqoh34ZEcSZQMMygUl5dnqQmf8+/1EbXEGfrrToDVkj9tV+
         p7Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWkeBSh6ezo4WvLZcftu201FM5wUpkzdbSKxRBW8qok4Cz1+5NVFL4Uuq42Up3CiMMgTS0NaS0GLMFaBU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnRM9CpTL+pDW98E01/Fm6CLrrbxsH3H6lPtM6568Lqodq5GEJ
	Iw5xPwhTMaC+whVmBcyMb6Qqw7y4UTRw1pG7qFcGYzKM+BPyTX3tPu3ay/EYAV0=
X-Gm-Gg: ASbGnctF6Z+m5hIH+wWoQAMAkpbiYkh6TPb1aRMsrdn4nOLSKA36/51sgI4em+ypvBB
	mIz5291mdrZHGXsyBMv7o8R2LWNm0wRjmrAkyFRe1vCb5yOHEEg7cVEKqK4cgCeFxxLLQty/TID
	L095W1mr7IlKrh8HXAT/9zm/Z/Axprn6MSeSFbvXtnBwviJ0rLeL03RUp7MtEUG9RQ92IsL4thG
	fBq4th1scEjpkB6VfOSdhNSf0mY6C5iPLS4KL7Jl9ZzF4zIa2JNa6fWyAqycai8CNRGvChRHVds
	zcoYGLmE3ifbclLfcOiV6w6XQscutbor6IKpIwtWrwLfSiFAUDG/tLAbPLN7GxoxangPcdjhNB6
	r+Xov+UCuQFrcKQ==
X-Google-Smtp-Source: AGHT+IHHlX9t4nfJ+7hHMCJoNaC1yXBW+lGGwra9RnsLEfJITmGfdfvMv/X1F4SEEmKSiUDfR77dIg==
X-Received: by 2002:a05:600c:4e44:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-442d6d6b603mr171874205e9.19.1747146293972;
        Tue, 13 May 2025 07:24:53 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ed666dc7sm23697575e9.18.2025.05.13.07.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:53 -0700 (PDT)
Date: Tue, 13 May 2025 16:24:51 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
Message-ID: <aCNWM5Xq7wnHVCrc@mai.linaro.org>
References: <20250507134500.390547-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507134500.390547-1-cjd@cjdns.fr>

On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
> EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
> processors. They are found in xDSL and xPON modems, and contain PCM
> (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
> 
> The EcoNet MIPS SoCs are divided broadly into two families, the
> EN751221 family based on the 34Kc, and the EN751627 family based on
> the 1004Kc. Individual SoCs within a family are very similar, only
> with different peripherals.
> 
> This patchset adds basic "boots to a console" support for the EN751221
> family and adds SmartFiber XP8421-B, a low cost commercially available
> board that is useful for testing and development.
> 
> Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
> peripherals, and for historical reasons Airoha chips are sometimes
> referred to with the EN75xx prefix. However this is a different
> platform because Airoha chips are ARM based.
> 
> This patchset is against mips-next.
> 
> v4 -> v5
> * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
>   * Improve explanation of HPT timer in changelog
>   * Move pr_info to pr_debug per recommendation
>   * Remove pointless debug on spurious interrupt
>   * Small code-style change

Shall I pick the clocksource + bindings changes through my tree ?

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
