Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714CB20E306
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745221209; cv=none; b=afOrHIzuTyduj1xq286O39L/hN/67wdpl7KBOv+oeV7GOnch5erxoSpv6HRz/tqdAvD/LnhFdymQpyjre3+k9mh7u14xV3RZJKBQXDaInMxeR3w5md/2NtWBo38vGx1fwES4obUAmMEYaZFNnly8BprKp/BLIqiHtVaZEBbSZBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745221209; c=relaxed/simple;
	bh=PeBXLRAj60k68zJj9ooHApuMSHQU/cTihkyhBpXJI2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHpsSsAuHuyemo7npiwYGoTf2oNnX1jAVfmcvTjBdUTmpbsfZ0GFiyTZJd4VIculs7hJmHWQ370i2moDKEpsbYNFL/GwI96zXfvZ5y8AgfzPLUFwVoFnp9yQtNK94fF3z5ATfDP2oFcIeV8P8x3SDtTDSU2D0hvUbpF4YzTbBzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p/UBuJYS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p/UBuJYS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2255003f4c6so41712935ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 00:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745221207; x=1745826007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KPWuv8niOHztMFrbbmt1uYkhWaXjAx35JzxahYfmqQA=;
        b=p/UBuJYSoz5y0zr2srUZMsmDIJ7ERTrlw4bwx4FF46ZVeFy0odZMqHkqYgVzjbQIEk
         LIloTkmxTK6jRVnKoNb/OrqURe17x0gWmJudvYao3FuY7GKfD10wl1onyzY50lWhFmE3
         LttLh3scodjgyE+6UoIyuh3lDIcY9bu9g4ctc5AkCzffjUseu6B0ae4EqMIzim1tSCGD
         3OLjfaETYT9gY/zBwvuTc/GNE+UbhvL5pMd8xdEg/Kh8MCO/CQGYXdrNvr/5CKG+f7G9
         Mp9u+K5eC4VZRcgwmoINDIFvw+InKrniQEBk8CGVe+so20xRwQzglLLMiyLnZr/G1uYo
         4w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745221207; x=1745826007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPWuv8niOHztMFrbbmt1uYkhWaXjAx35JzxahYfmqQA=;
        b=DxeCCR2jvu3JkfgDRYgsi3B5lplHqpOiBOcI4008igFVDxBS+fC6YGEe0ydcGjut+p
         GKxFbC8s3UW76d6x7dwr5ujX/Cmstr18PweZ/LSkfzJ2w9QrHf2jRUJFE+nGbPlqiCh+
         Ta4BuGO9q3tZlzpMAiepUOUVAE9zoBpmPxuPodlggUeK1rd8OQVV8bs6bzAwKcTHffRt
         4vNzfF5rbrg+V2RJQuNjuRS6/AF+QIlyhhoIyrg4bmAvQq5RgpH0DIX16sVcOuGDisGm
         pmdgccPnvFsRKUfxGfyjm7GBCEjELDhW2bEK3L9p7j+DantD5c5Vz836wkRx/NpcXUK6
         XuRg==
X-Forwarded-Encrypted: i=1; AJvYcCVnGc/AVpLmKiRoyH9ja9jbUqCf3S5m7nYr7P6VZ+60BZq3P8YQI6vbMVB9qLROMb8WqWkQY+nfreBSxI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIq5qGe4M9E40cnS9E0xM26FwXiHomwstbI5UKRYzyQzgBlP1O
	Qz6dupE3BnkfH7crLf2O1/Y+KhIc+Exld9Rbax+sZRA147kyaUzVLywOgEHjH2A=
X-Gm-Gg: ASbGncusea5ZmwNWQnY6F0a9giv/pxo/M3mNijTSOkRJ/9e6eaOcfeuI8RBRJGsY/Nz
	GNuVEzhIJXQ1NVYo+pZmqznWx3C2glQaGT7KKUAElISk3fsAPtW2Ybe0eoA9bR2BbD5E7aFaLrJ
	MJExIiYEI/aCpPIBRkU+PwAr42OsN0VoVi+DhHVPL+TDMDDHzhmhCLwZWmJkg+3k7gtiHxyZSqp
	b5oQ0vv3hSflOq+scsoy0HsumHCJbvJgN4VOkmV8FZM2iSSnmjQXpr800vNZhSadVcRKQtoyJIK
	kdVrXmpWaU73tu0zIQrFvYbBDm951x1LusGPENq0ag==
X-Google-Smtp-Source: AGHT+IFEQar7NeS6q6JkNznSin7X+7SGrcyiO8UetGUcotpj5g8KPklv9xVoi2zS1Z22WYAGg4pCjA==
X-Received: by 2002:a17:902:c40b:b0:221:331:1d46 with SMTP id d9443c01a7336-22c5356e4a8mr129549315ad.2.1745221206749;
        Mon, 21 Apr 2025 00:40:06 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bda4d3sm59679655ad.47.2025.04.21.00.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 00:40:06 -0700 (PDT)
Date: Mon, 21 Apr 2025 13:10:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
	quic_arandive@quicinc.com, quic_mnaresh@quicinc.com,
	quic_shazhuss@quicinc.com, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v2 1/9] opp: add new helper API dev_pm_opp_set_level()
Message-ID: <20250421074004.yttb42qq4p5xzi3o@vireshk-i7>
References: <20250418151235.27787-1-quic_ptalari@quicinc.com>
 <20250418151235.27787-2-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418151235.27787-2-quic_ptalari@quicinc.com>

On 18-04-25, 20:42, Praveen Talari wrote:
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 73e9a3b2f29b..a9bca9502f71 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -3151,3 +3151,25 @@ void dev_pm_opp_remove_table(struct device *dev)
>  	dev_pm_opp_put_opp_table(opp_table);
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_opp_remove_table);
> +
> +/*
> + * dev_pm_opp_set_level() - Configure device for a level
> + * @dev: device for which we do this operation
> + * @level: level to set to
> + *
> + * Return: 0 on success, a negative error number otherwise.
> + */
> +int dev_pm_opp_set_level(struct device *dev, unsigned int level)

I would rather move this to pm_opp.h as an inline helper.

> +{
> +	struct dev_pm_opp *opp = dev_pm_opp_find_level_exact(dev, level);
> +	int ret;
> +
> +	if (IS_ERR(opp))
> +		return -EINVAL;

Why not reuse the same error value ?

> +
> +	ret = dev_pm_opp_set_opp(dev, opp);
> +	dev_pm_opp_put(opp);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(dev_pm_opp_set_level);

Make the changes and send it separately (or with the series, your
choice), I will apply it to the OPP tree. Thanks.

-- 
viresh
