Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20FE289376
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713746; cv=none; b=okUXOhr2zScGwWFZK+uWz1eDFwY5CM9KxBL514vTBvG68tiWwIMsBBf4QZKLTQ0Xvj85cRm/1zX/1FSe9i4p5EZQFi2k3h5tSHaWf8DzT3iv0I9LUMNn4NclWZDKfin84Q8x/qD9sYFfnYEo5A6U7kBeBtYuwGFGYcdCX3Kj00s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713746; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wq8CO81ViVdJoFH7SJg/1swCH5KtUghCwYexTjoRMl4K3wf37D6oC/F+6IKJ5P8EOAo0I5HK+VVIZw6Hh1b21S+w7rpy62IhDrhF9X5MzVsBPPfTt41/hSEi06DhjoQ4Ejo9Umk/2tioYhQ41EzoYpduZnl+ZPB+w1+GuL/0ukM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maSGuzDI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maSGuzDI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tLH7005405
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=maSGuzDICpKBrtd5
	L84f7kovllrJ2iJ47Ej8kJ0mSAkeEoSUEEIrL5Ue9wf9AQKlR6TCimMoGphPL5uh
	Cqkt7EK5jkwHJ4c/vJg6VhR5Y/oH0lb45zAgeXPZAhDMsTd6OHpYlfJqPfEIZGt5
	U5ZC8RZOTMjZLDUrxGzTpJHMP8MNaCroSodFA+4izxMDZbjPrZCWEZVbP8scxhhC
	PixTQVGGPo4TwKW7oY8HUb1d/rebiN6qiIFQqULOpJE+SciRSsnD6BTJc5icRTbX
	vwaTuB3uGEtJBMK+gCpw9AMe0WHKu70sGmS6PjASJH75Bekv7XK6+YP5BVsmtM2C
	ZwE9NA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpqhd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:42:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8ff8c9dcfso9626636d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713742; x=1745318542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=B386eTn7JtDKQIbp4WZGLBhz8W4teue2BLStfzjVXSFWXL7SiGY0LooLGVKP2Zo9KD
         EgWuwIId6ogziqwVIMSI++pqbaj4aZHBWIahAcScNz7kzUz7dNWL82mDqrrGe7NNqvdZ
         oejwflNzYYQHge+KZszSkyPeyxGLBzeSRRygZwNi0caLEDGcHDGp95qFM4CYKdsYprnM
         MbXh+XVt8sSyD+MSlVe01lv4jJQoCDg8LQdQ1pOwedVtcPwHLbqh/8vHOt2iIHF+0Rvk
         LyywvB+xNttG3jvhKz8npIzbLnOKunuShSIMHuFTrg4CpyQPbTj9HnMiCwdBsQ0GfgnK
         uwyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0miNQ6Xfb7miILXbY5Jh/d8WtZs9/oovPZ9wO64oOAYOJg2JsKB3Pe36NGgGRy9LzrLS0RCWfPYApAjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUfgX0HDOS9y8tN1z9mC2FLycsTeBrYclnM159yk6k+e42Q02a
	CkmObG637T9myukzZfk52Q1bcEsXjUvfM6WtIS8kMaqeHSpZRllWMoZJ0IjP8dAtqYR/WiDMRac
	MII0BM8WU2s+QWTH3L68u56QcVC+GHAmhvIsGJ/dtNrScJbdCWvhndNUZtQ603sM=
X-Gm-Gg: ASbGncuXgfedZpvpNJbTxHcQzaYbEYFiTpmxifGS7tVMzx5ght4p+1bPWtStKCjv9cu
	pI98NtWG/uFQ+p2v3ueaehDK7WRznGkniJENUM9wFa79qcSzWb1VkOeU4k2l7rFFj01/vohN6hE
	/NU8yEiNE6+6LME/1OvdsT/r6zXBlGfc9/k0Wwac6iScN5gKWR3Jy4O2FDxtAXoQpfd4oC5GAhi
	JJzc2dBbTII9MMWYdHUivCdAWkF7QS3EEDsR0dizi+e6YuTrrE5KTuV9/7PM0UvZdtP3c9nqLL0
	YcLnBD7rrrTBIkj3w8Z8VAThU4LBgor2//84KCgFxNgPzOlkD9oBLWPzPl+TDQ+zmcg=
X-Received: by 2002:a05:6214:e61:b0:6c3:5dbd:449c with SMTP id 6a1803df08f44-6f230cb6fb8mr99132076d6.1.1744713742658;
        Tue, 15 Apr 2025 03:42:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGelcEtBJf3FeAECtvsA0IW3XDUNMkLauB3LmX7jlbzYLrgC1yDR59WjCB5y4K46faIx3ogRA==
X-Received: by 2002:a05:6214:e61:b0:6c3:5dbd:449c with SMTP id 6a1803df08f44-6f230cb6fb8mr99131926d6.1.1744713742367;
        Tue, 15 Apr 2025 03:42:22 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb40e3sm1054619066b.122.2025.04.15.03.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:42:21 -0700 (PDT)
Message-ID: <6d462775-fea9-4583-834e-37b9ff4f7b04@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:42:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] arm64: dts: qcom: sc7180: use correct size for VBIF
 regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-6-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-6-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bAxFpbdU5SMsRrdKMypqpP70zItWnwQ1
X-Proofpoint-GUID: bAxFpbdU5SMsRrdKMypqpP70zItWnwQ1
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fe380f cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=633 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150075

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
