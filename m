Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1A177111
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745538350; cv=none; b=qOtesFKwZwp8oMQQ8yCa9jmEFZ4kIRKDZ5IuyyTLZyHb4EOpiZlifz1gXH++lVnL4ETmZ/F4io4Ggfq2XEYkqy8A/38vF7rVvfByjr8UjBnDD5s3ROXHozUKVh0Guhq6mCDLcqyut+iYb3BJy0IRhIJYQE4tcKdCGnYgRbaAqrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745538350; c=relaxed/simple;
	bh=ofmEoSMhKo06h+U5NhGAMej5n5ubYDTAlHp5FYY78RQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X/RmA8Sie52NfUIqiGzjqwGJFUUcVq1sOxK4jab7oyXVpdkDZhu7m2HIngoQRII2snwC4jxmHL24s+kLp9GvRr26GTgY1ECth9q2lhdE/xT7qdCI+KJFR+YUXRg6LC0BPCfSXsnMZGi55TQNtu9XO6je4GiXyGyrMv/MUSFSQlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ksov6oMn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ksov6oMn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmfBm001749
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KyqYKtxradzfRqDlkOHzNZ
	aH2YGpNBHk4kCUBoruzdw=; b=Ksov6oMngp7mBuyBNIetidXOKmDHlIIrl/seov
	W6UfRrVwAbnoKMacer9pPdcdi3RxjMrhuz8X6BdO6EAqNN1N/2vDt7jjfs8dT2VJ
	JHj9Ptxgv9Ui2TO7CoDQWxUgO2P0w6VV8NA+3p4EK8KmAIrtM1l0v5OJ9OCHp35r
	RxOZIiq+kRmnqY/BDKhLEoTH0i8efMOiBxNi99PAviRwqFPGlMsIDdneVT/2TLET
	Vu2Zvk5OFjbwI9ltAeJmpDedncfA4K/qOTIAC83Yd0mKbaJ2ZJjCvsiubk7ibVlg
	yKB61doEnopb44RUrQxgJCTpl1Zb9MD/sOxphWRFa4PQ8hMg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3f6yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:45:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff6167e9ccso1904469a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745538346; x=1746143146;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyqYKtxradzfRqDlkOHzNZaH2YGpNBHk4kCUBoruzdw=;
        b=UQevEr7UoNgtMGxx0Y2oK12YbhlF3yOINuFdISnnoCnYYhG2LxG2xhC/9G9N+t/AJQ
         zRqrBJTSjpdBikQwz81UQwigngbR2khuqFATP4Ei+4H2SRRgCMkDnyj6Um39Y2OoS2L+
         bCW8FbcDmfQmhcgUaQ/OnIZnpP0P6hbX6S66EnvBnq2RSWTg+4vo3pY0nX8SnaxYLNVl
         GahVFWJrLVw9BT13OuizNkSXqoQbNiaW+0skW/qQhpMVhAOgHmMtj8c+fj2s5Ddyptog
         9sFihi78o8w/raIkEhYNnWq6QsKtQ8efejJPOm31Z33k/QKjuRG1egTPC7d5elvX+5hx
         k8OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCjnK8Zsor4j4rUFM3oUT03vrWxxVQWkJE/cm0R5xmCbmD0L5LZQi0IxWbZT3betTX8hlLWMoge9bdetg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw14xHPy/CrRQxYymmIOPavO5/xqCAWY6QJbwVEkMAtRqtquyr7
	b6rnMgkgjeTIlEorNPIGEVrVh/H/Yi+b/HIOfK3hcwVPsKJrooZoYVH4+9bn1NJVErF0shZF86y
	mrl3stBaPTjK304yfIKlCAgTohaFti5liduH0BaWrwZW4FD91EwioaYFOhRDNiTRBw4N1jVA=
