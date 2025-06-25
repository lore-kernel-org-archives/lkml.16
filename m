Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BACA225762
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852887; cv=none; b=udBVzBBbc1mLpDnhD42rcNyP9njDo1yZNNmJpU9Xsc0/ymMrZa6TBqTdkI76BopTNdPIAUD7UtTFgc3kU/W4M/o6hiSnrTWzGSiqE7qoEuuKQzPsmgYF5bG+Q7y2ZxVOLTmTFK4oesLtAxXsZXDn7nRofKwkN/58DSAYqVzsrWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852887; c=relaxed/simple;
	bh=4zQ0UL1wqdDM0i6fhX82EgPNJoEiVKpXy1BKVN1c4CM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ce6inTUXR87efVkikFOF/ySPVz2JbpaXCFGETAMgKUEZV0Yz0j71ms7yyZ4EdIxzmagDfeX/fblZePapT6JcKM6XpD2wD4F6fN0muu+DEitlNV8X77X0GiB9HUcwvQgKoseWygUzSTfgL9LXRe2IPgr/GY0DBgRfXNx1qARUOxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbOfQnnA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbOfQnnA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5acOL015282
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8OEorVaCRE0cXO8xBCXvfigA2psQBauzIpB05z6ctJc=; b=mbOfQnnAxMa07JR4
	c60nDr78GXjJ4IxNRqr0QCKexEIojCMFnebeW4VmzD2UI0+Wmv6oL4igCUhUkcgn
	8dQljTCC9Eb2ghucMLXkmj5cS3aZfUb8UBCYBQp42mgiC4M321VJugWaHtJyO2T6
	9apd4bEYJQCCd9nqEcQnC/EkVpvDb3ftW0IIFu5Dy9UWSh7pbdnYNl/qkpp+bJv1
	F8b/YWkGGIaBIctBuKi8xWZjiInn1SFdEIOfWSomYd1jQpc8DEzw+NTab3kKOo48
	OYayc/oYeH/h88p4Q+PCvQ3oi/CgGnU2dTrmD1W0o397uhLO2JJW3hWW1qFres6y
	qI0L1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4ryv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:01:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d094e04aa4so193227485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852884; x=1751457684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8OEorVaCRE0cXO8xBCXvfigA2psQBauzIpB05z6ctJc=;
        b=poE/QHz1Rt7jkdnG3W3Qnu+KZuFfarkyg7EMyL89Uc4HxLukBXQPjTcE/s4BYyYlgp
         JoeqEQ9ydEEp14K/q7Rca03no9q0+g/iufntWc7ps3Q+pS+LuZFjXK7KSG3TIt1FvcE2
         m1gIi2ZvDe5PfxAOM0W38wXR+fvGqu9ZseoYz/6IA8AP44wHWUEhK6WVI4wOih9kU7pe
         WbeDse+UICjdy7/1Zg/9UUlM/dbb9IqBn6bEI8MENycMX9rvsKaP0Wa5T33BSgnn0f1A
         /wY9SCknqE388nuhdStrgKXd41cSreCZfsZ327qVSKz5/cX3Lswk5CuyWtBEOjxUp+fK
         Pjfg==
X-Forwarded-Encrypted: i=1; AJvYcCUeH5cFizNoWzxpze3O2Q4Lgfy/Fk78UcSVJ6V2RyFq9TCYcuLhId+B5+WZzZbetDFC6GcSZOpmhB7Jb6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaha6eYSFuO/l7N6uq46py4qdVU+mc9AQb2lvkoHeary9vP9g5
	/u9pu5cIXEeJTlHqlRVNuAHBEzhwXcBpeo2ouAPx/dumFW1bKUPjiArrClqmkF+6jAHmNkmJwQa
	wANN42ylEemH3F0ZWTEmLTweUrvecutGEEYb8KEhSVmCuJOkvjWavzIrmd4RICWyEKmA=
X-Gm-Gg: ASbGncvUoMDtEYQ5k69Nk23Z+Ddc7GlbRPlfhbxx20g2HIQF9jASS2QBVZhMcfhA1JM
	MY0PzIT85dV9eB1mE4R8n5bZg2AxxXQcpNjFsng5xBWIq3YmEW1WHZlDD0S9rhmTJeIXIByHH7F
	eKhU1x0rnpqkacdng7SmcL/XkxIDPYHmD49lOtWfWpAjYA4zie5Xn3lXPGjfOKg5w6VEG9FghNb
	Z9w6rFl+JF77rRrll3ouLkIXrlQw4bE8EH7ybvnDZjpqeDDlqO90y3eP3lN3iatAkgkVyvdVaA3
	jxPROqmRKATEKsfHvMSDb2Yac46yDR7IgcuTbQVqLUhEPMwiqp9IP2QkhbO/NT1bHp+btAK5i+O
	Tvh8=
X-Received: by 2002:a05:620a:2b95:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d42969a198mr110761085a.4.1750852884101;
        Wed, 25 Jun 2025 05:01:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGKSvGYhxFuziebMeRs8lQo0eQVL8Cuz4WpchhTnfuGoh6+aLI0eB7yKb5Db/OPDNfTIWH6A==
X-Received: by 2002:a05:620a:2b95:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d42969a198mr110758085a.4.1750852883399;
        Wed, 25 Jun 2025 05:01:23 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209b9fsm1028312966b.161.2025.06.25.05.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:01:22 -0700 (PDT)
Message-ID: <4e44b98e-4141-45e8-b4bc-9e9dfef4b544@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 14:01:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] firmware: qcom: scm: remove unused arguments from SHM
 bridge routines
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
 <20250625-qcom-scm-race-v1-1-45601e1f248b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-qcom-scm-race-v1-1-45601e1f248b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685be515 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rJ879oiodxo_ZCWU8swA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ubt8K7kEdqeS-mIXPB0Xkbty5bfsBZMN
X-Proofpoint-ORIG-GUID: ubt8K7kEdqeS-mIXPB0Xkbty5bfsBZMN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4OSBTYWx0ZWRfX7xarvEJKrxO4
 PpZ2T4u08pCKlr+XHbeUttvoNdorxd9Tqt6VD5/f/hq5SQHLAcQ3hCNYNqNDxPXAb6m54CeKoSc
 WhVYGkNSdcSyzhpLaYsodTT2tZzVokVsa9qK0hvxzJpdJ6jKrQIXp6Imeg30DDAlJS5kwx0SxoA
 xmRg/FCS+u99MXbsOioSvnRe4JpVFef2DSATV8jnaKIt65wSLF9Gfi4h22VMVo343Zf/EIecV+9
 UGdzUbWIUywOqKTztMH8GU4T6UF+f8Vw5EvChKRf5gNm+mBHBbrgtzO/ZGzu5FoeVkM1FQF4wMf
 ZYERlSFLgVUtQywfbktWJvOInTOeZh5piI7cHq1KmlVHsSbkXBBvU7PFPZymeqeu2nxcLBIdr6G
 iJC34VZoX5GbTiUTjYQe6+d3oh4ZIVmgQ+3bw8ofD7LSFJ7EzYvQaTdvLUoTA6WAhd9Cw7n+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250089

On 6/25/25 10:14 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> qcom_scm_shm_bridge_create() and qcom_scm_shm_bridge_delete() take
> struct device as argument but don't use it. Remove it from these
> functions' prototypes.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
