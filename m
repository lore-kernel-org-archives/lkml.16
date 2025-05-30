Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A513AC1
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602292; cv=none; b=YVRUHJwBb3TQF2C+RIBPgRIS1UFgldwoIqWe01Kt8l13NWLZowZ1pCfBVo7W9dp4geEiMpfxn5om+8g2fSdHStvtYX7C63LipJT08cJ9F+eBFKhOlpbT3cWr2ojm6m5MihMkMZGfm+v9FviHHmOMTOxKM8jU2JDoJV5gM6YSHxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602292; c=relaxed/simple;
	bh=UE1nkwZ0zcjYSP/AylrjxytDKypTft3B0EPtc4t1pwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSrP1PpYBL7m/0PrNkebyFD+t8K1pshRFVGW2uBNrjvkqA62MQBULcHhGEjNftthzdwTzdReYtmoXFvtMPKs9FJoUHGHp9G0j4e7qXXF2iQRp/+ORM1fcLn56pX9jvpgmH0/2eUPJ3Ya7s/cbIgPlTpn/zDB1Z5/gYIGuMraUb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hd6mzy//; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hd6mzy//"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAOFBm008030
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ykz22sxUN2Hw1bYKpmMC5UWd4JotYn0mF64c25jalVk=; b=hd6mzy//zMrYdi3m
	2bJGbpXYxsa0Ab+btr+D3e0OwypGudXa8qVJLdhNU6NI5ypfWMRaRstAVuaPFel1
	Pwdetbzwieg17uDIh6Da1+/YMeiSUtWLopLYzsWqIZLXemeoiAq00AKIwMveO98Q
	VR3NUXec23B24SLjGEKo4y3d85RPhoYRGoAVFnkov05BRxzaO4LIOWIEgBjo2Aw7
	EUxuIY942YqFbDf32QMCyJnnZM5jHvt5zzJb7nKmQ0lB9JElbD9W1gFKbREVa+C4
	ZbY3CbByO3v+2rD1A5o+xhissJVFQ3twBCg5OTgx56CuXOqwBkOpNWRED4kUn0OD
	GeEd7g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf94ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:51:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097083cc3so40414885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748602289; x=1749207089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ykz22sxUN2Hw1bYKpmMC5UWd4JotYn0mF64c25jalVk=;
        b=IDqo6wdjmXjtFYehPm5GcVlzfjJUk6taIxKa9ooi1+iqSiMSibvbDFClX4HJnA0VIa
         tZlp3ArgpY5UhVElNTxTqOBTo6jv4cL8MtKoyrX4SFt6R/hmnIG0Kta3Imp+bN2O/W1+
         zF4Hxr8TJ2e+MvE+Czn9DMWWiLqC8WtZLRaD9l5Rpo81cu0UQkPV3UO0nnkaIwSCinXs
         cXsn/UKr4IzP9eFp3QqNJiGN/RkbFh9OknEMDgojCf+22TfQ3YeHdiolyQw9RJlxCz5U
         MhFtOqCKzMJKuJL1nJWisfhUrBBRxd8e7Bv+GnKvjoNlKwY1d8Nm8lOFrsaAXWGRn4X4
         TlOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5AVNiYaFnqq+vOEel5dRoZm0DEUKdcHp+MM0RBTaMTYt8dmUFR5CZCns1ttJWhJO4LKXyt2zzk8OQGJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzotYYla3iv5foTLukL9+jSDTcqSPw8BvZUoQTJ3kmHNDvtdgEe
	AgA2wS9PM+KHDmiNZkrAazUUJv1HI0fJGfCjrBv7LGe+npCaJpzyWASD7w6tD8Ou0B+E2hRbonu
	6UUWcLYAR2sj86iF6A8lDxOJLp/BcBAob2OFbd306h5OK7DMFIBU48qhzSg/08EUearM=
X-Gm-Gg: ASbGncvpOvoGC8w/d5uBr253Qgo723DhoLBohpyzXeov402Q66DPCD6J3hKdr4W9p0m
	OaYrWqkDIPoNQn6+NQfCRvl2pVzKARWGLdAG4CrXUkhyZX0DNt/lXQ9HZYzhXSl+854Gdd65Xgo
	MFgyU6V7K1YNIB1VnkBklC9GSFS142ib4VWTcpCSwDjbI7nutE2KRD0ZTGrd1fz+R9Y5V485G38
	6lgk4WRv5y5LcO/tWb9zCnS9YNVKmVJVslHw1CKodriRj6t9vhJPP2WphyE2hRos+H/ppDcML2T
	dciXEdNh3EI+qS/vMm4fjffXzPzCprZTpMfvKXwAf+YBrGvGBmDkbeKdnFLPdfgyf/3uLacm1XH
	p
X-Received: by 2002:a05:620a:19a9:b0:7c5:687f:d79d with SMTP id af79cd13be357-7d0a3d97b79mr114734085a.8.1748602289504;
        Fri, 30 May 2025 03:51:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHziPYjNP2s6LLQZYshTIYmZqGevpTj1cIMCZjPhU6B9bmfaCGLTz4ZXmXiuXBtFAGhr5eO8g==
X-Received: by 2002:a05:620a:19a9:b0:7c5:687f:d79d with SMTP id af79cd13be357-7d0a3d97b79mr114732885a.8.1748602289173;
        Fri, 30 May 2025 03:51:29 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c593f2sm1428259a12.17.2025.05.30.03.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 03:51:28 -0700 (PDT)
Message-ID: <0f855d7e-a85d-4fcb-aa6f-6254b509e259@oss.qualcomm.com>
Date: Fri, 30 May 2025 12:51:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
To: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-2-c0092ac616d0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-add-venus-for-qcs615-v8-2-c0092ac616d0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=68398db2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Y0e4vqo_zEX2NYFcfF4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bFPgW61GCDSrEbyg-zPlVpxjEUMcmwve
X-Proofpoint-GUID: bFPgW61GCDSrEbyg-zPlVpxjEUMcmwve
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5MyBTYWx0ZWRfX081bBB1z8KKM
 DT4uZ0T3mXFQziangXAWvhXdzspudk0kVpcckkU5wFQdP/3jXCLlPSvMt7LZ5uUbUmE5Ml4HOpD
 89Zu3smXJM1z+5xTnC5pdKlrOTscx+rChYl0/KYTVxH6mwEzZuN1nc/Kt0OlPD7bAIt+7CJdqn7
 AhXfrhTWtxm5eQw1WleEUkvCrQ3LU/S1jNwNdpFcILhgDgdremO2fgB5S24RRNLtoE2ARujcJQl
 HEsiAuScV4Mi8Hda0mcUr1LJLSuONszDWemqBPc5zP7a3DAo7I6HyByz0b/RSypkyQAnQy0gRL0
 vPHJQKLNyWSUjorxavPQsHMsZ2U4aj+JcY/XvsS7VzEKgzdqnCw4MVcz6N4WcbWGN0tGlOfjqfU
 SPohOYkn/NvLn/NoxzKto2ru+miXwnxn1faHvDlDYEuCfy/EnmQNameR4ffxD7jmJdu0BRK5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=698 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300093

On 5/30/25 6:02 AM, Renjiang Han wrote:
> Add the venus node to the devicetree for the qcs615 platform to enable
> video functionality. The qcs615 platform currently lacks video
> functionality due to the absence of the venus node. Fallback to sc7180 due
> to the same video core.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
