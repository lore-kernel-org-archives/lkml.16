Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E5B15539A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749305747; cv=none; b=YXqr3e4usIAsNtFcemcv91bCc0kP78nTr43TiBsrhA+Qkx9RPdpug+6UaNrUKv4Ozc9vkrKdtYpPG+LV9gOQeFIZYeBZLcBPHDGH0Js9/bo35SEmg6DFihl70quqt/9XLJj73cqOpPdlErU2Fny0UEpML6SUDh526+CTCZLHObA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749305747; c=relaxed/simple;
	bh=1R/4cAeIAzLJOWp/GuFrSGG6zEJyy/eVJqkUetChkPE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XPIH1HNK340jVSRTqHMn03V9aqGb4wviXrf+5egPvpFX7fVsaPrbsrgAihVjqGXj7iVp7NXdk4amwRMh3zz8yQ+Eqo5zuDR1JyIPMihBKVscTQDXFEi0SIfWw8g/fQ/UU4Syn7pNifEWjSHUblJsC6yUsI2rbBMKsRyiAWZ1YlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FL8FIhGi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FL8FIhGi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55767d4F003820
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 14:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jQEDDMTmKsjlbrJ1T/mYsq
	l9DaM6HWHTltiou3XAwfQ=; b=FL8FIhGiYfRPpEb5zkLb6X5evl8aRpePWsUbgj
	woUE1/DwDvnrHExHMp86Y2NnGAGH8/6eHoXVwl16OL2JwcBbDMgPU+BeKCwWRkEX
	64IVk1M3Ymg5qahJWQOyE049C7C5MfZzR26IjVHAgH4DtOE8wXEoA5Il4rsHSqqG
	Y5HfoXWT4TSlOhEICgLJmvhmdl0qxpl8oWL9ND0t8lGt8H8nWaGhkJA2wk3qgPrE
	FD3O9AfKYzcbbK2+/46BQwXO/yiQr5e6FjlpJsbcZH/vOktcLBEcH/729bn7MLpj
	ZCIirVPQgI7MuWu0Fuk8GMWZF8V/fE3hPnGyhjop79OUPT+w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn60ns2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 14:15:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so3199519a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 07:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305743; x=1749910543;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQEDDMTmKsjlbrJ1T/mYsql9DaM6HWHTltiou3XAwfQ=;
        b=BoEVMZ1PYDjxmKitxRCopO0OKNChG18EaioLsP9i3nWfIVMoqTLmGoNbbNFbf63TPG
         Faou6ySMICbjtM/XZKRqBkU6px4pSVxs0l98Z3POqqmv1K94/wcevAKPT2d3nHswO7xh
         yp8n/d/WtFq4UgtM+ec6PRNi82BW/6lQj9Y0M8E3X+UlNw/HHEU0ZFZZu/UX1wy/L6mQ
         qGrKHJemaUyk/+9jvCjxseVhjzIfmngL47eZSZqVHGtslE78/YsHuiYH/i3bqVIqDlmL
         XgMa6az8BRgdCw8ApjB+tBbzaMWOkvRYhgojLANBJx3LGGSmqQTJCQbslhaYyonzbJKs
         MqRA==
X-Forwarded-Encrypted: i=1; AJvYcCWNbiFpf01GcfMA67ZMOG1wrutON9IRpEUe9GTDb0rEaAwlCY/778umWXrKoJx/vwQUJgWqwIdFmrJfSB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvYJ6yzTE0PzuqZZ8p5s4yiSu4ilXJGANvx+ZAKlvCydWCCBOz
	AmS2q2yhwm6ZGF51oOwPEGwNxbZVRCl3Ivul+cTjKSXqaG0BIddul/VF7CHh2jqLbCLwUlVR4QC
	Z1xIr+uw6iIo7CK/ymODsjNGqnL7PKvu/ffg64aQAOFwYYLncgnvssZRKR7plOCl6+Dk=
