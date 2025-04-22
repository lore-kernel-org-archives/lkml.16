Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82098264A9D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745354757; cv=none; b=ueQ3TcY7AsRpkyy9ikxUhJK7M3mn8TftbSrw8S1lm/kyuBvJdi0WwkDwz7jQMMwCqc2KZm9gXpXb/vgwmvInPdcMN0Brh/pMJiMYu68zq2YTylyXvW8mZbEsPF5mqXR858OQ4wHPIRwXkSGT5eZDPFrvvNFZX9+HnfAhjZJ+u0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745354757; c=relaxed/simple;
	bh=T8MBUVCWxYofTrKp4GRcnmCtd9t0xV55BNUyuCp6fVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hujDAW/F1UO+ORGHCPYxRB+zm3RGRu6DLodg95mvrof4qjAn5ZeSPXGbS64hahqFnLgRR7+0qwIqRRIjENd0N4SdPf73jFddMwxnZT9t4lzBjXB0rirtSuhN/1AwdF6s7KaHGz27U5P9nnrdUSMPMl4hPX+Xhzs0hV78FmE26l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0fw7DBu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0fw7DBu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MI72m3022335
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qe1AqUfBNNSz2We8dhDKc49BliCl8BOCKYFYp/kgBg8=; b=O0fw7DBuJnfEFTnJ
	doKyeUJQmi49b4Mqt75zHKsEGvJz82mtOsWCgUUxG78rmII4YRUWcJ4gQnmAEJDy
	zxMLNpP25vEBpewt5Fx+vNdvt3kGgrKlhGf/x9nTkMKDx7pCnvvRYBDVkDpB78Te
	FH/3XL2U6B8lmKf6EA3FX7gQq1i+j4S3NwqQcg36uWuJcjgh3sttd5XSnEEdZG/u
	SdkiVSovdrKooOQc9+IOdSyxgy9yRMibXmrup+HrckobA6U5LUVi538qAMAus56t
	PJ10gy/hZihw9nu/MhlBq7nGdJ/SxYJ7t9bvEigrnMbBvLF4ODsjlsyIP+uA01ZE
	19Sbsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4641hhs63r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:45:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54788bdf7so21141185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745354753; x=1745959553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qe1AqUfBNNSz2We8dhDKc49BliCl8BOCKYFYp/kgBg8=;
        b=akAqMororeF0SSxKR5t6vgSWeL+krxORU7oFhZVYoM5Dm2r0KnmuqQnirqBaXEDoid
         Iext842+Xe0KssnydHlzAy965YWjD41RflBY01163tG8+XzwsoOmMQQZRo3qi3EZ4zf6
         fOt6uL81Bv1ggnBF9tTBRrTZ/XmK6inQNdyCg2jokRV4wp8OWr2QeB6X4WpK6xkZnPqs
         SdCLTyvZZe4J3gjW3W4dI4P/2kcs2mFtL9KuccRq+ZhL9R79Wl1Rj+pIU7LpLaQ4aJ7j
         yrWDhJ7HqJT2brO4bbxm1WdJU93FSxhrUMteJ4EBhMw3uCZvfVGbVg1Q+kk3ugoYb38o
         Cxwg==
X-Forwarded-Encrypted: i=1; AJvYcCV+ZCQ6HrqiVKLRnWQ+CqKmKlV7L1nBLfC6d3N1c8hY2ihncpLsfdWwNsmcGwBR1RZaXkjpoea45vdhKrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXh55YmC/V1buTv8HlLIXnN1mNh1Qs3l2lYw0WtYPQJg3vPeQl
	U0U4bV2LKUrwK6AljH5GNUrILhpoUIHVeHYEw0/v/CJdEQXeH+v0O6VXY9nlUSbozekffyBzJ+J
	Ckjnk7A1suf/1xDHRVOh56lx3nfCSDSvGR3zZKIQeTNP5hUaqjjhSA8MdWXIUE2I=
X-Gm-Gg: ASbGncsa5NzILQ1KJ+CKAv8dLk5ygXS99MJeTNwSqghDNwi8YrPoTvMARyVKif8jYJ9
	9RMspfFzRHFh4ebwBsiITQeWWK71AkuDuSOAnKg613MOGlHVpLcbRRDzWTFu+R8rRUm6u1mB658
	n92tuHWxRRNOS+zN1RWSqTJrp47oLarOhCwQIL/HHDSOoUXpPc7kT+JBXIN0A7BQf7OACBvjXAP
	quRBU7y/8U6KmMRFRVwcE2bLULn0YGAG+5TofY8ZSIC325DzGdamL/k0nlVOklKml1almYdxjKE
	BXuvZar6AZTbBk5eAAAz9skioKiNfTEYX5lhzP03ECDxO8dNBuUBW1e/hdWez0O4FIY=
X-Received: by 2002:a05:620a:2584:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7c94d234d2bmr49139285a.3.1745354753276;
        Tue, 22 Apr 2025 13:45:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzE1JLopbHa8TgCguglBA6+yMgoTOr4plS4X95RX42YJC/ZKWJV+SYHIWUESjwqyFN1LJYVA==
X-Received: by 2002:a05:620a:2584:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7c94d234d2bmr49137685a.3.1745354752949;
        Tue, 22 Apr 2025 13:45:52 -0700 (PDT)
Received: from [192.168.65.141] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefd8e3sm704214066b.98.2025.04.22.13.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 13:45:52 -0700 (PDT)
Message-ID: <9be69535-08dd-4d60-b007-e9c50e706a58@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 22:45:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] PCI: qcom: Add support for multi-root port
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250419-perst-v3-2-1afec3c4ea62@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fe43xI+6 c=1 sm=1 tr=0 ts=68080002 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=UglFlXkU1CO26sHhVHIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7ROr9gpNu6gT-wyzaniQwaypp6zkj4aR
X-Proofpoint-ORIG-GUID: 7ROr9gpNu6gT-wyzaniQwaypp6zkj4aR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_10,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220156

On 4/19/25 7:19 AM, Krishna Chaitanya Chundru wrote:
> Move phy, perst handling to root port and provide a way to have multi-port
> logic.
> 
> Currently, qcom controllers only support single port, and all properties
> are present in the controller node itself. This is incorrect, as
> properties like phy, perst, wake, etc. can vary per port and should be
> present in the root port node.
> 
> To maintain DT backwards compatibility, fallback to the legacy method of
> parsing the controller node if the port parsing fails.
> 
> pci-bus-common.yaml uses reset-gpios property for representing PERST, use
> same property instead of perst-gpios.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> -static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
> +static void qcom_perst_assert_deassert(struct qcom_pcie *pcie, bool assert)
>  {
> -	gpiod_set_value_cansleep(pcie->reset, 1);
> +	struct qcom_pcie_port *port, *tmp;
> +	int val = assert ? 1 : 0;

assert is already a boolean - are some checkers complaining?

[...]

> +	/*
> +	 * In the case of failure in parsing the port nodes, fallback to the
> +	 * legacy method of parsing the controller node. This is to maintain DT
> +	 * backwards compatibility.

It'd be simpler to call qcom_pcie_parse_port on the PCIe controller's
OF node, removing the need for the if-else-s throughout the patch

Konrad


