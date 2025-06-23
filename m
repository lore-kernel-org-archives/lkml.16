Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F8C2417C3
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674804; cv=none; b=ceb+wSOJmWcixYmk5BFBlr1BRhshy7gqJHi4jES1REb2OC0sUnC70jhKoYs2/wpMeysB9X+omjoafxX4x+J+svNBNB2luxYXuwUsdGAZGd+XKA+T2WfyhUeEIwjpp67r1gT7ZDmk0jrBDJutDEzaAer8iIq6awoZPMk8PiGZl8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674804; c=relaxed/simple;
	bh=a50t6i0ar2wX7879ESe8BCD02vslV3PUl+14n0qOR+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaos4oV+tRrlNw0ajmbNhonVrnv0TZLkSgWxRbKyEAHqRxo4kulHD1zyzapR8FXooxtsPEkqu9CIr7hj0NweYP19HmdhdD9YWujwzd9v8ZnODUBBZBSufam8ev6kiYgzrniavQSIs1Ke5LuZHpbeocqBy3mHFkcqHEHPZDJadBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEW0xE/J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEW0xE/J"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9BR5l028297
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCmb85WVO/51E6pHDcfAo/yNEVZoP1t3GhBBQKdPtBo=; b=BEW0xE/J6nveVp+7
	BUFXPzGXWeaG/JO+/TLBQUMVrHzp8V/Bp16+NC0kaNZ0fL7tr5hHAgQIpvV+pLsb
	bgZj8YsYXYaHSyQ3Q9Yv+WFqBF4rG9uF1KX1SlbLpT8xU1YkWNyvNlXECAdSU/6j
	iXLw/znWnvv415x0WCkyWW3Ymb7fCWVNeAv5IFOGPsiEvUxTPJ2cGOV38kOPPdUT
	mD7zOAxi4oo40kOezB/eu/Qay0rk0czT/6cl37stT1GDS1WXI5MHAIHfoR29FoWF
	G+8+UitxufmkZVVW9hsHNrodAZ1cAHrcCe18bDvG9687HV0cA8ME1fs1ufk2i5kY
	pWLBPQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7tjm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:33:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3eeb07a05so57766185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674801; x=1751279601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCmb85WVO/51E6pHDcfAo/yNEVZoP1t3GhBBQKdPtBo=;
        b=H4HsGHiVGn0F2tM6WjHvYvwUIE+O8/6jZ8Uzf8uv35rvd+xsfRxtPeFfSzn/Ql1jdB
         Rcbi9uT4iATfMiFc6UiY/6OGvWVM2bZa110jzcW0T4i5540tlZu+Q+hevo0MI9fXdyIN
         LAKdg5toe5jcJg4Uah06Wipr7h98zpBB3/L05kuGABGx8krog6coLr75llF9vx7lFbfa
         ypUaZpf5iX94LlAfktYeK3YPWDo01wCIoZF6U++KXriTSjB1Jw8V/biFYiHAo5lhdI6o
         NUmAgvU6cyCGs1mjDoqRvhGPy/VgBeqhBafmkWgrrJKqUw3o6ut7+esrsWm9VLGYayze
         2mfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZt7UIWlrTWPnTo0GNGteiEr4oroiDxtD6LBwdBnu7iHv79voxjO2n0K4uTuMWQKuIY7mNhe+CmufqwqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNhM073I/81ZUMXzLBg2afpYHsorQJE55sNrfijt10uiFhzFhS
	5IZ5wgH8CZ8onEkG+aRgzpSPufTTJWU9DJ1e7N9KCQUhuIqjdCI3MRHR6HG7HZaLXhXjnBTcOLU
	sIS6oyWh+pR8z6eP6klCRPdQwb/4HtdYOcMlxhj4vNGD+h9BF/WcltliMCcyid2iHwpI=
