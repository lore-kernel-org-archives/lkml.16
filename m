Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05842165F3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743452590; cv=none; b=GHMu2w4wMw4QVx0VH49pz5VJywd8dGrGYpwEbnsUOyrMIcgzeZ2oaNlbUU7VGzFSKP0NRKFvWZBSDVg8TVwySVmyO3YPWbP7/Sux5/BB4jWy/ldzQKLNDH7VyWehFaJl8jKg3YaLsJEBszIafbjyJvudJmP2h1PHZPmqF6FPOzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743452590; c=relaxed/simple;
	bh=2GfGlNKbYEd6eGd8KETFvs5J/4h7n1NwKtdRzeRnc5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXbpfO2Be/0wuY7SpyPFZn/7lqSXzrI6WQIHgJYRbGMUZkugVjqNcqSaDG8xyoz7W3oK5gZCOaL017xckt+DyM2TxKuIUdQsfCKkRcPNBU9XkEo4wYApYReuXLx3qOX9PzFPaFY3ZbcAEJ/RiAYpDp+Mi5l4pOETQIpJHn8g2/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBJvjflR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBJvjflR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCuZm024673
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/XDH4np/11kTXmxJhc43+oag
	MOQJnczYYqLJy3cdvic=; b=KBJvjflRmuDdRLdfTA89gJtezMY912+9wModq5w/
	+b0yGderQ9faUPoMJV2sKTHYL4gSGLcqrYRh6xrv3PLUwKaIul+sImZLawy4kuBX
	VaFpGrf3iF7lyRsdu5sGrPPMhf+OIZrfB5oGD8AgUgHcCh9q+ZToHxWLUylbxWF6
	s162OJMAzC0ZaFGCLXGX0zVzdWC3l0XWsIUcPlcAl+jnknWcX8DUXjTSndZOH0/U
	V1jfeblkBKAnySt94ZD0n91novqsa60pAFsVMZz8VSuIcUbNcRQnAKpkHZZyOGeS
	875ke73XIJcta+bOQUZjfHerJjFpmmMtADNhhkTIpmawzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86knm54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:23:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c548e16909so459643585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743452586; x=1744057386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XDH4np/11kTXmxJhc43+oagMOQJnczYYqLJy3cdvic=;
        b=FyguDYyzyFW3JrLloqj7M2DnvneeirY13OkHPrQz1D5hUFcTOGv0A1dFoNGI4Ytq7+
         jCNA/fE1mwQMp8myrdlYwqq7s4Fvb+NlV5l8gt+oNuSqSAG9dJgO1KkVYDpEanjo6rL6
         uf1WPHspCcfo8wbmKtui9ZjxP2SV9NH3Uv9IN7NHNeYydsxHFhBVl4viwaFXrvZ7aU4f
         4AYml1gO7oPaXxK+QwFqeDRKUO6HjUXgMsInB5w4IVDkQ12e2/VTVMCT9IV0i6+5j2p6
         bAGO7ItVDtWdN4w7pcoXricIztFfMMlUqTCCZ7B8oXl8ARCd59NptqSkF8KB5TG+RFm5
         erbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA/THq07hQJPWYp/2yHVwdmj2hBkHcu8c4N2Z1MdsMceCvX8f38O9SK1DSbJ0RRzKC7IsyICNt6/LU3K0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPKZTitAcH+FB5jjOGlL+v/Bi57pvJiYSO56Ks2vPof6RpZMX8
	nheFMNINJJQhDJLLcEBkC5P51Rcx1JC6N/diVb+rfmhZeb6yTmQD49K+LmdxR3E1lheyW2HcsI1
	5a5Bu2znBaEDNxOD/439ul5ZjJt1kn3C0LUJFZhXbOtQaaVn7oJ3jkokeFwJA6vQ=
X-Gm-Gg: ASbGncvtLYJjuEZMbGZZssCTe9LuwWV5ke9SY+602FK2iTfdZ96LuSQJfEjlnQLWwXV
	dMqUpqiFEQeAim5pzytqDSgdTKb4m4ALmQuEdPzVJ4A8kSpKvIfxs731XuwTL9nUiVsZw7tWUQc
	6wJsA/VSczjef6aiJIjUlSGdAKhFq19DKScI2EzxSuN6OsLkP4k5PwKQ7/y2dmBnZS5j8p7Gcxy
	j6ONwKpy3EJb496PnmcHOAZkMUf+J8xrJoHyeDWlEkzoz8DpGb9fmjxEmIT+6pYBDyIYxcrFXg5
	Y20xk0NgXzPuQUI8qWlbsT34BBJYLOw0aow+GRK0QcT3jtGN467QrHfGn5Msun817j32tQ65P6c
	MIGA=
X-Received: by 2002:a05:620a:2a03:b0:7c5:6375:144c with SMTP id af79cd13be357-7c69071e2cbmr1183407385a.23.1743452586467;
        Mon, 31 Mar 2025 13:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYPejo3kER5dNDXDvNgrSMesprgR2DDS2npUVvqdvd1MymJqIcUXKNSnahqXjg6Ltaa4Rclg==
X-Received: by 2002:a05:620a:2a03:b0:7c5:6375:144c with SMTP id af79cd13be357-7c69071e2cbmr1183404185a.23.1743452586084;
        Mon, 31 Mar 2025 13:23:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c1ab6sm1203757e87.97.2025.03.31.13.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 13:23:03 -0700 (PDT)
Date: Mon, 31 Mar 2025 23:23:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] backlight: pm8941: Add NULL check in wled_configure()
Message-ID: <rub2lfc27qef33iziydwd4qoaxia3ycs4iq7o7hujfaccznma7@hyavk23v7rbh>
References: <20250331141654.12624-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331141654.12624-1-bsdhenrymartin@gmail.com>
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67eaf9ab cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cQ1TuvgcctVPKzGXpFYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1KXhqQUhCHRqSXDsNkMz9p0IGb3w1D4M
X-Proofpoint-ORIG-GUID: 1KXhqQUhCHRqSXDsNkMz9p0IGb3w1D4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=971 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310140

On Mon, Mar 31, 2025 at 10:16:54PM +0800, Henry Martin wrote:
> devm_kasprintf() return NULL if memory allocation fails. Currently,
> wled_configure() does not check for this case, leading to a possible NULL
> pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> V1 -> V2: Fix commit message to use imperative mood and wrap lines to 75
> characters.
> 
>  drivers/video/backlight/qcom-wled.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
