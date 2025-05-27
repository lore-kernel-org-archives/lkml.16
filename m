Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A4179A7
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345521; cv=none; b=AXB4UgpFnId5XRhjtiL2l6cqLVbT2dCDNS3rl7ftf8g4PjmkcsFNFba8zQ/E5t8uL3KL06bWUSyq5GwsAd3z8ZBODfMkzvRpJ+WaD1Q7xj+UTcNNqYEsiq+2BB5uoVNEEdB2kYMH6KSYsb6acBFmWDqPvxW2zuls+PYFWhYxEMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345521; c=relaxed/simple;
	bh=XCIdrdZzFWi7msDgsBaY0djiaHb+xsYdQKwWFJFFFno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qc73qEM1NhgZHmbzLTOaEQPFqVoRSii/tz5rhchJHYgDXUghoDZEoEb1tSe2O2+YftI4jPX6WPF7+G8drSEiJsfX6uufxEGAnwDfPA2SNc2FqqOLOaDgBHzPrrPohuFhdZm4/fZtZbU3qXk3sHXX30YLr9RO6hYQ7/yiibpQfNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1715I01; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1715I01"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R2wgl3009222
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wr4bynBdw+PjRhghTsUSTdSd32On/wQ2FmoyVdHbVwI=; b=B1715I01l9j2HcEy
	3T9UHHvz2QTrUMgaBfOGulglVek8v6wSYzC6j8Yvrqnpi8oLPd2YD18kYQnM45UG
	g+/bo0B4YhnhOeTQmT0md5mZY17TZ53Fb8MLmTJFD2uaw8+ay8lLBp1uw6GZmlhv
	HUfMAgl6c+ks33umROR/2tkVZxz34cQhoEg0l8bRTlVi4H4iLtq1njrpRlDyrVqB
	Xt3VZN5VVlEHZ8XdwXnagl8uCSH45oR9ey6YD34MedZrSUpprDJznpKq11kvlol1
	KjPbp6SG0s9zsraOkeZWlVoTEo/5LaBpjFT+zxCD8pH9rfntXEwt7k5Ood8HvA9E
	NCyx5Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p6nu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:31:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2c8929757so10324896d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345518; x=1748950318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wr4bynBdw+PjRhghTsUSTdSd32On/wQ2FmoyVdHbVwI=;
        b=OCgfnNBr8ctUR//Jv7ECOq7ICTHcPRJu0ey9uwLL3ceFQS899wxSbR58lnych8TDq/
         T3NjKYq8CWn+5t200ljc3hlk+eJlZgYHWOonNwabuCY7isjOZ844QxNfJIsGgts7IMjY
         vriSWsTdlXRsfRF351ubZtheNWmRZJdCCUnHms095Czim529qWvi8IYGpA+81AYToxfL
         1eOjwS3VRO2Sue8u0GTKfsw4zV8JxMxdTI6llxtpxpO9pZblTPTO9T68GhyLEYQ8MAIz
         RqLRWG5sU+rBtCk6ckTl1i6PRjctveRo8Vy2WmfxDyiJ/tP4GBCn26TLT1Lt6JN/+0vO
         j8eA==
X-Forwarded-Encrypted: i=1; AJvYcCUXDiDlGPg08Zi9yIE+RktL4Y3SBaAMI7YhNH5d8Wl2aFzxux6O1IbXHgKs+P6573lOciWkF8GMt5cJ6k4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx74K5LF5Dy41kmvsS3doeqKF9D5tB5WOLNb9c1Ijci27F/l/Qv
	MSOtSyoFq8csHIlc3P3Lwnb9Ij0ak8o9qI5rRzWyiXFhjxzLFKCFLHH8UqKHFxmk43rKvtejN9R
	pidXAdudFaNzVHngGvGgMbwBa7CyBP5o+CEd7VX+biyTB7+oGqKTEi56p71kCjrHaHUg=
X-Gm-Gg: ASbGncv19erHMAZVB/dMWgZq9RNsUxszA3etNOcTABEe1cmXsC9hIKHp95zZ1SPN+aG
	4XrkdDx172QkUJ+JWi6GnUPDHtDVBC1wzFepWokqTb96WpRBL5sN0oLOI7job7MoYIeMIe1kR/G
	K//oVHCGgAP/2TzORjI7ZkeaLmYrqU955j0Zgn75rxO9lNP6dhPujV8sK4SbaFGmWt4inzbwSkU
	43yv/Zk2gskyJlWENjdwZgTP1IGPlGl/sKmn+QS3p7haaek8XgirNE5HoYS+yT6sRgcirCV5aEa
	j2ChePwT+VyCbJ1s456hm7nhgofF4WRwSBWVoDZkxYo/S3oyah0zRyd8KjZ71OeRoA==
