Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6601DEFF3
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663534; cv=none; b=iZlQCZG9yIpuztxKVl2vvMm2vW4pqxqpVrjyKIFWuj7ECqtu9y1ePWQ+IQs/zuBL8CNetQBjSfwrVrs4yV1sOK6kr4kiJeZ/smbcP5EISeD+21Uw3Z+d7+g5jlHqPy3jy9T1L7c2AVpvRocoKGWmMPdJOVBKK7GvUPMrPHhmnlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663534; c=relaxed/simple;
	bh=mTV4BK2qfjbUtqotPH31b3r0RSBtimJqNdwrEbp6QFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrynYFnAexWYpRnoFcj3GhgieyGY4L3xNmHqzVHDoViSSpFgpTQhEQvyA5gWFbqE3WP2jbn1ChAptVwW4APR3Zkqm4Bx1iGlkK6m22aCTWeYUNRx85AWVVTA2wpZS2s6EU0av7V0/xZeOD91XnX6vJMTfkB+hp93I9rUhlfa+VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHTARNcA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHTARNcA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9WqU7014464
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kkHo6XHPeTMOyNCSzAjow0H/
	jYOdseS2973aNB14vqU=; b=nHTARNcABLaLMLh43n8IaZmeqPwUGviG+5i9q/Dd
	rOfwz8GDvdCqJk/4GYTrCIZok92nLO2Vr6lqFDD0+4J5PrZP17L2kv8cuW4BtfnM
	PHdHxMF/3ERUdKTY8jVTcSj6DT3/mePmz/uazvnHC/AIchzHRxoIr4kmnhEJmKSy
	jDn+4eUwDXT18HSN1aco0wm2uuhxcvLtdQNFv3Wpqahd1NyNS2d6dKxYvV1SZP7K
	lx9+sSiuNpZFtbbfiAK0AcoWB9UCReXc9aWayJss7SMR1bW16YCKxF9rX7AhlToJ
	1HlUV8ukG0VBREgsyKEuEGzzCjzu+llaH8hvDHpb0zkz/g==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4vm9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:05:31 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85db3356bafso881530339f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747663530; x=1748268330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkHo6XHPeTMOyNCSzAjow0H/jYOdseS2973aNB14vqU=;
        b=qnOEaUcpirkWNENtE7mxAqUCzDqQ2FVeR5P9YRCS/tmiB0hSGfgCd/usrjK96ViWK0
         cBQU5UHbVAo+SBlr3t5jV3MbSyCLDsNmCB9rPu5zGRhozZVULcuckK59CTGPZPEHe8vW
         x1FnFVmMtr2AeHwbJ6woYqQ0BvpcSx2ds6Wb7fZM4rpg/yxG6ZRkwpT1tMUVCOlm3lY+
         QiVptch8Q6Ee6jZJ87d3MYsdgJMq1Yszqd6HNXk3B8jv/8lm0KZ/D8XqHk21h582E+4W
         RwVQ8XesRar1qfmeDlookXVrX+QuH51NQxHGhOikqMLreJhNIGfDkvS8gPBNt4p+DIQy
         lsDA==
X-Forwarded-Encrypted: i=1; AJvYcCUree9O0TW8YWQ6v59ZrXpTJ69JojmPbasl/+i0qhNThtceIa7d4aQV57qopLl4qHuZbAs/sUf7PXjSNfE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1b1rZ7YsrX7MdXmOjKMrCAcp2OX0dky02jLs4B09LkJ9YhDAD
	FQyh9yb7JwYI7MlnXuxP5Fl4Ew27Cf33Yh2dwwPXtV8Mv75z/85l1RDZb5l7cZTIjctzx0O/C+i
	GFwOg6qOPQC7g2V3EjaZhy5QQL1xVrP2fis12T3Z5B1apvaPNrd+1/wcIMjxbb6p5fmM=
