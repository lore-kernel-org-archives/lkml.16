Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB6E278740
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652342; cv=none; b=Fd1j45UcwQZsARWN0ZIesPOk3nW8xhAiO5KGlICX+ivsUYfMHB2OvtAvQQi4maYw0ZljjR4xlylSPYcP4AWtDqPwZWjS6Jrwje3SZP3CpftUxIFehCeN0Zf7MAr31dD69f9M60CTJYwOheZPs7D0jquP22H6s4RTUjFALjUQh9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652342; c=relaxed/simple;
	bh=LiiIOXZeFcrFR5Wr0strWiFYZsNp/GL21CWg7UxWNPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aa3YoSKSHYfNNDtZQ+R1HOWu4KziUo7wp5WCKQsVdVosXeSpeJD4Y39fNqIXMeU/Iv/Qx/msEFao94JZS1IbNnniLboPhTUoPMzj6QeXAgZGAqqfLf/yR+uYOnQ0oWukmzqFX27h4PdNm0OfS9pwIdWVULFR5YttRaYLSHIj77I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNGSjDL9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNGSjDL9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dSwr002440
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=; b=TNGSjDL9I6qUy5yj
	PILjBTcQS3UphGkH/QHoFaeAmcCcH91T9l/iGOddVRHp7MYwUG2KptKfg2b5qOma
	AzX30jHkwtB5S0vTNH95gt7hwMV3HQtze1b3HnkWj/VYG1IDZQF+RJYMg7U6WHkr
	sav1vZBqsCetCrTTyunwrZVj1Wl/IUD4QrQM/96knE5aKp/C1xh2+1p5HbvSY+yT
	+fuAY0YgjxPd2Uvpn8cAf9uSABbqvwfX4I8PnE6eEaCMhPWkges4EXaWbsp9hlTB
	9OhTmCFMdq8HfcLentyTLjFtdUOnWpanrZkVLKnJ4sePmS+0TS8lY/8o2kqb1/Ys
	Mu6qXg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atgdrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8b14d49a4so37020696d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652338; x=1748257138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=;
        b=GdZXPOsoEXnyxknsLDePZk0il7C+7ooN+58AmUXTMCM6N4oOt3WFP3s3gBReW8eljg
         lAXpVE3YkgwzYXR+OAkj1x4nLyw04Hlw4qqol8BYfadpoWjB9ijlUssEpcgM2RLmySvI
         nzaGye/xPtie/GHMobVr1UxgRLBz5CmpRLYZYGN++z9QHCv58ry3hG3BpYoo3JWdzivB
         Z4BF4Vwp+iJwErIANLroBznXLa4rCzJ47Ys52qcF/lWcpuHmfBILNGqCzt9+GEyldR4R
         BAuChDOd2AdQNieLJqVg4p2RqUOOsMh/CZLHRwQDBanmgtiI6f8PLIL84orc+sxT1eC9
         4PnA==
X-Forwarded-Encrypted: i=1; AJvYcCWSP4Pq9zLS2aesLE+HesFlnDpODUXjlqRc0ibGtrO/kbIAmDCtQYJ6cPSw8cYJfBqGsxD9XnRBtzFLXPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YznuWZu9nVjhkWrRTXnQ2x1p7zt5aJpcwVzW46ofkVYpHr9KOJj
	oZvNWO3Z17jl9MEIEJtxP1+xKNWIzcUjHUXniIR7UaoumM9XqcKiBOtETDMEsx8aFdNSu8hX2FQ
	9aSM8FFyYm1q8X+u7N7vJz3Q1ya4jKBtNFko+5FSfSWjWTMGU+KyxcjJ6pmSOnkO6sL8=
X-Gm-Gg: ASbGnctSSiXylervLK8RzrzhCqElPfOjpyf/7glPY6TkNoOOZyR9iJRrBcsd6K+iwnU
	XKQVz0SZnv6ZLZLXiPBOZNoynKi7q6wF13KiuR1VsFFsvkUC5oPz3ej99NosjofrYxBCz8uHqgG
	b+tc5r324eWLXbJBu4pgQeRkcn5S4iLPm2I+QeJGHSdb2dNSpnsbiprN+hxAoIbyXFJzMp1ZTRU
	/EqK6TfcH44v9mlBijC3XTDThXRPtm4U2sIvAMZvch8VfQYsH6RTOmshEBEbF/t+EA59yiLwk4k
	itKyEDefF/MzNTcZHTab/mQCWWj5rRTFe4TxRIgSdDVO2CCKxPe20B9CZTuppgiVnEai1DNR0Zt
	9b88zlx1T7kRk70Drz6upBHA+
X-Received: by 2002:ad4:5f0d:0:b0:6e8:ddf6:d136 with SMTP id 6a1803df08f44-6f8b096db83mr202681156d6.45.1747652338541;
        Mon, 19 May 2025 03:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9+e0xodbssXAPktkA1sHSaU+L3EdyNKhog5olMLiulrlaQky3UDZDMD0M0rpu0Ed//Cc6bQ==
X-Received: by 2002:ad4:5f0d:0:b0:6e8:ddf6:d136 with SMTP id 6a1803df08f44-6f8b096db83mr202680816d6.45.1747652338140;
        Mon, 19 May 2025 03:58:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
        quic_abhinavk@quicinc.com, lumag@kernel.org,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        Chen Ni <nichen@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Convert comma to semicolon
Date: Mon, 19 May 2025 13:58:40 +0300
Message-ID: <174637445763.1385605.2171270817711925653.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410025221.3358387-1-nichen@iscas.ac.cn>
References: <20250410025221.3358387-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682b0ef3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sNhlO-HqowW9r6Pg40gA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: bl4tHewbVMxGWLqg0O2zi3uON1Ny8mQ6
X-Proofpoint-GUID: bl4tHewbVMxGWLqg0O2zi3uON1Ny8mQ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfXzmrew9Ys9qxO
 LINQpYLyKGq1P7WtxB7v5X8Yct4o5C/Iy3FF8mrlrXoJJaf3vu0dMNwUT7dOQ+VWNTEbhjY3Y7l
 kTgWGtBlq00wScMJ+OysorsyeHLfGvWYbptVC/HWVMfxRPjfwEjptNvwO7MiOFe7sQOkx0F0XQw
 szgApm9DT3frSQmOSjyHcXOsZID5BMKSCQiAMHk9lo6UJV3+9gchmlBGS6IqiROIRBeeYIrY7ww
 gNAE6gHE5U8PNUdxFtZfDMd3xlrYDVy5HnlF67HiUB/izKzd0ZSEUkG358kbaX9cqDnYRwf6fGg
 Fm+PdpkQk1PjbN2G6+/gzQl3bDCYgOGXC1WRRmpxVYhjis8gPMbVyP9kfOGat1aEtJ1wXFfSLpH
 bxwMEeqmbWdgALVhLVnk5sGB4NdqDEwu3snIdkh9QReqXySKLn0MHPc8Q1KzKE6sylyekmYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=808
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
Message-ID: <20250519105840.d7Uodqp-7OCv6zn0RzTaXbeh0U29Z8lXdWLjX-OLPBs@z>


On Thu, 10 Apr 2025 10:52:21 +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Convert comma to semicolon
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5db5401c2455

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
