Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE276188715
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860658; cv=none; b=exUbAbppjjX9KY5IqT+URlVpF83FgW2L6Doc6l6J2b8xXXFSEmcQsN1FyzIKbnhoF1A/PC9eFsD+GfsweQUX+p9BuQkqJ9A7ny2reRulcLktWvWSv/FKnbvbNHcfU5qTaAzWvje/h9liLFXT5VK8pIvV7SC2CirezE/CFVVaq5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860658; c=relaxed/simple;
	bh=+FdbxM4aj9mP1SbsToRhZ6+p2wunQxJNdpM0f3ThoF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJKlfozywHz/3En697GsPUJRzX/gm6aSPSwci6Z7+yds+ON1xjiE2iy3eLJgR7/TM6c/xp131q1wBsg7D1mv/PyUuOhAsAr8XnX42XJRYKD7JN3kmRqk9CYL5vXOvdPXhTfIoMaJPdhOW6f3HLGSjG/wb2gRwL76/P7L8A8ZX3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8GDHhBK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8GDHhBK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAJ7XW026920
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GH3vwxnpiCDejx75av7WZvVu6YLOFj4inA7cuWsbOD0=; b=P8GDHhBKPII7EA/D
	1VVUtNIxN3Bk31LVm9XY1lByXYAke7TVpufloT/GyB0evkC6Q72Pa1iC160hVy2s
	HRBjgkygLoAVJSGaFwvmH2HJJX9EwSLv5HY4HysCkPalXcJ9yGkINJd9hQ0ITDrJ
	Rtel1EZw20v87D1qg1mfPrIc3F+ePV4BWNRlKDEAKNuDGeTScKAc+xAFVyLpq8xV
	N2a27ufS5ZjHX47UlH2D4wDB8qt7ISjG4NEd7iCerqlNION5tJ8DF7B2qOjMgWvX
	x2NVaqDkvJZKAGuPyask9A0pwqUVYY5isaMwySC06NjCExEzpnc0+IHjjcRCntIQ
	9BiaCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqpmar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:10:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ba561898so115730785a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860655; x=1751465455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GH3vwxnpiCDejx75av7WZvVu6YLOFj4inA7cuWsbOD0=;
        b=xFzpwO0eChhK9EWjxikP/ZE8WOIRwjXMxgHQvLXS9mgfKyOWLB7l4ray7o2Q9/52AU
         F0QJTX3gjHFvOY9dai8DWE7zi+Hdn1ZKX2ekfOhJ/F5mn9sJihBXjVuPydWgwu/6JCQQ
         +8j7jFUhrBBBCJt5iNkjFOws4SZ/Wc/5W+Ua0bAonPrNJgS4LsuEL4Y9ugN8aXAXebEY
         crEt5ijaCcnxxL+a7tw9pbb1DG5y5WRQ43N+YW5Lj3GOsagVt11DQkgmBSyV8/RdxdLU
         THDEeRHvpob+OxKghQ4zDvZ4a63KbBJUZH2ItB9oC+dQALYu8Oxs0kNJmlWTEfuBpoXP
         mUVA==
X-Forwarded-Encrypted: i=1; AJvYcCUg+PAQvZqU11ELalLzdRn7dUxI3SASWtDxmYGouz5favQB6oX6RqqfTkZAbUysbluYrr3NffskhnqYiF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+8EdGIzZ0Yd6xluDGrNIceZ8ZHxQ2I3oTJrCetwBHOrbsGEt
	OV1HZ0iszvBI71bjsrQdtCT7Xj14wAB48D2XWDzeKc2kCjzVXf6Dh6ZVjs+HaXmMSa6BtzLICih
	sg+U40K8C2DCwdSs4VYQFdUnQ2AonaeakLrlu5mJDqyDBx7DbFWjkBNcnrqtMEmDL4DY=
X-Gm-Gg: ASbGncsa8yUHQVclBD0xBAWhMXfd9mcL9hVSvyUf9KaH5pTo7Gpm3wVYVq6fGVp/dKN
	osfih2CmZ+7Rb30CAg3ZcVuln3MNSoVA72RgfCz8ovgUk3MpToBF+873jZDX3QktBJJuLIwCOvG
	sKg07RYLYJUmZE280+Ft72MI2gvZL30caBVlo0El3eICmBNNKHVzA1diPAVPWeF1dxGmxfG7/Yb
	jEhlqJCb+QjniljjyCLUPfkbgPg3VPY1QlEzCLbQ8bCNuUb9hqUiU2N5nQO2pI+gR/vrTw6aj8H
	N9pGybIY4dsvTGjpXYZjOdzcUz74OoJatAEMJFqrF0s191sRTMZ3K7kpNoawmWwJF+e5j7iDhjP
	5lWg=
X-Received: by 2002:a05:620a:262a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4296f1b05mr137898385a.4.1750860654918;
        Wed, 25 Jun 2025 07:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuHZPwG3CWK1H8PipoRERIswBPtl9pbQ0/GnK3KT0ahCWSysQdAWxntYw7bkWiIkZnC0WdcQ==
X-Received: by 2002:a05:620a:262a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4296f1b05mr137896785a.4.1750860654390;
        Wed, 25 Jun 2025 07:10:54 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f197574sm2568630a12.7.2025.06.25.07.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:10:53 -0700 (PDT)
Message-ID: <bc27209a-e0f8-40bf-979f-3d747c501ae8@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:10:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] regulator: qcom-rpmh: add support for pm7550
 regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
 <20250625-pm7550-pmr735b-rpmh-regs-v1-4-cab8ef2e5c92@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-pm7550-pmr735b-rpmh-regs-v1-4-cab8ef2e5c92@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7UBJab_C5_lHbWikFofb0taLgCprLAkS
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c036f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=DRLuFLMEli8muENjmjUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 7UBJab_C5_lHbWikFofb0taLgCprLAkS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwMyBTYWx0ZWRfX9gUASjsNrsKt
 e4D6jBhB2U3srTIVYRwBAEEDbEEmwz4DKES571DczkaURsoU75xLh5G8pJ2ChBTXGAFR6i2RcUJ
 HVHwQhaYITCMnZGerUek2+08tCIhm5tV3/aMF+3MpCHoF1oaWT8pPj88Dlfvm1R/R/D/vKCG1Mr
 OP/O5OGgjxxLRnvC3iMgEShqp0ACpeNd9Plir8DLk4iv45Itn3rG1Py+yVv5PSKiMxi8Gf02Pj2
 FxLF5xWsrY2jswYarxPTVqomFmwIRv2jkaml4DfZp9xUBFpDhBfcybbhlmf0fC9wW85ZBEGRj39
 tEIzoKGgaLUmLDC8e+DziwCki0DtqBDpFACzmKP4X++lo/CFPStIN8EdvyaiRW3EwMd0cJBIOZ0
 HrBzunvg6ugWjPQoPGTcFUDt8+TfwYraqJKHfCCQQ9MZ/qbWTErzXvkDP2y7aDr3Zead7RXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=909 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250103

On 6/25/25 11:18 AM, Luca Weiss wrote:
> Add RPMH regulators exposed by Qualcomm Technologies, Inc. PM7550 PMIC.
> It has 6 FTS525 (FT-SMPS) and 23 LDOs with 3 different types.
> L1-L11 are LDO515 LV NMOS, L12-L13 are LDO515 MV PMOS, L14-L23 are
> LDO512 MV PMOS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

FWIW everything you said in the commit message is correct, but I'm not
100% sure how to map these LDO types to the existing definitions

Konrad
