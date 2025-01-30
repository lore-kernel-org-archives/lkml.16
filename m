Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8871F0E23
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738264042; cv=none; b=eCoTx7nD/CJ23d1kqTloNsNxYIkcXwox9ymU/9GUpDhLfc8muU7WcR1GCePy1EXJtxaIWd8MnW1lVoxLOp6bmXc3+NZBbjuwSlL+5AwTzhnyoxdhN1qvW4XspATkUTZa7Maht+DdOiIT+TL+9esr9T5qrZ3kL4B/E8p81y8AtQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738264042; c=relaxed/simple;
	bh=pBj/Ril1YnghqrkWxFD8p/K4bAcqVGUkw+8Wg5nUKUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmxQkvfCLyFDzNedEemx1HQ0jzkdHQOi4OF0Bkmt8lPdga7wTomt+X0yAFklvnvfgWIPYIMx89mCittTjBP1+iCNqi8qATo5bSZExXjnUeqyG0jBSEty8o5GTElPq4w+qE63BIfEso8r/eyv76dC3iPt6GKnSOIplKe/DSLrI78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvBdDwUy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvBdDwUy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ1cp1013600
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3BhaqXgrMLyKfVblpg6Bsrl71b0YFcABEbF9BiIscYg=; b=VvBdDwUyDlBcBHYi
	rjjkal7KVs9FjsoZefLoyuXHaGPybd+B296tdMJDFNcjkuJc8vowZKYkXZImESKu
	uY1HJ1PA2MBSFOoHWZ4U30Fqef9nTv/8MR2jEJKL1YyfW6o9Noni32IqnamdJh2n
	FoaUVXCvkQpnA7Wj6kYDNBkSwirXsnFhLU+B4LGEiD/k2LSaIdCm4kR7KBcXvE9j
	1L6DVFD1+O/y5rLPvw9EFs6KrTsKaEocS+zGaK9/432a08HPOgZfbALDkSKAvXwW
	jOKCgCloDrdc0CunM7ykFDmP718PyFrzHdygc9jQVjrFXxmfkVKK5j+mAYA9B16h
	zqg9Jw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7m00k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:07:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef9dbeb848so2169065a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738264037; x=1738868837;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3BhaqXgrMLyKfVblpg6Bsrl71b0YFcABEbF9BiIscYg=;
        b=PV5OvpmpmwjbiZ07ZshKfXqB5ZqowARaxJNW8uF9xEYFiv5yZr0EnFh/aO58/wUI42
         9vG/uK7j2mtpsHI10PvNAKPciMjeHTaz5u5/gtzEdgpdHhtLh7Sa8Ei02AbklWlrsmn0
         P65OJmVoy0ch6+ZyO5uo/BaoBvPL8jfhXTCiqZk+hJnaM+xZifrJpkW8v/7ceEBn7l87
         6T0ligwYf4bZf0q61nj4BMlCXJ/ogQ6tTTTaex4jm3+vWvjd0Bc0HOPWc6v2YCrPE4I7
         UH2WTuB8djOTlbnOCEg6ZwLft42esleJx2/5xROd4RikbMhS5Q0e9fOxjkGIuO9fFb2+
         CzzA==
X-Forwarded-Encrypted: i=1; AJvYcCVVOWl3Ajj7Wuk2/758l6OD0wLDNbfJ7+8MEvSM4DrbdmBm2pA0V/Unp7iSbOfIJyVtONacFX1Y3JAVkc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMFWHcT2dEsqH5Nx/dLRs/XvaHPuu+fMGeFmiWau2kCqe/KGCn
	RcsLyKzgfDHGm0REIJAoAfAnunlIqxnwi8sUd5JJKyfZXUpf5udZ9rlVb6eifDNNYJIYwdCxRzG
	7tyqaLaIul/orQJ3GR0tiDEcHGdcUrgeV4MSH3pGuIXN9iyqZVoyrT50QYQswGe0=
X-Gm-Gg: ASbGncuYRCgO4iHLujemvKhJf87PUyVQmsIskdjK6j3z4BLUNeanYRUBDvUywgUW6R1
	7gH/WXl30d+9F/ofsLkChjdDWxmOg8LP37VZQRjhZwT6fGV2qjYpq6VWTQM9VBby4VOQMDR18k3
	+QgJrBooYntd4YBHTuAGZp4EISQF6m6I9rb6k39uyBPqQOH/dos8BTIyrP4xqJ3hmVIi2gvSKPa
	SzdKupxBm7KuJTcMJxDfr3NDooSmdxGQdCcYZ3d2u+ABdLlyGykJCv9BVCVjxkiChYHC/9F7RkA
	Db8CGyGZIzO0xgnonHeSbWJrwo8BkTW5fASzuY0hWMWW8SvbE6OD+Rhv4h7F+d8m37yvh4IJUw=
	=
X-Received: by 2002:a05:6300:6713:b0:1e0:d766:8da1 with SMTP id adf61e73a8af0-1ed7a6e12f1mr13417013637.39.1738264036770;
        Thu, 30 Jan 2025 11:07:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHg96qvbgqQ2gmDdQfd6xQyLD7vfiaEvtI6JhWhTIDtpEzP/0JSK3SeWZjihVBwGXNWf3YRmA==
X-Received: by 2002:a05:6300:6713:b0:1e0:d766:8da1 with SMTP id adf61e73a8af0-1ed7a6e12f1mr13416970637.39.1738264036374;
        Thu, 30 Jan 2025 11:07:16 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebddbb165sm1701686a12.6.2025.01.30.11.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 11:07:16 -0800 (PST)
Message-ID: <b3637222-d79a-4019-8155-d14abbadd6f7@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 11:07:14 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] dt-bindings: net: wireless: describe the ath12k
 AHB module
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250130043508.1885026-1-quic_rajkbhag@quicinc.com>
 <20250130043508.1885026-2-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250130043508.1885026-2-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2TOQTKC1JL2972msANZsw15upujRLpOG
X-Proofpoint-GUID: 2TOQTKC1JL2972msANZsw15upujRLpOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_09,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501300146

On 1/29/2025 8:34 PM, Raj Kumar Bhagat wrote:
> Add device-tree bindings for the ATH12K module found in the IPQ5332
> device.
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---
>  .../net/wireless/qcom,ath12k-ahb.yaml         | 319 ++++++++++++++++++
>  1 file changed, 319 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
> new file mode 100644
> index 000000000000..bd953a028dc3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-ahb.yaml
> @@ -0,0 +1,319 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-ahb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies ath12k wireless devices (AHB)
> +
> +maintainers:
> +  - Kalle Valo <kvalo@kernel.org>

sadly, you should remove Kalle since he resigned as a maintainer this week

> +  - Jeff Johnson <jjohnson@kernel.org>
> +

