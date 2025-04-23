Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42E2263F5E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745377868; cv=none; b=GVkIPENLz8U1u2MGSPEUI+vwi4u3WyTPILXrqKtfjd0Updkq0/yGTE9SsphycRhod9/wAskq3taxaudgfYqk3HRaE//daJnAcw8f4IDdblBVI0/9qkgZ5taVkqZipXuuhcOuc1RyP3yKwvVOnWJFTbgyN7szXl77ZoPl6XBUesM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745377868; c=relaxed/simple;
	bh=gNDyOiqvvJnSJH9LoREom7MMlXsJ1YgY/lC4EhEpN/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXUZ8S1lFGPu7ZiCywg69qiVfTe+WLC/B+b92CQ/61YSC3WUseiihQt4eQYeXCsxUEJHWNfMhaCiVl9ewikN9jSIuyc4HwBgpIP/tt+6vBhlmhpyYEWoxlG71APVZhLm3+PXLHIs1grUSAiGwA/XW5ih42bkXm5qxP7Mwva7JsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=McQeihew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="McQeihew"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i98O016163
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUzM1IQQBSoW4Yzoz+0un0e1UZB9NVH9M6aYGCfVdkg=; b=McQeihewsgL9ZGYk
	hvNAa1i78p6iRXk7f/FwnMreYxzUpj2qVSssrdqA1h7coGU1vlzvd8D6F7fIqDM7
	ex9WWgUPu0swBXETxRZk8fk5Q6NFopc8beq7y+OuJ7NWj269NrhcGAMa46iVGz6z
	c0NGDdV/uFtmAeHvIV9TnIhYYgfuYIVPN8Veu4b2YVumjfwRWS8R4x0tfB++U4fb
	3T3Vx/eTaZPVahcSAfm9qcWgPpxX7FXc15dNKGQCVX8W0vBhtFccBh3y1znBfoWt
	fxz2g+Qc/gzWWVhPUe+6JJf819aLdBiGQW7Z09pU/zGfvkMPtF4C5kQG1X0soIoE
	752Q4w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3gp5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:11:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b00aa1f50d1so3437981a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745377864; x=1745982664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AUzM1IQQBSoW4Yzoz+0un0e1UZB9NVH9M6aYGCfVdkg=;
        b=jKv9NvrafsThHzNV3zy+DJENKQHHA5I4HTPSfQx84ynM29KWq1wpCNdxqoOspeJ/ht
         6KgAWJ0oDhf9tMY/OxKxgUfRIX9IZz+DVogWi8CFAsyyM7WNUywO/R0beMOLHn3tYlat
         ON6RXSyoRPTcRPVlI39W15qr1FzDup69Xz73VTyrgqPa4SInz1BUTgB8dZpWh2eaRbjP
         bC7qjeDOGlakVCJ9943sqzSLhAJMpzAN2fxk268K7lk9Trli8youMcxYGRteCG342mSV
         iMdwRIyoJayZdCpasGqdJ+l1to7xGTilBk6vCoqTcqYzMw/rENj101lqCUF3tc4a6xMG
         0IJg==
X-Forwarded-Encrypted: i=1; AJvYcCXJLKQWu5TvaD2UzB4J97sijgAxqd+rToT80tQtdLpx9uxu/6EaWLuIWQFnXN7yLRtEDixOVFHEd2BOYUA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5oFovK7N+tlEk2/bWK7Iha9BVDmnKb/I4vUyejQDfw2mpVYaL
	77lMx0jn6FBIlsCPVw9QH7iEs4J2Vo4G31B4uB8zL4C8CaROuEgJM3oVdp+RLdpSXb05nLDlzcD
	64lBXJBNTJ2hQsP4hJm8SBrrnRXBejU1RloFsxb0PgyqxHk8XaQ2XKRAkiSeA1TY=
X-Gm-Gg: ASbGncvxaePe6Luf5qV8uAeh5mj4FaEVPrMm/jHKMSAxyZBUOyPuk8pP6PNHEf2y3rc
	WC1NPkxolJsmNtaROVSy3cEkoZRHDQYbJgXS/IqRGt6qEgqa1OfclOfDiyC7R91PgRtOxoa3Gx2
	9K5lJZYUIvl3B90tDqPC8TCEzOCuwYfMJwlSroDjlnKSyu+PNTqnpehxulTnid7HPo3vBnAk9Lj
	xLDpTJyQSW9jXq0quVfzZpM6UWTQ12BEY25x1ueksJvlbcqJ0rM640LW8XRTkEUG2/9zhMdCdSs
	3Q0U1x3/Sbs4UsTp3vfbOUsn2T371/JPNaEB6dhLGg==
