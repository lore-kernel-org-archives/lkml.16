Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A882E3376
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598908; cv=none; b=N5AEH7eUQmiesm48660kFnVILRjRSsfs9lz4z8wMoRlCQlNh43uKGiE6QIb8s8I449zwZG1lZx/z4SW3usv0bGCp0cpOmwWRK2lF6yzcBWssmyEgZ8ve5OOSZZ6ZqBALasxvreBNbiIk9ncKJT7FNbUIW6z4A2JCsZgsg5VshS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598908; c=relaxed/simple;
	bh=fp1rww86pS02Xd9ZYeguLGmw06sBRtkWu3EI0pucXJU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=W/Ocw/DV3V5XUNsnTxkOTYoGwURsg/EvcWQN8BSG+IPdoZueJbkYj5hUxH00sLutgOzHen+gtHwvdmQi2GlMTTJB5ZkkZuQCErNI/vVNUaupIwRxEhlkq5Aeho4TH3d81uYtDeDIKfbFNVUpjicA5uFJOHbutiB3PdDo4JkIBR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACqIjz9S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACqIjz9S"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532Aum2c022256
	for <linux-kernel@vger.kernel.org>; Wed, 2 Apr 2025 13:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lpHe3/WlCZGdKaD8anjyk0
	j1vQ2af3uHov5VV/5tTg8=; b=ACqIjz9SsUwfhV83zOz8HumBFnkXUl4MFKwS33
	7RsQb5kLEDsJM3qoLDjrGwiMQZnS3Ug5l6ATh+wt4whBm6DVSOz4cuwRk07JS/sb
	RuteEY36Kg+R6uXH/RrTb3Y0k47t5mnc/CfMVo1eyW7s88FSwb0jI++3Kxptuyxq
	Lp2YQUImjQkCiqPmCkISgUnwvVCkV0Xn9DCvFkV+HCyVPZuA9drvxT8M4GEWS2HR
	p21+41UnIza05l8KjGLwQZQT8EWgzszWfV4M/KOuyB1vReF5k6Fr3dl6B4dCxIDc
	ZalLDnh/eVRBPTtZvtuvaWci+qfzexIVMQccifYrP/5M5ZaA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ruadssaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:01:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-225ab228a37so116763225ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598901; x=1744203701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpHe3/WlCZGdKaD8anjyk0j1vQ2af3uHov5VV/5tTg8=;
        b=jLKKSKkOouSnlEpBPspHlS/oA2kHPexBaZiI5ILdGwrmDSIFHiuu3Tx8yF3FbqoQt/
         sur/16WkbG5kARQ+2DL7NLEd8OBRs9jpiMU2LgHny1+7UzKpyrebK93+JYVqsxh5pfId
         BaIEJAD6YAMkqwY1HRKD7dIfELtZoD2aoq5wsft/geKi3qFbwnW8HWavvRd9Ipe/E/C7
         MltE+oqGopP6yo2gSENu9lpAEx1eD9OlplvHDGLBcd7PaRXJe5CF6UYehB+5JMZh8dYP
         11V2oo3K91UEeI7mPX8t4bRMIfXjFCIoz/DmEtMzz9WHF3WmerOHDjy/znnOny7vGeP/
         a1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4nlXOx2NvNStIU6ZNR7vsamopVvr2Rb2KyWnau2vem7V6HxIiUcoHZIC+3kn0i0gWgZWtDtoP4v2ijRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YztVMoIjsi6kf8zmoaP2fdTIxEsCUdhy43q9TBfqrO33pVLyq2P
	HQgb9de8KqcSa8QwHykAs0e+ARQOX3YTE9qGdGIsIdU7woporeT8WT1Q+mzfUCWE/tzjxB/fzVR
	GUiHhrAoVNrueLybrhT7pQB1wbLx0ZL7xcMVwsqLKCrerEcQDyZ3RSiQ0s1ufHpU=
X-Gm-Gg: ASbGncsX5cX/l3XI4gMWXnCJRYlaiYt1mNiu66WWH46ZaddQQ4YMM3gEWU5Bqdw+DuX
	VqP87zkqgM330F4ZvQJkxLajbsw6tOSgQknWRDlE7OW/8wrrp4L4eW8Y+DtL6I4GTsA9D5qT5PW
	BZypmHtMs8jsqK+khrcc853sxyX4XG538vsVxgaTq9Sn+/Xtl0QaDIJ8rxOc5cm3oJ9k6kWyCtg
	NGfABbR6DpU08WLNWwQxZoZdgJsOAkzjbvQ+x/UsIrNzyVgqHBW+U/9s56ZFrNQtigwE4+V1UlC
	H7MmfCDGsVolI+awKDSZw3uZ2QBuYAhwTxgmfTs6oTT8ISLb4g==
X-Received: by 2002:a17:903:40c5:b0:224:1ec0:8a0c with SMTP id d9443c01a7336-2296c688be7mr33554325ad.29.1743598900862;
        Wed, 02 Apr 2025 06:01:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElvRpE0D39xkrabp77//ypbYrcV+4iS8DZjxY860u6PYf2TH+0/Pk5Gt+jdJSrNDJEdmSFYA==
X-Received: by 2002:a17:903:40c5:b0:224:1ec0:8a0c with SMTP id d9443c01a7336-2296c688be7mr33553765ad.29.1743598900405;
        Wed, 02 Apr 2025 06:01:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:3450:ba3:21fc:7d2b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16d38e3sm8494365a12.24.2025.04.02.06.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:01:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: horms@kernel.org, trivial@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] mailmap: map Loic Poulain's old email addresses
Date: Wed,  2 Apr 2025 15:01:37 +0200
Message-Id: <20250402130137.12328-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VI/dn8PX c=1 sm=1 tr=0 ts=67ed3535 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=6ohNodAXAAAA:8 a=YHEY5BFtAAAA:8
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=6yzhs6WGAAAA:8 a=rnyhtAeTbp4TY5rVb_wA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=ST-jHhOKWsTCqRlWije3:22 a=0gLUg1G2xj6MhZ7RLP3J:22 a=l59MTjElSK2oQ4zvHJ7Q:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=j5F3_G_i7ziBYwdlbqZG:22
X-Proofpoint-ORIG-GUID: hASLia_ZnpejvioisQJvlRZlQA9Gc7wx
X-Proofpoint-GUID: hASLia_ZnpejvioisQJvlRZlQA9Gc7wx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=948 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020082

Map old email addresses that are no longer in use.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 05a3889ae2d3..0d8c57c270d0 100644
--- a/.mailmap
+++ b/.mailmap
@@ -430,6 +430,8 @@ Linus Lüssing <linus.luessing@c0d3.blue> <ll@simonwunderlich.de>
 Li Yang <leoyang.li@nxp.com> <leoli@freescale.com>
 Li Yang <leoyang.li@nxp.com> <leo@zh-kernel.org>
 Lior David <quic_liord@quicinc.com> <liord@codeaurora.org>
+Loic Poulain <loic.poulain@oss.qualcomm.com> <loic.poulain@linaro.org>
+Loic Poulain <loic.poulain@oss.qualcomm.com> <loic.poulain@intel.com>
 Lorenzo Pieralisi <lpieralisi@kernel.org> <lorenzo.pieralisi@arm.com>
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> <lstoakes@gmail.com>
 Luca Ceresoli <luca.ceresoli@bootlin.com> <luca@lucaceresoli.net>
-- 
2.34.1

