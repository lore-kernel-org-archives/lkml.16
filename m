Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A6071747
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751128376; cv=none; b=qu8oxcnxHyFBwIA81rzW7+aLE4OxbqVbKae6mhjMaalPEOsZVsa23tq/RIoeOryp3Vus95hZl2pAS0cOrio7cgjDKI76asC0bs6FkSTnSGHsVIUhu2b4V1oECN2MXmSEiw3GuuR5Dn37rrZwBu52ISEhnuj1GwCqvOpdDR4dESA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751128376; c=relaxed/simple;
	bh=7UQaeaHYF/DlTWIUpM9WBjpHTdmGzeyllUayL5fP/yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2IYodBct4EjdEZt0YRxImz2/1HjXCjaX7DeBTGqthaLqK1KwcXZbFOQOiulrL5aRGNtT8ozjPhfs+fthiSj6lI5j6MHXH76hLj5/QtFtIa8Bmzw2GKfF2daWKPRkU2+01NwaAa5Drd0cPT/eWDvj4Jg+720lO8itaT9jwdQO40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yh+mvyRT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yh+mvyRT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SCXMZH024727
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O/9uvmDt4XBxG6SCGU/xOqs3
	nLga6puqazvT9x/dQ5I=; b=Yh+mvyRTYYXuaDNQmJsMeGmgE/B7YHONnIeJC7W+
	YhuntoGxEid5cIxOOKSY+RoJml9lH7nrbX0XRmzI70i5z3He8I8wNASQY4fpADRr
	a4dQ4rEXXilYeGLhhJL2uvq4G77PG3VeQ/ubGMUF88afvi3gKISprYyJU/AfjZ30
	Jw5lrJHslJbhnkdm8stCCMGrTo/TR9FhVuED3dxAFuLpF0s/AuLlEsL8FZ5Mg4pb
	m/tXtkJi1fgOIccxnAVAwD79SUTx4AOiaUFp82hAdEywU4HXQGQeIenjSUr7Wm5j
	wzJ9FjWtWQ23pTqHdBG/nXPyKyHqucxgh1wGsaFF8It0TQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801rwvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:32:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d4133a2081so460824585a.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 09:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751128372; x=1751733172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/9uvmDt4XBxG6SCGU/xOqs3nLga6puqazvT9x/dQ5I=;
        b=ezhZRZkZOCItxR/A4i8dxHZ1U+tUJggSWfZy2bITL2GFHkpOrnFVFqS4g5MA8oI2fP
         hNkMnWH1xFxtwPjxPFvHEJyuezzGlXeXVYpUSWri50N90LP6rxvzMwEiT3kmnCySq1Bc
         To8H92gQss1QiCzYExRL4EIXm2Qi3sFquXruUZSVlR7/M1xyCOWn9gO8tz6cgANXgpJI
         u6d46t+oIQJdBJNGE0uy4sEk1+10km7qm+QkpSWzfLwegqViBoUz2Zswpavv9lI+DBie
         bWbdcPtIL1HTg2E8I3KyENGUO6u7p3/jrPY1G3XKRVJ7XBVJF4uC0rJcdRmZ/KpcoDYa
         TBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgXO9r1hgCt4R13ORcpqnHalGjWsJLnkIcSiKqn6Uim8A0iZM4EWDuaY1Xk4Hg9IaYovrWwXh2/2ldofU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrPO9ZCWOn58ZCxB2F2Mfrhexo7w4ckKySNfdcTDIfwDtVvSPm
	fXSH3WuY3sM8dCnm681T39sMef+N2afaknRPwTJvFkjjj6miYg7So6pmRfpAA8bz9NyE/1IMjsC
	jOCmR5Y6/VNpR8hq356m8dR8l8limVe7k46f8dLV+nBJNDKYw/B4HUm8WkDLurX+6Kdc=
X-Gm-Gg: ASbGncv19YpRcOaKPnGHVIcBp9szES4KXXDM1SeNh6vQXAoXrpqdj3PjN/rp2s5sCml
	RhjnlHZL1scaKuj0XXZFyBEDanQCHh0lhQ+603vTRpPnSjf/Qe+LbtZYochPEGTfc5VxoQ+gMqb
	OF4tRvvFzC0bov+8HUAk8HTXDDToMoEbTRZw4xShneLoj2TxuOjYVIv/xkrTVeza0IujC2S4nKg
	jlbjCN9Z2lgsWZqe3xUhY/DRmXos4+G271MTp014rz8JbsenEiuWPhmJaGT8ahGylpdkV3e9HKm
	RjyZiMCxv/nUKHuDODnWBKlwPLu+k+sWUMveH1w5V5NDJztHd3j7aYVmniHTCfnUKfRlH9/6R82
	mqe4CR3aUspCviJ3gWZWOvJvVODwtTJJuEoE=
X-Received: by 2002:a05:620a:458a:b0:7d3:8a6b:d24d with SMTP id af79cd13be357-7d443935cecmr1009371585a.24.1751128372061;
        Sat, 28 Jun 2025 09:32:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo0GfKgsNJw8nXHLBuEqgF0U39COSY3GWheDpTaSOZOsxKFVAGcrAeJOdBrxouiq1H04y34A==
X-Received: by 2002:a05:620a:458a:b0:7d3:8a6b:d24d with SMTP id af79cd13be357-7d443935cecmr1009368785a.24.1751128371652;
        Sat, 28 Jun 2025 09:32:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b1ee164sm860240e87.0.2025.06.28.09.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:32:50 -0700 (PDT)
Date: Sat, 28 Jun 2025 19:32:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
        chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
        shenjian15@huawei.com, shaojijie@huawei.com,
        jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 03/10] drm/hisilicon/hibmc: fix irq_request()'s
 irq name variable is local
Message-ID: <wdxfjpszopfpvjeu2ma7moun2raxgaamnw3tp4d4st5cz6onnt@hbjxnienyaaq>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-4-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-4-shiyongbang@huawei.com>
X-Proofpoint-GUID: TIHRmGojWSYYEguh85CxMhtU7_FDKJRF
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68601935 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=akGq69jt72y9FtjuzwkA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: TIHRmGojWSYYEguh85CxMhtU7_FDKJRF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEzOCBTYWx0ZWRfXxzlMIZFK+Mil
 GSqgHQLBMkzuCirD3daDRjbRLSEk8rRRRjxGS8C6opXDfvaSPYZWljucM8Ojm6W5TZC9oVvZyyu
 nYYcvEAdHe+GjGWPwbZ4LXfmxBhYIftDyz3wfEagFe5BLuEN7CR3CTMcg/NTAzfFmyZtGZA/fgg
 TNtz5b2jpxlJJCBV28mV6j7r+rFgVAQ1JeAF4F3W0OCvgyoebkg/RpKUp1Xxea7+SZat6K0ADI2
 nIL89a50kKv9+tszS48NNwOfDmzBstXlSagbc/SRLYMb17Kdc+KsP4EFsl43ZBOknrloAgmuIDi
 gg42v6OSWm0+47uj/0HUvNxNZbq3WUbOL1n7bni451GG69lNRqN8pzZaS3OkVoKsNZijeBhwWmo
 r5w6XJAlWjIxoOQSSNuDaEOJLqGemSC5ZMeNvTnY6YNXZ12kxJJcrM70KL2QqPZpsQ3pnop8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=845 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280138

On Fri, Jun 20, 2025 at 05:30:57PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> The local variable is passed in request_irq (), and there will be use
> after free problem, which will make request_irq failed. Using the global
> irq name instead of it to fix.
> 
> Fixes: b11bc1ae4658 ("drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - add explanations in commit, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
