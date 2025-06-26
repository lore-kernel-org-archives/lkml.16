Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27A121CC74
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750940833; cv=none; b=OYiHUWkCldbD1yPqrr/w2sHl0p8d+BKvBl12i1Qm8N8EWjarLsGA1ykpoOeXpHtZHDWrVyYUdsI3wGJory0tDzdtjelRq76n+pGwAWaSOpJgcdTkAMhZ1ovepp+L9wz5p/GDA1wA2X+1p3dYwW+na4XyCDo6l5UaRYNdhdId6/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750940833; c=relaxed/simple;
	bh=OeUXM4PnAiSmHZwptWygkH9IPNf5qkAr4wW1Y9Ro3/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6vMbYHm2H0soZEbWK/r/jsBH2UKwXE6uyhzCUvk5ora69sM+3I7WmzMnyVptOl/Rrol6PzpIYVvCB6FTk29UMaG5bgspV6GYs8mzVFamjFW2U99TROwKi9XayCkHKY6Ed0vuBtu0Yn4M/eQXiM+zExlYXri4ZpLTRHF7fETsG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYfEs+yY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYfEs+yY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9UnlS026632
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z4ld+nvIY43lmGSOTvBqUnW1
	/Skj+9qjlyioayiU/uk=; b=IYfEs+yY474NZPBK6U6Z+R0Ufasg731pkB7bfpur
	VRPpgLw4daMNjA/w1BJMQ+4thwDrYuwyTndkvabJuU/I6DI9GdqpoRL/720IRoYU
	U/LpC9Any/aINvhjlU/PyizpjJNx/YNhQS2U2M5/hjExJEHUIZk17LqquDS8nP92
	/NUyE1ChzmaXJSRu7B5xDGCc2SEHODUyEf0o4JKPXFYbkHHVstyfxPHZdlYOoX52
	OZ3PM7MHqJE//7VWcAlnqzT4p8wmjW1DC5EmseuBfbfUf8Dfx27lOExjkV4egRSA
	0UK7bc29uU/2XeBdiXREcs2bdJVWpr9KOLZuB7p6YayAmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5vdwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:27:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d40f335529so300433585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750940829; x=1751545629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4ld+nvIY43lmGSOTvBqUnW1/Skj+9qjlyioayiU/uk=;
        b=jjp3iYWELwmODFuRfokeZRO4k7vBKR1GrM+mL5XxoYObuGoWE4Kl+nEqcPRIto7hJv
         8DWotw6rH9ajYPYf+coY97oFX0iilshQC/m4tn4mf115oFnXd4GTBx7BzT1/erY8K0IU
         67NiAQwKiSBq2SkGD1BrmpzcK/30o16S4mT27QdOUIkyCSCeS4BsHdE/evabEgsRxOJv
         5RNdOOy6G+kXuXAi/C/anjy/jveeoV2dM9QQllLt3oB/ETFD+FLCSYO8ewl1/69xFi6K
         eREbCKTVZEMX62UmTMvtI4zDCtA2vuM+ecdHGkwUvFGkIOlKU7hlJxNmRtkHg+0B6M0g
         ZjCg==
X-Forwarded-Encrypted: i=1; AJvYcCWoRi4TMwbj2ZvJkrWmY5LzL9MivOYl6Ue6wSzKFCfj8K/h7Nvh/veBi5h1i+aOv2dmOQyeF9OvgUFWGrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY0rjIk6h02mFP81/nhaf+UzzyOb7XJHP9r7A1g+4x/1Uhqhkx
	qtg/GS+7fWUv/BMCvH4n3yLVgtrl+UOoJJvHSoz2FYm/Cjmdfrm5eawIcVm8/VbBmTtMWFrrn8s
	aweT3YcOfKs7KmSB9Tk2t/ENmtfa9j+5G1ALLV4ByHavQ7/mjsl0YXAazANQLJqGB95c=
X-Gm-Gg: ASbGncu0MTnB0f8ZhVjEytwiq66FxuC0LIS79o5ZhcLexTmU72spF91/bsZs/BhJyKQ
	FsTfNheXdL9eKQNH5t2nMJp5QmzVRRghx7KqK90Fhtuaf56EhQKKXBtcOmqffvZjjyl8k9J8dAf
	F36iwaRKUCS8VpSRcAbORTesMdXRDecOjtengIw+CLp+h98pe2Q+t3FhlW4d4JDuQW8T7hrbb/d
	AqG9I+hSj1+ABGdXmP1N0D+xrLdQgn6/+XZVMeEsShqXfB+FLBsRGuYGlC2/UviiYdIhsC0acH9
	eNkPXa4L6ChO6FjSIG6yrzNnOnSUs9SREuIbIbgOEzZb63I4FlSeZ9qcw2kPI0hGxn+rL+TEQE+
	MPnw6Sm/buYUBL9OAfoOsagqUgeR/HWItI/U=
X-Received: by 2002:a05:620a:4593:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7d43bb920famr497282085a.9.1750940829358;
        Thu, 26 Jun 2025 05:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP9tZg/2hbx2W8BI5QOCq/2uHaNR/sHZ4rDZWc3hvxSUiXPr+NjfiZoQeQMqAZk5rWU6PG6g==
X-Received: by 2002:a05:620a:4593:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7d43bb920famr497275985a.9.1750940828667;
        Thu, 26 Jun 2025 05:27:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f00aa6sm2006921fa.99.2025.06.26.05.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 05:27:07 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:27:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_kuiw@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
Message-ID: <bch5jprookxuenjejuwlgvueigaporjgdd7h7ny2a7rb2fnsh5@lateboeubkun>
References: <20250626092952.847393-1-quic_lxu5@quicinc.com>
 <20250626092952.847393-2-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626092952.847393-2-quic_lxu5@quicinc.com>
X-Proofpoint-GUID: hq4EfoFLrJK7pXOciT6vKO7VyAF1ZVnF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEwNSBTYWx0ZWRfX0l8875V7MVyL
 fm+klbGBByGxTJxpssv4iM3FGJKkhutQFsZGdJcHopqZ+lrl9veCKUNM+wuy9478GomqRsUl8zi
 C5P0rvknyQnbD9qK486NMHm9NZQzTJDEw+TFm1+Uc3OJUtnzKOKDRku8vsjhm1kepvb1fWjXcaA
 yWh38EE9fDnO0j9TWx8SuVTs3Tcaq/7gykl6zDcAehBbDD0zKf27Yy+0PQFKo+f02eP0PMwgtRp
 hbWSCBqojH7dWHjBIi923MMgmMFW5GgFXAj9JPLECUjpeGaYw+iJDJyNt1DeBql8ghm+ftC3+xr
 fpIekI0u3+MmmusLVn7wFgVOfMG1tEbBbVFSXuj6ySZ9PjmtGgnv8WaqjgEkFYuF3Z1x9GlNLS4
 +MLd/BVUbKzJ13pDAajndNJ7dGyjFt+gwmFQ43c6Vmt0WJFhYGOy08xK4f9zfLG2iy8Uvmx6
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685d3c9e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=y0QActD64cBbDUrEtRIA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hq4EfoFLrJK7pXOciT6vKO7VyAF1ZVnF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=575 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260105

On Thu, Jun 26, 2025 at 02:59:51PM +0530, Ling Xu wrote:
> Add reserved memory region and VMIDs for audio PD dynamic loading and
> remote heap memory requirements.

Please specify whether this is required for a standard audio playback /
capture or for some extended usecases.

> 
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

-- 
With best wishes
Dmitry
