Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBA823507A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009357; cv=none; b=XwQK2nk+ow97mRVZRijC+P7s3OJr36BgyHLXGSduuF/bmvrj8nBQihFPKGFHE7AJca8FooSpvn7CEqAX4ee2HQDHbkCq30EGGkFQAJE/yOBJJVrMasUFwCwDj2zJNr6BlphSibl4UZpD1Tt8BFwEjN5w+0X5n5XvhFO8OEOpnnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009357; c=relaxed/simple;
	bh=1qKBLvY/eYkZ4HkLzjSBXa9LYhTcMVE86RoGAwD58HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKVbj0fRhtE4LJ9rE2QOkQDpzvyZCTED958b/5adCFqltAax4LcM2ID/ZcXazhCfIDs2PkauqPpwOLs6B3DN7svuhrLYZADzaazFnUcC4E3cBHMi/WGInhqStGhcJUGNx+0bRvFqXbbhOWdRrFT0iP7vOgWHDsUhh92/w9D4Sds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNMaMoOl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNMaMoOl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9LnOa032422
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qIplIxVQFRQA47SBpjXsBem0pTeYTZkJKwbGOQPx6IU=; b=cNMaMoOl/c8zaL6m
	rn1oFgm/tjezYbC/HCG1fxpcelw3mcGn88nHmYfH+vy/URLy9N6Ehy0H/BZZREFg
	uW9dwI9dMDwAF1y3SCIllGJdIF7CJNAbP1wgk9a33lxw6B+VICxvLQnZWHEElABS
	9vDLmjy4oWxoJRW55eP9QqTpRAIHHGZXW/cwRI/2BSg47T+Q1Hoffk0ZeO3ZEb+8
	XJnn21T8aeLiQHBBoVSRWxZ4ZZ8Ou3pjtpIqql0Iby7ee7eukclBHJHQ5WaSoGeM
	tZAk79tGTrRV3IK9BjP20E5eMD1J05QzzVeUCUxWOnmG7KvW180Zkw4+twcE2eST
	VcPqbg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u29shn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:35:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476695e930bso13549281cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009354; x=1746614154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qIplIxVQFRQA47SBpjXsBem0pTeYTZkJKwbGOQPx6IU=;
        b=rI5w6iIm68wI3le0ux9aQ2u7Y5/pwXuPTYkMkoAkzenRPX+UuYXRxHfxD2t4WnQvg8
         clGchn0yRQg6qAnC03D2Ccu5OA/p04RvtgEdkts81/0e/6wAizFJKDxyStx8WDQycAyf
         Iq+zGi1OORlB2k1l5IRa8in0nilm5xC9IB1Cot3VZ9HopSFEBPXpAFokuUsaaeNcitp9
         iGWX2Bb3HxxM++nD3/N1pOOslSngLPRwavu36J3CfiWuzFlc3VoCDaUK4CPO1d8hEGMo
         VhM9qGCXmRLlfq/LuPHKk91ax8v5mHJHC07lYgoNDvvRvFeR+s36K0LyRni7+Hif2xrl
         u0Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWVn7xgLe2KezSDRhQ2K8404HhCQ/ZV9vReC0+CHea0Jh/9q0vKkh6DVmJNaEkItsX8Ed4xc2/XF7gxFsY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwko/WoMOHu1RJ2WEwi6lSj6SaI1x+TuuVmWVLn323nFtnubfJ
	/Bmpow/RMrrwfPELKk8CRE3wtvxonSoZ950UkTRnzaOalBi0YQz/wOukdJ8t+OYv9tU8B/4GMIl
	QT1CZk10OKy70WsP/vqVHReiczTtR3sS55okt30cYJjO3sToCFMh0oDkpilbs+98=
X-Gm-Gg: ASbGncvyr2ItmWJ/oLM+HCiwjnaL0vdAaGXtJbW6wb0QUIjZ//4KoNtC8bKOFsHMhxr
	oSb8qPn6PZ7O3MAF4ZwRMGz8spt/4X5Kp2t1XieI1OqsZL86vtpE0R5Ag461INzMQefCaSD21Uo
	VhW1EpUbclsu4x2ymt3t1CsjSfoZTPuZdT5lyzuTtw0w2ac5dpIMD30Tg4BjtrfStg0mXPGYMXG
	dPh0j8jaQGsFE+Gl8Yxb1lMQ6U1E/4ou3LjHrM+oOowRtbCl8JWKKaJGnnhcnnaLjNd9MJubuwE
	xCKJVOzMESd31LQu3ewfAepPhygTiG2xqryEOzc5BeCPIhHNhQm2UUkpjCSYgzVHvdo=
