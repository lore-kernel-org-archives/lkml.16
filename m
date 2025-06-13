Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE10F22B59D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843608; cv=none; b=p5li0YUjGBbzFl2hMkj1zBxaMyg3ArtGEG8NQUOqhhQ+/wYFgP7lKT09cpnxIAkF+iyHeEhgEdei/DsgL+fwUnjUl5h6ft2o2mr9V3YyVg3el84uLIKUdFp1IZ3+np3G+L0f8kc7rgb0PPQmDUXq+pCusIIbVzKbqpNA8cxEmVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843608; c=relaxed/simple;
	bh=0FggUIMfD6zhHJPNYJP/gAqlqm6i2zejkUvF1/Hoog0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=diew3OPaUyVXMfH1dVMQbb8r5yWTBwgZpp6qhaF7CgvrQ7YVv2eWYZOIqIlz4ww6seu4aQpiZtlfzB6C/Q/ew45jMtsrDqqhkiWyTUKsyW6Pt6q5xANwPcTYxb+j1O1pfXh1kKXOIWsfzYdrCtnI1vW6HfsfCoF7y/8wAnMMI/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIXJrtQ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIXJrtQ5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DGxdUI008328
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rB0ONGeaUdElMIKUrVqxP8Fee1xezETZ53jbZgh2Jj0=; b=IIXJrtQ5+mmQwAmy
	cF2/6Dy7C/wk+xc+IxRNnNefck2g/qXK09m80AxfeZO05wGmKlgIbzwg+SQ7NfbV
	tmtuXglRQ/T+9JTxsI9jOPmhEzQAluPzGN/sysJwqYlpEh0prKM2JtWBAhLMUWUD
	ppL3kJiyqDwvGzdF+mpR38T3q84oxShLm3ektz7l3VPNjdKbue5n2m+iNwVse013
	SJLKfObUOV9n/Owm1HWqvpjlx3YReH1tiIjv4Ly05BSx1rEw/8zysa2PpQW5bNKo
	LaBIH3YeljBJmodSNowehF70qXEicDBLDPmdKqrh+Ak9LmR60SCcupuAB/H3jf/J
	B7eIJg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcvd2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:40:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6facbe71504so6417236d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843605; x=1750448405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rB0ONGeaUdElMIKUrVqxP8Fee1xezETZ53jbZgh2Jj0=;
        b=MXBDVogmvc21E6yZee7gZv0pBQJFLvD9uJRc4C2hjOJtlfwJHm91RX2Bvv9ful0PLH
         ccvVTnEcnz0JoIUUp7VWna0lTwOCh+bpMl+GLVERe0zWHm/IZhBjNVt3Xno2Dg6EwqIm
         +gb1zVzymMFxMx2EwIEk49dOY2uMxXK501Y15+89bQDsm3naGQX4ZcKosLZBIWhnjVww
         iv7ZEJlSi8La5XT/43RZLtBZP6N/mCDFnxOoYp+ioS77E7RWzgveA6xT+zn7hzlTpyi1
         arWuVxRBSiH5P5Oq97R20/8mrozmZDDqOUF1gweaTSR6cFPQQBdsEIU1FRAbnrFotb1j
         WO6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeo/Y3uPO6VFjvrb5mQkhVCB/ANKWWBBIc8l4pIQwtGesaemB4dTRU5qeRy0htWNbX+yEP500bstnQMPU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd0OMZrga45+KrQBvQyygfm50oIa+DgNNRHX/KG9vB9CkjvU/y
	QXSJzFYba3FoJj4RvJj0f1ojS/S4egBgnuST705AQKXU2MchNn3J6occ0u8+pKpUDvWIkin2X/7
	/c3IZhHnDES2EMtqLY6XBBqpXJS8LkxwQ2YEPnUFOKD4QMBc4pbuNRyy8zY7ecHB4PNqG6Zf4s0
	I=
