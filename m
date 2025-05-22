Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888B128A1EC
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747956628; cv=none; b=bTdqlY2nWY/ZfaP62kQVDOFIYloRu5PN76rI9TfPyyS3ugbsmL0xRmrf1qxlPTZ5zDISetx2XrBsoBDHUYdXVoTJld2Blq1ihYQzuKNIjjvnkYD32+xl6wJ9TzEBlL4MgnIzAgARSLxGLrXL9uMMsPphXB4jcs+CmgKTV2BR6eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747956628; c=relaxed/simple;
	bh=HF5QrWdVgrSLXQpRcVZ5nAwvebrBgOa1rmbw6B34qJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ux+ExrdfQoLQGJhf7RI3ppTJiy/hmnRMQQa94Yk4NgGC9QD1ws9xj9DTz903o+k4NDU3GfHXoV/ItPzS1aUitc5WzMMgAb+75kpDWTVugHLPAHZKP4vsUWgjqtrBtdZUBtihWlO9zDCsRE50RbO8qwjegVwMvOe8h+DT08xQlOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgUEta2N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgUEta2N"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MI3P2l012683
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3S7RLpIsIxMBOGoiyFOVXm3dKhx5umFsjWut4uZe1c=; b=fgUEta2Nsa1+MVYX
	wal3WTKtrgDYGJTVrIy7KiRZy+pR8ESPx+Z6CE/+SJrp9YiBxWpc9utuErVedlzc
	XlYHDcxMaPm6Wzd9Q+drm5AMQpNjFQClG7ooxoGHDokG6UAi0EZ5MErXzy9orK0A
	Ie5jZ/AsKuC1L90Bti7xanmoJ11Ir48gDrRzLk83wQArJ6OfkDovkjeCxuClGd89
	/KxQRUboP+0V9kyVY5qao3Tw0ZHchlUo7hN7HVNvaq5THOV/UthGtf273PjYSGJA
	xSpj9e5AdyxprqlDN7QXV626ikj/cltfCFeTlWOs35Lg2Evbz7gBuYyK12zJMuQD
	k+qoHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb6d8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:30:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso232243285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956618; x=1748561418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3S7RLpIsIxMBOGoiyFOVXm3dKhx5umFsjWut4uZe1c=;
        b=bkpJWmZnqmxs61maYMTYhjW7+0mHhtMQWwRx34hsmy5FVHOhEqa2Vi9hPP1s6lNML2
         ypo6o4XAq9UGOI9TX190k6Uz7nrpDnxeHzVBL+RayvzqEJoGr/Wre5jzljErOFYxHJRn
         pk/4nxUkl13Sk4GJlsxG+jQ0CwXJU3J9tMtDG+s5vOUmgqjRaNTcjOq43oc/ilGC/FIC
         uARo7iXC6+x296+13M10yFNKknP+DmNTO4cWcRNzt6VFPe7POEiA1Jq1FbcBguTD4wlp
         DBSP8DqWczFRB5scaQlrGoXu87ON1NhWjChz3OQiwtKdOg5PV49JT+grgqImSsDoTkun
         h01Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQmy38q0z6SzWMY9cCtIaBCcGeY9IWnfIuf3vttr5qll0r8CbwaGsX3gDlD9C4gzQu69Dz+0gz69xDUFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaqzP8Ixv6tmP2mWdo+w/crnqp0AvVuO7KBo5kaDlcwJ/T8MCM
	X0T/EEQXzFrwuGAk9KuHItQCmMOSYaV/Id1Kda7sOXsKLYj6MjTo5MSZgDyGtlhJsgHT/oi5uPY
	LuBbiMp+H0lGevJzZiJWKqIQLWIp3xb1UUtBUCrjC4hasgJ+RWG51KONl10YLaiW+ds4=
X-Gm-Gg: ASbGncsGH41417e4iio5Qce54bxGgsntWSKUgzho9gcGl0qTkkL6MLC9ANB2uV8HMBw
	GQg9VPrQ8BoguDhEINWwo3WRPBhESf5vrTuIn5VYQSiX+IxIFsaaz5Y9ugb5qNVl69itbLe7uQm
	3MX3IPoJ+Jy4sIltTw0v78IF98ydHZIqqnuZlfVE+BSVvZBJNpcIfMYjAQeqldX2ij76eE2J2OR
	tt5ho7wLvt37OH4X1X3FqKZ5IuNXA6SL2An2zEgSdxXBE6/zR3ZaPWb4B6fSn1rzx9NvGBCfhUi
	o0M4tsk0AhzZZ/Hq1KhH2VEPfB1+67u0Gk2qDminyf5217db1D3sCryMUYx6DTJRqg==
