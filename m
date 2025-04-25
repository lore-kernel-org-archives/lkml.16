Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4021A23B7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602161; cv=none; b=XkjOM0esXmoISGE1UALyw9s6QIpMlX6ys3g4zydFV/J9Se7bLQZM1ou85RTJ8ekTP40Og7utTTAVJz32HB8+lLL7xozJR3bYVC+JMWirYDeA9NF62XAvTJOtbDIvy3ngF6qXD/QIZD/08oQ+juoOB+sGiyYKz/qv0LN4lHPotyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602161; c=relaxed/simple;
	bh=Vq2kaZ1JliFPaYFvT1z/n9E9y0WnKdn/Apce+WVD+QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7PhYYaK3W57C8TIs3xwI8zxq575sLyaA7KlQbZVg0uVOOV6Gkb031jBMEIPFpZ6lHHMy1pQ5AqdWr/23bBKrjqK7l2TjTZ5rcFzFwIVh2Pcu7bhKH8z40deqQxEWpuVnSYA/jF4b/VLqENrmLbd6fnCqx1dOrkAaifYaeAv5UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsf3ZLbU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsf3ZLbU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJt4A011069
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i2O5HicpG8+gCzYxjVsix8Kr
	oj4gSwc+A6+ddsoGeAk=; b=jsf3ZLbU+4ZoZ1REhmf/vc+IG9xQqCBXrqfLtq73
	kDNseSuCG6lqGOq8+gzFxqZIKGR15MZ8FC05Dzsx5JORjkQlgCLdE4SVRnH5ZWYn
	9jH1i4pI5DAdRImw6WW7tHQHfm41u6MkXxb+JbQPODFB74VKiFTHJSnmo/ZZAKIm
	e3fyLd6e0gOo7BL+otxn27SvuhX3JYgHEf6fdi4kHqGwLcmfzovU4g/JobLzH86H
	hMlrezE82Fiuumk1ooA00K/itoOxmpq44c5ImIbruERcjaRAwKolOuWvf1CZJR9r
	Rti7WDwpmPtrU6XUNdiRkJblZu5t8dLazbSjcR+e1rPV8w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0hymc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:29:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e913e1cf4aso72301296d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602158; x=1746206958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2O5HicpG8+gCzYxjVsix8Kroj4gSwc+A6+ddsoGeAk=;
        b=O2pumzcwv58xtwdBBOBPyod/fNtN1MQ6jWnFQ6Jop8VmlCoWasZyIaj4LF+/Hxyj2H
         hjIm0gWvEB8gGRpLnI6HNlufXVN0N0q3kNIn2HtCOtR4PIBtDBs2On6/KZcOQLEuK6Dq
         3y+GSfu1MXT8a+77CUKqZyP51srhG4Pvq1kPlkwtVrWj7t6hW5oY3vWz4d3rFMzTuQez
         zL68Bxx3XlLlmgOmcxSpk5nxaBY1nCosEQj7IbuRGawUv2lE1uR4aeeB1U0wr+e+/w6H
         lLs8PqXy4fK4D6VXDybJPGRoq03jUJucP3XjdaNnYeajcMTalgt+CxJdQ1loGH7g6ud/
         qgGg==
X-Forwarded-Encrypted: i=1; AJvYcCXHiX5az5pNIzxkL1tSX/HTB7zjzsP4kI0hvMmZi0pkj58HBSKKbQg89QoQ6okWkX51GvMHrMnbNfxNnaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJlIRhVDfMusiCnjAgn8WeckJkywnondyZPvM632h5u3n+l50b
	winLCZXpL+o/tEK7TqJoiW0bXJAQQCE/9ZtQObxoEghaOozv9D4OcAXd6e0E45HWFGYr359UOsx
	27sAzcxNUT7YIJvErz84AYni05y9zhOxvN316EOXf8LXhl0SFdA1bzBdsv88eWhY=
