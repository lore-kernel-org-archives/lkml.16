Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48A123C4F1
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746181801; cv=none; b=fy3dG1tL32C77QHlyInOx+d1cAOGQ9qhsNfYCQs3dPTNTbRMjKQJRlhFXEVkSPkFAR8V3bNaXt6lpsGrFfYRqbFl6U+4t/adl4ZnaSiESt0yZ5GzX57dxUvYwz/F7LfOYhM7A8supblNEpaxyRv40/PpuvBcnzIovpwLyUTtwFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746181801; c=relaxed/simple;
	bh=i7lDDRucUlwhNKwX/fbh3u9h2y2t42fMvoTgrZxh8fY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EifgVQg7gYXQKKBDF7CZULJFGTo/ki000jK4N71dA5V05kRT5Cki/5FzEguuyITCvlCJXfXEbIsJjF0HI+JgF8CIbwJsUW7/jcCQFiHuQ2jazq7vTymKSI6V4CIdrM3fhmaHIwUWPF7Vp9x86m/rOfmGuT5hXOFVB8TeZP26GKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1Gai6KP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1Gai6KP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NLrd010409
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 10:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Dn7fvn/GQzMSROH7cCLUoBJLbxJJYWAddOeCioJDak=; b=l1Gai6KPbjpr7o5J
	Hr3ZMqRKavmSUhCNa2QUgclx25l+PA+ZDkUUwmSv/bpX6CkpPUdOCmNuFbM3jLYC
	nqpoJL86ruqNcxZs3JGPm9deAxexS9Xuy/SV9HuXQWQiG5uKQyWKapWrxJ9QFpPy
	ZDY+c8jG6YBlQf0eAiKPYzR1BuKr+MIF3yr+uJWajlMla4WlMMXx5H8FrpB60d/o
	DMn/q2rqb0V274gBVqH+aO3DM+MeXx7sxSUBkBlErL/wDKT3NrcPbwxWaMJZ3IsL
	UpbjTuMX519ima7NKU+H61fuSuCDhSqyCV4AWspkRQWHx0ClM5WPYbBCYscuTzKO
	4DtUhQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubr1bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 10:29:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5466ca3e9so45569985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746181798; x=1746786598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Dn7fvn/GQzMSROH7cCLUoBJLbxJJYWAddOeCioJDak=;
        b=fJDfjzOFzeZw01GyX1fUo1gZ4jll9iyZ2H5RUfad0pBpMN7ZG6WgLvV/M3L2bLUK+R
         hGufKoDcXIn/hPTHeWJzwm1CY4K6RuPb2cgZXvBlQxsh6xYo0HBi4DwH0uxVr60NeQLh
         sG0Q/IMWDkRcMtBTV6cYBXNX2tRm+tvJ0VCrkBa/xN8KiVs2T2nlSJpcCZQG/j4cwWvw
         /bNuMyopAEHMzNDfJ5tfy//w/x+Ocn9osLiyTxCXzpVFMeN8q1HkpmEu/5QYV3ZeZ9oW
         JnLPPjwxBBL0E06/KvRVhnf/+YK9Im/xLy458/R9xv04DqQGuOxiFCqbDi9tDGG9A7bX
         Tecw==
X-Forwarded-Encrypted: i=1; AJvYcCUbdJp972Uvuphewb50pYIxtD+SsC6h8etpYEHBV3fatVrGLH013WRr1r7QzgEvtBl3YyIDW/uZgXAmXsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YytoqyHAguAER9LuHuwav9Ip4WKYIPxckGJXWlur4etjjMXC0GT
	2y0lUGVzoOyLQ9TvHjiiOnbYx2M6ZCgRcGzJ+9joZNyKPg1U1azqE/GYvYbWn6/AnhLuB8OWrT1
	Bymx6jHOyF70wVw8NQtggmOZSdXytZszzkXlQQUpl1KoZwQOCxVP/INybyBrAbjI=