X-Received: by 2002:a05:620a:6504:b0:7ca:e39b:946f with SMTP id af79cd13be357-7cd467db69bmr1630329885a.13.1747956618444;
        Thu, 22 May 2025 16:30:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVfs/zUSS/wDRxV0gfMgVCmzQmxVBhUAv6PGmx4J1KZxeoM12aqEKSbM8jmkq0L7vFU/1Xqg==
X-Received: by 2002:a05:620a:6504:b0:7ca:e39b:946f with SMTP id af79cd13be357-7cd467db69bmr1630325885a.13.1747956617809;
        Thu, 22 May 2025 16:30:17 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d502ec0sm11219928a12.31.2025.05.22.16.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 16:30:17 -0700 (PDT)
Message-ID: <939f55e9-3626-4643-ab3b-53557d1dc5a9@oss.qualcomm.com>
Date: Fri, 23 May 2025 01:30:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,ipa: document qcm2290
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Wojciech Slenska <wojciech.slenska@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20241220073540.37631-1-wojciech.slenska@gmail.com>
 <20241220073540.37631-2-wojciech.slenska@gmail.com>
 <5bba973b-73fd-4e54-a7c9-6166ab7ed1f0@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5bba973b-73fd-4e54-a7c9-6166ab7ed1f0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682fb38b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=dm-21qZVQiDOrTl543EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: -dRr701_Ro8yHAfwR7D9FwfLBBBahv2b
X-Proofpoint-GUID: -dRr701_Ro8yHAfwR7D9FwfLBBBahv2b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDIzNSBTYWx0ZWRfX/Weetb+0zCc4
 WVvfgNqW59CSLRXIFaUYDA1hozqJsBlg2d6pmUQGJDlvxQI3v6puq+afMyDM6c5q+DXgNgnAgMD
 i7HZA6OKcphZB05jECIRKFwTcpxSCFdUo0RFfjQWT7SSLLfAqXN02sEBTjl7Ws+8TpuY8U6aczT
 2tKppDHUiF5CuUex5C/SrNrvlXWT3cf3ys4WPnx9XYhkt4yJdujjUXvjaTmQnbvLICpp0zo08E0
 W4XrEJRvAgtNPTs08DpjoHbYzRvZP5DrOZBLk6cMSBeGgbFYPi12K83klrt8beDd14223N2+jh8
 SY/8dPcPyV4MGu8cb3vDr2ZTEgw77q2dVoRPKnA6EAgYvyWvdy3+KWgERY/kjdD9p4oDSkS3AAT
 jIHm76aZ6d0JroptERwz/uBLvXKgz+zVLQhJztihgheNdRsQZsAQqdKAd0jp2afIOUsP33VB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_10,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220235

On 12/21/24 9:44 PM, Krzysztof Kozlowski wrote:
> On 20/12/2024 08:35, Wojciech Slenska wrote:
>> Document that ipa on qcm2290 uses version 4.2, the same
>> as sc7180.
>>
>> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/net/qcom,ipa.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>> index 53cae71d9957..ea44d02d1e5c 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>> @@ -58,6 +58,10 @@ properties:
>>            - enum:
>>                - qcom,sm8650-ipa
>>            - const: qcom,sm8550-ipa
>> +      - items:
>> +          - enum:
>> +              - qcom,qcm2290-ipa
>> +          - const: qcom,sc7180-ipa
>>  
> We usually keep such lists between each other ordered by fallback, so
> this should go before sm8550-fallback-list.
> 
> With that change:
> 
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

(half a year later)

I've now sent a series that resolves the issue described in the
other branch of this thread. Feel free to pick up this binding
Krzysztof/Rob/Kuba.



Patch 2 will need an update and some prerequisite changes.
Wojciech, you'll need:

https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com
https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com
https://github.com/quic-kdybcio/linux/commits/topic/ipa_qcm2290

and a snippet like 

-----------o<-----------------------------------
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
-----------o<-----------------------------------

added to your DT change

please let me know if it works with the above

if you're not interested anymore or don't have the board on hand,
I can take up your patch, preserving your authorship ofc

Konrad
