Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8588E2D9EEB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074537; cv=none; b=kHPF+fikX9hEpQYktVLe2bKa7nleaADCCKcH+3DQ/vm45ziKeLjn+RXfunCOmCHjAJgpMck49zs9yfTUKVWUntm2o5/g4Y43Nr+u5wyYTpmp3ty/ghWccz6WFVHKa6srCQz1vEUp3AdUIfgDM7pfelSjWkAJsLKLdWpiwMkC02U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074537; c=relaxed/simple;
	bh=BkLu9G69YJ6aTmB+TBQoxLmyA6zp2jPwmkmcQrVRwso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8L5oCyYEq5DdADodKL8pgep5+tsByrM7LQ1Rqp6y8NnmxE3oNvTBPDZylBr6iNrg/w6jLGj9BJp9xG3phDipjx4NaO7/InmmyOoD3Ywds4Dt/Wap9/bREwh56ihU+vJxJlZOmtsDJQDOUZKHfGoarSS0vQh15q1WxGM9svyl1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YifN1pJ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YifN1pJ6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8fgCq025415
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6/D06xxCqY75P4dZWCXGqoyMfaO+umun8VIYzdcz4w=; b=YifN1pJ6HD1J/n9j
	AaPRvdBiQOFAboHrW3b2mXp8s+caPu5judd8SqIzBymH93AlvCMaoJIzRgC2frpV
	L/ZxD5crLjFJ8pMZ4XRxQgFZMoGaEDx0OqYgnx+1DdKmG7NebernRiW/ZPWjYqdQ
	e7QgUsyGEZdTsp5RYWQnnRmoCYMSBDv0GJlthscd/rLBwM88GgWR3jvIXOY9N9FJ
	86fIDKxLE3l8zI6exRPLdOY0psXLqHJ+zso00j1Kg2N2do3SZRroSeFVtf3IDYHN
	JnZvCYWjEf7dNXduNRcPmwbRws96LLi+HCnkv1YvAxYDT9NWEubNMfmGlTuPkbv2
	Ia8ppw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5jxc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:48:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09b74dc4bso113100185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074534; x=1750679334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6/D06xxCqY75P4dZWCXGqoyMfaO+umun8VIYzdcz4w=;
        b=RBci6zea1xdGzgw4ctk3pZ9SOfOETee8UxkfyllSnT4DD1GU0wdhnPYCTFH1tU8npr
         fwCmn3W84KTWSLhOAkWBTjj8zY10USo42pZnCnPnuOsdyt3d2qA2B9vt6nn0286Who6O
         UpGozqBRU+3J8UBTbY//5ZOTVIBQb1p1/eddj0bsvfc5v/bernTbukpWDwc8/01qADsw
         9DX2+E9WNv4LFrt85hSVnJUnnujrIYyKXMK0tU7i1PWbL3qihrVPuN4ofEfP7vdUSzCt
         cB804bcaWQroyapak3wFXT3KXZk7QnayUlMLEv47rGk4+Vr4wWJPe3ubPbdCLRZy/K/n
         lsmw==
X-Forwarded-Encrypted: i=1; AJvYcCXzz3MFaY6H6RoyUYUekYLQEC/Pi9vj/px+sOoPROfoCukCO3KI/EzMGSSGCpKji9nTRl7Ul/tPjyJXw4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrXfDRwmOq6NH+1+iJ4iVYoZYRXCjjyn36c8cvALcAemv8dLvy
	aJNEV68wTm+Ggh1S/ZVQvNtP47fgrnrF6ncI6bnB6ekZtna2dK+2Vy3S9MnpAQFZE5LOMW8A+gK
	F0rAubP0zEF6IPsd5IBDx1d9MsDTRHI8uAG8vNlhA/mE0fIPs+cT4yIv5v9uFrdch4VMU9YK2dY
	g=