X-Gm-Gg: ASbGncvZ42VBz0CEHFWwWSDedACaOlqpVLa7PnfCyP4IFIxagsEOBLDpvsEWETl/ocI
	cwiF5upPV76iKAL2ZDg14z2nX4ZUwFDG6/9vJz4COVHNcgtodIxxMgIVC+lDYoqNYtVUqyaeelN
	8j53XtcNm5hB9/38BX84NORsllBxRkzdDUNjtG0UrJzR/X4/CFFwH/aZMJbwCaPm+gETIHP1Ukq
	JXwfFzVDM0gHEm4nJqhRdFSaB5YTiXQopTmF5jL0k4XLAXwM4J0I7uiWgH5R3r6RAzBjCezHzcy
	I/PdK3EGVQ08qeILmSI1IxXqxMmKuUZZo2fYq1TnOoJXHHuBlabqu61ezi0JatscTKQauAvFqhL
	05Dk=
X-Received: by 2002:a17:902:e404:b0:225:ac99:ae0f with SMTP id d9443c01a7336-22dbf5d8b00mr3086405ad.1.1745538346475;
        Thu, 24 Apr 2025 16:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3rWDrNgerPAeRbJmrwpa//JpdMGGhQSUPOjFG5CY6PYdzl4ek838Z0IyiHzO8Hat64ueuYA==
X-Received: by 2002:a17:902:e404:b0:225:ac99:ae0f with SMTP id d9443c01a7336-22dbf5d8b00mr3086185ad.1.1745538346087;
        Thu, 24 Apr 2025 16:45:46 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f774e4ffsm225078a91.12.2025.04.24.16.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 16:45:45 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 16:45:41 -0700
Subject: [PATCH] soc: qcom: smem: Update max processor count
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-smem_count-v1-1-931cf68f71a8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACTNCmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMT3eLc1Nz45PzSvBLdRAtToxQLy7Q04+QUJaCGgqLUtMwKsGHRsbW
 1AGokHK5cAAAA
X-Change-ID: 20250424-smem_count-a852d89ff3cd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jingyi Wang <quic_jingyw@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Aiqun Yu <quic_aiquny@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745538344; l=916;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=ofmEoSMhKo06h+U5NhGAMej5n5ubYDTAlHp5FYY78RQ=;
 b=L6Org0dMHoH66e4fXaSqOfQAEKmeC+VHumQGQrTITeKxuIaYIbGh7nsyPxclzzls3z5S4shL6
 acgflenu2gRDq+5W72D53/by81Ul5Bs3AfBR1XKNAOWC28YK5Vn2vVj
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE2OSBTYWx0ZWRfX77AkVgYqUZvB mFTmnzrZcPa1Wn0kmdNyeGEgOV72TgtrxPf/cIzZDs9DnDF3Xe5/60QSkreMoPesvJdINg0tJvP H4q33/V80jjpwZhcZNN2nCNFHHSbjWz/sdc0dm1uVbJO0wbrOmxVPbWrkCn5dpOeTtJqGXHqFZC
 qz9XNwE9i4VViCi31aPpLavNm7wSH5sSUXwM4oB9cR5Ms00F/0KibJgVkRZKqZi3EIErQK1dHHN CG+dANueufrHN0dJOxuraYzCabeHueG4DbOdSbWMqAjkM+xAV7Dzyjb7cDUXv5SUF2T7Hl/7w1M xlnKhMZUhZ1Y+8FrybaMQzem1qLG0acO6m7fUvY+xxIOeMy6+L4AkqClQTsvwgqIWgvNMZzlaxk
 nfNDx36VyV2VEQ5PF0clB/8CmGCx4uYn6UbKJBLasy43yeHeDid9DQaTIeCt+T4JkQi65IYf
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680acd2b cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=dluG079SF-FDyRJlmAYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: zdAP_bwONvzR6S-WCpo3vJbnwFksMH9U
X-Proofpoint-GUID: zdAP_bwONvzR6S-WCpo3vJbnwFksMH9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=779 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240169

Update max processor count to reflect the number of co-processors on
upcoming SoC.

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 59281970180921b76312fd5020828edced739344..cf425930539e406fb81307a17803955371545f32 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -86,7 +86,7 @@
 #define SMEM_GLOBAL_HOST	0xfffe
 
 /* Max number of processors/hosts in a system */
-#define SMEM_HOST_COUNT		20
+#define SMEM_HOST_COUNT		25
 
 /**
   * struct smem_proc_comm - proc_comm communication struct (legacy)

---
base-commit: 02ddfb981de88a2c15621115dd7be2431252c568
change-id: 20250424-smem_count-a852d89ff3cd

Best regards,
-- 
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

