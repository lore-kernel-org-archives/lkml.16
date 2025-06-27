Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9787C264FBB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027831; cv=none; b=B2wwoZCyYJBXYsbrFlTO9lXBO+ldIi93BC6otPkz7i56kTNneGGhTwQrhiGCaebFYNHz+LacA4WYa40XCL+vwlDW3/qG4/vhx1gVSuZLC7kkvl8GjZxQbckRcVw+jB5wXnQvu9QMw4DYzSr1F/aoxbVqaHcg5OiOwGAnpZjKqAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027831; c=relaxed/simple;
	bh=nA0EBTgDXpgCH6r8MZS4yR/dLw++4gxjwURZnOL3HLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JtWrdhSROxvn97Qt5wk9N4c1RGN7iOWiA/LzHZ14rUjqsWLHJjZALiPNFsegq9LLJcDJMS7d8zVBtqM9R/nDploHwRcixymtoU3ppw3jcC+rnXSyxlrcVz8cPnV0hfwXWqlw3n3ETjQoVtVL2WxcRS3pjS1Ja0KgWJJ4fH6vrb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EM1YY02A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EM1YY02A"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCHDa5027611
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wAz0TL7lcdUxA4iFRWSjq9TB9NAzt1Ff1a2cuJJOS2o=; b=EM1YY02An5mDhU0+
	NViwHpVc8NBW7ga7Au6K48EHg4vnqIuQK0bSLXfjvv4tmYU8+bAzrhq5hdUWRMLx
	+JEwpC38U94p1yUCPUaxn2k30V4iqXSlN3MUwfjk/2rRCexYvX/D3OSjSdpcXGg6
	u9kHSy382DEfp+NDV+MRUQwtdmIPLZkPeXiB6RAjHVSHt+FV9DlbPl3WxPaffEW3
	pNDaTyWrP1hQoPm0xtnpMhcjZmDwnBdIbwKiZusM5X3FOue2Q86OQuHwPInWtcRe
	YD4uvl+7DpjwA4q+4lnk2+G0J5TAkFogcCAPcPjsAXitQxk9N5zFItUp+lU+JdOa
	/RxM0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26h7vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:37:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c760637fe5so336002785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027827; x=1751632627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAz0TL7lcdUxA4iFRWSjq9TB9NAzt1Ff1a2cuJJOS2o=;
        b=v7cLVl2hzjH4c1gM1WEl2b8R0VknutMqj4KEVbCtTGf9nxRaYOgVtNlyhLPhXortug
         OkPJInfALY8/oL/p2ihvNonNRO1J7Ju9wa6Ga3jKOlRB5OLEN2ePUEgqOscWQGwDStiB
         sQLFy70pmA5cIHRLe2MnsabW/Yz28ha4HHEGrtIxpnVslPlbo6IGIr95kXaSuYquk/dx
         TuCXUNtPvzRxk0N6WdOM8rdvxMo+Z89/oATZ8B/IhHGBm52Mbxz33BqGQjJhplrsLfEx
         z8LF/IaH88Ce7bDYCagkneFJxlYcRU9pst+zWn6Go2hn4dQ2VkwrqGib6aF5luMJqRkX
         4jDg==
X-Forwarded-Encrypted: i=1; AJvYcCXdTnG3yMr713o9lpW4v7rh4BZs8nABrSqA9S8uBZ7vUg01ntcWz/lqU/Ot9qrx0l9lBhtzLm/FWgH/NR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzACEfyq4wBR2QGVnXnDKSwCu0Th/fToAP9svLFOFcm/vBRXEUG
	LpmfUiZ5Q0WN6CdB/64BqYhM/gHrbAsODKTeP+w2aT3kPTE35nOK3yAo8jsjng4X1WaoGwGXKd3
	eTYXwsGE+CKzP78Kjw2rh4ZDZi+gtScXTeFgbfsaqss2UPkvDvjXD0yrXAg5SlcXUoxo=
X-Gm-Gg: ASbGncuPDX+if9CawYTUJtJDDZdWajAPl5LxoPIGWSFRmM4TeAR6f/bsDvLDDKIlzWo
	lFPu/HbMPFarFd2p9I8+WGKDkwUtPnHr3T9WGHCsIOhTI1NnxE1vKagBVNRe8RMNNmdxNZE96OZ
	nXckw48UXYM16caD5PcpNJwHRjZEh9ONf50dX5squXoZaX1fGpWKIPIJuyhyeXV0eJASDjXpc9s
	SKSope1e0ThuQhMcMLANvC6tJ0hp9ZQoAOpbMDmEPTN4IVkcl/JvK6yJNNheCMzCK30oxL7gAak
	phidyKm7ZPcji50TDRQ23jbgX1mfLGD7lXSkq19VMNwfNRwMR9Q123eOzPq5jlzoJc5/Xqnq
X-Received: by 2002:a05:620a:4009:b0:7ca:efbd:f4f4 with SMTP id af79cd13be357-7d4439a37e7mr465646285a.56.1751027827356;
        Fri, 27 Jun 2025 05:37:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCxBke75XiU4P29zUlVR89IlIUHFxI4koZUgqia/W7QYIrDc/FKS/y6TSYgHEYIi97FOYfMQ==
