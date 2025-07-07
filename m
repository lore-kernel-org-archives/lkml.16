Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612221FFC48
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888347; cv=none; b=sIyYAQ6PvuFdihiaYcv30GH3oW7ho9zkD0w0mdwUN4D42oQ4B0Yr+YYFpI99pMJtZT3wKpN3+GXyanyF4iBhfgg/9YAHa/icMKJnjqG8nw35dp7hv6RwZUy5qD+Q2lhDptVGyeN+HFkufhhfeyaxpJTE86zTZ1U0QG9aENRt71c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888347; c=relaxed/simple;
	bh=ZmezPv1rIdGYHYrJ58CilZL0h+oTSbTQXl7wE/eVZrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQ2C1RvHDbdhsXs3m4KAO2p/a2mmKD/fx8OW6Yv7313GFzltIzlcrk28h8ke3Txe/BloPbHn3iwi2V1Ua0ydS5zzD3yDI1NnMasWv5D5h/CXFBUjwJ5wCJRWzxjH3Cfvo5dRMzo6fKwz6K5B1Am8MLVBtFcYQbtV1gcXJn6ofPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4i5fxSy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4i5fxSy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5676ovaY013805
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 11:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rRPwK/HpHQQyKqdyDpdRFDSGLrIeafNrEDSUmy9NFH8=; b=X4i5fxSyp46KSI99
	V2EiRuQvPOjvULnaHqZ+39V/fqhpQcRfmQoyPhCY4JBc+SF5y+IsVSemm4ElsnF6
	bKpLBnZsYR0kD9tf6m67lhEg+e8a57vywOQKuXk7g0KKXdGwgUM96xQprDEpMEA9
	YnmbmWcuV1Hvc/J05bxGbwxC+AyfqBm6ocol2IgxhoQEoycVkFS7SxZ4xSfaFLTW
	DKnLYd1mHpASlc4bl/J4dAua4KuwDKcw/nfmnMfK1BA+E1aFfcJPPqPJMwGJtPCZ
	Kq9kY/CYM4aGAA0IaukaC9k51XeN8/K7CALjG5Ueq/5xt7u0trNXHlJk+Es46XTZ
	/Us1+g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0j6cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 11:39:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb030f541bso12550376d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 04:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751888344; x=1752493144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRPwK/HpHQQyKqdyDpdRFDSGLrIeafNrEDSUmy9NFH8=;
        b=X/OfmC2wnimQKyI49d7aZlqRWBUS/Vws641VLJ+Tw6FWfs0L11ASkZu9PUIg/LjtvR
         Aoi0gY+wygPUYTw4yF4o3WRm7GbflkA3j4UmWS5ison6+XzuJaWr5Ih3aiKMGJmaw5N3
         roS3AHdy6V9zgBIeBVL1HJFehe5JO6xO49rK7FX0X4ZQfc9eauek1GD8DvwDblb9iQP9
         xalU3Aeg6u9+Kpbs+39wKoQgM5CfVj+MNPJJIMsntCNHswL1m+2aOKJewyIOlvhJtwxe
         4S8OLZlkLxl6f1dTLMKwrAo9DD5bnLeTk6WdbpTLUIiDx2WWwn0QZQYDSG8ULj26Q9T6
         q20g==
X-Forwarded-Encrypted: i=1; AJvYcCUBobtPSZo1leqPo1/PaBJDrOTN+Y9adro8GP0MbXBJMnFkgw+hadeKvN3wlch+GTcTiK+Bv/q9ii1yo3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2uKt547tTOxvMEs8nmVcxvRXuRJFoadJpd5YIHimfwS2MBXID
	ktj5EFGMdVVOAR+Sv2edCQJR6V9BOaR6y4i9rLibxf/MxyY9qS6DnphrtF3vvWcRUesz2vfN/vt
	uHW/QN3rzNmYls62nP1KbJz3t+drosItK+jLtdATWW6VLGDZVUA93OEPHLEwo8lD77+A=
