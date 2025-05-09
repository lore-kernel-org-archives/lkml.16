Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88A62701AF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781030; cv=none; b=Rmo/RuuGec7G5heslsCRC2kr51rIR9IdRC2UmakM8yZjPoh9xFMzVC8wIgJTW7DGr6B5Ht7Dxiol/mjKCLkCdvzx8PSTFmxSLZj8Emh0mxQBjC4Z2w5xyqPUcWfSBy8Yv0iyG3wH8QJ0XhiyI704zwOueSdLjkUdo/Dz/uooMcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781030; c=relaxed/simple;
	bh=n6uTSNWQEaZRx0cW/tlfqUOE+LWnOA8WNzEMZ2lYqpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofNYLQQTu37m19ow8ifjMqeS50jhye8rdHl9ih2QAy0nBcQoTev7MRks5zgTOGsNGmFib+ClFOZ/WTU2athHB10VSVekt5AIOavLCy5hGA9WvvT037zMRayNcykT16Bn5UNs/q47IAW6CrYI4koOkjU0rVs3YcPdxy14QVfiLug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lkTTIOEv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lkTTIOEv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493L0wv031382
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 08:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2F2tft5UjMrfRl3YRgRsxIlyPACuq0DMYHaQoSibLhs=; b=lkTTIOEvjbPa59R4
	Tpe5RhIffXWRGHJCpujGHyUyNJxwTsXk2n3FaqED1sHOdNPhgATzJo0hg9GyG9ws
	unFt0UtJmdZ1BU/YtwcR0i60hyNqtS32pe/WZuVXeglTSyQhKGqDcDuwHHwDYoZ3
	rSiZasPBGzn7bfBLcJqHpsYAJh4po8/B0m30UrfAHEy6EFKViBSpus12dkANSr6T
	zOELjP/CJftk+qVYdZDuD1KiZrTKyi61RnyyQd4rmuL7rKqa4LEk2XfBQKEeZQ8Y
	BM211eI4cqUedvyeTSRibTk4XVe8lmkyDPVwXSjNqctfRVDYFSRXHz04mdIjSvJZ
	1CUpQQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgm06j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:57:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476786e50d9so4664211cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781026; x=1747385826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2F2tft5UjMrfRl3YRgRsxIlyPACuq0DMYHaQoSibLhs=;
        b=EteXxv/wbWiySZqzIpfWeTd+Qhh5a/tVAoOp6BB52uZgRw9m+0PHIqD+H79XRp1Hww
         WfQkmILEzNe9p1SkQbKOUJXSCANgk1+Dv8dC7wVHgAXOMWe/PxB5pIYxG5Z1p2MQakPt
         hVDFhnhVZs5oubA/YxF7wX9D6XboSCQkWAF9/II27JNfzjRlMn8/olAyESZKIw0iHj70
         tz/5PiA1A7ne2lUvRzij638PwbeWEF8zIQRngoYbsyaYNnCz7oGSvfrd/Gm/1cXM4qE0
         KjB2PbmqvN6HJaKcrV7pO4Ltn4L6x7VrE30shu2T6y+L2adByUmKd283nDdkwKxo0Riq
         vpoQ==
X-Gm-Message-State: AOJu0YzyIY5RkL5ZlGdLHSxvKK4BR1KlOqdZwvABB7doTn4n36g2dDHS
	cA4vVTezeeLW7yjZLBw4DRVAKnR7OTxUrHln21UeTRYii1gP+6Le44mVjjVVqR6oCWkhojpeKoR
	x8QLgdSP/vhiT8Lck38iv0LFMQoW8vNQPhcgEDi9zY46OarwdLC1Ht0PsdiJ9Fsk=
X-Gm-Gg: ASbGncvoDQK/raeP2gItJA0fmUyNciShKp8UcIIyTqHhaGLugru83qRBo31I5aF501n
	Sdgqq/zn3p8+GWdE8mb9FL4XMCIRfSn3fDvPHHbn+PTkfX+j1lflNz7rdSPygfMu/JcDsaZb9Rg
	Sookh1gRvc+VFEffURFBSKVDgNHb6ztf5O6G89+J1Od5V0kDXVDt+VMPP4+urnjkggFWK18LYom
	02Fn/Pw0U8jgN2IZnXBGpD8AAWE/RaWrlfuKRxpGTKLbY2+4wqEoF2H0mXML/5ApPU7Qs7Q+rLM
	Hr/awlZmImEe8UYXuoCx5MI6Z7czdATCOWEXaxHraNJ3jq1anTkq4WjeXjZSCrDBcU0=
X-Received: by 2002:a05:622a:4cf:b0:475:1c59:1748 with SMTP id d75a77b69052e-494527d04femr14440291cf.11.1746781026570;
        Fri, 09 May 2025 01:57:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxeMUsTznzv79+qD/JwrjZfuwI2c0VRgixgGeW6tBc4r4HMOcMF9Pc59SvA9wJVZojTbpvtw==
X-Received: by 2002:a05:622a:4cf:b0:475:1c59:1748 with SMTP id d75a77b69052e-494527d04femr14440181cf.11.1746781026180;
        Fri, 09 May 2025 01:57:06 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm119615366b.8.2025.05.09.01.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 01:57:05 -0700 (PDT)
Message-ID: <691487b5-bcc8-4013-8848-77019e7476e8@oss.qualcomm.com>
Date: Fri, 9 May 2025 10:57:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_sdei: Add EVENT_SIGNAL for ARM SDEI
To: Huang Yiwei <quic_hyiwei@quicinc.com>, james.morse@arm.com,
        linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, quic_aiquny@quicinc.com, kernel@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250509064552.3330202-1-quic_hyiwei@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250509064552.3330202-1-quic_hyiwei@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681dc363 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=_FxPWtGLIxKa-BK1s2sA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4NiBTYWx0ZWRfX/rlNgA+XiROO
 zn3MiRwq+10q3t7StqDoBme/faTMSg5R70pMWKM8PEshn5dRIxVYPlKdh0YAk1toXMFZtZ0JJYE
 ST3jq82QtjQL7TaGBlzG+k8kWHaTm3doBpxocVCz5p2o8pfy+KbprnVUf0+RNlW4Ag4aEN3KDLS
 SKoVXFVhXu2dhIZvjl+IupQVTyyFL3UqH+lgWMSPIdFqeXtzAgyiaV7NQt6LnNcbF6VNamMzj/1
 i0Kda+i8OGLCSUJeJXq2aS2grDK/Dy/wuiV6oUpxSDsH5keZDLGZXdjDqVAwJep4to4ZOc50z9d
 wqvdnnkiL8ljOwAXio5PtHTbpJZ5XhdAuubmAxUZhXYWKkWzQxZPvjM1xtP3uXX/pgULKzB6cMT
 n/jXopgRznax9XnQSWb6b9uDBZh9aDVlMp4AYZjNoWobEDB0K9k9CExtHC+MjiaTy69wZmk2
X-Proofpoint-GUID: ufuhSfHOJLwy5dvWxTTCCwdSCXINcv95
X-Proofpoint-ORIG-GUID: ufuhSfHOJLwy5dvWxTTCCwdSCXINcv95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090086

On 5/9/25 8:45 AM, Huang Yiwei wrote:
> SDEI_EVENT_SIGNAL is a standard interface for SDEI feature and useful
> for customized firmware calls. Therefore, adding this missing interface
> to SDEI driver.
> 
> Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
> ---

Patches like this are usually expected to come together with a user
of the newly-introduced functions

Konrad