X-Received: by 2002:a05:620a:4009:b0:7ca:efbd:f4f4 with SMTP id af79cd13be357-7d4439a37e7mr465640985a.56.1751027826895;
        Fri, 27 Jun 2025 05:37:06 -0700 (PDT)
Received: from [10.185.26.70] (37-33-181-83.bb.dnainternet.fi. [37.33.181.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2c4f24sm430368e87.143.2025.06.27.05.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:37:06 -0700 (PDT)
Message-ID: <667ac51f-d19d-4832-9aa6-97d9a86e0068@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:37:09 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
 <20250625-qcs615-mm-v10-clock-controllers-v10-1-ec48255f90d8@quicinc.com>
 <trwdfk2oz2udtbiqxh3ybuqbvasfqywmqxgi4xyvsknz6svs2r@icpp7snpq6c5>
 <44dddd3f-d2d2-4d4b-831a-21e6d9050445@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <44dddd3f-d2d2-4d4b-831a-21e6d9050445@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNCBTYWx0ZWRfX3xURWfwedHvK
 KW9O+n4jOxdvrvVXgK+dseru8ff4IY7M6o8Tb4xEOrB3l1TJx/QPjf3E0dhuI0MYpmtB7bjaA/5
 QWr0B8w1AA4VlwR4XOXvHYWY/XkyxIPMwcdEx+KpJToEezvjDPg8Vyoa72gPVMVnuQ6gtIBuY5+
 d/yZh3g2T4btlYqttax8UmYer1MEfR5Tlt4C/3Pm7x3H1r7utEP54DmCFHZqX3Fww9aF2nhDZpn
 0ZQJiw6Fen5FL6U/jaQTCw6jbuxv09A5NcBP+/xlE6yUZEydwFCv5Nm9l4y1DuAi2BRYv7wqUUU
 /RvutVjiz3s2sXAhsLtvRsYWGC8LaTOxxTU5h8EhvZ4tXfePZ7PmiYqk6sWhc28d7JTZ0ONGj6w
 l6GHBIoE6PtRwqQtSk+HJo+NldldVZtcNfKIJA0KBn4BFkFHKGinJOVz4BHN0nmHf/Sezj8O
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685e9074 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=a09MB1VsJqAZHPW3esczKA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=-U2GbryNtLgmjeNmToIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dcPrtjylwWSa6rlOMi3d5nDDI5_d-pVo
X-Proofpoint-ORIG-GUID: dcPrtjylwWSa6rlOMi3d5nDDI5_d-pVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270104

On 27/06/2025 13:13, Taniya Das wrote:
> 
> 
> On 6/25/2025 5:17 PM, Dmitry Baryshkov wrote:
>> On Wed, Jun 25, 2025 at 04:13:26PM +0530, Taniya Das wrote:
>>> The alpha PLLs which slew to a new frequency at runtime would require
>>> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
>>> which can support the slewing of the PLL to a new frequency.
>>>
>>> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/clk-alpha-pll.c | 169 +++++++++++++++++++++++++++++++++++++++
>>>   drivers/clk/qcom/clk-alpha-pll.h |   1 +
>>>   2 files changed, 170 insertions(+)
>>>
> 
>>> +	/*
>>> +	 * Dynamic pll update will not support switching frequencies across
>>> +	 * vco ranges. In those cases fall back to normal alpha set rate.
>>> +	 */
>>> +	if (curr_vco->val != vco->val)
>>> +		return clk_alpha_pll_set_rate(hw, rate, parent_rate);
>>> +
>>> +	a <<= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
>>> +
>>> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
>>
>> We have code that does this in __clk_alpha_pll_set_rate() and now you
>> are adding two more copies. Please extract PLL_L_VAL, PLL_ALPHA_VAL and
>> PLL_USER_CTL / PLL_VCO_MASK into a helper function.
>>
> 
> Dmitry, I was thinking of implementing the following as a reusable
> helper since it can be leveraged by most of the functions. I'd
> appreciate your suggestions or feedback.

The code below looks good to me. Please use 'alpha' instead of 'a'.

> 
> static void clk_alpha_pll_update_configs(struct clk_alpha_pll *pll,
> const struct pll_vco *vco, u32 l, u64 a, u32 alpha_width, bool alpha_en)
> {
> 	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> 
> 	if (alpha_width > ALPHA_BITWIDTH)
> 		a <<= alpha_width - ALPHA_BITWIDTH;
> 
> 	if (alpha_width > 32)
> 		regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
> 
> 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
> 
> 	if (vco) {
> 		regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
> 				   PLL_VCO_MASK << PLL_VCO_SHIFT,
> 				   vco->val << PLL_VCO_SHIFT);
> 	}
> 
> 	if (alpha_en)
> 		regmap_set_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_ALPHA_EN);
> }
> 
> 
>>> +
>>> +	/* Ensure that the write above goes before slewing the PLL */
>>> +	mb();
>>> +
>>> +	if (clk_hw_is_enabled(hw))
>>> +		return clk_alpha_pll_slew_update(pll);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/*
>>> + * Slewing plls should be bought up at frequency which is in the middle of the
>>> + * desired VCO range. So after bringing up the pll at calibration freq, set it
>>> + * back to desired frequency(that was set by previous clk_set_rate).
> 
>>>
>>
> 


-- 
With best wishes
Dmitry