X-Gm-Gg: ASbGnculMjB2Ffn369Z2hf+El9PbmVPkemx70P2+GTjQFERdGxvO6sYkywz549srPud
	DxsWU3VgzIjA3/kDjHCHpuOAxuoZ4jV7/VDQ3Mr9OXCMtLyLVirneyg87n6/mwvJQ3MBMTptg3e
	kXlDW1jZzGIXMSLgdMYyhktSzV1LWcp+nxh/k1avXPLskVzMHdV2wDSMX6FyQ6u/eitb5U5x1CV
	oO/DxXBy4S08kjonMNBVVVrJhkGvIwwEuFxYcPFeV9k8BXJALDvYQscdO7gWhTarHB0BFe2Re/2
	RfNVY5T2Lwos/ZnXtCQPlmEHlWVYCrW5+RkaRSxfcyGg2C7UgqZvTxFOBPvA9ZYXEOgqq6mzr1u
	54fk=
X-Received: by 2002:a05:620a:27c4:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7d5ddc71ca6mr618519485a.10.1751888343970;
        Mon, 07 Jul 2025 04:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqlBB2pZnjJvy4s0xbnO8kJfhSozJw3RWVxbenXq2SUi3yJy4FIatJ/itKV8hIZ8ggcPhrWw==
X-Received: by 2002:a05:620a:27c4:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7d5ddc71ca6mr618516885a.10.1751888343540;
        Mon, 07 Jul 2025 04:39:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb0ffdb7sm5366403a12.53.2025.07.07.04.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:39:02 -0700 (PDT)
Message-ID: <c7ecbdfe-fee1-4299-9998-387d61d333a1@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:39:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm: stop supporting no-IOMMU configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
 <20250706-msm-no-iommu-v1-2-9e8274b30c33@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-2-9e8274b30c33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686bb1d9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=HBZm8QPBBmupa505GRoA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2NyBTYWx0ZWRfX5jz0fXUDLhKF
 /X3g8ZZ5Wkmnzt8NrKLWIQCw+nRQM9HBsF9yAPW7GRjX6mnHHIrfyzn0qPkbdrqNg6VJnaC6q3s
 nJjVVRCzrL0e7nePLNKyvu9nWRrIk2p5+A/sBdwyR7VIeppwKfctGl48ftj6xI6UlRI77SvQVLo
 X4TaNiSEMclgepSd6qBawRVTt2XAq+nTwYEg1U0qESUPQo0Vwtf1UgSS+ZQhwoDVsm75PV10zrg
 CAvfrdadZMEKBz1LM9LYLZIeM7MND01nDFUWyRahTT0tw2Vgi04jQeoNSINlnuI28BNkbCg/XJs
 JwSNf860OetrAg8ugnvCro1F/Z1lhhjc8WuqMTtanf/nqKKYVRPMzStffs7KbDywEN8EuOkmZnX
 C7qAstKjLVMoEIl31KYGNCg/FF4uAi85al8yCV+M17lPVrKFawg97KPEneu25e1j4xR9hsIA
X-Proofpoint-GUID: bwHW5yptM9GAPZQtPqWKzVzJ3k3SJrBu
X-Proofpoint-ORIG-GUID: bwHW5yptM9GAPZQtPqWKzVzJ3k3SJrBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070067

On 7/6/25 12:50 PM, Dmitry Baryshkov wrote:
> With the switch to GPUVM the msm driver no longer supports the no-IOMMU
> configurations (even without the actual GPU). Return an error in case we
> face the lack of the IOMMU for an MDP4 device.
> 
> Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index 6889f1c1e72121dcc735fa460ea04cdab11c6705..2e2ab93b0f6f6a462e99d54b33da6dc21b1e8435 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -201,8 +201,8 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
>  		return ERR_CAST(mmu);
>  
>  	if (!mmu) {
> -		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
> -		return NULL;
> +		drm_info(dev, "no IOMMU configuration is no longer supported\n");

"Couldn't IOMMU-map buffers, bailing out"?

I don't think we need to assume the user has knowledge of the driver history

Konrad


