Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85821DB356
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749307445; cv=none; b=JKQ121T0xwNwUh9xFxavFLxiz3SE/+I7bGhkLyF1HEe+4lrtJXflBjs+UMrV/Ms92BGpWLImIjcBL9n1dZchmoRRp/7DOeBCvXKACboNQsBz6Q0WOXtcabWzGXZonlkYpB3XL+0EOC4dGKz3RXK5FupFNQ4ZzQoXLu/Kogol4Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749307445; c=relaxed/simple;
	bh=eHRogY5Kj9HYWhfIuz6QT0YblNFRlkRoIo/sWcUgi1A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EYafBIvJMzU33CsrwoOvhi/aspp+wa3O3jHedcKTBFlTIkbfQOT5KPwyH+SaLPUAWh0Gpg3TqUsUbcjx68k9npvlwTbnJSInoZaCbdHOG/Xkwb59oVUmjSj2u10DrfifZKnyH2Mt/aT6wEq4DWZ+Dy5s+gtkSM5lasbA9+KO7D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBeY/1OF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBeY/1OF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5579QkDw030708
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 14:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A/fuCDH0Gwtq0pcPFkhUBL4eiap0PNxhpbdO+SzUgds=; b=CBeY/1OFaEeoGvIz
	Bf8doQOBi0CJabnMT6X3qnxfHVVvppSXRCO+QW1AI6+3DmEQL2zqRMdWV8lmlcAQ
	H5duShhW86JTR0nO+FMxDTKxTm0p1vo+Nvj4bEi6Lj+cqMp0eSw0+zJcCPsURzLJ
	X33KVd1UYBCCzwawAHLBEo2tUICUh71wIRQurIF5nnRsYeCMkI8dhsP5pIYnHt7i
	suGnSr7cNnJR3fGv130PM6AXOzM8OMQjUobhfewQT5BxKdP0Fboe91CnE93nBzSN
	tE3VwdAlZ/h0LJKum4YgJF/Wq0Ki3N3spmRPP0aHEa3dF/bQ4/t3nr+m5B2hDxj+
	M18Rrg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474crkrrs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 14:44:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3121cffd7e8so2475875a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 07:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307441; x=1749912241;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/fuCDH0Gwtq0pcPFkhUBL4eiap0PNxhpbdO+SzUgds=;
        b=PIO5v/gIn1EpuU862b9HB1OQQPnJP61vI7jvmnt8+E97xo8KIs7GDBVEiOZmE/a/uV
         JKH0HUwQz15lLXz9XEBMR/0XZq0i0wJ082DXIbB5WLmlwoJjMXqKznyRmkBkcO61wG3b
         ZdijP2p6y1yEzwbY6/No0fK++blOr36BK1OS2w97+AeCakfQo52WPKkIUPbxciMmv6of
         1mnj3h5DBTgI13Dfs3lHdTeEIqxkV0V2sATzCcfay0u1Irhugcb+NjMQrP29VlpHaJtm
         yza0qkmmoE2JWyhJk3pK7fMcOVcnpIs+0/7fS7k0LV9vaJctVHWaGlzO5xY42GU1LoCH
         lZIw==
X-Forwarded-Encrypted: i=1; AJvYcCU8dveuEiDh26hv53ns0V6oEk1jWJu1Dchkq6+hXM5ZMAmD5KtPjwscHJIgAbx8VCpTAugypqDCrhPgZBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvIVZbQ4FuxJDCo5Amjp72/wnpLFZtqavIYVrGmmp/Bd4f7GU6
	FeLdSzUw3X+dGTqmMHHW5oyb0chNgWKWibBPuCveybp9v+5XYGeWR4I0IeczR8expydV8i/oTlM
	GbOahaMat0fcYq2Nx/5ziJHGTwM6ipF7hjtY4RVsdzOb63FZK5410vJ1jefzgqterKEk=
