Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D7420458A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286624; cv=none; b=V0n0ui2yVqNmHYC4w2SLgG+8mhS0r8J5frm+DB4nKYEuNjnZTt4ZJfQcOaJjLSXbx4fM5YadcMBnyYIMHMquYuROEkeJb2izPM8/Mmj3yDbS5Zeh7MN9mmAjGmeV2Pe6OI06r5Gn7lIwvmprFfcOxLjmysn3nFUMIwr7Tb1vIxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286624; c=relaxed/simple;
	bh=3f1Py/orZHfiSTe0C6MP8gxhoceXINqIBaCHjb7/zSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=byrk9T1KBisn8AuhSVp5wvhafn9jymVYk7CDtXj6gEHA0KFdKbdmWjlSMmUdfrKvJm67yreZGwRZgfNo+hqsCs44MVnAlaitjmDMErGCLj5dQo5l13b20ZacROUbEKNq7YyAiPvXLfmp718lZkPUPRz3imE2KjNDiTbZ7aqxuxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNrukPs/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNrukPs/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DKo9008527
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dWxWYq2K7GOUCuWuG1yENQqxzaE0+54jEHV+QMm2Os=; b=BNrukPs/nNJ0qaHS
	LWTu6LjgvbZFBSLNC+oAhIPnl4Us9Elul9jdAnKMZFFftOO8B1obXtZVxfvO7MWt
	shjEpSEADQTPkOSUhhPFsDln/dstCoJv+fn/SCyOWkk+mqZRZPfUxaduo6El6Onp
	PujuZ5mZtOb3wgl6JOnwoMg3F20KBzIzIvOKEU31qhTzUpXpkuXnn0mo+JSk3uo2
	+optlSS+dEXRhNKnoLnzfmU/XAMOkGRgk4JKMcyIbBRMPUzxegd7TNDi0wRzIbWM
	Cu73+s1G02hJSxfvTxdoaPFITrFBdp3D2lN8HLg+N/zSQ2yfYWbQIlJ8EQMwnv1Z
	LouDFQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmsd9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:30:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7489ac848f3so3749520b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751286621; x=1751891421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dWxWYq2K7GOUCuWuG1yENQqxzaE0+54jEHV+QMm2Os=;
        b=Hnp/A27UlHGfUe8cmfJ0Efk5TOzbGZRaJsnD4l1h14OaDcjh4nmm2i21LNH9ApSdae
         VbKM16rw41pMamCFiI8VEZ94AoRQvrQAFCW8QP5fmLuUq5ZRIZg6V94b/Q1erV3EXy0e
         1M8V7RrITH018BEkBj8ene/gT/8VbNgq/dJdcsQgl5VWFgblS9ryZWXRYzhwHZDqei9Y
         7dMbRW+XvqmfbZQ7soSAbpDkoS00Nx9fxfS24wjip6hMRJdYmRoIq10kl8zM6DnkKEha
         bMQnUD/rACGohoUxCbFlgtSo3nVPQejbJ8fGkaPMGxY+7kAtpNl4E2cZp9qj+1t6st1a
         2neA==
X-Forwarded-Encrypted: i=1; AJvYcCVJPzR36PdtjUnxsLn6fXDw+Z4qznqh36JGFvOcQHNDNF3KOZy39pKZQa/nMwBCUGPIJ8+EXQMCxsY8XuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3D/yr3yBjGVhHNgplaly9p5VMlDbpsLF/NXC8XLUl7d0McMJ
	qgrQ5Dql6jY8opzecrK026rOEcxCd9pGD+7G0SqXEu7AGktgIH/PhGasFU3PjJC9VYdOwFOcakT
	oWpKX6PaRUt3G7dIX6i9lH3l/o3ENNRSdmUC/lxwlREbx/w88XnfWUUjq0IRG4f9xkvs=
X-Gm-Gg: ASbGncsPSDlcni4p0VAt8KaNh5ORBkJ1B9YB+gvA55XPuu/J3f1ZdDlEE4qAwZwlTBb
	R1DpCe5If1zRrjVadAv9dGKTdEoOek/WsEiVz4IesZV8uzdtlHUDNS3fNMXdHVXghzPo3SJM/n/
	9TxLNC2QYG2ufKP+6SmOUQTUoMdy7OUcOuLUroKPh3mQ1/nDOLW5FdzalvFqCdUkPe1v78V+r2A
	ZUOugceHhGNo3nbQyH6UFK2mXtu4K9LLeTUSD1AkvXo5VlgHCh5FbnCW+jQP3PXhqM1qFXgGVQI
	PG4GBXhK+OlwqBeEUjRMPSimfpXv7CDQ+DRfNBLYlep9nMkHjntt
X-Received: by 2002:a05:6a00:1988:b0:748:f365:bedd with SMTP id d2e1a72fcca58-74af6f4d4bcmr17197282b3a.17.1751286620556;
        Mon, 30 Jun 2025 05:30:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkaFNPxqWvP2slDuEpYtj3r5EnhD15Tr2DIQp6ChiI+aHrargB99nmYkj5G7fm4yQY9LxhLg==
X-Received: by 2002:a05:6a00:1988:b0:748:f365:bedd with SMTP id d2e1a72fcca58-74af6f4d4bcmr17197201b3a.17.1751286619834;
        Mon, 30 Jun 2025 05:30:19 -0700 (PDT)