X-Gm-Gg: ASbGncuo9petshpdRhEEQJveBZalt/ddL3u1LZ6wwP71TLhisjTLwkAo0+D7dcBkfSE
	OygOU2L6UJ3JVEQxjRsO2nfjDKuC1y+8pJ3NsO5L47A5VqZdtO647z4DI6nzvxWEZKHg78fai8X
	Yrhkl9rXY+cYms4oi3jYoPHfL44Oz4ndT6VBM6Ez/LYQfIQ/E9D55dSoQtMk0WcNCzsl/6nSLuC
	UtVADdvhwUmFKasNUPSt7+5/tdXHEyTl/k627z134N7pYdDRL9Xjy6jXmhwHS+UaJhz87cB5se6
	HaUiFVxqmRXCEctQ2QpZHA==
X-Received: by 2002:a17:902:e750:b0:235:f4f7:a654 with SMTP id d9443c01a7336-23601d09641mr109277385ad.22.1749305742561;
        Sat, 07 Jun 2025 07:15:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjF9YeOEhWSWfxr+m+2RrgoG06THK+k2+nMjTup1J4LstKl/tmEjXBkTr4o+5QwdlWwirKMQ==
X-Received: by 2002:a17:902:e750:b0:235:f4f7:a654 with SMTP id d9443c01a7336-23601d09641mr109276915ad.22.1749305742176;
        Sat, 07 Jun 2025 07:15:42 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:15:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/3] Support for Adreno X1-45 GPU
Date: Sat, 07 Jun 2025 19:44:58 +0530
Message-Id: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGNJRGgC/y3MQQrDIBCF4avIrDugNg00VylZTHXSziKaqi1Cy
 N0jSZf/g/etkDkJZxjUCol/kiWGFuaiwL0pvBjFtwar7U33+orVLEg+cYhozd2TnXznqIN2WBJ
 PUg/sMZ6d+PNtZjlHeFJmdHGepQwqcC34d3sYt20HBKPUqo0AAAA=
X-Change-ID: 20250603-x1p-adreno-219da2fd4ca4
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=1043;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1R/4cAeIAzLJOWp/GuFrSGG6zEJyy/eVJqkUetChkPE=;
 b=T5B1TBD6n1ZXjWmBzYGz79OW1hjAwODNgkAjFeCeljEAqh+W/4n6lU8z1zkK0ykWF3R7mJUA7
 8yVMyFfn9g6BOOwS52MkZTyflD73udKJg7pyStIQ/5hNiAqyx8r065a
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMiBTYWx0ZWRfXzhu/Yp/lVHJr
 XddjRgBe/HWRYJRvOutDpzWyYGu+r8w09vjpWb1kzaost9IbKdmaX2bb/GH8+pBu7GGqLQ4FBNt
 WPgb8znOVWpqNc16TNs7xME+LZjyUalSPfD2uZNpWLP8I3T5QC0i73QhM3wRE9pa4/ViyczKW8l
 wiON2zoAKJnWKOV2bOd9cCioA607dspDx1sfJgojvzc3LDRqKF3thTk8muB6D8ovQuA5hsFXeG0
 24XLNn3VHjL9YtcNaU5hbxjUy7HUMefUBRqBPx1C4EAQFc7djHdl6NVH3PbOdRrkkq8aLO+oBny
 Gd9mhglc9bqd96n7Voz3/OQKIicQr8+F/Ks8R1ZMjWqCWMppXKmgt536N24cwgpTh5U8gdrs2d9
 N5YHxUqfrMi8UWu4YIP3WnwTGEmsv+CsfjWSMEwgTL96DeJirlgHLNdwXUVTFUX+1EgsDw9K
X-Proofpoint-GUID: 4uLr15kxY4jMfoBpKy7VhSVi0aAuPCSn
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6844498f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=vb8sKYNj6oKrwasmUUsA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 4uLr15kxY4jMfoBpKy7VhSVi0aAuPCSn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=536 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070102

Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
version). X1-45 is a smaller version of X1-85 with lower core count and
smaller memories. From UMD perspective, this is similar to "FD735"
present in Mesa.

Tested Glmark & Vkmark on Debian Gnome desktop.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (3):
      arm64: defconfig: Enable X1P42100_GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  38 ++++++++++
 5 files changed, 170 insertions(+), 1 deletion(-)
---
base-commit: b3bded85d838336326ce78e394e7818445e11f20
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

