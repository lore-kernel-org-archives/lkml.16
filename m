Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA7126658A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461250; cv=none; b=frit2g1TX+La8xY+kZ1Tf8amr64jnjcdTJoIr3NZYOO8g4aYzUT3VEmF/pQB05Lp4LwJJ4h78VtVoRRwg9OC9Vz6irKtVclerDIIjNBLsMbi2ycdpZkSq7BSX4sWaXGmGhqzUokNOYKCRHTFGbjshqvUrmPsacit75X8q/eLLzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461250; c=relaxed/simple;
	bh=lV32kChCuVqH8yCvDu+qF7ZrBKPBDV6XI5jEvKcTek8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQi3YLHB7cqeidwfKnZvFEwuXUYDusBGV/3vQYf8sPa3SpWFLlhl2wiB+j8euZMWKevDZVfoIZQCFrEzsGb4ICUo45/2kROOJPAuDKUjXxk1Cm7n4kJCR1d3pDDS+WTvpviDQDDdPSBzbPS2VR6FuqB0yC2PkoDxgpMw4amBzLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmnZwApL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmnZwApL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562CRXXw018568
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 13:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3NQ7HW39R+Gt0CitY5eJYcMoF47O8lIW9qMV+Vh880=; b=fmnZwApLB40IE3D/
	m+ovqXGXHqi0C0RIEETMaMMGq6Ehu0skXl6t3s5SqxkyuDnCa1VAotZDdbzhZouT
	0TvVcTJmmnz4gP4gRh9K8kSvaqfKpwA8C+qnPNf8PGjgrSrLkJdo8KMNtdMJFGm7
	GzOF24ZKBOd/jrbuazz/xbgal8ae2/zajSeod3v+yd1vFDDxNovhMFnHnQo0JJPK
	8k5GmK+F5hZLKeonIzqBql56BE/FzHkwJUovrqHRvX8+wJ0AEz11o3IJ0TdU/8uF
	R/XavCrjLShOHvx6f4fA8R1jaGYB0J+jG8mMfx3rfg1iSGFR5qftO0uUGRRnr2JA
	YtHOOQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxmrjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 13:00:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0979e6263so39372985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751461247; x=1752066047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3NQ7HW39R+Gt0CitY5eJYcMoF47O8lIW9qMV+Vh880=;
        b=tXO0Ar/YMqB3fR414KTUMqO/TZRehUml8+PomlZzeES6iT3LKp37ipCQR6xgdmzBLQ
         OyAzfAHqIQLApFtXipVt+K16a9vAuuy1CKpIhUKYlPHvLpKAKtWMjD0TMCOSBx6/32os
         iOQhFkLQYf3PT0sTTVHmwzi0sg7Uf5Av8ryEYG3/zAAjThl+2QezbfXmLtcCkaY9Gq4B
         WKy+aItwKiL/uQGRp+Qe03Z+M0hb+CyMAaD06PVxmEhxp0RLoCprSjsodmwArt2NMKiv
         fZFsoncGLZTGpRhG76+cFdSNowHmmLMYE0MJbFkOGMeDXt5P4JAev/O1uowLWwKvULWo
         TFNA==
X-Forwarded-Encrypted: i=1; AJvYcCWHBYqEBQ9sgi4z42ui/dULBYl2c8+baOLxaPc7XvPIt0rd2iqqYQbPyQzukxOr2VX1uqN8ccF8sxPAMj4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ZJQPkpXBbbBMcrsPKh0SUY+7NWgUdjbKLSxVCwUbC1cFO0R8
	/YuPc+vxnTe9nmAUKvYe37IvO5ba9H/4lZTlBhpuEFKp/yDrf+P+OAjafVj+PgMlbEmVIjyoCIT
	BUCpH0nYTCSDuutqf1RkV9A7NOCWDvLebMW16sel1pQl0x77TGm4LTppI5E3njBGlF88=
