Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4B1238C12
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846780; cv=none; b=gwx0gzuDttDIuIYg4H8nJAmXxwP9NdUuvDxpdeNqpgXOWejTEVwWWzqHAedYJriwIYDFAZwF5nfNKiWTxelKC+K8c49zoOZzm1h6kUD2uT46CnoT7j3s+IT8zQ6dWnAmzmR5aTlWLC1NOCyQC9QBBHmsN+vvb6UH9fi5L0k8igs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846780; c=relaxed/simple;
	bh=ZLxhqVrgD1aG+H5ifsU1SecBZEhPsL25ubEigTaeSYg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kGwHmOokGiGU+PS3gk5tGMmKCwjOZ9BWzc51Ca2QRS6UMbnNVHFzODpclL75EX5zxas0x35Fa0xZQiKdGRD5v18l0tMHuB3w0Bmmk//ZaHCQkxhYpXyWIkJY2/nha5+bQYdkNdrvSVDZ4Dcb3uAPzCFXd3/3LFfPtUa6ZK6t5VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaDUV+g6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaDUV+g6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XMY6031724
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zr4WSApnfNvfnXCeJq1mAi
	DIlMO8zxTYHyPtn0ik4nY=; b=CaDUV+g6h6ltTYOonhUfIS5gPp+CcfLIUJAt7O
	qFFPW0pCe8ZOcJ8bCrNOrd5veZTv+XK1y5FZyBRDGJx/Ar3ppWfZAgAMjEsQFnjm
	8E5QAyB9krRb0GEy6KFG7PVMw5HzJGk1Y+SvnfRc5VptMVkljGoCZRwZkIvtf7me
	Go7W8wWonKhQt7UWQOk9lt/NwjIc9nkv0pKzVzqwQJwcZsBRVd+jmlpZ3ZSRevR7
	d0SW9GWU3nHoMOKjQ1is0KRTdP4Nf94ZQXHO+e1dbuST/Srjo9raLYG8UaZeNM8I
	Y5sC73VFIZpsMCD3JE1N/GKq5qjdrVt5gHUGkepCLi7y3ZFA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c22775-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:59:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30f01e168b9so2810568a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846777; x=1748451577;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zr4WSApnfNvfnXCeJq1mAiDIlMO8zxTYHyPtn0ik4nY=;
        b=VouVbOBsj1eBBvNxbmke7DNG37REh8S34mrR3h5UlSPyYHbvi64sMZU+pbkYXYChUE
         EHxYAWiAjAyMTHQaau5IMCl9Sgz9YAGjV1kQlZNCKGGXwz6SBAjk2EQiY2IZHAHBSI2L
         YjWDzEnaVpIrgoJ6NF7L4EH7+2G0Q897FIIe7wsmeq5r8ASEvhTAz1CqB5ZC3QXvgcb9
         ke+6wvXQqvp7oUF9SpHYcZoXt9oiCLSrbMdY/tQkQImSlMns1Fmy7Cf44CVFpmEme0Es
         0zxjE93m4s9CtYWH0QJ53Ffx83dsYZn0Swl7frf19DzdIGrPeY75J92gXRArDGdQZw7L
         nbNw==
X-Forwarded-Encrypted: i=1; AJvYcCVroyxfKp+R057lP3TGUOKze7NE+aUxOVMSIDTnZ0DOcnj3ma29EBomQyBYjkOLBeYHHD/wrbID80i4T/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeuRikV5gFvOtzirC8Mw5HT2va6rjxnilqviNiX2RU8d8HL8gg
	0OAaxLEHTdsdqS1x3sEpoujMiXnViU5x7gMlZACxyksm2+qzEn7oVcIyD2LzMP5HHS9+g+8Knyl
	cfZiinHh3JLx0upMC3s5HyoZxNbL4OqRYrqbvPwCrq4q0kVOA5HC50kiMdIw61fmOLxU=
