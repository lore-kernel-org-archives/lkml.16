Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8727F1632F2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749517046; cv=none; b=P533tdSRO/5Vd4Laq6RSepZ6hVEI4ctQYfNDAMUSF1TgUw+0e0fD9TDkhe449WMiw31NPcZHxQnEXjIICYctbSXZb3YGBDOrfC8EDVFGKkkB3xbmjvmHlzl0zWW3Jp512yzPDHmoewQg7CLXTZPcHtuzmU/B0YsDXUwbAjKbxQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749517046; c=relaxed/simple;
	bh=p/XSuCXGPS17CXVAw4xGn4f5MNxiAyBtMTSqDEOx0Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QV+E2gw82HWRqbo6fgItpkHWXMJHXYyCxMflTsNhMHvD5IEvCgRfKNFEHZ65JLX83Y7CqH5PziasU2AFZATMgljcw+vQEa0Kh/5pXvTJdY+ta4EJi39/+h+/MQiwX0GEW7+WIF3YndCeKuS0BTZQDXICaRQhJCVmlltzayAuXRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VF3IiZpN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VF3IiZpN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23508d30142so63810425ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 17:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749517044; x=1750121844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1rQwYkfS8VPR2HtcdFz5xQMJ3QnFjshutUNq6gvzdg=;
        b=VF3IiZpNvMTJUqVh9zt8gej3e418SoXcYMYjnpSL8WMH0T5gzjlJ1E15IclwSg/Gu8
         usza/+6sciwnszxi1CrMpMJFdGhkoORyZCgu7FqmP4vs+YWJazErjeAZ/tIs9LcvQVKu
         Rh9zYVRAjNHRf+1g5t7Dzw3EGdG5q2Re5ASeUJzLhDx1duJ/z6TtWZUiIaP9Q7zAGt1I
         r1hfyGUb4VNxCVDCZ/DmCJVPaQ6pyAG5GXf470FMPLT8qcMssbq0/1fmmU8QibZFdafs
         oNFKrkw8+Xe88bcysKGalbErpkWv95o4KglkZY9DhN6ZjQBDM4f/0YjPGEojJIMdsIa0
         5UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749517044; x=1750121844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1rQwYkfS8VPR2HtcdFz5xQMJ3QnFjshutUNq6gvzdg=;
        b=uF4GpM/PhXB+UinZlHC8BvJ8LW0yP3zKog5VkvkHd1dUI5TC1G3L/WyRk8KNinYqbB
         prqPeEZKPGOgjidbo3RS27bvtJw6I7jl6sD0E6mt5+/mHzIUT5SsEm83NEn2/SnASz9z
         iQUkyAEaU0KGQ4Z33QMux8tephVzrSIoprxM/eRq6SkFZRRcRV6rzISYRKypqqXxuJ8H
         KHb5PUffYP390W9AkrlOSfvQB2YGYNKyydeS2ouGILotVEVkqzaT/RgovCKn4siBVWS/
         Lo5gVGlsJrrGFejKXxlT97fee2qW1F+8XeVquqw/Fw6dmhCANaDZUsW3LFF5Ti/Qc2aO
         /J3g==
X-Forwarded-Encrypted: i=1; AJvYcCX17k1uTStGaqRlQvwFz0dRMeBtyKQfOHAFrqylwfiyK6TFOb0NstF5Sz7++hgvZxCOarrpJ8xfsQsiIlo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym1EeGj4zz6du1sM/RmKVP3CrH+yPTVmOFaJDRgMaDfz7CC6SJ
	G2rwiILP8c/raURBob8ISsHfx+oHAr6w1lRvSDRULge7ckHwuc/ULKPV4nX5OPaCMvs=
X-Gm-Gg: ASbGncs8xpv9JF9A3+zeW4mv3F7ICykojvpnuwpZko5LG1vwFZryjBDnnzG74c+EZo+
	2pZax1eBFWXQVI2VF8mxpox2ZqKLF4NpRMkQgm1Hpp3vNAhZI/ErH8dlJdbfTHVWapriWisCpw2
	aP7Q6v3xOyl+bSq1UtmDvD87i8yIdkjS/YWHpl13WvM8BhwVO/3wGQWjdmcHoVVUREjn+dk4jfX
	w5u9rWkeHBn9jnUi51xFD8HC1aZYUzQvYgzt7iNGoZd8otnWrJtItcD3TXf9+0uckkQE4tkPhtt
	vl1XcVYpW07SeRkCjEF7Evn1MWpCREVPp6YhZxvorPrtJseSmWTmzRSvh8JN9b8=
X-Google-Smtp-Source: AGHT+IEdl8eeFf7aJp3yaKtzoKAh6ceNn/qekzHSRC0NuzHU4sIrFSD+owbOXJVQKsMXXNVfTFyxWg==
X-Received: by 2002:a17:903:2c9:b0:234:d778:13fa with SMTP id d9443c01a7336-23601d13585mr206171875ad.26.1749517043866;
        Mon, 09 Jun 2025 17:57:23 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236037ae33dsm60076015ad.206.2025.06.09.17.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 17:57:23 -0700 (PDT)
Date: Tue, 10 Jun 2025 06:27:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: rafael@kernel.org, dakr@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, mcgrof@kernel.org, russ.weight@linux.dev,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	leitao@debian.org, gregkh@linuxfoundation.org,
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
	fujita.tomonori@gmail.com, tamird@gmail.com,
	igor.korotin.linux@gmail.com, walmeida@microsoft.com,
	anisse@astier.eu, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: module: remove deprecated author key
Message-ID: <20250610005717.kd32qk7jvrioyds3@vireshk-i7>
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609122200.179307-1-trintaeoitogc@gmail.com>

On 09-06-25, 09:22, Guilherme Giacomo Simoes wrote:
> Commit 38559da6afb2 ("rust: module: introduce `authors` key") introduced
> a new `authors` key to support multiple module authors, while keeping
> the old `author` key for backward compatibility.
> 
> Now that all in-tree modules have migrated to `authors`, remove:
> 1. The deprecated `author` key support from the module macro
> 2. Legacy `author` entries from remaining modules
> 
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs        | 2 +-
 
> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> index 94ed81644fe1..bdf4b844de42 100644
> --- a/drivers/cpufreq/rcpufreq_dt.rs
> +++ b/drivers/cpufreq/rcpufreq_dt.rs
> @@ -220,7 +220,7 @@ fn probe(
>  module_platform_driver! {
>      type: CPUFreqDTDriver,
>      name: "cpufreq-dt",
> -    author: "Viresh Kumar <viresh.kumar@linaro.org>",
> +    authors: ["Viresh Kumar <viresh.kumar@linaro.org>"],
>      description: "Generic CPUFreq DT driver",
>      license: "GPL v2",
>  }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
