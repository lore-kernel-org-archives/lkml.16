Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CBE258CF6
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347077; cv=none; b=RgUM3OxtJV25rOa4CoyznfBjR0NJqcGuXGf8l/fynrXATMJ6CyifZlhMPe9HubVe8zPQiHF8NhHWVHSfrxpwAmy0HBQH+JfJdN23/ajiwxYVxdUpmaKb60jMf/1wZN2w3pRd00rG6/MRSbdz0zT1F7HGXdy0wPzr8MqANznU1Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347077; c=relaxed/simple;
	bh=iG7alVLRQPBLu2uFDKDhWTHeOCuXazt6XYy1LINh6nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlCECRkvA6ecW7LXp2v6T3awWEfKzxitm+Eh5tHj7Q8eeHr5HqpLjTMghmEWVrTXHmr2Bir6Ft7a0mmpGfiDhKz/x7fB6OCa/1fCjAkuwPmBQOkCfNWWxjkxiERiKEJJ8gD0UElCtM/NxL1IUjmrmTL5TuF97jvxA2yHXw5P7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4YuzMjN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4YuzMjN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9YLxp001765
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00npxAYXcDwJtuc+WcPd16KMqvA6u6AGGT1iIUkKzfU=; b=d4YuzMjNLkLL7Obv
	rM7H+uKqKDuoTIoO1SJatzsEv/fL6jUIPwgSmmy4WBUC57SXQg8kdnjeBbnPYg01
	kRN4x1Pw3Zf31u6Vzu0PG5S6ThQtHm0KCKuRlsbcOYUOIy0gsd0FVoVP+/Iur2Gv
	HK+fERjylqJsuHzUUnAER2/1G0XcBFM29E9qlvfesLfA4Db5TiQzoVCytd9OskmD
	HbIJj8oU4PLYASb6Z93sC9dTugL76flTyUikUTw91PDZcbw+CDMxcn6fEuIqci2F
	3AJHHr631utVLtXGEdKP6bO7i41vOcqbmwOfVjoX4PbaksQB3ljRkhs32TQ0r1Ut
	7KdffA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkrdph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:57:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-48f812db91aso11177001cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748347073; x=1748951873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00npxAYXcDwJtuc+WcPd16KMqvA6u6AGGT1iIUkKzfU=;
        b=SGlYXERqhrjFOWGy1L9e9c6rkXCXw1a7Irp6rYnjM8qf7hMI+TY2gu1dksqLkNZmIx
         U8NMJH2iK7XzultivOHVXFQ98EAVuIFdSR4VdAUhvRbonxy04hgu74XtKUFJeeN01J3J
         Sa0pAXQLLc0pNEQhxETfX6hDEA8IGhB2YJ1sB719KXN9+3EFDoQ3hpgfvp6gmy3RrKHA
         JDRYn1IUJOmInF5ux7sL+NaEHuiAhzZg41IJCwtKnNLWv/DMjKelnDWlO83Uj54wH62q
         cFJUB71gh04RWbHWbvkzJUkP1ZMx6cG2KhOwM6hzeH4o77+p1buJ41HX+qopRDjzx85u
         D8qw==
X-Gm-Message-State: AOJu0YwgJGw462kuwTba/nAfWzgAnaZvg2ORiQrnBT9zgzNaF8dqXoCC
	5qxasqeTHzxaVf1VHXlyfcAN482MZFeqsZpd3Gk40iWJ+UAnJdlUAnUVEeOJm52FtItHeN4p7kD
	ZDwT+IJLUQCjKibeSo+7TnjHVgLYw4FjXB1vK+LewHs5HNe4v4aRutu2WeKllVeSEwPs=
X-Gm-Gg: ASbGnctrIwsOX/8727D8tU8WMQJDYnsc8olobzkj3dE+PVVfl4rqkJ8kPbrxJFcb2aQ
	vNW5xDnTmUAV1VLlAa9GPhYpnHcXO7Y9iqmwAznRD5gHU+OJcHitGuOtPPjC4WdNdfPdlmMzmFA
	WiSFVR0qGDcmDcxy1H1Q67znkLTZioEY1W3T6mzSi4P8Dp2gZIlLE0bcDvno9e9qTowB1BYvXK5
	jMFFXNHyRtRxMQtofqdRt9XFM3Y7D4VdS9+dGyUjp2FiORHL3LEUDJHBn8t43MpCTBvaKZzSp/v
	B84ZQRCEqC9AbNy3y4zXQ0B/OIxYCB8ay+9pahb+IYe7/TmkMKm9tk0PXm1iOaUOaQ==
