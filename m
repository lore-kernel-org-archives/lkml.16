Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E50264A76
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454199; cv=none; b=vDyp0A5sWl2NiEr/C3/KU2nvXdeFTFTv4PtCRjccl3+4YTezUj1sg36VKhshxZfoOJ0cHwoRF0PCAlaIBAPNsPdBNaGJ35x9EBo50ZleFbGxtPgllWEzYdX/FYtz6WRqqWr0p+lrzg69l1qo+M0GODRESDZ74QV7taJujLOJLa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454199; c=relaxed/simple;
	bh=UqsOoiEtRgi2jrNVhPu8IraMKM1WqaHrnLwWkgQObBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncGhbRfO89LppTo0Y4fPAP3nREEeSZ5+HYx+QUsf+hYFNMF9v9ElnKSd8fmAiZeP3xEJjd3KwmTemCe0BuMEpR6cu+oh5DeE9KGeaPccBAO9J80u/PEK1Iyx7zd9yq1z2+298ewlGlP5ny/aZx0SIXgLJUT9Ts+VYOfmYjLbyuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOZImIpD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOZImIpD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626YuL8032129
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 11:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZ0+erNLxw7VuccyfYjtf67X1Uezd2e0x85nHdRkqBc=; b=oOZImIpDzQ5d4D30
	AfrRTjcIPEq3Z08qYVXJQF1qDlcB8O3CKRwR9qQaPLEDxWfdbu0d+XhbN3Fr4hXa
	pgqKNrLyujH20Kr+A5zoKjOnCohjAEXmdB9EG+gYDKg20N/p4JsMFedsljJVbH8N
	YdIeKwuELqtPJMplkT4/OkOoK6d6Y6Bs8UR/8siv5IBE7ftjs3Fkd1aXFrJ5cjwR
	oE/CtlvBTKmug+LTMvbPCjD7soNQ9xhUp3svfvBhiUAO5lv/QFDOj/+KJUqw8D09
	Lf1XtNEh1ZNorFHS8pzQxFg9iGDKQeUFwWHR8PExmXfsOX4fh3Z0yD0f5ODgl5ys
	UY9NzQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kcef1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 11:03:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d21080c26fso103257385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751454195; x=1752058995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZ0+erNLxw7VuccyfYjtf67X1Uezd2e0x85nHdRkqBc=;
        b=izsTD7+i/Ho8vS5d6Zh0LGRx+sV7lNqvvth8UZNB3eKODuUieatSX8YzgeXFNWCG+S
         5k95BePo4M2V52do1bi46qV0/5Z29oZJLd0NLw0RicyWX41ZWqUBu16jm5YB0+EVmlQQ
         EpRSMKhsWTtZw9Qx6AxRREjKXlC4kbg/oxihtbZVMhWvvgRHCIXrT/3lc84gHJXo3RUk
         mixlj3qVWFTpzJhr7wKwOvoGKuJbMeFqwEkWHDfqj8DSLdZMMv2ftzlVlFgEONE4TeI4
         2A1cCMastSVy5FXtiAv6UGdvML58HElOPscPYjO97FdE99AYRNLnTTVa+HPr6rCLNoGJ
         lIhg==
X-Forwarded-Encrypted: i=1; AJvYcCUwBurGSuEYbSUPEdhD2K7LnTaXDqZZR7pGJtoqkA2TZbMAKAiPh/fETJVX9HRQU6j3t6083hxCKIwPHuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNgDC+3g2P2X4yniDBjI/dtcHOXdiiWoHVC7QF9rrBBco+9bHa
	18Hyg69IZracUkyR5+bDxOOi4QThBGvOVUN092j39JhVMFOUSIWVsMGm9gtxn2mtQW/T+/VAruz
	ciuQNq13ncdyHMvUTNfhA7BHW0a5VRo2OhiX65cQrbDgWlOfAGxcGfqvl7GK8XJeEtFk=
