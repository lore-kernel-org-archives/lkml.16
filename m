Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17E122F75F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557089; cv=none; b=F5SkxoRginrw2bOA+5dah8aFALC5AAKI6pmNlgCZOc6AhcTy9Twa+yEKnBVLXaCiOwFwz9rkfbEOf+tpmsrafV6EVgzgxnx//++6/0uV9ab2pb0kd2Oo+i3Gy6T6rqg8SQfeGEOpBlMglkeQqJL4UTmgHLY7jfGq6WXg2IeZIUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557089; c=relaxed/simple;
	bh=Pz9YSXQGmxj6awXsekNSy3wPHB8djwYyC3iwLF0clFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VUot8NUwnbbbsU5BjooBfUCfTpq66YewXWxEDF8kvCwO2tF/vNhgiIpLfKPKG/Re56HubmF4F1f3tayLSYMFloJW1qc6l5pXa4FLEHn99+35RNAZyCirIYIpO5AvDFhcBdY3yM1GdWu15l+iNSgfn4beyk4ZKUsSQI4Xej9ZznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSnuf/B0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSnuf/B0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AADDBd011182
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8e9pBVilrcDDWGOOeYxVUGMngrXaogSlGUikyjYrFg=; b=eSnuf/B06nneIVJE
	F349OyUQDOqvbMjA9zYt8XFiDbCTDWSnpP4NzpjHjfyQsxJtvvLw2naoL/5S/ggE
	CYYfFDE0GkUwsM/RVXXyQ6KwYsQQvv2J+MRvx6wjt41zXYLCiGdhTsdnJHXSelGy
	A2uzMNXOBFRKQwFRkhe6RRXX6aYRSwFHioYVVYxZDsRMDu1rEOg4GOz3Fcm95kJd
	x/L7NMk6Rcreqwsd84vLQSQqgbtVbpn/9UDkiZaXyTFk9qvnMWELpoN+eUvI2U0I
	kdicBFycXtzn+XNVOCKwHmsNDgDdJ59hZdMwW5Fge59dsCvXFzIEGaSEgrW/+KO6
	sE3IFA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrh8ac3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:04:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb030f541bso11660846d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557086; x=1750161886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8e9pBVilrcDDWGOOeYxVUGMngrXaogSlGUikyjYrFg=;
        b=kK8gLOkKvg7O6RLZayNSVzEhVbs27AcC4SrS/vAuG4iOj9XezsO3YFeozz+qooWI9r
         S9MJNUcqvZpHXH1ubfLNvfZnHGohK2lxJ+h65LYPFVMcKS3cQwO9qtkCpNrJMOOvsDBB
         RJ2kB5pqT3JGWRLqtlAYKHGJ6zWcjMCQKb1zF7imjhsMp/RlZRk33cqoPLGASXtb29Wi
         b1Kh1AbprVXxqx8xA2vU3S8117teLUP4XF4UKQn++z2fdSB0tVvy5WUZlu+b1mUJF8Ul
         w9OgLWiGXfs8cl9Tlhe8ZLfmhl1XZkLfOKveTWQ9GY/tAsoxXNACBktx+cm3N3OzyWaM
         UfVg==
X-Forwarded-Encrypted: i=1; AJvYcCUlfrw5k+GOb8LwYH9AtQIWRTfMXVGws0YThel4zejZewON8LhAj71AULLGE5ExhTr/UezQlmmD5UPOGkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiSYXzbjyM/LF4hlZn+8plqgqOhih80feI8t9aIt6sQ6EATVEi
	CZ4KLNOQDytT+8+KBAktkij5tRRFs5jVeU/zyHQ0dzYNkruexLLfHNPnDIYHwk6tOb4DYZlKcL2
	D5E4u8hgEj/7ZR976koVR9pTZRosKGahpFFtC3XQaVW8eePeP3FPVeEQBExDnivnBvPA=
X-Gm-Gg: ASbGncvSgcem1BeHY2QJVW3v+gP7ozy0m4RoE8YvTau6WIUhfn1evwIbQ6HKBMTQRVO
	ugMzPmkv5ydQGtlZwWcCDTVHFlmVzyT9ZgoLqioOBf1l7ew545NIPJcS/yIcZt5vholC66VcEty
	7kJey5dG7cjkIGw/qm7+MiE9B8QlefDrSzkiOhifBKy4LenvvUJss0cRVCZYUYrLGzsT4u8n1Vn
	crPxQhMhpn+y/lNQFO1bBw+0RjX46DgiXO6Cp9cUH0JlJB5J8ojyLuEkmfRwgU4+/TnOdmgz2vK
	V58U1eV7dqT4B2OSvZF9+fJHP147n5ogKU0N3bZeINQ5Nr9Q637Q9SwHvNBDxuB7t9GsLEzo9vs
	a
X-Received: by 2002:a05:620a:2415:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7d331c39745mr940880585a.6.1749557085673;
        Tue, 10 Jun 2025 05:04:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn+kVYUHownToraRB4x79Lj/LDy5BQWP5oLehzUWRuKEmhnjzEYNAZC1MqSF2HBbw4/JUKNA==
X-Received: by 2002:a05:620a:2415:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7d331c39745mr940879185a.6.1749557085314;
        Tue, 10 Jun 2025 05:04:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d75467fsm722593266b.14.2025.06.10.05.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:04:44 -0700 (PDT)
Message-ID: <945c432c-68ab-46ff-93a7-c60d300aed13@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 14:04:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: add routing
 for second USB connector
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250608-c630-ports-v1-1-e4951db96efa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250608-c630-ports-v1-1-e4951db96efa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=68481f5e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=l5u_8PGahEuQ0IlyzxkA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: yVPxEiYtQoobGvr2mq0T9TX-u1_H2QFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5NCBTYWx0ZWRfX5UU2fzJhgnMF
 LNgw2lnI4+UDLdu1ouMK7x5VzSrDNldwmhgUTzS84Qd30vCSN3/prhWsrt3VuYuEadQUtgplgO7
 U/dxETob0/nglgpUxV9Qum9GGs0PU89qeIhIqxBfSbdFDZiiSExwbPvTciAe9JxCYIB5Zhhrycw
 3HOT+yORf5V7DX3VWpKau1vJinutulZ1+/lXEyXyP0Vi5i8eLMluqBJ/cRqS2z4GuCkbkYyjLqG
 11lRH5n0980IeUUMfWGjWx01e7Mr85zC5QHLhDG5ptxZys3pDcMI+mxd9lLcrmTHAN9Huh+5k+U
 VSzL2xwO/MJu1D2oAVQlBmDRekGCHVoMQVhRMTnxFMqiSggIDKsBxImzjStY+G6i9uaMEBZqVfo
 yQNjmbKRcHnkcoQSxGZjleJtVbVvMVJQ5crh5Wa0ujsmR4yilpdqhfFgEZ4x2GWCZNZxxoUU
X-Proofpoint-GUID: yVPxEiYtQoobGvr2mq0T9TX-u1_H2QFb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=663
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100094

On 6/8/25 6:16 PM, Dmitry Baryshkov wrote:
> On Lenovo Yoga C630 second (left) Type-C port is not connected to the
> SoC directly. Instead it has a USB hub, which also powers on the onboard
> USB camera. Describe these signal lines properly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
