Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2D71624DF
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748717328; cv=none; b=kXccMGytgZHqptbGDpVDmFxRh+TPtalYZwP/P9Obzx9uBLuDz00Bc3FzbjZ+4fB1fRGLntbP2cTLQEJfOOnNgg9099CI7O750WDrz5j0TzIR82pvc9Wv2ZtwFnqdfHIwkbf2BLnM7C5cxBBrBC5b7GZniJ7xfquXmvLevCtqKKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748717328; c=relaxed/simple;
	bh=twnMRSAjtTxRsTLOV3TBRxjz+geOQMUR7QVp+z8lBDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hv2vdTHugPWXxZsRlcH3cHRmW/4jsl/Yyz/LR4MgRUaZKT41nSwil7iWFTREbBl3HYB3Y2j7R9gM2eGG7VMcykOTkTge30K+d09VkxLImpV9OcucAWWdb6RbHW0Zq05eu/IxOnFyLVMQipS9yoZaXilpMXwKLucQGFkNCI1UCl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnZK+hfy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnZK+hfy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VF97QF009209
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fq6UVpWTFma51ctoNBqE7AuMMwmya04U5DV/dQ3iAq8=; b=JnZK+hfyv1XyuO4x
	5QKELThanYZBqy59WIWL1V8nS2NJ147LveHw+6bJ7QutoL+kEqsqNzaleLRzpqFm
	/oAepbXDPLK5Xl6gHfRVnGij5W2VJn1QPY0TUmF2s0rlm1lpzVb4nqtwSLndkvYg
	B3hWGLJfteLFuEjt0ZJ65U7FfiMJsd7WZHOushh1sup2Ck/eB2rG0jsPgDZDkhys
	y2iZLOkitIUEvMUzFzhZJqmKRBWF+BL5pRlSxvI63EESPg5T3l+pVaj2WU2G/U4w
	0LbyDISVPzIbsADafH6OooG/BcyLRcEpggYdCHrmWGrWrDMiXWOUxdKx9wFq1nMf
	jyOfHA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkw97e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:48:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a42d2df3b5so5930771cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748717311; x=1749322111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fq6UVpWTFma51ctoNBqE7AuMMwmya04U5DV/dQ3iAq8=;
        b=qcxV/5a3fQoWVu8LaZP3/Jxul+6EtV3mNA5HWhsJ08kLpmkDtozwHVaLLqu4vURs7N
         6E/7XYHk+1s0x9raqr+dIGUUCcr3VKOnFl0h1DANFR81Gh7RkzdV5hITBESGCSxVFMRd
         2VxTLes4MBa0GevrPE9oQSr3EONTKKAsl3Fh23a6FPWO/d8RMWj/D6BvP+SNZz382BTA
         eY4wM4dRVH1z8OSp12PjkSajP2zRQMOdf7+K3B8ZhTMUKemhtI5nC0NOGQO58pBrokWs
         fzWcw7f36HllQ52JaJun1wVnBmJVleL16wzYSTpGIp24UwLMnMopw5wBvkAQcAvl9Va7
         EuIg==
X-Gm-Message-State: AOJu0YyxO3pimSoHH4+7oMALqmBdAFERSu0D0hQfw0gE3bB2YQwSWy+/
	SFyGH7LVyBSuJGzbfZDBoNoTTd25+SvJ+FPSIEmm4SHfxEa/LfgYa6eOOfXc2IFlj/tz6CWlA5r
	PSpUxC8h8Sf00ODGKuErnBagFl26WbLjuFIp5l0bIHW5pJCDQdK6BzkffOL4W9t3pDfE=
X-Gm-Gg: ASbGncv/CR9e726E9WvfixGFgUh9m+ZaLRMtXHll8sFNMTAkazMffodxpkgTgMUfCCc
	3J/sOh0NgB4ijbF0v9RMGn13hiRd7AhJT7HTOtSdlorXGfGEcVjH9XKafZ0TSj81Bl5tLn9DdsT
	p/tv12u688uM907ORkWKW+Z/rwm79voeVHRpzpuQ1aXM1EeIUpQ/5w0wH+LwAt5zyLD+iTXt4TU
	bz1DEXtkLwV6rruNyRj/96p6Gu1sKnuvXdVLZUIYr9sLzZdfyVzpsSObCRb0QdB8hFrwUZyt3KQ
	sckF2twjrNbiQfTC4+wQgDQCOxkGwSlymP+kiFL2Ra/Dcu2n3+1MO7VsQmL/BdIdVw==
X-Received: by 2002:a05:622a:44b:b0:475:820:9f6f with SMTP id d75a77b69052e-4a44315f061mr44406901cf.9.1748717310676;
        Sat, 31 May 2025 11:48:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS50jxW6Qje29AU0C9sBepph7zG42LOAm/3jLmwP8x0sfmPiEZkOM44vaelCgiKPREG+C6ew==
X-Received: by 2002:a05:622a:44b:b0:475:820:9f6f with SMTP id d75a77b69052e-4a44315f061mr44406631cf.9.1748717310234;
        Sat, 31 May 2025 11:48:30 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c756d2sm3678883a12.43.2025.05.31.11.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 11:48:28 -0700 (PDT)
Message-ID: <4b4925ce-3a01-4295-9864-a43c65aab530@oss.qualcomm.com>
Date: Sat, 31 May 2025 20:48:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: msm8939: Add camss and cci
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org>
 <20250530-camss-8x39-vbif-v3-4-fc91d15bb5d6@mailoo.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-camss-8x39-vbif-v3-4-fc91d15bb5d6@mailoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JIE7s9Kb c=1 sm=1 tr=0 ts=683b4f0e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=EUspDBNiAAAA:8
 a=siKOB1rTJ_YAM3DqF24A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-GUID: JTL8jiRlBsdop6fGUEiPFswFQ-7E7ANp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE3MiBTYWx0ZWRfX7mZw+6asgQFt
 okYMYdLeLshr+Z3J3ZHyQN0tkiM0JkWSVNTXGdSAJE5UqCIsVvEWfUg5/C77ZnrOqKpSkqFmyHj
 crugNYiWGVwHWLByA9dqqlAneUq1UCpE+utj/q40Js2hlF8+7Uumb7LLbUbZnIgnSCNb/t0jzeY
 EyGqPBIZjF83UJg04C5TU/Ex6FLKdMMVtdCMYQq4ZxTGRUWp5fwij205W+h1dpA7OTvV7wxLqD1
 s3OhuLSbTaYwtxMll5Haz3Eld4kzxZ3sT5nAZkIstcAmsKeGzBfCSSIM4aUSw44sRNOSUxLOGky
 vj+WMcsI+sHyB9HAa6tmy/kJf7p688Mm/iGgn9o+hdLwUSYJvDg9Y0SuTHzrnmSetkDfQYeJkzS
 xRICzwcN51sZ/G5TuqaBtb91Wv27Y+KATvQZ+6jHUGlxvQvXLwhYkbfHRZPMW9pt8wanLkZx
X-Proofpoint-ORIG-GUID: JTL8jiRlBsdop6fGUEiPFswFQ-7E7ANp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=759 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505310172

On 5/30/25 11:00 AM, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 615.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
