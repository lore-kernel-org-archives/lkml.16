Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575B8215077
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750203142; cv=none; b=u2j/Izanr3UslLkIVdr+fNmtlK5U5j0Bxzk7yP0eEIEv0HqF0sE2pjn+Bf5uet+NmrjaeFRhXl4EM1eNNXZjb4kuQR+FMPlr/Ght7cWcfjvtd0T86To7ictCnEP/fESiVNCj3XISUQDKBr+QtgJOLg2CIK5oD6d24vQ0toyFGLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750203142; c=relaxed/simple;
	bh=jqXxdnaOvZX8C6DjwEIvCBFEEPamboFLctzJbB8tlb8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ErLueSYI1vt3RbpEm0iJfc486QvipsyIUQHEB/EWnEu4jOVLFWVHjQETObfN/FM2j/xHrgE2D75W1rFmBeFCZ+q04p4oTuPQLwb2bRIan80KYYB9Rd+d0wHiJhWyXWKLNz9ihXE5MsA5d171RvjohnVh/AUD7BbWhf+3CbB+lQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgsAfPqg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgsAfPqg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HDF19C015543
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUL7CroyrpZf6btOL7w3xb0NqyXrGo9D++p4e6dJYhc=; b=LgsAfPqgqyni7jWW
	EKLz5N88ZA7ADl8qF9GZXx+FdFwJGZhlFcy8zrOxVgG3HVtt9I6kgcrzvr7Gh2Dw
	BVucyvca63lBcHAaCIyRwbS93/A0xqJNpF9mNhSpqYIHhkPzwqDdVbhBgnv8suoz
	UlXPKPVUqz+ivkCWnXQSxaDX9XkvdGgznBVPifWWjOp9KgEkxJcHwiP540cxY6It
	KJpsg/V/bBzs4OHUcv3k+Ib22sRTu27kTiyJKQy5a2z+A0cH2Pd/tzeLLUIBMoUF
	nBJ3eS/pXPBKiTGXjt4MXgAplIIOWBH4TB6JMeAGMTcRujUrhG/87JQOnD6ljFxo
	2hryCw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfj5fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:32:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31ca4b6a8eso21009a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750203139; x=1750807939;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUL7CroyrpZf6btOL7w3xb0NqyXrGo9D++p4e6dJYhc=;
        b=pDqNKiXmOW8GS1fC9sHqz19Rlimdyfhf54bBQm93zZVqbFZIp/bHT53RBtKMJMQQNy
         DyGZoVpRGYhzvBnKB93NF5Dos3UMkSaUgmYHELspxkJbieVmfQZiYz6971U6e/haIJGa
         YJdwlksAa8V0OY4rQY6OV/OqJtJbsSBtNY0w5o7nuv7egJZ46JvwTJRTBZJ/dwUAKInC
         QcufomWXl2kH6j1c5xeQRG7g6oEW7tZ3p2EHVkO10x2iqyITYkkC9vPbW3NMX+mV9pTd
         Syvu1XW5v394RmVoe4vLuK0Xwul6VRm7R/3tnnBNFnBFmFsygF4lFVB0K2UmnnKw1t7Z
         7azg==
X-Forwarded-Encrypted: i=1; AJvYcCUhg6zTFwEy91h2PaeCb7UPDa2AlecCBaDeXSAgjcAFxJpcgf9G3+81wnJwDdDdFAs5qr1cEyv40uchyMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtiP8UX/VZQLbuR+QjimGRNa9icyTDetO0P3bF+v1G4Dz6t1Mf
	2eSa1r8pJ10JqkTPpzAaFtn8gC2XLcmc9mdmA5wsJ89AuCCCiBON1PpA3SuKxwxm4VEPaqulAPR
	rDa8IeDV20V/VzB11+TfXo7zXmfJQQPPJZjToITt6czINTKF779tTTHG9f8HWYYBywStKvyEhAG
	0=
