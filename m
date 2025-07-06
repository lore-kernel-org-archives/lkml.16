Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50E21BF58
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751811723; cv=none; b=laRSshK4n5M+b/Lm36fkRclbCmLkyEDfr6PLIuVwx4NfESEGbS65PzLhHyyhAaY7oXO1qd+cHmxlrBldgwJZBzumV0bEM7cmdr6d34S8FQGjv5j/rrUoF+MlMad0YzJHjXww/9hGoKFz3dIQKTdkDJAz7v8a6IYpB0OcetWe2pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751811723; c=relaxed/simple;
	bh=hGj9ba+WBBvZ9zms61zCDePnwkxudsa8B9DOmH+mpyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qExwdHdb6uLfTIDfvMLxZwcE7cQiipHslo4BmhfO+LSv4zuJo0W9FX5qROv+oHIndy71ofK0RsqN2Z6kgIq5TjXDm16e7YUdFaPS4x3Ow+EkiIjNEuA5m0AcfmDTCwcjmMI2TwMcIYbh+oH7kRpTowcYHNW5FxLNO+Fgj0CGUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZG1zwTR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZG1zwTR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566AJ1xH029846
	for <linux-kernel@vger.kernel.org>; Sun, 6 Jul 2025 14:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LR59wvaFC1B+jtg9kXlIKRe6vvfPELWKIv1ziuV/xg=; b=DZG1zwTRrWIo8NW0
	SH7dNDOOY81dG4Haah1W7G5s6GBOxUmt/s7GxQNYDfhqYyGqftftKCN5PYZVkBd5
	eW/2QXQhinMuQhSGlqvitrcR7+3/wr/H8NceFMJlQhSZsHGMs4T58P8Khl8cZ5YR
	JRRTaDYfv7Xjl9T9OUVMyHNoHS6Y38lRdZf9HatRxhAIzegnGiIbL5t/hb6IAmO+
	nt33oMNdKtP3rnCcGBG/q0YMWWlDmr01jTleGo5CDH+NkX9vdCAwiXhAg7BXJVDg
	ewsraXQEi7s6klzhN5KkVsiYrjtsvVjTAou7UNMP2VfxwHItNevWpjm/pwtIClth
	rVj0ww==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv974g3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 14:22:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b38d8ee46a5so1677436a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 07:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751811720; x=1752416520;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LR59wvaFC1B+jtg9kXlIKRe6vvfPELWKIv1ziuV/xg=;
        b=kAEsv3SYE6qY43pMCDLs/sYEXldx7irTVvUhOQigdqgLpL7GugGKpInCaI1cUagcOW
         L9POXg3Bt/ppLY3jy9mG+YpkEezG25CtPmgygIrqKbSKiGk6b5USlBDjnM37wcB2OC32
         D+FTvGeFkSWqinLWhVOrbyCpn6urtDwrTaqBwsT5AoujDE/HkKxGqzajGx7gbhvjxLQZ
         atINYjng+ZoPESg1CumCbMYLx8w6dyAzXDNeR7ZqHCqGqbFEDmyxSBojGUoLaCTZH20o
         saDuCKrgMAG2diYIIBA4JiECKVPFvR4807D6uDYGbgQt7mUW1DUBkcsofbeUtHRx7b/o
         dzFA==
X-Forwarded-Encrypted: i=1; AJvYcCWhUGUYiwxZabFfGZJoYhIB+hRD6sJa4FyYQCQr11ndbhTovB8VmFX+I6T9ktrNr9yYNVYoqByp92gJ7/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx39khiDdm3H6JcBuw6EPNNujfMtPHKQzjLVBZ+GnwLAHGZSu/4
	Zt3Z2ShhTAKxbcMamQ4MbaprcJr3Hbh0TAHhXMjFWityiE5lmNTa1gM6cgkdzAxij+4NwSkMEe7
	Bf4APGEdNK1G5TWxzUKSLTEh7IV/bYSbx6kSYiKl3u9ggGCDOXaNfk2q9r3xalcy1MSY=
