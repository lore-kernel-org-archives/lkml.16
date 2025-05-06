Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9017262D1D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540337; cv=none; b=EDUQNCK5EQgq79WJgnjSuP63TNFqtCf1XCFUdIBz+E43X0mzgpAR17X66aZQ9meDMXrEGEX3uK68LHd0YN+QvM/05iitT6H8nAChFcLx0fd96nEwH5tni4EQNLzeLMopiNent6pTrkipl26cpxQqZE+iZpOPDFPh+lN0PESjthc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540337; c=relaxed/simple;
	bh=z+YYjJdtpjDJcpCz9atFWbn4uZAT4qMkpTew9VCqKPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FafSqWSw5iKl7rfNuq6nuJg+SXoNw7r0H+Ha0kbrj0cHsGasNaZFVIaD8DUaOGXc2E8wdX0ueUyPf/xpbOpe0zc3wN4gqKf3lZA4KPbsjlHAGgjKHXr3OQWsU/QTmIoXCbXxXwep2f6qf2sbln/5sBCToLo2FoSQjtwHCr8aev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEmeUbNf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEmeUbNf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546DkWA3022968
	for <linux-kernel@vger.kernel.org>; Tue, 6 May 2025 14:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nqo89KoPeU/jHGAvsQlxSAm7hqWIb/0/DUR64k0qV7U=; b=VEmeUbNfO+EEM0vd
	5Ex5sKaW4+wl2BcTZxn9ZN/vsrYm0rOW+V3fDKMsKnfkp0IKgMQ0tS3oi/tQ2STv
	FTnrRpprXFw7quccvZ47lpz6iovDhfUrBAkB1hKzsztMGsyicJidkd6ThY7Qjei5
	y774KtEPT3+BP9GvSnTYg7pWND7u7H7EuQdNIaaVrpw8MIDqNBoKxDBJgmqdOgOU
	M7QzAitxM70lJlFlLAXjUkKwSIrTWELWD/273nkF5rM16Yv1TwpSocJuXhLVHMjt
	eADHfwcoD00as6/1SVMo+K3gQ1zG6i1hBfOkQNyQaQODHCOuazw8IQeQAtA2DMIC
	Yd6AHQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tbagur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 14:05:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e540fa2d0so2778205ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540333; x=1747145133;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nqo89KoPeU/jHGAvsQlxSAm7hqWIb/0/DUR64k0qV7U=;
        b=PdU+FWnNjVlcc8AYKoLQxfjGl7zlqmub2AVnfZHfszU367T0UpslLZNpfye/sdp5vP
         9BMcNv+iy3+tY6zNkKOII5BE+DppVj2NvmCuob70+qxPmLnxWnmYHwRfEBpxVdhBulQV
         ZRSoM7j0uWR8iMUp4bxirIAq8WbimQiH43XmVYLCzU9Zfq8V4tdMoHXEhPvjYOqOSezT
         qKLvzyvTLAeLyf0oOdTDPTYyjlFOiWTICBJfBcSLNPSmkKRQ8EBTLClPQGCs+uSgnxXh
         /SLHRsY4y4fL5sT0Wy6iQdCP+Xe5k3M5OYOt+EGzB/IEJt4K6B7bSsopFr6gm6+G+3LN
         4fVA==
X-Forwarded-Encrypted: i=1; AJvYcCV24NT6af0jSY9Qda+JHvHb/xpdUxRskRBzb2FUGcj1liild0a1JK2+KNMN2VsR/WB2uHnEeXrNQPHz4gU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZR+eZxf6PbzkUwjjIFLyEfJ1aGZemktayMbUz/LWg5eJM4BcM
	dud4+J34h6vuSjkSiSujTcRVhPiisw8tq665p5C+9V5Pj4AuyE00GDKPMMIVPydXPFSCQBF4guZ
	H6rm+U/CrmP/LmiDIaXh3mzyl7JKnDqCzT4/yYhStQXNCltKLCLstjf6HMjOpYtN3TOVtodg=
