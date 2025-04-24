Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924FA221733
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487590; cv=none; b=aLqRyMbicjQwjQ5c7JOxNtslOF2gYvIuQ+QXkSnFj3BqVlAHeNAGxW4spI7/nber2gAOle42XTlrj+Dk9FyydrL9OQ6GZTzXiGwG66uSR7Pq8r7ae+XoDFBezf66iLaPdjUm1Z3WdiRMQZYCx2YkDnVvyu55JA/XhkKAAolcG/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487590; c=relaxed/simple;
	bh=uLu5qq+fu6nJOObQPQvzr891FiZ0IVNq6dpcmUuw9EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZvQDwXesaenCD7PDhOKZbwqMGwxLvD94LN6oJ/fM3T2GZcv7MC8rSw/Mpm0yFncH/UUEBVmbaZ0Pn+Ga0oH18rLr/kw3tk5EvJidZCuJdMzWFWzxzl5LcDfSr/x/pgKFSQ/atezfZiL8V8u2GR07xU0v3dfqqHw85KyHt5dhpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L20d0vEn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L20d0vEn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9B6031031
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4dGjO56yZ5rnlYsrCbSawbQj
	IoRYwOqdiOvRK7aRuDw=; b=L20d0vEn2+o/Mnh5N8rHWG+UItlv3JpyyEfm3y5y
	L5NTKIamb1n0+cI1PM6aPf1kpqx+p5BsI007OV/mAyj2ITqZ0BMP71qCMEQ3C6En
	V99lBkho+oJ1v0pw2rbpXCjiPNL4WP/ChzZGyyWmc8jXyl7xX04yLUz8ugdnee28
	W+8RYTUeMeqeKemcceYT9eAxUQQPN9kpNRLM3ZWgfysOWQjDoOfY1Nt7kb4iuzNS
	ZuUDFQCWPHTcrtFq6/7eWYZv2Qu8yvDu26VmxYVI63Y2QhDwikInXLVrZNfe32t/
	/F46b1emKn/0xgBJXOYiX27VfPn8cXXOuISwlts4wFdm4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5d0wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:39:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0b0cf53f3so117302785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487586; x=1746092386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dGjO56yZ5rnlYsrCbSawbQjIoRYwOqdiOvRK7aRuDw=;
        b=Iat0Y8PbWm7uVpPFDVdIGi7SVgUbWGlvHvnT4QSu7+ai7qPQRNy2wuf54DIHDDf6h+
         Acp/7kxn3xyXvDoayNEtKvZiam2Qmc/lUe17/dWyNHV7cZl9l+eP8p4lWAJkRFpRmBr4
         ofwh7LlYt12AKPEaH+BwWcbieXJj+xAP2f0DOENLD7i2HxsE4OkeHjmAl0x1wjNqyyWF
         nf4G4BNXHyr/bI6356m85QwZURB8YmgnqrAZXQ1WLZ/3g4saqzf3KkzEZ+pOxLMXVsZx
         J00nCiouJP02M9Odd1rDgMXVrhpk/FDnLyp3HSQJNz1+HHWoouVrbx/vL1Nor7kfOQ3E
         KZmg==
X-Forwarded-Encrypted: i=1; AJvYcCU6mVUafWBhVbnwLC1SbQZMnyHnBi5p7qh6ayrmF+Ve0Colh3xR/wWHSbg93vPQT7TUN5VjjTYPuv6dqck=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx6lTDf+J93udlJ6xv/o+XEv5ZBDqAFc+Rr6sTKWLG8NXJi0Rs
	ziuSiAeeFnwwN1n62nkywtWvIgP8xE3F1Pj89dhYPXNgdxpz+5l2KMLlgOPS/VUl+XnKdjen+P3
	ZgpJ9wF4wEcDMGX1MfWQYFuqSkYTgo4kl/RrdfjT25hbJGWGmYZTbPrZ+3h/52oM=
X-Gm-Gg: ASbGncs2uqJzgpm4mMkf6FKHpowqTzwJvMoAbUgVD/x1LuH+uVLQcN+VOcKXViKaTNx
	3NTUR1XCf0ZwRgCILYForlcZY7F4uQDRHNgTuUrRMKOo+Kutt++oiMR/viqI1B87L+RPkQ8QRfp
	IvPI5+Y4Sa3tt57w2ygAL+I6/0pnafbPvC3fJsttHf0dShufSz77YXzwHgsF0CIX1J1nMiUxSqQ
	eqm12OkAW/xaGiyNG5eOy5UnfrN03dM5d+sDM5vbS4n/f1Ya/FsHkowreJ+/RqJhtcQe/LGkwh7
	oV/Cm+yTpCkD8BM9aIrjyPh2/JNkLfv9p5LXrLBMCOp7ro5XrBmmQhLgCEgPCUILvhQWN0dUSOo
	=
X-Received: by 2002:a05:620a:438e:b0:7c5:53ab:a74c with SMTP id af79cd13be357-7c956e7a968mr299385485a.10.1745487586710;
        Thu, 24 Apr 2025 02:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8jnKxL7E7dGye9CmktSI0DSfoKsAN0FjpOYzJxhooQSxBRnV8KWWUfkIDlgbYRG+Pw0Rmdw==
X-Received: by 2002:a05:620a:438e:b0:7c5:53ab:a74c with SMTP id af79cd13be357-7c956e7a968mr299383785a.10.1745487586416;
        Thu, 24 Apr 2025 02:39:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7f1asm169674e87.237.2025.04.24.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:39:45 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:39:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Fix PINGROUP defination for sm8750
Message-ID: <r542y5lcoymvykl5fdayjocvysrvzli6xlhcqjrwlpszucmaoa@ewwbbpynggnl>
References: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX1GARRbmFMNu5 MGdIGOLt7vyz0ccQ60NwLIBjCfppmzMq4p/E06/wvF3P3GlSH37Z1hGxgt0mMo0bld/VvfEeY5k LGq91iE/jDMoF9hQ/W0KIcOtOxc5IsZpq1r4gKIC/VGTScJgtBQM8xmcLCVCdlLIlQiz0zDJFfK
 pvI1H2J1Nw3+pmOn89CPxzvVdYe+m6jpovCKkXTKr6OVc1PG9SlWDLVhZ1VLvI7fRYDY8k9JYw6 WTbyhvSGQTN2Op+DI60MDcbAEnm44ld0AXcCDTCui5n6XswWku4RgKEiV/ciO7glbenWoTb2MlU blsIkZ3UzumnJ8DjcmmQiqeR12ouEWNyLPCSGfwkzd4lZ0Dmaj7dq1EBhklDDqaCwT1u6h8u50V
 AMAwnaEb5XSZKGZ2JtIFV2RZ3gA3vp6L3PMB355JOpd7TwFeQOLsTfikGVBl+E9X0XcSE2Oi
X-Proofpoint-GUID: eXM6c8XCYIaA8h1aNjzd00CNS5ZvmzpK
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a06e3 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=hy4lFNwNYWihUDc_pIEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: eXM6c8XCYIaA8h1aNjzd00CNS5ZvmzpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=630
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

On Thu, Apr 24, 2025 at 10:17:10AM +0530, Maulik Shah wrote:
> On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.
> 
> Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
> enables forwarding of GPIO interrupts to parent PDC interrupt controller.
> 
> Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8750.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
