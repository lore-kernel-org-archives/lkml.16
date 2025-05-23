Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36D1298271
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748022207; cv=none; b=J59qUn4W5KF25zHZYkwpj7tE/8CT7/RtjMEY6PM80TRAGSUuML6s5NxboGxmT7Oyno+bBYaRIYdu9F+/0D63iR0ED35bI46xF7hFxR5S1tR/9exdtsXaKohzTZ5Kptkaw0balRs/vHGzlNkg8m1D52ijCYaqi/eXQGpHiGWhttM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748022207; c=relaxed/simple;
	bh=9UF4qGLZiq0idzoWE1m8oF9RUy8Yh/CMuJaLEFmdnns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e32SsQOq2jtz7ka7q6ArY62g2HPuSnaQLXLlwFFCg/DdWEHnrE+8ud/yDz59A8i0JnHHIIHMWeuTiTenPTvcSeeICTawV2a+dxXuP/HE/MqDir+ow8bibmwSLgzkFjMMO4q1XsnmI6XzvyUrNRw+FU/fpjACpvSkNamrS/e7XZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEXjFRO9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEXjFRO9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCwmii024983
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9UF4qGLZiq0idzoWE1m8oF9RUy8Yh/CMuJaLEFmdnns=; b=HEXjFRO9jPvDtuJa
	FXlRQn2QGZV8jk7OyFyRbi13daVQlElNsVO8Tiz3zLVvkJDRp/FMCGiKbzkoCOJX
	Y+B9OjXs7r5LESjz6iAmNRUuJDxmdg4IXDgTVTAZqZRw6+tlgd3zuDUrCBksiDpF
	FDWBDcRj+1zLR+4/0C/9k8yEhV+jSeTnhXTmccCqOGDTRZLrPstDMuVxwB6RS1PD
	qPRadv06oc1Tl71NPPHISv/ARMMKm3WGW8lTO3x8Ncd/Tc3qeKXdGUyocTlYJ/XG
	FCXYHE/1+m2p2Y8UpgO/yTmLzeVS0y+nbP7aapa2+vo6oLrM1wqUUohSLkMHaHR3
	DE6W1g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf52q7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:43:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3108d4ea2edso139224a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748022203; x=1748627003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9UF4qGLZiq0idzoWE1m8oF9RUy8Yh/CMuJaLEFmdnns=;
        b=qcpWP+MaQ/sZwscI/v15nAnNe1acgmjLW2IkN0noMPFzWXdp0DadNbqy72OTaiREBY
         Q7K6X2Q/+nWtwcEWh/uXLqLjH80zY+I0Kf35XzvfJ4bAVqh4DZ1LjyeMV/MLT5Qmz/sf
         oSbi0mtPOYM0oXeUMghf9QTN46fac473MTEXJ5DrHLpkA6aiZOi2t0r46l+uS9WlZ64r
         +ccN4nEfACxfigT7sI3ti9gOIhF1/6ghZO1rs9zw5pt76vkDue3dWmANxdDdndaWYikg
         CSNuqlIMeNIMlb5yrgpDjMGw9KPacSc7bv2PhEqrX/e1Y8LMPRmeORtBoNFB+Iu+HBQj
         m0SA==
X-Gm-Message-State: AOJu0YypylA0K3iFA4OWwpUpq/HHANhFGrN7Loz6XWlACKyJjlRWQDRp
	YOJf8yn3rPpNCjYVCa0gMgmNqsQnUeb8FwBcXDbZqJdGMY7jOlxpAe6Cb6dV3CH8AECSK5qYfO+
	52kcZHVS4EiEQMpWMZW+xY4yluux3PaFQYIRrfiC+EhYk17cdDEju29gIj+5jIuxLF5FJ8NNpGI
	o=
