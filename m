Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F9A229B1F
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060987; cv=none; b=G4kCb/SVtgQ5dREEvr5VpGgmNosq8f/krjWUmu4vqrNoTUSwWW3KjTa7DAoHbXmtwFlfyNqgm9zDDAKwdoini72O6sCWSyidr/cAb1On2XHnVSlmqfCsEvMgOh1dck9V1dDe4Yruw707NMhop7Csw3RHZBdLxXj0Lx6JQuFz6R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060987; c=relaxed/simple;
	bh=bwj5+mAqRjuGjBMyvAcBv0WTt7nuIWHgWGUjiJkGlaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IEqi/frxriXp0SUjTxLaSLMMQrfY/kxTV6f5EwzGVdFpQsj9jsZIlsx4AsaZDa1+ikLwmSMo6ZcX8DzN3rL19nIKq0CVYWQkgVaWlkpQDRDox6yfK6FjBSU2z94LIQGYqjQq85fsjUZ/9CN0r8yMDa/pblmAAlcSgl4pRKHMQqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYLH6qmk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYLH6qmk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C7HfjN023137
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djREPE0sqvYKUCjrqfcQkeo21X9ODx3TwXhEw7tG1QQ=; b=RYLH6qmkSz4e4/1g
	l87B/O6n70JEljqOUJfC6vwSlyvX72sA1SK6K90jO3KbrlWHCtsylyVyMC/IfsEI
	pmXzNpZ9jf+Opkw67IIkcd+Bw6SlAjUtRPnCkZ1jvXY4QX+mQrr9xH5aU3VwG4pn
	JJB/s74c0pEMfZglyLjJfEDOn2lAIwBzD6xlLl3Bmk3o/t85rxE2B2zi6nmzbtSQ
	Ij3eJYzES7Zrf3CLJF6yTiwIPg/z4IR5c2M7h/a/oVkdRZzimm3aASU4fzbADtq9
	Os168NFT1TlHADdT4B86D6KDwFIILOCr0tdTYBHPC/ZMRB67OsisxdhGFfd6Prdp
	Sdi6SQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kcfeh73r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:43:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54734292aso135867685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060984; x=1747665784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djREPE0sqvYKUCjrqfcQkeo21X9ODx3TwXhEw7tG1QQ=;
        b=q+SvNiTdMAOYmFN2oEjYEV3s5CwQmyxNmsaPuuz17D48ybPku+sDkKEuObDr6Ayzpb
         T+pJDQSlvUFUZcqgnxTTGkGb7W/RLcG+H12cLSNex0jZobyOYrjcvklSTNotuCTcEwCU
         V9hPF6m645v7Wr1sjciv2bEjVdwRk3n8CQasSzOtMst2qsovmsiwTb/FCm67sjUDZCax
         EeA/SW8XlqEQYTVYt4SCCx8YEslw0lbXFImS9aDHlc7FWx+6JAIxhYgUiVd8gTingPqB
         ms7xixFLH9H0uY7LRJBsGTXp1qbXpIIfz2k6Fz/qpUc/wdwkeZ7kBgl7svcx2UIXGlPQ
         eM1A==
X-Forwarded-Encrypted: i=1; AJvYcCXSysvxNEhqUDCk90c9n9pZAYFt1I1HzZJ6hHdbNHf1MXZ1nlXc7MTYCR4v3mQPpb4uAT/drExyNc9QigY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTdKuY8FdRE8pBH1JYn1J7Luj3rHkTTY9I1907Yk7goxHGn+Fe
	5ueqMaXrSkGEpkzME/+dHUQHlnpWdgE/Qo5lbUTVw/Zhzq/mnEVnKwMH7s95yz5OKyRmGMrPXFQ
	asZ0N7FLtRIrsEX6deufVphcJDPJArFBTfe2c/+MIL60uFLnvZ5cOvAPQXx5TT+I=
X-Gm-Gg: ASbGncvU3bEYrZI/0qzEV/C9zFTUHVSmNr41Z7ueumpoFCy7UzdK4yhCLUvwfit94wj
	HEOLZuAd8Ml6tePOsAqdZ3UxrTTEKGmdEyH1NvGcyhvJXbsqbiCxpZAtINjUW9lPMUyKePOdVk5
	Tf0NO4AQ0yFiIiXnUnknjslIbsvmmFOi2WrkIKhaQru9ZXYtY7Lp2U8SXM8txix6b4Bhymhc+/G
	f7bPxbyuc1WE8ilx7xcMHEZmf3hgQpvGji5T/G2WU4aGXRmv5NipCrj1uLBXtVb4ErPqtcw+L82
	Qe9xq2Dj5jd8MX9ESXX31vo73RXwVoI/WrFqp5LKYcdxG38lw6wv7PEVOVsI5RZkUVQ=
X-Received: by 2002:a05:620a:24d2:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7cd011053camr814295385a.6.1747060983809;
        Mon, 12 May 2025 07:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWY6Cl5GMpMzeN8jV1HQ/TUtYeE13TFqO10nMiMdzZFvOrcbPNhOHTggYJdxF61Zyg9UNzUA==
X-Received: by 2002:a05:620a:24d2:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7cd011053camr814292285a.6.1747060983233;
        Mon, 12 May 2025 07:43:03 -0700 (PDT)
Received: from [192.168.65.222] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad22c563e34sm492121366b.137.2025.05.12.07.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:43:02 -0700 (PDT)
Message-ID: <83cf6202-0efd-4382-bd0c-3d196c4a0b9a@oss.qualcomm.com>
Date: Mon, 12 May 2025 16:43:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5018: enable the download mode
 support
To: george.moussalem@outlook.com, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250512-ipq5018-syscon-v1-0-eb1ad2414c3c@outlook.com>
 <20250512-ipq5018-syscon-v1-2-eb1ad2414c3c@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250512-ipq5018-syscon-v1-2-eb1ad2414c3c@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE1MyBTYWx0ZWRfX+eWt+XLsDi3y
 3NXUkQrkikrlxxwXXgLGmvOEjXKXJY7THz8ewCUijggZF2iqBqm+ppKHikGLlphezclFxUWeqNN
 ZTQcramZjk4BIXadfeA29NSClSjlD2QAYR1pztLJ1ih5dwS6thO+rXOwz8lg4LzwfTIJl6aP0pw
 yTNkfPBvaOu+X5mS1IncuZZswMLmqZmcFoGW2kxXMTzuxAh7Y6gDtxLoYpo3J1kr6qDPu1cpWes
 lnQYOFE412bZrTnsTVcfL7yb0i+wfyey33ZHhJyCznUGCjB1Uzt6GwaQNgqsObL0Y6CKpH3GWIR
 3i1jURmhivrgkyDc76fxmEETZYghRYuUEydtRYMqv3rS60W0Qo2toODwILbWQ1iLmzjbS1yl1Rp
 CTRre6JoW9uWqJAQI5xT9Bg99/fPCA5cxMYY7R9cR3l7hRjx6DGobglr53/Z22+CdhSkfp7U
X-Proofpoint-ORIG-GUID: JHMit2BryUSarLcKTTAZZjT4nL2POVmz
X-Authority-Analysis: v=2.4 cv=asuyCTZV c=1 sm=1 tr=0 ts=682208f8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JHMit2BryUSarLcKTTAZZjT4nL2POVmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=642
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120153

On 5/12/25 4:36 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Enable support for download mode to collect RAM dumps in case of a
> system crash, allowing post mortem analysis.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
