Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26317266F01
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087864; cv=none; b=bWuPq4cr9wrcbzTii64v+TwQGyXB3pbedsseB7KFRDiuUlexFq4N834XKBHyMJLWtR6O4gdHKr8U9x7/0K8ddX4SZPgww6Q9YYmP/YhxD4+nhJivHDim5gYmWxRK55kzizO02XNG8kVrvWGB7uzYVzJ4hyqf1ngiWmL0LcHIRik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087864; c=relaxed/simple;
	bh=4SV0SWjjN6to74Ybm0U5EvYj7KZjdi/ydl2GGsa9zMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QbalTdUgMY49dCZj5zJKyIFbIW8psXYtHd35kAHS3zLuAQIpf+zu0NwkWAGE9eH2HLk96YVnErdOwWR7AqBK58M0dBDHK36WZaRd7A30oyU++uijyPk9uVqyhiM505H82kNLn9Xjr9aDS8C4NbeGgnn6/owhSVVp26UdMLq0h+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jY2qu8m1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jY2qu8m1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5413oFoj031394
	for <linux-kernel@vger.kernel.org>; Thu, 1 May 2025 08:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJ53eFcOacyOAm+jXnQpdZtxz9kOeIhYOC7j2kMJ+SY=; b=jY2qu8m1X6hSNi17
	CxNR0kONJEiMG3GE+/f20utQJaBfcdQ6dPTu4EIV5dGJb9dmyj0xR7TKJQ+cGoGH
	CUCiJxrzBOZvsqAPxq1namQ4s5YkG2oNh6PVJJmyTxO9YSD7tkbHrVGt+ijSXUn7
	NzXJfcTeHpmFG8IThOecK/i9YdXROO/8ke7hcNeQbBriutYHGldwnxgtQUHkXOrg
	lL2FVdt4waPQoBUsB0LRlg/rOd1KUPQm3Qzl3vCW2EhwRHwcY9C5wRO03bzBas++
	+teqycKSivS5McBZM/Lehbf0d6LM+QJAkYjti6YcPgs0c+pLyKmElQKlIN2bKmBt
	XEN5bA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u1vsrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 08:24:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476695e930bso1854311cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 01:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746087860; x=1746692660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ53eFcOacyOAm+jXnQpdZtxz9kOeIhYOC7j2kMJ+SY=;
        b=WwJnCS3wp+5dEhcjAXmixqMH/LqQkdlDswkgqICWqeWLcsQQnd/By4lXobbNRXuBBp
         Y03ca8t8qt1xgV9/EueGJ0rMvnx5vuH9dd+PW12HqFz50wX6lxzdWlGHapr8U0qUaT4Q
         uVvZDWH75mxNVBIEriZOr426VnMJt8F+xF3I+APH0gIjj2FtCgray+JYtnmO2+iUx4fU
         9HhWcnQLWUee8vOLrHWQOUG3pIkjrRPOpPa1IAAS13A5hnPmMBoOSENOXIiGa+hhn6BD
         yX0hcznps1LqI33asydFF/IUsZ38Z2+OGkBbas7CFx4dZSuSjLKKijzMPRVxbtcgwbYd
         TFfw==
X-Forwarded-Encrypted: i=1; AJvYcCVbiR/fSfEJ1L3bB0feX5mKEOehp6jDDA4rPRoTi2YPt7fcf0q+0n7/qv8+D6HI13WpHU86JjyGq9o2AOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnNC0AYtRchESmRVwGRua8wOu7j52YGR+og3NKgCAp9R+lXIMM
	b6RNGD0/gIoAA+d+FsAXo/DLrlwgEDWlHOqK4XTqNZt2SK4q3ORST4LYej/NYu57dELQBXjM1dL
	vwAgT0e6BUZvwO/7c+WHhLlg0QBFuQr1WoIoBJ/qlxUGRZm0reaULD7qAqhgikhQ=
X-Gm-Gg: ASbGnct0pvz6ca/ahRdJf3D0H0CkPJLtKakEzc3MHKuK8PjI60KHRc7ofn9p76sRB4M
	lKluBKBHao0TDb44FYeNCcsuu2EJPojQzEezljujPlEFtGp5h6Ka2LCxGaqg59ldCp35dKNOPuI
	Wk+iclcKgz30GJalrSMnzeXuA8FTl2gvZfBaAVlk730PVuiQqGmGcpfACS6j8rmNDOStxhKv3Cm
	KyW3jKPmO7721HRH6WlOnI5Hrq/DMjf6HbMmvPbacFXpb+I0po0w92Z67Dz+1NEvuyjQQMmuNR8
	gjE/goUrCuJMopss+kwr14O3dz0q4t3c0+JOje3lVIvajTS8j9QasUDaEDCZ0CLPk4s=
X-Received: by 2002:a05:622a:13:b0:472:4c8:64c6 with SMTP id d75a77b69052e-489e4e6d39fmr33056521cf.9.1746087860195;
        Thu, 01 May 2025 01:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ46MXi0EjwqtJAjYukm21R5nakopvue7J6cRNX84FO6gEnUuzCCno+YAn+6cIgvTftra0vA==
X-Received: by 2002:a05:622a:13:b0:472:4c8:64c6 with SMTP id d75a77b69052e-489e4e6d39fmr33056451cf.9.1746087859869;
        Thu, 01 May 2025 01:24:19 -0700 (PDT)
Received: from [192.168.65.219] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55afa1sm7690566b.131.2025.05.01.01.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 01:24:19 -0700 (PDT)
Message-ID: <f65228d7-fe5d-46ea-9331-2491cab778e6@oss.qualcomm.com>
Date: Thu, 1 May 2025 10:24:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <20250501-fp4-usb-audio-offload-v2-5-30f4596281cd@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-5-30f4596281cd@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=68132fb4 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=HmAel4GXUpO_Sf_o3M4A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA2MiBTYWx0ZWRfX3DcIRbbBmKI4 nb19ROBAyDbhNmDm24iOUkcMPFGtZ6WJlE8M9ecxUskVKJJE0OaAK19eUXXhVpx9hxyCVTF1mbm w8GI5dk1N9Mbrg1rigf8eEmi253gtlHc6lu6OE6AekhkDy3vQM/j7hOaOnCvlxZtEm/LFMI+K3q
 fPdD6zt956aZ4A14WRTSiqsnRNKUN5EGnDsTf/asD3PcTk6v1egFqS78qVZoUL+KnPffKjZtRcT tARjprLYvOpB+fz1Hu6sz6I+HFLkXH8G7c6AoOln1r3We4mjDALdYM53FmplRf+5+zttytJ/kdZ gK2+dY9j2J9dqFQatTLDJj2G9wtz7+j8Ipw6DhyIROSg7+GuxOWqtxuzCg/5qwEZCkgEj4QXQIO
 08YKJEqmFG9rhskebXY0qU7oY9ia4IFDmsLLmGeAYdtmLbeoSGzMDv+SyraVgio2cJNuHYdJ
X-Proofpoint-GUID: 51VwQHYbxkxAcVovbq2c5szsfcRQ662Z
X-Proofpoint-ORIG-GUID: 51VwQHYbxkxAcVovbq2c5szsfcRQ662Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010062

On 5/1/25 8:48 AM, Luca Weiss wrote:
> Enable USB audio offloading which allows to play audio via a USB-C
> headset with lower power consumption and enabling some other features.
> 
> This can be used like the following:
> 
>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>   $ aplay --device=plughw:0,0 test.wav
> 
> Compared to regular playback to the USB sound card no xhci-hcd
> interrupts appear during playback, instead the ADSP will be handling the
> USB transfers.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
