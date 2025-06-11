Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608191C5499
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655892; cv=none; b=gft7PsIAixDOJxNVNQ4/8kMSpEfcIpiLRXGOo1DYXl1cbDG/kKwWImINrJlIwcq44l9ji5JllcH1i1IPcMAiGrHiPBgJtT9yhzdguLzJ/f51rm7MSB+M03Z4jEHai2Vs8Y8KMk1Nt0yj27ffC7HXwRMJMM4Sv9PUYbPeCP8CVU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655892; c=relaxed/simple;
	bh=VZmnhpMNAmXEbbqud23neFBnq7loO8MoNJRWiN7z2uI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h732Y1dRk1wW5lL5PEwsfpPuPXi6Y3URfdxtOkQRhuW+YnOJgqDO2vvXlrOXF6mx/6dsUg/39pu11r0BFmcNX4Wh8myx+ypcvKZFsKUOHp7O/t6D7BCprDs0Pz7Ym/zIKjVp6A0KO4XQ9x37+VezAecBxsmC+DLnASETaVCqSK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxAtWI7U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxAtWI7U"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DFbx013489
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	455gzgu0hHWS67hAKzKZb/nm3WenYkc/X441OZiZOVk=; b=hxAtWI7UUjCGmbMV
	ZivBuX7r1oKK1BmJZQUQovu0xLwD+GkbuX03yAVA1Ts73LM1e/7KUe6Kcqq2MKqm
	z5BfqNh4/mJ8CyyhtFDnuU4gnTBjy9Cnbjd5z9hI6SyHdii6gtqvN+icyd2MaGWN
	xuK2QUVQGC4mHBwWx/Gx0hdUFFVFqR0AQstfpmNm4WV4JW17pg+z7JTUSZWTof+X
	f+KVTgFugyNPC4RmBAnJICVDLK1XIjLuBsum3/a0N2Ks8IYiuFCcRn8lGj2iTZRA
	MGnFIL22jbyCDzCGhKUquxTS+flCpWdjWS8pMgwbx8KAdjU3j3Kp0WJYQjDEGM+J
	KdJPEQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnd31v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:31:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6facbe71504so20436d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749655889; x=1750260689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=455gzgu0hHWS67hAKzKZb/nm3WenYkc/X441OZiZOVk=;
        b=LzrTD25i94Tz907NY5+dEnk2gzhEe25Zm7oyduYF/EMzUj6+xLCWGz5tOb6g+Bf8gH
         muMMp5EjMlaV5JVd/nx6EslQqvjc2RyBuP+qxh4atzpTAXbbPD2D7PN8AwfYW0FVDRU6
         MF4NCqKdU46UGPR6DUPrE7do0arNX/4kuCXsX8I7K9UP1rwPO1N6WioaYV0VmxqUAN57
         A2DrLrGjUUjtNBcGPKzQ2c1JZxYS0Qb65SSy8g8NO4L5OPtPLpmE77IQXDayXYqA47/Y
         ea8KwB9oWKGd5Uvn6WJjq7fgn7dPqKSQqutroY4PJWZMVQVaDgMBGlUETmCvGpoDtN/Y
         5KXw==
X-Forwarded-Encrypted: i=1; AJvYcCXnCuDnnFf0BYA4cCKhZzTeepu5+mdjgjMTfdYrk+Dk+sFGGvhuv0CzwMtFMIvsK1i/aGGho8Fx4uH47x0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDZEY6Aq+QDRchTYICraKmKACMpm8J4jU1y6Je3RMiFzVmxdwj
	m7CHPE77mOLsH/I/QaJsftPEwDmQVW6evlJmFQWLP6S2cT8Cs2+JvVHtrhwxIMr1sG5cojUcUyt
	d1mKAxx6N+3jDqViXTqj/G98JXWXyYU/qz8s/s4bWk0QKL9VdniNNb5bUvlLXWXpFcmY=
