Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A444C29D0E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233128; cv=none; b=fd/mRQI22gBsM3gTNRWb38MFQT66BIfJxjvGq667E7F/Md+IF4Iwsooy0jpzjaRRrV3+aoMXbQqrAI31nI4Nq8TL5NaUpgbPYOoH1riDaQGtL50oaJD7BT++MqtyTbuFlXBcVVjyp+V1jbjWPfQWXwtiFuOA2rv/6ytkomleYek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233128; c=relaxed/simple;
	bh=+0MPd8esne8GaOhQJYv1aLbJ4MXyJXAMmqMo9igC/ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljdr+axpyaRBnDocz/OkGbCcQcVQ2kvNNsmPrDv8GUNIe4jeQcAUFWnhuAyFy34xrVwOBkvfx3iQzekeJaOej+gU/Fnglmx9KPTxWAdTWPX7oqO36R9aEvT1DPuP3brcAor0fZt+/AQms7VmngmPnGK1CPRblmEFs0r5r9iD/k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RkJTbKkn; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RkJTbKkn"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so3457161b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745233126; x=1745837926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dpDL9p5aNgl91SCF05ObEwkxd9LU8WN2T/wRhZzS9wU=;
        b=RkJTbKknn+OJkRXkhxi+24SSWhGhhTWC5dOH0ICKcBwEzdgiIBG33IRTOn18OTDpBu
         t44k/Iu2Fi1EJDKL/sOW8ZR2zqA9shDMHuAvszo1GuxK6Ipbj7e30Q3kjF+i+ZZpYceN
         Y8SZkLa+vZkuZt/D85CLsf8jZ7tfIbADa3J2QV12BumEMwTNBtkfPbYhd9V8j2Mlothm
         4sD/zRJm5xByvUezokhR+oWG4S+yyUr0aufGqILchc7r6DeAFhlGdUyb9fhjtWrcH2Zu
         Ysy11plHAQxnC7yZWUi/oTaipJbKGRQt3pwIlSXmQn63LQaidN4NVRaFPQNKulGv+h21
         xzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745233126; x=1745837926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpDL9p5aNgl91SCF05ObEwkxd9LU8WN2T/wRhZzS9wU=;
        b=SMILYKV1KoGLOW3d/Oncgm0Hy/WMCPPQ7nEvF/3x63mvCTNMG/b8dbY4PNGXKT/5Yq
         XGiqW/ycb132JlanYX5729S9hYTdYtVZIVNL6bFrEe/4bbGnl4JXw1Nx6E44DpK7aOj4
         k2CmK8+clUnUBeTge/m1yvz2Ghq9ozi3yTtw6tkOE1aTafNLJ70TSgH9Ljb+rLIW/WOA
         mKVHPvf3p38CS9vtpgC6fNIk1cPtroXZZAnxLZFUuzDY1Njf+E6WOEZM93yOYNLcS30m
         ZJedj4TXplJ4pciUdTHNezXn5zefslAnlFNbuoj+xLKFj6oD06Rf9jfKHR4sr2+vZ2l/
         3PJg==
X-Forwarded-Encrypted: i=1; AJvYcCXZffB9USi+/J0JfjERlzcdDj/UOTOAXVqj0X7fgB9FtYr8kBTfSjdk8twykcexTnLwSWYIFfd5In+/U+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA1XuS/xp4Qwza1bca2wOCJZVWFgftyce9PfTVI21I7sG2fuqu
	Tv5RDpD+8451TIALgwVV80uZfaC/YIcJhoVHtM1B6HQzrOXq6MbVcxQdea3MDxc=
X-Gm-Gg: ASbGncteY0XTnHmUgw2VCis0ZRMsbk0vlVU1hPFGO92lTt7MvXntopJpmyhDaKNL03U
	U5bwdy/pW9Yzzr6wQ1v4oRZN5BB+SGfVEUa5qnIPvol45HxoDga4xGHvA8VB8ZhwdCWJl/pVoif
	Ns7GokBLHANXBOxkwU4e8k4EuI8LwUT1wmZO1CAC/wfalakoo9hZfwpGs0HYCqXd+LyAyX4DN0g
	HpTeAKzs9sKFKXFPxb7mynMVMl65cLDRfvKKIoDWB6TRwfZt8naHFHvhjEzSSoaiVW19KzrIRFE
	27eAhRf2i1XsXQNA78pOgzd6girVisl0k9nEcXXa7A==
X-Google-Smtp-Source: AGHT+IGrFaUMFTf0LtqbvFpeCf5IlX4Eo/WbINxiduuCVDXs/QnVAkFFQAF5W4OPmARlvmwlQHFHgA==
X-Received: by 2002:a05:6a00:e8f:b0:736:6ac4:d1ff with SMTP id d2e1a72fcca58-73dc14573f4mr16876474b3a.3.1745233125904;
        Mon, 21 Apr 2025 03:58:45 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c06bfsm6279722b3a.9.2025.04.21.03.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:58:45 -0700 (PDT)
Date: Mon, 21 Apr 2025 16:28:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cpufreq: tegra124: Allow building as a module
Message-ID: <20250421105843.rxgctjw3jrkwuxsd@vireshk-i7>
References: <20250421-tegra124-cpufreq-v2-0-2f148cefa418@gmail.com>
 <20250421-tegra124-cpufreq-v2-2-2f148cefa418@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-tegra124-cpufreq-v2-2-2f148cefa418@gmail.com>

On 21-04-25, 03:13, Aaron Kling via B4 Relay wrote:
> +static void tegra124_cpufreq_remove(struct platform_device *pdev)
> +{
> +	struct tegra124_cpufreq_priv *priv = dev_get_drvdata(&pdev->dev);
> +
> +	if (!IS_ERR(priv->cpufreq_dt_pdev))
> +		platform_device_unregister(priv->cpufreq_dt_pdev);
> +}

Ideally this should undo everything probe() would have done. There are
a lot of clk_put() calls in the error path of probe, I think they must
be done here ?

Also I would require an Ack from Thierry or some other maintainer of
the driver to get these changes in.

Thanks.

-- 
viresh