X-Gm-Gg: ASbGncsOdG+ApMwyO6Bv26rAW8P8L+Y1P94/XnMK+RLtmVfyv+iH4ONOUG3ktzVWINw
	xlJIoBOfCZ8/LtUP7cUQGdgiN8GbW/9thINdRBa+hkIj22L4Qdoxm4YI5WCFGhiUoDQD4vvPi6n
	Z9QksfGKEH35LrBZCO3HTuKuuBS8eXLndisJ1CJW45R29MNZaGZjMx5e6pJZ6SwcPEVAj4lmILZ
	q5dW8jBGAABKeEw7bLsiwIlD42AItakz8CSNnNigsCOjVYi+P+BvdItGNGCKTJtNHfILJ7x+c7+
	KNDm1gxk0CV/xxwNJQCl1ntrJYNGINe24lSjswJUMP7Y8QbUOQaIZe8gZAr76hXcvmyPhsh064g
	=
X-Received: by 2002:a05:6e02:4414:20b0:3dc:6a27:7c14 with SMTP id e9e14a558f8ab-3dc6a277c71mr34500125ab.7.1747663530576;
        Mon, 19 May 2025 07:05:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElHCzRUlcSmkePX3oMcw+Ft8vd7nE8mHJmMO5fmpzntvorhLTQD2zarO0h4A0QZ8OWYTbnZQ==
X-Received: by 2002:a05:6e02:4414:20b0:3dc:6a27:7c14 with SMTP id e9e14a558f8ab-3dc6a277c71mr34499715ab.7.1747663530131;
        Mon, 19 May 2025 07:05:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b4becsm19262941fa.12.2025.05.19.07.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:05:29 -0700 (PDT)
Date: Mon, 19 May 2025 17:05:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add support to retrieve TME build
 details
Message-ID: <6dri4ig5iox7wctvc7umltcsstrtghrtjvdwajdlgz4sb5g6nn@zyrys4re4576>
References: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b3aab cx=c_pps
 a=7F85Ct0dzgNClt63SJIU8Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hASR2W6MItGKdFUF1uMA:9 a=CjuIK1q_8ugA:10
 a=LKR0efx6xuerLj5D82wC:22
X-Proofpoint-ORIG-GUID: OCwio5gmzVIfW08VC32ohFDJRI6O7swx
X-Proofpoint-GUID: OCwio5gmzVIfW08VC32ohFDJRI6O7swx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEzMCBTYWx0ZWRfX9SlHLMEUdKbY
 dRUojKByAI6SHO2RSl3bIz7UZ7ZqsG0GMO+8VtlyoQ9v5ZVKwwqvnBSR6V8a+ZGbQDiVtTSWVZK
 fv0VkZJqzJffjwF2uxuZCTU2Q6vZzW/W03JB5u9q79sHQ5d/LsrY4ehqKtxTZ5W2TMnRt7a9W6a
 ihIAvlEI/zQUiLqOL0B3RdaxtHTB/H6rfZxCLBdWLCQxNbINBL9M9gv17m+H+aPgJZksfXhEXuw
 27+0VQM34FGuoErrgl9F19Q39EH1XuI13g08RjCgQ0ueYjs+53n3zeh7pGAZZedMA5WlHh50JHy
 Pe+HV809AqayzMjuHza+uYBJMc4PeBHEP1C9OYnnC823MwMmfaZO1SM49ojhD8+FaTZ7suCLQ5X
 gMsl5gUuk7HDYjEoM4QucKftxXo1W81NU/vqjA1wkATV45l8v7jXR/ANKWroKyoC2GgGx6dA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=659 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190130

On Mon, May 19, 2025 at 07:14:01PM +0530, Kathiravan Thirumoorthy wrote:
> Add support to retrieve Trust Management Engine (TME) image details
> from SMEM, which is present in the IPQ5424 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Note: On IPQ SoCs, the Trust Management Engine is referred to as TME-L
> (Lite). Other SoCs from different business units may use variants like
> TME-M. For consistency, the image name is retained as "TME".
> ---
>  drivers/soc/qcom/socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
