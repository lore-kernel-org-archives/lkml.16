Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AB725FA09
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 06:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092440; cv=none; b=VHv05yfdYhRph66trwF0Xbq62g+a0Q4Iq6C4mKHbbYZtxCg4DvuIzFxvRJYt7+ESDHuZ2uA5pHuiSXiN3Gl8UAZu7aqhX7o/c7RYri3ikf3y6BghpxD5OabJM1R+XydeOF4n0I1Eov8L4TeY+7EA+Nphqt8opO9QZ0lWkFbhvu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092440; c=relaxed/simple;
	bh=IZTl+be6ud5vXxSsFfPgI+uEe6tuUzj3sdGtdEkb2OI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9syizziY8PJIa28rH7yonip5c2JjIfJorsV3m4gwbkqTqNovexqgPsIOg+JnBXt8JrwWIOHJWJux5ZGok6RQHNXAClaeeA0GAE6Rz4dcOQ3qBktubafnjfLQsogh1Ki6pVXFSRqHkDuqTI2bUavw3NwNrSlQCxTPcJ3TS2odGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxFh0fsa; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxFh0fsa"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ad5236e6fd6so4675154a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 23:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744092438; x=1744697238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NBGLDdhiF5aE7vXhYviGOMDmTQe40kjk+O0POgM2zRo=;
        b=vxFh0fsaCkNqSDGygTp2fEehPri/aCWhqMTbRjXe5x5wvbt7vx1RxTu7VyJJgHW7Y1
         wx2Vx38Jhhs1S7/9s4RqYaS2FSfwzTUwZ8c+bGTfwhPoC1cigNFpbU+fPEAB07fiezzn
         c4CGHHB5H006UrQ32VKwOQma6rrD5hTLGjqaaY8XFgry3K/ZLxja6+g1UcZlTJ7AJqJ4
         jhA2Ws4C7T6ifcH7Qsrw4/HxHmP401dreikCPBUg/kjKxhZ+BoagDlk3Rpa23aENSjS3
         b7tDTfK3egqCEpK0z+tpOw3M1g6itiHr4V9qmBZFOP7HbEwdoBXaNIzk/TZkoWkkTzFg
         8Vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092438; x=1744697238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBGLDdhiF5aE7vXhYviGOMDmTQe40kjk+O0POgM2zRo=;
        b=ljNRRZyV+3pr65jQvBvUE9OpZ/z+eWr5lqO184qdU69PuT+HJKGOHaZfEihNhU79CY
         cGtieuUvIfl8s56q4g+Ik6fzIkHpYP4cw0HXa+m5ZcQUpfh9rEmzFsOEq5PsqV9/pN++
         UOJhA5GO2B1lE2aFlL/eGrVJ3RntDmHjaQKuD6YXYF5RQvVtUyNr6zs5sxW4FzTuklKR
         rVMpQuaZ/kpDRmyLIDxlxZMpwRJ724hYxwXPV7/cOxZCVLQstGZBpjYKSW+mPDYmWHk7
         Vd8eEhXdDIxPwJhV4G712L77mSpHqFZmITsVyJsLK0h6GroVbf3PAqLO5XXXw+WJY/w6
         KuXg==
X-Forwarded-Encrypted: i=1; AJvYcCV19agr03v4Z1d5t4huRo1+LSg1eLHZyqI4r3ty4GSd9SXT5u9dqFWxw3GfQDYC4RGEk4166nJ8WEiZgTM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3rKFFIL6bLIZhzyLc0nrue+ee/SpN4iMhAeCXTMenT9XOvOE7
	/lGwTIZH1eMvJsmY513Q/5yy91HguSzuiws708DGPczEbDBbtNJBCNXdsc/XNhmiOG3K8nst78h
	8
X-Gm-Gg: ASbGnct5sgLDkGRDl4/M8NGr7yYFGxFNs9QAOEkSjO1SfZUim6yFmbMbjglyW5OrWfX
	FYFmQjlV/AC4t5cQiU2sWe6hyYiQlMuFCVNbJEiFLwGjPRmNi+I1v+U75swrcdOwX5DYISmeiLR
	mLXHbXNYmyiWzBiT/dsdGfokG2IgvdRe9bIVbpM1ulSFp6XNsjOVIXpAxi2kZ9GWFmtE7IUuITI
	6Y8zpX59b1iiGkxKxlWz4IVw9jHXtdbktIxq9iYFu/3/hD1lBdnD7BSuejWwNtkjq5Mp7fDo+U6
	YriBOg+XG+Neeh3lJGEahE9M0KKLPUWHW/ldURrF1HU5mw==
X-Google-Smtp-Source: AGHT+IE8Cg6jbtSztbs1iW4jULwFaA3/Qy5eM7ju9iiy7eB85QPmdcFakGFBd2iR9jdJ7oTsswsgPw==
X-Received: by 2002:a17:902:f683:b0:220:be86:a421 with SMTP id d9443c01a7336-22a8a0a37b5mr241406085ad.38.1744092437914;
        Mon, 07 Apr 2025 23:07:17 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787727eesm91813665ad.224.2025.04.07.23.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:07:17 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:37:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Add SM8650 to cpufreq-dt-platdev blocklist
Message-ID: <20250408060715.r3tentoom6r4rkzt@vireshk-i7>
References: <20250404164219.166918-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404164219.166918-1-mitltlatltl@gmail.com>

On 05-04-25, 00:42, Pengyu Luo wrote:
> SM8650 have already been supported by qcom-cpufreq-hw driver, but
> never been added to cpufreq-dt-platdev. This makes noise
> 
> [    0.388525] cpufreq-dt cpufreq-dt: failed register driver: -17
> [    0.388537] cpufreq-dt cpufreq-dt: probe with driver cpufreq-dt failed with error -17
> 
> So adding it to the cpufreq-dt-platdev driver's blocklist to fix it.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 2aa00769c..a010da0f6 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -175,6 +175,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "qcom,sm8350", },
>  	{ .compatible = "qcom,sm8450", },
>  	{ .compatible = "qcom,sm8550", },
> +	{ .compatible = "qcom,sm8650", },
>  
>  	{ .compatible = "st,stih407", },
>  	{ .compatible = "st,stih410", },

Applied. Thanks.

-- 
viresh
