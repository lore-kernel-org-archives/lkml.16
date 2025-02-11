Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F0A1EF096
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280117; cv=none; b=fWSHeMJufDL6z7Rfw1YU0YF/R3hvYVOyx3G3AKNAem+RL+l/UyWcOuD9C6Qp9Ev8HgC0PJzDuE0mvhsADGCJXbUoFr8PNJj5lor4GPAo/vJ6znN8ZFFv4X07aBkrILEg7vJRuNq4n5AFfaXQtNnzNSU4zylfIvTpkOKdiQ6UZLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280117; c=relaxed/simple;
	bh=7EBzLd/MkkAQO/2gIs3RgMZYWCN0hifel1hX00qZrX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LPcQz2zpEy6GdmVjxq3ZvZUoF2wmOBrn1A+b67TmyeRBMIm1x6i/gU1WBk3u4JIxhPYE4tLpmfih6io68Tt5f7ym2JbljmP2cXaE1YyxcHKLh3p8hwkH1RsOrUCglQVlHC+lvqPxdc1Hp3fAhLvpQtR8+LJklwVqZTi2xee2wPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQ4lQdem; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQ4lQdem"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B8ZPF6002266
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WxaAP2OfJQcefUPkd/AkugD6llbStw6Nvz+c51lPgbo=; b=TQ4lQdemhNvxlgq2
	XeHBvjp7cWkPU71K165PmuaP/MupUpjICDswGQAaxophv32VBKQQm/wMs1zW7J4g
	nLsNkkz8dXrA59l+2KM6w4/BYqafJkqh9PRzP5mjqc8INvndb9ytXWBrAP2GBRie
	DQ1yTqAezUDA4h1zCqpeu6Tg38dtKxNu7B/CekTAMb5pDg2vM9eTz7fy9Ok5tdnl
	ljgJDciZLsuCB6+daXRR9M8iUpc2P29t8e+SXdJHDh0Ngi7Z1sWFEhlPCz6tjS65
	5NeTt8A56w6OflbCArJPCQWpVjmFnneAaRnA8t+EOaUWyXNrZzru3g879zgRg6cw
	yWkksw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxm592-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:21:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c05239c607so58525685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:21:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280113; x=1739884913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WxaAP2OfJQcefUPkd/AkugD6llbStw6Nvz+c51lPgbo=;
        b=Fjqs2hwu4fmWxVivHp/5Xcgj271irYzhKmCPKt0MeVfOdQfZ9uKOIp24FL1ecJFmEp
         jCWYFgAjGsIl2Jzq+6zn+JpFr6zDwsHq4Gw7jDhMDK5cx2t8Tlur8j0JigjKp9zcyuym
         0gKEjS0IKwUZ3A5IqsbIE0wUmwyNU87K97tmS0Uv+41OBcaaSJKmDs+1PGyTg5UussU5
         p4/GfrIpRU7v0et0khMXxGqBn97Bc4KVHU52LaurBVzu7wyjA8zsVFcu7DKz81r/vvvD
         1z/AqYJV0BzOwu2wwIfecftF9iJiuKJhmSmpt1YE0R/Cghu6iJrMju6q/xhePl9Iw7lv
         mRjA==
X-Forwarded-Encrypted: i=1; AJvYcCXKHVOhG6tB1t5dZnu2Qiz2+Sjks25ZOcDKv5Tb+ygwQUqPPjasG6lC5pkBfyueb0XJkNRiD60pTxkwkVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsg90KeDNgPpdOWtJFiENswt8u3uX1l9HVd3buck61AdYFFOLC
	MMiAZJPrH8DQm5imdsRklQ/l27Qd9PwdTAXFjbXd6axy4k+VHlH+6xOQweX8s8398U4CoOPYD06
	+drdS7jTc4ZwRdNQGNBA/BoU+ecAnFKyq3TKEcCN5upD3fHwPPyYLUjewFJohJjU=
X-Gm-Gg: ASbGncv9QvqczpwUWqlabKnYo4kMTUKhVtVzRsnwv7jofSTdWzXU9VkGhK227rasAir
	vulYK91sOdc9xQZEZwKHaG/lnq1ZMCcEhzgoZWZ9ue2Oa8tituyBoySluxVmeI4HzapmjXzCFwI
	xAsLZs96on2PO1BbOW5LAbGdcPwzXbygTEvXdAVjkPyFdmivIbmWJvBpsI1a4qrG4sNqOO1Zz8O
	Mn/XmYwKnqmFozAgTgfehPzlig4ioez3wR8hyRFNjNquw3bwVCSK2JjGhZzC8KMdmEJhYovqVwK
	1dVFpKrCq+4t8IS5llbjFWAWViBavw9VffgK1v7pxKmUJ73t23YXKKOCSC4=
X-Received: by 2002:a05:620a:1a28:b0:7b6:c3ad:6cc4 with SMTP id af79cd13be357-7c069cf37c0mr143517485a.5.1739280113517;
        Tue, 11 Feb 2025 05:21:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0dqsw15wKwS/BY+L64XWNIZkK61jXi1TTzfL+uXdnejS6AhoibNvrqpmqVJiiO/CfpHiYiw==
X-Received: by 2002:a05:620a:1a28:b0:7b6:c3ad:6cc4 with SMTP id af79cd13be357-7c069cf37c0mr143514985a.5.1739280113155;
        Tue, 11 Feb 2025 05:21:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7adc4sm9578260a12.19.2025.02.11.05.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:21:51 -0800 (PST)
Message-ID: <59592224-7e99-4eba-b41d-7bfa6b1695cb@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:21:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8750: Add ICE nodes
To: Melody Olvera <quic_molvera@quicinc.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>
References: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
 <20250113-sm8750_crypto_master-v1-6-d8e265729848@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250113-sm8750_crypto_master-v1-6-d8e265729848@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ruC6yz57gRHmo83XZPpS4uLW8b-33MjL
X-Proofpoint-ORIG-GUID: ruC6yz57gRHmo83XZPpS4uLW8b-33MjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=765 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110088

On 13.01.2025 10:16 PM, Melody Olvera wrote:
> From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> 
> Add the SM8750 nodes for the UFS Inline Crypto Engine (ICE).
> 
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