X-Gm-Gg: ASbGncuNRcRSfBifXVmRhfVpF184RO0uMP69F3n334sEp+77cwOerdweinke4vndODI
	305bjvIs8zMIAH27ksGZaih8FVt7YoNovhWTFn8yRJhau5t2KXHEloHRVkz2sbBKqUgzvA2Nu49
	mySyn3P50j0jScGcAZ+BI+sMK6cD3W3vtM2KranmUFs7zkPGQVUlH3LLbneCiU35wbJyk81ppUD
	QPwSXlz2SACxxMrhb4eoymy6QUGMDLhfLqoQjbFO627vSa8umdOUjyz82MfaJdGX4lwY+GGbAsS
	t3rUdzA3jwZ6jqipx+UHezAA07DvTVZxOEYy8xPDR/2emlMw3qE+sP1uiBmvAMp8D/A=
X-Received: by 2002:ac8:7f8f:0:b0:472:15be:54ad with SMTP id d75a77b69052e-48c32ebec71mr11930251cf.14.1746181797955;
        Fri, 02 May 2025 03:29:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExpZCizKsiNGnAZGjO17fHH8yFM+oPe1mErUD+l8Dx92sb7vZcW1igq+h+lNhd+1RWdEMubQ==
X-Received: by 2002:ac8:7f8f:0:b0:472:15be:54ad with SMTP id d75a77b69052e-48c32ebec71mr11930041cf.14.1746181797657;
        Fri, 02 May 2025 03:29:57 -0700 (PDT)
Received: from [192.168.65.113] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914731dsm29461266b.28.2025.05.02.03.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 03:29:57 -0700 (PDT)
Message-ID: <1435b068-3bb9-4285-8399-81fc278152c4@oss.qualcomm.com>
Date: Fri, 2 May 2025 12:29:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: ipq5018: mark XO clock as critical
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-2-27902c1c4071@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-2-27902c1c4071@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8jOayan9Vp8NsMIJpICi76G0gcXUhDk1
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68149ea6 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=N5ds6sLAiLYF8mbRe1EA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA4MiBTYWx0ZWRfX+2ZC2cC3Qlkr NlrfY+iR7GGcvRC3DMZUFSJxSh0IPbuHxRL8G79CJpQLMppF8XksO8pChJOLawHV1ED5BKkNppl L1oez/7abmox2lOkDol3TXbL+b/SEtQluHwcvaezd1ev7gM81Ipjpi7LzBnNznIg8R4Up34sV/T
 zbgD/bz62olbdoRhfNqwY7gOlbX7eyQ1isrUgiVIb75lUmPA+nfNXl3nxV/Q5f1o9X1CT+61eNk Qb2kiGxa+YwUF1WU7iRQp+4Zv1GN+my6A4bfRILkgvzNOJLvgLzOwjNWR6+7e1yHDNhVOp1G+mU 4xHuC4gtUyz8XxY5MrqV6Z29PmkAQrLS0HzgKAF0W2OIRFObfX4Fbfl+vy3ZPP5KrQKmzJCTKN+
 e3alYzSVUlY8KhKEyKsYg93Lgn+a5qNcPHOI2W4XcXdqrPLXui6GonfkAeJBBBNs7fj64ozG
X-Proofpoint-ORIG-GUID: 8jOayan9Vp8NsMIJpICi76G0gcXUhDk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020082

On 5/2/25 12:15 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The XO clock must not be disabled, so let's add the CLK_IS_CRITICAL
> flag to avoid the kernel trying to disable the XO clock (when parenting
> it under the CMN PLL reference clock), else the kernel will panic and
> the following message will appear in the kernel logs:

Remove the struct definition for this clock (and the assignment in
blah_blah_clks[]) and replace it with:

qcom_branch_set_clk_en(regmap, 0x30030); /* GCC_XO_CLK */

Konrad
