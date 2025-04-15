Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4E02973DC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714047; cv=none; b=UZ/mMp4ZvasoSLIFQppKu+HFHw0bfn6fBQj4tFnSlmNv7V5TSE0Ecn5F7TdGMzPB7RsCAorCx2JSVTLya/ZYfqD0yNH8YT/UXdEHGvtjsiztzSK1p1NFwvo6LYRpe90WolHMEMDs5sbDVJ1hiI8ZXGAq1/A273YLnzdwQuXcQxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714047; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KW2LVzQwm/+U4HlCyjd8L/NMykHKnwOsipaLkKw3noYVrxQ2dujCJMgJ/JA4DaPdrtbd7infoFGwKulZf0O9fR28C1bubBzcONd/jvPj6LA/Jldbvpu74UQxkSTTTABmJEs4cXJLYJphr2fhKgcuCue3PDLwLP7lSmDLeIszaCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGgV34N/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGgV34N/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tEbK018863
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=dGgV34N/vYBLV74h
	hk0HHYzfGp+JC0LAuNgIXRTjh1PlJ2RD+9IL8di/G9J3wF4KKhg2USYVIwmszIsp
	fJkkOzOTN9LKXpfdL0H7VdtVW6sTksB8UFHQKFXMfA4DOObf+Gr72H6WzHz+gQko
	bHfL/YCfBLyahWxilggcOOyX19k57Mt+XDSEvOFSyw2EviOsdPv94j7Te77G7QZJ
	Xb2RtaJQPoJc6ZZwfMUbiFgwS5/7NDhBLiudGP3Ip8V285QOSm4nKwrDN1a65bgM
	G4XwvmjrZU52Z+sZJVROXfEdCaRiwqoedHWeurx00lGUGMTyy1sNnpyEMzuzlgHp
	eF2m1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjfpq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:47:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54be4b03aso103547685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714045; x=1745318845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=rA/mTEgqdE3zij4Mq5Bu0hLXXxAv2e+yZj2Sv/JIxPEY+YIzKgjF3bgcdBlUUYGPrV
         Vqn/UCGl6BJavDm8BUSKo11Xl6t2pm844y/f+i/ds4uz9jkYyPJfxQpJK2chKytuY8Mx
         uQBh0uiD+tgeNOa2V2VQPcP3v5UAGVgdIPRuYAqQNVzB2hju9+k06vgVEd9R0DoKQSrO
         S6B9IwuJuzKr8Xq7wVrTAGK1kObXsHpi/RjUZUBRIy4k3AvDsTstZ+9lBSvzWgCgsdkm
         Tih4gJlHrgs6mNF2zlii7hgeAOEBgfqk1JjlzT/5paBZkdzSNl0m1wjXrjELjHs3Yn2l
         L33g==
X-Forwarded-Encrypted: i=1; AJvYcCW37lrl2lMF+PINPr4FbPK7fAYGeQOgzneyVUwU7k3Yekp+SfrWAFVqrBmVE197UoYQqlNKquA5sFgXEEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzBDJZ3p2VMKKqRIodYr6yg0t+/o27vKTw88AxiBqDU56CK+/S
	RIO+piUzYA+1h/4C/qjeymOB6uYns8uyKq9mULe2WRQ0bQtMieQOAp/rPgEaYI0FMRDSvOX2k+f
	sQ4N5DqwZGmhW7m8+QCtGo2MUdMDP/yeDQTf9wkqktQdNs0sXh3JAuutJ+WaybtE=
X-Gm-Gg: ASbGncthaJY7SG0NegVrg0NmRfos3jo2JqX7rra8W3C7sj7QbDwr1nFWZ/Iiv4SOhi/
	Mcpzdryhq0eup0olDV2jEph7fNr2YEXMy9KCR2kgswSfalcwc4RBWogjEJjK8rjYEI/zHC5bU3/
	3tuPiCqJIgdEZxCxIFvz5yPyfBkwVc4GogieZXdBl20M9WQMofAKu2w01pFtaqy2tBoSDGia53D
	KbZEn4j178c37dhCIXY/QJgCsLaws5kjiVJpGYGPDXDEq8bOpJYvxKfKfu5PYFXrF69S2XpAj0t
	et+GcqhlRG+70G4iYuj8J8Q80NUS9CuaLVNSSrnqmrQT9+bSWnZvYbzAba8bVsISpJ0=
X-Received: by 2002:a05:620a:44c1:b0:7c0:9dc9:754b with SMTP id af79cd13be357-7c7d07be091mr164597285a.0.1744714044777;
        Tue, 15 Apr 2025 03:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR14+Twk5cFwlwSft3fvWINdHta4kge806Sqok0D/JeIzhe8ayLHbUc1jtjfLT5FrSvApq5A==
X-Received: by 2002:a05:620a:44c1:b0:7c0:9dc9:754b with SMTP id af79cd13be357-7c7d07be091mr164595485a.0.1744714044447;
        Tue, 15 Apr 2025 03:47:24 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb404asm1070349266b.87.2025.04.15.03.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:47:23 -0700 (PDT)
Message-ID: <049d8520-5c66-4846-adfc-cb93f122ffba@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:47:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/20] arm64: dts: qcom: sm8650: use correct size for VBIF
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
 <20250415-drm-msm-dts-fixes-v1-20-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-20-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t5v2a4yz3sPdGxbGmS7vfOfhe0oYXB9L
X-Proofpoint-ORIG-GUID: t5v2a4yz3sPdGxbGmS7vfOfhe0oYXB9L
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fe393d cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=633 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150076

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
