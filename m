Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0581F1DFE8
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386054; cv=none; b=LB/13noyF4Q3nndh5YuXFhSC18dkZdCerALk877wsfmtYd742vwPbhOJSvJCDzPB/LXI/upP8swhvukhjqyi52swFGIFF3NcpJXdrHQoi/SQw6MZ/Ov8G5Lpev11kXtIiXsfOJU8i92rrotAWLsPj162YUcvwxYH6SFEOY8cXRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386054; c=relaxed/simple;
	bh=jnZhFIc60EpD17GuUJxPaSX4JS1jVvOVrSRcJ4Ikqws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uj9apJnnGEow9I0Be2gYUyITPNF+PQ8pKg8V6vDvD1pUGQA8wN1sYGubFnCUYtLjstgH0aMpxpM73LimjQVO6JXqOq25xuwZSDxhJVVGqgZyNJ9BkD0ZR/JP63FnBADL9Sfqh9WEj3+u1I3n2ut2J+uCvEzx0JRhUlCgswtIdP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOy6A7NP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOy6A7NP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G6MuCS027744
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	emNqD3+84OsoC1sz/sXLny32zR/CcxC3pmnwMkCRoCM=; b=YOy6A7NPx6grlFyP
	xIY8FjBE6HADmb0Dksh2OqNTkJCjHnpZl9scKhjH8jipX/dAPYOWESQPyJ7aH4kK
	o8mKWhf9m7FNJnJAqUj9aFvPLeBpMrkOkugSLQFf9jEQfGyKZcX4RJMc9sDcyO8+
	yNXuHxV7nZAjApOBM18obg3e0u92oWcD7e3nfkxOxBpg7xf9b/usDQbvxNigP4g7
	PcZ8W9IQXs1ib/TSOvT77adv4fmIWMeo2JtCCaGsx3VKHzwMUgdYXvFlycEQ8htT
	hc/zXNJkvnU3yaw7XIYfNIyyYNH4qWCJnt6J5LUd0XdF1bcm4GS5jsaSsQWRjARO
	A954PA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p01n0e9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:00:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8aab0a94cso2727516d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386051; x=1747990851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emNqD3+84OsoC1sz/sXLny32zR/CcxC3pmnwMkCRoCM=;
        b=HBBN439/uQkyaCReL3NdJVzqhvcJFplFKmNUuq0OxKbaa/jdJKZmQfPGRdKnhU38oX
         zh5QKDnfUg1ivq5MsuIga4646Cnxeq0uKtnEgKfFubx1IdY1++8aHM4q6IuUOoUSGBCL
         h38WvzJ+LNlKjPTl2ALLS2iMPwYUimF9nppnNe/WkomhOQUE/nijdlx5lwxLYgSngfn9
         OtguY5rHD4YGnGcb/HFr/RSHlzqC/0TCrHzy1Dy/kmoC5N2ZjBiVuGuTpPpYTu6PK6up
         cfuNbvlqyN5e6AKWXUaVxPImjvRVIIvgaHPpwg66isVW6H61eRjFDfhzjKOKdbzCaNbf
         qLsQ==
X-Gm-Message-State: AOJu0Yycw71R5MP8SubjgsTgU5J0g4jt19O3cD33lyGJr9bscosLl0Aq
	fb7RXki0mOzYu44s7Wgu0wFa1exz3csP89Ceja673y9yYSiN9CejFDnXZqsYM/xjUiXdY8A4hyJ
	bKCZJ3MfHzB35fB78VYEv8jkTewPEf4BF0WpjJxoZck2oY0kK8C4Lj5YVSRsylBBIBrQ=
