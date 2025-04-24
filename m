Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1041F3BA3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745526656; cv=none; b=j9j0iTI1EzrKUHKicPro3oqa3dUBY/DVFICHqybtytqrvOhtw/zJQjshKaukJ3n0U7hybOHXbegA2aPnpG3OvhXuLMrtjGlzeiMbefJAu7vjDgMbosB382eTVnem1nSw/QEsZeH7bEfomEtTI0mBl/SR+2Ai6TpQIkkW8oTTyqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745526656; c=relaxed/simple;
	bh=11+oZqY3yPlj1UCXYYlzVbHujQ3EtK+Zuk1U8d/56t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urrGEdmWReOmol/9UItReta25PA8XNDFb42QLo/+DLoK72mUJZEDU36+vOxtjf8rcEPiSEjLE/TLN/wEWS7muweBPs9+Rj8gSFjrenbuiAU/aqzjUOTkb6Ebl7uXXLd/k9XvMLXJCE5oUwJFHKPS3ktAUpXBJcPitPKraIissh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z7+mfPAG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z7+mfPAG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJml1w011701
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OrVdlXQhwAviji/junUKUi6SBanWhUpShBjAwIaBg80=; b=Z7+mfPAGnR09NHFV
	KLkeeJm3ChXIVqJ8GC/yJbRe990eCzUB1qJpd9v8c+nWi/1FsHZ4wOfPfqhy26Op
	uCOj/giDN/qRtDNuO4KZt0RMAu+JwCuHxGRpOAfMXi5vSYZEtyO4Pjrtg9y05FaG
	FjvX6OAc9Irx9xhguvLbAuxcIFPNo5XS1DVtmklYE1xg29kgwLa54Nhrfv9wJ6ly
	QZpOMSL1m5P4/Ad1eQ4hCLTPeone40T3t4hiVCnSwccx2oHZPfC+/VfCH4+x/Ss6
	ZkYswBq+ntvtLu3Sw/kMFBAzUc0F6LwmxCN32qto3ZWyGDJlISQpYyUYbULX6MAu
	zRPxyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0eyfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:30:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c545ac340aso19958385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526653; x=1746131453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OrVdlXQhwAviji/junUKUi6SBanWhUpShBjAwIaBg80=;
        b=QlDcxyc7fiMqI5XMwQYOqDFU5t3DvgdoUAcy7Pg62n4kJFOze0P5uEqZQyBcLiq378
         XUQA1+LprjWfSQdbEWQQvwn6IMXGUq/B7SjABHtMk1DG5C7ptx/wyHYXCLmVk7dKL5CL
         ia7HNQlqnafNK0XdzsOf/Fg3eH+QXPofJ/AAWuN6hx5bweaylYxR8Je6s1h2558m0Dmx
         ePBM7hQfdbfHGroHjE00UCDtkhOQEFGuBkh4gllhFGdm4fntohfOBRnpyEucV2GWebg1
         3wRVFIhkKp12yjB6G7Aj+H4mV1ToHFiLcQwuRfkZFOZgEtypIgXo/i7dmYCDUyfmc19u
         8H1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqZnSMXyFncoItV4AzziP/cZitn7aO9ckQJVcs0syg5PXWqwFWzlkGXWNs/srGazHHB/uoHTzlF2zB/is=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPFXooDUo25UNrZjaKrcsosLksDSceqkboXQeZ9GuQOzEKIRbV
	PzatlNSh01cp83UC71rcyKDgVhy8rIPpnA46xNLlNgAcamvd/wFEHxhS7g5URu/tkgmJJqgXnxu
	jadtmApQ0sG4UHnvzcXQaU0a/QRpSIiGcPeJ+sHUZcwg9sU+w4uxoMcYYuTH7fU4=
X-Gm-Gg: ASbGncs034Xka3hsaOf0/StyKYvUVbhwQyV3jBU6myQrvZspexQfHmIjdjSlPhij9yE
	fiAXFSVPsoQ4tLAGBgIdLHqJUulcmdTl+QdfzvlykuUgQ2YIMtWKEKDi/ogSSd5dT8UezplxUWO
	GGIsBAuacJFriVnRx9gXvI9VeplFW7qmpy9LNX6q2h3/OkieHE1yx055PFMYQqYBr/WXgO5pmmA
	KWQW55vhyWZ8ASRGCl1Wu8leaVbQ0FU4bDsVXodNMlIiKNaxe+29RkSqBQbLHVEtijVQaIwMV30
	Uc18Jv2tax1XLHYLvtfVwjK62cPMBLyCu8R93H2Imqf42zFqz7DMrIJXEjGO7xSm4s4=
X-Received: by 2002:a05:620a:258d:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7c956e829b0mr246689285a.2.1745526653218;
        Thu, 24 Apr 2025 13:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRa8MtoW+3I01aUlFs+8CuH59Beo6wFJpbOz4qs/fVt4IP/6FFeT/Y8XMq6k6m3P0kyt9hcQ==
X-Received: by 2002:a05:620a:258d:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7c956e829b0mr246688085a.2.1745526652896;
        Thu, 24 Apr 2025 13:30:52 -0700 (PDT)
Received: from [192.168.65.221] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf9a47sm14437366b.104.2025.04.24.13.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:30:52 -0700 (PDT)
Message-ID: <6b286132-1c56-43c1-a61e-0e067a73b615@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 22:30:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: Add CoreSight QMI component
 description
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-2-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424115854.2328190-2-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9d_2UNPIlLpWak9WXQF6BS1pKxLDBnlr
X-Proofpoint-ORIG-GUID: 9d_2UNPIlLpWak9WXQF6BS1pKxLDBnlr
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a9f7e cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=7qhtKZ1Szi6igWG7shAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE0NCBTYWx0ZWRfX93qkPPLA14La f3S/6HNLXd9zlEu+iMyzYt+D0av1al8b8hnv1doxAMGQWhUrB/qDEFXVIWxKsRH0CJQPm3PkYYu q+pb2KuOdVcfERa6aaINTVVe5ISgCuOe8PvhUwySLXdbU2rXIq4Pv3RTksG7xC0oAZkEMyzTa+h
 +Du7z4NSIS13Z4fy5dqS5HikULD4SOIsuS+Jr+04MD/RXHhb5YSOEL3gGqsyelu6oxHdW9l4zUw sy6sBq9X2hpkd6d5O0cvC8glt7VAj+ThqH8Gb/6GtVb6Q73NoKk0bY4W5HVF3Niv2cpqDvpSnuw MxeXll+gsSAAQ9Yar5i7Sz/e8fZcDHO8VBCsQxvuxvMeJ0y+8zV4Yji2VNtryzRa8AmczdiWQJ3
 lhAmJd26nC7sdyEYkfP9HaYIXEdtp/HL2l7hR12g4lSRMz0BnXnv+4+r6i1l0mrAJoLL6ZGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=809 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240144

On 4/24/25 1:58 PM, Mao Jinlong wrote:
> Add new coresight-qmi.yaml file describing the bindings required
> to define qmi node in the device trees.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---

Is the service-id hardcoded/well-known? If so, we can drop
this devicetree node and create a new platform device (& probe the
related driver) based on the presence of qcom,qmi-id that you add
in patch 3

Konrad

