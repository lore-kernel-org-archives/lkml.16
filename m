Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14EA225414
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710403; cv=none; b=laiJl07xgB4P0j4iOeJMZ/FvKP4lRa9fb9tTcSAcH6gSUDzI75WraQJ6nGT2hsiWKMb1DdBAohG62CpEUC7qYHALK7lZfiM1OsWdtGUurPL+xED9XbhOJY0F44LWDkBi57fDTpf+lPZBLQAFgyzNrcNIW/y29mHy8k78UbtKxSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710403; c=relaxed/simple;
	bh=Vb2ndZfQWhVnxIuJ012CE5O/e+1gyQzIVTgTH+O052E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgYZNHyRJ4vIapwDwy6c0WuDzPchZrLgJVsH3JIKjYaiUrvDGlEXZJDXdCje7MQb4KPgMpLKrAvc2qv19yocXlym6eik/jCLrUOdQY4RpP2BWXb2QZRv2UxOmhd/y/eQJxxuyclDs0oSUFU91ddRnvEjDRkudIpYTTFYBtMEXVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2uQA0KJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2uQA0KJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484WcHF002555
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 13:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=960g2/Y7jbcP5tMBnkyZ+/1n
	tYIRcCiwlH+N70WW+Vo=; b=V2uQA0KJVbl13br6mtbmQFmM9dnH2fEoYwj6fzY3
	nUO1F4JnA/0JiiSXIZfGJUfYWAQNdwS1gPb3n1p2v8KlcNDWFakbJR9WZ/hLUDnE
	whM8JczNimCMf8fuTx9K3lSZDkEpXuC3CI+aHDMSGDO5KoAd2gO0shfS0e2RLMSt
	DWp/uvUnFShtXrRMKoFhRfAjek1yE+Z0azJp3UfLWvVd+Q/pqhcSaROLio+zjBis
	MfJdjOUg2P8NObxfJca6LnVMG6FGOYxy9OckrSlc6zq5/V+PMCpdD8U294jESRZQ
	sNJP1ycQnfLvgjz4lMNA+1YlKdsAr9hC58PV8nWlcsGz2g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp59dy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:20:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d608e703so196902685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710399; x=1747315199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=960g2/Y7jbcP5tMBnkyZ+/1ntYIRcCiwlH+N70WW+Vo=;
        b=j93ybZGblaOPKv9SUNHrFA8cDvMHXO4cw9uW6LLTWy2IO95VYiT/1mF4HHxH4yu8ye
         zOzP+CNIkkh/21nMFEYJIhvYHmGq39H+9wbZZU99nxt4sqmlUVazqWlWoIgyQw0xMPr0
         FWutUeNBf4HUsODpoagK0M6nYg/L89mSB0He5CUUiNeQksos2K+XLmxLGx+8YyF8KBKI
         lvq56v2eCuvm3zABG/dT808C6noLjxmqbHWhLs/48xBp+PrugcaqeuuSUXHXQ0MrtSaP
         apnDuLh3ESD1wVh3WpmN8br1SIu+9bkTt/QfnLggCpehxpim3+VisLezLgTIoAQW4jQP
         i1jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfvgmzFH6TvSgDgVZSkcFdczB/7cDLkwtYH/aStPuyP6kn1NzBz9K+0/uKjIRwxfHABQUiyZ/JIEGbjAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjJGMhYVrieJ/2x1NuycEwv99PeyVjX54g1KmvDPxJg1LMewJx
	KLtVs0xZaEdFG2Cm9UiHm1fcTjQd66yFJI2n7ErhoxY+LeCGixLxkqaYDwzC5ztT21UhfBj5S/J
	PHcX325A3dImy23zLBLqGe7CcY9nwqATxdAOIQGyiaNMtiWEFwUJa46Be96WnCrmm0Qy+vsP4yw
	==