X-Received: by 2002:ac8:7f06:0:b0:47a:e710:108 with SMTP id d75a77b69052e-489e1acfdf7mr10787231cf.0.1746009353544;
        Wed, 30 Apr 2025 03:35:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuxrdliL6vbr6r8aRJl/KXW/EJxjEm2uUrqhJUgG4WhRbhXeKv4jPjowBGXvbwoVE+GqkEwA==
X-Received: by 2002:ac8:7f06:0:b0:47a:e710:108 with SMTP id d75a77b69052e-489e1acfdf7mr10786971cf.0.1746009353120;
        Wed, 30 Apr 2025 03:35:53 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41a850sm905527566b.32.2025.04.30.03.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 03:35:52 -0700 (PDT)
Message-ID: <b39f9d2b-17d0-4619-b676-f476d17ffb6b@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 12:35:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
To: Abel Vesa <abel.vesa@linaro.org>, Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
 <wsdhqocld54ygjrnn6etydorcg6j6uko4ner2dawoomflvu3bp@tq5jbqcahip4>
 <aBHvwUAISo2JhYSz@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aBHvwUAISo2JhYSz@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3n_gZa2cArD-tc46Kb0e95Uzl2NEft5b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NSBTYWx0ZWRfX4wJbzbhatZpg HoGABKeLn7zdVYjoF/PxKtZ6oiulEowt0BVQ30+MBC/izcwhchhyl/03mrFcUYuECCT9WgFJBwX /9jmgEXuTm+kQrILhmSYQQv9As5iYEI7fKvmXWQOjBmKuTh5hZK72i7a0qfiIlqTptq4WySEWNQ
 uVJ91XBLYMmcE/UYbt33k1FpVM3bmFR8iIn1Gx/HnoLG6EglPkdtxRpFmr9gTfD0ML/wHVVVtjS ydkIh8zjupgz/O3mMUKtuLU2xWSgCZq+wX8qPEVj+uEKqAhSkd96E05oNCZu5diMtM9LBcMqQ7d Bsv3NU0RHOCAlPoMp/haQr0WVXMNp0TxAbYlzx3svghDU2JFLTOixnU+OY5GuCdtUzVKix5oLZj
 lFrqQ9XawYSmOOMMsG/AsdDuOU+z5RQas4A+5O+LXgKfT2fUljhplWBkmMF9UDA9ZrxywN9c
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6811fd0a cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ZJu6mct0EmN0ZqeJLYoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3n_gZa2cArD-tc46Kb0e95Uzl2NEft5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300075

On 4/30/25 11:39 AM, Abel Vesa wrote:
> On 25-04-30 01:26:13, Sebastian Reichel wrote:
>> Hi,
>>
>> On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
>>> It all started with the support for CRD back when we had different
>>> compatibles for eDP and DP. Meanwhile, that has been sorted out and it
>>> is now figured out at runtime while using only the DP compatible.
>>>
>>> It's almost funny how this got copied over from CRD and spread to all
>>> X Elite platforms.
>>>
>>> TBH, the best reason to drop it ASAP is to make sure this doesn't spread
>>> beyond X Elite to newer platforms.
>>>
>>> Functionally nothing changes.
>>
>> Looking at the diff I wonder if this part should also be simplified:
>>
>> /delete-property/ #sound-dai-cells;
>>
>> This is done by all upstream X1E boards, so maybe just drop the
>> #sound-dai-cells directly in x1e80100.dtsi?
> 
> Yeah, I'm not sure about that.
> 
> Though the DP3 PHY is currently used as eDP, I think it could be used
> as DP. So I think it makes more sense to keep the DP3 controller as is
> in the SoC dtsi and delete the #sound-dai-cells property in each board
> specific dts. Don't know if it will ever be the case with this SoC, but
> maybe someone will use DP3 with the PHY configured as DP rather than
> eDP.
> 
> Not sure if I'm 100% right about this though.
> 
> Dmitry, Bjorn, do you think that is accurate enough?

I'd say just keep it everywhere, the physical capability of the
controller to send audio streams is there, but is left unused by
the specific eDP usecase (which is determined dynamically)

Konrad