X-Gm-Gg: ASbGncsOTI8f3ntCdKMeBZyF8gdERjt9FGEFNbhCaDOVlBp7pNxgI0q9/77D48oucO7
	Iuvmt0mwjbRL21Jr67NKzTZnMtycqHgprryf3R4hlbgTz+8Q2EZuFtAhDZT8tEouAUhYvz+KIzD
	itA478y/sv28FpSfs9RKXjkv/MmBZ2VnaEl4OhcxkSua0NW3yz/p3eBgI/uZrKvMgEaGJt0EmH5
	98iF9TOtgpEzTMsZy2bDBXtjjQwz5Dz6c2ViYbCvGnI4s0VpCQ+rTaATuqh8qD9AL40Vo2PKg0u
	LrR3bBxVmJ9J/CfTATa8P3W6BEtXApFRBdOU/pFaFD4CtpHjrGA7TwDwBNHd/h+dKryqkHOQAOE
	UI7HV33WsnnWtvWIgfbW8NjdEHgc71GuBrjD4
X-Received: by 2002:a17:90b:28c3:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-30e7dd430ddmr36472192a91.8.1747846777526;
        Wed, 21 May 2025 09:59:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKNrVIcI8Rdmnz/M0wlFT/WEJL9WfEZ6e9A3coQK80grSSbO+IdGvRiCwx3jNOkI6C930Cjg==
X-Received: by 2002:a17:90b:28c3:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-30e7dd430ddmr36472148a91.8.1747846776986;
        Wed, 21 May 2025 09:59:36 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4ee3sm3875055a91.18.2025.05.21.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:59:36 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath12k: fix several regdomain update
 issues
Date: Wed, 21 May 2025 22:29:28 +0530
Message-Id: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHAGLmgC/x2M0QrCMAwAf2Xk2UBaqTJ/RUTCGtcgdKPtpDD27
 4Y9HtzdDlWKSoXHsEORn1ZdsoG7DDAlzrOgRmPw5AMF75Bbcv6LH+3ICYvM8b2tkZtEvF2JQyA
 muY9gg7WIaef8CdZhlt7gdRx/kUXGUnYAAAA=
X-Change-ID: 20250521-ath12k-fix-ah-regd_updated-630a550a0e79
To: Jeff Johnson <jjohnson@kernel.org>, Kang Yang <quic_kangyang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2NyBTYWx0ZWRfX6jevoSTi2/qx
 UyrvR8r6EoVW2/SgUd8kzcuDJC6jqrc33GoiKNEixUWEqvIM9BuQQavJB4sNx2ZIxeb6IcdgYX/
 KUMm+TwaTZmAaDqdYEfHJc7Tamt+GbKNo1/AZ9jGCxLk4K31EF+HYX00+0blHFs3xDATpd9Uxaf
 qTfp3skGs6ofX2tpwhVx+AfghlCGt4N7vzSmz0GEqYkHSTI4MW12e/+AtEzHOyj47QBihBT7i11
 L6c4Dl4uZxY99oXpmGz1s0lhe/RMREzUoZA5mZcMqWKDT7/CYlpCIM1zC1YmTR9T+vcxhFameOS
 TMC8y0ndYJrR+5ntE8TKqKMR7hL6dzKda8Hw9ZBgrhSd1W4vDbrxu3wdsuQGRBLffXdbWK8UPSl
 ghk6FIPCfShOH1MpYIViQCzpS90xrPuTvb54kofsPVUO2n4Uu1WSWgLcnGJHhyKOullNXML5
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682e067a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=cVR6XFeMKWr3T3-t-FUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: YE4C4G03MGvkGJSa1XNigCyt1v-7qgar
X-Proofpoint-GUID: YE4C4G03MGvkGJSa1XNigCyt1v-7qgar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=862 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210167

Following commit 4c546023d71a ("wifi: ath12k: update regulatory rules when
interface added"), the WCN7850 fails to connect to a 6 GHz AP due to
ah->regd_updated not being reset. This issue is addressed in patch 1.

For the same reason, regulatory domain updates also fail during interface
addition and connection establishment. These issues are resolved in
patches 2 and 3, respectively.

---
Baochen Qiang (3):
      wifi: ath12k: fix regdomain update failure after 11D scan completes
      wifi: ath12k: fix regdomain update failure when adding interface
      wifi: ath12k: fix regdomain update failure when connection establishes

 drivers/net/wireless/ath/ath12k/mac.c | 2 ++
 drivers/net/wireless/ath/ath12k/reg.c | 2 +-
 drivers/net/wireless/ath/ath12k/wmi.c | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)
---
base-commit: 5b5f14fc4d737a956dedafb996459c4276f4fa49
change-id: 20250521-ath12k-fix-ah-regd_updated-630a550a0e79

