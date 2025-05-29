Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ED0205513
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748501218; cv=none; b=edWciDtEVts62VpnvTt7eJ5ZuGGGyrUGQgXFLG1KSN8391eyzaBlINg+l8BgQ6J8jDhypOAt8OYwM2y6GGSvVLd+TiILpFuiSEQ6D4rG2dyqdVdJKU6KQz7TnyG5gvHzXHs6fsXYeRfa8J+M1QTyky8ip8K+J1arUtVWuQTIj2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748501218; c=relaxed/simple;
	bh=psTx5DnqTcqc7rdga6X9dADCvyDhDYFwQMHtamg1P1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ie9fwrTKNYzzx1oadpmuxa4ED7MQHDcafCjdBfKvFimBPwCrS8BLn9suttK9o6SWhJ5yJZo6aNQssqQ7AjY266zQM8jXF7ursDIW6knjvo1SDk1DvUxz2vGlSOswStwOaW3e8trtJkwu68GGI98kMNrtXTalWAUzfe/oh2OumFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEc/H7ae; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEc/H7ae"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T0FOSE022698
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8PGsXyBDZ5H+JaRIX2npxMFHOrT7ZZSDbAslLTPf2k=; b=oEc/H7aedWKsUc3D
	2rSog4WRZQP6dVmuO16IWE+UffwL7cHKyDWipnoKE/GreAM3eyrw32j+Eilhoxoi
	yS8wJISqBvEx9IEWJdFDZJLEyvFJwjNqy1M1EY0l/eSZ4cesxxwfRnDYdQbTjhbM
	YVuI+VvB87LcdZ/GxMLHUlmgcYNbW679a8rg6TkmXFCLdnjBCNVbAA6PqTT5UIcu
	qAAujQ3ZMjcSkK0CA1gVSGqQn5jkW2XbfmcQkHBJc0hinmQtm2lKK9q/a4qGyIKf
	gmItCi9bSKsJUCPC8LObmC2AiNj4mLJPWqDrtwmdfyN3picgfaz5AgQr9kHQEPIp
	ecLnsg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjvu0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:46:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311eb7889c4so590274a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748501215; x=1749106015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8PGsXyBDZ5H+JaRIX2npxMFHOrT7ZZSDbAslLTPf2k=;
        b=YDtgEGz5xb/RSfrxvaH8wdAr5W1k6T1jNGjZezg3Epb+e0dPV73hTc1/X1UZph32v0
         949TSpjNWmWdrJEx7JzlvYHe61ZHLL49IqoX1CF23CcZ7/Y8KivX967/pVezAtuuI2D1
         wK1u7gIq6U7hZHs9tU8KYYlLXg7AzKPieJ8VTjWklyt3GvjcPrJHTHaW3VwFPabere71
         +At8LRgA7iSmzFsWyhxqLvLHK+dgev9bs51HaB6j5CaBvEorXhzUU6UCw/JHNlsK3BvA
         N1baMdu4picZe/EzV9X9s9xSmLHppIXbB6P/aOSATvpnLSs9dakPgoKcTp3NAJIFuc3p
         sI9g==
X-Forwarded-Encrypted: i=1; AJvYcCWmDxWag9KiEUykc5IXtYTiHigFBGOMfa1CanhcCPNLOulnPidMVdqk11Ha5zFov3JAtnBcexUnRGmpkYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBasoeJaHHhvdZXHinhOSrIqH2FUdis5F3B6Kzzx1H2zqaYE9b
	JNds/l21bm3pm35spMN+ZohNn29bzk2gK03OL60Y/JQjzsy2/WIOwlhAWrhD4023PK2t1C2YY0e
	qL1HDbG0sM1vFsxDnIp6mXdzLKEHsoMY/K/tSYl0O07bbgK5moTZRUQNioxSxdzA3ezw=