X-Gm-Gg: ASbGncvqoCTJQPkXv54oG9mYfoX1/+HyUVBwxsvsv/gTKuLpC4qt/ldDLCCy8QRUf2d
	4GPwGK3lyWzy4d8VbojqqGEOOOf6zdmyE1SXvT0oULIT4I5zU2XGd43ILbXn2ynHaAiqr3SIsN9
	GatPOFl0NHwY2llMG5kZSTFth4sc4AB3ckQMqhzHEkuxASZPTMxPBXeILVT6zFsJMt8Ys5A67gU
	ktubi7Lf6uT1wYpE/ty83EhUkBwOnvx/VmphkRomJ2xA466RV9Pe2oe+BFlVUDh1FjA2a6dwxVc
	ooWeJ9SdehO7R2YV1wZHAkDGOs5kobc9BNBV/jK/OdcZRWEUlgXclWYi1A0fBW5nRWrTl2zr0T6
	Qh4g=
X-Received: by 2002:a0c:f40b:0:b0:6fa:b8a1:abaa with SMTP id 6a1803df08f44-6fb473e4444mr59374986d6.0.1750074534178;
        Mon, 16 Jun 2025 04:48:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3/rMsOcLm7IFjSZLurpNjrZv8j9ZV89uGTTRbl2ahszQMIMiFTtrHi7mWnIkZP1XB0Jf3+w==
X-Received: by 2002:a0c:f40b:0:b0:6fa:b8a1:abaa with SMTP id 6a1803df08f44-6fb473e4444mr59374776d6.0.1750074533757;
        Mon, 16 Jun 2025 04:48:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c5c3bsm651750366b.61.2025.06.16.04.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:48:53 -0700 (PDT)
Message-ID: <7335dead-da35-43ce-8338-8383db948768@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 13:48:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ARM: dts: qcom: add device tree for Sony Xperia SP
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
 <20250614-msm8960-sdcard-v1-5-ccce629428b6@smankusors.com>
 <f1284637-7650-498a-b850-b5140c47e4e0@oss.qualcomm.com>
 <39a7153e-1a4f-4dfc-a190-3b3370646d47@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <39a7153e-1a4f-4dfc-a190-3b3370646d47@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gyi_Td4fbO8sHR_EHu9RJYTB2SvEOM7o
X-Proofpoint-ORIG-GUID: gyi_Td4fbO8sHR_EHu9RJYTB2SvEOM7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MyBTYWx0ZWRfX3qgPLdG//TIl
 qixjtail0JcfDjHC+Y6pnQiu1l9nqReiSqOsbLI5vkmKoAO/HFTmuOt0k3MsxnMimcsob0mo8NL
 iwwy7PknSl867Sb8TFAkwaeaseboahAN40xxFvSHvdU5HNhBBBDMPsJjViOiVHy0vUhvw+176lF
 Nbluiz5OjogCH85PnW9cGsHJt7zXrqOlqxwx6TU1pgHWcdMcELydpRpIvxuFPToalOIT+sJQ6xr
 apdp3N88d8QPHBWUhm3UfPO2RGSuvXNXmojkyf+0Wi7cLiJtWpFmHW1QlDfoDj8XgfymWYm9cXS
 0fPdZ4LO/Dz7v714EYr+HOBI/cLzcwD0Mkr2dJnSYXf37dV+RXn4w6LRS4bYLtZtFHToZFGcTPy
 8kyq4Lk9tyiGR76ni09rxFBS3+kSf+iQWdQInj2Lc9dJchxwwV9jJ4kaaYhvln2YS4RJZZ9e
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=685004a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Gbw9aFdXAAAA:8 a=2t8RrQqO_CiJknku0qEA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=987 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160073

On 6/14/25 10:46 PM, Antony Kurniawan Soemardi wrote:
> On 6/15/2025 1:36 AM, Konrad Dybcio wrote:
>> IIUC (and that's a 10yo range memory), SP had some eyebrow-rising boot
>> flow (some partitions were non-standard?) - could you please add a
>> paragraph about it in the commit message if that's the case, and maybe
>> include a short how-to on booting the thing?
> Is it acceptable to provide the pmOS wiki link in the commit message instead?
> https://wiki.postmarketos.org/wiki/Sony_Xperia_SP_(sony-huashan)
> 
> Or should I include a paragraph explaining it? It might be lengthy since
> I'd need to add download links for the mkelf and the RPM blob.

A link is okay in this case - pmOS wiki has been with us for a while and
I don't expect it to go down anytime soon.

Konrad
