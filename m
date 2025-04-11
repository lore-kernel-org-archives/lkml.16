Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52A5293460
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744361969; cv=none; b=FdSqMLUblCYcBdPkvxS5YOdgkhHfweCCbUk3NdVXxi0G3SopXg2c2EAXHb9pQKJGlBsHm4omF4Q3pAU+EtsuFNDpd9gu7ocGwx06W5yB7Y2SRGlJ0qt9AgM3cem0HZ69/NT+JM6zCpS1k54Vk3z9s+THLTrU0zyuR1m/n0mVzag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744361969; c=relaxed/simple;
	bh=Q3ST2MLjNprt8W8DwVtbdvSbW7Gy41vP2tT3BIUViE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCqAUK2Rqjy2hd1yU8MMLNWq3ideMlitfwKDrLYShhjURGGnWcHfgPFMDe2Da8xmxaJreMKo1v7diDBlH8ONL/wfMC6u/EpwJQKfqcP89FbxgRxyl6y9GKVB9241fznAL2IbqFnH0Xt8CSIZB233WMcQ2lwiKXTmr0e/ahbZ058=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nrx0jzYb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nrx0jzYb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5X41v019634
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/RuMAy9msHuh5tqlxCLZQdr2TbbASae7QFdHD+HliU=; b=Nrx0jzYb38liETmz
	nu9EEKOtw7AMJWhT5yBpjoElMqx8GDbuS41u2XQkRBLa09QrwZ3e8TSJqAvwfLcB
	rIxHywIvG1fSGGPUtslwbPhy08/GCBp9Um3mopyShIGmS06WoxAphw+y2K9f9HA9
	D4Ew+SuJqPaGS6d37rEO50ujeWm7+ZrOCQarwuZ10kQ27P/w70xBAJE7nauN4/4x
	2qVeX81u/YjFD1nxoIjJP01hZIkQQQrxJPo1DGQqjRmONHAoEa8yXI+8KjArhLFm
	xkkK+9oCdyx+yewYZdwv9ykFlXgCBfJvWuEv35aiPliD+KnbLapIWoiJlQlkwXWJ
	V+XbTA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrt00w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:59:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736c135f695so1310031b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744361965; x=1744966765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/RuMAy9msHuh5tqlxCLZQdr2TbbASae7QFdHD+HliU=;
        b=JI7L+lsv98eFZGpomRivshycRfYQu3dM3K4aTKJksTCRYKKJc5gLKIBuOpUXLgWohF
         zb9SHOA0VxDCDjNVJw0eTW0BzBCnZzHTSnv8eftC6lO7C9kcF5ubg8bymzumyCpmOc9T
         olDq8Ws3NENK3RXOnPVxMyiDbhvqo3c3dwULYzJx1y7tGUFzdZblfJ9pcPwgxbCnmMen
         TBLHB3RS3Fv3Ei2a6tvKTbnj9A2tOBgEckSwwq3OQ8BH66F2HmMAIkcUDOdHIXR9WhZD
         i9z1TfA7LozGWarqDVVE5wRDMVIErYjcb7dSmlty6PfwI+SUE+aWbLghmT1mZrwreK32
         TaeA==
X-Forwarded-Encrypted: i=1; AJvYcCVt4w1lDvuKv1BKnDnTY2HrKfDPe1emeJOziKkcohcGN/KdK7/xEUA0WD3jXnCKImKwn4mIeelRbPkZkj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYMYj1ppyWeBzItyQ3Brbj/gNEUnZWp6iK20MbWGbgdsYYSBpp
	Hy8k9PtoyFerAM/45YB4jkPwW434rqzq8A6QEqN4CtbXAVm54V61wAh2zsy7c7lmfnnBwq0mQR+
	Hs6e5YihAbk2D7IUFxf0iMULOsYlxo5S2ZylbIRN7ZCWCSMq70KBStQOF5DaYLkQ=
X-Gm-Gg: ASbGnctPFqg3zZq3PHvh05i/kNmv8jKus2ViNjicL2kUoUnQ/M+sjJKBv0Q7kxuBg0A
	v/EpwVlNfpvaO9h46+9FXOo/+pSjD07MNXld9q6S2vNTYeSN/2fcuYw1O/MFaByVSG+30S6OqZM
	f03cMJQFiin8HK8mkmqSLK963dK1EwHRjrN7PWwO8eg57j9dV1UBkHC7TKKDs+leKKUaL7ha+BU
	gers3Q8YynCAMglSbyQUOWpH+7ZmEUfDozTOgPTN9MukNC0GCUGLE5K1Yr38LrIWsoKkDnpOxM2
	K9MMC6A5gJmAX7K9XefouCAy+a+v6k+0lJ4s7NyG8ymWLkaF7+/C
X-Received: by 2002:a05:6a00:4603:b0:736:6ecd:8e34 with SMTP id d2e1a72fcca58-73bd129b43bmr2796389b3a.18.1744361964949;
        Fri, 11 Apr 2025 01:59:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq3Om89V3BbCVuLa01tYbUYAYbP5OVnWoVWe3QAtTUtuyYrDH63vACK+b6upU1gLt6/v8bnA==
X-Received: by 2002:a05:6a00:4603:b0:736:6ecd:8e34 with SMTP id d2e1a72fcca58-73bd129b43bmr2796362b3a.18.1744361964496;
        Fri, 11 Apr 2025 01:59:24 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c4e25sm968489b3a.47.2025.04.11.01.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:59:23 -0700 (PDT)
Message-ID: <734cf70a-1d96-4a87-bc7e-c070c1e7dc8c@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 14:29:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom-qusb2: Update the phy settings for IPQ5424
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com>
 <Z/i+6k6VseihdQ69@vaman>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <Z/i+6k6VseihdQ69@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JhAP0XKsQLH5Kg6FhxduDbegLlEwaKXB
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f8d9ee cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Mlon7qBrsPBlpjHfUrMA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: JhAP0XKsQLH5Kg6FhxduDbegLlEwaKXB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=861 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110049


On 4/11/2025 12:34 PM, Vinod Koul wrote:
> On 07-04-25, 19:51, Kathiravan Thirumoorthy wrote:
>> Update the phy settings for IPQ5424 to meet compliance requirements.
> Can you specify which requirements are these?


The eye diagram (Host High-speed Signal Quality) tests are failed with 
the current settings. So design team asked to revert.


>
>> The current settings do not meet the requirements, and the design team
>> has requested to use the settings used for IPQ6018.
>>
>> Revert the commit 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for
>> IPQ5424") and reuse the IPQ6018 settings.
> Why not do revert first and then add the settings?


I thought of submitting it separately. But what-if only the first patch 
merged and second one didn't due to some issue, it will break the USB 
feature. So, I thought it would be better to keep it in single commit. 
Please let me know, I can send V2 with 2 patches with the merging 
strategy (both patches should go together to avoid the USB breakage) in 
cover letter.


>