X-Gm-Gg: ASbGnctp9Fz8QeFwYVT5ohua8iWEmOpMgHmk9yidPfzYcGlG3Aw65hA/HZbLdRuwLrH
	81XGimjZ9NzqI1hiMxmnEdqXOJgEE3GYNQOb5UogBs7lWA9TItiae9CA6evYKxodziY/HUrctw8
	WRL5u0oXOFwl2ymvyq2LeldfFM0iBvcNGmiNj51zexUXaPC7uFGfexAc+seGKUeG+XFQ8xpNZjf
	HVUEddwa9akvZPSPrnELyJDnHA+Hxd5uNvNyKFKOhLlgG7ecnqqNpnv0UktTdVyAywZBV3vuNRe
	V2loukMA0tptw2UDZQ3xRK9NlXzyzZx5uy60JwYQTJWUkcwS+BnB8ivyJds=
X-Received: by 2002:a17:90b:1dcf:b0:311:b5ac:6f6b with SMTP id 98e67ed59e1d1-313f1ca3a91mr25943757a91.9.1750203139277;
        Tue, 17 Jun 2025 16:32:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRLipJpoM80vKlOqw1gaHg58pnt9kyoTUloinNoXItVvcxbbGa8jPFnicyxoYhInuo1UjPCQ==
X-Received: by 2002:a17:90b:1dcf:b0:311:b5ac:6f6b with SMTP id 98e67ed59e1d1-313f1ca3a91mr25943713a91.9.1750203138833;
        Tue, 17 Jun 2025 16:32:18 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19b84e5sm12731527a91.2.2025.06.17.16.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:32:18 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Mahendran P <quic_mahep@quicinc.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com>
References: <20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath12k: Avoid CPU busy-wait by handling
 VDEV_STAT and BCN_STAT
Message-Id: <175020313777.3793705.9220172332163404030.b4-ty@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 16:32:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE5MiBTYWx0ZWRfX9jQIt9wgpvhG
 YZPZGtHRVn5wrKYNpwZslRzcZimGz+EIU1LnJDstj+HtpBAkUttfupegYkLVzLpTUcYR2gaiKKZ
 3M37ZyeF4RO9FpGFuB+KVAIwujLnGv35zmEaOP1DCXn0O7rUC7PrLbTHh/Jq0fUvlhaUqTwWQ2P
 WcDNoeCc72blR/Wm5zqMbJx0VX41wI/edkCwBFG6lV9We9joQclG/9KUmnlneAH+5L1ErlPi/m/
 ZJoz4V9hmPmTmOZRT1k6lJW9vbqkhvGzgpgsqolvnmDdd7l/b38Jo+ZXVitVEvTySmMVRhNuExT
 O03/q9aVg/v8/qphn1ikeu2n8GomChO8UPLBuU2UuBmxAR15CIKfqFqkGfSGUj1jAIxy8JZChMy
 v4+ARpvzmiRHci2UKghWFf9db1Eu+mAVaWciPJmYqpPI5FBJ3UHEEGYiANla0V6COKiBiQrz
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=6851fb04 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=srnEmxFwYOmbeGIj9OsA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: mF2uIhT0vP23GXrJMpfUojzNmXtZdY9G
X-Proofpoint-ORIG-GUID: mF2uIhT0vP23GXrJMpfUojzNmXtZdY9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170192


On Mon, 09 Jun 2025 22:06:22 -0500, Bjorn Andersson wrote:
> When the ath12k driver is built without CONFIG_ATH12K_DEBUG, the
> recently refactored stats code can cause any user space application
> (such at NetworkManager) to consume 100% CPU for 3 seconds, every time
> stats are read.
> 
> Commit 'b8a0d83fe4c7 ("wifi: ath12k: move firmware stats out of
> debugfs")' moved ath12k_debugfs_fw_stats_request() out of debugfs, by
> merging the additional logic into ath12k_mac_get_fw_stats().
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Avoid CPU busy-wait by handling VDEV_STAT and BCN_STAT
      commit: 18ae7d0cdd76420e80f6ab15ada063708f14ba40

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

