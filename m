Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327622C08BD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619285; cv=none; b=F7+ZcnKMwBIdDmsUHkDMXh07zyLintPzViBa1efiIbYpcRoSSuqwF3Elc/JDIwaJSiTjzVKCDyEqyfjh0+wQVwrB3h7Bxnd0Y21zr6hGlijU+p1F6JbZ6Ejbk08os7lTHWEQJFaqz9GqjE1/MSGJFXkP8POcFUF2iT6gxVFlSSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619285; c=relaxed/simple;
	bh=zaaxoxNgjPUuxdMxeFXrTVZNMlPBYMs/ecrVcRQNRoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8YRFsn50moi3a2wPuZEnk+EfP+ZP5IT9LNvH/7MDrp5s3v7/mzBPQ7hYGWnfY/jyGo3wQUy4Arf65T+DYK7ivP3sNfkwB48suCB3zE5nfibc/sKw8+ZURSQga2+tvHqM5FEPtScbT46puJ1TsKzVBHpVxLwlWuFU+lwmdGf0GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOD8v4Zo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOD8v4Zo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648Qinp029542
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 08:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNlmPCpy3Uf3D/WdjoT5ezCikZt8RI8Mo7y6vQzht5Y=; b=mOD8v4ZoNJRcLV8M
	7qpQDjxhqpFVdRZj4J06qCa/pnKaTaF7dvp4PyGf3SOQB7d8oqU3ZQuRsBEUw+4y
	hC/BznZUQ8xrAKL90JdHFywlFKUPh0M5p83gJUxML8hLx1BlKhotXJVVGhkKpenY
	6u88maKXg0G0PRTHlUtkzDBNIpR23irXhOglna/+lZ0ioAEeP0ijD+7qL7oG504y
	YPgrFWbOSsndWUG3s3BhWkI1ruw6ppEi6hlG2Gwyn1BJUEQHjOZUPLpTMIcLjJBb
	rVSivOBz1KlU3ITqN1U0GDpzh8DIQgjkGR9Yvm5vn0jeALn8THGmZYRPyp5HgECz
	RCC0Pg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s4m5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:54:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3139c0001b5so854286a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619280; x=1752224080;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNlmPCpy3Uf3D/WdjoT5ezCikZt8RI8Mo7y6vQzht5Y=;
        b=nwQkuruwyN6JdtIEe9SYonTlpg3vkd/gkmDyVmLC05cons5nxgb+0+dFwYrRXb8ZLm
         L/wo39NgvZfj1cACu4+anvnXME1r88z4GJrfBoMVxj7ZgDce51SPpObwj4uF6ohZTIy9
         e6rz2g2REiOQGGE+1nl5ic/80dlcWfBHKv13vIYdEjv5S4m0RvZvhzLtwTC2myqnrmiy
         EMKHhh3L6oBebGtqDFO1PL1HPA0EBTENfqNvPiV2hnPSITf7HgHzmnp06WnV5U36LGNT
         CKIQhJsd1YhlLjHxXKPGgkKpPsKUlIECcbbTUGnwImRuGOw23a7YHOcONt3/NQLZen8m
         jtPw==
X-Forwarded-Encrypted: i=1; AJvYcCVLzt2/vl9iHHmXU5eOgshKly69sqmAtUcPvLrnYHNF6a+tYsdw8oiMLhRVp+I12jixHdFf5Zh5s4Zmrhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXU7awSj8MwnW0mej3vGigLTiYllcoHfHgTBRnnbrHPZbi0+5U
	kRvAl/aU6b4qCSk9zclKFNVz6Te8EVJ1UKcsV7rXaICSiHWI23SUY1k0dDXfTEoYHvG4E6tXKkL
	fa8ykl+0DHihO+BuuZkLkGn9RZVXLMnPKTTA72KwQIBGfuYXNhhJe2iyys5P6QKxiwrk=