X-Gm-Gg: ASbGnct2bxJRMbLTR0df4TLV5owL2pIvg87796ZxtbOFFTS6cTpJvV+FQkqDxDSgJLm
	Xs7CdZbe7dBoqZ00M9+iFHXREZRszYy9FbPGySRyoXDMnFJIRNSQhLjj2P/rJ/Yt+FmybIJYF9B
	xabj+pEwfAVgmJ8BNr633jxrSdhisOs2Pf0li3L2i5mfxbVcz/rO+sSOjHjvkUJ4zjbHJaBOSoM
	frNFEx3xK4Ku3iY3Mc/PgGJn5mtQYLRr5/TSYytPocXjMhy2oK2PAJsfmsRI7Cq/FzGsULyBM11
	zKpuyZWcijtG9rUq4ryUHg1in5d0yFXtWNZkZJ3kGluO4oDSbsdHjCSbCNKRY1qYBPGEbGtyp/D
	n
X-Received: by 2002:a17:90a:ec8f:b0:30e:5c74:53c9 with SMTP id 98e67ed59e1d1-31214e70c6fmr3707563a91.11.1748501215066;
        Wed, 28 May 2025 23:46:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3+tA0etXLR8LyoSKB3yEpu2iofzywi/K5UpRcAuWOpAuxadNSDcNeFAVT33hT++YFoC4ufA==
X-Received: by 2002:a17:90a:ec8f:b0:30e:5c74:53c9 with SMTP id 98e67ed59e1d1-31214e70c6fmr3707541a91.11.1748501214650;
        Wed, 28 May 2025 23:46:54 -0700 (PDT)
Received: from [10.133.33.104] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3121b91b063sm710878a91.21.2025.05.28.23.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 23:46:54 -0700 (PDT)
Message-ID: <a9f260e1-c632-4955-b7d4-98fb024e2989@oss.qualcomm.com>
Date: Thu, 29 May 2025 14:46:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: flash: leds-qcom-flash: Fix registry access
 after re-bind
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        fenglin.wu@oss.qualcomm.com
Cc: stable@vger.kernel.org
References: <20250529063335.8785-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20250529063335.8785-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=683802df cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=nBHSmvIfuyYwa36IIZEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OK8nDKASEfBT5rgn8abrGFMrnfML5Pky
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA2NSBTYWx0ZWRfX/Gd8kshP3ncQ
 iLs/6ecYLUOWDE2HVtxZM9YaV0S2xTrtT7w0M9DAUiIkGuoCNtGVHhcHAQ58m3mgLlCosPP+yFD
 b6UJ9zTBhGEakuA3RpLIajBNL515h4H2/bhnHi05AMLP2htng4byXFW4sVhf3/035XuOb0W7xT+
 aiNJsg6Y3mHNr5UO93dgOR0YJSvlyxUoon52SY5d6iToKo22J7kWKyUSbl+M49NaYiNcJanYwwB
 z0Pgd168pVOlAWAq6Y64KVB+UwPA6f3YWnkiTNmljq0zS09GsvwzvO1RKKpQ5mxaPHLuTwGwJyy
 YX7ElGjcc+GklsayCYlI2ITAvhT/6QZxdOce2GJKjcjMnLyhkc2HFjIPnUnUl7QGlWh3AkRzfXb
 5/A14k9qCkwhZWTunYoj1ite/1YJoiITTyde845LB8EcUmbQooT+Fjyh8u2Tybm71uuOEdad
X-Proofpoint-GUID: OK8nDKASEfBT5rgn8abrGFMrnfML5Pky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_03,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=579 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505290065



On 5/29/2025 2:33 PM, Krzysztof Kozlowski wrote:
> Driver in probe() updates each of 'reg_field' with 'reg_base':
> 
> 	for (i = 0; i < REG_MAX_COUNT; i++)
> 		regs[i].reg += reg_base;
> 
> 'reg_field' array (under variable 'regs' above) is statically allocated,
> thus each re-bind would add another 'reg_base' leading to bogus
> register addresses.  Constify the local 'reg_field' array and duplicate
> it in probe to solve this.
> 
> Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>


