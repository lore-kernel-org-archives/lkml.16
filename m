Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073792459D9
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649874; cv=none; b=S+3Cz/sOM2QvkIuNnr/CiFF6Q5slA0/Bfua1FbwQZhDyAEqUYuGLHDYG5wK5SglMSEqjs36fi0Klkdp8aPIHEZEEdxEnUBU8/EQBO7uJaT7Swcj26C21vMJXDlpFu3+SgOsgjZ+hskEoEWZ0neZ3wTpQBcDNnO2p1lKFkqYJUwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649874; c=relaxed/simple;
	bh=RTpSRZGL0X3STcswqKQnb64LYoUqyF4tFZwss7W8k4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JktvrkpwhL5xuDVWgO0h2W6QbM7v14gS7Wgvy58q5aEiNVttM2PH8Qu4piZ+xwCq7nPhgBIJz7+4N5moAj5oSOKEXYTrvE/BiTWb1OYpQ/UOGZp+sPDwbSyU5pz8+NilNlkPCXOmGNmTfo+2zZX3T1i06K5iaY2xs2z2DpG90H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRStUiC/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRStUiC/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9VVGY015117
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/PcwuAaLrQXGvgujDx9FZz79
	4RRPKdZjInGYaT91vdA=; b=YRStUiC/+PEBnK+aUKPSInChgZ1rH5jhvs6s9CZ1
	2JvdHbyqJZssz3G9ptixLY8vOHhCYNX+gFQ7E1+sDtRBIkV7smNQaz+os/G5bzVH
	OhyttG4+xuEqzLLL0l6zDaJRKcKIWww7jU2uVybCDat6YwN0pZHhW6FBEDs73wTB
	wzSNa/7e1q7W8PLFqcputgovJWostoIT2YJPpW9lc1DORqxyHUO2O7G8N3sz0QeV
	sV57EtDk/Ffa4Z99C6/Ek6t/GF4NPLD53dbBqcUjyma/e0oTbeEnWrlBYOHe8xut
	cyKYt3UPYTXXuMN7nnQb0EtMkWpwGoL42jjsN61iFMUCRQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9uyge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:17:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8e114ef64so2818986d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649871; x=1748254671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PcwuAaLrQXGvgujDx9FZz794RRPKdZjInGYaT91vdA=;
        b=L/US3afb8Veggn95xsUkKLjENpe4kNJhu7rRLX3gg4AhFPvYP76L2j377eNs8T7G9b
         jr+zE+VsVhuBvg2FQfDCGlrlDAhoTFZLCr0O+dz5XODYmwyoAA/JMxZSEi+idIe7kuaa
         iKr49shK2s2M+fYSQrKdweG0+QNJyWXgpYZ1Y4umV74atvkX/F+/jusQ3JXzWydSSTsi
         XrYrorgGY4efBG3TEwVdv+QgS++s8QT30B/KWSKCzgnnO8+2o3OJhs1/Vn7jRzY3/hkq
         fb55z5VNgwrm1JvwEZBQ+ZIaBic49z1je6gVjuJdNalmgfbhKmuuHJ6PKwSobtZRLEok
         gXVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUnqF6IB3T3ltg35lOtCRBDMcLUdEbY0oG03XfHbadsvpegBbi/C4k9V0iMHen8sqcUbj9dgijCTKhKfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVOeFL7dKksQHfpzsyUYxpjbLSX5yDT3iF3LAp4ibfDDJxM/YZ
	FK1HoOwTkFoKZAcAYFI3VXgU9KnvrVMF/r+RVgkrql8x9t87Bi2wkqtsqFAHDHMPC3GA/WV54if
	ZctE/DSsjljqpoNjtKul3tj7JqnCURWc2KafX+Ari7oMqET/J5gCF68pi7sHUp08Ff8w=
