Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E94979D0
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 18:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749926422; cv=none; b=rAOzccfVCG7OR/D0Jmd33242B5SvflhW8bmEso6Na06F37YukW0P/JyaYv2/aE561Z4K9C1YDsXJcQxXIBuD+9JbFySZ8MTHBy9AR5Cw9lyF+589NxXisnBof3l3/2SkCXimWGVtnjcO4FvE08tiOIG6x77ItNrvLT6V9fcAn6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749926422; c=relaxed/simple;
	bh=Aqqj3hsO/jmsuYDF6kyqSVHKYE8WRUcDj2uljG5/E5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEDHgD07E4gkExmZsVRqCnlb3D88hynACdudpYHR0llRLtyiEoJJfaSRYHFFurv4AEPkv++Zr5Qt7K9DlFP7wzhzKToDDANA2rTEONAaXFPSfG8u9KUxELF/DVYJm7uKYBVNjpJtQ+cl8PtJqcTSjBNVXZgd48R7ywKwhG7yLd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNwCkZkp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNwCkZkp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EISwiS023055
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 18:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9f2szhxgh+UZzFbgJJqLUrD7R/OLDcb6sr57j8zYA/w=; b=dNwCkZkpjatgIpTX
	yc9WY1d3XBNraP9LJazRkT0bNo/umaWQ/Kt7NBKrU7hC2W2HpSp5UZ39XZU1xDC7
	uLnlI8g+Wybe4iv9Co8/BhNIPl2EOcFnIvhfihryEWx/5rPkIPgimQaZCj/yLbwF
	zbL/UXZGNBUEx8T0z/s4eQqY1cWQUYH46rIRfuBpRrfV5J/vfnaVQBYnmxr9bdg5
	OlkM96FB6ZHM7RiZ1gUtkVs2KggXyWiDz1MfRuonMSqaBokH6NYDW72cxiodto53
	UetzdFD/L926Gn80ssXwp3TFXDdJADZSnUnrpcgRpNnal7sZ2s7PA5+GhvHyRhD0
	m+cvBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hc8wem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 18:40:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c76062c513so77130785a.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 11:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749926418; x=1750531218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9f2szhxgh+UZzFbgJJqLUrD7R/OLDcb6sr57j8zYA/w=;
        b=ZoxthQsD4LBnWciFZzA7UogrWuU6IMlwt9YNw/lK6X9gAtf8KQiaMkL7X7yCRIMqz1
         GBT5Y1T4AT21ohASafGzCBmrYfmy5WxNyg0jMhO+b0ivRdUQ+DiaTlxZ+MBZHz2U/Igs
         542xO5M5JrXYfiaFikNTchgM/fe+BacHHWWGkAmZ0fXcJs3pIwCrtmDI8xVpp+OuXeqz
         7SeMz0o0AR7/123YY7d9OJD2ltxuPdH2MlGXvSaB8znr9trxJbJHHtILh4wF/JseMZRp
         xBIZjHV/ZR6Mrhy90vp1Nq7X3ks5GLPZcQtqHruwFa1j8SCPtzDm80Kd2unizCddpU5o
         AYXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz9tJLK9bTIl72s1ACVTnAFrTqqffk7/G6vIO4BecQcmSSYtWqA1NAhoZFzeP49xN6fVJXP5tBrKVjTyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIP3HnhFu3IvNBxOl6oeZB9Z8lLnOjKcd+c4FZtUOUB9gsGRnU
	jfMTyeA/AbJlSmFzE/42aV3xlwfMwodWGbWhCyQbejHnmD3017X2k9HSM3QgYrOBvbw6mKdY8/r
	3o6Ct2/DmwhKw9rzR6JLaZsls4fbaBk9vG8aaD6X15Q8Ca5NoI50YTMSlxkYfvA4u4yU=
X-Gm-Gg: ASbGncsM8ulfgjiQgixG1xrffZWDO+LOpoJQEc0TE2oPJewLI7cYGf6VgVhoyr5OFmh
	b+V5pPHM9dp9omPkMZlr5EnwanJYGFdNFNJzxtGVU0RV6loayCM3km71Wap/gKmC78sSzIr1eAZ
	6gZE5sVA1Axmt/cKQ4R58+6npcLjSX1cjmaOuKuuV8WymfnQRNiVnxLIyipZr+YnjVZdEhFR5HF
	Yew1b7mJrjDOVOUY8x6KUGnmBlSNJwbmkiFxslMO9YlX/0J1eLM7s+QfJebk6uvav4KxNVfrPmJ
	agZVnxTaS+4BWHGA9PJJCNRZ3KmNGwP61rdJtSxmFNLascBM8Ahw7bPO3x2sV54aKa0uqYKvAS7
	Tjmk=