X-Gm-Gg: ASbGnct4e31VViusHmyFfegVJiqvSyHHBa20voSgQxiqZSA6Mq34Ietkni6VTjvaqPt
	cdn8cjBbZwcTcmVqyB/QdpaqTSao7m8C77rGygqG9Jof8FA7bkqniho6RbOaZPC8aLI2pGgBM7f
	jom5GdXJfpUMn8cqjJeDqjSplzXa+bznxApHXaAloiNiTgkaYxhBmoYcartgURjpf/Q/k+/21xg
	v1O81r/C+BmjtKsrQCjysnbOI7BkhXgdbc7zwdVoFB8wKoO51XBaEByWxF+e9yasAcp4V6Yzrnj
	UBo0DHpXzOqHT+ML/rOKVzSsFheL4bzy4DzzzdCjSw==
X-Received: by 2002:a17:902:c943:b0:221:751f:cfbe with SMTP id d9443c01a7336-23c8595204cmr167337135ad.19.1751811720115;
        Sun, 06 Jul 2025 07:22:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO93oCbUuKR455AbSvqBvRYCReXzTUnYblW52a/kTh3+cnV2a1b0uxIXTMZ96Ppo2+XoCvjw==
X-Received: by 2002:a17:902:c943:b0:221:751f:cfbe with SMTP id d9443c01a7336-23c8595204cmr167336735ad.19.1751811719650;
        Sun, 06 Jul 2025 07:21:59 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.234.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a4c6sm63428015ad.46.2025.07.06.07.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 07:21:59 -0700 (PDT)
Message-ID: <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 19:51:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686a8689 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=D9rl3thw99EfY5kE3N+1UQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=idnX5w4AHIxaUxQtNqEA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA5MSBTYWx0ZWRfX45JfCggvF6O1
 gixpB57BHVYePO/as8pJDQrBTBctD0MPIUS+s7rodVjiBqwUiMqoGG/8GtbXwhHs6L4BZ7FnaI5
 WKMm2z0tCyDNACm2eKipvlFdbmzDSvoRlLYL5zpvH3YwFtNdWH9PrLO96kd0IPBDwA0XLBnxM3v
 2plkJ4mOnAieO9OyuaVtJ01IyAoL5FjKgHCrKUFMqAOLVxmQARG30m3g2pqz8c63hDiDVHxSIB8
 oFo/cXmRLeuFfTayr3MDqHnrFiq/Bw4F165abVUFuI9N0ZWe56r6owsdOSeGFYs0NRYT7OfsPEI
 YRq6VqRm5ENKbSH1mBXZSQoa0xkeZKDG7ptW0JDS1QY3yIvhfYVs9WmvXiDxwOAtObD699LuIu8
 1ZA6Q7gjobp6aYuvCr7+xOuedp9+JxwGPkPz7P6sRGfjcG8QyHYJTY2g0blqP0kDWhql1sJh
X-Proofpoint-GUID: BLTkZtTYJ7NFTPEGSe_vcC65Mk0BaOtJ
X-Proofpoint-ORIG-GUID: BLTkZtTYJ7NFTPEGSe_vcC65Mk0BaOtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060091

On 7/5/2025 9:38 PM, Dmitry Baryshkov wrote:
> On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> because of the hyp limitations. Disable PRR support on that platform.
> 
> Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Unfortunately, there is no way to detect firmware support for PRR safely
from KMD.

-Akhil.

> ---
> I currently don't have access to other devices from these generations.
> It might be necessary to apply the same workaround to other platforms.
> ---
> Changes in v2:
> - Simplify the workaround as the issue seems to be limited to SM8250
>   only (Rob)
> - Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a6275d9c3ee3d084c215362 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  	priv->set_prr_addr = NULL;
>  
>  	if (of_device_is_compatible(np, "qcom,smmu-500") &&
> -			of_device_is_compatible(np, "qcom,adreno-smmu")) {
> +	    !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
> +	    of_device_is_compatible(np, "qcom,adreno-smmu")) {
>  		priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
>  		priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
>  	}
> 
> ---
> base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
> change-id: 20250705-iommu-fix-prr-600451b1d304
> 
> Best regards,

