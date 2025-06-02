Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BC31DFF7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 04:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748837659; cv=none; b=Hnz48YyFw2l0/+dzjAL0fsjds0jBaJMuHtL9m13nmmYsU5lUynJSx1swuQFSvmPeuszppnTcnnkTbjY9h6Oy5jSkT0ikneB1OzLpZxQ/BEPmvAz+vaYSbX4vhdFFQZV0Vf6zt9EDHmwQ4c9eETciDh2X4peJ+xyHpo5IzRUrMyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748837659; c=relaxed/simple;
	bh=olUu3LyTEVVd2L0cRbn4wd7k+CKY2KcifyAuI9KOeps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLFvOpEqxyTliTeIw4OqfAHavZsNiagyN6x+185elBA5Li0k/4P5ccmJzvq0hFI24AJc2lHxuLoVEzpSElKhH45CG3cd+CZyqP6CruEOU6aKVt5ZWLEZt9i9+VZOpMSUIzuQqKNPLXOZUE6axK6Wg0pDGw8WJc7ZfGjbuhAB06g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhBJEhCl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhBJEhCl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551Mh7RF014374
	for <linux-kernel@vger.kernel.org>; Mon, 2 Jun 2025 04:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0OAWMniQgHNID7zvRPpEATAtmiBVHkfCpZGQYTvMdEw=; b=PhBJEhClhTT6JSKR
	ayHsvJ9hEIC/m7Inhae4MHIR4ZZ8SYhoOiMTU/GEgaRPBYP64eELlWXqnIWSCZrZ
	ectXnkR5umY29scztkdenWpedrqYs+KOxS1mtyMr/7aWfxP9JIzxwps/8x4BPT/t
	ToYs+bZOWCi66OC7/4Kq9vA12skT3b4Wmh1lBml3u3YIEqIS2iRHukPW89sy/3z8
	BlVmrL+gk2PykJx3/YT8DKdFVQeb+QW8M3Bot17prDfRWHBdPmcqSiW3DyQaIw42
	3LGg05QypCLYesQLQtIycDHsEOoHUFi68gpfMiel7/pSv9G5vJwEBluyHFzulsEZ
	GePLbg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytpeub0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 04:14:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7394772635dso2615850b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 21:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748837650; x=1749442450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OAWMniQgHNID7zvRPpEATAtmiBVHkfCpZGQYTvMdEw=;
        b=QvN3xkT44sbSWO+Yf8j2aA3i8KhMmXB4SnurH1doXaqLyCtZIoNcrgmz67TaluGYvB
         gI4OXVN5xbHpYF6El0D2jpMhjrF1ZfR9wAXb90TjPGbVJ9fatsl/cvUoje29XKYyumcz
         vYlEvVCIHY7OhnwhSK+4P5fcz/guqVU9kH1oY/eYehlZBcu+ZyX2077/0vM0/VZd7gHZ
         x/hc9jZ5B9TXaWzkM8NWu6ja3InVdXMgS5QtGZ2MwyvTnYJF8L5PsPAqSZ9nKwxNU78T
         L7q96etZZQHa+hpKlm6xMrS9bICTSgcVR/AxYJEUajsr6cx4e2x/IeW6yooorK3QtOBp
         fEQg==
X-Forwarded-Encrypted: i=1; AJvYcCW7yeqGAjhHJjn6SIvE6o+Mf1IRosd93jO/TTrOhzDuGA91TDOXsR8QvPm/0Z0K9tZ3QXXFQZVnFfuB5i8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf/kNhmHV6a7MehLat75BcV3FUGix28o0WnVy8Qj2zdTBsAm2z
	Jx7s1lniiJCfv5wk7GHirOkcEES8gdlg35X+dxId1+cIPKjqkGiT/dBfek61IwMjZFzJ5lgpbOy
	Uqi++zsliLzHPg3KxrKZDIo6qm2aztZcaXHau9/peZthtBnU1ngb+ipoBQ2Qkz6yqnnw=
X-Gm-Gg: ASbGncu7ICJjJXdyx9E+UaAOBuQhNznvI2E8uWzK2ri7T861XWrYrfYwGmQvxt9ty5k
	mVwMvFKx8YSeQx7TqX36ZfTfDlszNJ5eRmjarez21CmMAnEcBURbBMfi9mkez4l4Nc2qj5i01yh
	tldQ/RnKTl/4MLsBP3FY2fUYc+Cr2x8B29Ua+zjWg2oLG2PkyQQuoKjHmERtDza1pi7TDn76SeC
	TQpUAK2THUhzoRMDN1G0ZZoWLvHOFseKOlvh1MehdH1zZCuR0CaOpbuUcVtyhuIGDmWMrkAPxFa
	GQtTgji95Q5jnIPu6zERSohYyGL/bLTpdrn68hKfxqmpZLqjwrs4
