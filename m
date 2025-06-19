Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D332123D2B0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312015; cv=none; b=Mj4mtvXDoWK52bZFSB2KZmZGhbAGYOXlqCiogWzVmZnnZUFgqActtxoerIBi0WjRu9eW3nWmzWQ8Rq5F/tu3aoso1HOO/uPsHiysCHUFL9zOU1PLLWR00Yd80KthWg+AAjDRua0mrPALVAmGyCouibMOfVsF2INm7ljjKcVHeZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312015; c=relaxed/simple;
	bh=Bn70nPJu3HUp/M+KYcLviCtpjLHOrJf1pcJLvrjQ/Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5JKJHBabdYAKTpLJkzETXuZDs4leZxhABQA96jRPTaIkqbj4QmpwzTDITsp4+1DKdfzft7eCFmVqZgsSawYcRyNnghogSSERm1KBfbeORl0jLjLBr5LGZoPpD1csnJqFb+z49SdPV0sOxJTNf5XteTKP1Vw9QXdxZmZnJAoAUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dp3C77lr; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dp3C77lr"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7486ca9d396so238746b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750312013; x=1750916813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L1Xvm2/dcHJBRt7NYvlZ+VTR+ErXbR50l14mI16oEhY=;
        b=Dp3C77lrzqGDO6ludV5D8bL0F7AwlrR8crpDyn/Om1g4MUBSXb13znlJ0KhQRNxPO1
         iHZvLYLhLoCFNdfPbHP7V913x1P470fwT5vyPQU48GeTAUoGkB+iTGucUdcJKqT5xawq
         NW316AlnSbmqgDW763um18OX0EuUelEzae+qHfrY6RFeyfjbZkZ5BoAD4YSemNfuudb+
         owq38O0EgaYHC1bsWj3w+hIwWAR/2vWdmg9LokuwCPgIn9X+SN1fpzBOvFdYlaT7ovIe
         GDRYIAInDBCxR2jqbrBS84ZGk4DhPb6j81zoQFeL59YtCj135C4gO5D9UbBbpTvGdvvO
         /hIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312013; x=1750916813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1Xvm2/dcHJBRt7NYvlZ+VTR+ErXbR50l14mI16oEhY=;
        b=bnGxpsf+D1y9OfJnK9YA6ASIu8V3aPcLUxfXroi9Kkto8Be7OhjaB8G8ltbyhwwYJY
         EOgU3PngAaM7AePXgjNTrMOVeswliglPiEPqMyjjlq0aDSSmeuEha7JZdvHg+b4VZxRU
         8g4Ko4gzXvAfNeeAUrsGCWMNTtPDLsXkDLa/nnhOR589yorczSqpsEfO3IHaM/Dj+3EF
         NjwTKf7dlgjgosDaTIxeUN2TftbElkbBC9Q9FUgnXtaxlJsbpcMcYsaezg0rrJZYbbVO
         OA5HAmuo6M62LBhbs8NDK8Rsv5m9SF5hfGMUz5jHnrd16fpnZjsmyVDA9EPPTWVx4opR
         lu8A==
X-Forwarded-Encrypted: i=1; AJvYcCXjDK1iKUVZKZVXpOSuXd+Ur1zaMno+tgij29wdgVjUBhf/Mp+9j4pFygEFwkZEcSzUV58C7iy/swVx0DA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzstCttHJ2AO7qJcBZxIWNNBr8rWy+kTiF2UV0yJk2fH0zXm35E
	fZJAklasBF7HwUPno4bzZ6c6SiiFYMe+6NgCO55PH1NylrIh/4pkp4ub6v6h7NcH4EU=
X-Gm-Gg: ASbGncs4t9j4kn3jC4E7xwefBPiPk9TIXdcVrjeyLknmz93p12NN0ZtcI464+UHShsu
	ifj9bzG39x2YL5VfE8A6jBwhl/OO5CDPV4j67POik4whZk18rgWkOUmRIVbm3BHjPAo4pg6Itn+
	n9wEmaWIawLMfESQy58+w4blbWpc4VYHkXDKLxC+eqJ2JEPpN8X2mu2QZBnQUx28GnusOiQpzQm
	x1VKnIpGT+TY+Mw9XOEjOjODlZtN71Cz2JXWB8mP3yz2che2vn+lZH2EEYpAmBeB1s7S5ZHfJrG
	3pojdQGqWrUS4qsFmFZXoK77q/aSwjNUv6+H8Zrq9soDOfWGhnCRNtzVL1DFXEk=
X-Google-Smtp-Source: AGHT+IGx25UdEAzlmqfQKTPAu3rI0FpfbMxJfPd/PkIc3VTClQaEGNZW5YGAM1Nh7zWb+auXSU7+sw==
X-Received: by 2002:a05:6a00:10d2:b0:748:fd94:e62a with SMTP id d2e1a72fcca58-748fd94edb7mr1182029b3a.1.1750312013191;
        Wed, 18 Jun 2025 22:46:53 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748e86b5527sm2820713b3a.86.2025.06.18.22.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:46:52 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:16:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: rafael@kernel.org, robert.moore@intel.com, lenb@kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linuxarm@huawei.com, jonathan.cameron@huawei.com,
	zhanjie9@hisilicon.com, lihuisong@huawei.com,
	cenxinghai@h-partners.com, yubowen8@huawei.com
Subject: Re: [PATCH 0/3] cpufreq: CPPC: Some optimizations for cppc_cpufreq.c.
Message-ID: <20250619054650.pl5ase2l5juu5pm2@vireshk-i7>
References: <20250526113057.3086513-1-zhenglifeng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526113057.3086513-1-zhenglifeng1@huawei.com>

On 26-05-25, 19:30, Lifeng Zheng wrote:
> This patch series makes some minor optimizations for cppc_cpufreq.c to
> makes codes cleaner.
> 
> Lifeng Zheng (3):
>   cpufreq: CPPC: Remove cpu_data_list
>   cpufreq: CPPC: Return void in populate_efficiency_class()
>   cpufreq: CPPC: Remove forward declaration of
>     cppc_cpufreq_register_em()
> 
>  drivers/cpufreq/cppc_cpufreq.c | 59 +++++++++-------------------------
>  include/acpi/cppc_acpi.h       |  1 -
>  2 files changed, 15 insertions(+), 45 deletions(-)

Applied. Thanks.

-- 
viresh