X-Gm-Gg: ASbGnct1WoMJxE9E6F4nkLC6BiI6YgCfBHGgkOoWW0EFdmMlyMd58JfOltdD1WXRGd2
	dysKxf2Zs3JRZJveKy7ZYq456RFpww/6kr8q+mGAOq7Jo+MdRTuCyI7IvgHqUw7hASdf3EOX9Qi
	beBsGlGh93DWLtSn4Ufzct+IMoJCAmevLpPFzYE9cYW6A7YC5pc1n/CRNjHpFq9e45qnabM4vp4
	42L+JMW6GRWfqaCZoX6k75yL+FeyavNBjhyi76Qy9T8bfI5BgDCg95ULvKlH2XzSiNyn7DV0z3X
	ulFa6zffrSJGB8NGDeqbxUSEgaNAYndanlLkqvmEHIyz0Nc4ByKgNtxJcypqFA==
X-Received: by 2002:a17:90b:1d88:b0:30e:9349:2d8e with SMTP id 98e67ed59e1d1-3110b474800mr381212a91.7.1748022202979;
        Fri, 23 May 2025 10:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh6FmZvN2wDt+QwdBOJDJe3T9GYQ0xi8SDzcPBpN/rTp+Xf3P8d/oUww+OUE5d5vC8LyamXg==
X-Received: by 2002:a17:90b:1d88:b0:30e:9349:2d8e with SMTP id 98e67ed59e1d1-3110b474800mr381184a91.7.1748022202589;
        Fri, 23 May 2025 10:43:22 -0700 (PDT)
Received: from [10.71.81.158] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3110444d54asm356896a91.30.2025.05.23.10.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 10:43:21 -0700 (PDT)
Message-ID: <36608326-52c6-4d82-a51a-b802920312b0@oss.qualcomm.com>
Date: Fri, 23 May 2025 10:43:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] selftests: Add perf_qos selftests
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        ulf.hansson@linaro.org, arnd@linaro.org, saravanak@google.com,
        deepti.jaggi@oss.qualcomm.com, prasad.sodagudi@oss.qualcomm.com
References: <20250505161928.475030-1-daniel.lezcano@linaro.org>
 <20250505161928.475030-2-daniel.lezcano@linaro.org>
Content-Language: en-US
From: Eric Smith <eric.smith@oss.qualcomm.com>
In-Reply-To: <20250505161928.475030-2-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t_E0LnfBjkbAqviOQOn9BLzZEbfBhKeS
X-Proofpoint-ORIG-GUID: t_E0LnfBjkbAqviOQOn9BLzZEbfBhKeS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MSBTYWx0ZWRfX7/GnWz60Oiyq
 d3KTMOCRfeM/pNGt92yaER65doPO6j6WVtbeYHFe3WPbi4gVFadCNmxmGtybik075x6misCb1vQ
 jr3KbcIRh31K1tkYNZC4c6ZTU4hrn5HlsnItCvx/tExq9infCD3DD0semph6dxA0r1MMBnLVOX4
 EJ0VhQnMum9nuuGaWA+vW/4/YjsUpBgdYY3pxzlixSEcco4bZW8AMXm7QS3r8WWWcneRmc0GmRZ
 rMqeRP8ztbC5t2+OehQs/8lKCoZOaJimNvKBMs5FCE8WDPsWCBx9b4F+oO/rzbUHI4TkqjiAZ6s
 KXmY8aR0OVT0xPmaWBPhjXnqjN3SNRd2tXn9S4Qy41OneBTIZwxcTcxQpLPkjy/oIiywuB5b3q0
 vhwjcA4yBG6mp+N24b5kWS0NrYXeIQleVSX9rVv+USFxykSN1CXNUpJV+oXCGUvQyS68nPqg
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=6830b3bc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=ySd55krBe5uuJlf9SWAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 mlxlogscore=905 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230161

Hi Daniel,

On 5/5/2025 9:19 AM, Daniel Lezcano wrote:

> This patch provides somes tests which depend on a kernel module
> creating a dummy performance QoS device. More tests will be added
> later.

Thanks, I did not see a test where the perf_qos_is_allowed API is used.
In future patches, can you add a test using the perf_qos_is_allowed API?

Best regards,
Eric

