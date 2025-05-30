Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E6E2367CA
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748645839; cv=none; b=qbGqXSLQZTmUj8fSrhXtBZ9cFH6eZz/Afwv4drmhL8mhu/vGUNFuyVes1VREJGTahdFr0lyzZOITVDv3k7e0rT9IHM6om7+tUyKvV3/TVL87ocOS6ZsBWu/9sZm71T8JQ1U4HSujcTaatfMnba9Xy749j89TGvqeL36FO3jcL0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748645839; c=relaxed/simple;
	bh=0rYnwnIKvNm0c3HgIujOwnxEWY1I8+r9DMa/HukZvuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qys9mASU3IK/WOb5B5q2vv2GUqp/p6iRfnhEIG8dLy0BwR8+SAisbsW+JjAWPMzmC7L/tEd0WdtVsYvdgz5WUo1vNzv5pV16z0dqpYcU3rIDrWpTz2CsY+qK/6NI2rw4LGi33WZgG+v9npOAYXYG7SDYyuOMXTZowNEKPBqJKYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHbDGDom; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHbDGDom"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UKA2aC009532
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 22:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQUQLSp8pLnLo2JOeAyxkurF8Gs60uAE9AElODkHawU=; b=JHbDGDomMYOz+9lc
	bGe5DVKWwuvuvrOOC8avb3SGZRkQUWmFdfNrwEFZdOh8vhKClpdMcpxjynr3+mf1
	VSfYNtrRzvWPrmbSwYhy3muGYTHuZQx2Sq29BkD9gylJ8lMADAUjQjsCMpzPdq5l
	492bVILA5MYZGS8pEVFjvdmmNWOTzKvNdIMcK4TqiowBNP5cWq3hJukh8Z1jpUNJ
	FULiI+Ww8tLKWlM38i6hCBJSwJDNA8u2WNTJgpiVTDAtWnoZzz8aTUWJdP57IozJ
	rCCo3Iddw9ZWOi2RqC/5P7aUKvGPGUnpJPIbLd2l35NZyqEPWReZs81PD8d8+joP
	d4hnaA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ykfbr8g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 22:57:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a43924a1bcso4013601cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 15:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748645835; x=1749250635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQUQLSp8pLnLo2JOeAyxkurF8Gs60uAE9AElODkHawU=;
        b=JBrqnDOIXcSv+htMWgksLY30HHaMKtCi60zFb+69aj8gVNn1opV7Vp6Ba3GfszWP7K
         naadWOGzwigpDFezKNzJvQytAOWy0LhVEXynWM+SKJBkTx3GH7AQODMVk9HG1ckCNeLD
         sMPQW8Y/VDeRygxl5npAhCvkVsYBs5M20G5/2Y0wItJnmHK5s71JLIx+/s0Ct2KFds8N
         Z4ukyw5+BSlaAbw84A9zaibeyLj4NGYIKghbGbO9QNK/gYZx5TBn6W9Sb7HSkbOH+tfk
         47x5T8Sc7VmikwwULe3v9TjirRXZiLPC6NV6IHZ/WpC5uC87emxbMM+o5vnkbsQDhUGh
         BsVw==
X-Forwarded-Encrypted: i=1; AJvYcCWmpxTZG9lWkKK9NSCJpjpVG47tVnn6dBFkRtrSxIBwPe0Ymwygm4L1k89gQBvvlmBeKZkmZ0kP0h4FvT0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/WYAUlxxACT1WoIqBDi2XD0TWx6SLxRB7La5kBmlaInVJqpvy
	+GTcW60OxxUVm0U5K1cS7ToYa28xhJuzWHL2Yt9PUs5Rj8Zuuv1CgV3SyD+hl5NIOjOMxZOFOdN
	odqCEJ46Of/u3WVl7rAnQyCn7T2MXTyhm67YCiomNaaRrSxKYjam+SDICnKeYLs6VWD0=
X-Gm-Gg: ASbGncsSOTC8qZIuuJSD834DrWPem/9dlGBYZhaqwK/BKCJhs2ep3Wf4rc1Prgk+r+w
	bGK6/2mM4sCk7SH1eJy3kcHBWlETHBgLo2O2YbC1ahb2GKKyDYJLrOjBpuMlCAAT2BG1hX0dlrS
	fbAWraPcVAye5+cBkvBQEE9oGYsDp2swVXbpSPpuZvFw9QmiV3eofKk/Ll9HWgkol+Cy14KbhI0
	Zsu3QElJllCvC7EPvnCJV+onpXO2EiCDeck5uoxe+R/WOIFjnTKANoyoifySrMgj0Fyj9EzuSX0
	W/Yf4nnnOnrnZhL3A4PBLhvKiskubkgFnYcIl0OzdFqYRlxa4eGoPQWUTby/bupO9g==
X-Received: by 2002:ac8:5803:0:b0:4a4:369e:6e54 with SMTP id d75a77b69052e-4a4431a0532mr24759761cf.12.1748645835419;
        Fri, 30 May 2025 15:57:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyHH/AeRi9HZArP4FkQ3X90OwCb53n/Q6G45zWYMJCs/FB6Sg2hE3vZ4Id8Zqhiwv9MGAlMg==
X-Received: by 2002:ac8:5803:0:b0:4a4:369e:6e54 with SMTP id d75a77b69052e-4a4431a0532mr24759651cf.12.1748645834917;
        Fri, 30 May 2025 15:57:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e74csm403329766b.51.2025.05.30.15.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 15:57:14 -0700 (PDT)
Message-ID: <a297d9b3-a82c-45c3-aa14-a20125af0a3f@oss.qualcomm.com>
Date: Sat, 31 May 2025 00:57:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/18] clk: qcom: videocc-sm8550: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
 <20250530-videocc-pll-multi-pd-voting-v5-8-02303b3a582d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-8-02303b3a582d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U4SSDfru c=1 sm=1 tr=0 ts=683a37cc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=k8BryfKUEck1Tcg5KdkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ksEgcxHauqSqQZylceGvKFQH0k-LZKxE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIwNSBTYWx0ZWRfX5wBHvzhR8miU
 oHI+xS99rbNmRAJJGN46ZcNPO0QtlSkZ+larUtwto3VegqHvJLMgP4UIQmQ2BW/C8j1YdYSC4wf
 SbcHLd5nH5y5DdXY69BSD1uE1X9xr4bksZ0fYsBn8bXkDULweD4woDqEB9/THyAFaCh16VIcaJb
 a8GSD/m/mh6M5C9qdbjebISpDF+VnuAwuJ1a9v3UMtgtjumjij7c2Pczrozhv9yXYiXHu2CtnmG
 KiBudKBXp+IkzAN6ook/ukLzviBqC98ibhgi8AXfvddPIVlcGGYZ2tfOfwCY4cZKu3tC7NieDBZ
 71jPiEbYDJO2evlaSqhxBWgJvOoohC+L0PtogTh9LqUJmKCDVi4n1dUxBvhsuo42ru1S+rDKG/R
 IFGR1d5FvO8z1ilm5FKuch6Qe3Fop8LWPKjc3lRBPUdn1mgznKnyTVBD2/hJTmQhqWbGYDLx
X-Proofpoint-ORIG-GUID: ksEgcxHauqSqQZylceGvKFQH0k-LZKxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300205

On 5/30/25 3:20 PM, Jagadeesh Kona wrote:
> Video PLLs on SM8550/SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enable critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
