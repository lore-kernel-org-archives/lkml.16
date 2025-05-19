Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C344C92
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651217; cv=none; b=YIw0Y+ls0l7uBALHUPj/jtGDCCxD6j2nsHaE0928GLNf5SMXGftRLO+sln9Krt8xXYyDPUsL7VJ2VEgA2f1/nkaEo6iq3PptK7v/NaAEgBtttaBuiRFl4GJkeROac522rnKaJq3ZGoFVgwCl4uzQUTx9X8OETjUwSA0lfX4c0/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651217; c=relaxed/simple;
	bh=/Vmq3QFqnBlwuwwR+4xyRvi/TqRMdnogscI2G00PWto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/bLm1hpoyfGEAyAn5CpPopQABan+BmFcxTjDmsH4tCVdSfVrXaScnLAc06BO7LtTSzxrniBCLcwG6kdBQ78UFZ59JRr2DE8nUWBObGK5HGWhDdFPtP9Ke9RkjRsB2tmlD0ZA7ZYYqotudDSbOi0+qd8PsGuA9uxhoZMupqfpZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kNqFJQy2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNqFJQy2"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e16234307so39270075ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747651215; x=1748256015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i/aIx7AvdzS5nlXdZ8v4o/L4Qip57mcjCKYS6Puq9LQ=;
        b=kNqFJQy2TEm5Y4Gjl6B5LCjDKKjoYIwMG4kwifLNNegw+vAfKCl/G6Y0CNZdq5Vzgs
         NKjA9BkTm/JYrfewSN2YtEEQDfHgH9wU0O3DgOE/VTf4vpGZluS71v0Up3S43xY1Dw6I
         CiOEd2sBKm7iprYQP8xneVLewfdd+fZoqzxqgOvxGqgQTw198u8DnWACUWWQovrSnpPA
         mbBuy2H9c/JcVEuoTbDqcKGC7dgxQvoovE7qKpGN6cATZFveG3saN/w1Gnnp6CM5SNN8
         NFjIN2YmXpKtQHLTWK5/VdH+J4z2HujBC4nGLatM1b6PndOufWeT2kVG4VPic8nUKoak
         nOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747651215; x=1748256015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/aIx7AvdzS5nlXdZ8v4o/L4Qip57mcjCKYS6Puq9LQ=;
        b=KZuysEVCn+/7ZKhhu75lRakLCb1fR5JxpM4+8V7xHEwsOagUtKATE00RxF3cdyIJSD
         aszrPXgbaMuLMikUj1MBvWP/76WXl8+J6blF6eyVY7lXuhRs9voWN0rmIFg5kivR0mqR
         UVNy5eomqBF3zXTx1cp9ZuhcWd0A/HpoLz53W5nU3MXiVBjczxGdyYChRF5ASSiiQRHw
         ImwANHCi34HDuYP3YiNw0ze+QjvwYVUn6Z6Uzybj0ShlyaeeZIZfk/VVMQ6B1sFUXSXq
         ShBKwLKEVPz3QZbgN4bGdwLXcCmFB7PYcPOQGK1+oIZft6repr3agS+X8TpddhzcpwZP
         vUvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGJ63rgbJGg3akvmVT+0RWJTH5TrwfkoBdAwaWNp+GluShtiYxrLMwiw0+n79MDGqtZtU1bNIYFKOIRQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzePXAQusbFw+h9twMTBrPyDAt+m+7DMYjCAp11GgECdfsIxO/F
	N/v4Ft56pSLfUVzE/gTGcBQe5irtj2YuZYep/l8RN+Pau7bfDS1UCiSm2xQ6m+27lzk=
X-Gm-Gg: ASbGnctcRLT5CUXi14DBucdyIs0hRoCh6mLTqZcMd7tZrpJ++uHk+5OuJtTuuLY7d0p
	91hCevBnO/oqihGhmxOQh/NRfvYmpu9rflKrsNOkDbbfy1edj1/qqXjJnH/g8MWhNd0UrdllmhQ
	hCsGSeBkMo/wAWr9cj9JFKU/3/kGnSsVHWAsWabULQuoYWvyhO0SQ1quCMHG/a95z6B7St28F7a
	+n2y0+YAZbRrRtmPtXC1qsuf/BNp9+I8KgkBxVXS8mSoDXU8q/M6cs3iTktE+AsjVyP1xV8r7aG
	opJ2LxtB1Hcg08+TUtviB4PTDOHA/eF3CTMCzx1Pa9NbkRdMXGs1
X-Google-Smtp-Source: AGHT+IGV+/iosPw4tJfGLDNquYrwXS7YO+74bIwXmyBHISJk19CDoPFblHZ0P+89TKUcqBjFApznxA==
X-Received: by 2002:a17:902:c209:b0:231:bc7e:a54f with SMTP id d9443c01a7336-231bc7ea667mr160254935ad.26.1747651215411;
        Mon, 19 May 2025 03:40:15 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97fa6sm56235095ad.135.2025.05.19.03.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:40:14 -0700 (PDT)
Date: Mon, 19 May 2025 16:10:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mike Tipton <quic_mdtipton@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4] cpufreq: scmi: Skip SCMI devices that aren't used by
 the CPUs
Message-ID: <20250519104012.acyfoffelestwgtt@vireshk-i7>
References: <20250515035312.3119884-1-quic_mdtipton@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515035312.3119884-1-quic_mdtipton@quicinc.com>

On 14-05-25, 20:53, Mike Tipton wrote:
> Currently, all SCMI devices with performance domains attempt to register
> a cpufreq driver, even if their performance domains aren't used to
> control the CPUs. The cpufreq framework only supports registering a
> single driver, so only the first device will succeed. And if that device
> isn't used for the CPUs, then cpufreq will scale the wrong domains.
> 
> To avoid this, return early from scmi_cpufreq_probe() if the probing
> SCMI device isn't referenced by the CPU device phandles.
> 
> This keeps the existing assumption that all CPUs are controlled by a
> single SCMI device.
> 
> Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Tested-by: Cristian Marussi <cristian.marussi@arm.com>

Applied. Thanks.

-- 
viresh
