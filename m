Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A225296D18
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728195; cv=none; b=fgESpwvOI4FPnQtgziJsdfUX3swa12vSff7N6WzBKS5CEbUZjTBJaLlIz9JJ9zVNEA4ZsLTGHIYpa+IZtVt8LvAY0JCXLg4SeKAT6GRCQZRcx4zHxrb06lxjY/JbSkzD8lNYBApQ3aPP14mtEA4y5LiYCs8+6PLrU3rypndk1o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728195; c=relaxed/simple;
	bh=R3VdQ4hlcmBG8J5MwHj/L0Obq6h89VhlAM12WwnIdDo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qInsirlyYBfx6OklxeRmRKjpDw8dMpOZ+J/0+r0eJrpINv6zvNPRSS1Tr7HwTPTEGZvpe6RTc3PZwIi/QkRpZtmNI1l/CdorKJeEV4Ep4Ebj7KfJ0iEGxHfzoJHBHaTfIApzzICa2dZPb0YIWuH6MCutkctCKRUFk9W0/gGOSTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=or4Y94NL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="or4Y94NL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tFmG005833
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h6ICL7BEh43VFjprVAuqJP1WzL3ML5MgGF+4l11v0XU=; b=or4Y94NLvXlkOWbh
	yndXM4dqsCH3uzbT2pneplU3Z0rQ5X4onfOYsj1lkWeLRcYXjpD2djPtZFZdDdC+
	mGKzdnVUg4JHaQirT7BrMTniqoYnMQGmWtUuiJG9ECGupA3hfzxsfab4s1i4ieOi
	1UxUvEHwBAMqu9+H4/be5nzTG32MedU6diQ7BUIeR2exFxNeIALMhl1mPv9Wz57U
	Rvl/N/KUG0udnGVjiUD8+N/lZaLMudFqCpCCYTJozQZqeVSSTaZfr1AzSZDfwkIW
	fMova8PiIF93rHqbfDDmz+F8SaAJLSNpNYGYroDZ58M7VN+WI0BEZB09QuYy/tVq
	iOEZWQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj8kxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:43:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff854a2541so4563325a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744728192; x=1745332992;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6ICL7BEh43VFjprVAuqJP1WzL3ML5MgGF+4l11v0XU=;
        b=Ul1Mvar8Tz2UFB4YXxyNUIKMG29CPrrgLwwgN2mpupI9l9MjHh9NIJWxOZjd8dAIhb
         WNWhO3bonsaqjozBP4f7YXa/5yosLW5qSGtUxGYaQIGUKohUuhcJiFeDSqGrdr889+pG
         mkmdbvfvOzjmuyJSMt8Y6Du0pKtwF3qzTHHM01YGdGi5w65viUOeyT44Q0KHQQio9Fk3
         lyLCcE8/PSYiFidYCDPit9npw7lYPw5yExrybSAJCmIn9Fr0GEs5vHf9mTuEvMeGFpHl
         2JBthvkg4YkcjLCKEmadZjL1/u80ylTNfPaVwEzqKVS3W8a4Ph6mhYPN5hmklpKywKtx
         uFAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWv8PPs52+TAH995xKZ0h6N5+pQAuI/n12GA92tfhOH3KwCuw1XkwX5HvAcecDFXulZOZVgPP0K95Alj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGegMErVOUwSz6z3Y1lhld+Pe9POevxvijY98LMjZtV9yFPVUm
	upIA4SnEjRw6gnt6SKqmHGYDBrn0nsQKTLWwdiJb2xUg9DAffXzKr1zLOB2REXaLVZ8cNtC5F+L
	eWzgdaUtJ6IZ9/RgyGu3rSwRwWOcDz7SQpBAH1EDDCRbp4IHVwLitDpiXa5GaQr4=
