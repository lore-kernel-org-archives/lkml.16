Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248F223C4E5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751578984; cv=none; b=sfl827J/TpVnevNPpuguf0Tu/8p76fCb2WgUC1I9nshJEaAvm9UWqzOFHv4BJsT/rNkm/y+y7HXZO0/6MWxvZiIfVAJPeyPlFznenuwaWgedidCk+6wYpi7wDxdEhOcJwTf/tqDgUDSnq8C5DSsxUoTj5UJY4vu60LJ+6LXb1Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751578984; c=relaxed/simple;
	bh=NQ0Qk+TMUANYCWV5dlSD/i/jLVaSorn/SnDHk88J94A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSTZ2SaJFlQLxwLqRmApgYAyTiGB0wfZgxVXZ75rl/AfM6ULelE9r2x21+6ss1q01rQ+qf2moT4bhDN0RFGboPl6OO+gkD5jUQoheg6/LVZVN4I+ZOIYfvM3nhuS9OL5eGmPgfVkn2SGbAk26trAbGwiqWFy1ZQrUOXsB0ofZ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lS+/7q34; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lS+/7q34"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563JbvLm029619
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 21:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0qdR+SCx3OWhYnC0S9E4S9JM
	ShEJeWi1WMEl049av6o=; b=lS+/7q342bAzqp8ZFDO3iMZYuA0uOQdrrbO5kIU4
	eNcRDPpVD1Fwlis6JVo5p1uWlqg4uE925T6cSSTEkuFP9aA3NJQ2rtmWc9lMT7np
	M5NiLPv+nPe6kza5mHV6+NdcIVFLfBWLkcitV7V2hAXl4EBH+9wOcYKz4C1KSZ7D
	fbk7subCH+Dn1+WAbFTeqF4kXOnqdJOPq3Jf+wZXdmdz7mHGr5xeV1Sdgf/XhY+3
	28MZ/e8Ma/XO3jR7NNJqYICGm8n5UnpbuLgJ250qBoy/RRvA7kEnQX1CrrAFS87H
	rQ2TDkNvBhZiyWl27FzoOu81XrLGcd5WAISRUMOO3h9rUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s330j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 21:43:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c760637fe5so43454585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751578981; x=1752183781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qdR+SCx3OWhYnC0S9E4S9JMShEJeWi1WMEl049av6o=;
        b=j3mmGlirjnLcA2Rc1zImTOCOeXX3t6RALt0tSc6OsCKn0u6pen94SdGTWUKrsAoCm0
         yiiSe/19d4KBA4+otlDJ4mPNT6+7Sf/kSzwE94A8Nl2vkfwbYxVykUOaROf2rR3FFqJP
         UVvagwKeukq/RAp1+/1DXdhkBOIW3csZz89z7hhnygA0SddiIecH5EbnbgPcKinfnBTa
         FyYCw3+rWKeav4qAws/GOwB9J5qGXJ5JHw1L2QYgUhJeacf72G1xpP8PL8YRH/j5q8tr
         pGb1XBdyPzscXeQKlm5c9Nrj80UOg7en4zIMMQA7KrWENM5s8QD2TeHFC0OJqrwus7+1
         awWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBGqTZ7ooGm0NMd9QnCuIYRS4+KagkjYtpHW7VwRGdT3U7+ui0Ay77BuiaCdjnuNyS/5GccNb3jHZWCCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOHHDyYRSvoEfk5SQxn7uQb4r4f+i/QUsrqKEK8YZpic0CNBAL
	1+2oOuV/IfPk8/CQ3RCJyFfuiJqpnHLgvxK8D8TEvt2mwr+xfPw/UJLvpe+rtDQQP0iOJo3J9Hu
	ye6GYB6mgxQbUkkGUXFkKExFHT+vBznDt78V5wMywfHzLVAhjWBWZ2VBQ2f8qrjzBygQ=
