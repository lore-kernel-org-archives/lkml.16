Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C862E8DFB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036988; cv=none; b=otAcApYL7CqLeP8vgoHymB//JOtqqhweVvHjVbK22Hqgt3zRYrJL/y99wY60IF79lvRET5JUmMLDyaW2BOm+OPyVX3vnZBRVFptO6RXf+TsF1UthoXv9weM2ZJ+2nXwqAuhhDXSyJZNti6DD7VNvPjivBWoWociiAe3eZLyjniY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036988; c=relaxed/simple;
	bh=Rs39AICjklGcyc7xDCTetXh1jXW242vqtldO29LpJBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+0k9ttS+JH8AzfP4kdlmHjG8g9bZ/MceZU5fkaCUpH3F+FU7jmysGjT0U1UfD4HoB4eMbR6X1GAj/dp6EUxm+UjGVk2Ug1CmRm5YobpxCQpIo8Kl2e5aybJW3PRBGvVZgxXGu0QV0n5na98BwfakfYCB/D0lANWh9lDQc2zKpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OnDg/9hd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OnDg/9hd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBmBTE027616
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8MYuuA2G+3W/uvr0CyQxqIxAaENDczI3l8DDQQ0A/Hc=; b=OnDg/9hdtmSvSmLL
	ynNfsbbnIiwSr9BjDUizsy7NdocbsgLRPVZ1tZY6zI7W/Znhw5Q4VQmtZrZNnYkN
	DrXQjKxWT0Vkmprkm49OW60kG8OGUUGZDnbQQm0RKrQDzN0YpkuG1As1fmIE0j9X
	ppMNRr0jnxXFUULrFbUiGAwN1dYnVf9B+5BvNXfNKdjpKCbrqaqsp7uCiALDTNh8
	48OotKF8Ohg6Tf/NX5ME2xK425160xlk4oyt9ZZUpMsyhIr5GO4VKadfXtgdFlD5
	KQYz61rXfD7H/NAyGfYIBX+JulUwZApu4X5e5u6qr4TV368xP5cmi6MgLbKcPFoR
	t5LcEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26hnec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:09:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09a3b806aso42275985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751036985; x=1751641785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MYuuA2G+3W/uvr0CyQxqIxAaENDczI3l8DDQQ0A/Hc=;
        b=LkljpgMn+WRHEEjZzmjEnW5k9An1KyQxxLWyYaCjcaML3mla2WFWvaqI2Z+jdhkZjH
         zxxgTXmSOoUU/yNyaeabHfFDjMm2Ws9yLxfwNw0Ju2idFmKbpYDeiMUxuIwv9PGW/aQq
         xvQgfJ86ziKlb/uS2o4pg+uiCJ1iJJhNSzz6O/0+amYC4lXd2CbRYAOpwb65zqdWyXSk
         RrqRgp/4u6Q3q+CK+CIJCPAYIFjLJH6bXWkF8u60d+2wC+1OIW5oPFnwq1HebVsQ9X9q
         59q6mC9kV+RUixzSw569e08+dtp/4cuAQeZtCNak/jvAnua5sso9WvpY3rTC3bXJylKO
         jACA==
X-Forwarded-Encrypted: i=1; AJvYcCX1fOgOjzcPdFBYrjguxAxYecoZeumzw4QFNsIZ17CjH6q0nIBMZMUKrwK0zJuH8LqT6EbiIqJu61Xuomk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM8tzgkC6PIhmlYVW/ushLZvdnxOq1nNnZzoksoQIKDUbOXCMR
	1I3VTHsBi+lZx8IglHQV5UUdIrjV5VXtwqpfrRvGzme6YJa84XrM+5zHLviIYMcLDeWnEm5LOa/
	wImITeWmnn9n62I1UClnKYX32WyynwIZ/Wgq2oDRREJ9fxCFcb8uON9I5eJTCtoCtR4g=