X-Received: by 2002:a0c:f40b:0:b0:6fa:b8a1:abaa with SMTP id 6a1803df08f44-6fb473e4444mr25772896d6.0.1749926418567;
        Sat, 14 Jun 2025 11:40:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFetMRfEEm8RJ8Ih0K2X0btyshx3cpumCJLSlApuu2heJsTbu/I1n9XNsB3b+VBct2vH6NE+A==
X-Received: by 2002:a0c:f40b:0:b0:6fa:b8a1:abaa with SMTP id 6a1803df08f44-6fb473e4444mr25772686d6.0.1749926418150;
        Sat, 14 Jun 2025 11:40:18 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fe7e0sm343611966b.76.2025.06.14.11.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 11:40:17 -0700 (PDT)
Message-ID: <9a5130bf-dc1d-47de-9dc2-f2eab4faea17@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:40:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8976: Make blsp_dma
 controlled-remotely
To: git@apitzsch.eu, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250613-bqx5plus-v1-0-2bc2d43707a6@apitzsch.eu>
 <20250613-bqx5plus-v1-1-2bc2d43707a6@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250613-bqx5plus-v1-1-2bc2d43707a6@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1NyBTYWx0ZWRfXxB+3baoo/Lp4
 QYNwlav8TqEHfuf7nOV/a5BZ4epzEg+toxwH8H8IIq6PjxkeW4DqVhW+Hs8KhSyXcszalPvRQdS
 FXkGIeCqX9PjlgicAExQOWMeCGZS8df7z5//1/572GdcN2Hc81t5MHvG9jPrhb+Z6nJHk96yl+M
 fBxcmpcMQhVQsTS1b4v7e77zA0Bo9uRSf8QssGJ2pzFCbgvP7bf4oxMvx2lguKjuVHe5BUgusep
 adIeSbzBkIGId3ICqeSlMlAc+gfq8ufeMyd61SLDhofL1+qmmtW9FBf/wdbo4L6WVHVXOohSpOl
 gIogwEUQIS1cwKu452xz3m9QpLWRrcAZ7tRKcxPgnBi2/kqUVHZnbdd7bbLf+lVOIWNYHq+1jEQ
 FDgr6H+PI1Z9LvSHFA/XgoTef9KIoexx0gwQFmPAn5HtjNMsezSUvC2uQvnJJAMAAgBjq2te
X-Authority-Analysis: v=2.4 cv=CqK/cm4D c=1 sm=1 tr=0 ts=684dc213 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=HDjIzE35AAAA:8
 a=EUspDBNiAAAA:8 a=FqsyDp_bju1yIiuMhToA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-ORIG-GUID: c-llMIzk0JYRDoGg5M43CTQr_1xTdhNo
X-Proofpoint-GUID: c-llMIzk0JYRDoGg5M43CTQr_1xTdhNo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 mlxlogscore=868 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140157

On 6/13/25 12:37 AM, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> The blsp_dma controller is shared between the different subsystems,
> which is why it is already initialized by the firmware. We should not
> reinitialize it from Linux to avoid potential other users of the DMA
> engine to misbehave.
> 
> In mainline this can be described using the "qcom,controlled-remotely"
> property. In the downstream/vendor kernel from Qualcomm there is an
> opposite "qcom,managed-locally" property. This property is *not* set
> for the qcom,sps-dma@7884000 and qcom,sps-dma@7ac4000 [1] so adding
> "qcom,controlled-remotely" upstream matches the behavior of the
> downstream/vendor kernel.
> 
> Adding this fixes booting Longcheer L9360.
> 
> [1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/blob/LA.BR.1.3.7.c26/arch/arm/boot/dts/qcom/msm8976.dtsi#L1149-1163
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---

Fixes: 0484d3ce0902 ("arm64: dts: qcom: Add DTS for MSM8976 and MSM8956 SoCs")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