X-Gm-Gg: ASbGncv+CpZ4dZyHREc3+cdsgrTK1nlzxuBaJ+EOmxN5Oj2bQa4zNGJv/LvqqH2u4JV
	wLiO3uD5dpqube5pmfycnE9iGkfgGP6IMLkG2SRlEgt26POl6lmGlfMIFltIvLs3Vlng1pjvpM7
	2+L39AqBKAkoEdeJF7h7EcwnvyBKzELRbMwNkEv5JiIeP9S76SOeh/D2jj3rQQ45u0ALW6qtQM3
	gmSHiNgSCKnBF90u2p0jCGyPDm9GIMx2mYlYyxn7u7pGoxUJFWCM8WPZFBhmCr3Bv6dS/IGaWpK
	+2TURdqzi2vhsC94Z1vx5RCGt6VOWDLKOcX5IXxOuGiiRE3R8gXjhxNrRwXpmRp7QYEENybGJR3
	HL2E=
X-Received: by 2002:a05:620a:43a8:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d3a87d34b9mr218668385a.2.1749655889053;
        Wed, 11 Jun 2025 08:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5SyB2UQ9M+HBsZiuY7IxSNchyuOSdndxJp/raWV9Me50SKe7sJUDsLyWN7TOdPxpU9D5OXw==
X-Received: by 2002:a05:620a:43a8:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d3a87d34b9mr218665285a.2.1749655888415;
        Wed, 11 Jun 2025 08:31:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55f6bsm906998066b.51.2025.06.11.08.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:31:25 -0700 (PDT)
Message-ID: <c24314dd-229f-4e26-befb-1491a5ca4037@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 17:31:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI: qcom: Add equalization settings for 8.0 GT/s
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        dmitry.baryshkov@linaro.org, manivannan.sadhasivam@linaro.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20250611100319.464803-1-quic_ziyuzhan@quicinc.com>
 <20250611100319.464803-2-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250611100319.464803-2-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eMXIqtKbrorWRKMhLqYHndZSC0O5zUWs
X-Proofpoint-GUID: eMXIqtKbrorWRKMhLqYHndZSC0O5zUWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzMCBTYWx0ZWRfX96TPD+6OdxGN
 bvZE4ruxLCKYjEgsjLPHv5amqNHU51B4GRFciIxYXQRuJB2gf/UpiHJI9Q9SMbTKnOh7ubpJHrF
 gcyDm4mlqB+be8ExvUR1100bIDognMrzndUhreUilKfB+ALkZ/qFAZIw3z9uwBaoyynxy/f0gOW
 XTQLPC+yszjjJAMIDsMmsieOP0fGEgr9226ASAycAkX3xI+0DeZTAjAruyvaaiRx9r+IuUozyBL
 /NpbkBRP206nA+r26Yhf+5S/0U5Q8LybdRN7NV3+5Or40WKaaNtwqj4SxnRPDtdeTDwEz9zpuDa
 X4dCcssbdCztMWz1vFO1cQmRfvnql5+AtJdZxuJqL/CFLyeVqOZTDx8V7QUCSCFWSU3OcnQpwiu
 DkloknJwFg5llssoSrfQx44K/T6PbeavPC7BPnJlGSbMRLDHadjE5yKPP5ZTI3tsRhT9lE4q
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=6849a152 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=XRhAMW6oQtNP-qC2JosA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110130

On 6/11/25 12:03 PM, Ziyue Zhang wrote:
> Adding lane equalization setting for 8.0 GT/s to enhance link stability
> and fix AER correctable errors reported on some platforms (eg. SA8775P).
> 
> 8.0 GT/s and 16.0GT/s require the same equalization setting. This setting
> is programmed into a group of shadow registers, which can be switched to
> configure equalization for different GEN speeds by writing 00b, 01b
> to `RATE_SHADOW_SEL`.
> 
> Hence program equalization registers in a loop using link speed as index,
> so that equalization setting can be programmed for both 8.0 GT/s and
> 16.0 GT/s.
> 
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---

[...]

