Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A121933C9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745224102; cv=none; b=u7e5y6OJUmZD8eBzs+zSlhtK/3tSuDJUP28SX9U7nv6TxltbqC8LWCHGP1oRBo6YMvAF+cd9BFuAvXa3s9r26WFKP88efQuiWyWBKjnXAmpC8uLDnTTgO6AYZkstUFtWj5ZfqJS1S5vcoqq8ejZRugtIUKdrM7DfoBzbqtCKNjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745224102; c=relaxed/simple;
	bh=y1al2whRLU8QZGBLd24ih0gOg/ODjoIO+E/2W8ziPHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hF+b+o6sRcoXBk6pVRxKCp9j/i0H6jH4ytte/mhcOpg4DuTOGKhfwnrj2zSUyDsoG+if5ChRJHzZygPMOTk7AeQSo5d/gR50uUpYmiGh4MN/oRGCctO1G+iiHzE4YFzp3Pn8IpE3PXgpnio/pWZC9FZWYxd9XrJuQgufCW7zwc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYW2bHZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYW2bHZA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNLB00031843
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QR5gd+dRR5fQUEaV4R9A66WP
	hoDwvnauhFrM55J7cyE=; b=KYW2bHZAuL7GVmhH0Q+aiwJw2GtmFtRMq6S3KGPo
	ORSQnV2lcFzejDfBGiEnROhzIzuFArvR3lsurROQPWtuSgt9+7WtjtrUPGHbjuWE
	WDrQaJWqtMl4cNTuo0tLUXaJiiTgXMDWLP6cq5nTxF6dNZbyjO+pHnM1Bb9Dk3vC
	oh0ME23hc4Z+MZqSqp6EiUfC96yKL6Xh7OctQuV1i5SOhpbXhy/Tzsqo6xafW1R7
	ASdJrPhY47/dI4F+yDkCUJjSlfD1DPQ3sSGZNcmor8DY7YFfVYVskZJK6uNCbC5Y
	TNyGMTNcDG0c8ZZXXXqUuUEX+YKVKhz+OSok7IPRLMjVkg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jbjnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:28:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c544d2c34fso511597985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745224053; x=1745828853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QR5gd+dRR5fQUEaV4R9A66WPhoDwvnauhFrM55J7cyE=;
        b=h5fmdGNeLaqXe4KsWFfmF8M0TdfvN8omFUPSgDRZoh8O1fNU9Nf5LCcksN0D6zP/K5
         ymMLYg4SKoK9cX150xjJxb7zr1R+f+6WIwndk6XuBcHrRQFE/CmooD6jM7+3oVFo+kHt
         yGgKs9CkS42spbgyVgvoNX5XDPc4TQnZtofHd9T4n+MnmqvfIPDKTMh17CJ5r1IddaIl
         1yFtu0cZypO1fmEWzhbYiWnrrZaP6PnkdANu0f+HZLZFFKTYySU1pcqlPZawzaLJ881E
         8itkJPh74ujdeXbUEbvgeajnNxgcD6xYgSABcwqZ5nbMyxOwSnqq3KYkaGcnoVeVcWkV
         ja7A==
X-Forwarded-Encrypted: i=1; AJvYcCVFekXL0e4ke2SLZoVmbD+Z84EEkPXcRJqVQW4x8VOE0r+oKCNZWAgiZTl6UgaGxmxnm0TiSxfXq7igAGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfLP1FOjdtUlLowZ8zYIyck6YPfmZMepyGBCOj+QGCfEOyH5+W
	CRjIofYzQKan7jRUZee3Xb6wuMf2jW7SwbVu3KgGFHeJHlepC0Lb6j7cvL+9/MhYJ7z5BGrvGu/
	2RpYlZqzAICRYnEeemnQwG2Ky0la9OO+T2byrpyoUVYaWpPxkhiuoig1cKdfpMLM=
X-Gm-Gg: ASbGncvSYQIfPnFLyWArMIecZWbYwPi6bPd+r5HbGhfj7WXiF0cDpqNggq76JreYuYa
	eRebKvlwh1P/rEKuxGXYCYpCKZhBvBsh8eYOp5BAOd9SqNxNZR+l+eeGgso1NdVyUFq4AiuwAiS
	q4A5lAQiUbayQtfVY30kg5TwdCV3LGxnqvC6AUF49dqLSpyWifwsj3sdWeOvG2R4yRoMgMS4L81
	UJF8HlVw2PW8CC9Dpm6j9ipcgIbMHUV8kdeHUG+6J8T6nSTwjwU/E/VQO9RZfGQhTenWzpoKr6G
	GSkXNr2hBmHHB7xOVfuxZ6sBFuGAurW7mN4xUmV8P3En/x7WJdBsSIc2o+HRD+/ys90UcrLw610
	=
X-Received: by 2002:a05:620a:258b:b0:7c9:25cd:f8c2 with SMTP id af79cd13be357-7c927f9a154mr1745406285a.24.1745224053344;
        Mon, 21 Apr 2025 01:27:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGedgHyctiheR5eqrlzlMvKmM7DTyttbtDLSE0k3tCBxJ8UaWl/p1CnocaTREfBWeFRrZkBEw==
X-Received: by 2002:a05:620a:258b:b0:7c9:25cd:f8c2 with SMTP id af79cd13be357-7c927f9a154mr1745405185a.24.1745224053051;
        Mon, 21 Apr 2025 01:27:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e541d95sm873544e87.96.2025.04.21.01.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:27:32 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:27:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, quic_jesszhan@quicinc.com, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        asrivats@redhat.com
Subject: Re: [PATCH 1/2] drm/panel: panel-samsung-sofef00: transition to
 mipi_dsi wrapped functions
Message-ID: <juawuyriwzvstzyvtkv5uk5dtlineq36xqougegahcpijqoh4y@ooc3zosckoep>
References: <20250419041210.515517-1-tejasvipin76@gmail.com>
 <20250419041210.515517-2-tejasvipin76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419041210.515517-2-tejasvipin76@gmail.com>
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=6806019e cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=i7Jg7TBL8QnUCxN52AwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _SbcbNwnA_7JvHrKhpD_JcwSH4M-mQrO
X-Proofpoint-ORIG-GUID: _SbcbNwnA_7JvHrKhpD_JcwSH4M-mQrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=858 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210065

On Sat, Apr 19, 2025 at 09:42:09AM +0530, Tejas Vipin wrote:
> Changes the samsung-sofef00 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c | 70 ++++++-------------
>  1 file changed, 21 insertions(+), 49 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
