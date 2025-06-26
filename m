Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A15F2EF2B2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750964267; cv=none; b=K1sxWNG7xk7ga82/Kbpzwxw5RrPpN99gT3Oujw1wR0fADr3Cw3Dc2b6Xs31BphtY/gGKg7nb7ahiM9uNDS508/BM990SDD8/3JJFyNkA5qoISzIxFuQuUTCXmMk9wl8BM5CMbSxaGTC2l91UHUQCBPqJre8Mbz55okO38z6uqTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750964267; c=relaxed/simple;
	bh=NmfIm68YAjRG5h/tBl/EbY/PKiuMXgho6lidL4bzV7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwCJOsxchAVdLAondD6iN0a+t4hMvGMtOp+uffIEs2TZf80QbSO7GnXNfpYfP1fZgNim+951qlVE2jA1YA9gyEQW8GTnMRW6Bpr7FkE6VNpXOXMNuQKROcHcq4oKKWVOf7K4rTCMICZwoo3OMGqn2VdwOd4ve7IHAY9t+O3Gx7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOxRYxaV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOxRYxaV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9V0P6015400
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWmnujwbUhTih84Oz0jMHvC/5s9gmiUhuj03SRFr5GU=; b=FOxRYxaVMVkZ0l2T
	/jOmd7WK1LNJyUKi9XG1Rw4aeSXCtfPN4tjvzsZidUcBflq1oEmXCFfdO9OTd5hd
	FRkyrDDhM6khXt6UO4vL/ww5f3jAuWJc5dS/425AHQ6BcerqBcjUkL4yB9mJfHYx
	cbUK2wuAiyhHA9Zbd7BBnYlvKQ61o87OY2apBceNgfbO2xW0CU6sUjrz97XQ2fX6
	Q2hQaqtvVJvNlEOSZ61j8j3vGLmYPpvB445WUWsXpn6dRb7Vy9ITkyVDOpJCHQer
	l+HvPtAyVVV+j5sy5xDlnGoHEMcuijJs90XSTCieGAK34tUs15pRlyo80GpyOsb1
	/hkHIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fe41b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:57:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0976a24ceso38223685a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750964263; x=1751569063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eWmnujwbUhTih84Oz0jMHvC/5s9gmiUhuj03SRFr5GU=;
        b=SdTQIe8geMmKBSGeF0Fq7CBi4Ty+SXOQgjos6AwLHbkgiigRV4kVOz3gYlkXclDUCM
         Q2nk30x2ihSSBxa3yhDWEP+XWo4xOG+ZRhm51Z/rwO5TZelLwjxHaj/t+hDbdtm7svUy
         pSrIyXq0NmW6OjYB8swnadH/orGPjHafqwjRH1YPjH6PDpWbYEdQzTLVK1RFMOuTMrCJ
         q/HY01Y5MPrhD9u+ZztMKOIsfiQ36uEDIxWUyssC7qusBVil50aJwUjTAPRSTAe71Pfx
         jBs/y83YMlVgn9p1RPSNLy9PMDwB0r6ZgBV2Cw5ETWOzzetoyPn3N68bBUlTATyg7Oa9
         kksg==
X-Forwarded-Encrypted: i=1; AJvYcCWJE2BCIHQH3eRM1ltqNXjvGp3uhSl/zsn7aplVVQaPWzhIJ7W0+XYaVBceMHH46Xft5O4FAcp2Tn20Ji0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW0Pnuf4veijv0Rjjl7SsOk1RRcYhh87YO/xRbwOBuDsIhtIEn
	/AVJI4YrAPT+wD0FxzGrlxQH/2w0y7mU665zeQxkjvbWEnNFQromqhyXAZ2cLgfmocTf6mEIdfX
	Y6TQuFhMM90rpsFwOdRto70qvnBKqDTiqXMMm5x3JtLh3I9SDYfV8u1S5NRRBQHnfjSM=
X-Gm-Gg: ASbGnctm63UzHqvFKXoaXRXwU3SEBXUmnx94vw8qEJK9zOHd+39OEotSL6vcyyyQHIa
	NZ37VUfBxy5M14h2X7gfJ+K3K0O5RVeB1mSdZT7OpnNk/ff3itHkCeJ1trILgqfkhCQkmqNkT9L
	qkuxiFT5MX5r40gw7mnvB3Cr6cPd4qGVvmvXdu6ilZf4H0+vjOmgPb0xvvlYLcY03B9VXX7AXKD
	5YvoQjZdLNWsRyrEtIxsiXW9wZ5yBlqFkDYQ50yb/sGV4AbqEeYdF1n1gnFstiEtFqGwZdL8BrH
	ji3Obuc3lLd0D4NugynARqOfi37NxIOmNtoJl8b4ni39FtACs+Un35NzDDYyvh2adbZ2eN6QEdU
	RByw=
