Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD15327701
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 20:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749327271; cv=none; b=lRSQsJMFBS/eym5EvL4r9KWHm0OYgluIXGcpasWex/UeYxY0zqFlsfKnQ0MAXj6j4b5Ec2JQeoo1+QlpKyl/mACY41EzCef3hY7i2ldHQlDZzjSxLD+H4reaSk975xTZkPlyQ1wdt1NXom6ATRIypA5b+LQgd1eLJs2BcFKLOnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749327271; c=relaxed/simple;
	bh=/yTvjJSbmeBkjetv+t8paMqwCZ7G5iKcabOsmKpoGDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdYeeIqJa4v1pSdh1KJ6CknQ57iGBADzOdaplH3XLLxfLxwT+1j4PqIY9KWFhqAPjaWS49M9mn4w943OeTTMHqyLY/3ILUbXPUkO9fdYawU8fjyk+3DS4RqpEZtCbzOtK+6rSZosewGJ8e78TVodm26B+LJsdRrIf8Jdh/gfO7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWBtNL/w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWBtNL/w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557IP16c006817
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 20:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=neSEr4Vb10TXp2iyqI1V1pKk
	tA2cv81JEUUM8szWa8Q=; b=aWBtNL/wBLh7CzJ6ADsTcd6RZes+GaWM9LycJcLq
	C7Jz4+8RJe8RokAt8cHhZbC99Sc4sCvW25ZKoTUthmsXUo486GQvgMCGpPNJs7OD
	eOdlhGb4RgKYbOexm82vfpwVDVH8b2VVGEHf97jUZBd2fbtVw2g42uLrUiSdUxxA
	X1N1yxLutj18RPuwltXnToYvs9w8ZI5B5g/fh4+DlEooQepkt3AxS/0FvPHux1XW
	CRWYhppRcI6mFcB930+ZjmYG5eRtMJkCYiitb1pxlJahvDvTV3FROEWZMnz3SotO
	aaXj1Z64Xt4i7x6ECtaPNKIzwQEh2HjpoRnI0PP4e4d89w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6j8yd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 20:14:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so943016085a.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 13:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327267; x=1749932067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neSEr4Vb10TXp2iyqI1V1pKktA2cv81JEUUM8szWa8Q=;
        b=RJPGrgseep+5dstW9Lmc9/WbM4ycfwv3AuJaqhPn/GG/A3YxreuUCtc8sABdl2ELum
         51pb1oMfX5vc3WNtrMZA8x1tW32lg1CWy5rbaIZmzSmrapVaSyFsIp+OoDwvy4j9hklR
         I5lEWdC9Wi3jU+XWym3qlWgRDa0SA9gD2nb7fwoSCLwupPN5WqwUVNIBIshG2B3zebVA
         IrOF316nTOk5VxgjuAguJYcMzT4dJqB4I0N+iH+YGgGodNi+LvSkqpHnuLeJA5cI5dDa
         dsOp2ZQ3QW648xh4E2SH4jJ4Ebv0p7UBRDRoU3nO+bMbnUomfFxKXZsEB2YDY2qn3bze
         bG3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOUAxXLhFytwtKqtcOfwEyTqBhIk9lYcwzQz2Xri2SUAP99LTBWXNxAjd4TcefYD3EJsRC0NEdzN7jcK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGuca8KApygR0C4fo1fBmhaX2EzMLoNr9ZMGC0m7NL0U1t/r0z
	mp6hFep+x7AYa1uzsC7mVKWKoIW579MyngVPITJkUtOBbHrn+eENSivg0eit5w1odX8QPNMX/0h
	0T1NUmAUAZ+aWB3RpmVorHR2WXt6LcW0cxiqJZhKza7S/yP8UtHnsKEGPsYWmrA+cBUU=
