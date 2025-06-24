Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1C2277CA3
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771657; cv=none; b=ucVV2wA2HtIazWKV+u62G2y3Qez8vMzR9zedmtBKj6FTDKanG+i6osOoV+TVQuyUx2Bpya0QUYYALddZXMCSvScg1GTz4G6rMHlVMhVYTMu0HBQnoAQXu6JR52vAZwByi8ttMYhaEi6TsvACI4t/f26K8NDf3aVjmvKYX3Eb5wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771657; c=relaxed/simple;
	bh=Ojff8sjTJgNBDfg7yjLq90tW3e6ffKE9jvPOd/QwwQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFOF4zk13RzJJYu/xx6GqqBeL0+7YrqvrqlPeQ/o5MjE+efzNJRN7mexD4DUdbPe8ZFqW4gvwag67CZLOHyV+5VneoHcYxCx+jItBGxfuO6lOa/nqZPePMVTGLFykgxw8LCl6jjcQFBUojLGhpev6WYM4N2tHU1az8TYjslytQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muNs6z19; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muNs6z19"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8mpkl007072
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hiikZd0//HiDy1HOJfRrZZxYiF2z/aMJcHxZSnvLNyA=; b=muNs6z191pj68Zso
	j60kmT92ENuQS2L5VJCmXUJJRxf9v/bLOxuhKZGLoBEipEeD4Wuilw6JJA6+sPly
	QBFKRLCDybf8F9gfnogaaK/jmkhUJZTwDru1IkSog1jZL4Jqxu0hDYAEkCxIy1r9
	+BC69/9qMmnQLgFkgLDEfQz6Ep4GA5jy/382cveOk86XUnaW2GtBfUiENRSLdF+p
	0oJp+ClzwnPDrWLD/EJbPu0adEUuecpGyC+0ChZnlADvVvfkuaJhxmJOdFP9TWNW
	kuEUkPxDtVBby2v1SXNGfAufNCTSpYvYVWo9P87w+dFknYbtKKypiIAaOHazLoBm
	Aldm0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttudyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:27:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d21080c26fso143272685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771654; x=1751376454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hiikZd0//HiDy1HOJfRrZZxYiF2z/aMJcHxZSnvLNyA=;
        b=Nj4yXZZz26RbXWWmOqGOqqHqYWnbFAKU++Cu2DxD2Gj80cYCImA6JL+XTBxOg3TA8d
         he4DLcPlKJuUrXGjlDCPreVyyDLHECOWDAxZxa6MN2MGSJV9oD0REz7o7HslvutuzaKY
         uGC6mmGc97Mph3fn9XhSIFKs4fQ8MgV7UQvAg+fmKZN2V2UM9Ai3stwFjXykjD7L17le
         kZ6ISHVOOulqRJMh85bXirdA0OWaXGNqHvGr5plcM2IctwD8oSezQOkZP2cjVBKMDESU
         FvYNur9q9KcPuLgCiTd/kBY/63A6RWNif+uVwScjUtbWXoXI7oiBkhqU4pLa+b1IJYxn
         rJ5A==
X-Forwarded-Encrypted: i=1; AJvYcCV23G0bJxN+TDbq6ITnrhCbun3qptTswNs2/Qfmzqv+joGiA1iNeZfs4XI5Z30sNZWVWxu5vZJOadm9D20=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxm1AwcpWhIiGlZGN/g5mvznyP2DhASrq2vI/Q2goL8QLGonq5
	e70V3GdyPQCzI/gRIvDWK9GvvyJkDbYKewTkurJuXRMxbJPPUWFFQ+MLA26e/BwTMKTgPLhaIq/
	YVWhyL3NFVPRLsLidqJc/nbag4bha1uc/3aXAyOCK/i8/u1V4uDqqISxHuAfl+mKDH/c=
