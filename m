Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF22F14A60C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750620259; cv=none; b=ON0t4wqhlIxA3bGwcmMsBn8+2ZzsR0uzSoV81yG/SrTl70hgXrNB2rtONS83v83J4D5IVHUJ1zqbko9iP0lqIiCnuLOw7cvW0xjqO6cNYPTZrlwJBCsUNXWozofewrrz8jhgqGBewBeNOg5RV9ivBl9/r9AkgzyYzI/1o/K0TfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750620259; c=relaxed/simple;
	bh=aFEOGwXZo/AwrY6Y2o0qz0Ly30CX2ZmBavksQY0KkfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWnzUQjTMIpVXq8b8CPQZrLQXaDgqd3BKx0yg+SjmQZzhxgeFIJfPU6s1oIKD5jSUd7l5dKXsKZHwuaQOv8zoC3jFZ1FlLoUq+bmu5H1J0PY6+L2NmkbOYhVSvrPt5iHB2TuhIwD206LWr/0m9CyzdB8hMoILwZe5nPltzSUC10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PINn/ZXA; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PINn/ZXA"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-adeaa4f3d07so712995966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 12:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750620256; x=1751225056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IbjF/h91o8sYLkOV/LaCb7h1OWB7p+JRyaYdcedZZEg=;
        b=PINn/ZXASV6NRr9eUbnV9su3fYt84qChXDvb6c2qib//pX7/ujeHVIe63Y5bMt7rcP
         4B63u0K9fmLktGy4K4voyOnjVRlLpv9ivloks1MdqO2ru3rOMg3MTfHWika8Yw3G5WG+
         8pL4YNLQfRky8aOZy9KpwzJYpzSZDlZznUzWEgmm0b8bvgB/SmNBPyu8XODrg1b315sr
         xGrVokMG6LA8We6r+VVeXWtnLfKX0f18YTS1olN58rvqUijO7wF8XBhcw0ikM8A41EPg
         gDKvsUuPeVWPA3M6GUy8QluPeRb4X9BE7nyZh3f02p+8dl6exNMqt01d82VL5ESgCUl1
         LO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750620256; x=1751225056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbjF/h91o8sYLkOV/LaCb7h1OWB7p+JRyaYdcedZZEg=;
        b=jgoS5ZvQWVpbRXS3/OwoyxntJllrb6u2wSWlq3h3d9wvLKuIWbE9ygSDXE4z01i5AP
         lb+nBKDCSlD3JqSr/K9N/e0ZS5Bpv4me2tUff2P+kmmxWIp5fUjbNkJ0MeHPOSNpMiJm
         Un11KbsBX7Wd3EYpiatLXqPYlrGJ/0j/olGawYC5uSW5wwEfEWf+PQGAf6wSNpUR5cjC
         ynOOdohwq+Nc8soSRbWO2Ca7dKyu91qjl6ddAHo/gQ316XsSZpnWXf98f3CgIJ8UqwLy
         4Xj0pLPa+nRz0kRNrp5CLgpTP5gpO6stTHT2NG8gW1DMD7K+c+eXx6ABK3TM1wS4XY98
         fiYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUseSN4OnTpziKM1gE9LJkF3BgUfGgxkwzouw5yShScmTwf211IUfjD+THl9hakH1TOIsuorSTaS+rV150=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB0BahTcsqqGBmCjo3SbfAtPfO1Q24I4WLFM6taIlawkdWBE6/
	xpT3uwiWS97mpSFiNtHJ/NQkVlzIBmnPbTae2Np/eFJwWHRbaWbFQZmyVscZaVWaEFc=
X-Gm-Gg: ASbGncvSDHLLiv8swLzApeGgvmtQu5XKkCX/egiMgiWJZ2y6lwO9yGWljRkyA2VdL5s
	1b2nx6JyvwL0SD4DQOQH6TnMsw1znWzatgEMqohhA/iOsPZY1cjizPkhsr1c1yoULHiZq7l4tjH
	FkvDVw+No0MgAx+QOlbE7xTJtbv8saguQmxrXiyng9nj/6PsxhFGXzIWRo9okJsReOrB+eVM95l
	EkMeWnwFg2MI+KluEZXqzubmvmhgVF43rrPCkpv4NEAk0+JsoObJsK78Oy+5SRNsbkoPB3wFogS
	gEg3kJO1mLlU/PbBsgiB6FiKPApO6jfhi5L7jtUAJmRfHp4TJaxF/78jh9E=
X-Google-Smtp-Source: AGHT+IHnoYTbMPh1mNJsjdl28NGezTFEyAyfF+x9j3rQX5TVC51X/4ITVYOLyUMfiFovN1yLap6AKQ==
X-Received: by 2002:a17:906:9f8a:b0:adb:43d0:aedb with SMTP id a640c23a62f3a-ae057fa74c6mr937853066b.61.1750620256156;
        Sun, 22 Jun 2025 12:24:16 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e8218bsm577845166b.4.2025.06.22.12.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 12:24:15 -0700 (PDT)
Date: Sun, 22 Jun 2025 22:24:13 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
	bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
	konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
	quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V6 02/10] scsi: ufs: qcom: add a new phy calibrate API
 call
Message-ID: <aFhYXfBMRMluXgdv@linaro.org>
References: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
 <20250526153821.7918-3-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526153821.7918-3-quic_nitirawa@quicinc.com>

On 25-05-26 21:08:13, Nitin Rawat wrote:
> Introduce a new phy calibrate API call in the UFS Qualcomm driver to
> separate phy calibration from phy power-on. This change is a precursor
> to the successive commits in this series, which requires these two
> operations to be distinct.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