X-Gm-Gg: ASbGnct12s5GneugPXl+Gpq4pVAJPEbrJD2hiSHqVk8C6sbe8qK1KDa36xQ6fnKMtXG
	qqxMz8K8Vg5KoDIOWr+4d2m1tzA4Mp8q/ZC86iVmR6DilLvL2HeV5ZoZrezB8ioEmvKO08+/66C
	HkYoHU5nvdnwf8f/efzQS96TPwGAMBl4shJvz95hfZ1W9TU7vXpqYmOLLqzf+Lw/HgP4R8UlI8g
	hAdzwSORHCwddwYxthPxZwMgbqHj5lLHkfFvpYBO4zbxAq6dok2IfBhdAm5xnsxc0jUi8VpjGCH
	jw7uxekhOYP+XoHg0XnfTkIdH87kb3LEp9uMpG1LYBOEYDazyt51RWxJlpltoGO0ZFMXqs9wfZk
	=
X-Received: by 2002:a05:6214:2306:b0:6f2:c88a:50c5 with SMTP id 6a1803df08f44-6f4d1f90d1amr4141246d6.32.1745602157702;
        Fri, 25 Apr 2025 10:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfwDIdtrIRKsVYjQf7vNsZsfKS3hF4nH7bFNPEubXKXlnRQxvHnj1wsLkMIzWwQQ+CY+aHVw==
X-Received: by 2002:a05:6214:2306:b0:6f2:c88a:50c5 with SMTP id 6a1803df08f44-6f4d1f90d1amr4140906d6.32.1745602157324;
        Fri, 25 Apr 2025 10:29:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb899bsm670471e87.247.2025.04.25.10.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:29:16 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:29:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soc: qcom: socinfo: Add support for new fields in
 revision 22
Message-ID: <7qviruo3hmtchsz5ubnvyocxh3bdixtmd5hqh2e63seuc45ixd@3c3qkottroze>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
 <20250425135946.1087065-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425135946.1087065-3-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: 7jSusszmFm1QaoWUDc8_IkleS2bhJYLV
X-Proofpoint-ORIG-GUID: 7jSusszmFm1QaoWUDc8_IkleS2bhJYLV
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bc66f cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=RlFFFbEGpoodJOQkPl8A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfX0XaxgHIXbd5w jcd6AwWNaSHwSioUs2qr7wue8gAXpj7GQhvvk9wiBYgzYFdhpVmZKAauvRX54hNxgNiAZSL4U8L cT+tVVfIJj+w2C3gG9Tw4VqLgXCFqUY3Cwq8la2OjOaUVklC3ORh+Fo5ZndMxXN82//Jb50rbEA
 JJRAdyFNc4F3aidgt2PVdQsxqwDeimsX7A2FfilvpVdeMCRV2yn6Z0JW9gvoyVKuwDXWYPSep+l /u9zBh5S2x6nWw6h+iSiTLKakGwGkMNgBj9N8xj3zzFBEE9bJVaciTS0f7Ulta/VeR4EPsdr8Wk oXQ2JMLgMMIP4E3pMS/d+i9ojORuUifAe8fprQqxbLFW0HEOKLBSCrfqTfB1XWhPPBuHMXKP9es
 VDUff7Ty5KjXpETj3NZ14y0oYFtLB1W+L/sd1scsIwa8P0IiTgEDrVR8o/yMDKCKb0JWANT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123

On Fri, Apr 25, 2025 at 07:29:46PM +0530, Mukesh Ojha wrote:
> Add the ncluster_cores_array_offset field with socinfo structure
> revision 22 which specifies no of cores present in each cluster.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2:
>  - Added debugfs entry.
> 
>  drivers/soc/qcom/socinfo.c       | 6 ++++++
>  include/linux/soc/qcom/socinfo.h | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index bac1485f1b27..13cf73744bd9 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -155,6 +155,7 @@ struct socinfo_params {
>  	u32 boot_core;
>  	u32 raw_package_type;
>  	u32 nsubpart_feat_array_offset;
> +	u32 ncluster_cores_array_offset;

Same comment as the one for the previous patch.

>  };
>  
>  struct smem_image_version {

-- 
With best wishes
Dmitry