X-Gm-Gg: ASbGncuRZiaMvUedUcMW0R/zW2nS75tAB4CC27WpbxwZ7IHkKrHzB+NFSIfQrp1T9OT
	hF156elLHIHbJ7VU584NsPZn9M5Y2e8RKJcy9ta6kBg1hebvv+7KL4OQ3cs/coNPasDMlS0rMQY
	pG6QrptLG/8UIjMjF9XvL26IJOnDXBJRZs6w0/7kVsMnkYmCFpN3f1H1VdVil/yC/D8wgkAx9aH
	RKuLa85WIH6RuiO4VQSE0a2CDhgREu+CRVCFFKUcQfKHJlgGPB8G9NaSxW854E67UtfvTFQkXqp
	NFJiseiXQ2uDGPPcCezfLF4C6MTrYOoUpE90ojWi7ZPdPTg7XTmp
X-Received: by 2002:a17:902:d0ca:b0:22e:421b:49a9 with SMTP id d9443c01a7336-22e421b49f3mr22608125ad.2.1746540332947;
        Tue, 06 May 2025 07:05:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaPU7TnNNrMU+sFCQmddsKzkRJQkm7RaeBhQ42pJxberjeqn1t0GJ/J7mR3858IiblZb7Xcg==
X-Received: by 2002:a17:902:d0ca:b0:22e:421b:49a9 with SMTP id d9443c01a7336-22e421b49f3mr22607785ad.2.1746540332584;
        Tue, 06 May 2025 07:05:32 -0700 (PDT)
Received: from [192.168.1.3] ([122.164.81.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dc768dsm8902906b3a.72.2025.05.06.07.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:05:31 -0700 (PDT)
Message-ID: <0b65ea70-561e-443d-983b-6d3db31d1d48@oss.qualcomm.com>
Date: Tue, 6 May 2025 19:35:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ipq6018: drop standalone 'smem' node
Content-Language: en-US
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250506-ipq6018-drop-smem-v1-1-af99d177be2f@gmail.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250506-ipq6018-drop-smem-v1-1-af99d177be2f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4_uUu7S93lLXyMu_v-_as2okBolUqoUY
X-Proofpoint-GUID: 4_uUu7S93lLXyMu_v-_as2okBolUqoUY
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=681a172e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IecdNnqt5cXURf/0i7SmSw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=jcYIDdlXSa86HvzLazoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEzNiBTYWx0ZWRfX7bOP0xv1rRr6
 wTMs0rvmqVPO/X9OmerKFhA65rS4PeUisgL83i8Dn6S5q4EsakDbsaIYKT1g3aFuoVTn5wssL2R
 JMR2i6WSzE2cTRxO8PElOiRsjeW2h5QF0Dv/YCmQfP9QdtuyuOkluGYdn60vFJ7b7bSkPBZZPvv
 c4LGRpPdC0WhdwKNAKiH8Hapw42Fto9wsHUjWWtZSLfAcCctvBP2G5ntDTX5Unl2CL8BgA3E5Gy
 EqbnR+kPRT5YoEiKFAEkz9LIfR0OHxtGTocROVm/EiEw134PpjqkQUr4S4fJ/OzMMUAvvViD+lK
 HJsn/XkugoKd2k712Siyw6d3NLyVCzjzRhsx2Ex5OkQH2u9SJrOkFT2ZopGHkG4hUYuuOnuXXqJ
 QkD0tZ+tzZFk63Tm/FkpGNz1ziNOu2cmzbL2TBhNDpVddX6/kEtnjTlNwsddBB1pdd9ke42i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=702 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060136


On 5/6/2025 7:07 PM, Gabor Juhos wrote:
> Since commit b5af64fceb04 ("soc: qcom: smem: Support reserved-memory
> description") the SMEM device can be instantiated directly from a
> reserved-memory node.
>
> The 'smem' node is defined in this way for each modern IPQ SoCs except for
> IPQ6018. In order to make it inline with the others, move the 'compatible'
> and the 'hwlock' properties into the respective reserved-memory node, and
> drop the standalone 'smem' node.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>