X-Gm-Gg: ASbGncsZg65Z9cXjKljK8gz92/hWes5RBJmBoz2bnrq2pjCrWH5F1b7MtLLbD1qltLT
	szRFrTQ+sus9fvD3hZAPf2dSx/QpQV4jzK6FkS49MAxXwWVeG9rf1acwsvsUS5iwbCyYCOQ62OJ
	wuk4ekESUQx26FxJb18vKPeuvi0epu5dYxq/FH6DiyR2SQedT/Vna3qBRcpsVV4ZNnKEZLi28oB
	/1uxLyK5NNKwsNVPxGC3AYbOYBjNtqEEcEYugxPL+StwfiDbvmrfU6pTI2jQZkyTKmrN64+Vrda
	g6Wkf37cCUTbwo9ec/Ene7uLZjpvP8+z021uJeVeKEzya5vcb+uR0pfMmZc=
X-Received: by 2002:a17:90b:2d4e:b0:30c:540b:9ba with SMTP id 98e67ed59e1d1-313472e6282mr10368086a91.10.1749307441499;
        Sat, 07 Jun 2025 07:44:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD+4PkLMrBMsDCrQtypCG/jc+LuRnHVZmBtLd1qujgjyESaIf9LewEVCbZGdMu3SiJEsFO3w==
X-Received: by 2002:a17:90b:2d4e:b0:30c:540b:9ba with SMTP id 98e67ed59e1d1-313472e6282mr10368061a91.10.1749307441149;
        Sat, 07 Jun 2025 07:44:01 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm27626415ad.72.2025.06.07.07.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:44:00 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: ~lkcamp/patches@lists.sr.ht, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250522200519.16858-1-rodrigo.gobbi.7@gmail.com>
References: <20250522200519.16858-1-rodrigo.gobbi.7@gmail.com>
Subject: Re: [PATCH ath-next v3] wifi: ath11k: validate ath11k_crypto_mode
 on top of ath11k_core_qmi_firmware_ready
Message-Id: <174930744011.154748.14985794944248434687.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 07:44:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dsLbC0g4 c=1 sm=1 tr=0 ts=68445032 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=7IIfrU1qyLA2P-n2L4wA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: sUXuLPyczqtXRax1Yb9qkZozTD39E2x0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwNiBTYWx0ZWRfX9I4Cjc0CEZZH
 eTSaxykM7yoBK7fUBSYbT7xrtIsQg02FeZPNlsDrncSwuYWfw45UueSa5nhi1UMtks7dWYbUf7X
 Wjti55IsUJuhhZO3FfUmh9GZWWufkVqSdVQ0UkQHbIdZWpM2dFqPl4AeI6PEH2SjydmYxN2tgRo
 j5fMWivkLZBE3WItdW3f+zlZt2aMv8gIt1brI5XySgPXRnXdzIYavMK9wW2CvIfvyhPdnXggUnS
 lmmDy9nRDGV0+WzmDXLy77Wt70GqbmaLkO4wMA6lO7JoCqYxqZxjqFijI+BboczsydyqQMg+U2/
 RHRb9XGphECVQkjkCluroIh2qtoigWdd08du+I72fLJeFNBYFIpDu1rnNAuUXH3Z/sNzU3LdLqm
 1vTpY5i/KUNY7a/vDvcQeejzy0MYYb4Ll8T1obIA62TvhXClDsHo/w0U1pL94M8+CkpAlhnh
X-Proofpoint-ORIG-GUID: sUXuLPyczqtXRax1Yb9qkZozTD39E2x0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=967 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070106


On Thu, 22 May 2025 17:01:12 -0300, Rodrigo Gobbi wrote:
> if ath11k_crypto_mode is invalid (not ATH11K_CRYPT_MODE_SW/ATH11K_CRYPT_MODE_HW),
> ath11k_core_qmi_firmware_ready() will not undo some actions that was previously
> started/configured. Do the validation as soon as possible in order to avoid
> undoing actions in that case and also to fix the following smatch warning:
> 
> drivers/net/wireless/ath/ath11k/core.c:2166 ath11k_core_qmi_firmware_ready()
> warn: missing unwind goto?
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: validate ath11k_crypto_mode on top of ath11k_core_qmi_firmware_ready
      commit: b0d226a60856a1b765bb9a3848c7b2322fd08c47

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

