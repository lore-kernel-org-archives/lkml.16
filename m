Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC39826F45D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647090; cv=none; b=MfzxYn6g6bgkIgwHJ7CxdZbx5lYU6iVqWjm2iX5uMpQBTFIrFf+zzABcc9icQHSWdONIVEwS/Qt2gpS6tp6UQ9ZwcGhpEG2GotxRp5OfUd/FNvepToO3tkrGd9WFMA17a/U6d4f0cIJa19VhAhNLIFonzc2Be7xGNEG/16eIG/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647090; c=relaxed/simple;
	bh=c/wBlaYM4RSxl/erOHhMdSWmwIe8Uwd04Sjt8QeJ8/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=La1kvfRMD0MDT76QHFPVD3iFngyMlCKp32QxVhfJhTzzeo46mU8PkJfPQNU9GjouIOgk2MAeskFjBXy3utqZHanhtc8A4dWKD9knjpUwq7whq/eD/lKSJnT3ypF9MVFza5vwKib9/yJAepViB7wLxnfHUYtN/7zuGhmP6dfrf4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UFpixuAd; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UFpixuAd"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22fcf9cf3c2so34273055ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747647088; x=1748251888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bvQ9YmGROOXrG/iLumMa04WB7ur/2tl9ZFhlSZDT+Cc=;
        b=UFpixuAdc+84m/oLMFEg7ktPLRO266iv4r2R61QJuK55D4eoz1BmICqbBnY4w/iPIF
         q5QcoIvX0Mef3IrqKvsvvxwx1VewXlyhpzKpbeWEVEUD7pqrygZ63rdvqR0XnWyLj1xC
         UV69s49HaJnmqDLoU8wsDXiu2aG2Zfxg3Em/rUGKQ6GMfjrNk2ZaF7mTvfFMj0wTfcdK
         brdUJerbFXyfT7pWp8uB9tWXlQwO/8XXCRTGc4l9+ClBBZLPUD+DEG8JSwRO2YlkIll5
         2m4xkgjPvV/wSxN62rvaXEhAtyk7+5k+tQKxq2N2ClK/uK+iEpIpmbG4grlBq7N9iLL9
         HswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647088; x=1748251888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvQ9YmGROOXrG/iLumMa04WB7ur/2tl9ZFhlSZDT+Cc=;
        b=thUqpwQzO1BZys6dJQ5YClUwrOcszypgmbX/3JDVEoUaa/hCQHlkuMnxZukCoHrqjq
         wI3nfXxd/iEB2BSajbXFnfKduNp7sgPw5wc/gMkQMTcbrVpLkNGe5aMylqBT0JVfgdzB
         4Xqotiddehf47+vQbONsfdG95I9GLwnShmXC22YMkyPLtCuf5ddJZGE/psIXShdkYwLn
         TKFTSvsH/vSB5uNgJIH8cJIWKxI+apWQfPt6yyVjeZr7DLthUzWsjwmWF4ydkE7Bh4di
         82MtIuPq7dHXmIqDQyEP4n0H9b9xdlAvf3xfqbhHl8z/8jY+eDZqSaa6t+I4Tlfy5VUq
         ZrZA==
X-Forwarded-Encrypted: i=1; AJvYcCWKcovLr1zHJAaszSr46Q1eQ4My0N2KKmlovjhX0iqpP+LmXS4cEXFdxHeou4gI2OmazbAiwMm671bMp4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoXphjppcN0j06c9LJKGJwiKgZAW3vVk/acyhjfbKIgjYpzAXJ
	2O+udEX39MHhBbZMl118UUbywkHxsTQy8hQiNxz26Pfwt4I2LwDDS/LPypv7WR+IStI=
X-Gm-Gg: ASbGnctxGS+4hC/4QZQawXVc6PInUgcvDeGnU1mHokHwuGXE4zdPxy5VbLWIWBwj/k8
	VoojQHJ148bjjTeipU+AeIU4M0nwjBCD7aTZWy0Sjm60DicxCVUM1L+HRBGSncdJLABoado61v9
	cTkYk3beWJB16nxsPv6kvGVhZxgnaZDp7FcfdPhBGDOasKJxwN+tZsQl2O6KciGlN8HH6/1RNal
	oQzYpfQbDmKicJFpZhdm/gbYfKd+SRhy4SDoF2BhaYyJj/ty/EyKb0j2MZ4zCltZQWWTtVmTDVr
	tL5ja+v4v8DPgk1KJbiOPm3Gxr16pkQ+l78Ky1Gdf7JWJjQimnkC
X-Google-Smtp-Source: AGHT+IHQejNmLqqvXox/EeoAuxX3X7m8LUs8KU1gDcylEBYdUF9gjHc0zecpPmtgBo7FvB8Kzn20/Q==
X-Received: by 2002:a17:903:2f47:b0:224:376:7a21 with SMTP id d9443c01a7336-231d452d0bamr162849905ad.42.1747647088089;
        Mon, 19 May 2025 02:31:28 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9567sm55776315ad.11.2025.05.19.02.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:31:27 -0700 (PDT)
Date: Mon, 19 May 2025 15:01:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
Cc: rafael@kernel.org, pierre.gondois@arm.com, sumitg@nvidia.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linuxarm@huawei.com, mario.limonciello@amd.com,
	yumpusamongus@gmail.com, srinivas.pandruvada@linux.intel.com,
	jonathan.cameron@huawei.com, zhanjie9@hisilicon.com,
	lihuisong@huawei.com, cenxinghai@h-partners.com,
	yubowen8@huawei.com, hepeng68@huawei.com
Subject: Re: [PATCH] cpufreq: CPPC: Support for autonomous selection in
 cppc_cpufreq
Message-ID: <20250519093125.jn2naozcsrroahco@vireshk-i7>
References: <20250507031941.2812701-1-zhenglifeng1@huawei.com>
 <20250519081850.7ycbcw56jzpiwkth@vireshk-i7>
 <4c4b0140-9126-4586-92f8-f7c9fd7a4a34@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c4b0140-9126-4586-92f8-f7c9fd7a4a34@huawei.com>

On 19-05-25, 17:29, zhenglifeng (A) wrote:
> cpufreq/policyN/ is linked to cpuX/cpufreq/, both paths correct.

Ahh, my bad.

> It means Continuous Performance Control, you can see that in ACPI 6.5,
> s8.4.6.1 _CPC (Continuous Performance Control). Use "_CPC" might be better.

Okay.

This looks fine to me then, let Sumit reply and then I can apply it.

-- 
viresh
