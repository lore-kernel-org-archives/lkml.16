Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C351922C0
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739214264; cv=none; b=OpvLixJU1VVZYRsjaOFXja9LpRkNYU3u8J7TY4axgjFtSzXUI/lIRizh1wI4LmwX1plujOUzfr7GIOexXbeVmYFUGq4sdkJRjiwICjuZ3fsSY2yGbvwX+yuweBhsNjBxv1lrwoeZxOG7zY8nNQd0txIkn8s1wJZslGYJex0tgFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739214264; c=relaxed/simple;
	bh=otnMfEoJ50BUrz5F1H3BI9VskK7/uYP+f4Kw4mOss9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XtYrlowAgUHefoMygrjJaXFecdYktXOVUEcrROYFHZLmtGBdhdhCopMtvFlPFEESw36nCBLUR10TJ1/F4BoW0fJrBg56vTBh7mkIKiChlV+17Zn50OUzq7/T0lNtXb6Jz+/wnH1XpA/ByaQR6TlCJxvEv+Rx73/zhv+D93FSNFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GgDvTwgD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GgDvTwgD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AFKPfe010521
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ULiUDIHrPVxs/sIa64WDRw1W1vqL9P74tM+t3ydYJvs=; b=GgDvTwgDxWNsu2rH
	Hb7+ppoKmNQV+PMGK711RL3iWVEnMkAPLbcD8VidYD25wPg1E7Er5PC05t1IWB/N
	s1C6t7rOphU5X2HJBRDYxSr7dggPiiv0PRsjG+mxC9u6cB/gH2LC5VsGx9LgJ1I2
	lphtRJs2cHe80ErUkKIbIR3+4osVRQiVXvlHFTKrcWP9pGfD16SChkfnITMInntl
	uDtr6b2UAOmLtK/UaPdByM8XRu9cuV5EssNGXOal9ffxbaxO4Uxh7QQydWZEEbiJ
	nW6Fj4WjLY8uAaZwgi0g6nf3ZddOQHxDkG5ConjpjaKk2HB6dKKInEchPtI1Bxwz
	BlcolQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs59yvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:04:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4718adef552so2726461cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:04:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739214261; x=1739819061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ULiUDIHrPVxs/sIa64WDRw1W1vqL9P74tM+t3ydYJvs=;
        b=b1VkYlmWQAICC+LMRX4eqEAHC8z7kunI9c3OEXksR+yBH3rO2XbfiyS8yW1SE61myB
         fViy3hhHrsYNbgHSX5ndVuOmMkl7a4t7/WtRXnTj9T8y/kQYzaaR9uP4w+z0k4zWIrZR
         VPtDr0KMeTR9r52ieBRAr0MclrmRTu3VUXSwhunCiTAiMlRsuuHgUZn4hU1pqbjbA6JC
         sr8WVYongXGWbx7RUFkYf5QJEVI5+9E5WpK8dwkqcOdqW39hdnLlraBgCWJ1ZNNGsz2j
         IfruTvExtj1UMtyGbhp55tz4NQe9JbwEg4zcAjcXuqXAnJExmE8OII/UU0sDEQLvzhOq
         xyog==
X-Forwarded-Encrypted: i=1; AJvYcCUldQ/WCm+m0qHyiXRDG/RU6uk97ABfQFv1v4SJ5xGAygrqmkD33tp03xgep3npTkMaznywvt9zTvyWlgY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+lC+EXUKOCjz30mb31HaHx9rIJcIKHK08xNpaqc0HkGSCI7LX
	Uxh8MGDwvtqwmm0LQiBhEn+3lLLvS1p5dIoZuNG7Ns5EyucqZQsaFC1WLeh6/IuMMQCw+MnoVgG
	SEAYbmsVwqbX/cklfmwlmJ0qdfHBn5ykxXBE5Nry9iTygho+9OaI4stOL1XaMssA=
X-Gm-Gg: ASbGnctzQiYC2NI8qUy714rLcRbxQJXrQbAOD+KM8/ntUFtNJeoxvyTiP+HAA7POI3D
	79lC+2TClK7Ubg0hL2TcwqO7P1r79bg3dl+mOVxhqh+pzygQjd6WTp9fmE7w9+/fJJLvbhK6VCW
	iK3Mu7EgS5ww6z1BYv/kL9NBziSkbiElPCHCSasjN7EoGOcEY5Wiwjf4zN1MmPpwL9O8Yt2Jb7o
	0ztHYBktLEViVFIuTyWBuk3q2gu147o5/AVZG+sbK6Mjdau7q5BUEklX1rpuNJfYPqr5obq/h5i
	xWfUqdLgY3oebQbmL6WXZReZMw3m9uqQjMriXHZKCCiIlWDFn/MhnTeegy8=
X-Received: by 2002:a05:622a:81:b0:467:6283:3c99 with SMTP id d75a77b69052e-471679defe2mr85720271cf.4.1739214261077;
        Mon, 10 Feb 2025 11:04:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVfYtHXfdFSMk2gWT+jb40I/JkWq1xYtRWJ1JXxoyZm338bTGOoDaw3URdqS8zs1Y2u7qz+A==
X-Received: by 2002:a05:622a:81:b0:467:6283:3c99 with SMTP id d75a77b69052e-471679defe2mr85720061cf.4.1739214260647;
        Mon, 10 Feb 2025 11:04:20 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cf46bf57sm132470566b.165.2025.02.10.11.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:04:19 -0800 (PST)
Message-ID: <d0ea6c3e-ca5a-48ce-bc67-0622b0d891b2@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 20:04:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] arm64: dts: qcom: sc7280: Add support for camss
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250208165232.2371889-1-quic_vikramsa@quicinc.com>
 <20250208165232.2371889-2-quic_vikramsa@quicinc.com>
 <4ah6z6lsgxgpjdiuyrkkcebpwrqrfpmumklga24immz5mvmgp3@z7bplsu3q6yl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4ah6z6lsgxgpjdiuyrkkcebpwrqrfpmumklga24immz5mvmgp3@z7bplsu3q6yl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vri5C5bJMSTDBWbjAJmbxUSF2ncX2jqo
X-Proofpoint-GUID: vri5C5bJMSTDBWbjAJmbxUSF2ncX2jqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100153

On 8.02.2025 11:16 PM, Dmitry Baryshkov wrote:
> On Sat, Feb 08, 2025 at 10:22:31PM +0530, Vikram Sharma wrote:
>> Add changes to support the camera subsystem on the SC7280.
>>
>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> It was impossible to get these tags in this way. I'm not sure what
> happened, but please review them and drop incorrect tags.

It was my mistake. I used the wrong copypasta.

Konrad
