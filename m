Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654E0266B6C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714381; cv=none; b=Ktrv91EjnlEj8BEBk7BWZjbxxFTw67ogsmk1i6FErZDKkp/R1EoHsLow3WzwIajYbgZNx8wCZLxpkpGefoVm2bPEjSDW682gbpt1jGDSPHiSRj2DV6ZxwAOkP08MbkzwrQXUOOEoF4hwcdU9lHjFL93Djal1bdtorPhe5WwL1bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714381; c=relaxed/simple;
	bh=uJm2d/sYysk/ox5eXeJvGB2Ff2/lvKGPfhJiU6lhUCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPmxEN/7OlV3j4ZbeGEEI/e8SVz+kYzyzabCO6ZarKEgZbw1tdLGPSHszq3HJZ3YhJpVEjluc8JjFydTcPfBSXMLYiMqZhl74Tz+psds4YcGkTbXvRvJFBvQ2rdPn3KqHF1ine20gCeqA0HnC4cLrzmyo67pVFenTAx2/UHI114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dgh/ElC+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dgh/ElC+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548CgM3u031435
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 14:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UXdlLGg1lnlu/LLea5+Zsq6a/vEhr+UdYLuwJ2Yk5Do=; b=Dgh/ElC+I0tBaC7m
	SxP/yOcwwBFJf5x6/b+2PcyAUWxy0V2vhQ+n2cm5EsGxCNrpa/+TRp3viakckvoJ
	MkM0d8/raFtVZZWo3DqNqk1bAXGYdi+Kg2/wnHCI5LJNIoyaN75xQavoeF8SOsyH
	FHXQ0CfiCH4Y7l8hxWQPVh8ivM1OtCDGvnK3u7TVkWseJH7cJIPNmLYLxLNuonqH
	mmU4WWsT+G8kcF85M2vXxrynXTzr9vnRYIFkezWWV872hX0GZei1HdOY6P1kRkhH
	AcN1q/hecHZCpmlZFQ/bG7+Qtqu1ReIOlzuNdvwwZ43i1n+K70N/ehhzk9EgZWVB
	DJKbtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpghjsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:26:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5841ae28eso23916085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714377; x=1747319177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXdlLGg1lnlu/LLea5+Zsq6a/vEhr+UdYLuwJ2Yk5Do=;
        b=AEZcJOt5xxqwo3RSdJ+E6Ld6VxtOvLhxfijuIJAOxrjNDXwr5R/HhLaR7CtbDKxkYY
         RBNWWBRQzBG++Y0wdVKbLEc+rqRotTLNQ34pciV7xaJzVlEeVfZ5R0olyydxBMA87NqV
         b87qixBxOx0LPJKSDrTNBrGhJeEMtIMQLkxcBRVCLIy0UsGVP2hRYsYcEgFPEvq/ENkS
         oQY9PA9j83aWDl9h65m9IPvyhCvLw9rmHpeB8hkAN0zOpTvJmzWGLO7aMwIsY08QOAth
         IW8xn9y0GWW8FDS3hRYBq5qpchgWEyjfMY/yvtB5Q6ot6IPBO139kiBbG7anlg7TEkE3
         yGDA==
X-Forwarded-Encrypted: i=1; AJvYcCUUkiPFyVRCu/zkuJ30r7WeQ7AR+I2sSNLvA6nN3tlp/NTSGb6ZhBfwK3eR6fdcffo0lF3HHudfC0Qw1fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiHK0OVo62iPNtjov2zYSKZy7JxaEkX3bErBAZBSjfA48vFbOH
	/zLLAomiVzjxihegvz6hs65Tawb5/VYy1XwtwjfIT2DDerrsUdi78HKdNjlsRoe7E1Y9wwM7v9l
	f8Tq24T8rfvxmIp/95QYBqY0llu4rCeQHNEhZebt5THkscG3/MZu4Rnyhr7nvYho=
