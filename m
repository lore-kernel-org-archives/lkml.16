Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4921191F91
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278315; cv=none; b=isftOt/kg+8meQduKivJ7LQDH2Y8foIyXXnbWUYFMHvB+0yuyXvEF3ZLs4Qut42490XBerzCqV9SCbwtZTTX3hFkVCiZZJ1MpcyDsXZdBweK2evLdZTFRwi8fZrP1pjRTLv+wByQOvBprC93It8HcNQa/KFGSSEOXCUcs53DeWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278315; c=relaxed/simple;
	bh=Xp9l/tJ2kja1jz8SU88/Ddj1PCPORUiv+hAOLS2xETg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZn+luSOtt80/cASLVWPcFFcywxFjlRu3nDU4fPwZ4FqqlHfaVLySp3P9wrw0/eInAro8PSEl0VX/wl2lWdosJXZVUZGJeP3G99afgLBs+eJ2YsIBQYB55KBefklFb6+aOVnCl8vwzUM6+lWn8HDDY5g/VK8WykfeMFnTpXUw4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GujBmtGE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GujBmtGE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IGsUlj008215
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5rdETK0CGMbwpmdwX2di0zfwSYlupuJsv/QKawqVmQ=; b=GujBmtGE3/ZZdY4X
	/V+zSQYHNbjUEjEMOJ5QFC9C3PcT1adjcW8xc4IzwIWfJ0zAhaSKHpsFv6Fg92MK
	Nzl2fHEGqy491AtxAiuzWMizebpsNSRF1dAtsrdagBBcAUdblpLJl8xCNj1kXyRW
	Adt3ApCAB6pyG/gyjf0tcKLcGdWDh8PGzVhFzevSfdin5fmpx9e42t/9EaKW6YRT
	iR+j0y2Oo1rFp5D/9xqLDaGq6EZjwiZsRXr8PBHgUPAck9tZqheGhLDQii+qM5TJ
	hpvIsq3zHmnGBoY6ylaaL6NXZhgwcZwGYxVOnX1GMjrTavulWQ80sUQyNKMYwTvV
	JAHu1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca5n4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:25:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ba561898so1466285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278300; x=1750883100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5rdETK0CGMbwpmdwX2di0zfwSYlupuJsv/QKawqVmQ=;
        b=JJE94+KRtURCo3BBU/WKvyTorFVkaqPEr+xbjQviEBBA+iCSgGsOMdxp3fMYVTkmFP
         0T8oleNg68dPDNAJJ6tBeXo2su+LlHTxVP2+bgOJVI2Qe5/iYE3jrqtwhbOI5/EE5GqL
         GPW3Pov25ilRsCMDAlaSztSEuiV/OfNYcVbvFIEIi1o28wGfDBMrGVLFHKRWcCLaMhdI
         N9KbJWfSQkrXrE4ehRGJeqYy/3gpRcOYPR2l6ki5apO/Eh4IZtS+38dpjYMNSwcoECWZ
         L1HMVpQmrmQ9MXZ6L0y2f05dOM/OZNAyp68I504SZtgzqUXVOcD/wjOZ3+0OYsRzfYEm
         ZZuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUarEsvgy8HxOLSII3Fi1dGLPFZaGG+8qGRtGA6CKiGpRa8kn58/KxxF3GiiJNe4o90Jb17qNjbqoB9G8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkWSFOvwoCW3W4PV2iFig1yRNH1Vl1oI3YSL/Yg5R+aM/0jUe7
	0VsZirnShb58epGGGnOJlXR4OWCglnKa9cFNaKN4iQlKxgwQ2hbLAp9+239dbGam5JSgILucwJn
	Mbe8R2JzrNUqq6q7Zw4/PJxSq2CwvfJ6J8d72mnW9C7WZWIgURwYfbQKdHPFcoCFUe5Q=
X-Gm-Gg: ASbGnctUWZD7wjaRRRRMbRMqgZoMRx8YsK7iulLrivWBaLMO4krPN+G46Pz6I2EpGUg
	7wBg6iDVZ9q328uqnjzfmqjLAjr9KEL4ETBH3BpOJvKkjRE0rmaRtiqJdI6bE7/jCokjol7g7D1
	zcHJ67YDYwIvihGi4NHHtjBNfM0fqjVltOpoXTHDpWQeH1gP4ys/04GT3a+NlnzQCCRPRi+yprk
	RR1l9LZNVWwm+3tjdQCm/RlkUZNGHL+S0tZnRWZTL+noUI4OVJs2jN+T2F73zzXkOnn3PGhhkqK
	vDfVe6BycB/eQMSx9//x4dayTyYi8JQAJmMbv1Vi2JDck9Ao4eYL8hidA+Aq8/dqS76Rc3dVmU/
	An8E=
X-Received: by 2002:a05:620a:1a1f:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ddfd8928mr518302285a.15.1750278300529;
        Wed, 18 Jun 2025 13:25:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk1TvaW+rFRP6NHspvxWymzXPy+5exCsFRUxs4VaLgedmuLlQ9Pbjj5RZryxTjrMp4+BQcAw==
X-Received: by 2002:a05:620a:1a1f:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ddfd8928mr518300785a.15.1750278300142;
        Wed, 18 Jun 2025 13:25:00 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec89299c2sm1111742366b.119.2025.06.18.13.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 13:24:59 -0700 (PDT)
Message-ID: <7d96ab73-ea00-4817-a8e5-5b15ddda3107@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 22:24:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: rename qcs615.dtsi to sm6150.dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
 <20250604-qcs615-sm6150-v1-2-2f01fd46c365@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250604-qcs615-sm6150-v1-2-2f01fd46c365@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J1BaUj-tvx5APnaoenwjRtezDBvLs1vY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE3NCBTYWx0ZWRfX8TfLLD4bDW2E
 a0UNq+khcl/iMS+IR0i/K9rT24XkCc5mHM8285eTaVwb7zchXZJVTMp0iVn8ED7XS0NyTuHdPx8
 QbWAOmfvCIAc+HFSHhPf2trAbYW80Vhh3b1MfI1Y8dso2svgzoGJ/RCNb6aElY25CspgK/g9YDt
 8q/sK2UY2L+kyyfXPKZRn6KaCtz0wdYxTd/8XtmNwGw6E59sykx5IX1BHFl508WT8lD04eqdU8/
 N6HClpuLEkStWNAbDsI0IYrWMEEZc0goJ7cFYYoqW5/MWEJj/pc4KkIsPHNfTu+nQZizxR1btbP
 X9Eme1t18joKTgG2C346vTt9nJbJG6f8DxFg785pjFP2wDkX2VbETSH4jtf7hSvErgU09xoQpqp
 xEXgIoNl5hpUtXQ/riW3xe3Pt/NpB/FIACu2H6jFXSWBYtuzKPXM1YnAwYd4mh2RI3gLQZmz
X-Proofpoint-ORIG-GUID: J1BaUj-tvx5APnaoenwjRtezDBvLs1vY
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=685320a8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1anRd3zWmIIzkk0cLioA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=765
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180174

On 6/4/25 3:40 PM, Dmitry Baryshkov wrote:
> The established practice is to have the base DTSI file named after the
> base SoC name (see examples of qrb5165-rb5.dts vs sm8250.dtsi,
> qrb2210-rb1.dts vs qcm2290.dtsi, qrb4210-rb2.dts vs sm4250.dtsi vs
> sm6115.dtsi). Rename the SoC dtsi file accordingly and add "qcom,sm6150"
> as a fallback compat string.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