X-Gm-Gg: ASbGnctCd9Uze7IUoOivB2AZhioAP2ODM5asRPZClqR/4i7rxfknJ243g/GjYurfv2l
	uFPmAHgWcjdSj6AdTyuLhZ8EzQxyLVpy0b/beEqzaGwxXwCubgarZ4mzTKvKTe4vtFZchLkcYTd
	xw0KsOW6qMPz4IN2e6pwdD0td1S+J+wKTvIsHmPwv/qVtKdw+6yrWZoTaDAoc7YBCTyTj2+YJ6k
	zv+8gPx7pF0zZO3eVZ7t8e40KU3v8eaYlNBJcjoyqUbC+yCI+SlGNfcnlAcqE6tFlUNejKXy+eM
	e9tk0qlb6SnANAxwk6e97fQV3Dv489JwK3WEkSBhFqF5+T4cX2Rqr+jhvNHgEGg9cg==
X-Received: by 2002:ad4:5f8e:0:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6f8b087cad8mr16035606d6.4.1747386050647;
        Fri, 16 May 2025 02:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFssDUTPLfA8FG52oie+qg7EwCQlej6WrDyiMpP6WkKB2iMQNNW99VeHioL7oGkK8GI+fj7kg==
X-Received: by 2002:ad4:5f8e:0:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6f8b087cad8mr16035296d6.4.1747386050098;
        Fri, 16 May 2025 02:00:50 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e019asm1055150a12.36.2025.05.16.02.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:00:49 -0700 (PDT)
Message-ID: <f5e1510f-3496-4f5e-b093-623d3b4be428@oss.qualcomm.com>
Date: Fri, 16 May 2025 11:00:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
 <20250514-update_phy-v2-2-d4f319221474@quicinc.com>
 <8ba99df8-012b-4883-af6a-970dd9f877f6@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8ba99df8-012b-4883-af6a-970dd9f877f6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M4lNKzws c=1 sm=1 tr=0 ts=6826fec3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4QkPWBSfZRwaAYBdk_UA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA4NCBTYWx0ZWRfX7YPY2o/fkfrJ
 RC5qUdsOKGB0wNRxoJaqjbyQU6XC3cyOIwldL3Jk2+Gqu6ugBl0MyPhXzULlgv7ajqo6LXAaaQv
 GOma7I8uk8PLHUV2REfARICnbDkhRHL4fGc7xMA+dxCXX7AEeW8aJG+lTV3PGWSAXyTc7PpCmWk
 NsKyGdg/GFhJLhNueFxLcQqFC7fNTCQz8F3rv2PDo7Vd7/YaIK3rIm3UYcUTj7i/T/d/jBf7nj4
 nZN+pHeNLJeoIU9v8CvbDigDfEiRGZnC1M1h8ihe1qfKkuVbO6FzyHRP9DMwIrxah8DqUYU/jU2
 hw94v5iFepLakU5uOsIE0kOO3wl5zXEg8wHwu5qlTXOjs3qvZ6iEIs4p3nIoZhWkyTqQe/hcnSw
 4aZ43VO+ySHwq9/6o56ManLmrpDw/oTCwyABVsxvkbLktLit4/AErW2+k5PWYfjQzfVF3yFh
X-Proofpoint-ORIG-GUID: eDiX7nDaOzJIf0GEQjzwcBBGdXqP-2t9
X-Proofpoint-GUID: eDiX7nDaOzJIf0GEQjzwcBBGdXqP-2t9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=959
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160084

On 5/14/25 6:38 PM, neil.armstrong@linaro.org wrote:
> On 14/05/2025 13:37, Mrinmay Sarkar wrote:
>> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>
>> The maximum link speed was previously restricted to Gen3 due to the
>> absence of Gen4 equalization support in the driver.
>>
>> Add change to remove max link speed property, Since Gen4 equalization
>> support has already been added into the driver.
> 
> Which driver, PHY or Controller ?

Controller, see 

09483959e34d ("PCI: dwc: Add support for configuring lane equalization presets")

and commits around it

does this change depends on the patch 1 PHY settings update ?

That I'm curious about too, but I would guesstimate no

Konrad