X-Gm-Gg: ASbGncsy20f9t+u35dWdeMsfPJo4tOLXAiPRnHcBfN+uj9FZ8ETcvc6RlWVil5CdYAg
	Bf4uEXeb3VxKQKTbyBAN4zXAalT1SeuV44nqefetDWcxG3wmRO2PxcR6wSwlg697vcZ7n+AwUiN
	nXe4jCKIIJ/PPTDQSlN9bZ6EDHmWfOAsjqrCfIU+Fetmn8m8FBDzI2LsIUhILieE6RbZQI4+nVK
	rCK8aOPiyYWXGREE6Qk28NmVpCga8TpnL7rWDObaoI+CI1EmMCKEf5P7kjbWl7CXqutyWeyhOzj
	TLaQWkDBbC0rvOcORTlZpsh2PmoWqyZcU9Yz6cfYpnlB53kTNid+ZY5utDjgj+D4ZK5prHfrhfR
	IoP0=
X-Received: by 2002:a05:620a:6011:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d44393af52mr210730385a.8.1751036984745;
        Fri, 27 Jun 2025 08:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt0El1GcFRYFDLI+q1hURApBGF+0X3eNxXSn7/tVJPwdQii+67Yzh11WAEpAraqUYgdU6DMQ==
X-Received: by 2002:a05:620a:6011:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d44393af52mr210728585a.8.1751036984230;
        Fri, 27 Jun 2025 08:09:44 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8292076csm1554764a12.32.2025.06.27.08.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:09:43 -0700 (PDT)
Message-ID: <c37349c0-8ec0-4654-bc82-15190509ddeb@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:09:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-1-b34dc78d6e1b@quicinc.com>
 <f0483597-45b9-49f8-b316-a9cde7b98d81@oss.qualcomm.com>
 <9a9d84e3-49de-4fbd-9c0d-180e3e498125@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9a9d84e3-49de-4fbd-9c0d-180e3e498125@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMiBTYWx0ZWRfX5qpleQn67+TE
 p67J95hJFnZT5MXNGnH1NPm90NJ+1Ob1mSGjCV1xh6xZBfCs987YID9YrAeleVoAeFQ6tZuH6/4
 bsA1FQ/6AWgcVIUQdc83mGmtttitRBd9LyJQtrVGr3Lg5gMUTqeon14fWHwHvOhrJxkkmcGuzoG
 B3DO3ZBBwyGqxkAWqXR/E66HVPMxwEp2cnJ45ATXP3oT4kUhrKU6+8XIxUMtaDuiN2a/8nxKt3S
 94ucij8Ul1F69Z/OrNXt67Kb+MCXXq8S4PGFt6PWxoOZC6pkWRmPHr5s/HkL982thHYfdshMA1r
 E1k12r0QIASv3HwosgRiTjWdx0ek3+awoR1zb86wlINgBRqQhGcLsvilHY4qoDRZCo6ZPSfxlb2
 9jMIVwsc5uCbTdHHpGH2zHoW06qlLWZR10mlQHVYypCl8fOZc0v0esK+jlZ6IuNOR1VP3egN
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685eb43a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=Wx9hSxQhFZ4lEN4NqugA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RP5jFuafqSy9LXrnWc9Xx1K8IN-bRxZ9
X-Proofpoint-ORIG-GUID: RP5jFuafqSy9LXrnWc9Xx1K8IN-bRxZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270122

On 6/25/25 12:31 PM, Taniya Das wrote:
> 
> 
> On 6/15/2025 12:20 AM, Konrad Dybcio wrote:
>> On 6/12/25 11:55 AM, Taniya Das wrote:
>>> The alpha PLLs which slew to a new frequency at runtime would require
>>> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
>>> which can support the slewing of the PLL to a new frequency.
>>>
>>> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---

[...]

>>> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
>>> +
>>> +	/* Ensure that the write above goes before slewing the PLL */
>>> +	mb();
>>
>> Here however, the write may not arrive at the clock controller before you
>> proceed to slew_update()
>>
> 
> Yes, it is required here and will keep it.

You should change it to a readback instead

Konrad