X-Received: by 2002:a05:6a00:b93:b0:73e:2dc8:94f3 with SMTP id d2e1a72fcca58-747c1a1f3d9mr14496734b3a.1.1748837649733;
        Sun, 01 Jun 2025 21:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5Ty1y+LQBkNtBiYdRdXDNy65ctwcG/xyiA+jkbeuo6G9u1WQQJLBdDDWwAEHkkHnFmv+cWg==
X-Received: by 2002:a05:6a00:b93:b0:73e:2dc8:94f3 with SMTP id d2e1a72fcca58-747c1a1f3d9mr14496710b3a.1.1748837649321;
        Sun, 01 Jun 2025 21:14:09 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab7a6sm6663134b3a.45.2025.06.01.21.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 21:14:08 -0700 (PDT)
Message-ID: <d3dcf4b8-18eb-4621-9999-bfcd0a5f47b9@oss.qualcomm.com>
Date: Mon, 2 Jun 2025 09:44:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: qcom-wdt: Document
 qcom,imem property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
 <20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com>
 <20250520-portable-anteater-of-respect-c7be5c@kuoka>
 <37bd619d-242e-4488-8d45-c2c85612bee9@oss.qualcomm.com>
 <b8003fdf-66a1-47e1-8c78-069f0739ea37@kernel.org>
 <85e30c0c-ea77-47da-9fd9-4293c7a78c75@oss.qualcomm.com>
 <8efa9abd-bf7d-4f9d-969b-70c0452fc2b5@oss.qualcomm.com>
 <41ee75df-2244-45ad-956c-e17ea5804dbe@oss.qualcomm.com>
 <680316ba-5e28-42f2-9e83-8c48af78b785@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <680316ba-5e28-42f2-9e83-8c48af78b785@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+fbw/Yi c=1 sm=1 tr=0 ts=683d2512 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Bdtrp7KoZHkjbFyHNowA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Aa1Afrp72u1y3RrGu3xKuCZsyBQ2R4QP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDAzMiBTYWx0ZWRfX3h94dITgbtNW
 6fOYTn1a7GNLqdcmSWqvHEvf0lxFSBrY5CKcQpGAUbBcTUWRWfjYcgrUybNlaJvhCvDlHAw7a4N
 dMTpoIz8tp4EgAluIJmmY/EuawTOSDtroxz3tNi6MSXNBeuLAWJEoecScgPc0A7fXst3AyZhPUC
 T93K35oxFOlTrvBlj/zCfieyaGepcQV5AEk/N2ZnyDpf9qmzh+Q8oSMsJ0tgk1Y5l+9gtfYP7g4
 jf4n+T8NqsmehevUZhpp2JLKCOtuw3t9TTu1tv6MLQhqBWwnsu8pm7HQcY4DaDzpiyUcKdQx+vE
 D4tYIY6u4VyYpu0xlRrIvE+dBUhrjWp5dMNO76bl2BIr8yYxY4O1QNmy5eUjWPKzmxhwClB2RFG
 YHcBjgNDPHys+pWk1BMY0K76HYYjU1LQ+Y2fWyzfJs6bDyFq0dtb09T66SHH2pBsZBZwxY8+
X-Proofpoint-ORIG-GUID: Aa1Afrp72u1y3RrGu3xKuCZsyBQ2R4QP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_01,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020032


On 6/1/2025 9:21 PM, Krzysztof Kozlowski wrote:
> On 28/05/2025 19:16, Konrad Dybcio wrote:
>>> Krzysztof, Based on the discussions from the previous versions, I have made the changes. Can you help to guide me on how to handle this? Should I just name the property as "sram" and point to the sub block in the IMEM region like how it is done at [1][2], which is more or like similar to what I have submitted in V1 of this series[3] Or is the current approach acceptable? Or some other way to handle this?
>>>
>>> [1] https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_imem-v1-1-b5d536291c7f@oss.qualcomm.com/T/#u
>>>
>>> [2] https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_imem-v1-2-b5d536291c7f@oss.qualcomm.com/T/#u
>>>
>>> [3] https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/
>> Let's go with desired-value-in-dt here.. I don't trust the firmware
>> to never change. `sram` is prooobably fine, let's hear from Krzysztof
>>
> I propose to go with 'sram' property.

Thanks Konrad and Krzysztof for the inputs. Let rename the property 
qcom,imem to sram and submit the next version.

Thanks,

Kathiravan T.

>
> Best regards,
> Krzysztof