X-Gm-Gg: ASbGncuuJEeDXvMaK3C35pD8ONUSeRosiyPjjrATc0Ptcz19mgoTa6sR2JkdKcwk9JV
	R0Evg/4TrYQ20rKRps0hHdomafvHj9eQjKoo1EzWblrdnTZgH5OUFziJdmflqrHOft1hDRZaZXI
	l2EH6tIpfxVKRV53tCVqHtpTyh5asncESWUAF2JLS7tD9dowxMdo4m8XZvFGZuHbYsu9Ix3NW31
	5y0NVb4uJkn0L5bIoVpT02srHgcHjE4JSpto0HoD5nsV3VSN7ouvNVqHHLUQjChwNeFCTQXfztt
	GcW8IS5zYpX5DupeXa7y7S8Z9hX1aclfFDSdQWRRaz53XHEojtht0M3S/3Z6HTizn8TBF5/WwJF
	/XyU=
X-Received: by 2002:a05:622a:8c:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4a77a208dfdmr74778741cf.4.1750674801065;
        Mon, 23 Jun 2025 03:33:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEln7ZGKKW+D+JHPZzQ0nxqJnJa2BYglgaPTSkAIb5LBz0k52R7GuKUBnLC2HnnT1pe5nkr7A==
X-Received: by 2002:a05:622a:8c:b0:4a7:4eed:2582 with SMTP id d75a77b69052e-4a77a208dfdmr74778551cf.4.1750674800631;
        Mon, 23 Jun 2025 03:33:20 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541bc9absm692214466b.145.2025.06.23.03.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:33:20 -0700 (PDT)
Message-ID: <f791e356-a24b-4db6-8d11-fd2c3211e2ab@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:33:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] firmware: qcom: scm: allow specifying quirks for
 QSEECOM implementations
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-1-6e8f635640c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-more-qseecom-v2-1-6e8f635640c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yKFXNuM327zE_rJrFV6JfZjvo4ovJ3Ju
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=68592d71 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_nksSFq5nnA09yPRHO0A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MiBTYWx0ZWRfXxOqh1j4rlExP
 9Zt2UJv9Ve8oNw6Ab2bFqgdCtNt1BvEYsRhYk3Cmp0MAo9pFir6hJGSsMkOXN83fiVWv7/o141w
 qe30Q+ZT4ZqDGkT7lAYh+El+iilKF5pgJkEHl2Xy9zL85I2Gx2FwZj/Ztsxf9BxVCYQWcR3ESey
 +qu/dZQj/B4R/7mkdPYSlyoXp6m2tg6GoWYRCE0GUlAcf0nOkrYxctYZwW37z+6G38gZFNn97ks
 bh4wXBVyM6/D65nftajtlu7EXpzITRzcfzkWHRaXi0aqsOaT4UNg6nmyYBot5Xbc6TXPT2wl9pa
 JzHh3GWj9ZpwijF78fcAeDV1LlJWWahirCU10iUA2EiPuSoLfMjvniGxqGzF4yWnaiiE7TmV6ZI
 dJpLp1CiuuslPQVjX7iz0MEgr5fVRtkfpXxbwYUAHEgIV+vpJWaN5OHO1xMzqVyf5CseIvHw
X-Proofpoint-GUID: yKFXNuM327zE_rJrFV6JfZjvo4ovJ3Ju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=935 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230062

On 6/21/25 9:56 PM, Dmitry Baryshkov wrote:
> Some of QSEECOM implementations might need additional quirks (e.g. some
> of the platforms don't (yet) support read-write UEFI variables access).
> Pass the quirks to the QSEECOM driver and down to individual app
> drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> -static bool qcom_scm_qseecom_machine_is_allowed(void)
> +static bool qcom_scm_qseecom_machine_is_allowed(unsigned long *quirks)
>  {
> +	const struct of_device_id *match;
>  	struct device_node *np;
> -	bool match;
>  
>  	np = of_find_node_by_path("/");
>  	if (!np)
> @@ -2020,6 +2020,11 @@ static bool qcom_scm_qseecom_machine_is_allowed(void)
>  	match = of_match_node(qcom_scm_qseecom_allowlist, np);
>  	of_node_put(np);
>  
> +	if (match && match->data)
> +		memcpy(quirks, match->data, sizeof(*quirks));

bit weird to use memcpy since it's just an UL

Konrad
