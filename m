Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402643596B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749748012; cv=none; b=a7L0UnmLxvy6ELzL1hS2bYxS1Dc0yAEwrtp9pWPN2aW7bUVKnA3Smg1P/uMaGYXaxaouof/9YRWvsh+SbSZbxe0e1lHEIY0Nf+xjUpISZzk6O++6i5Ux4s4q4t/nNPj1qoEnVcbE5Eyw92q6YbMCm0UrYp/9PAX2k0kXyO2vDW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749748012; c=relaxed/simple;
	bh=TC+OdAXhGoMZG6SvmmASRYnqvkbHKHrlXYVoGxDrKac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWD2rCopD3eAeG52xUX7KJ2T2ug0fslCtKXPy0PFEpAJ6gyar8cG7tFtLlA3i2ebti/v4bgtEyfmtuGr47/ug9dcBsAaZGJuKoC4IIilciuYkzdQGd/zIO5QpUpA9oaS2jIYCG+4yvv9iGciRPUEbYVCZMiqsS5x6abRCWNLNKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfVLnwJ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfVLnwJ/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CGatI7019835
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/F9DH13AExJPe3SmFcpjEpcSWprJ1OtQ4zge43iQr0=; b=YfVLnwJ/2cuMQ0xS
	3hRoocw3/7be204I+4jeZ8T88fUBEEBCFCd7wzBRMgMfPsoFc+C77dBvz0hWXldH
	hV9CHTzS23bJI14nggxxgwSHQU8HzIAVWi9VIssfXyszGmvJYRPO9Kcl88AKa5X6
	8mmG7RlmRIppDFy281V6EzPhg1GKqnLJYSQxzoMG+Hnsfz3w8GpvKDgiMWl3xPGc
	Ngbc6m67yTdNzmUsSxM3yHzqQOheRgOsRN5KzogOGbsTB/aQDEoRhRipN7sTijyq
	4+acEeDQs31mf96eNdQILUiP4qJ/2HgRPkmJe9cfogD+OqnRyVfJv6B59SC0isYj
	X0rizQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcsab6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:06:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0976a24ceso21902185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749748009; x=1750352809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/F9DH13AExJPe3SmFcpjEpcSWprJ1OtQ4zge43iQr0=;
        b=Y7k3jNS2fTcPBI81q2MQCp0s2M9JvIeuhoAD0BvkB9mM/8aX1IefRTGvQ1Dkyv2L9t
         2eh9T9NnuuZChCxPOL7CM7wa5OGUN9CpTBLjkxg8BhVfaeibVFbxrMtEPhWtqpDL2Njm
         1qEOXkSwMIe87MVze6x+nKM4XHEO828MWEH0yQSt+NLbEOdNnmf7LhOiYSOgG0MaqO3M
         tmMghths4Q0jB5fke+vmGYxnjaY55FtVxpXZ1E0fED1/FysbYLTS/++7cdnUQQ+0beVC
         XJ8IIDjgcNqjRjKvpq6zYA4uv4NIX+oXAT3asDY+HHpa+Vks2jGMzCVEKYGaLiyPDsFE
         GvZg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Zl+0W8AvY/T/QKRJBLYULt9Qb5W9zVhdJYwEXcjYVhvC6DWth39P7K7gdi5Ns82vA1aFIyxldJ7mAk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkdxoRzXdnOYbnAyt10SYsJMiJvyHyBwcBf5U+JaZcI8uTN/Ba
	iY9vEsvuHbYPeoGdAzT/C+2uPED9++lplhZ9nYY+jyw+P7uheppg3PgCG5PLvNEDEAGlZOI9/86
	GZOW5gnaCxu9zS+4wU242Dc9Qibn6gGlA7O0yek/TV+kNPDtClpemFXG/hr3d25WE5NI=