X-Gm-Gg: ASbGncsfvXL8Xn6iH+xKalba8ucInP0evm03SZu0eShboMothk/yYsVVAP68pkzfpog
	CsZMsfgUXJ3NTLXl4iW2H4SGXRt3+d7z72LmIA2IEKTpEm+izgzz6+jDBytgLZfNZYFEleP539d
	L4nPkNEaySDPZhyOXa/4kFFPz8e+LzMGwHrzL7ZDtmwGX4TqFpkb5NtKsTCjFFYDEpX4NXr6kh+
	aZgXlyuYlN3N1n6/ZHuqH9o/VCltjKHUDWV2a/ZLwl67y50GgwMCSqEfkcxpnfVpRGjZQvyXl+m
	+8jhdbs6adfHxdH5RpacWTl0fYVZVmCtqm3IjUInbCf12OrT3E6q+MKWDHEr+ouMuzAE3yeUM8w
	=
X-Received: by 2002:ad4:4ee9:0:b0:6f4:ca4f:43f8 with SMTP id 6a1803df08f44-6f8b2cc876cmr171598446d6.6.1747649870054;
        Mon, 19 May 2025 03:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR4mBGKiUglDXqp/Q3z5m/L1YYyGqwaRe9+bf0h0QCUbDpcyPM2GI45j2fQ+VZaF4AFNwjFg==
X-Received: by 2002:ad4:4ee9:0:b0:6f4:ca4f:43f8 with SMTP id 6a1803df08f44-6f8b2cc876cmr171598206d6.6.1747649869690;
        Mon, 19 May 2025 03:17:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e70181b4sm1794804e87.116.2025.05.19.03.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:17:48 -0700 (PDT)
Date: Mon, 19 May 2025 13:17:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
Message-ID: <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: Ejkwm0c_GrgoGpk0Z03C-qgC5dY4TeSW
X-Proofpoint-ORIG-GUID: Ejkwm0c_GrgoGpk0Z03C-qgC5dY4TeSW
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b0550 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ii1ax498U2AZhM0x0wcA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5NyBTYWx0ZWRfX96OADw5EFmN9
 2BahlmLwKvsSYXtOZGa9dBQVJc6o/eiAtP1svy5E72vk/ErCDEzFm7rAwA2GcyjJn1DZW7RXK1n
 WxJhMbhDm9qEuwUeHV72eBay1twWV59QP7uASiL5mvXEih+biR5UCzg2iW9IxrGStx6pj2SjDSB
 kgWAdGCAisWipZRsDm8gj/h9pQD5BQqIsSJrHrpeGxkUHpz8e0iFx0ShXCZdEaoUmAl+9zdTc8I
 zEcwFpsdYkhRcxaxIOxVoMNt4YesrNGLu7apdLrHntOVUEwboByV2oYn0A0tu6j714LWJRjHxaO
 wUtFUmnCU1adlA2021idMth9UDVexhbYlm40Ygct8OIm0RLvRcvC+IFVLXr8SSiA+5H6bnLNCGw
 yreUO5BYiRkzJCQsAxRRSb3g56hlGbf2aEOJe9yZuOI3osthbunqn51ZMpoEvKlxEFWLdEbn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190097

On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
> The initially allocated memory is not properly included in the pool,
> leading to potential issues with memory management. Set the number

What is 'properly'? Which issues?

> of pages to one to ensure that the initially allocated memory is
> correctly added to the Audio PD memory pool.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d4e38b5e5e6c..b629e24f00bc 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		goto err;
>  	}
>  
> +	inbuf.client_id = fl->client_id;
> +	inbuf.namelen = init.namelen;
> +	inbuf.pageslen = 0;
>  	if (!fl->cctx->audio_init_mem) {
>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>  						&buf);
> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
>  			fl->cctx->audio_init_mem = true;
> +			inbuf.pageslen = 1;
>  		}
>  	}
>  
> -	inbuf.client_id = fl->client_id;
> -	inbuf.namelen = init.namelen;
> -	inbuf.pageslen = 0;
>  	fl->pd = USER_PD;
>  
>  	args[0].ptr = (u64)(uintptr_t)&inbuf;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
