Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0FD233127
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546945; cv=none; b=GJpqxB8r2SU3W/X3EkYNTS7Qoac+SbvN+kg6sPy+PJ3OJqSWUgMQNU1fVFhu3iZAWeLYtQkPvOdAaYE6pTi3yTXvBZVcNZJ0Wk0YPMKfxgnXhy/oYdD41vd0JffLr/3aKT1p8ZWpcZBZfxr356M8JReKrH3xZ2X0xByJE4t5ow0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546945; c=relaxed/simple;
	bh=J+SJbENcZzr3wa3LuCkGIMYvc9Wx+YhsJO/WnNNM//0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T6/SztSuXXCou0tbzZvC4x1SInL2Ele+8Krv67I182jYASsWzRJdY5gBryMu9vUqmyt+SdqQIL06fWmD5BwvlOvXDyfZpcsuxONR5tGFfd6Dal4PavnHNhXvZKoG1LqyKZIUlqSP4P53iuVnfhOTuD4vsVOv3jA4NQ1oWJ3idNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SdyL6NmD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SdyL6NmD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563B0xqx029541
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 12:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B1BDHD8rdpLsG7nbC4cPoqciQ4K/T23o4koQ48E1na4=; b=SdyL6NmD3SbxUFKN
	+9EdZai3ag+McJUQHc2i6yqr3NIg3YbmjlRx48Dtuk10lcWpqp8TzLHw3eiqnr6G
	MWw0Sa9W2FbHQnXGcTQpVJYPPJuPc8u4rXmHcHJnxn2+XcxEcJZw6rkwJpIGxLnM
	wJnAGD4V8s4RfAtviiJEIVhr2A5DCI7QZlxekX39vcNje69AgTp4QaOd9KN2JLjK
	QZtn40GpiQEptbCgxzqstnSeHTpPhHAkUao1UbGYr9Y2/66N02FfA0DHEZpQfVnl
	k9sKC4QIPElfvFy2A9QCVGcD23yXp6VcE1N3TLIF3YE1avS4H9b6zRI0F+huyEqq
	nXbf2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s1qt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 12:49:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2355c58ebcfso18687725ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546942; x=1752151742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1BDHD8rdpLsG7nbC4cPoqciQ4K/T23o4koQ48E1na4=;
        b=NErMMWD3IeqYtxqAe8zbux0DGOFAH3sABujK0EuLJbu52YUkOi+VOGFNUNWwtQNLje
         +VqR6YBi8YG2LPduOxbAOriQqa9VDE2T5Ep/oSReQMDZQIGdfk1GY8OoHqIj8fhtbuTn
         KDx81z9aCCrKwDGVehrVL0awhT2ryVR84PKqYepDjYJnUu1aaYbCJ7ZitR2qlEj+Hqh0
         rC9sA+VuBdUI7sSZiC8f7XrD5yxPYwQR8AkJJt+7mdqItBf6PXzHItcGKojk3LZeejuu
         Ka4TVg41AYN8vI6TmJym/hERw8Uc8CbySUBgkC5K7wTLpfoCQY0cqOIXq96t7D+/bOzF
         YIHw==
X-Forwarded-Encrypted: i=1; AJvYcCXTtiM1AB04JxwDnLwQ1EytLXBKG9WC3RTbfnB0AVfxQMq5InrrXc/+pGTyRVq3nsPBHN364D1iAR4jN68=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCFuT3t3WhVUu7ead20ND5WFvi1HTdXj/6Kv4zSzhynUeea00
	yCrO49U8pIHWugfOHzvmDbKjdrb9HdrKcGkWkVg/a2bremDALQ+xmnQ8ZVBMt20qbbmSWsrxbm9
	lXB2IXLc1hVpS7ZSZKFjKdKYtXDteOc/HM4MvZTdEN2i4AeOVQaZ6FWOwz+MbVjoZP35j3nFFsm
	4=