X-Gm-Gg: ASbGnctAf37NtJZU2yd6NLXQqxfpv+/OuOh07fh3ELyOc9G333oXTMZ8RhNJYhi0uaZ
	uTyU//rBIJDW9RuUC5w9ab9Vsp4Fg0ff1iD5XJ9QZezC2ZYfn31p9+Cs3Qd0K6dCn09Ixc0T2Zo
	iAG3C2uNwOUKav9PYtzazOYQQvqbz5xpGsp9pRGIS2mzYxOjaE4Z4kq515SfpKSo6d8z+x9Dtf3
	bskRERUikeg36b9MIx+Si3UkewTasQowhdaQYf8i8CAiZy1WcWdTwtcPclx63OnyFbaFthy5cb6
	qZaOeUJl0kx6vbV3jSVm/+6jZY1XFGo/WQolgWZwCjnlUygUi2RgzVNAUZ7ZfZjd3d0JLO8CIV/
	P2u+N9rj4nOzygGvHrQMBusUzmxYFJowZ3Wc=
X-Received: by 2002:a05:620a:7187:b0:7d5:cbfb:8844 with SMTP id af79cd13be357-7d5ddb1d9d6mr7418685a.4.1751578980954;
        Thu, 03 Jul 2025 14:43:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0r+yYXY87tfD9NzSKu2cGD8cQwmepM7gyxeU11O6CFVmLIqXER+CNuV5QEvR6O0qoT+qaMA==
X-Received: by 2002:a05:620a:7187:b0:7d5:cbfb:8844 with SMTP id af79cd13be357-7d5ddb1d9d6mr7415685a.4.1751578980482;
        Thu, 03 Jul 2025 14:43:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384cea54sm74195e87.247.2025.07.03.14.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:42:59 -0700 (PDT)
Date: Fri, 4 Jul 2025 00:42:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pushpendra Singh <quic_pussin@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add support for two
 additional DDR frequencies
Message-ID: <waxxtkaqatisuvdhejahcion3i62d5ojljtgkmhw7acckjpxzq@qbe2pb3jg45b>
References: <20250702000120.2902158-1-quic_pussin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702000120.2902158-1-quic_pussin@quicinc.com>
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=6866f966 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=C_4s4C4ZoqFTuNAt9h8A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE3OSBTYWx0ZWRfXxqgdhPOQs+Ky
 XcEfm2ZS3lSSAk9w91+7R137tbA998S3jCG8oYnLb0L/D1jN+RvnHa7isv9e1yYb9azTADCbwzA
 F/60WH/90iHevsWyAMHe96GddrFeS3CJ6fjQwW4o8Mcm2xw8re4zT5XHEqsskXAN4lZehS39w/p
 KvvV1KC1UZUCyjlca+Ir5n0vd6DKKJvbn8ETZ1fBa3l/0lUNjsGoYyfQHa68fHLRCDvtUB9GXPU
 IKfxaXIrTsjrbndE5xhy3ivrmn5p0pAhBF9uFen8Ufev+EyoD77eWVsDK+jpyTMt+qRFUGco0qF
 CF/a/87GkJRTKyWpreQOTxMK/lMwcnL2E4vFdVIecRjasfKIGQeyMlTpABi7madPfiBc4HaSPGT
 jiHRorIBTEcxWbGzW10cKT7/eFmRJ1KT6dt3XjlR3myqxke4dO4kI8CEHEly5cB3uEyvLXDW
X-Proofpoint-GUID: ul4zt6efir3K2-ZSIcMuXN4GJOLpLo_j
X-Proofpoint-ORIG-GUID: ul4zt6efir3K2-ZSIcMuXN4GJOLpLo_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_06,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030179

On Wed, Jul 02, 2025 at 05:31:20AM +0530, Pushpendra Singh wrote:
> The SC7280 SoC now supports two additional frequencies. This patch
> add those frequencies to the BWMON OPP table and updates the frequency
> mapping table accordingly.
> 
> These changes do not impact existing platforms, as the updated mapping
> only affects the highest OPP. On any given platform, this will continue
> to vote for the maximum available OPP.
> 
> Signed-off-by: Pushpendra Singh <quic_pussin@quicinc.com>
> ---
> 
> 	changes in v2:
> 	Fixed the commit message [removed cc and change id]
> 	Link to v1: https://lore.kernel.org/all/20250701074334.1782967-1-quic_pussin@quicinc.com/
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
-- 
With best wishes
Dmitry