X-Gm-Gg: ASbGncvjtx1LSSnyJjaFXzUb2u0MD3kJ2KdGgbfNVYwmoK+g2ubBP7/osQdMHN1mX5y
	/Fb7HhyX0ZjTasx6aS1CeoWTRaI3dsjdZF42PMdJjSM7gH7DcEqct1mYhn9o8nKkcpsqQxWnS/R
	0lKob/wXsh8BsAIMVfYjUyL4ZY8uRQhWWNTR9+8oCkslinLfnlIsnBBoHWY1hjY64a7bYKHIyTy
	mHIjIw5WEyLZ+STSk9Agkifysh9d58Hnj3ZecpzGwQPvq6tSrmQQZL3PYnuKeyx5LsRiqIJYZYo
	UX5chEicPzrQvsB9iTdEl3dkRt6YHcQMh37KdF6q30VUTfig
X-Received: by 2002:a17:90b:5608:b0:304:ec28:4437 with SMTP id 98e67ed59e1d1-308237a835fmr21900888a91.22.1744728192177;
        Tue, 15 Apr 2025 07:43:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyR4k+U3wrA26IDmVPSvO1zldLv5AEmcnAVQdQ78ZBZNLqFhBBmRGjmnMR3F7eCa5IdvSpeA==
X-Received: by 2002:a17:90b:5608:b0:304:ec28:4437 with SMTP id 98e67ed59e1d1-308237a835fmr21900842a91.22.1744728191639;
        Tue, 15 Apr 2025 07:43:11 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5484sm118444955ad.183.2025.04.15.07.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 07:43:11 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com>
References: <20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com>
Subject: Re: [PATCH ath-next v2 0/9] wifi: ath12k: support MLO for WCN7850
Message-Id: <174472819084.1897624.8327672522109737794.b4-ty@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 07:43:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe7081 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=2isIlgE5ipHJW2kUYQMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: _XKNpyiXKdYOBHpPkBa8vWlEk7oA9b3c
X-Proofpoint-ORIG-GUID: _XKNpyiXKdYOBHpPkBa8vWlEk7oA9b3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=892
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150103


On Wed, 09 Apr 2025 10:26:33 +0800, Baochen Qiang wrote:
> WCN7850 firmware uses API-1 so it can not advertise MLO support via
> firmware IE, but instead it uses single_chip_mlo_support flag in QMI
> message, the first three patches serve for this purpose.
> 
> Currently ml_arg->assoc_link flag is not set in
> WMI_VDEV_START_REQUEST_CMDID, this result in WCN7850 firmware crash
> in MLO case, so patch [04/9] sets it for assoc link.
> 
> [...]

Applied, thanks!

[1/9] wifi: ath12k: introduce ath12k_fw_feature_supported()
      commit: dad6de9070a8dfc8268ed7c1684b81d1e2eeaa97
[2/9] wifi: ath12k: use fw_features only when it is valid
      commit: 6b85b83e46516ce38ce82dd2f1c4e40d183aa311
[3/9] wifi: ath12k: support MLO as well if single_chip_mlo_support flag is set
      commit: 32f7b19668bd2894f1a236580c2132fc4b9f4449
[4/9] wifi: ath12k: identify assoc link vif in station mode
      commit: 0cd46d1f36ced0e61bd6d8cdce7c9eec9563d294
[5/9] wifi: ath12k: make assoc link associate first
      commit: ead6d41116b81098061c878d9bfc0b1a6c629090
[6/9] wifi: ath12k: group REO queue buffer parameters together
      commit: 3aba3a1422656850dd1f87843ca34acd379a29ce
[7/9] wifi: ath12k: alloc REO queue per station
      commit: 3b9cbce6fdd3d511107e7eaf27a0f1e0d73038ea
[8/9] wifi: ath12k: don't skip non-primary links for WCN7850
      commit: bcdf2620f95752af542c18ee81a83231d4993953
[9/9] wifi: ath12k: support 2 channels for single pdev device
      commit: 176f3009ae598d0523b267db319fe16f69577231

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

