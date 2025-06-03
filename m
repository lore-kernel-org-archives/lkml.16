Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008722690F4
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748936129; cv=none; b=hJosBAJUJgPtyL/Db2jphYCD6kk5QzC3qE/Qzp07co14/2eTho2ZQLmZqh+hqt1plw5ahw0EPXB2lUgh+kemsDEX+aqy/9GzI7BG/eH2ab3xM2/k4VCZKMCeumLCbQVw5dTcyZ7OklOjcx7UxnFcQXSw4PzVtA8/32ZHZc+MdhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748936129; c=relaxed/simple;
	bh=E+QAiazNn9v/r2GaWNXCVc9NzRxjWjvN6HgGF1scPOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSTZOAMk6UOWZDdAbxO+4hcthH7SlyJzAEoFHZRqJgcCgk4/0lUm60EAYVLGTKf7PyVfH1R/HY1VA4fzPY0HAD/ESw2gghexYpAIkMWPWfHgH4vvomJTt8hnyyUvnDLbbEiVBErwzX5SFe4/uhRgK9TvaaWlPrR+veVpJMUiruc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gr19oFt3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gr19oFt3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5536tB3A007548
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 07:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FecECnu2NheaNqiJX/ORSRrplhA+quPcAjrXUQL/gTk=; b=Gr19oFt30bnti54h
	gNQk79Ergs0wgCwz30ZHvmZwf5TdCovgO4pWxpr/0hgrjMmdHE2g7OVAmM4kaZ4Z
	gUUAk7dK0lXyNiIqo6Q/SGnn3hRiigP1KkZKG6PpkCQztChATSCX8N7G6h3sIf3X
	L15hftjzEejwcDZ3krYgBfyZqO/U+YTUYlpAEXn4WetcNHBJdN2i/6BqTjdIaD5L
	vFVtA47qs5lQNPdu8TKznCeofD9EGu4t7llEqUifCRuA384JqXbrqmHiAn6DdsDr
	RG4Km/z/dkSgvKgyQo4MjyCKJg/1VNJ3tBFfecPaX01IT+/z0Xbr+IFUfZJV4jzb
	X37mfg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t9s03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:35:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74299055c3dso7015125b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748936125; x=1749540925;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FecECnu2NheaNqiJX/ORSRrplhA+quPcAjrXUQL/gTk=;
        b=eMf1FyPaia5CxxzCABMaGdtsySBGC2stfoRrktw6y5MCzHyq6hXQ4XGlAmnPt3u2B6
         zjyXxWNTeU/GyZuZylKHu0PdkrqHjXu0raAIELXp5wgy1OK4He/o3Y0zaGFvcwp7EwUg
         O1sy7S8yNt+U9KV00dWoBamOPIcArT4Ifao5FqiVh1J1XDlRSWWaVNRgN0209ck1GeKW
         tQF9HCnS8oJU0L3zO8Qe9vc5ggd7IaHp8ohheqDsNLsaR10FmTrWvTPY5QjfZ/5I27UT
         YjG52G58WlMueAgM7f1gXZpy/Kjb7zs/y1EHh31UWpaEdUaPsaffJ/7tR3xbj+3eIhi/
         nIIA==
X-Forwarded-Encrypted: i=1; AJvYcCX3ztmvVQ2qwFD/yOxDZpki0Q0GoHgJG6FlazFScQYKp0TDLpApaUHDUO7jdBLaGmUysosqJj5BBu+T46k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwthDk01X1PBXxTSbMLJYPukoX/wW857PU7LB479JMoSMYHePD/
	RCdERC1VLhbCcrG7/kYI98GsJIeOFt/eftGWuA1AFQVQFlwoAGJ3OGI+WZ1cJ5cNoGzNrySMygJ
	Bu+GG3CuUM8/fWziE60Pc1UDqkkkaqfDUw2S4bGl17UZnTtCgi2+DhmIVmZTOgY2W+Ks=
X-Gm-Gg: ASbGncuc7yk20PnnEy5V7vAHKWNCgTL1SbEsqXg06RHiHOowDSqS+UG3zd60hCjkMkl
	gm9vcjTVLOo8TC5y7oF3B070+h14FHSd7OuTFZZAcsuN1vHPYzdT7n0ZfQ+6VjHYFBQakqcvHfi
	IBJBaWbOpQWfwsZe3fjf7ADsFHrAeGQOfRZ5Z4SedDxdwQWtEf+e2MJn3xMD52DjI2Ag43mOJBc
	LCPj+Nzu4F0TWXdGJVUMbwJ4b97zfByK5OIdkrdgeWzNjOVz0Z6Pa4LqvhN4SLNax/8dEAlTNhR
	2FEwTEHoQpux6JklgnN161BKzr3/iJYl8i6rcmeOVw==
X-Received: by 2002:a05:6a20:2589:b0:1f5:8b9b:ab54 with SMTP id adf61e73a8af0-21ad95818b7mr27385841637.23.1748936125209;
        Tue, 03 Jun 2025 00:35:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbrLjN/LK2D8S83yJequqnD62klgE0P1XAXLcbq1Q+J2LZWaSZQvhy+vzl67jRzKVjcPVj7w==
