Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31472E92B3
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037050; cv=none; b=cP1sedIgEKObyGiWqsUa4s00JR6csi9+yVibVAT7xAcwtLeiqQuk//4Br0bQsJeWXjqSlzkg1sIw+S7rIwvueLAGukbFVYzVx3a4q2XBst5cPfIMuRhRdo+VzpiC/ANLasL4TCw1/kcGb2aNO1+hqLPyUmEhKxzqD2THA+wHz0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037050; c=relaxed/simple;
	bh=MWOFAHHtN7/qggQnBgYoOfr8mbDkE0qE4SD4dw5rBus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7MSCIIHVyn162R2qnheWZ5G5IL+HLdJDGtWnQvAw6lTA6hD4oURyAlI/tBgExz6ZGDwxhNMUQCafNhM5XGTaIyyOYfoJ+X9IFNwfuRG0LdEEKhsRGPlS1ZbZQ9QGR6IDVgt5AR0QnvCTj/6UBqWm30bci/gIqzmoqgOYRZAhp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgeYq4NB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgeYq4NB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBN6Jm006933
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOLf37uyXC+Xhgnqp1gpIpFUGmLHpCI73UUQAx/mH9M=; b=IgeYq4NBC9HCybCt
	lQalD6M2OzUujYzgb9RKXdXzCvyAqcfOIoeMhk+lNX1Jy4fPkz17P9iB0Pb9sDcP
	XImdGcrY7CaEjVQDB/teqZGDPSoWqGYfxz/Y4Hy5YHzZbh559E1PIa6MYZ67TC3k
	t5JRGKkyfDSFLXDXcG0Sn/GGy97WALDbqSbk5kEmPcMWF3StxVBg9eNKVNzJvw2E
	9G/KPQkdR2jazPlGlxCfpABzws6mN1Hdiv0mqfqZVo4x8hS5Pabu3CRFJ4iddjpi
	r66fLXFOEtlXmqB+7GHg0tI/znt3mBT6NUfWuc7iFX+kFo3Eayt/DTnxd2hPC5Qs
	GOZLMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc60e8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:10:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3eeb07a05so19558585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037028; x=1751641828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOLf37uyXC+Xhgnqp1gpIpFUGmLHpCI73UUQAx/mH9M=;
        b=Z5GMg1YmAgQU5ZaGtV6VUYfRnHHRJ41oBqIzceAHXheOVISznQrDEwPTGdYvvlTntO
         YFRQYhUPqJm5Hyy2Agdu+dohaX8KLy1aofYNpC+CNogg6VTJI6bzCt0luJT6L6vXi0yP
         4n4qEIKLtQ5rndto9DQ5uly4ztUwT5AZuSZHZPMilIZqXaPyWUycmcq0LuhbfXG9uTmq
         6X0IL6kxGUogNw98oY21kyxI9DWTzOEKA6rpjMTldoaHhQ3gVnb/YVxXX5Zoftb/OeQx
         lR65l8DVBS3tosSS94CQkB5sfNRTNZyKsIUUwujA91YP8qd2iJamALwYdxJpP+qFj/Z1
         i0PA==
X-Forwarded-Encrypted: i=1; AJvYcCVydR7SJuhCkFLbt4Myub7xAH4CIMxR4kjCvQjA/HU/iAv/6Rh+f9GMouf+R5XN/F1FArWmkx2DjzH0BTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFqLUL3fnyQ6BoWZ17fb/SF1y9Hxs5KaR4tEZJCN2Vpt1RBfZD
	HbDjyDhqv+Ex1dZR9uPfvHv5kLsBV/Q5oqX+KcTPlo2ByixLOCmDxRRb94epvPZnC7khVtbe7+1
	S55NhkLS1QQVLmuDKFiDvowaIqIFQw6D9Mk0fuhRwXXQ+LEPrDpvR9+2FAY37SEFuSwA=
X-Gm-Gg: ASbGnct6s5jpIuw8ZhOSpdbE5O0SlmD08e3tw6+boqyhZdxxpbC6EfoAn3ZJMlRnJiA
	JiZ5Hr/g6xAGFJHzlQ3u5/UB+JF2XTsONcLXzlp44UAlspJ4EtXTG+8gTouXUGwUAZcmkte7Sn0
	kq9gHTybld2ufEGB8Q2KErFw/JU9QxDH5XWozsR/42n5oNfvZ7dwFTEut8Jw3bWFYlmmL8WOQTX
	S+7qo05fO57Cg0Bz3v85lB7+gumIoU4UPp57A6mv0nIwuA5/8uohFET++URRvmhKXNoR8Lm8QYo
	zC9SeJcgREvDcgRg0ihkUNYz6p7ZgzePDczQgZDcErlP4KfenD5AHsU49oVMXhbnZCm8QXsa4zd
	Wt3c=
X-Received: by 2002:a05:620a:c4a:b0:7d3:ed4d:ac1c with SMTP id af79cd13be357-7d4439de410mr197141485a.14.1751037028298;
        Fri, 27 Jun 2025 08:10:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpSklDN1x+K68aLym6g//jIbf5D14idxyGAGdjsMuKKGvm0HIepobTHT7v/W2zzlZN6PsD/A==
X-Received: by 2002:a05:620a:c4a:b0:7d3:ed4d:ac1c with SMTP id af79cd13be357-7d4439de410mr197139085a.14.1751037027727;
        Fri, 27 Jun 2025 08:10:27 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6beb8sm139311466b.132.2025.06.27.08.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:10:26 -0700 (PDT)
Message-ID: <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:10:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E7kEWZ66KB394G2VbrBVr0t6ZYerLSAH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNCBTYWx0ZWRfX4y2VikGoZGVD
 HBuYikpF1mgLTCAfOudfDIF5RKgpxlgDzcs/QsCqVUcbvCkTW1hEwBgHwgxee40qPZcPbN2IJM2
 12ULHgt2XMvwhWXu2NtvjCEXNNMhDMsT+VJxjJNdMCfxQ1vG8VT7+odnSPvw4MQHwgpUuk7CIwU
 Zhrwv0MvlYavn0vUYLJfgrULIDoouohFEaMLgDc0EeX05JC8hyY2d3eSEKprS2L7ZJuTM1sD3q9
 THldFlh9oSErt9Q2gCdUIoRiZBSsc9j0X+i6iVdBzC1T568526wpJ4DSnc4C4ZAS8I8ufiEZCOU
 EfzgqO7aSoKlTp1+CcZaUruekVusaAwnWOTJcPK79V9Ws3NBAUg4VecbvlvjNSC3aawMfTtACOt
 nEViOpsyat1XU7ueZv7oHrIH1zGJyFgDiS8eide1Q9jTm7iEjbmne1Y+RiEA+GzAxCH8uLcs
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685eb477 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=Z-jg4G-D8Sok9OT7mQQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: E7kEWZ66KB394G2VbrBVr0t6ZYerLSAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=909 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270124

On 6/25/25 11:12 AM, Luca Weiss wrote:
> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
> VIDEOCC on the SM7635 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (10):
>       dt-bindings: clock: qcom: document the SM7635 Global Clock Controller
>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Controller
>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
>       dt-bindings: clock: qcom: document the SM7635 Display Clock Controller
>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM7635
>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controller
>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM7635
>       dt-bindings: clock: qcom: document the SM7635 Video Clock Controller
>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635

We had a massive yak shaving patchset go in this season, please move
the magic settings in .probe to qcom_cc_driver_data {}

Konrad
