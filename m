Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8ED1F4730
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738263809; cv=none; b=h112ULjMQA38J20DUcLTQLu1NFfaislr8PKqjHq4AuzjUuTUw13LTHovUSrRqRgvM9KJ5Ut96Ukxu8E3askw4Vx8oqW6gXNJdWjojF29S2wlfJU8gHHNrKMo8KBpLKzhFROwPe3yI/8JFfk06SMXnDLNIs4hdoGmfujQutjvUhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738263809; c=relaxed/simple;
	bh=xA170475glyKqHvoyIBb2H8mhDD9eIw+YedUxI2I/Mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/S0ObU1MeIc0/ek8AzOUA4HB1CcJMeLSoWv0VAJcxZ2URx4onu94bjrGeCWFi4Iuzxk4fZT8sU3eAqbJkLlDHfg2foN8+ezbTNStT2kdWaLMPwH5h3qk+wCb+sHGmFPHm8S89BEr1r/TbMUO3ciY/NxydN/VeBsbGFzv2LPiMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jWEKebLw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jWEKebLw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ1pTg005255
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+4dC9ic1NqLbtu8u4j5hpEPGFN8j5hgiRxsVCkLaMw=; b=jWEKebLwZHpKxBV2
	RBapcT5V4s5pAMsgxvOHAJAh43QHgaLKnmvl+vu444OgUaG2QmeD/YuCkkFVUHW4
	JgJti1SGN7hyQ1x7bz6dgC7wLWjYB4xCkZkABBYkVd1p6L3aklXpfNmiQSa7qLOn
	pJVTFj3+2XyMWhZS/w5XJdaIiX6aogbOqzNfLxpOGi6mYYiaxjQVmhtNZ6fDEMid
	aJZgYagfw9R3YtaeuNNeamRHLevAaduG2RxlK92dAVQJVAsPyhXa9ScOkzhTaOif
	aP6GpfeZKV3+etr/xIdGCh4muR2bUXxX+VTHFfr2S4md6yOqySYDf/lR1cr55elr
	5DBLLA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7ng07c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:03:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-216311faa51so20838265ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:03:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738263804; x=1738868604;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+4dC9ic1NqLbtu8u4j5hpEPGFN8j5hgiRxsVCkLaMw=;
        b=WwHYH7NiVLjivp0BTEkAJqjwe9PybIr9OSa3A1jibrPBf2GU7cEoaw9H/OyRHIdJ69
         bOcscfmHghX+5DNtJASycLF6CvQbkQpQZ2lDuQaI5nRlxbuWz0kkLXMIX4A5gTlamenR
         VVwc4Jt1I6P/LlVnyUMzznfDpOWvvkMSTY35LGGPTsm+WVTizF8pXAAJc0D9zpswh3rc
         XY1U2IXHuNSUHMMcWCyzflsCRZZ+/3ZY5AxUaon6LgAtar7vCGDGkLyJEgI6PSOz5VdD
         NbUXAsZsypDRGEYD6AcQw+VBRmwfRYyF5ARr6uuxCTg+yf+MRdnrIyBYjWzbGPQmzQiz
         wOOg==
X-Forwarded-Encrypted: i=1; AJvYcCVpZnRVe0quTNqnvIF+Kjz3Y3MYB4Fl1Ziusurc0esN9QNKJxjuJPdvqwtHH3ZIzvHZrTF3yqdmvvDc3eY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaPNOdLI7kckxP7fTYl34LwjEHWBIgW6yHRc9852lzay5V56za
	4DfQQyf0QFvW2gzUHfXFjCJsGaPUc/PAx5g2EqxQE/n+i9zp3hKwy0ld+1NDkIHmquM1IPKhIsx
	G9L751+ev7YWH2FYAkuPut6GAda7T3bFSXVESPBvw+UXpaSgn7wtx+t86yuw5wKU=
X-Gm-Gg: ASbGncvOJlhuRgLnFEgSo++m5cW/T1aJyFKlOrucqez039hefAAw4fGRLoB8AUUCUIE
	TryladIacIwfUTsaI6KvAuWZksVofshOGft+wZ3qkEwOT3TZJvwOvGRAyfoZb8IKB3x5fdizIzz
	5JnmvjXdO68b1nS0raFd5qPy3ln6fGf9pDFhkKJISs0Tr4cfRaCF47citi5vXR7abC+j2hDSIiy
	rq4Pn87J8oiCwzSZ1KvpVBZ8P45EfOD47+DBus/pZtegG5werZj8rRNcbtvvWcpB/zpGOiV8QUl
	FiuwqwktADFJtHW1+gRCQsI78QdjACpva10RLpP/AzrnQW6HGyhL9nXiDlp6pRhVWb5f876wng=
	=
X-Received: by 2002:a17:903:1c6:b0:215:9eac:1857 with SMTP id d9443c01a7336-21edd7d88c0mr9634085ad.5.1738263804013;
        Thu, 30 Jan 2025 11:03:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5lOZnffNUyJ7KCfKAJLEwNSxmca+bnJfKkR1FK09cdyV4G4K0NyYO2pFGbFiPeZPx9BBARQ==
X-Received: by 2002:a17:903:1c6:b0:215:9eac:1857 with SMTP id d9443c01a7336-21edd7d88c0mr9633645ad.5.1738263803605;
        Thu, 30 Jan 2025 11:03:23 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32eba59sm17295815ad.147.2025.01.30.11.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 11:03:23 -0800 (PST)
Message-ID: <b70445c0-ec0d-4a7a-b23e-3939cae87bcf@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 11:03:21 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] wifi: ath12k: add ath12k_hw_regs for IPQ5424
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Kalle Valo <kvalo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
References: <20250130051838.1924079-1-quic_rajkbhag@quicinc.com>
 <20250130051838.1924079-4-quic_rajkbhag@quicinc.com>
 <20250130-groovy-competent-mastiff-19cc9e@krzk-bin>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250130-groovy-competent-mastiff-19cc9e@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pRDLpofp7GFzqjuf8SWZGUs2Dg15OCVj
X-Proofpoint-GUID: pRDLpofp7GFzqjuf8SWZGUs2Dg15OCVj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_08,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=732
 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501300145

On 1/30/2025 12:38 AM, Krzysztof Kozlowski wrote:
> On Thu, Jan 30, 2025 at 10:48:36AM +0530, Raj Kumar Bhagat wrote:
>> From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
>>
>> Add register addresses (ath12k_hw_regs) for new ath12k AHB based
>> WiFi device IPQ5424.
>>
>> Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.5-01053-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/hal.h |  3 +
>>  drivers/net/wireless/ath/ath12k/hw.c  | 87 ++++++++++++++++++++++++++-
>>  2 files changed, 89 insertions(+), 1 deletion(-)
>>
> 
> That's not a separate patch. Regs do not make any sense on their own,
> so this commit makes no sense on its own.

This approach was suggested during internal review so that each addition can
be reviewed without distraction from the other pieces. None of this is
actually enabled until the final patch, so "trickling in" the pieces seems
preferable to me.

/jeff

