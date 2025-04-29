Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E382BE7C3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924527; cv=none; b=eIR/e4HxGt4dZB9VAXvaNkTqtOq95g88douogDERMGA1V8dLuHrJHN3DBwXhiQGc/C8RbqR8gU+ArGM/0KvO2zRUKl0526MQ6Xy4VbETXW0DtBWeSjUR+mzda4rqX7qUJR1OG4VQnCjXGzFMwXhwdPY2q2d+NbXuKQEOKLvruzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924527; c=relaxed/simple;
	bh=Ig0Xc32fMWeHmMI27tiLeWyS+nuXMNJpZg8MfYTWrU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0vRWHy3zKJ2eChUhjmXN5HN3pV1TnBzsXIDAP5SNrcQj0C4qZdeTtZBMhVQD+hkkHl4422u1U/MQtFDrk6gQkbShS8JNVvYYNXBTe/k/7Zu5yn9d9oD+Co+bxLUsldluP8QoGso7eh5nhOJ9SW7BCLBfP+H5pV9HtyoY2rpxig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAttqvhc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAttqvhc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAG4D7015446
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MIW1j8QbMOdaLKZ0HyR+IOgl13akEDxSg+hC6p8cVEY=; b=iAttqvhce3McJBiy
	J3SLMJw/pw3GQ2H/yceb9b5H6Wg0StZmhkzTO/EWEHawPHxUX2AdsBsnSOgq1GFZ
	GXORjrYJFXfFCfvLY/ZsWtulokYyUc0vztXtMrawkcpGfLrUjG4NWCzk3pnvje1/
	2vZpxsbAAL1Dc6yeit9DQ1rZdcn9AsjMvIYHCtpHfd6tbts1zSqQ7qPxnPnM/0z2
	OOxLnreFd/DrX4NhJAnlLQtpnvjK0uwzH4LZvZhQi8i7OkwWFS8nLBYQzJPijq5s
	z5eTHQcphHCVyHpg66enorlJ2BdSbsri1/7ENo7NUEx4iEB+5NvSR5u/C9z67flw
	/0Hb6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hu6tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:02:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476786e50d9so12828171cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745924524; x=1746529324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MIW1j8QbMOdaLKZ0HyR+IOgl13akEDxSg+hC6p8cVEY=;
        b=XY8cYtLAtB51UZQje3A3AQAOrc4ESRovxsQMOkf/itNtA775gxZAq+w8MvXiKKCNer
         dGSesuUPWFVWVnbLhQxj0WBGRdw2591cpH4QiEb7zXW14pLfm4vUrbnfLlUmdlgyLd6d
         QWT6q1zs13QNDiM1IsEEYGRyXcQdLfYWZfimVRGzbdzf7pcQ6Jr54cKjMKtBt0lmUyMf
         ln4kMzFe+RkOr8KdYnle8HbX8YYWwb8yaoDULCXQCf1/Qd8fUzeU4R2ORZgV/F6veLkW
         cxuUirs/KfVPPC5IsxWeKBr113dlw39vEQD4c3nOTCdh11G+m+53fRBCMD4vpfk+maX/
         wMDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwFsrFc8b7+UBU5q/H0lm5WhjcqTiHXodcNU2YGuBo6l/Q7hbKELIAEMUxSQMX1GntKgq0YiUN1Q2uROk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwORpG8shfU/tmdO4PvHsxPnYdESCH1kGdUZMlLU3WEyJvtD3Kd
	z/Wu8+Olg1oSAPuT2cQpt+GMnZLJZFxxsDVIkDf0q7wDCMHGWKMssaOYmignE6BK4AJlV0lth8/
	QAoN+RlVMAREauC8DnsKk2psNu+gC0NanFYChy7mDt/TkActvFd6jgoykrKfgdY4=
X-Gm-Gg: ASbGncvis04qJOokrrKUUnFkJngJxBAEL7RJmnGg2CtCAy/P46XTdzriL6ZKGa5uup+
	RV0vmpg2x2DDOHExc/pPwMo8TMvfXqAFMniSy4L7AGkXGxbdUW/Phth7po6KyIzPXPhuUs2Mj6R
	l8LZ8J+BXkltkR6x/5sc70sg+2lbM/RGcS5k+7yWa3DYmUTrFzzS7p4mgpPrQ41rPQL/uoL88Vu
	wanxeRqoPHWOn6EHy+35Tb+FhWoPnhhjJ5VLSYpylojkU+mAg5XhzL+jt1bKrLQ/2HasqWmp2CM
	qKrWkqCrzIdiWvO9liCRIRR+BlYlusF/9AwGnxpC5eoKjWBixSBOuiZAtLVS3GoyxQ==
X-Received: by 2002:a05:622a:589:b0:472:e32:3fa7 with SMTP id d75a77b69052e-48868e89468mr16949081cf.15.1745924523701;
        Tue, 29 Apr 2025 04:02:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELgzmytp6tkZWR1VWcXfwGrdoOVAOm2or1fI5fqeuu7cvwQUXJdZdT0bJDtNsoYSceRjpNdg==
X-Received: by 2002:a05:622a:589:b0:472:e32:3fa7 with SMTP id d75a77b69052e-48868e89468mr16948761cf.15.1745924523296;
        Tue, 29 Apr 2025 04:02:03 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e58623fsm760382466b.78.2025.04.29.04.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 04:02:02 -0700 (PDT)
Message-ID: <24d2ade3-ce3c-49a3-ab68-e782bee37096@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 13:02:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: qcm6490-idp: Add sound card
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-8-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429092430.21477-8-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lbWitnA_P3IW5gx4MsUudMDYoxLYBW7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MiBTYWx0ZWRfX/OwF9QwBVVhN 3lV+aSSHQbitOt5XPv6n8Y+plqXzAGfmzkR5FP6yVyOwMPU6lMY2YVIrgHeJI4Udg+KKsQTjF3A eNVemFQ5xMFEAQ1cbUp0xGUMLQ80oMmx7+VHak5D2TrD6zm5BwhFqjWTGyqan4HvmHpMs+rD2xF
 hnKW19u4kz9CdqKOsq5gLu6g9a9ynVNy0DT5O8Kd2+tVUHONdeKo8M3S/kghxCNyXKocMmCVhu+ hoK0SmDyQ8nds6bCxdVGpCRUgZiRcelTXHraWB4af/Hj/FagwpC/0PLpwDWx0ct95RqF/XQc6Ym GEzA3dwQgitD1pO1Z267R8t9XaCUV3rUr7svr+nWEfODpyKJ4/gszgFZm4HNeBpEJj73FflBw7R
 S7IXdE+yzgTy6uxfgUbXchlhKEOuo9X+dPcau7g+X4Gxc1FzyeaFfomYXzX8b4U0YqDRxbHZ
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=6810b1ad cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=m2XL-mgSGVCMsbPKemYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lbWitnA_P3IW5gx4MsUudMDYoxLYBW7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=825 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290082

On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers,
> digital on-board mics along with wcd9370 headset playabck and record.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

similar comments to patch 5

Konrad