X-Received: by 2002:ac8:5f4c:0:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-49f47631130mr73699061cf.12.1748347073196;
        Tue, 27 May 2025 04:57:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER2zMsxig6MWdo0BnCzVG0WnNdmIBLmV4Ag489VTpniSStMzoJwJoKznpWShclgNRbJnN9eQ==
X-Received: by 2002:ac8:5f4c:0:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-49f47631130mr73698861cf.12.1748347072756;
        Tue, 27 May 2025 04:57:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5b192cb0asm1057955366b.170.2025.05.27.04.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:57:52 -0700 (PDT)
Message-ID: <c2ede70b-41e3-4009-baf7-afc6c2c65949@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:57:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] CAMSS support for MSM8939
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lHBlHbQiz6nv6wK7gjDdVPJuyBzOJedG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5NyBTYWx0ZWRfX1cZshBMh/GdB
 aG4w0CghQFpiKHvXJvv5rdXpFmLGwiG9tJJ9gUefpEkQG4+DkQjfuch8FrxNsIaf8iCAuikdxDd
 LDw6VRa5C8Cuar4AbkPZAuKJBl2AL91fosugVoBzqWT22pUWA1/g0LkUw4ScgNEV8I0hZK9Uesz
 ogpo3oWL2fcOBBoyWg+KJF0TfQ8lt91LrTmPniEA+KYx/3MUtbFCbmTnNVvxPEA6isszEaPm+RE
 84we6Brh704VUAuBjPVpOlsA00tqFpAnkqkouFUJdmFd2HvvU2rjGP3QFnI+x4zGRtaAFHcm6jB
 6yoXvHuJObZ3mTs0lxgGJ4wDtZkP8/URnY0kysYfiluLQYNajqTuGmzrBT839T8bg6qdjpwkrES
 ez/ByCjfyVWrRuGj9TO+dLctFioMCeW0C1/CNYWgM0TuvrT4lRnUt63NfYL1QHY9pBd+q6NZ
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6835a8c2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=G1DFoxIfSOwnDC_JHQgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-ORIG-GUID: lHBlHbQiz6nv6wK7gjDdVPJuyBzOJedG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270097

On 5/25/25 9:25 PM, Vincent Knecht via B4 Relay wrote:
> This series adds CAMSS support for MSM8939.
> It's mostly identical to MSM8916, except for some clocks
> and an additional CSI.
> 
> To fix black stripes across sensor output, and garbage in
> CSID TPG output, 2 VFE VBIF register settings are needed.
> So the 1st patch adds helper functions to do just that.
> 
> Patch 1: adds helper for VFE VBIF settings
> Patch 2: adds CAMSS_8x39 version in CAMSS driver
> Patch 3: documents qcom,msm8939-camss DT bindings
> Patch 4: adds camss and cci in msm8939.dtsi
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> Changes in v2:
> - Patch 1:
>   - Fix devm_platform_ioremap_resource_byname line to not end with
>     opening parenthesis (media-ci/1-checkpatch)
>   - Move camss-vfe-4-1.c handling of VBIF previously in patch 2 here
>     (Dmitry)
> - Patch 2:
>   - Declare regulators in PHY entries, not CSID ones (Bryan)
> - Patch 3: (bindings)
>   - Fix bindings checks for new errors (Rob)
>   - Fix properties ordering, code-style and example (Krzysztof)
>   - Sort reg-names, clock-names and interrupt-names alphanumerically (Bryan)
> - Patch 4: (dtsi)
>   - Move #address/#size cells before status (Konrad)
>   - Aligned CCI with msm8916, thus removing ispif_ahb mention (Konrad)
>     If "camss_ahb should be unnecessary", it's still required by qcom,i2c-cci.yaml

Give it a shot (with camss disabled so that the clock isn't on) - make
sure it's off and see if you can still access i2c.

If it turns out it's fine, we'll fix up the bindings instead

Konrad
