Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20A17A310
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846631; cv=none; b=gfe0ons13kXLb44YlJbJ68DNz0BlMaPfghW5gj2a0KshkWrgfgB39cMJV3zUUJirHUb378QzbvpkIvZEAKLBrVqU+xVZH966AcyQgCXZL3Ns1/RsLzT24i4j8brdzBewSnf1W9KolmRPFnuIZxKc/1XmH7dUUqAFKaatGoWyt/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846631; c=relaxed/simple;
	bh=N+R43E/1GfThpPsMXWgpoPu8TipZoSa08sDYQEh3dXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FpJoVx29CGatBTFS7onUZPCZt1IgyiAopqFr1tdh1QDGVHU/JZVU0iYG8Ne5+zU2MDgA4dDwFc19TKZfInIWoYTbCA7G0Y4zlhKYXZuawr4bCGVFBf9z9dyPrZTApnFmtGVV3qUi9AApHQwiITL8LekzAmud7XqQGgxBHgr6PfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwHd88Bz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwHd88Bz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XJtn013430
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIq+1JAfS5ENiun1dMLKC83h/in6cMIXd2ivDAqCPHk=; b=iwHd88BzSUv0Ldw6
	N0ARTR496xyfzKwNSgf4I+P9ihsCDM5bjBXoANJZwzmdoCd5+cGl+pJ78cHXPmcX
	9nrgOJmpaFwrNbnBzyfWrWrqZscQUXvFu7UP1nV45VMpoMgTt/UZ1cTyxmkh2lqM
	sLP3HnWN/pOjuGXsm+TlLk0TQlqk5mU0eL+4oO2MiGjFgyVfgqwrWXeUI7o4qCvJ
	dCPP0koacHqJPwbK/x0x44QtrBh3bBNh3sov1SFBqnPCXvWoJgK8P/jDt/iuzHzA
	sqIMXQ5No9/St+dsSu2ye1al7sPwk1enEHT1WO3bzrDHmQ9gP76rc1sUz6VWUSkl
	4cTHBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5bqu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:57:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c552802e9fso176595485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846628; x=1748451428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIq+1JAfS5ENiun1dMLKC83h/in6cMIXd2ivDAqCPHk=;
        b=F+CquSrYJF4KZ8P2S2RFi9cYS0MGiMubKhof+Wr04xDBvEb13CEsSLbtMGsDfCzhGr
         gFZyb5hiaZyRO2AApbKsZwgAVYSU0J/gCp5ly3dR2kctcI649udw8N1GQCBj0B3Z1/8F
         RD8102qmpwt2OkAM6ZnBYQgVyfOuGHSdxD/NqIbRz9yJwjvHyvbWZx2AWClkkhqHgf6j
         /VtUv21TRPARsiIQ2JLS5NP3OAf7xV5AdZUQ3meK0wdiLdQaWOBOG1qFEZERKxKLX+9w
         iDC+USqDEA9g8eSbtT+pj+PHZ9wgNoeTIpNraL8DE/IHdOanX8pzIh0kwXYC+d/bhX05
         FbBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSEVoVOkhIzoQjfHhJE4oKdvRGkwp/5gMgp0AUl83KCQcIeTWMvKUCfM4R8ssnOHWxiLIX8hALakH2mFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMbQiM1lxcdg4854LNwUCip7pg/BbbWhkIrZU54s9yB7leHoQB
	//675VkY8G2P6mT/ucizpc1q23ZPPwPVh6JsNv82ILOwE1rHW99+c+7LhhyZNA3loyXPtwBfcOP
	XGMxtvADD2/oYprixgx4GhBqSy2/q1jkxhoWeD0g9SYqLt6lbV5doAMEbwD7nb4mEBT0=