X-Gm-Gg: ASbGncv8DpjuBk5QWpBBorNgP8Rm/m2slYxyIljNMpibqm+FATG1jtgk5Lcs3CJkdzU
	ZH5fov11g1feZTJrldqlMVZ8b15kV7vl7PkbLjSaCTbReTpMpnrGTJIFD8/9hxdNbMHyRqHxXtU
	IbVKdonC7btaF3Jn3Bh2Lubu9IWkg70M06aTeNyxaAL+WJyW6GaOOqJXwKkJsaOGRKlRvT6AGoR
	xx+bl1RJ0EVe5d7N8cECTIyA7cdMnKVIqXqevVRsEDnvsiRooIrKDT7Kd79r2Psbv1iKF1MDHwU
	LP+xwKqxMUxNcJ0XKj978yl4973CIqi9UD3YXcvuP8Zz/UbWjuBq9jvk3gL+nQ2Pa2HvzcYrhlc
	QicA=
X-Received: by 2002:a05:6214:3d87:b0:6fa:be81:e18f with SMTP id 6a1803df08f44-6fb4725df27mr4267826d6.0.1749843604752;
        Fri, 13 Jun 2025 12:40:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlFqdrqF6v4tHYFVXi25gMIXToBhV8BbZ/c3hebkdS0kDw+l+EcZGQ9hHh0Jo075/pj3qaUg==
X-Received: by 2002:a05:6214:3d87:b0:6fa:be81:e18f with SMTP id 6a1803df08f44-6fb4725df27mr4267636d6.0.1749843604337;
        Fri, 13 Jun 2025 12:40:04 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4ae33fcsm1585502a12.78.2025.06.13.12.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 12:40:03 -0700 (PDT)
Message-ID: <a033f565-96b0-48ba-b12e-8deee4691f72@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 21:40:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: msm: Add eMMC support for qcs8300
To: Sayali Lokhande <quic_sayalil@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc-owner@vger.kernel.org
References: <20250612092146.5170-1-quic_sayalil@quicinc.com>
 <20250612092146.5170-2-quic_sayalil@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612092146.5170-2-quic_sayalil@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEzNiBTYWx0ZWRfX6pQvwvEDH1js
 ABmkKKtdsb31N7TNPro+kvr9uW+j7FL7RtFFEDAH+kJBL19vgxMd0QIUMxrz8Y7Ee/T3T34xgQF
 +dmD2eRkEPXjqVTxDinDQjZqrG/eg6GetdilrmeLhTgt7NCVvqYzlUB0F01zwA8HYd6+/lPwr/8
 Clhxm2vREDz0fqaKVphdEkCqlsy/oqm4RS9thqzI0OEa/vyJz94nqogux+9pzwpzu8gp8lIzrzi
 ncLFt/5vIiAFMID03fCIAf+w0dNG1sxOc1waNF7Xqjb6IVvjVMz+OxOp+zaZNyQDqAd14a/upWE
 tsvmMgKNkhA8JHwIr6+8qARendeAzL4IwOOrIss00hRN5Gyi5tllApRRodp2HqGS8y/aDGtXMOu
 iqDN2wbJIjEMy+0GwT2o0c09OyooQBlwc+Glxz6kz6Ispjtax3mur11A+1VPJNgur4cpIh9e
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684c7e96 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=wwKwL4-ToxZHK94GjMkA:9
 a=6YsMbVLJVbuaDASO:21 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pmMAR2NH8nzbUbw9hv-2aU2Vq1qOejbs
X-Proofpoint-ORIG-GUID: pmMAR2NH8nzbUbw9hv-2aU2Vq1qOejbs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130136

On 6/12/25 11:21 AM, Sayali Lokhande wrote:
> Add eMMC support for qcs8300 board.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> ---

[...]

> +		sdhc_1: mmc@87C4000 {
> +			compatible = "qcom,sdhci-msm-v5";

This needs a SoC-specific compatible and a corresponding dt-bindings
change (see other soc dtsi files, e.g. x1e80100.dtsi) 

> +			status = "disabled";
> +
> +			reg = <0x0 0x87C4000 0x0 0x1000>,
> +				<0x0 0x87C5000 0x0 0x1000>;

Please align the '<'s across this change

> +			reg-names = "hc", "cqhci";
> +
> +			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> +					<&gcc GCC_SDCC1_APPS_CLK>,
> +					<&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface", "core", "xo";
> +			interconnects = <&aggre1_noc MASTER_SDC 0 &mc_virt SLAVE_EBI1 0>,

0 -> QCOM_ICC_TAG_ALWAYS on this path

> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDC1 0>;

0 -> QCOM_ICC_TAG_ACTIVE_ONLY on this path

> +			interconnect-names = "sdhc-ddr","cpu-sdhc";

one per line, please, also change-wide

Konrad


