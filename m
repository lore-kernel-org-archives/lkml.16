Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD722853FF
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677599; cv=none; b=kM9vtX58mGj3kQ8VG4SAABXzDVAnnLgboI8cOhfIlK4sIv+QmW7aRP4OwjBaO/o94I7nC3tCifW5Qr5wbhR4ZxIdcC6iL6X6VhyNmd4F9unq3VOPRms0ThlKdwZ57C28WbfvV9Pwxy4ZJ4I70OdxYuhB4B63T4S63d95cUIAz1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677599; c=relaxed/simple;
	bh=oPDuJpU2aDI3veakBUF05VkL4vY3wVTvTbUP2qIWjRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=szkGBSfKGbuwUVPTUVgmWkU6hElxPe/UPiX9DGwPttp3zoMpWcbJhqTrqHZ6hmiN4dahCqNoFOeqIkxgmLBYX2Zk4tQIFvQ4fs6BYEmVp3mKIm74dngpftxkYfQ55miUV7/eM2Cq/4/98tTVv1S7tCv/5GdpiOIdi2xL9qKFRbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ds4IZ/aq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ds4IZ/aq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9SLYv014157
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QRhDmJNbBgVCCdG1SgH+0GcltALE5aKIBtKkQzfk7nA=; b=Ds4IZ/aqZWmGiwgn
	sbE/4AUgRZZPZf7UKwixi6I6ie5LuUHBSIx9C+FkPIgEs+BNY3vFdt0JdMi6ZGHp
	tQzILFDQa1Z3NHC3gmoA0lvOYIqNjAtHo5RxKw/Pmc3e7CsFfDA75z7PANnvIa+t
	3RS6WIha7u3oZEWvl77NyzPstdRhm+WRJX/C21I9930VSIq/8h/pFPjIrbZhL9cg
	Jy4PTZv5icbdJljTHf8Qkq/18/brtnkkSbZN7Js0Yh7bV4Heq0pcX+9B5viFmeSt
	+/VdXSVpfK1IAt81vAJ8yOV7XMC5ADO37uSfZJfJBNYNcub8XavqfARykSf3HpVv
	fSDrnQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4w8wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:59:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5466ca3e9so84840485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677595; x=1748282395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRhDmJNbBgVCCdG1SgH+0GcltALE5aKIBtKkQzfk7nA=;
        b=qSyg9J9z9N5YSXvVeO2wTu02Z8Egvx2xLibaCFLIl3GSYPIOxpZ5VWbq3/AwvYKk7A
         bhEKA9gXsqjYT9meLEqAWEjcSyI0y3COA6VcgliII06g+ifcIruHuWQP62VkecaQjsZF
         nSvGQ67w9osUrLJ657gv8C8VV7bWC0ao48GER4sUEH1qMz3eUb8JF2OfPj3SYDprpMeB
         OXV8XRSK8PmBmo7mFd80/FkUiK+unC/MRPG3Ls9r5XoIZs8l3ppILDxh7xHqzDMytqzA
         mCZ/fGFfSqeg593INgQAViu/F9T+S4cNHM5Wr+kO7uNZ+kXzmxBoD2Vl2fA3hBR5JqHc
         Owig==
X-Forwarded-Encrypted: i=1; AJvYcCV3lAH5WyAkCw0TLaug6Kfqp0NFSpnRvNzzhNBrXPcLYTmsSffzSuPlK6VZacWm/wCzXErN9owja0nLimg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9j9jR2pc6GdYHC21FH97rkROx5NGcU0FPNJR1+T+9pA/PjwQi
	rF2SMd7D19rgZC9mADxx/VLuZy4z8NSZUXcJQqwBbLBWKaUd5RFaXRCerogZ9IRjjFK0En5bQ6R
	sztVwfr2oEJDgmTkbDHcOJHOf8WzgAS7IHBFDMcmyTWduTqfATOXDRx/3vHf2nhhYK7A=
X-Gm-Gg: ASbGncsuXNV6QOcVsWWhwCDi1wSdSuZW2Hmszx48QibqxBbirTZG0U2HA5NGM34w/Sa
	IcLCQchahN+YxiNXFtGqKafIjJBXRQvihmGCi0Y4nnXVz/2eoqtubBH5gtv5jEHvncSV1jexcKA
	p/46SMepGMPhxro9VMatZ/7rnt2C6mu43dRqTyNzbQkZb7DacUQpOkb4tpPdsVrRlurHhDxFi10
	i9d1RIcxOfC1a78gjdp1YRN3xcY/AJsLF2cPQEGTalsbW4pRlxRMJ4KRE6AbGtiGBH55Xtp6QTh
	VxUr+OBmUCI9PulBP7E/A2i6vR2/4eBldyPOwzBOPZh1pt4OMJzZlMQUaI/ZX+B0cg==