> -void qcom_pcie_common_set_16gt_equalization(struct dw_pcie *pci)
> +void qcom_pcie_common_set_equalization(struct dw_pcie *pci)
>  {
>  	u32 reg;
> +	u16 speed, max_speed = PCIE_SPEED_16_0GT;
> +	struct device *dev = pci->dev;
>  
>  	/*
>  	 * GEN3_RELATED_OFF register is repurposed to apply equalization
> @@ -18,33 +20,43 @@ void qcom_pcie_common_set_16gt_equalization(struct dw_pcie *pci)
>  	 * GEN3_EQ_*. The RATE_SHADOW_SEL bit field of GEN3_RELATED_OFF
>  	 * determines the data rate for which these equalization settings are
>  	 * applied.
> +	 *
> +	 * TODO:
> +	 * EQ settings need to be added for 32.0 T/s in future
>  	 */
> -	reg = dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
> -	reg &= ~GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL;
> -	reg &= ~GEN3_RELATED_OFF_RATE_SHADOW_SEL_MASK;
> -	reg |= FIELD_PREP(GEN3_RELATED_OFF_RATE_SHADOW_SEL_MASK,
> -			  GEN3_RELATED_OFF_RATE_SHADOW_SEL_16_0GT);
> -	dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, reg);
> +	if (pcie_link_speed[pci->max_link_speed] < PCIE_SPEED_32_0GT)
> +		max_speed = pcie_link_speed[pci->max_link_speed];
> +	else
> +		dev_warn(dev, "The target supports 32.0 GT/s, but the EQ setting for 32.0 GT/s is not configured.\n");
>  
> -	reg = dw_pcie_readl_dbi(pci, GEN3_EQ_FB_MODE_DIR_CHANGE_OFF);
> -	reg &= ~(GEN3_EQ_FMDC_T_MIN_PHASE23 |
> -		GEN3_EQ_FMDC_N_EVALS |
> -		GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA |
> -		GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA);
> -	reg |= FIELD_PREP(GEN3_EQ_FMDC_T_MIN_PHASE23, 0x1) |
> -		FIELD_PREP(GEN3_EQ_FMDC_N_EVALS, 0xd) |
> -		FIELD_PREP(GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA, 0x5) |
> -		FIELD_PREP(GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA, 0x5);
> -	dw_pcie_writel_dbi(pci, GEN3_EQ_FB_MODE_DIR_CHANGE_OFF, reg);
> +	for (speed = PCIE_SPEED_8_0GT; speed <= max_speed; ++speed) {
> +		reg = dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
> +		reg &= ~GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL;
> +		reg &= ~GEN3_RELATED_OFF_RATE_SHADOW_SEL_MASK;
> +		reg |= FIELD_PREP(GEN3_RELATED_OFF_RATE_SHADOW_SEL_MASK,
> +			  speed - PCIE_SPEED_8_0GT);
> +		dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, reg);
>  
> -	reg = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> -	reg &= ~(GEN3_EQ_CONTROL_OFF_FB_MODE |
> -		GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE |
> -		GEN3_EQ_CONTROL_OFF_FOM_INC_INITIAL_EVAL |
> -		GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> -	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, reg);
> +		reg = dw_pcie_readl_dbi(pci, GEN3_EQ_FB_MODE_DIR_CHANGE_OFF);
> +		reg &= ~(GEN3_EQ_FMDC_T_MIN_PHASE23 |
> +			GEN3_EQ_FMDC_N_EVALS |
> +			GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA |
> +			GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA);
> +		reg |= FIELD_PREP(GEN3_EQ_FMDC_T_MIN_PHASE23, 0x1) |
> +			FIELD_PREP(GEN3_EQ_FMDC_N_EVALS, 0xd) |
> +			FIELD_PREP(GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA, 0x5) |
> +			FIELD_PREP(GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA, 0x5);
> +		dw_pcie_writel_dbi(pci, GEN3_EQ_FB_MODE_DIR_CHANGE_OFF, reg);
> +
> +		reg = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> +		reg &= ~(GEN3_EQ_CONTROL_OFF_FB_MODE |
> +			GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE |
> +			GEN3_EQ_CONTROL_OFF_FOM_INC_INITIAL_EVAL |
> +			GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> +		dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, reg);
> +	}

this function could receive `speed` as a parameter instead, so that
it's easier to parse

Konrad
