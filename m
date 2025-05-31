Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C305319D06B
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748716070; cv=none; b=GIURQPYaun1cqo9K5HFqWBEhIgLDuh2hWCyYRNIEx0GdllBfN2jboltx6V26WX7eR+pql9DzsS4st7NwnA48aYGgsxNFpGinU/lEPHjh3aY2BYr7GXUHKQCb2lXYWpELKPUEMUnxIRK+IpMnR4puSiZCOaQoy7F64sDDacjMwuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748716070; c=relaxed/simple;
	bh=QVyTy39kGa7O/ePiyt+9nmFnLXJK/m+e+8pa1txDyEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXYxOEZ587X8t+n6VYLRBaVjAbR4xirz/H2+A6GheKR/Owwd//b8xju9AlQ5XwgLADj48i1KTT2dwMId/XktQDOBzF0ED7JZ9abaxhqG/GfMUmiUBQDDc54c92bLjGP63fQ33b7WdUIyg2LGV+8LHirYCNcJQRQR3zC25yqved0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOt1W4ok; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOt1W4ok"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VI7JO2021374
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNLoxJaeNa7H9bgjtofmrjyfeoUO0fEK6F2yize1zNw=; b=LOt1W4okxakbYLOA
	+Wk4LRUaEH5afMT2rxrcAR0ehLnk0BQmTiKh3x3YqPwgqnsXSToeEzfR9wHASoHp
	KUgabv5mkXnIK/LodEMYUssWg/PgXv7ceS9crjh/KoeMdFFCIZ9UcA7YL6tjUoU6
	92YSDS76VRgKVeUlgZ1CPNtd8z/EUGR4lWACPptAgMZb5L75eJsRw13FI7GhaRyx
	oz8kITxX6ysSpQPFfXBnRra0rXELn3rs3ia53CKwu03mo1QxEMSAf8OfkmqIpMzc
	DyTWrnfQUGOOgIXDlXX3uIZPmEpaj54KaGnxUB0OPuDyc2R+/R/aYVFON+8zAO6+
	9mBQKw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytm6967d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:27:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a517ff0ebdso1725991cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748716059; x=1749320859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dNLoxJaeNa7H9bgjtofmrjyfeoUO0fEK6F2yize1zNw=;
        b=PBQiiYoo2XNEmmMns00Qj9T0iEO1tPUuMqmULrdzVei9AjTy7UMS/PrTK62PUAmiEe
         krFNUHPpgw3os0MJu/mjQdbAtRW/bqlbBR9HJHnL2wfLJQ5zWfwqBbC2vBG8OWJI2aeP
         qlM+AiDVHMDRHkuyefAmYt5cmLOA7LVGciYk7y+nIEJ5rkg9bwboX6w6OBDFxc8VDBmt
         I3k/HUhFjuNeYUtb/aQw1SCCHL13CYDUqsIMDXKk1vK90fQ2J1nFc0dP1rMu3IYjqfiI
         PNJ29B+lWdTXYka1A63Satr6u7sH9alBt3lZHTfHL91KL9dhzOTz/hE+3a3ZscgF9B87
         47Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWOesNTdmhFrg5SqGxnH9G4DD1/D7klr7QHniRu9+dPgXOYsEy3JubQTkvoZcX5tcOt2nyNBR2Nud8z2wA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzApsV9b9UhQUWjvHWOfR5sw/Esnmh71u78ULD6xHh68pfFibpI
	p0INSIxaeCeQ/CepJEJiqcnXxWr879iYeHE4AePooU+cI6HNVRIjUJjIKbhMVLndYfyRZA3BvK9
	EXHOlxrFHTqrFpeFfe6R+R6wClDvWnT0DhGAMjlwfe3WjbOj4NzJUKv04oohgxwImzg4=
X-Gm-Gg: ASbGncshkqI0Hr5yzkjJIhtRFW1KRS9Qy5dIPNuUmrL75WlYxv7Sgu2WXZjRoT3fD6r
	e4rWOlKCaMxemTJ0HmfWRkLn6TKMW6v0ifEqvjTakiQkf9zuNODbdSXREKP0aD0FItWRTKaGNWd
	aV5w7TYkX294v6bP+XoE8TdFOX7qP4Rs/qRDbJ/WOguWaDBJvy9GBASD4VrRkj4b0UnZrxrUFH5
	IO/LdsBP/ZCQpRRDIeWdxmAKbs5luOR4lN/jtfOlSYNhddGbHeWygGV9Q2TqwRhL8E+N5eKstZi
	UF5mfycGBJJQCnJlT1bYbe5VqzQvM9mVhU+PDwUM3lr1ht5KC3Qu+kNaAcDpm/l03A==
X-Received: by 2002:a05:620a:298c:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d0a3d775a0mr413430885a.2.1748716059142;
        Sat, 31 May 2025 11:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4okjwDO7D+IbmXbi6WJ92L36mIWN1ZbbjDie9mCBjaikBKTLN4+hEu+tJwMEbwza5FLtwWA==
X-Received: by 2002:a05:620a:298c:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d0a3d775a0mr413428085a.2.1748716058574;
        Sat, 31 May 2025 11:27:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fef7dsm530456866b.6.2025.05.31.11.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 11:27:37 -0700 (PDT)
Message-ID: <d3ee0492-afca-471f-9dc3-456a94bfa355@oss.qualcomm.com>
Date: Sat, 31 May 2025 20:27:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] arm64: dts: qcom: qcs6490-audioreach: Modify LPASS
 macros clock settings for audioreach
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-5-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527111227.2318021-5-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE2OCBTYWx0ZWRfXyH5L5AvXoNvn
 elQdP/+/wwHvtv7QQXJK42PPhfOsY21c/5MGTkLZ4Er7JqQVaFrwBWGfB5kpb7QJSsbN9+IWCke
 gjj4UsuwghrAc32itahqjkswbWRYEq4EXIqhLa0fw6Vpny1XmcKPl+YpWEXixrjPgQGxSs+qpLZ
 xwZBZjbVwQB6dDLpY57fiH6u3/5EyvBRvM0Atf7gVFYTtAQtvw0EIEy88nS3cVRQHNsf2ZNwjIM
 1wjNg3BeUgfLrVbYc5prjbn0gsIRdryY1vpxIk8Hde4N4fh9OJ35fFPI92BVSjrMPfR33T9SptD
 NqOLNlFs0jA9i7+ceydevy5W5tL/rgaVGbrxDx86NUUByi5BphPW6VE0NErAfVzZ4TlLvbauO+L
 Hd26W/JjbVvmVY7vCaR7TrH5HjZXBHeV9RYQEHyDueixpHzCqPUqTgEyAC5AGV0KT8QNrQVO
X-Authority-Analysis: v=2.4 cv=EOIG00ZC c=1 sm=1 tr=0 ts=683b4a1b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=IZQIRLw8iM99TnyeTF4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _vZa5Wh_QeyaOcojlBgmzv5BRO6ECLQ2
X-Proofpoint-ORIG-GUID: _vZa5Wh_QeyaOcojlBgmzv5BRO6ECLQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=897 adultscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505310168

On 5/27/25 1:12 PM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Modify and enable WSA, VA, RX and TX lpass macros and lpass_tlmm clock
> settings. For audioreach solution mclk, npl and fsgen clocks are enabled
> through the q6prm clock driver.
> 
> For qcs6490 RX drives clk from TX CORE which is mandated from DSP side,
> Unlike dedicated core clocks. Core TX clk is used for both RX and
> WSA as per DSP recommendations.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