X-Gm-Gg: ASbGncuaYaCKVQXaovjsAvQT/92e7s7JHTKWbqZbM/OW95vHnKRG5+c8pbDiBY3S/o2
	6Vwj6dsikAiqB9xUJa8x+0hwvCIn4zBjX8MV/71flQl7nUf0IhQomqmPw0RQNzW8BSfmp4rmiAa
	OLJqt8RB/snvxHa4lb8aEwTu9E260roamf9Ba67HyZ00wevh/28ErkORu8hzSJh3PoKza4UWNZ3
	KOZxb6SyOYuVolBE3SV9scHNwIYTAnztxo/Rx2dD0W2N2phdxb8zDv8RjczutDmOnJEvc1TaWl3
	Lbr7S2PKeAgI82D5w6JnfgxO4DnWSBCzK+dVwVOVDbqb+tx+9LBZXg9rVjExxOlhi+8NCr1Izmi
	s4jE=
X-Received: by 2002:a05:620a:6008:b0:7d0:99dc:d027 with SMTP id af79cd13be357-7d3bc44b583mr3224985a.6.1749748009054;
        Thu, 12 Jun 2025 10:06:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENJW6VHvwcvJhbYXcOXbguZrhWncdGYuUMo8aTu0ygAXzgLYZHTyZcyt0MfTt8BprUf2jNDQ==
X-Received: by 2002:a05:620a:6008:b0:7d0:99dc:d027 with SMTP id af79cd13be357-7d3bc44b583mr3222585a.6.1749748008623;
        Thu, 12 Jun 2025 10:06:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadb22acesm163057366b.103.2025.06.12.10.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 10:06:48 -0700 (PDT)
Message-ID: <c29e80b2-4b15-4823-9821-137a9208f632@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 19:06:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/2] arm64: dts: qcom: ipq5018: Add tsens node
To: george.moussalem@outlook.com, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250612-ipq5018-tsens-v13-0-a210f3683240@outlook.com>
 <20250612-ipq5018-tsens-v13-2-a210f3683240@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-ipq5018-tsens-v13-2-a210f3683240@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEzMCBTYWx0ZWRfX8+gzTW9eyPg6
 AufSWwcM5Y88xoN9bm72t1r0kZNzLtkm46D70+/QgLLjpGdYB4XpuEEhuj4FrM50ffpRWymuztv
 fGjC6NQ5Cte7kiqIGFScOEe3yzR0KkpjFLmoSnwNpBhoebvoodImQKfuWK8hWv086mHXRBWsiyb
 7S2SP4FdZ5J+aK9Qr6wAWrLoyF7B128nqTuNb6KQP4Xh9KgaaMIar6TIErcR+mMrRDInG5MF9dS
 AZViIzIWXsORnZqPFk4/WD+js1tBWsst9Jf3S648s0rLzJQY/KPP5BKpZUWOFsE5/Y3A6hv7vjD
 CSJHtTTpXeMwE3g+L0TGEw/qjg5SKw5Bfiw9sOYH8x8iL2X5MGDuCtD6CutNLICBH/H9o+0PpgB
 dVjkHpvQhnen/qdenV8um4UFQLeeFmYBbqn119p6Eis2cQALNogj9gOp3cArks30fY3quew6
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684b092a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=p8e7PeVTpa6WA4hJRsUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: syqLeOnlD8Ecg9qK3OeGKb95uuH1r7F5
X-Proofpoint-ORIG-GUID: syqLeOnlD8Ecg9qK3OeGKb95uuH1r7F5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120130

On 6/12/25 8:46 AM, George Moussalem via B4 Relay wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> IPQ5018 has tsens V1.0 IP with 5 sensors, though 4 are in use.
> There is no RPM, so tsens has to be manually enabled. Adding the tsens
> and nvmem nodes and adding 4 thermal sensors (zones). The critical trip
> temperature is set to 120'C with an action to reboot.
> 
> In addition, adding a cooling device to the CPU thermal zone which uses
> CPU frequency scaling.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
