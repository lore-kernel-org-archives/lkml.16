Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5587D20C00D
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 23:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738712461; cv=none; b=I5yDUB+SJ8OyNkBqcMvbz9NPt0C6cdwHo0JAAGvEOnS6TLZVBWTFxAu88WChi8nQHsEQKKYeZeJQHulRVTYTTJZ6gRhRuMxRJVNpYbPhTpq0dbIbT1WJtHWIQV1aPkmFYXAY8XxVZZV1iSwh/a77S24/r5Qb+dWLbM/NgbaNENw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738712461; c=relaxed/simple;
	bh=xNWF85pDr4+xBoLRlJq3hULFJcv9TwBGp0re49+DjQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMNPE5DFDVYfp4nIG7kgsfv5ESPqEVQ/PwZGnUOpxUOt6t1dZumDVbtY2M5BGHt7PTJ1XLPMrbHghtX4hrvWGx7R2yoROKtw6OBdcVJ8RS7NOnfOm8qJt0Z+yunDg3wfhIUmYAXe8GrddVK2FhlJYDsah/RPqxwCROazRZMxgjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OjG4DoLK; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OjG4DoLK"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54025432becso6477118e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 15:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738712457; x=1739317257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXlvd/4s277O8sJg1sChY2UAj1tE+2LPMkXAQD6QJOg=;
        b=OjG4DoLKeqHmwtpSXkYzsoDBCEojK6938gWN8BXUoiFVxDE0gO6hQS2R7NoTEHKNCb
         Qd/cogzesxvq9xGPjXCe1qsfJu6wCbFHT32QMzpTH/CiCl+6mL2Pqcfke/1ygqrTh9kh
         MvZfkbuDv2CAE74zFIPzKTfeWPtIdZvU/8m7d1dOdJGnwVCXsulqS1HwP43Df0Zxs/gk
         ecJpkeyZVwxpZIeVTss6yo+b8KHKxQeA9gVW9JN9ARFT+VjiqyHJnzCnPAT8BBHAW1xK
         fMPAJqK2X8gS8anxY+AoDf9c3xA2JG85pOdOQ9cyqSmU8AbGlDqF4Nxniv+jEnaVQKVp
         tWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738712457; x=1739317257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXlvd/4s277O8sJg1sChY2UAj1tE+2LPMkXAQD6QJOg=;
        b=dpUnl0qiZF1RjfZ7nM+YS3HDUdI/0SvYaMJsO2DnZ88pFbLI485BFEjXeJ1cZ6a0uu
         Ludp823mD/CfgOSdsDvhz3+T92yHAAFtytoqYRG1TEGWWSzE7QvQWY/p9etEEfwEFEYt
         fYyR30ENMe8p8Y6nFlt0odggODcgCOSAcqhamk7D8wNUAbRY0Gc2zAwmThEN03YcYa9P
         YJySxIqBUWeSp7WRtR3wqSmECR5SjbksgfpCay/ulCy9qeCchUqQiNvYE3yXnge36V3I
         YF+DsYFOt8knKhBTjSD+TjZHm5hPftNqc3XYr3uBaACe4sjCEPccNkJgEWLFJ5BuSAvs
         TZAw==
X-Forwarded-Encrypted: i=1; AJvYcCWmVkJXmS1zoBnltJQFQwHWdp7ECSZBpV942/6JcM1zQNzkBE63HgGQ7GN3pCB7hnv/6it5ToZKQ/unkVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwByv6iBTnItIVe23g9a9WrkeEBxSL0E1LYVyRX9gZuQP7ml4MQ
	DzQfpHS48YIuYLhq1J9hVaTwKWsA/Fb3hgfQXOITCSrq2xUFCf3Q6ywoDMMHDGE=
X-Gm-Gg: ASbGncuqz0nNWlyJO+mI8hjKwHt9C2c8prMS98uzIoWhmRhEQI96uyccej0ZwQOyxKD
	a/c4Zq7qI61oNQITTXU6BwfryQwibITnbXIH1J5vw7Oq8cljkiwDJbW+7dYkTy0MW0Wp0xcRO0e
	/4Gw+hrOx7K1Sspe5gXC9mYvoxKl3S9VIcrTk1+LiJr3b1IPzrrsQQIEz3eehEgfwT7UNXrlAbZ
	+ppHlBFLalFqmJQUt0mT7r9oJH5LjDlhmGU311HOMYD2PEFUrSdOsTe9UI6enFxlf0z+Gj+8uG+
	ypCsJ/WQcNMPBrQCwLJwdaGHtRMiFF+KgQy/sCod+oen+ZTAwaRoxq2ZIQAp5OXBWlbiDbI=
X-Google-Smtp-Source: AGHT+IHEzXTAlRuX8+IIVfXALHdW/BAW9a8mxr7wK4XkIPEw/mvPumPoh0/pqNfSCsa9c8jsyssN5g==
X-Received: by 2002:a05:6512:1189:b0:540:22e0:1f63 with SMTP id 2adb3069b0e04-54405a1075bmr142615e87.19.1738712457347;
        Tue, 04 Feb 2025 15:40:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0993sm1694460e87.132.2025.02.04.15.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 15:40:55 -0800 (PST)
Date: Wed, 5 Feb 2025 01:40:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] nvmem: core: fix bit offsets of more than one byte
Message-ID: <tgttk4pxzgsv4g2r5k44k2mtbh27cbpwth4xuj2okulucodei3@7g4gotk6z3cl>
References: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
 <20250109-sar2130p-nvmem-v4-1-633739fe5f11@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-sar2130p-nvmem-v4-1-633739fe5f11@linaro.org>

On Thu, Jan 09, 2025 at 06:35:45AM +0200, Dmitry Baryshkov wrote:
> If the NVMEM specifies a stride to access data, reading particular cell
> might require bit offset that is bigger than one byte. Rework NVMEM core
> code to support bit offsets of more than 8 bits.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/nvmem/core.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)

Srinivas, it has been almost a month ago, we are past the merge window.
Could you please review the patchset? I'd like to understand if we need
to spend more time on it or if it is fine.

-- 
With best wishes
Dmitry
