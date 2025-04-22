Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D15274FC0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745353937; cv=none; b=WjDFiXuny6TJQnwCt1bweG5SpTC8eLiy5T2qooT5lW0ZO488dLs9akSMZOK0DEoaNZZS2UH/8QpaP+ChOOLNXkZ5sGgAZVWzn/6JCKqmDrGNIFnDmFt5Q0/CRynbH3+Q+sQMw256KZ/JvM51vxrtAdgzTCtAZWhmP5kzTq2liMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745353937; c=relaxed/simple;
	bh=e947s7vj9DgAZEwGThYJOnOY/ENq4ZjIinQ423qwLiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBa/0Uuob0Xn+6Eyxh97L+YYRNYHBHo5g83KqSMA9pNQS2pvWg+jRXOwdGgEzTgDlXI5Uo1hx1f2LbC1Wa7psfxOS2E6ho0Jy0bK60aTgQw9k13GH2RcTng5LFrinQEAMv+QyroGcLIgOqOIwiyV2EWOFfOK2Jw4JkwPQoxWxxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qy8JDyu8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qy8JDyu8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MI6wuN012465
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p7fC+usINhtdyGIUDTo2++4styKlE/llRnmMJX05WkI=; b=Qy8JDyu80CYbPvtw
	GTGMzbXhTYQ+iSI4pRiVEcKB5djT6MIQWevPIX3khy68lBuQdpkq20po16TYgh8g
	wt/8+kR/B42urhicgpy9Ae9GTIcQjYZAHp0YitZLbdurIYslgpky++CRAVLjoGDF
	3Rb4fJrQ0DhzPHB+EBUKHpuIsVqp5kvm8HpSiUeof0De4KF3mxTg28WhfHvja7PR
	1TchLNtVxskBaQXCbwcrSuFBheeOtTvwNlKfeBZXDnOcyV32nuebMQwnkvCsuGbs
	apgyMQ/YVoeoq3komUzxBik2karBl6D30K+jwxPAilXHCD/CP/6U8ccryr0ru8u1
	v5cqPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643wws1kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:32:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5560e0893so35066885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745353932; x=1745958732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p7fC+usINhtdyGIUDTo2++4styKlE/llRnmMJX05WkI=;
        b=EySoyApSWF5lozDTMSNUlhhf+JAaVmUITr9g5sobOiiTKbvLLTLO4UI5LKl4RQPuva
         DtQoFv6vL1Y3YTHQxfkL37D3L9v6tSt+8o+ML+n+no/I89odReAK0oUU75YXY6z/7akh
         +CUV06+2ASh7YKt05XQTartVtDaHOsG+xWLmH2RPe4qeElP48L6LzjO+sQj/bB4gwxsj
         /U1eU/Wrkcn4199DM83AZzFXnht9FkK/18xQkIkVQNxY8w0xyTQO+0g4Wa+Ncf5JrBBt
         /Zug2Av5JNdw0mPKtsOqiHTQHUg4tURsNV4aaNINQWUnDWuPmMQTuwbnDGUkwlyFDVOw
         6wBA==
X-Forwarded-Encrypted: i=1; AJvYcCV2Fwh31OVxPUci2YOBno8MZ4V76HZqIxEnUf88iIdnXIcnqy6PUCbxtUwQd9d/zjnqg/w2PR1GPwQ1C98=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGbWYdye/YcKGMW9ndV5eu/SxB6czmUvdC3GkmvPSUT3L2Reue
	yT7WGTbbESfU+CoRrBlxK1o23Yb1Dt3edA20rK5eGE6iCoDbNU3ACESNfAoev5dVeCODSaoiN2U
	GPiAOf+etaiZf4NcnKZpIckDZg92b5YvGcBi31eLsaDK60ukVKMuhDP7kBS6NLvs=
X-Gm-Gg: ASbGncvNL+iVdNnJvbDwAFoRwxBusO7LO9PswFZU0sdvckYfh1jNLvQzXINKlLu8VdT
	X+HJHkO8+1ihJ8osU7QGStgvMFFVRt32jtZ30yBnl+3JlKlr4F/xTvw0eWIl8cxljgRpU8nbMF4
	9xcjs2FaFiWm8UMfM+Vgh3TJKAW+xQahT3m1ofP+UVUaXlbDQoEL9hvJGgcRd7uqew5eIlgILEB
	naTXzH4yLv07j0LhHnn3tLHoHSplDIyLUdzp8qojXJn3mZHWZw30z1JqRaeKeH83hMHY7ard1vt
	N+efmdYn0i4pwXBd0/iv5L9ndIXbnU6wS9xZZatRDYmVXK8PE4i8Z/DgFrVfT+bxk2Q=
X-Received: by 2002:a05:620a:19a0:b0:7c0:add8:1736 with SMTP id af79cd13be357-7c94d33c7d9mr38791085a.13.1745353932630;
        Tue, 22 Apr 2025 13:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECPN+gnhFLHpQ4DwkU2Hs6fRx+RAoCulz+9BV0umNnTLhXBZYmVSHmE2UV/CVMqwsUJthtKw==
X-Received: by 2002:a05:620a:19a0:b0:7c0:add8:1736 with SMTP id af79cd13be357-7c94d33c7d9mr38788685a.13.1745353932207;
        Tue, 22 Apr 2025 13:32:12 -0700 (PDT)
Received: from [192.168.65.141] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625834185sm6311589a12.61.2025.04.22.13.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 13:32:11 -0700 (PDT)
Message-ID: <e9f3ebdc-78e1-4e95-92a8-5ab97d6ede0c@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 22:32:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Fix PCIe 3rd controller DBI
 size
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250422-x1e80100-dts-fix-pcie3-dbi-size-v1-1-c197701fd7e4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250422-x1e80100-dts-fix-pcie3-dbi-size-v1-1-c197701fd7e4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=6807fccd cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=63VBIPp7KmuLgbtEyNwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LW7oU8u9K_whjLkkTfQ70W63S7ooGz3r
X-Proofpoint-ORIG-GUID: LW7oU8u9K_whjLkkTfQ70W63S7ooGz3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_10,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=750
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504220154

On 4/22/25 1:03 PM, Abel Vesa wrote:
> According to documentation, the DBI range size is 0xf20. So fix it.
> 
> Cc: stable@vger.kernel.org # 6.14
> Fixes: f8af195beeb0 ("arm64: dts: qcom: x1e80100: Add support for PCIe3 on x1e80100")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
