Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9B7289E3A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594208; cv=none; b=bSilCCUSt++E6vvY53kGRgi29dnDpWpE33vXK+0lohDvrE3P4sZhjoieIiskyU/Pez0zUVF2NMl7L+eA+ajWD/2MNl18TsuPpjlJmTn+CHyngsmmW/CuY6cpIsBBrwfJMa8Phf8RCi0sq+v7Dmtv1xN2rinkzWIaTnFCai01e4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594208; c=relaxed/simple;
	bh=npHB7Cz4fEyvzZ7FmcG0r7LLLmBlvaufPDf/mhV2evM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooyQZWslgBv2nF7r+TrCxitTWGKR4HVhb1xor4vpd03lYeaP14fZwCtZYj1UbBaN5YjgrEnkT0crPIJ8BrC9yZVZ/Knmt/+ynfmG2xyP+ObcMdxp9lJtMd3KNuRz/pjW1qIMykR9lIJaz4FZhyHed9DRTRgKRke5PefgYCJ3890=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TspI/1g2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TspI/1g2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIQ0X3012185
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2hza23gY3coL4GLirsikjG3A
	jHM2RQT+qzkG3p4icuA=; b=TspI/1g2OXSBthgYyOLRrh6omOIB1ysX+Ho0IDwa
	UFE4/OLz1OkqKVRSYwuo3h70Z5kmmTaLsGtnMMY6Tmg4ObuVwIBR6+J/8Z5azzzE
	9apr4NQuprzo2pR+1uHLxl4Je9JktEK3mCY+boeehrY4XAO02drVYETlCRrEsbgj
	0joXd+igquKPoSJJH7UvrCCLtCZgIInP+dA2fvV9sn0syUuF5r3IoGs9+EiYOQeL
	1PSlcjMxkfPsEVBeTiRjVzuR6Te5OHWx4y2KdWPr6yqL7diZdGWzGbszpYlFo7kz
	mTnKpsnkjoxPI15BAEU5kQ7idKQnXKYLOKraxByxVqGwXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxu7hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:23:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so1080768285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594204; x=1750199004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hza23gY3coL4GLirsikjG3AjHM2RQT+qzkG3p4icuA=;
        b=as0QBQNUPTEZz2QtTlXihUE7drz0vnsDFP8vu7s6khROLmJZYkfeGcXqKbqm6llcVR
         78UP5RIrfwV7OMXrQN7Mp4zzFrRbjgAdOWss5q8Rvy3n8Kzv94qjOBI4H/2lNZTVeYT+
         I4ZypR/nHvSTd98T6n3B2F2/gFEP5BXM1oU2YSOVKZ66/uJePEo13XIVAKTuZ+Z+Vja3
         hxBb5p0CsqwW6OvQ63ziUgsP65nw6tEMs9+7+Kp1gXTVdfPZq2qjeVtvegRhx4FS9y0Q
         n2OqcyvlcQLOX+g1U38qc4D7/AeTr4eJrUYJqmDr+FQEF+I8CC5ygh9kdHyBsW9HLJgN
         engA==
X-Forwarded-Encrypted: i=1; AJvYcCVZBQLSWnW3zTvlAPRB2Ihtr5tlleeU+OjW6jhdxBCeMy8Y4IWax3hNKs0RCHfv1UoW2UqkXrNMUn/Xrmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBn2x3kE4w/LaRaG9cg8sPucHdZrB40w1X4jhmYkl7nyUYaKMX
	ewlQ30ryzbPFCBvP5rr9ug3Br3nlG+e8v9Mc193/t7I7JhvCtjf/fSSMLMzZFP33FLkTsCx/XMG
	BcyuwZAm7dP0Ja4sexoKrVbnGLu0EStYhVPzLGnjoogGXX6mQgJ7ress30lMbhgtONbI=
X-Gm-Gg: ASbGnctciVZkAuG0DI9iq7rvH2mzqCoQxTyTc1XDA02mKm83Hugyy1pX227uGjCOApK
	bypagwD9zblURMfeyZQMmGIE7jpwM/3UjLj33biRMFwp2GUpkO2tBRNXNbOFTQjV6Jd35Wno1mg
	U9KirjOETyDW0tN32Qgbr6sPElwohtnzvDOyD+L+QkQS1nxoyAqdwxW/u7m3gZrzSjUyj+c9+Iu
	v2+tRT+p7NqNixsI1BWjDE/3WFKlnY1yqt/4nekNpEn90xd5GtwIKMKNeymXk1kgb/OokeQZSc3
	XncJ/xaZtScqeUANgYjZF9Lz90mOHj87Cr2FRITfe2Rv1SSnwJrevkWgUPx7qMYq1924fuRy6Y7
	36fpJp5MmgV2FfJ8h7gcs6SgMGJKtCoajKGY=
X-Received: by 2002:a05:620a:198e:b0:7c5:ee84:a575 with SMTP id af79cd13be357-7d3a89bb112mr168583885a.46.1749594204448;
        Tue, 10 Jun 2025 15:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCcqxVLVUJFrq+O0cQ9j5/TPx+SAaSrKInIQWb4KK+4mCxXHk5ZJ92VOUVg+qUAfhrlPtaxA==
X-Received: by 2002:a05:620a:198e:b0:7c5:ee84:a575 with SMTP id af79cd13be357-7d3a89bb112mr168578585a.46.1749594204049;
        Tue, 10 Jun 2025 15:23:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55379b2c854sm1321061e87.142.2025.06.10.15.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:23:21 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:23:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 07/17] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
Message-ID: <w4napqk3loelkhl36gvhke6z6xg4g4xxymxsfjn3hmntkj2urv@bshk4l63nfrn>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-7-ee633e3ddbff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-b4-sm8750-display-v6-7-ee633e3ddbff@linaro.org>
X-Proofpoint-GUID: U830-sbd7YHBWd_z76RIbdxa9DPrOmdT
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6848b05d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3n_StpEWJ1elpYQgr94A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: U830-sbd7YHBWd_z76RIbdxa9DPrOmdT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NCBTYWx0ZWRfXz8Ah+YEjo8Ov
 X/jaD1H6fnHLZLmYwKo4wFfFY93azm4Z2tQoP+etVtwXYCWgAHN/BcYh4vbLQJTGij429eeI5vZ
 1/3w2QbRmb1vVNXdVc34JBfmroiIff1tRwstWZ3uQMFFGVNGwVJBbhKjAUNs0DLN/HFX3BtceQu
 tyvP+PPlGm6OCp3bJ6VqGyIB3Vou4vZ05KzGaTpk3hItMjI6eAEdFuKG4tQI48i9q7/rRxS1DNI
 mRXxuB5SaFe3M+8E/IdRWWe+sVqaJOLu0Vzal00RahMZ8Jv8GCp42pCpExzho63d+x5PY+Qlktd
 xqhQrXQFoHcRZLse/qSreDJbnKWeUAaHABmQUQJ2cT58/tkhTYykj0cDtBW0w8Y8/OFcFnKvJVG
 T1gmjnsc+mynryMDohhMy0uSx3QymKXfDy3O5W/UD4h70eJLS8E0nPUGeJ9JPCOF/x9b6dZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=413 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100184

On Tue, Jun 10, 2025 at 04:05:45PM +0200, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
> masks and shifts and make the code a bit more readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v6:
> 1. Add new line between declarations and actual code (Dmitry)
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 16 +++++++++++-----
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
