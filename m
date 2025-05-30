Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9467C19ABC2
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622054; cv=none; b=WCTMXaa0gYEVa+uvJocpW709mfPgPojuvYaNqmKgQ3SQPwKjqLx/N7PjBQMtQydPr2T/IwoOx2d02Hrkj7MON24cOzSmW1UPWh4qZqTlkBR5yj39TynJO86fwljYJfxeE+b3fILUf2dtarwqpj4P+4X+tQiCB62SH/Gm5d4Mhzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622054; c=relaxed/simple;
	bh=eFE+NqKb4FGUzqVJCt/1VJwNtjUVrG/QUobe9Pt85YU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jijgXjIT07UJkSTYfy2pW0JYUYrs0FeUcu1Bc4m3QKG+/YFHUcJc2+d/gAE8Z6EW1CBX1aTYbUz8t8CjXPLy5yJMY+F5ZsCiFGPHnmJks5IIT06I6PJ1KDl3xgyABhFFwYxZHvSg6hbMwCj0wEUt5vc9B/OFVoZHvknBzdTHYtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNjXMMHH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNjXMMHH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UALpgY008227
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqTzkJ+m0M+WwOs1Ufc/BTxcDL+AaLfZVAxh4o4YAwY=; b=mNjXMMHHA9/IsnPJ
	bLB6OGDnRHH6TsGyzMA9Y6YkKzuXxYzxYKwYBQX+y+WDSDMLnUbl3xlPyN9RKEFU
	VR3/076P8sMLc4qnBFFmc4zhLDyfAcT7Lbljewd8Rk48yxywVfXPLzNIH2pSUDeV
	FpSbfvepy+aBXNj6PUFKHihnQ8dK3XhbEU6CuA1z0EsuVpqK7yNpuQ4kySb2CHsp
	VDzwbNirXwHGIaLJfPCVsmK4kjj2HUigxBXP08htjUMTjgmKTfbGe5A9aAilBuOV
	Bc70kDQml7vGlIt3HFedEAWQGOLVSgL82pvT9rhxMt5NwjuYCgdvp5QjQ+fvWGFd
	tM5RYA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992uw69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:20:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742aa6581caso1781431b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622051; x=1749226851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqTzkJ+m0M+WwOs1Ufc/BTxcDL+AaLfZVAxh4o4YAwY=;
        b=Adtpq+3+79dQeGUE1oNwGo2OTv7M1JzROLbnSD3o4TprW8mLlzptRr3kqtlz6KmxjI
         F0E7NLAhQGBz01Ulobn8T1mY6+nqMD9w+gBBuShmW1rb/bd7znDRYJjPy9Lrz749PFYh
         RJy1+G3fD3Y/HlLoYnYFINnxs5Vk76+uImcDWPm2raT0V5896kvoBmA9xOIk94x9OzGu
         YZy7MP2zimGE2mZCN/GOZyORPiGGOtfwpypVQpceuKFqUtSkO1/g5M4TmMYXB2Ur/m+S
         +TMScuJq0cP1yFyt+mUv2CBY9ILoCQjVlP14y53Q6QCnyEakquxlK0EsqbMfB5fCd5rz
         8Mzg==
X-Forwarded-Encrypted: i=1; AJvYcCUENvZZ5Jt5Eoz0IU2vQAb6SUACyPPHJVi9uvoOMpogvf/l7imn+kz678dFasDBApaDPr093RC7gm/yPqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz7FhksJ0jN6T7MX094IA5wWeG4Nh0n75bIk1HAzHfnlt0dDX6
	S7jqntQPav36peobFVKu3da/53sKjGRhh3noph+Bxi4wuqLQ2VtrGbdkGwmp9eTwtjLpXylCTAb
	gWb1LKV4VVAbqCnLG45EzdRSU1v4STv5hdPhe29rtGT458iNsLExooTw5WjE+NTNtyjU=
X-Gm-Gg: ASbGncvBQdKYI3fpitVysPUIFDgaztJTTrW/9iyTs7J+P7R8N1MHX1E62X5fq63opIf
	9k6c5s0Wc7dWq48szxD3CJtDaFHXCIs8UX9Iv4LOgIrNpDR5DXvHNpMRtO7Uq+FrSIbFpd9hzwk
	vqSOGTdB94dPmQqDkokCOHXKUOlnSqohcmnYLDE7Z8H0TE0UMPTZRdLLT5WoSlR09eQlPOJn8pH
	/Jzmb61NTN+0gFyWczVvmnKqKo1XjmN3rpTHkRSsFo4v3szUelnJvCB3irStm02BaMD9Bp4eImX
	UGMn+9wDbywa/cDH/ooWkHh6ALjnjgb1ok54rx5n2m4qQtczGVMsGkLINeCMAA==