X-Received: by 2002:a05:6214:764:b0:6e8:9351:77f8 with SMTP id 6a1803df08f44-6fa9d16ff1cmr75912126d6.7.1748345517497;
        Tue, 27 May 2025 04:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErCTbBKgoT2MX71KELY5FtJ0xIj3X7orP1TK2iTy3xBDcaJHppmSxcImPiEugk7wg0yFmcsQ==
X-Received: by 2002:a05:6214:764:b0:6e8:9351:77f8 with SMTP id 6a1803df08f44-6fa9d16ff1cmr75911886d6.7.1748345517158;
        Tue, 27 May 2025 04:31:57 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047be1sm1821279566b.26.2025.05.27.04.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:31:56 -0700 (PDT)
Message-ID: <82484d59-df1c-4d0a-b626-2320d4f63c7e@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:31:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
 PHY support
To: George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <aa3b2d08-f2aa-4349-9d22-905bbe12f673@kernel.org>
 <DS7PR19MB888328937A1954DF856C150B9D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
 <df414979-bdd2-41dc-b78b-b76395d5aa35@oss.qualcomm.com>
 <DS7PR19MB88834D9D5ADB9351E40EBE5A9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB88834D9D5ADB9351E40EBE5A9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: L3R4_LKHtFk9hkoVDBV3NKvpt28Ern54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5NCBTYWx0ZWRfX2r8OK/E61xpd
 EdyjrDPu8/Qr/SGwzWCG+ZiHUEXoQVmqvNJBS6FGsQ4s7DnWFgOTfLAsXhjrIJY1vbKBJEs1vEJ
 uBEC7fAQBwPBqedHVnsv32KU93ha/MpBmujPsCspbVxswBDeCuIBPsZ8PBHgdbaEvRAfEluU8jw
 XiVSDNq3BV1mfpJ2NzUTGLCy6+i9PczPrZzeLOycYBBAikD0HBV3HBeZjFy88TpMqg+8ogghPTv
 pPiH7WSSFG9PN8X/fAthWxo8ca29h4h/IfnIunbTXC0v36Es0knR7LAE+nf4aQNL2hyjbnR/u6r
 xbTKYfapItJVqZPM00PkupO9aqMnzqfjHQkpaSrKfV+Yp3t7C1umpeadcUxaT4lWPWxqu+yUuSy
 CX4uLqU7VgHXp7RjRfQhFyhRs3CzWquTIDK30nPbECawba4j8DUGMmZL7M07bBiPz4/q5heA
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=6835a2af cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=wWch0s3tv6xjeYHlD58A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: L3R4_LKHtFk9hkoVDBV3NKvpt28Ern54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270094

On 5/27/25 1:28 PM, George Moussalem wrote:
> Hi Konrad,
> 
> On 5/27/25 14:59, Konrad Dybcio wrote:
>> On 5/26/25 2:55 PM, Krzysztof Kozlowski wrote:
>>> On 26/05/2025 08:43, George Moussalem wrote:
>>>>>> +  qca,dac:
>>>>>> +    description:
>>>>>> +      Values for MDAC and EDAC to adjust amplitude, bias current settings,
>>>>>> +      and error detection and correction algorithm. Only set in a PHY to PHY
>>>>>> +      link architecture to accommodate for short cable length.
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>>> +    items:
>>>>>> +      - items:
>>>>>> +          - description: value for MDAC. Expected 0x10, if set
>>>>>> +          - description: value for EDAC. Expected 0x10, if set
>>>>>
>>>>> If this is fixed to 0x10, then this is fully deducible from compatible.
>>>>> Drop entire property.
>>>>
>>>> as mentioned to Andrew, I can move the required values to the driver
>>>> itself, but a property would still be required to indicate that this PHY
>>>> is connected to an external PHY (ex. qca8337 switch). In that case, the
>>>> values need to be set. Otherwise, not..
>>>>
>>>> Would qcom,phy-to-phy-dac (boolean) do?
>>>
>>> Seems fine to me.
>>
>> Can the driver instead check for a phy reference?
> 
> Do you mean using the existing phy-handle DT property or create a new DT property called 'qcom,phy-reference'? Either way, can add it for v2.

I'm not sure how this is all wired up. Do you have an example of a DT
with both configurations you described in your reply to Andrew?

Konrad
