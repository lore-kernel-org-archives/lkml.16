Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0CF2727F6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690132; cv=none; b=DDT1ZQolV6HHEOfVPorcicEc8lJGLBhKn3ljBpHZfOW8RJeSCPIVSGN6bI1IBBjWik7PivExLcCNNLVdmT94Z6gElSzel/+mVkUjNPks+MolYCVC5LFN9bJ6tcF4w3uJ3spbl0dJ8nXcLv9Qh/q8Qvs/GGNyrX5kcebh2J27Mes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690132; c=relaxed/simple;
	bh=lnIap2uoB9L6Gv6mGUMzZpCUEOQea4hLblMIRH05vMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KC6WLzknkQqYyON570v2yt1oklhB0LfOjcLKdJuTIY2Njo1z7vriYUnvmADuFenKJK6ihhj73Q9nHgeyP23pKNK22/dCcxIyqnfWQJiVJQ0fOHY205jEm0rLZYqD7yf0sLGr2lA5qm4AFTLssCVpooBYCzUAmsYwFbpOb+/kOgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JROfLtqd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JROfLtqd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N99mTC002957
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOCM1tAGatqvuUpE1vuXd2MaWKze9bMXgr+n8TWjS6o=; b=JROfLtqdNL73TSL/
	fmVI8WpkH2TS5+pWTu4PqiPzXJ+Wu0mVPfpRyKsf6jZGPEpDP53OqwTNncIbz3S+
	thVlygQR/ws6ykyKJJzVoofEFbeYMOtMUqS78hS9MaktQVajoeb5/mUxztzjotf0
	wMEgkynMsoPx+BXySEArjZt2SUZrrUvHtbhihRbLwvwMowBYts5enM4fnlFTJJS5
	ndxy9ZxKpscNIJOrHuVnCAb+VnKzAKlisOgDT5S1FhXWkFk6TItXIgM/OKI8s15x
	tU8/CPKWZ5vx34HpssybRzqVgXMjUdrFzIsRWiZAS7Ecsc92kXVPVf74YXHfPdPi
	OSvYmg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec2637r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7489d1f5e9fso5244064b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690129; x=1751294929;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOCM1tAGatqvuUpE1vuXd2MaWKze9bMXgr+n8TWjS6o=;
        b=CJbchQsnVXuZsz7FCmnQp+QLUZfQrI/vcrG+PuCN1ONQ7fipR81P5xck1Hr+cfXR2p
         JseIUKCjzOr+rourpz6MS4Kph0O9G7L9pAAnk5yIhalkrqBISS1SKHrFpCVr+yx+2Cao
         5pGcPGb41TKSdfwN6sQ6fkuCCj9ue3EeNbU/zvb8P6TAJ+g+gWpq/CH5Jxc3bexpRSai
         2/Q2DCHyEALyVRxG/I2vmlqgUlzTfyiz+ZDVILZpd0IZu/O9Pgnj89+dAMzNVCvNSu63
         bSDbRMuA73hkdfx/EpCaKwX/2qP9F/6IzHnyQ5zjIj++RutRx9UJnRtfXkWm+hZU0FhJ
         GQfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+ddVj5dnvV2dgICsjNJAr8ov3dWIFE3ghWGwpSsgupGxNkMMGj3CCN441X8G/IKSc2i7EuVKPk5A1tVM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy93NY+n2l8/lU1GHr57hPsC9oQa80lUMmpFudPkugv7EGytyo9
	5Sc1/Ry5jtpiq1XU0tM1jvWiER7PtGTjCfkiVB/SAsCBdRoEAvGw1J9CqVZFLp+F+q+i7EZeS3I
	pAV9zgvphr/bgMLTIpEpumzP1J//8W77Pk32qy36g1fkKYg23RVuh3r299ReXm7iLQPI=
X-Gm-Gg: ASbGncspcr/xgOTS8BkL7c/5QkqOXl7qXA9DcibCy92hEEGW7qCJQVAydkTKQrdnimy
	NilBxQhXwcPdwb2YjN6GEeoxYwC5wc7taUURUXKKj9scAa0+gCznixkzRPaobOPILw/3W8BYAjt
	DFtWZuW/SSfxYe3Y/r8kuPvxwzl1gvIjf2aXAEZS9ZTfPOAxAopOzcaqY7Rz/hWT0Gg+SVpYwmH
	/TIgcXrIN3qj8GnnQlbkzYW6UauLaXvaR1Js4FP6G0NdAWhtQiYnFqAzXHMr9eCuf8wAd07bar4
	CI4TPW5fCby0BDg2KnfwQxd3y/rNEx7mJ8ruVem3efZEugdnjBrXOOr8NxM=
X-Received: by 2002:a05:6a00:3027:b0:749:464a:a77b with SMTP id d2e1a72fcca58-749464abce2mr4789110b3a.18.1750690129131;
        Mon, 23 Jun 2025 07:48:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlktiwR9SgURSgPFUS0DTsoXi5zB3HvrPc9cZdXpa1GmrQr0LxuniI0dtk0RcrFa5bKCimXA==
X-Received: by 2002:a05:6a00:3027:b0:749:464a:a77b with SMTP id d2e1a72fcca58-749464abce2mr4789082b3a.18.1750690128730;
        Mon, 23 Jun 2025 07:48:48 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:48 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250609-qcn9274-reoq-v1-1-a92c91abc9b9@quicinc.com>
References: <20250609-qcn9274-reoq-v1-1-a92c91abc9b9@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Enable REO queue lookup table
 feature on QCN9274 hw2.0
Message-Id: <175069012802.3758471.12950159281764113432.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:48 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX1xukbXDqJ5dK
 CtKkFqV4bADHGGscbE8rNP78FVP9YIT2zST+qO+pODPPiuCRj764hISR6YfNXjkkLlPu7DI9ICm
 hiYvZ0yHvwrs1K2I7k9DiCY9BH4OhvS3wkh7Zr8iY/wSgdRQj1plcii+RFZA+y5eY/TTQqKhVDj
 JsZH8NoOXS/NLRU0JyeQbmtvF56bQQ/7soPJc27XiqTMkgqXNoKQEchS+zRKbDwcyfp+iCAOtNr
 g3QQ6ucKNxqs0Qf6DsrxWt0g8iAwigvXNb2dZx8cLzG3++y3AF0b3HSAPUR2Oz3NH20pUKmNPMG
 dbGn1Z/ZR/hupdvqjzSsZfMfM+QTx99HqK26ZTkgQK1eHUBXyvL79DCD9ALRWauUaY7o4NTkQep
 Mp2dYeayr1hzqjWmD5+KXeT+uDR+ur6S/GjBVOgysXPzvJO9WfhQodTsRoHT21Ncelpe0vpj
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=68596952 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=hk8jstzJOELweJxXsYQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: bSJS2jWVGVMMFH9i2cjd8ZfsGsVPSdim
X-Proofpoint-ORIG-GUID: bSJS2jWVGVMMFH9i2cjd8ZfsGsVPSdim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=881 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230088


On Mon, 09 Jun 2025 08:48:50 +0530, Raj Kumar Bhagat wrote:
> The commit 89ac53e96217 ("wifi: ath12k: Enable REO queue lookup table
> feature on QCN9274") originally intended to enable the reoq_lut_support
> hardware parameter flag for both QCN9274 hw1.0 and hw2.0. However,
> it enabled it only for QCN9274 hw1.0.
> 
> Hence, enable REO queue lookup table feature on QCN9274 hw2.0.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Enable REO queue lookup table feature on QCN9274 hw2.0
      commit: b79742b84e16e41c4a09f3126436f39f36e75c06

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