X-Received: by 2002:a05:6a00:7491:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-747c1c83852mr2995556b3a.23.1748622050773;
        Fri, 30 May 2025 09:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3KvuYJT4qbQ5u5CbTu0XT/yKXicfsd+dn08wq+4nYHqmMZGv9KAdolvB8TbaAHA/+TUu3/A==
X-Received: by 2002:a05:6a00:7491:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-747c1c83852mr2995515b3a.23.1748622050335;
        Fri, 30 May 2025 09:20:50 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd2c86sm3325986b3a.144.2025.05.30.09.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:20:49 -0700 (PDT)
Message-ID: <463162bb-5e2d-4768-8811-ede7b2063c85@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:20:47 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] accel/rocket: Add a new driver for Rockchip's
 NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-5-18c9ca0fcb3c@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250520-6-10-rocket-v5-5-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NCBTYWx0ZWRfXxepzE+dScWDf
 3j+m9cGP0KlTs5wJJI9oe8QEtBmC2ghuom7xtvdgr800THsKZj2L33kydj3hsa66lreygJc9ewB
 XMDVWgOI4o9dQZY4b0z8as0D6Hsi9rEsqi1AI4BfNTkpI/bEri9MncL4C10TcWzp+LsPHYLm86n
 TpmxqnNdbqmE7YMZMRHTt1+ijI7nu3GJDq2zpbmBRxPxsTQHXoAN6T+Rlqfls8Zcto2AbUTICGB
 A9aTk1x5NFSt8JAWTl5WQSGZiDPravF82MSEZNFqJL75DsJ/Z9W1wSfC8wyw785me/7GMzjmy4z
 J4jMwSrXgNO4xJEdFi9H4LOm/2vQeUmA7uax/buvUbWnHnlhXnFxwBt9vJc0gwLx1pzsnNiYA4C
 yQLSklaJQCXoBhhseIkMr/qic7WZJT1DIvpcsJnBoQKo5Z8cN4DtqfL+NYPX13tqC+XJLgw+
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6839dae3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=DISFzqtZAAAA:8 a=HlDAqVJfg7-00m_e3XEA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-GUID: ynw8WzQiMldor8M2ysw3EiNNxYidh79n
X-Proofpoint-ORIG-GUID: ynw8WzQiMldor8M2ysw3EiNNxYidh79n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=932 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300144

On 5/20/2025 4:26 AM, Tomeu Vizoso wrote:
> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..55f4da252cfbd1f102c56e5009472deff59aaaec
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_device.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#ifndef __ROCKET_DEVICE_H__
> +#define __ROCKET_DEVICE_H__
> +
> +#include <drm/drm_device.h>
> +#include <linux/clk.h>
> +
> +#include "rocket_core.h"
> +
> +struct rocket_device {
> +	struct drm_device ddev;
> +
> +	struct clk_bulk_data clks[2];
> +
> +	struct rocket_core *cores;
> +	unsigned int num_cores;
> +};
> +
> +int rocket_device_init(struct rocket_device *rdev);
> +void rocket_device_fini(struct rocket_device *rdev);
> +
> +#define to_rocket_device(drm_dev) \
> +	((struct rocket_device *)container_of(drm_dev, struct rocket_device, ddev))

Include container_of.h?

> +static int rocket_drm_bind(struct device *dev)
> +{
> +	struct device_node *core_node;
> +	struct rocket_device *rdev;
> +	struct drm_device *ddev;
> +	unsigned int num_cores = 1;
> +	int err;
> +
> +	rdev = devm_drm_dev_alloc(dev, &rocket_drm_driver, struct rocket_device, ddev);
> +	if (IS_ERR(rdev))
> +		return PTR_ERR(rdev);
> +
> +	ddev = &rdev->ddev;
> +	dev_set_drvdata(dev, rdev);
> +
> +	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
> +		if (of_device_is_available(core_node))
> +			num_cores++;
> +
> +	rdev->cores = devm_kmalloc_array(dev, num_cores, sizeof(*rdev->cores),
> +					 GFP_KERNEL | __GFP_ZERO);

devm_kcalloc will handle the ZERO flag for you.