X-Gm-Gg: ASbGncsTDJmFpfeeolfOa5bXMiO5S5lBh0VcbLCcpj/YyMwN7NaTkPbcrcVBwirTogX
	0dHQ3W76wvhIWwHters1au4Lnx1KiCXS1iM1mnMEX6lEqPwEqejx1HrHDcGDvnQB43UKA6t1C/9
	Wcb0E+XlNblbLu/ecXDjZj7CJOWZl0DEc673c+QpxZY98+5dUrTlmNqbI5UJjcPXO5phwoabOxo
	UDTZen4W7nrpu+HtArVdWRpgwKRZk1t8cw/azTZJOGerb9RNXAvxZLxVXGqEHeDZf+626ZKQ9Tu
	fLVjPXCwiiIpq6rEOI++bxtE0sXRKBwfkmvP0s5FhldAEPSioVXRAn0bb3PXCDaCfsw=
X-Received: by 2002:a05:620a:319a:b0:7c3:c340:70bf with SMTP id af79cd13be357-7caf7420db2mr384146085a.14.1746714377148;
        Thu, 08 May 2025 07:26:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBmwqtRAYRbfqe3Sg4B1w/JN84aZ1KCtI2s+2ewc9k1uRUwUorYOTTAwQlq/ZNkjmJHGD2LQ==
X-Received: by 2002:a05:620a:319a:b0:7c3:c340:70bf with SMTP id af79cd13be357-7caf7420db2mr384143785a.14.1746714376822;
        Thu, 08 May 2025 07:26:16 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fb9c00ddd8sm4639625a12.58.2025.05.08.07.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:26:16 -0700 (PDT)
Message-ID: <2ce28fb9-1184-4503-8f16-878d1fcb94cd@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:26:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: qcom: sc7280: Move phy, perst to root port
 node
To: Rob Herring <robh@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com
References: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
 <20250419-perst-v3-3-1afec3c4ea62@oss.qualcomm.com>
 <20250423153747.GA563929-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423153747.GA563929-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681cbf0a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EtpzxOmWCkDpKJZIM9sA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyMyBTYWx0ZWRfX9GffPzw+XntO
 Q59dVjwBvGMt9Aq74K1SLrIAOOsNUCrFYkfjKNey8lQC9pwB+yl6P+SaqXK153W1Utoml6jIE9F
 9UTQ1eijhNp6F6B6EHE7NzIZA7UXU8IL1r4WRn9H7PxC5ZcYQKc6eQ8UYtcFMLS/6ERJqu+0LWr
 qG8/bm2FTmZYvKObPyGiD4YaZAU0eRpe+xgFtMEY40pINzAYAlKg/LKoqgbf99sFALrWkoQKyP0
 XLWAzcaC+1BQkZ99ntyVgx9Cbko6su5UTR4SV3Iq8sfWoI6vQMJTgkC+Iakq3GIfjRmYaUdZ4jz
 RO/1bnNIK1IsTG/3MyZSJd/LUucjlEt0fdJoe4E5WXL2TNz/UKwmHFyER/+v43Q/WyqyDX0mLI8
 hrBCnECkK/XBfVxtpjRJUFF97/bXz/jwkRTtimlWGsigkkRFImo2SF18Q+m1OvaszK1izfM/
X-Proofpoint-GUID: VvcazVP-AhUlhxJd9A9p0hHyub71pRMK
X-Proofpoint-ORIG-GUID: VvcazVP-AhUlhxJd9A9p0hHyub71pRMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080123

On 4/23/25 5:37 PM, Rob Herring wrote:
> On Sat, Apr 19, 2025 at 10:49:26AM +0530, Krishna Chaitanya Chundru wrote:
>> There are many places we agreed to move the wake and perst gpio's
>> and phy etc to the pcie root port node instead of bridge node[1].
>>
>> So move the phy, phy-names, wake-gpio's in the root port.
>> There is already reset-gpio defined for PERST# in pci-bus-common.yaml,
>> start using that property instead of perst-gpio.
> 
> Moving the properties will break existing kernels. If that doesn't 
> matter for these platforms, say so in the commit msg.

I don't think we generally guarantee *forward* dt compatibility though, no?

Konrad
