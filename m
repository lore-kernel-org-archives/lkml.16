Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F91C1E5B62
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746094762; cv=none; b=Xf7+d+i4sFsv7qkBQXoUnY9yWkiVMMxqCoyonVR97L8lm54m6ziIyFBLR/8Z7qfOE+YYfRsKHhstwP5m89JmMlSLV4i2wcPVrGbGA52S+aZWlNs+1nK8tmIBHuIb7yQ4zmfMcY08wgJKiKuwzsZ1ejq7eF11zAcS2t5lLUZjSxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746094762; c=relaxed/simple;
	bh=qcDUFQxHUyNZknUCKfm3IojNc+trsUyfhy/vChwE97g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jNsnz1ZI4ww3LbxQh7avC5cTziSvkiJJDvPuUh1jmsjvuj8qPNpddyjlCCss7aFDGvvDodPlemLCWTlIQ2T97O4PKv+119eUDdG8DfG8CF6GoZiuHBbait+qHwYljQ1O2SYnejf3cnej5rYTfByAgrtAK1r6JI25fUvGh313aRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTtSNLeq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTtSNLeq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54188Jbl014946
	for <linux-kernel@vger.kernel.org>; Thu, 1 May 2025 10:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fZ1XuECjDv+ed95P9xYwiZkwgD//IqgLjrzUycy5GAI=; b=KTtSNLeqef+7whTn
	2+3csjoE9lhUngLbSlY5MOsyzEf7/gPM0TIK3i2dSIM2WH8QW+DniuAPcMhoab0Z
	VwTuxXVxEHwDr+wn+prio/LhZoDJc05vezciKpIQ2+F3dXrJQgbCZjOZH/mdhCRW
	otqSwKhvum5BbcGI3rWbDSs/8j4J46yBdIok2OQJ43cpRt/RNdu8Rq1vmCB65+hU
	GL4mE0uqMHNeD2vuiRIsjbp1Hgelj1tjg4dLN9qCEq4qcDYN4AYyWjWukswzymlK
	O4cYEOgAj2WpDyKWV9hf3aT813eplkwgS+Ril6EPo3CB/j8sc8ACog5HmJiYsTnr
	69B/EQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubn1cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 10:19:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so3816756d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 03:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746094759; x=1746699559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZ1XuECjDv+ed95P9xYwiZkwgD//IqgLjrzUycy5GAI=;
        b=XHb7jYW/j9GfntKNkSrZx9d7txaf1eY2pYrb62Nh8DGfasAmDw7lXfFU+U4IT8h5AH
         Q+SClXrINgUEf2MQmzDvldODGlTCerw8sc0x+Hx3DgjMd6LjoH0qh4wrIMOvmFPG/RSm
         diyCXSZ4fidgN1Nx/GoKldJZWeRzgw8aefquLTsb/3n3UUJN+Qusb5Fi5kQCuL07l5mA
         Uv/OVYKC4FuwNHHmSbqKjJXX4HRSTI6wi+z8yL4ctkmvWhLPlMoVX6w/28AbOn+jwoZb
         3nbPV2xkn8c+GfWqbo918p+R+QtxHegC4RHtdFxztPFh5nfScvCMw7KkW9eS06lxK24i
         a0QA==
X-Forwarded-Encrypted: i=1; AJvYcCUdxrTmsgZ7LWSr8rLq9HDejh2x6dk529fkhK/ZV7pbco2vWbup7VyBrNnY4CMy5QfK0GTaqlyTR+pgRXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYCk+adO9yGm5Z3Ntw537l0lpZueF7mla9VDAIIPhi9lshhYl
	uPF3RL3zKmei0NtuQZEYuxJ6PUCLMsKB/qBS5AiaVmXqJmHaS0hrE0c4rNkTvNBNquMuRYVv0kO
	cjoQ8mCAuDTgvttZNZtlnWrXibsY7zJFaEYN4uuodvBw3jvHKlWckAp+nPHxM3T8=
X-Gm-Gg: ASbGncsKtc3Y421WP2bVkJy3CytimQ5kU/mjEOU6diV9+mIfga3L2Anc0dLdkgbol6D
	1jgB40mACsMcGZ8MvF3gWaGe/sObDwwhDEhrcDUpSoYgZJWJ/AX/mQQF2lMdBhDFIQNPekVBf93
	VvBIn4n1Vz2uFIvNsC0808iPPnSAtGDmyvly75InXSFQswI5oPri3Sh3MEj/34nUkI1gcAI795O
	N7d5peSIVB8UpbqVEQHgZJebKa25kebciPDOzmq9stjc0lsw4wIVNEl2/saaqr4NJIYXUt486N4
	Z9+dIL2tWjphz0fwo633STm4KxSOV1tbjUkTGJBhr2z9mokcb1+0fIlip4AZZ5MkZSs=
X-Received: by 2002:ad4:4eef:0:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f4ff62b7a2mr29343266d6.9.1746094759400;
        Thu, 01 May 2025 03:19:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnWkkppAR1J5LwLt/+BiVd+PZ/zdfpyrTEdEjDFy+FAitwdWPxbK35SmvLa0AFubP84Ny+MA==
X-Received: by 2002:ad4:4eef:0:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f4ff62b7a2mr29343166d6.9.1746094759120;
        Thu, 01 May 2025 03:19:19 -0700 (PDT)
Received: from [192.168.65.219] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da516a92sm19952366b.103.2025.05.01.03.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 03:19:17 -0700 (PDT)
Message-ID: <cd8c674e-2036-4fae-bff1-cbd3537b7bce@oss.qualcomm.com>
Date: Thu, 1 May 2025 12:19:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5018: Add SPI nand support
To: george.moussalem@outlook.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        sadre Alam <quic_mdalam@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250501-ipq5018-spi-qpic-snand-v1-0-31e01fbb606f@outlook.com>
 <20250501-ipq5018-spi-qpic-snand-v1-2-31e01fbb606f@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250501-ipq5018-spi-qpic-snand-v1-2-31e01fbb606f@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bifbX_kOuUZyhppPbsic39GBZspsSxiS
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68134aa8 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=w5towEkYDENzPYN5PyUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA3OCBTYWx0ZWRfX6NSIGlN2XLKp Phq0BnRd3dbJYRrPaXIjNp58vrteGazJ0VvOV+P3AOsQSWa20ooiQCd00G0jBgijPVdLISNz6t9 6quIBoGYV6OgGQ34t08O8X3VU5E5dPf6K6u0uDkvnplBFBsw0FB0VtTlIkWkRPWwgdL3BxoJrcE
 SqESaPnfi/BCtbMWxpeEP/sgnXlA4hEAVG3KDuyeo2+GtKj4vKF4KqFt7GUTibGsGX6iyafnxYN QB2LFfVAioPMi+eZTqnA4pIMOAxgSjR4yGUzscdO+dwIUWnOxXl8bCGSoGguVilln4Ut3jCfnJe BDIZp4fpIrjIddeFBXGh/yKjm1n17fYxS6lpIxMCE2dSKDWVck/tE3rhI+/C0eogItATgGtJ5YI
 2Oqo+wq7KTyTGoO7wZXkrY9xXfj094r9PWFx8GeU4NozJ5d7htU7aPMa0yOkvxWjCUvmd3AQ
X-Proofpoint-ORIG-GUID: bifbX_kOuUZyhppPbsic39GBZspsSxiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=721
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010078

On 5/1/25 11:20 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add QPIC SPI NAND support for IPQ5018 SoC.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