X-Gm-Gg: ASbGncvgRdNFRQLbjZJO9/XQoo8g2TT0ui8Fsa/BLsKb+RKTS3RSRUj+QFVU/rXfcfk
	lx1Jea6eBxXcJt5TeffpCiqSPWXDS1RuawBq1gkXglXAw6O91AOLZfLtimptqs0bz7Q8XDeX0ec
	lZVJzab+f3KTp8nYzV7kdbyYkD8ARh5I076w2zlYUYFivDA6xsRyfpjx26X2CKuBudJqKFu86e5
	dCL2GC4bFstObiW6RV0mYj5ngHiFDPbgUizu3HQA1kstUoe2IpHUdiIy2/86+zOinbo/P6NhORC
	X6hFlLpFZXZgMBsF6yWJP9GWU1URYXd6h5iHfeKc2tFnJed9l8lOYnQfUKkN88vNAcASQrZuXas
	XKho=
X-Received: by 2002:a05:620a:4594:b0:7c3:d752:f256 with SMTP id af79cd13be357-7d3f98e73d3mr834129985a.7.1750771653792;
        Tue, 24 Jun 2025 06:27:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT5FK5dyTXbZwML/Egr2jcgabtl1hwD+zZ2KIp8tPHr18q1VP25gyb85H3MxSXE/q8MXAvUw==
X-Received: by 2002:a05:620a:4594:b0:7c3:d752:f256 with SMTP id af79cd13be357-7d3f98e73d3mr834128585a.7.1750771653380;
        Tue, 24 Jun 2025 06:27:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f485e1dsm1025338a12.62.2025.06.24.06.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:27:32 -0700 (PDT)
Message-ID: <0826de9f-0125-44d9-84cd-1c52ba199a4a@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 15:27:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5424: Add reserved memory for TF-A
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <quic_viswanat@quicinc.com>
References: <20250624-atf-reserved-mem-v1-1-43b1940e2853@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624-atf-reserved-mem-v1-1-43b1940e2853@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685aa7c6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=pHj3i8gGA7zaLbmuchoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YiZolfSDKpnyltxa9ILTAJX3nWRbbOaz
X-Proofpoint-GUID: YiZolfSDKpnyltxa9ILTAJX3nWRbbOaz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMyBTYWx0ZWRfXzMIWRmbdBPGO
 jNIvz5qlHdrFW/FEUjvBhWW5mQkyaZ7uWQaM8tXT8y2pVRV2weiPVN3VMv2g7nEQ7N5bhpEaV1+
 ASmB6r34XZqFrGZ/ONsBqLAaD3bWmdYJV3xIzC/XBP8rdbK3/m4fcImlkQ3ahigp6lEAn/7CO+8
 vlLY65s+YLqwxtGuq/w9nSa46YvtJswWLFq8kEm1ui25vMgigJSy8r85jwzHcoQHDLqYQSde3XN
 ka6upFGy1L9aI77EFd/VoHJw01kWHAichcKUtLHp2uSO9tingC1ZhStko8292VMbd3FYFjF9JyD
 USw7eg6TmNteHhigGRqI1OJhTud8anJ5tOjpaahley7Gs1Z6rWkQgQbq0hexS72h+ujneovYb6d
 npPeZWCLseQ2HhzLcEeU9dfvF/MivNdWpgVM4UKCNJziqTNQvIKus1OItHJU+mtv4XecnzgO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=534 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240113

On 6/24/25 12:36 PM, Kathiravan Thirumoorthy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> 
> IPQ5424 supports both TZ and TF-A as secure software options and various
> DDR sizes. In most cases, TF-A or TZ is loaded at the same memory
> location, but in the 256MB DDR configuration TF-A is loaded at a different
> region.
> 
> So, add the reserved memory node for TF-A and keep it disabled by default.
> During bootup, U-Boot will detect which secure software is running and
> enable or disable the node accordingly.
> 
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Can the said u-boot simply dynamically add the reservation then?

Konrad