X-Gm-Gg: ASbGncvTzv1U0bgHy5VNzAySQlLzLjfHmIVD0kQvnfggfig1o4sqqvfbNfpsVhoR4WJ
	ZfTDjY6VO94seR7b9XctNjmBlpSbTpI53K53N+6jwUUJ9ZYDAOAg4Ql7gQJpI3lrCsTn1ZYFk0T
	iiEy8nTUQJ8NDnPeJlRx3iqN203nrV8RM26jW0nDvAuJG7DIQhyVdZLvtwdwYwHzcsHIDzA4p6e
	V19orlmzqxIDTjKzmVM+DcwcpuOn493XU11yl0rUYkM7Ej3bZYllOlN8151fh3oekirnGhA7crB
	2yQC0zlZ82Gcr4RCs1BP47jL4yhXxMQEu30Du9fGh3kbgeebSFvDhHaV+A3HGlTPFw==
X-Received: by 2002:a05:622a:1444:b0:471:ea1a:d9e with SMTP id d75a77b69052e-494ae3f24abmr123174471cf.12.1747846628110;
        Wed, 21 May 2025 09:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKquZCYn79dWnu6RrKESmOaAIB/1rycWKzBH9n0bP2dka2gnc6zuL4fmyd5kx3cDGfaLk9HA==
X-Received: by 2002:a05:622a:1444:b0:471:ea1a:d9e with SMTP id d75a77b69052e-494ae3f24abmr123174241cf.12.1747846627791;
        Wed, 21 May 2025 09:57:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4e8afdsm933402766b.176.2025.05.21.09.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 09:57:07 -0700 (PDT)
Message-ID: <3f3d8c46-e7f3-42d1-a186-29a034d509be@oss.qualcomm.com>
Date: Wed, 21 May 2025 18:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: Add support for qcs9075
 IQ-9075-EVK
To: Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
 <20250521140807.3837019-5-quic_wasimn@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250521140807.3837019-5-quic_wasimn@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2NiBTYWx0ZWRfX4xlrAnrqcqTX
 JWYnpGwPc1YxDnpDra/XRKJD4CI7z7J/ZAMS3dxP2ero9SvG6UZcBuE3eQSpmduCQ7sFbl1YEQW
 aCPGEKmfhTOjf9vXu8AI8BxgtUNfzj/TI9KpmAVBojX5mzcNHwhO+2LKjZH7RTEn7SWy4XM8B5O
 6fXLPHqDOnJWfiJJX6O926yNsN6MkIOj8re4OLghiEgu4F3L5xgyVS6nXOisxC1U/mAgg7ecj0m
 s2HHdwB509nNZVUvUZLAd3kmMvC/g3mQ9dKM16nNZyGzpp7wI8Qbs6vIwGn6CzirliVILBV8GOt
 1xYGImoJHiyQAeuKE+WE5Qc9w5Qk/dHOshV64xDfMl4/ZOA66VlO/t9uGWpEYlNjJIJ9A34CqIO
 5XWXlzwr40Wa0Ut7jGr205zbTMI8C2FIBKC2VOKCIjRk14ERbZVbDaaAvM99ItGpiYG+ybRA
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682e05e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=B19ug8NEUztSQfbU-jQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eku8rKf5GTf_W0djSvHJID4FkC1b3x8Q
X-Proofpoint-ORIG-GUID: eku8rKf5GTf_W0djSvHJID4FkC1b3x8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210166

On 5/21/25 4:08 PM, Wasim Nazir wrote:
> Add initial device tree support for IQ-9075-EVK board,
> based on Qualcomm's QCS9075 SOC.
> 
> Implement basic changes to enable boot to shell.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---

[...]

two nits:

> +&tlmm {
> +	qup_uart10_default: qup-uart10-state {
> +		pins = "gpio46", "gpio47";
> +		function = "qup1_se3";
> +	};

Feel free to move it over to sa8775p.dtsi

> +};
> +
> +&uart10 {
> +	compatible = "qcom,geni-debug-uart";
> +	pinctrl-0 = <&qup_uart10_default>;
> +	pinctrl-names = "default";
> +	status = "okay";

Please keep a newline before 'status'

Konrad