X-Gm-Gg: ASbGncvJzIKSg+uRYLPXYm+2IrOMy2Wonuy860zfQlXvoH+rQmH/x1p0EoEKu0sShXm
	tNFqRh6KeNhwPv9USK+L/r/mFdayPJ4y5fVKmaUtdfPvnfU1H9l0JCY6LPmlGxdknymq0zE/qRE
	ESsqHvhJZ784qJn6qq2vwU8dzmtYYCZSOd6HoF+y6mtY8hodSis4LY/5Uva/F2HsplW246vCk42
	jwKWUd7uKL42CtNh1CSYryDxOj7fVKhI98mc31MniJJvS6gi6ytGMTBh1B8ggLkbsJLhkUm7Su/
	fCEsDJdzDBmcURWC3YAxtIe3oMLuq6WKU2M8HnVE84aLBQPL1MklyPybcnItZnQro7kB51etvPa
	fieDJpCG9
X-Received: by 2002:a17:903:24c:b0:234:e170:88f3 with SMTP id d9443c01a7336-23c7b036018mr11881495ad.8.1751546942308;
        Thu, 03 Jul 2025 05:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyYfLlo2GEq8Ouln1NSXufpOkD7mF/rn0GS1zQ9TiBnflP/2X+/xtcTxdUhHBM+1ldcd/Txg==
X-Received: by 2002:a17:903:24c:b0:234:e170:88f3 with SMTP id d9443c01a7336-23c7b036018mr11881275ad.8.1751546941924;
        Thu, 03 Jul 2025 05:49:01 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290e37csm10488156a12.31.2025.07.03.05.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:49:00 -0700 (PDT)
Message-ID: <ca2db550-93df-4e8e-b0bc-f4545ed4d892@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 14:48:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/3] arm64: dts: qcom: qcs8300-ride: Enable SDHC1 node
To: Sayali Lokhande <quic_sayalil@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc-owner@vger.kernel.org
References: <20250702085927.10370-1-quic_sayalil@quicinc.com>
 <20250702085927.10370-4-quic_sayalil@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702085927.10370-4-quic_sayalil@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=68667c3f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=kMNwB7i4ENppRu3dD6IA:9 a=QEXdDO2ut3YA:10 a=I8LdOwYyl7IA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwNyBTYWx0ZWRfX2rDo0ThdYGp4
 HWFN3JgF+vjIe6EFGqe1aC+PEG0XhLHYbX9M1XIJHblzpE+9QmHBFxtcwVTCgoXpbGPg37AUGih
 wx+1o01wlaLTiHnZ3L46xrhE7kXd4nu5/bTCvM1Ymi2TaJ2Efvh85kuhHZnD6EYx0TxGWu8uOFT
 yCgPY8fTZ8uB6fQdve/62vyhPjRJHA0n78uHk3XIXvxVIYF8U6fZ+QoeGfVl2WWiqjlPiFM8md/
 tBfQ8FdkCJfoMlu/NMf9LxJFRUeZVqSo3I2mSSl9/A2+RTEs93TYJfsOZGa3/ZjcIsGwtJQr7eQ
 FFYrJQrKR0/ZYij9IUiU/lS+GFMLONkPQLgomt/cHQie8he94HAtQn49yS7VLSzLhI731HRY7yB
 1S9/EU5OojGaNyN7DEL6GuHnIDqiNKSA4WtE5ITjvzWAmWqqPj9o9IVRCQ04m6kFXsrCy61F
X-Proofpoint-GUID: 8MPUg1F2j_RfRHRH_36Gzy5D4F_hklXB
X-Proofpoint-ORIG-GUID: 8MPUg1F2j_RfRHRH_36Gzy5D4F_hklXB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=800 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030107



On 02-Jul-25 10:59, Sayali Lokhande wrote:
> Enable sdhc1 support for qcs8300 ride platform.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