X-Gm-Gg: ASbGncudvffar5y4aT7C/uoZPcZjAfV1K2FciJufqe3Xd6k4cOGibNDmyuOOd8Whbkd
	PQEyAHpEPdMX4DfI8gixea0D8XMGVVE1vTDtAj3VS2HzmKKzjFX7H6ZC9BVLrSX8l+1CYgF/AFw
	zT4uAnbJylrGBBthU7tXlNOhvqDW9ZyUS6PHqcwESEiOV+gxwQUmfLgL4FF5XQEsLL+oMkryFud
	Rw6XpeG9qUdO8ZQI1a65SSshL768FB1uEMs96JMXMSNI4qfrriBECwW/BCqbIyAH5pl8+CD+0Fx
	pHIofTFin5i+Ga7XJLWd7FHmXcLNe0TNnNzmRT9Il8Fe1NEMxAhWQupRsitGeVYUUBWOzxQhN+y
	Pj50=
X-Received: by 2002:a05:620a:2552:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7d5c464cfeamr150089085a.2.1751461247163;
        Wed, 02 Jul 2025 06:00:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3/BXMk7FAeZKeLVzLwjtOhnzyC65WEm5pD1H2XXARo1S5Jr0K/z7PoCIEXLabu0cpABZM9w==
X-Received: by 2002:a05:620a:2552:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7d5c464cfeamr150084285a.2.1751461246447;
        Wed, 02 Jul 2025 06:00:46 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01636sm1079292166b.105.2025.07.02.06.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 06:00:45 -0700 (PDT)
Message-ID: <0a646e08-8007-4bc0-9324-fa1d40b90d20@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 15:00:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: ipq6018: Add the IMEM node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
 <20250702-imem-v1-3-12d49b1ceff0@oss.qualcomm.com>
 <f66611e3-2961-4435-b276-7f13041518cf@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f66611e3-2961-4435-b276-7f13041518cf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEwNiBTYWx0ZWRfX+WaxJPPfA84i
 oEQF0dtMyuXgE1x8uvimapJGNATjNmjVRRet1jk94+pCMIhQigfAQBRXc73zeoghsALUNIb/NjM
 oqJZMkykPJVtbTn2eyfl8E6a8hstKoIWnFR7DHL7NNUEju2jJaHgo6l3eEnyy3imWPtS+Je3TCy
 rGp4Fi+fVHzuGv+qZlFrCs8FfjCeKqOpIo5ji6qQEmaIpeaZXLf7AnBcOoDVPop6eTT4OQmVZkO
 nwHewAmqm1K0bXa9uBfjLU93nuMsfTUEw+UBeNTfbJ1s1gUfhYssQHFYluWU6g+UrdiVKEzfs4P
 i8ZHVKIcAEJeaNvbDK1cVcAVRuOkQPyswtzqyrg3hdwgnkvKED4Yn9rNDEr/g2decfafif6EOAq
 teAt6DvT2bzPW+fc+3pVaq7wdvVkxmi7ESeqx2oewcNgDhYlz7krbrJ74Dj7DN6O5PYGWrpj
X-Proofpoint-GUID: zIEQJPLqfxo7R87W1lBMuR9hq-qgIWHn
X-Proofpoint-ORIG-GUID: zIEQJPLqfxo7R87W1lBMuR9hq-qgIWHn
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68652d80 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=jZhe5MNW9S75RuEgyRIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=983 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020106

On 7/2/25 12:50 PM, Krzysztof Kozlowski wrote:
> On 02/07/2025 12:17, Kathiravan Thirumoorthy wrote:
>> Add the IMEM node to the device tree to extract debugging information
>> like system restart reason, which is populated via IMEM. Define the
>> IMEM region to enable this functionality.
>>
>> As described, overall IMEM region is approximately 32KB but only initial
>> 4KB is accessible by all masters in the SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> index bfe59b0208415902c69fd0c0c7565d97997d4207..7eca5ba416c2ef5ef1c4e0eb4f58f1ca94fc92f0 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> @@ -659,6 +659,15 @@ qpic_nand: nand-controller@79b0000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		sram@8600000 {
>> +			compatible = "qcom,ipq6018-imem", "syscon", "simple-mfd";
> 
> No, this is not a simple MFD. Where are any children if this is a MFD?

IMEM is just a block of SRAM shared across cores on the platform.
It's present on all Qualcomm platforms and usually stores cookies
such as reboot reason.

A user would be welcome, but I'm not opposed to a lone description
either, at it still shrinks the undescribed-reg-space-hole

Konrad
