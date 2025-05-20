Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B58D248F46
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755881; cv=none; b=BOFtzdF3zB34+/bFLKk+zLDYSQ5Wl1piklXcYCYUG+dSbwuv+IarqKCPcbMNssk3dHLI9vEdAkbBQv7Kmd8T0nnqa9NpHwJRHdxRLwIhx+vTwdiGX6CNsOAfw1WI/34KAytI3/2f7u+BDl0Bft+irPnolj/VdAlVLsf6ppnkpKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755881; c=relaxed/simple;
	bh=vHPtQTp95qgHiVjk0rfgT4rumfQnjKWibWtqb4WPsqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/ICGF1b8x6pP8oF5qNb9qUCk/OvK9EyokpsKOblr71jwpbblrh6114SMf5OR/5lZ5NZdwlFen8IoM2O0iOeKCMCLtTZuo6trHQg+Wzr/T58IqkFfMqG/X+BpyJu40OUkzxTQloR52lHuS9G6fgnCqjcF3gvS7cjFhMbgOHNLqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDUitAJD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDUitAJD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K80lqJ027736
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lSAgwbIDWc01IeRoKRHNp/WQ
	jOOH+8S+Tdt/kRAF/+U=; b=dDUitAJDaU/aF0f3WyenDEDOHDcJoqmo3QtouF7W
	ITxRFH3aVq7oy1IEqbHkWEYQu3SvK7wKmgnY6sF/Fh3XwySUHp8pRjbPMMzLulB0
	kF5TPBQcFAniHLe7AId1JPitZWC36jqD6ZOoYBfwc0/HyhZqGOWR0V3+GCnzOM1Q
	ShuTLOA8aGwc54ypNWRcHBH58EGLzB8KkuOqTo8wJM05U7Zb4jAqwP7iV7kcwQVj
	Mkb1xCaD4TsDgDNWn68Z/cts62LZuS/AL11/X6oPaBdXfZxa9CsuvVeRQh+w2TEW
	ltgP58JVAb9eSMevVQaJ89J/PLkTumzNVUIt4X5FsOuwvw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm50aj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:44:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8b14d49a4so54795426d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747755878; x=1748360678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSAgwbIDWc01IeRoKRHNp/WQjOOH+8S+Tdt/kRAF/+U=;
        b=DFEz2ChZRuOwZkmRHZYjngWP9CQBLdYx8LbVOQbtdFmXOHVwQwZJf2KhPz88nC9bH5
         rB9VuSLmsHLEd+IGVcO8N645JRzg6cZlE3API+BP58lB9bnPP+97/r5LmG24vuStsAk/
         Ip6CrxzZ/c7DtNGjqXe5qStklVjpolAT3wKk3v4uoIjPkufPnp5o9ENAVIir3bd86oJs
         e/LMdfdY0GsBjgKQ6vNjD6FpEj73/Ay6EQUeHkg7D2MMOts1lCJagw2Jua2KinH/Atr+
         +bqDBJ2yYSY9+WOSMSSWCbuKKaXslU2ZB/aAKUUVgFE7gyaRgL5kiloYaLfCLYPPQg+f
         WuFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG2unyAKoyoWBsjgIz7NH3mdq38qxORmd2Ifw6E5ak76xU2k9RFYfKLQ2rlG7S9GcSGLbHmHny2SOwg34=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf8Ayt8yqxt4ESi3koaGa83ozW5F04R4p9CSgnqwOkiHiyN5xS
	8ZlDEiVhzJXhnYRdBJmVUaQMFVxay5BytxnPQR5GYus/d3gQMTkUloR2xuR/AUe36TFGqVlkzmn
	RaX33LDXVag6uONDpwRM6wDFwAVvHW2x17ky0Eqg4nmdT6np12fNsPTl0Y9jM3zG5tqOjCVI+Zq
	ee4A==
