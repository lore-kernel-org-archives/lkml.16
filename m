Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A111C4609
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748851800; cv=none; b=sQda937HC6jgYL8Mq3HFExsnt2XajeHMjVdqTdpa23Tbb8xDOU+hz0uLAvLx6Wwx8sHDBylM+3hr4fJAoX2HfwW2obtR7A8ttVECKuq13Yr83oDgsX34a93/ih2yQM5/pxLmHq/pjeGl9h7fruSSrxvjQroXJT2453CsGsh2LtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748851800; c=relaxed/simple;
	bh=UxuN13PmIdB/x/BlClqWyqnfkQfE0IdtSqDqp9f4HX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRIzzq2EnOPWze2/8CrNPlv2/Vc1Ay1/ld6F0VQXrE2eHvM5TA57EiYPc+dFvsPnUwnOS18Gq43uca6mjedMhc/PjG6O2uJX1ueNQZf3H3DmOviWAEIb+LCEzBTpCA1FNnbepYEFrjyKmZLbeNuqZhEf5QIahS+m0f1KF/+HwSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvP28q/W; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvP28q/W"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so7668276a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 01:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748851796; x=1749456596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WM86YJxMluttKbsSnclJLccOcH+h2GT9X8ahniFV+r0=;
        b=gvP28q/WinmLrQfEaPCqypmquUgw+vWqJ0uy4+BhlX7mdZSC8yEhHPd+dLDrfMyZXg
         PCfjLW6bCJUuQl+WaU/uKX+DS29v8PC7U6BUWZKjumh9qbR8aphCpgN4Jow4KetG3dfB
         ainwyxsvCLmZMtSLb63QrQqvs6DQYBNOIQAqNJgUp+UdfNhNSQC9WQWnF5s7cc52mHVL
         09ENqn1kLr+I/Tbrua9h0iZVzGiR3L2iPjf9eZjV3kjmJiILv2gSIyZdo/ohVhBQb4PM
         omnDlQeqHVEI/ef6WF2qNE8QFJd0hqWyEKUh1P79L9RasABs9ECbWYIAdCe2930SUkvX
         6/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748851796; x=1749456596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WM86YJxMluttKbsSnclJLccOcH+h2GT9X8ahniFV+r0=;
        b=lDM214RDNsDnBEWG2mG6F7sjjnpVvNsy26hLx3mJvyO+RGA1R+aFjZfRVBCtX1od0R
         9M2fPFOrEOF55Mr9quRU3f+pkx9910qwN6p7zyDzba8d+6+FIzhPcAK17pqvvDlYkWp2
         PG3MBR8BOefYFs1Ar97ICt9WP4wH3lFR3rmQ2YQbd/wOvbBlnog+C1qwtzZH7ZcSG+ZK
         8hLlKXr1g+rqbDa7nHCDZZkssddXanRYSpecFup1cwCoU0xFGbXPUUUMDCsZWdA+s66Q
         4gJ48MLsZjI/uNZ1PyRIl1An0Vre8st8mqkzuemldHZr6ysuER/WgM96xTtzxWQJZ5i4
         0DIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6CEwOV5DtYFNbOXx3+pdIJVSdku+yl20Q/YFb9xUybgELrd2oVS90oXyopvT5mDq3mFv/1M6oE5FY7AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeQ++a0ZNoc1FHviPSuowfDIZ3d8jEOEXLNa2AS9hUfzRtKYwB
	yapeO3AVwfMkKkIjpWiGdg5x+pqldPKWgBkyM8YQe5PWbDSeyPpzxdINz7NsKI18VBY=
X-Gm-Gg: ASbGncsgTaK5L68RV+vnPnddYH4d7Vpf6brqOV5MUm4Mc82Y/dKadLqO68rcle862xf
	s+BStgi3MjJAJL7cNPdOLpSDYBpM+mmOe4tp9LWTFL9tZ5ZDNU99reWfyKgg6VUwdWO5XL/4p+A
	bXm7UleAot3o6fYebcCO4eD7ZqptWqzNxeT/Xno5PawbjI3/kD/NUzfas7yVLK0K/gIbpUB211P
	itd6v6mVun0gd9rZsvRWAX2WuliWydKg6l6z7UXgyjzPqV6YiJjsOmrsLnoW7bvdaFceM08sTSt
	TQkyM7q6hV2bccczHLVftdkqogCQyx0K+7e+yz5aGgAU2jCtMJEvJ2C49z9URwU=
X-Google-Smtp-Source: AGHT+IFeKHggw4Jv/SBl+EY7f7TWu4S/aefMDT8Wy8nBVqk5RywZ+kVMfbcR7IM0tMLybaVfbxltWg==
X-Received: by 2002:a17:907:724b:b0:adb:2bb2:50a8 with SMTP id a640c23a62f3a-adb36b316e0mr998861666b.21.1748851796351;
        Mon, 02 Jun 2025 01:09:56 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:ab8c:6d23:1cdc:f4f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2befaesm767977166b.104.2025.06.02.01.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 01:09:55 -0700 (PDT)
Date: Mon, 2 Jun 2025 10:09:52 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] Add missing OPP tables for Venus on qcom/arm64
Message-ID: <aD1cUF56-IX_tSpp@linaro.org>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>

On Sat, May 31, 2025 at 02:27:18PM +0200, Konrad Dybcio wrote:
> Sparked by <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
> 
> No external dependencies
> 

Are you sure?

> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (5):
>       arm64: dts: qcom: msm8916: Add Venus OPP table
>       arm64: dts: qcom: msm8996: Add Venus OPP table
>       arm64: dts: qcom: msm8998: Add Venus OPP table
>       arm64: dts: qcom: sdm630: Add Venus OPP table

None of these platforms has a power domain that supports performance
states specified in the venus node of the DT, and the venus GDSC does
not have any parent either. I think you will need to update the venus
bindings and add

	.opp_pmdomain = (const char *[]) { "cx" /*???*/ },

for all these in the venus driver (plus backwards compat if not already
there). And then add that power domain additionally in the DT.

This series is also introducing new dtbs_check failures :/

qcom/apq8016-sbc.dtb: video-codec@1d00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)                                               
        from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#         
qcom/apq8096-db820c.dtb: video-codec@c00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)                                             
        from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#     
qcom/msm8998-lenovo-miix-630.dtb: video-codec@cc00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)                                   
        from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#       

>       arm64: dts: qcom: sdm845: Fix Venus OPP entries

This one has .opp_pmdomain and "cx" in the bindings, so it's probably
fine (didn't check if the current OPPs are really wrong).

Thanks,
Stephan