X-Received: by 2002:a05:620a:4054:b0:7ce:b3e2:3831 with SMTP id af79cd13be357-7d4438b4919mr31486785a.0.1750964263217;
        Thu, 26 Jun 2025 11:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB30m5okVDJkeHnl5v0UU4V0XZkupcfsesSXQvHm/Aburs6vHWv5o0kDF78CMWJgBL4eZQXg==
X-Received: by 2002:a05:620a:4054:b0:7ce:b3e2:3831 with SMTP id af79cd13be357-7d4438b4919mr31482785a.0.1750964261619;
        Thu, 26 Jun 2025 11:57:41 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d8efesm39531766b.103.2025.06.26.11.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 11:57:40 -0700 (PDT)
Message-ID: <599fcbc7-23a3-41f5-8868-dd168fb8ecc0@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 20:57:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com>
 <bdf7e3e4-f1d1-4f3f-aebe-ded7b8091884@oss.qualcomm.com>
 <3514a3af-ab7d-41e6-9e59-95defe9105b4@oss.qualcomm.com>
 <da6daf53-11de-4ca1-892d-73754adb435f@oss.qualcomm.com>
 <5925b608-1251-4b73-b310-948b383f7b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5925b608-1251-4b73-b310-948b383f7b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE2MSBTYWx0ZWRfX1PDeTuIDA1i+
 CkFB/v8dlv9lM502X1tDQC1nAtcGWKjRt5Be4nnTFIaIhZ2RrfvIsAwuxyvna63LcZnVjchJedD
 czTFvCXcwxJjAO0ljOxvK8OMPlH41LBQKtATX/mfdssTyKwpxSN9yWY/iLk8ltp88e4wqtup/TA
 vrBb1q+R7/HONs9ASjS4ZxIKGGk6I4Tzg1f0gcMcBGI/jz9Wwo9YepW6YGAqm//F7TfHr86otx4
 vHqJPkD+xg8aBERpdexqDTvR1VmayhxwzMQq8hgFOdMNqzwz2ONABjvrbInTkZ514SWPO0F97fz
 0NQyA5XKpQ3JOmiUVkQ3XXrdlWmIVrwnGeqUdqz0jlPkhsb8WsIsu6O6dbanRYWbYyJ+oWYbbQj
 TdGmmtDA6KLMePWnlaRs/KGNrTvcjVg3LZI9ol3HEmuJECs1FZOdQOCqn0ZlT37CmevQ+FZ+
X-Proofpoint-ORIG-GUID: LKUQBVRkB6qMeN0cwuR40PQJO6QX4OA9
X-Proofpoint-GUID: LKUQBVRkB6qMeN0cwuR40PQJO6QX4OA9
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685d9828 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UEcVYaNH1ZSnb6mATNIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=668
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260161

On 6/26/25 7:16 AM, Kathiravan Thirumoorthy wrote:
> 
> On 6/25/2025 5:44 PM, Konrad Dybcio wrote:
>> On 6/25/25 7:55 AM, Kathiravan Thirumoorthy wrote:
>>> On 6/24/2025 8:08 PM, Konrad Dybcio wrote:
>>>> On 6/24/25 11:00 AM, Kathiravan Thirumoorthy wrote:
>>>>> QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
>>>>> first SE, which supports a 4-wire UART configuration suitable for
>>>>> applications such as HS-UART.
>>>>>
>>>>> Note that the required initialization for this SE is not handled by the
>>>>> bootloader. Therefore, add the SE node in the device tree but keep it
>>>>> disabled. Enable it once Linux gains support for configuring the SE,
>>>>> allowing to use in relevant RDPs.
>>>> Do you mean fw loading support?
>>> SE0 is minicore, so we don't need to load the FW. But apart from FW , protocol specific configurations to be done in the SE's Image Configuration registers, which is taken care in the patch[1]
>>>
>>> [1] [PATCH v5 0/5] Add support to load QUP SE firmware from <https://lore.kernel.org/linux-arm-msm/20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com/T/#m37a6b739c66040cde5b6b0121a03da7ea6715842>
>> I've heard the 'minicore' or similar name before.. how does it differ
>> from a "normal" SE? (+Mukesh & Viken)
> 
> There are 2 types of SE. One is Minicore and another one is FW based.
> 
> Minicore SE supports only I2C / SPI / UART protocols and it is fixed in RTL. Depends on the protocol needed, we need to configure the "Image Configuration registers".
> 
> FW based SE supports wide variety of protocols like I3C, CAN and so on. This can be achieved by the loading the protocol specific FW image and configuring the "Image Configuration registers".

Got it, thank you

Konrad