Received: from [10.92.200.128] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55c6a3asm8487704b3a.118.2025.06.30.05.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:30:19 -0700 (PDT)
Message-ID: <4bae822e-e7bd-461f-99cc-866771c0b954@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 18:00:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] PCI: qcom: Move PERST# GPIO & phy retrieval from
 controller to PCIe bridge node
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250605-perst-v4-0-efe8a0905c27@oss.qualcomm.com>
 <y3umoz5yuofaoloseapugjbebcgkefanqzggdjd5svq5dkchnb@rkbjfpiiveng>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <y3umoz5yuofaoloseapugjbebcgkefanqzggdjd5svq5dkchnb@rkbjfpiiveng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Q4Mz73Wq7u7uc3D6QA-UEVyWbeSW3KzA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEwMiBTYWx0ZWRfX4oExg6Mc6Iep
 eiME5phijGI10CH8iy0rrGgPhtODlQflAowVAu1AXBastqV/4cA4bskMlVykqd4/h/F08hMfU5r
 YnV34DXV+7ISTguRmvRuW1jboyCxLyWdY1UX3wTg6uUgVS1TMEjXgfiJDXLl77cJZlljI09Xfge
 49aeBiPrQg5s3kmWjvqWXAl44TnWPLxGDor3l6PZ3Ox9ZeLj9jvkM1IJqgYS2mGRItMBiA8QHER
 Yrz3mCPoWN9mJn2P5aSgW5AE5ayW1oUSPT+Me6u4cIL4mdaow/lW+QrzQI/hsJ3Lnhi5CEeoe+7
 vL08cNT5jWd7AlSc1F/uMVa8ic3KFOpUYsKyh4nNJMn+YuqEO61IkzEDDKNU4W8IIG4JAjNtSat
 X13FzS47zPQYdp6+g7HGaeSQBmx0qKF2uYImk9wdpkXv9vvDVFfQb7th6nCUu7u07TXxmKLL
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6862835e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qGq9QQooCmLM_m6diiQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Q4Mz73Wq7u7uc3D6QA-UEVyWbeSW3KzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300102



On 6/23/2025 4:37 PM, Manivannan Sadhasivam wrote:
> On Thu, Jun 05, 2025 at 02:00:36PM +0530, Krishna Chaitanya Chundru wrote:
>> The main intention of this series is to move wake# to the root port node.
>> After this series we will come up with a patch which registers for wake IRQ
>> from the pcieport driver. The wake IRQ is needed for the endpoint to wakeup
>> the host from D3cold. The driver change for wake IRQ is posted here[1].
>>
>> There are many places we agreed to move the wake and perst gpio's
>> and phy etc to the pcie root port node instead of bridge node[2] as the
>> these properties are root port specific and does not belongs to
>> bridge node.
>>
>> So move the phy, phy-names, wake-gpio's in the root port.
>> There is already reset-gpio defined for PERST# in pci-bus-common.yaml,
>> start using that property instead of perst-gpio.
>>
>> For backward compatibility, don't remove any existing properties in the
>> bridge node.
>>
>> There are some other properties like num-lanes, max-link-speed which
>> needs to be moved to the root port nodes, but in this series we are
>> excluding them for now as this requires more changes in dwc layer and
>> can complicate the things.
>>
>> Once this series gets merged all other platforms also will be updated
>> to use this new way.
>>
>> Note:- The driver change needs to be merged first before dts changes.
>> Krzysztof Wilczyński or Mani can you provide the immutable branch with
>> these PCIe changes.
>>
> 
> You've dropped the DTS changes in this revision. So the above comment is stale.
> 
>> [1] https://lore.kernel.org/all/20250401-wake_irq_support-v1-0-d2e22f4a0efd@oss.qualcomm.com/
>> [2] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/
>>
> 
> I don't have a device to test this series right now. So could you please test
> this series with the legacy binding and make sure it is not breaking?
> 
> Once you confirm, I'll merge this series.
> 
I have verified with legacy binding with this change and it is working fine.

- Krishna Chaitanya.
> - Mani
> 
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>> Changes in v4:
>> - Removed dts patch as Mani suggested to merge driver and dt-binding
>>    patch in this release and have dts changes in the next release.
>> - Remove wake property from as this will be addressed in
>>    pci-bus-common.yaml (Mani)
>> - Did couple of nits in the comments, function names code etc (Mani).
>> - Link to v3: https://lore.kernel.org/r/20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com
>>
>> Changes in v3:
>> - Make old properties as deprecated, update commit message (Dmitry)
>> - Add helper functions wherever both multiport and legacy methods are used. (Mani)
>> - Link to v2: https://lore.kernel.org/r/20250414-perst-v2-0-89247746d755@oss.qualcomm.com
>>
>> Changes in v2:
>> - Remove phy-names property and change the driver, dtsi accordingly (Rob)
>> - Link to v1: https://lore.kernel.org/r/20250322-perst-v1-0-e5e4da74a204@oss.qualcomm.com
>>
>> ---
>> Krishna Chaitanya Chundru (2):
>>        dt-bindings: PCI: qcom: Move phy & reset gpio's to root port
>>        PCI: qcom: Add support for multi-root port
>>
>>   .../devicetree/bindings/pci/qcom,pcie-common.yaml  |  32 +++-
>>   .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml  |  16 +-
>>   drivers/pci/controller/dwc/pcie-qcom.c             | 177 +++++++++++++++++----
>>   3 files changed, 192 insertions(+), 33 deletions(-)
>> ---
>> base-commit: ec7714e4947909190ffb3041a03311a975350fe0
>> change-id: 20250101-perst-cb885b5a6129
>>
>> Best regards,
>> -- 
>> krishnachaitanya-linux <krishna.chundru@oss.qualcomm.com>
>>
> 