X-Gm-Gg: ASbGncvhaXpj0sW2PPGpY74LgVEwFOiyECr1LD9/BneC16Fkb5+Jf/2VawFO3/GH9+H
	WiBaFA3ps8/2fQ+T23RMs3583ROiPyYIF+c+1TyaQhi8oHOAulIuC+W+blDrkBUwpt16Rsa5Vmc
	8IxHVSsDqoUrWqZezZrpL1HLJVxBZ731u5hoRZ7z14yMkQxm0dd92mQfrDmgBCo3o9D242OPvwr
	LvGKMXLjosKmSLg32H4FrTTHEfou4IqfvCWxVnZP2r598qZ7vmLLa5jQxlfbISpAvToSa4+ux7a
	3dNr0BZURF9V2SGl+ll9bFk1dewFlHeRqJBuvpckWzSPCTtN1bHGofthxsw6VXA=
X-Received: by 2002:a17:90a:d88c:b0:311:c939:c851 with SMTP id 98e67ed59e1d1-31aac43865fmr2897323a91.4.1751619280454;
        Fri, 04 Jul 2025 01:54:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH43RXiz/iv6OSVtPRo6JR4bRRzwFOrl87rAT3TwkUaSHbMeQVe+/sFB7ICmDNNgjDen93Xyw==
X-Received: by 2002:a17:90a:d88c:b0:311:c939:c851 with SMTP id 98e67ed59e1d1-31aac43865fmr2897300a91.4.1751619280056;
        Fri, 04 Jul 2025 01:54:40 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c84446c4dsm15030975ad.80.2025.07.04.01.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 01:54:39 -0700 (PDT)
Message-ID: <d4e7dcb1-5a6e-458b-9b1f-28298fefcbd7@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 14:24:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: ipq6018: Add the IMEM node
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
 <20250702-imem-v1-3-12d49b1ceff0@oss.qualcomm.com>
 <96073931-644c-4d77-9c61-45ec65adf928@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <96073931-644c-4d77-9c61-45ec65adf928@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=686796d1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=jZhe5MNW9S75RuEgyRIA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2OCBTYWx0ZWRfX1yxgZOX2A7oJ
 UIklHwce8nDI/4jyKGrmFE72tAivPG31LklJ+N9u9ZsyGgKeALyvjInjZpbWAG0ml0txthnBAcL
 BftFjNtV8akNqf3YrnwUW+1Ab763wOP/KOPQE785TSSDgrhDoNKJ2q/cA3M3RfvEEaRVzd9LpoM
 8IwDIIxDWD/cUHM8lDKzMUQO85df2EqqoQktC6M2sqUUxFCrIGzexB6IRmGm/RrVZr1DElJb9v1
 zt2+3PjXphHB1yTlswNliQcj3HLQpN9oqhmLP4l+VG7tSluE0EDlj3Qr+YVr1ybNdFJR7LVoWDf
 nOpq6i4Fzax85VyUMqaXhqiTWgZ3mcQSPuj+bs/VE7bXRjAEYT8tTyaWgABed8R7hv5N6NqFECI
 IwmlRjtoLvKSH1WejcSYiZT2qsXjRscN/41VIMfPjI5GVT1lB2TZ4+Ga5G3F8ayv611z/6vt
X-Proofpoint-GUID: Bw655TcjlK7k3SNwfjMdhvwmzDdaLooz
X-Proofpoint-ORIG-GUID: Bw655TcjlK7k3SNwfjMdhvwmzDdaLooz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040068


On 7/2/2025 6:29 PM, Konrad Dybcio wrote:
> On 7/2/25 12:17 PM, Kathiravan Thirumoorthy wrote:
>> Add the IMEM node to the device tree to extract debugging information
>> like system restart reason, which is populated via IMEM. Define the
>> IMEM region to enable this functionality.
>>
>> As described, overall IMEM region is approximately 32KB but only initial
>> 4KB is accessible by all masters in the SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> index bfe59b0208415902c69fd0c0c7565d97997d4207..7eca5ba416c2ef5ef1c4e0eb4f58f1ca94fc92f0 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> @@ -659,6 +659,15 @@ qpic_nand: nand-controller@79b0000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		sram@8600000 {
>> +			compatible = "qcom,ipq6018-imem", "syscon", "simple-mfd";
>> +			reg = <0 0x08600000 0 0x7fff>;
>> +			ranges = <0 0 0x08600000 0x7fff>;
> I firmly believe there's an off-by-one in the docs and there
> isn't an odd number of bytes reserved in the hw
Thanks, I cross checked this in the SoC and I'm able to access the full 
4 byte at the end. Let me fix this up in the V2.
>
> Konrad