X-Gm-Gg: ASbGncs+tKtisrNF0mLWDe9Bbo0OQs/tk/8IfTdm/kPdq2vIuOffwhHW9SXYiK/qUtC
	uluCawAjsnETaoqReNGlRhm7XF5THPr3HT/52B0aw/sgTw/fiRvn7+ItkeXWdZi7smustwhNOQZ
	1Zg3SYU0u3MutlqP7hVdWPmLSy2gcTJQzl0rJ1OScQ06wJLXzN7h1RzBtT01HR1bJVLhSjHA6wj
	o8JZjgIoppy/bySIGJqssClht/NL4ax2Pg4ynuSeTcatEzgeLtMp2K53YMO+5NCYXkITpKfBb04
	0UzHhhVRuZjytd58p2joPlUPw4LuSh+TPz+FGax+Ers1fMtu5lDojTkOjLAAVn8J59YKANRS0Sw
	pPFA=
X-Received: by 2002:a05:620a:192a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d5c47175d2mr120700085a.4.1751454194966;
        Wed, 02 Jul 2025 04:03:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJmVaoky9zcbK8IX4+0F2FowsM3fLObjXG5U1FlDD2lNhegepSkRgmdrUwoNZH1FaJWrApHQ==
X-Received: by 2002:a05:620a:192a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d5c47175d2mr120698785a.4.1751454194496;
        Wed, 02 Jul 2025 04:03:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290eaefsm8869551a12.34.2025.07.02.04.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 04:03:13 -0700 (PDT)
Message-ID: <5a58fb6d-8ddb-4835-9da9-4c449825367f@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 13:03:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/5] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=686511f4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=FT0SUlyUvFbnnB8yFIkA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4OSBTYWx0ZWRfX2c3LKeNc8CdG
 qw7z6uxaYbklsf4Tux43WLFwXVAdfcicaD6Cg+uJQ23qjn2jwIVUUfUTvY0YXjGzYR5L0XIGLSo
 OSsXct/xqi3+goxR5+y2e9khf81Nnv5S07ZZkkWqY+k1jDtefOwsYkSd0HyfBpmvUQOofgNkz6X
 l3fSRMTuiPMCZvT7TOtxFtwFBL+k9FDHh4FFld0Hs74CfpM3WQ6yq6tT6/juJgzIpZctrJzwZuA
 DefPthk8+Erxu+97s5S67aONqgdOnxMh8nIGMokqV7Z3ul97p19rUCuYgOJHkiHiK7WPdpdc16o
 GIvMCHO6wPWW+UgK1lJc0/k0yhT+F+o3d+XYJVnDil2DNkCP/bCfaEqUaVyB1uzNgi+tzmO6SmP
 C9Y4oEVtiCjaf0r+fdOQzPMWYh1fCDG9O7WSDM38wOYM8uFec1h/v6HfpTAI3Rwwl4mX8N79
X-Proofpoint-ORIG-GUID: 6UFL4-EBq7WTQ3D_CXGukR2RkYN_RdfM
X-Proofpoint-GUID: 6UFL4-EBq7WTQ3D_CXGukR2RkYN_RdfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=764 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020089

On 7/2/25 10:45 AM, Bartosz Golaszewski wrote:
> Note: this really is an RFC. Please don't spend too much time revieweing
> the code in detail. I'd like to figure out if that's a good approach at
> all first. Also: while I tested it on sm8650-qrd and sc8280xp-crd, the
> last patch cannot be applied until all Qualcomm platforms are converted.
> 
> Problem: when pinctrl core binds pins to a consumer device and the
> pinmux ops of the underlying driver are marked as strict, the pin in
> question can no longer be requested as a GPIO using the GPIO descriptor
> API. It will result in the following error:
> 
> [    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already requested by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
> [    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100000.pinctrl:570)

I can confirm the above no longer appears on the same SC8280XP CRD with
this series applied

Konrad
