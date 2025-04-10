Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0222AEFE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744264145; cv=none; b=givhArS5lpnWt70ZlqThNZiZJPnw4x5RhCBRlmgcdW819QpgbYnjqdPucZgZhHfrVjJ4aST8QeW0koklrYblazPkvr7MLNxJQVIPKZjeogSMnCEV2AYlFsvSU4DwEKA7+UwTKnD1jNSalR7wmGj8RbkLT05NjkXAVskYmmiXEMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744264145; c=relaxed/simple;
	bh=oln2jJOOqICfShN8BJEsdupRTcRq//7pVVPzBAIOxSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=So/h5xHgPretBGQDLz01qHyangSUaH7XMZ7AQkYaIhtHYvBJqAgSQoHKDCADyybtGPePjF5IBUbwhjsIwiLGHWW3MP7C/fePcm43sVmx2BNtCSItZs4SExJmHzEXxhCsaFxn6ZBYvbUwNjyADFx7LFFdTYen807lSZcte7QiUN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYJ8gIXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYJ8gIXC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5UBLH001827
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6MfMIQcCfAX5ZEXpELMyE/uJ
	lS97RQd/7sCSe2WVOqg=; b=KYJ8gIXCaxiIXAsB02wvIO0JlatZ4IQwf9CstzvY
	oYUdp59mFB7RAAd8xdcw4x7YvkRff6O4Mxk+tZVr/d1iGED0M8X3H7eLLNkodq4u
	25n6cq7Yrg8qLk0wmr8DeONgMQhAZipqjPx2GAkpgHLLY5PieH36DzzsbcCpCtXO
	bxY46FklShistOwfEEHORNukgjUy6GgaqoDSLxPA4ipRlzMNbvUH9ukDl5SatvNO
	+3ZZ7V7J3ZsYTXT+kb8LuIBMXAte+FvjevmVrDT2lHN7J1R0dtZqwDQKxBPUqbVB
	tuGEWvEhBFm3C0VyaeH952c7TKSQC7jZCz/VhbJaasyopA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3nqfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:49:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e91d8a7165so6443926d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 22:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744264142; x=1744868942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MfMIQcCfAX5ZEXpELMyE/uJlS97RQd/7sCSe2WVOqg=;
        b=TVGuozr7Ath5UfkMbxk1xLaaAAeaQnIqsElUdoDzTMzLTnt0hsi9iXilY4aAG4ZZrK
         MsOc+WgzxswJRqT8lI349xgz/MI9Yd9bDwh4yXvvqmoBtDiTWLxZvcVqwENQ9wKMLSFX
         BOiT973HfbhFE56G6AAimQlvOzoLP9Un4T1AP1cNRTzUeZrBQenNNTvlnRRS64zzcoZG
         MbNbhZvK3y9ptetcO/owxCqoS8uf9mPHogrjW333BjGBXAXPY+EGP+CvMwyK2fTPunIE
         UdqFA1Mqp39e4QtO8vc7Jr3OWv2/7qi8v56kkfoIXmwf33x+o8JCPAiEVt6qFoxHz27I
         ZsPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq93BY09NdPbXwnHRTpEd/jmAmg6ezpnVzp2Oa5HXhtXc2uWEZzodUf2bKxImn+dV8prFljv7LLHeMVmU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/FPS4wlqoNnS2rpKSUS9u4al5QZpBm1TSehP0E8v6Fdggkiv
	80XMNaTC7ko8dcRGjSd4Z/Y21s6cZuBc/Ymed7u6AAgKm7Q5rMHNtVGJTEIAjtKqtg8bJYMdLPA
	+dgKRjA14pnwPOdP/kO44bCK67ZRyUH84Xy5sVAlEfn10JhNwOFK/DiANqY913Rg=
X-Gm-Gg: ASbGncttiY7h9hQhvBFcsyK4U71C078GjJ5NpdKXjuhDB2rTfIfBW8vXtrazRtuDSDk
	c0419xKZn+pWWXpHB82e1AdD9qA1UhlUiaH6O6OVQSR/1qb0X8hqkrHwXpRFoCnZ+5mrc20X+hY
	L52fzv1Kke4TNzL/ZjUrni+kMGMVymPO+fRKJPF7rViVB3knoczhVfTS7LLF5CvdL56tVZThLyL
	mATyiEwEmJ9ge+qQvGFuBh//sakDBewe/LeZt1jBUeLBWfcs+qbfx3gkG7RqzQLKsip6xQVjplT
	4GVagDVV20LH5Pe24J8YV1p/OU+pgQmuh/gHvTVJyYmh6ZeZB2c0e/RhRsF7lwwWZ+wFNIPViJk
	=
X-Received: by 2002:a05:6214:224e:b0:6e8:ea17:8587 with SMTP id 6a1803df08f44-6f0e5c84b55mr20662066d6.42.1744264142393;
        Wed, 09 Apr 2025 22:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3oSJ0cAMrOma0aNj8l0ookyEkkm93nqZHeWGbUi2zEFDAzsFv+nBjyFl++iehgnLplpiGbA==
X-Received: by 2002:a05:6214:224e:b0:6e8:ea17:8587 with SMTP id 6a1803df08f44-6f0e5c84b55mr20661896d6.42.1744264142081;
        Wed, 09 Apr 2025 22:49:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510914sm45087e87.196.2025.04.09.22.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 22:49:01 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:48:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-qcm2290: Add egpio support
Message-ID: <6q6iftxcym6ubvtljaquwz2xllsvxyfhfkb3t5fifugedlb2c7@efpxjlyqfuk6>
References: <20250409080030.62254-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409080030.62254-1-wojciech.slenska@gmail.com>
X-Proofpoint-GUID: ft3l5om3xSyND-Xl-kZHq8BJoRWkT_Jr
X-Proofpoint-ORIG-GUID: ft3l5om3xSyND-Xl-kZHq8BJoRWkT_Jr
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f75bcf cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=seQdOu09bPYBcSS_nr0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=769 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100042

On Wed, Apr 09, 2025 at 10:00:29AM +0200, Wojciech Slenska wrote:
> qcm2290 supports the egpio feature on GPIOs ranging from 98 to 126.
> This change is necessary to allow these GPIOs to be driven by TLMM.
> 
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-qcm2290.c | 70 +++++++++++++++-----------
>  1 file changed, 41 insertions(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