X-Received: by 2002:ad4:5495:0:b0:6f8:daec:8b7c with SMTP id 6a1803df08f44-6f8daec8c02mr14808356d6.6.1747677595380;
        Mon, 19 May 2025 10:59:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGj+7fg16x74gYzVk+YjiEHRe8Kboy7RuyCWGBLuiZoGpt6d9MsVthshVMvw3wwrX5PCaJACA==
X-Received: by 2002:ad4:5495:0:b0:6f8:daec:8b7c with SMTP id 6a1803df08f44-6f8daec8c02mr14808056d6.6.1747677594815;
        Mon, 19 May 2025 10:59:54 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498b2fsm622845466b.147.2025.05.19.10.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 10:59:54 -0700 (PDT)
Message-ID: <071255ad-ad08-4a15-97d3-016703e7d9a8@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:59:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8750: Add BWMONs
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
References: <20250304-sm8750_bwmon_master-v3-1-01a5cb330dd9@quicinc.com>
 <d2640b21-41f7-4bb4-a616-42b6bd9cab0b@oss.qualcomm.com>
 <cpwyee5bgu3r36sh76mfd2o7oc2dnm3weuvynkvbsklr5nhm7l@gb2utngj6vfl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cpwyee5bgu3r36sh76mfd2o7oc2dnm3weuvynkvbsklr5nhm7l@gb2utngj6vfl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b719c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=wbSWbzf5WjKv6xKPGGgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: D1D-ADm5FpgCnFPpaVujwtuRZP2I-ppS
X-Proofpoint-GUID: D1D-ADm5FpgCnFPpaVujwtuRZP2I-ppS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2NyBTYWx0ZWRfX5FmL8E3GZ8Yn
 U98JYurWO4024RDhKpMtQb3zPXxE7rBnnm0x4F2z3TcAPV1b3rEC1FYrqDA/vhPqyyReqEI8jbc
 cELkVsul1HJik61L/Dyp44qSw2EXP1v2HUh2Z57bNGzIbIDMehXs737JAmCh19hq2YV5K/f4zBr
 rHMSQ//5fFd2vHgxnaICIF8wwMAxY3SW+bj7KZZ4dNlkE8n22Emdv3dK9PH4a8c/Ci18SHUhOEE
 EF171lyma0uf2vOFAgZuSPErIAVGqSixrbi92v3H71R3uMNIGIV0dAkJL74MS5UvpcuzTYjeAvk
 49tgGWL8dfEuAoBmJ4XCFxSM+TP7EC0en++4Hjj7bsB4VPVxvb1PwKhpP4nvVlDmkrJT7hi0j0F
 CpxGAEJzaHJjhdFPAY+Lr9yusWeTwc3y+PrPf6sfMAaGG0RRXfC9m5oENlQWyLbzYu9kyvYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190167

On 5/18/25 12:37 AM, Bjorn Andersson wrote:
> On Sat, Mar 08, 2025 at 07:15:06PM +0100, Konrad Dybcio wrote:
>> On 5.03.2025 1:33 AM, Melody Olvera wrote:
>>> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>>>
>>> Add the CPU BWMONs for SM8750 SoCs.
>>>
>>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>> ---
>>> Changes in v3:
>>> - Change cluster 1 destination interconnect to tag active only from tag
>>>   always
>>> - Link to v2: https://lore.kernel.org/r/20250304-sm8750_bwmon_master-v2-1-ead16909397d@quicinc.com
>>>
>>> Changes in v2:
>>> - Change destination interconnect to tag active only from tag always
>>> - Link to v1: https://lore.kernel.org/r/20250113-sm8750_bwmon_master-v1-0-f082da3a3308@quicinc.com
>>> ---
>>
>> This looks good, but I found that this platform may require some more
>> changes for bwmon, we're investigating that
>>
> 
> Did we reach a conclusion on this?

Yes.

Melody, LMK whether you want to proceed or want me to resubmit with
the necessary change

Konrad
