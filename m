Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87971BBBEA
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210780; cv=none; b=p8Q1dXirx1734L2mf+pMSh3dj5SW95C0/wrysjYPQg+wAFEOIZdGmw4xW8Qdq2m4/wGT0hJUehQ0YXULWoKB+/ZBOItGYCm5trY8gGvWHzX3zmxZ30PlXvA3dTWNz4fOoOIkgupXH5r507Zy1VI5Cc19InZedThGF8EvSAcVxu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210780; c=relaxed/simple;
	bh=fg3n0HiE40DlQQ7rUeZK0tnBLDTUz7qtNfDNbLXd14o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lV3CnnnZlm6nbZjKmhSAT3mwK3u42tV0S7r2OXJQRhcxVsd1XjAMY50gkNzikc99QN4CvcbOlMP6RkiKAoC3pknyHgKR3e7fDjxHn16nP6lQkvEUq0fjvNqHEOOnGYoQHNqmRUjZSmvIOukuISy3lw3VPP4fb5Gf1i6QT3C8TmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZ8VZDR0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZ8VZDR0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A95KxR004359
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vsjL/2KQY+Tev80gGOdQzFfbqYML6F7kNzyKYY9Wvfw=; b=IZ8VZDR0CIuH+dBG
	IW5QDMs0sSSLlyg3ckN1hgm5l19f7ipfAdDgFGD34EfKqyleqLXH7dGl3bZSXw0U
	Ll/CbvSVZQEPJq1ALTj4ylk58ww3uIikws0fxnubaZb982CIdJmipo5HEMXYkH3Z
	h2aUOoH/kMBQ8hpFhB/XdqPDVDd9hm//2P6qrISnyRHGyzk3G2tp2FAuwDsmV5mA
	cF4C/1JE5phAS8Iyle+c/HIOGb0GRd1SM0God3vmH3nOE2MBhvmDfVCWXAo4pPzw
	v2UHe701mDGamnq5vVYNDCdQkBFVGytBOSP9Smi0ryares2PWKd1+qSaAuBtVqej
	vG/QXg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0guw68x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:06:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4717d747eb8so3138221cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:06:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210776; x=1739815576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vsjL/2KQY+Tev80gGOdQzFfbqYML6F7kNzyKYY9Wvfw=;
        b=dXj+WKaDh/4YpgmoegplpMDzZ0BrTLCiv7NcKI6WHidHdQ2gdT/5gr4SEVqT/9JaRS
         Gyh5+ZZ932FOAtO6BkyCSOZ2RV4PCyN0+qjWxMTYXf3ym90W906sodZYenZLCoW97SfS
         7DHhH8BKf3CU+HzO7ayoV1RL5iSDQgz5z82cTon+O0RBxVvFWRZt2CYjctTWmTncKbe1
         CSl26/fxWZg16df7Bi67mDsI7hYu9lGpepbmM9pA16uDWVKd8FFShrSIA9jLxpyU5mCm
         dSN/mAnd6hJYEMRnchUEX2r2KMmO0USDLHuJjgjw0jfMXA615e7sYfn9JaPqYbIr63+0
         EVew==
X-Forwarded-Encrypted: i=1; AJvYcCVxSsq65gcGTw9YuRxXiF3G4M8S5q5BRapm7PDQg3Y0gZ7ryKhb6OuE4HavPOy0ox+yfFqh2+ef7ElgVWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxag7CVkCPsMTPsV5qirhlacMQpbKtSE4M7Gf/9m4jrVTcZpbHd
	fIwI7vDBnIYoSUYSgyCLV0t1HFrOXr5XiE4wPYurogL39wl+fHobl1cm36wda/H6YyIC5QfnP30
	gIOJoKxr6EqacBrfjv9s4yxmug7+EaYxzvMmrU1cvIeOSGFzchL+LdpvoE18/n6o=
X-Gm-Gg: ASbGncvf0OLmtbiaIfITrj5lo/9PteeqOyN7+xeFTfoAZIu59tet1QAI0SmDL4x8AQv
	LihgZhP6UMmATaMb4M73GSAszQxCVLJCn7XuWz40nczb/wIBhA/VDeZnJYOaHDliul1zWsJL51C
	jKUQ1CKPWMB6mYquucY6joOKww/KYm9hke9aEw/sT0pvwEUqf7j6ZQuIrw6Yi1CVSlKVs2HCZZG
	r6Pfv3BCMA7Xyv1fa0Uoddf85bwcbAhKRhqwC0wRXqr98JzsXrnOUrFTaq32qe2HhRLB5Qu1iQU
	PAJGPB/ltwIuBbPaQjGRpukEwQy3gDYuWHieIO8qUFoWoul2CmeMQNzG1a8=
X-Received: by 2002:a05:622a:58cd:b0:471:8bb2:ed1c with SMTP id d75a77b69052e-4718bb2ee8dmr38878611cf.1.1739210776179;
        Mon, 10 Feb 2025 10:06:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQImmhmYCSQ+3nx9vW9Eev/sQYH6OwLcUExc6r6y7vYhFCtuQNRA2EBYx0mjRH4bAXUukGjA==
X-Received: by 2002:a05:622a:58cd:b0:471:8bb2:ed1c with SMTP id d75a77b69052e-4718bb2ee8dmr38878371cf.1.1739210775838;
        Mon, 10 Feb 2025 10:06:15 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d7f0a47dsm35109166b.31.2025.02.10.10.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:06:15 -0800 (PST)
Message-ID: <c21d1ea2-9116-4e7d-a1d6-2717d0e772bf@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:06:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/16] ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD
 GPIO
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
 <20250209-fd-hdmi-hpd-v4-16-6224568ed87f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-16-6224568ed87f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Z3u8BqJb2dVqC5RI1uuBNCo1S-ZfsjYY
X-Proofpoint-GUID: Z3u8BqJb2dVqC5RI1uuBNCo1S-ZfsjYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=682 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100147

On 9.02.2025 6:05 AM, Dmitry Baryshkov wrote:
> There is no need to specify separate HPD gpio for the HDMI block. Use
> built-in HPD in order to detect if the monitor is plugged or not.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