X-Received: by 2002:a17:90b:280b:b0:2fe:b470:dde4 with SMTP id 98e67ed59e1d1-3087bb48e31mr33085529a91.12.1745377863744;
        Tue, 22 Apr 2025 20:11:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqND8/PeqFUb5GQNFXy8yeKg5wopuUfA3/3IcqnNMYrM8oX9zPImajp1J92zZXyURB0FbG8w==
X-Received: by 2002:a17:90b:280b:b0:2fe:b470:dde4 with SMTP id 98e67ed59e1d1-3087bb48e31mr33085475a91.12.1745377863263;
        Tue, 22 Apr 2025 20:11:03 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb448esm93082285ad.152.2025.04.22.20.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 20:11:02 -0700 (PDT)
Message-ID: <347a7348-664f-3636-604e-8dc6429691b9@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 08:40:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/3] PCI: qcom: Add support for multi-root port
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
 <20250419-perst-v3-2-1afec3c4ea62@oss.qualcomm.com>
 <9be69535-08dd-4d60-b007-e9c50e706a58@oss.qualcomm.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <9be69535-08dd-4d60-b007-e9c50e706a58@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3IuEwJ0VrnSmZDz462kxc48H_CzKeirn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAxOSBTYWx0ZWRfX7WKcIVIxNwwP mV3V86PIlUlfYqDq0mw1po9c+HGdpijJE835rMUO/AwvAkUE/DLio/pzSbiZiFNvLRjibi0eGN5 vjnH2SsCMPslcOMHwLAb4TJgzGt6rlZgJ9UN938ibhJsTHlnoo/j1Jh7/VVpsbrwkJeUXPdsp12
 fb7ZWw6SMjdWJMB5SDi1EWffT2SMk4crUZ4bAfDDxCOKnhBDK/MRMlkOwcz5emkww3Qmp3dZlJF M6xYBKIpmoViwB+eqCQ2Fh4GH1ZB8RJmMZQo96Xm+OCOpwX9ma8Giyt4MXpzPCN9esn0g0xK9QZ hKov5BALfBp4/fz1yMLSvYHuseONkN4AXMnekv24fmGOqJM8O4FdctqDSR8Izmd1DVl6WMCrCy2
 8azGXdVqFBKHeW88lUssbUdTGJXVsrSrOqao1v7/CmWGEABG3GKMCBL88Da/ktmGk3Ib/k7t
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=68085a49 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=1RYYy9rr-L5vwPXD2fUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 3IuEwJ0VrnSmZDz462kxc48H_CzKeirn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_01,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230019



On 4/23/2025 2:15 AM, Konrad Dybcio wrote:
> On 4/19/25 7:19 AM, Krishna Chaitanya Chundru wrote:
>> Move phy, perst handling to root port and provide a way to have multi-port
>> logic.
>>
>> Currently, qcom controllers only support single port, and all properties
>> are present in the controller node itself. This is incorrect, as
>> properties like phy, perst, wake, etc. can vary per port and should be
>> present in the root port node.
>>
>> To maintain DT backwards compatibility, fallback to the legacy method of
>> parsing the controller node if the port parsing fails.
>>
>> pci-bus-common.yaml uses reset-gpios property for representing PERST, use
>> same property instead of perst-gpios.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
>> +static void qcom_perst_assert_deassert(struct qcom_pcie *pcie, bool assert)
>>   {
>> -	gpiod_set_value_cansleep(pcie->reset, 1);
>> +	struct qcom_pcie_port *port, *tmp;
>> +	int val = assert ? 1 : 0;
> 
> assert is already a boolean - are some checkers complaining?
Ack, I will remove this in next patch.
> 
> [...]
> 
>> +	/*
>> +	 * In the case of failure in parsing the port nodes, fallback to the
>> +	 * legacy method of parsing the controller node. This is to maintain DT
>> +	 * backwards compatibility.
> 
> It'd be simpler to call qcom_pcie_parse_port on the PCIe controller's
> OF node, removing the need for the if-else-s throughout the patch
> 
There is difference in perst property name for controller's OF node and
the root port OF node. controller use perst-gpios, where as the root
port node uses the pci-bus-common.yaml defined way of perst i.e
reset-gpios.

It's better to have this way then having if else condition in the
qcom_pcie_parse_port.

- Krishna Chaitanya.
> Konrad
> 
> 
