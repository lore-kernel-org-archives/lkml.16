Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD44D1D86F2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738579696; cv=none; b=VGtmLt5LmaTdRi63OK4zi5cKmno4KrbIXDbouH/DodB/hDrYNkPzPOQiwf9CgaEznXu6UEHLN7b2ZmqUsPTUmkLREYiSa74TEBJHQBn/kujv7h2YQ7PNFne9ICccMkw+i5FPa31leUtoN816VLjxRZQ1m0yZfaFgnG7KhlTh+Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738579696; c=relaxed/simple;
	bh=YftWJvMEiCrtU5t0NNHpr/TqaN2EQ4xndBtIueES2+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2bE/+9f9lhN6NHtA7puth4zwx0FZ89BdgVEVWEanmeY8t/ljWCqkPvnbPRnI06N+72xNsncSqc1qAv/zuq4GH+rvMAbe9q7+VlbQ2UsilUsb828cXpbupWQHbHDvbI/Kow31EycKpZq0HKIBbaS8ZlQTq5mzD4fAy7CoA98huU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QXMWhBNU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QXMWhBNU"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21628b3fe7dso74297295ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 02:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738579694; x=1739184494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gF2Dk3poPY+nrxVh06MJWOuCS3vPdRofLnME4nsAnhM=;
        b=QXMWhBNUdyF5WG8oFyXRS9wizW4Xb/X3WMlBpz9NShI27ay70yuPhkEGA80Sc8LeDW
         yEHuwB6C4qlLWpxfJ4YYxwrRRqFmVT0uMTAxfU2tXEhgZrg58aoO7EsTkS601VWlAvWV
         5Wm/uLsDHjwFgilIbmG+sz4wK1HdWORxCxG01TcWA1zcvaGjhFx3qZBq2qxhwMDL9Ghp
         orCDpSu1AQhsLPK/Xcqv0LdLVu6QHiD70zT+oyCbqlCa5XeSbimMQqBCVqmhB1Avn1Dk
         79Nz/s1+EX5d2ZADDbZ4ckmC0j+w5CzKpqkKNR6Aj2+oGH6kC0g3NJw+3UZl18a8rOK7
         bdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738579694; x=1739184494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gF2Dk3poPY+nrxVh06MJWOuCS3vPdRofLnME4nsAnhM=;
        b=X8NGDv8OMkpviUx9hO5mDObML3dfO1aYgiZV5+UChzRp8K1dNtL1ndao1NLysBVxrI
         i2o+54X/GBhiQ0SYnzDK9atet3jSc7R4MCCPwL7noSI56VzVEbX0fu/Z9OfZP5ZJn14u
         WA9ieHPdjenSCfNIGcx1uqDRrriSOXKGvjyD5RCAY+PdCsqowuXpirGH/HzRjdi2+Z6L
         cgHucmJ+Gts6UtutV3WE2Q3w6WXAgfbsycUpTEmcy07uR4H/YmGBxP+KVdku2in7nLcU
         aMisfupiGYFub3DTLfyB86N0lxvKCnDLGoQn71z3WaGUSwPYCi6DtjCV9kg3+DqRzTvb
         MMVA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ekazm3b+8Egp2JQeMiSSL/HoO5GryCKV7z0sZhJWT5/bsBhHuhktUbOm7IwQHFSoIzPB5FO7gPaQ2Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWRxmiQFVExZOZGmXo/zNCBCLYgwmbK5F+XsgLSoR8Avo8HxfC
	VY3Px2EC0sG0TCSwNc/z660/Ikzowpv0qnlKEUZ9R4GAaJrx2QKISE6iZb85r+g=
X-Gm-Gg: ASbGnctQhSspZR0dB6+k6sMerYU1L35P90ea8hKDQrS58+u9jqZRC/Mz/7N+yU8klWU
	x5RVW2cL0ruSKXAaS1E7uA5OyrlYYGbLH1Ss1Cc7ybYcLg5mU8Rti/OYmX9KhwEqk91g3Fw5CAe
	keNn188VFUTA8jqWnpIpynR0RJj6QnY3Ig/QJ2lwEzimbFasmpgL5/cflVVLaxkxYtRH7+pn/Qf
	WDgfwz1/DPEpv4ZzoIZuh2eXGR3pGWAbnsdwUamkmrjRbXn9kXyIBsTtyXUwu8B8KyJNt3MmkXp
	SNJliFDJUmYjDzvbTA==
X-Google-Smtp-Source: AGHT+IGvgmZj4iMs//4PywYkmHglzukdY/RJQs6+MV/dRwLE0yHlCexXqr6pZLgRoeNoE22HgiI4WA==
X-Received: by 2002:a17:902:d483:b0:216:7d22:f69 with SMTP id d9443c01a7336-21dd7e04887mr334779115ad.50.1738579694119;
        Mon, 03 Feb 2025 02:48:14 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3303f74sm72593165ad.201.2025.02.03.02.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 02:48:13 -0800 (PST)
Date: Mon, 3 Feb 2025 16:18:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dhananjay Ugwekar <dhananjay.ugwekar@amd.com>
Cc: gautham.shenoy@amd.com, mario.limonciello@amd.com, rafael@kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] cpufreq/amd-pstate: Remove unnecessary driver_lock in
 set_boost
Message-ID: <20250203104811.ccf3pj53cjlhwvti@vireshk-i7>
References: <20250130085251.155146-1-dhananjay.ugwekar@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130085251.155146-1-dhananjay.ugwekar@amd.com>

On 30-01-25, 08:52, Dhananjay Ugwekar wrote:
> set_boost is a per-policy function call, hence a driver wide lock is
> unnecessary. Also this mutex_acquire can collide with the mutex_acquire
> from the mode-switch path in status_store(), which can lead to a
> deadlock. So, remove it.
> 
> Signed-off-by: Dhananjay Ugwekar <dhananjay.ugwekar@amd.com>
> ---
> PS: This patch should ideally go before [1], as that patch uncovers this 
> bug and actually leads to a deadlock when switching the amd_pstate driver 
> mode.
> [1] https://lore.kernel.org/linux-pm/e16c06d4b8ffdb20e802ffe648f14dc515e60426.1737707712.git.viresh.kumar@linaro.org/
> ---
>  drivers/cpufreq/amd-pstate.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
> index d5be51bf8692..93788bce7e6a 100644
> --- a/drivers/cpufreq/amd-pstate.c
> +++ b/drivers/cpufreq/amd-pstate.c
> @@ -740,7 +740,6 @@ static int amd_pstate_set_boost(struct cpufreq_policy *policy, int state)
>  		pr_err("Boost mode is not supported by this processor or SBIOS\n");
>  		return -EOPNOTSUPP;
>  	}
> -	guard(mutex)(&amd_pstate_driver_lock);
>  
>  	ret = amd_pstate_cpu_boost_update(policy, state);
>  	refresh_frequency_limits(policy);

Applied. Thanks.

-- 
viresh