X-Gm-Gg: ASbGncsxyc6/lPML46TkqwMej0ueDe35IVihwc8QQoGotnnk98XJOGHZVnQfh2/9Wpm
	KsrRi2LwMKj9fxEpbBLkfhZFNbpyoYqShHhxDMBpCEyDpM6vcTuiXbiIPF5SPZcnmX8PD9zq/uz
	vGO9D1mwH57KDeRzC0dXkt8A7TO8f2l/JEI74TdwCiEUXJiZyqrPrBDNr/waMePaJlhcPphteZp
	vub8FDROkEMjl6+4l6gIMGecrroz3CZ7ofFhS/3DPiJmYNhFNn4Q1adC9GOuJPtg3W/T/pIkiiw
	nDz5VeM3qZrEeaGLCZU9lAn/1OTcxRhsxcDiSS80ro4Eo4t/prR2E/0Z0l1lXI5sv28zHlY4Bd8
	=
X-Received: by 2002:a05:620a:44ca:b0:7c5:99f9:6ada with SMTP id af79cd13be357-7caf741d0b4mr1149272485a.50.1746710399341;
        Thu, 08 May 2025 06:19:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3lNe78VcCcWEy1AnXymGxoR6WvakpzlFpFa7RK5KkM/cGbvKzb7FMbulvZ4fPo67Mh2bgxg==
X-Received: by 2002:a05:620a:44ca:b0:7c5:99f9:6ada with SMTP id af79cd13be357-7caf741d0b4mr1149269285a.50.1746710398992;
        Thu, 08 May 2025 06:19:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee2d8sm2681252e87.136.2025.05.08.06.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:19:57 -0700 (PDT)
Date: Thu, 8 May 2025 16:19:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] soc: qcom: socinfo: Add support for new fields in
 revision 20
Message-ID: <fcwzy7ih56bdnj2a4vdov4sg7tz6cwj3wdg7zitwk4c6rthex5@ztbgptuacprf>
References: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681caf80 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y_N5iSi_J5k_ybs9BqwA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: n8j2wMnEtUpK8BEJp-B9N33Ga_jxiko_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMCBTYWx0ZWRfXxgRI3wLDEuJg
 +DdhqXik2PLOAOm6WV6WGWnw65CoDivOnHua2lDTC2JBKq4qiRC/6HRurhr5or8jXZr/Bri70nR
 FM2Ql0g2TfADmJhLG6wu9oYD7ixOnLAZDlljxqOBLED3q0uqow2uPg8/wcUkde9DX5+BDaSPDSz
 OHDQT8yzoZUszxgnYnLpgqLdtbJoSgaVt+8ZTx7J0MMf7/C5DNYmnw7WmRuGMPJUEDVL7Nr5fs2
 2N0gs/nfcVRZAuPrmmkIRue7LH7dfsGC1to4cVeZVatPgbrhWdnVHWdIfC0ee0My198pnBngiHu
 uH8x7G4SOZR/uG33pNyHnk7ZnBCRjZR/8TmDgIP3oQW9e0P3PG7RrAkhh4vexE3yBXKAT0kXZuo
 qZ4RcjxddQ3oCgrEILMc+cvJsXmyi/fYT+znKy6+EsFVAhm5VnZwLXYDTY4dArJhN8X+Nju7
X-Proofpoint-ORIG-GUID: n8j2wMnEtUpK8BEJp-B9N33Ga_jxiko_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080110

On Thu, May 08, 2025 at 06:42:56PM +0530, Mukesh Ojha wrote:
> Add support for socinfo version 20. Version 20 adds a new field
> package id and its zeroth bit contain information that can be
> can be used to tune temperature thresholds on devices which might
> be able to withstand higher temperatures. Zeroth bit value 1 means
> that its heat dissipation is better and more relaxed thermal
> scheme can be put in place and 0 means a more aggressive scheme
> may be needed.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Added Reviewed-by tag.
> 
> Changes in v2: https://lore.kernel.org/lkml/20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com/
>  - Added debugfs entry and described more about the field in commit
>    text.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