X-Gm-Gg: ASbGncsw7gFvL5vGg47xjHYCqWZLU9LEYGI0Q2IMeQKcQbfOI5SoBxH7fc8iHRXipCR
	qC9CDwvUDRg6MP5iX2M0G6DVvAdwZZPVw/6VyFU8EZbtcvTJnvY08/6sS3qkj+ofyGCms54glS4
	96xwkebTaaCI6EXxQP44lGdx4CnLZ09Fl4EMB29c8HwW1XB1mZkzpRKWB+aD/kfzg55Odqn810x
	0TrZ7Z77jVyOXU7/6Xe8j+oZ1qy2oHxlWQrrlXZ9atvWYQRUD6BIxwu2ig7tpYPGMvUbGNuYfMv
	PBYh910QDq+lN9fZNQBWb2t/yzrFOvTxUBJWMeDDyfTcF26hrnmr4p9eISQ7g912P8KxW8ygLoo
	=
X-Received: by 2002:a05:620a:244f:b0:7ce:d95e:8d9a with SMTP id af79cd13be357-7d229895ca3mr1050771185a.28.1749327267631;
        Sat, 07 Jun 2025 13:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCuag0taTHrzm6R/+ZyR5VGeUYcsVJcuUbo2+TlgX3IAKr2Foit53gWXRD7B4X3LAeA0xVTA==
X-Received: by 2002:a05:620a:244f:b0:7ce:d95e:8d9a with SMTP id af79cd13be357-7d229895ca3mr1050767785a.28.1749327267232;
        Sat, 07 Jun 2025 13:14:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b0cf7fsm5606531fa.12.2025.06.07.13.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:14:25 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:14:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
Message-ID: <5xb35clc3wnnwpdnmqfminl4z6ok6nhoxg65hwgyxegxguby5d@fuks7fc2n3pf>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=68449da5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=K9QtY5NQ_aNozdUEqbgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: x4v6BFcP9x5wPw1jbyXXQVef3Q2zIsE9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfX8a4iruTQ5xHU
 f3w+XayRPp7goLCTyrS3bLbi6MSz9ZV4CPZBjeKmRh6CwqeJlfXJfLf22+ctOjOVmxN+wImzPtC
 CE41p4mZkkuHSJPJIZuDW/AdiGWV1UMg9JIwSWbkhhjOdVMHNba6BcvtY0mwfKH3SIZ7BiInzag
 TpSPwv9JDwp7GDgpnvtqoayr/Barw12RydRPLm2Nvs/5+pXpPA67maBVUMwkXLJuJLLlM6PRPCm
 TGdqZgwfki28BfSAJ7Sx5ckEQzulIGcWxeOxCbZFDDFiNASSYtU2a3uKVRLTMkuFb2GKldljHiY
 gg2fRHM9o7DxS/o0mA0Npnp1GRHQPz3iQTizJj2VkpOjL5bQaKVUIe3XAEy2m/ro5nsGG1TK2j/
 1y1dLHj9AJdbgGuovY/08SRTMlgE01cVp73YtrkPF3zSf0q6R++hMJxEqMObFiQ3eVK1W359
X-Proofpoint-GUID: x4v6BFcP9x5wPw1jbyXXQVef3Q2zIsE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070147

On Sat, Jun 07, 2025 at 07:45:00PM +0530, Akhil P Oommen wrote:
> Add support for Adreno X1-45 GPU present Snapdragon X1P42100
> series of compute chipsets. This GPU is a smaller version of
> X1-85 GPU with lower core count and smaller internal memories.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 38 +++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 70f7ad806c34076352d84f32d62c2833422b6e5e..2db748ce7df57a9151ed1e7f1b025a537bb5f653 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1474,6 +1474,44 @@ static const struct adreno_info a7xx_gpus[] = {
>  			},
>  		},
>  		.preempt_record_size = 3572 * SZ_1K,
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
> +		.family = ADRENO_7XX_GEN2,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
> +			[ADRENO_FW_GMU] = "gen71500_gmu.bin",

Any chance of getting these and ZAP into linux-firmware?


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