X-Received: by 2002:a05:6a20:2589:b0:1f5:8b9b:ab54 with SMTP id adf61e73a8af0-21ad95818b7mr27385809637.23.1748936124761;
        Tue, 03 Jun 2025 00:35:24 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb6b5csm6627188a12.72.2025.06.03.00.35.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 00:35:24 -0700 (PDT)
Message-ID: <fb1cee63-ec97-d5c7-7a9b-bda503a91875@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 13:05:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 3/3] arm64: qcom: sc7280: Move phy, perst to root port
 node
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com
References: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
 <20250419-perst-v3-3-1afec3c4ea62@oss.qualcomm.com>
 <r4mtndc6tww6eqfumensnsrnk6j6dw5nljgmiz2azzg2evuoy6@hog3twb22euq>
 <0e1d8b8e-9dd3-a377-d7e0-93ec77cf397f@oss.qualcomm.com>
 <pb7rsvlslvyqlheyhwwjgje6iiolgkj6cqfsi6jmvetritc7lr@jxndd5rfzbfy>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <pb7rsvlslvyqlheyhwwjgje6iiolgkj6cqfsi6jmvetritc7lr@jxndd5rfzbfy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA2NSBTYWx0ZWRfX9fE+cI922+HL
 86M4Ud54izKr7BjBy5LA6zqTxfOis3RntjAYQWncspRSrqKlLVYFXAxWBQm0v+D3/NtabiPQg6b
 hBTzctOqOHPb3Jl89JoLurSKg8L/OzNRmzPeUDc8oXBHK4Yp+6h8sgidtw/KKFBYcswb/7JMJtT
 tCKbLAheJOeq317831v1/Ah7/mxPQIVtQ4cf+hseqgA/3DGsLVm5WKbTO1NvrOwUjIXD0baicPL
 nsXD6N5fVIhvY2wr6r7wCTO/JQFTbkdi+shiGQ9AFwRTj93t25ocYqsY/6knv2HslnqCsY/0FDI
 12GaOohCxjFvvMPv31cbvIqKLGh5mwfv6uD+rNlXtf+YcJNyk6EXdkhswD8+uItvTLMpfiWmjmh
 QAsU3JihLOcPOrXcusLFY0mwcVcVNaomZqG8EL4NJ5rgOSAI+5TOkCqdOhY9mRiRXsAh8fMo
X-Proofpoint-ORIG-GUID: kuaDiDsrreQhjXvOPp4LvmukAVlC_NY9
X-Authority-Analysis: v=2.4 cv=OuxPyz/t c=1 sm=1 tr=0 ts=683ea5be cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gzpaoVQaGCppcG2blusA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: kuaDiDsrreQhjXvOPp4LvmukAVlC_NY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030065



On 6/3/2025 12:22 PM, Manivannan Sadhasivam wrote:
> On Tue, Jun 03, 2025 at 12:03:01PM +0530, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 6/1/2025 12:35 PM, Manivannan Sadhasivam wrote:
>>> On Sat, Apr 19, 2025 at 10:49:26AM +0530, Krishna Chaitanya Chundru wrote:
>>>> There are many places we agreed to move the wake and perst gpio's
>>>> and phy etc to the pcie root port node instead of bridge node[1].
>>>
>>> Same comment as binding patch applies here.
>>>
>>>>
>>>> So move the phy, phy-names, wake-gpio's in the root port.
>>>
>>> You are not moving any 'wake-gpios' property.
>>>
>> ack I will remove it.
>>>> There is already reset-gpio defined for PERST# in pci-bus-common.yaml,
>>>> start using that property instead of perst-gpio.
>>>>
>>>> [1] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts   | 5 ++++-
>>>>    arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 ++++-
>>>>    arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       | 5 ++++-
>>>>    arch/arm64/boot/dts/qcom/sc7280.dtsi           | 6 ++----
>>>>    4 files changed, 14 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>> index 7a36c90ad4ec8b52f30b22b1621404857d6ef336..3dd58986ad5da0f898537a51715bb5d0fecbe100 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>> @@ -709,8 +709,11 @@ &mdss_edp_phy {
>>>>    	status = "okay";
>>>>    };
>>>> +&pcie1_port0 {
>>>> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>>>> +};
>>>> +
>>>>    &pcie1 {
>>>> -	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>>>>    	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
>>>>    	pinctrl-names = "default";
>>>
>>> What about the pinctrl properties? They should also be moved.
>>>
>> pinctrl can still reside in the host bridge node, which has
>> all the gpio's for all the root ports. If we move them to the
>> root ports we need to explicitly apply pinctrl settings as these
>> not tied with the driver yet.
>>
> 
> If the DT node is associated with a device, then the driver core should bind the
> pinctrl pins and configure them. Is that not happening here?
The root node will not be associated with the driver until enumeration,
the controller drivers needs these to be configured before enumeration.

- Krishna Chaitanya.
> 
> - Mani
> 
