Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E43027586E
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654882; cv=none; b=a6v6ChbJaiMd8PhJfA1eXPCo2QWinUBFB3L2lqgILOvOcoe2lapj1yXylXSmn1XsLq6gEEnwiuZXv6RWBpuIT4QegX5Wl2SoazIq5co/d7r+BXBXY2bYqNm1IZCQwYSbEYv6RHxjDWn1d7cB2hJZgm1d1SHFtVgWmyNmkd6qeds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654882; c=relaxed/simple;
	bh=xIcCJSD2qx+cvFSaWeE7vlLVHUJ4S6ONQw9rX4OOUIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=usHYAui4g1RFr7txpcbVmcZYvD7Cn7QbRGbzi5v3FdjJvH1xUQzDMdlbHMCYypPYu/cFolZ60MBevPr25Ye4YAbsM77mBgghOa18cxobJjCU+8KcUj0CyJABfeV1B1ZDJokUjbUYph0ZwXzI+EBSQGYewmkZgaWpJRHL8Fb5xTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWUxnsF0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWUxnsF0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6P5fN007910
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8NH6zss8ksLhBIkZZCpgHGxMvB4Tdn63he1bkhLEuAY=; b=KWUxnsF0NXlqW5n9
	LwwPJB0GKGHbjrHLcyNVlO+rfxncJCyr6RKTbmOWZNqYWGMUsicR25DR2kjrTIlH
	N6dBo9g0GcI03d9NVR5NH/pBtucXr+DEvlBqW7YZoaWBOIza9/UZE7VqmQkq3U2W
	NlNJOlnDnrbKDSU92vQNkWl7gcd1hOxSzNSIGca8ZdGM89QHcdY9+4bn7sccxjtz
	BmoO2ni1NjHi0Nn2Sy5ezwFLUEenH8zV2PEUhZmd1THCjRfzHTM051eliZUgK0+d
	ERNR9ZOQp7CtcscRzBDA7JTP9YlMchOjWiLckCxvGe/8ahyobXJhq/D8tWF/u/uT
	z3oUtw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkgxgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:41:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8d47383f3so21311396d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654878; x=1748259678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NH6zss8ksLhBIkZZCpgHGxMvB4Tdn63he1bkhLEuAY=;
        b=vQFArzfpJ4TvtJhHw5SGu4DBjkqGRMLQIEumIy7aGZ4VhFe6z6BL4U/xHH/VQiGMj0
         rzOdWT2KYq/1ICFOwbu1hbF5ZKmIhQSnqh1C+xwUf1nhwStPVZoxUpG4iBnbb3tDMB/Y
         RHgDKUgMWE4cKaRKAeI8kv7xtVw16HJBNVTYrdeojRpyEYYhnzHwKseBdv5HxrVQFeBe
         4tPDdxnGo21DzYVxbGr8EMql+Ni85PlLczdeuysciiLkINA52htnaaBVddaI+nYroLRX
         SWep2QZnx59IfrwiF1X5NTP5iun2epTP/MHybRDypWGP4G2wFXv4lco8zDtgX2cV8Fnc
         73RA==
X-Forwarded-Encrypted: i=1; AJvYcCWKxloZ7MZhFgmDXXOMoS205ESQLTvlJhBaa30DckD8nCnd0GUNuGYrXiTS6kXs4nteHleaRKSoGqVoX4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPCB+A541TV8sP+K6LQZhTu5AwwHqAwIWQe6GFYbPGVvy8RSbs
	/MXkYfpUMQct3PKHShNJHpdHbvsTIrB4kWjrYVIW/MRScQWWlj+DTp45okCmvOU+8ti2+bi1gRi
	7v+/z29VQW2IOn0dfdubRGn0cKmJln9yJwnUCLgUUqliPFDDqvw8d1cKcg1OsrIZs4ug=
X-Gm-Gg: ASbGnct0hHSDiWDtSCADxL4gg45YjhIfcgOQRna/Rqmyz+I25wNqqo9Zye1GOixAoOA
	syKIfV6/u6p1bLKYBhJvTAnQaNz8wrMIWBVLbHDv4fnvYausrFeFq6pHK9J0SEjYJqA9ZVlUwpu
	qBFe4vYcZXa0pw+Dy4e5cXo2CxQVnDIj+keJT69SjxAFFach8xfj+Wd0TDiExlRsIE90+Lg1/C1
	arSuFbZAclFIbYhpUw8FUX88/wlLhLoLBW8x7JgaB8WLisQlRAG7idchr24dLDOKBhjrGLx9J2E
	OWSPXi3WQ6Vd/i7b2yo+owLk+whaxHEDCyvreQ==
X-Received: by 2002:a05:6214:1c4f:b0:6f8:c23c:525c with SMTP id 6a1803df08f44-6f8c23c8530mr167707416d6.7.1747654878364;
        Mon, 19 May 2025 04:41:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKetVEUOMOD7ijejFtThdTa2+lxn4IofykDpJ3wdGmzgV7qd681WbcnWRt9DJzKQiimfHKLQ==
X-Received: by 2002:a05:6214:1c4f:b0:6f8:c23c:525c with SMTP id 6a1803df08f44-6f8c23c8530mr167706806d6.7.1747654877764;
        Mon, 19 May 2025 04:41:17 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442ffaa75cfsm73888675e9.1.2025.05.19.04.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 04:41:17 -0700 (PDT)
Message-ID: <a277c632-1701-49d8-a7e0-80d28afd3a2d@oss.qualcomm.com>
Date: Mon, 19 May 2025 12:41:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9aWVMGJ49T2Ig1022-f7SOCdpT9CET1M
X-Proofpoint-ORIG-GUID: 9aWVMGJ49T2Ig1022-f7SOCdpT9CET1M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDExMCBTYWx0ZWRfX0nj0UyFBupAJ
 Egs56dBKoGCQz7Eulh+5zziaAFMXRm1MMWdNXAFHTJHQkVeNIfJUzp+xjB6hgK4rkxMLvebLYks
 bxjRF9jKo3C5qCa5KGsgYGJLuQteQikvVtMzNT47Ge4zxqYXRkAyXkG2F2G87IBpRrBsqEwsX/Z
 M4d+ybU/uSe4tBT0v8S19VQKAREgbn2z9iOjwVA28rg/xl9weCRiVipEEeqejmaD6DwWU1qmrpS
 aT/5rwqhjLPT7asSpqR2lvKozMf3PmOrr6gLuuBvMEL9jNEw+9KwE0iWy/z7a+br7fu9T53WK1l
 iXotmRUFAEQoF2eIYMl/hEMVdNodackK/WwEkqL40eIxaYsCf0Y/icpS9lZFbECcSr00Ew3pjz8
 4DaaWdYx3FvnFemdBg+Afj84myq3yKZqTIbw9vo3jEKFv0xNBVQ5PTu4Dlr+Y6ZADo3BqEDq
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b18df cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uVJRloqESzKIWsLaVeAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190110

On 5/13/25 05:28, Ekansh Gupta wrote:
> The initially allocated memory is not properly included in the pool,
> leading to potential issues with memory management. Set the number
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

inbuf is not used till the invoke call, why are we moving these two
lines here?

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