X-Gm-Gg: ASbGncuw8hM+mhh5TJiSHU/FEyezWxNSNB+jAk6V6IonVIip2djvJ2/EfW5CaJDQDqR
	GYyV9JbwhM+tdlXNZOCe7Zjrb+UU1ZZTLq+M/VfKlsEgXSbaHgiJJb2ODQQqkiRPffv8/8yhu1h
	bhqDwFBwbz7/raX5aqNRy/g+qpAtAtlnqRoQeIuRCacWQGzDS0R/1IdO4SUgARZzCjqximN8pKP
	Z/RZwASUZ7FwnsrTEawC8lTwMQs5pkGSeVuvN0NV2GDGYIwy5OrIcRN6L1K2I7t/1sxxo5zZP0l
	k3KchGRi/Zdopg2rlPMNCeNCH261uY46y0JxXCqFxGzpxjYhLx9DLONS9FM8b0Aj9seWUn62ZWs
	=
X-Received: by 2002:a05:6214:528b:b0:6f8:c23c:5278 with SMTP id 6a1803df08f44-6f8c23c8524mr209650756d6.12.1747755877460;
        Tue, 20 May 2025 08:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm9hVZxx6jSsGoAw0nQEashx/KJKae4VdE14/j2OPoOQ0PtJya6PHIlpK4xtUsXtkz6QIb3g==
X-Received: by 2002:a05:6214:528b:b0:6f8:c23c:5278 with SMTP id 6a1803df08f44-6f8c23c8524mr209650276d6.12.1747755876852;
        Tue, 20 May 2025 08:44:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f39sm2401148e87.151.2025.05.20.08.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:44:34 -0700 (PDT)
Date: Tue, 20 May 2025 18:44:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taeyoung Kwon <xoduddk12345@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taeyoung Kwon <Taeyoung.Kwon@telit.com>
Subject: Re: [PATCH] power: reset: qcom-pon: Rename variables to use generic
 naming
Message-ID: <xyhqu7bw3kqlkl5q3q3hexceq2irm4vru6lfspsnpmxkhp6vuc@jpqtvyke5aec>
References: <20250520143612.109567-1-Taeyoung.Kwon@telit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520143612.109567-1-Taeyoung.Kwon@telit.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682ca367 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=8xVn4GeRAAAA:8 a=38eAcjmzj4vKwzUmQakA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=By6hKCY_mHIbKsINY6vW:22
X-Proofpoint-ORIG-GUID: vHja4b1OfOPgQ5MdAa0Z5HeLwC01eoJt
X-Proofpoint-GUID: vHja4b1OfOPgQ5MdAa0Z5HeLwC01eoJt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEyOSBTYWx0ZWRfX2mLUl9WzGpEa
 BXaXrDoG0K06pgk6FIdgQvWCcpiiXI09wRvBug+PODuoVfY7T3n1p5mp5Y3Q98t1vVHgz0WVjxt
 k9lbc06ldFmOlI+AURd7/zf5/wez1Mmwld53JJBMdyWmOoyr7Ztk6Zg2QCbKGbRyBoXPPBvm9pw
 HweHmSRHO9oU0D8veE/2uDZtFQPyCQ9f7hvqppIDaOP9pnsLvHphnYKLjjePSh70Y6gRAN4FrCx
 h45XIC3esRBe64grDZTq9vop4K8WSPl41Vh1ZdB3afBt4t1JopjlybJUi5j10CtWhE/7f0ldedz
 LCTglhmk1VRbDnyEiI/Xtii4o9F3IUMEKnQkqDCfWglurEMsS/MMfcjBn8cidIn5ozU+Q/benur
 y78Jno7YT0iZ1WUKH1yV2n//3nn0I/XKbUhbSCdqPETn2Vdd2R2U+Lqmq0BxHmzn5vewZyc+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=884 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200129

On Tue, May 20, 2025 at 02:35:50PM +0000, Taeyoung Kwon wrote:
> As my company email adds a signature automatically,
> I am sending this from my personal Gmail account
> 
> ---
> The qcom-pon driver was originally implemented for the PM8916 PMIC, and
> as a result, several internal variable names still refer to 'pm8916'.
> However, the driver has since been extended to support other PMICs as
> well.
> 
> This patch renames those variables to use more generic and consistent
> names, improving clarity and reducing confusion for non-PM8916 devices.
> 
> Signed-off-by: Taeyoung Kwon <Taeyoung.Kwon@telit.com>

Now your SoB doesn't match your From address. Please move your
explanation under the '---' line and instead add the 'From: Your Name
<company@address>' as the first line.

The patch LGTM.

> ---
>  drivers/power/reset/qcom-pon.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry
