Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAE0271461
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529667; cv=none; b=FUv5EGEJIbztVEQCRS7Q/TIk2bi78i5BUUXbYx19qXgU5hRIB4euWvc9geluRN0zuUct4ELUC/AhyFYtOGnWmBx2NHWmAk6uxhr8w21FXYfIKxOQlAFO7dj4cIpZoAnB/mnfi0C6RPYVrfcvqcARrPMhlQkz1fL7anP33/s6mNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529667; c=relaxed/simple;
	bh=Run+O2mI2A76noQdH2tqShWLEpuGZIuywf14cmX4Kk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kjd3vJXyfVeB2ooXvnZJ1grLjqOAFScPWRxCdPCL6NexA0tc/E8LsRxisIcUqNAjCsdUWxQnDYaVMaJUjVg37h0YxsjuSa4gRGRGu+9IEaop+MWXNc3FnS24sRp3VA66hE96U5MfLuctPmx/Rjznhk3jyNjfyN37iTehiexLMzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSq5Uatp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSq5Uatp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L8RqNb000931
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1aqIaLvUpP1zFWPwZcv8zHZi9hcPKnIY5YKRhPTvJuk=; b=ZSq5Uatp+fG9ELBr
	RRwTAdWxWNSz4z6UtG5++e+SRg5K4sGGGnzchc7TkXzBZjKYFSDXdL+FymHxFJW6
	S8Xlrm44tjahnBo/NVKVH06HOsYtT3gyP3ZAc1Jf948YfVeN1F/DzXKMhDh9djSD
	IIhrDSDVsjf8vWXx+KApWNY/oUwsgzRiDdmgo4UXWUO7J0Ls5lN8AE1mW+CDqbFv
	c1ZN2i4LuI0bYCHBTPtBPaO6TfgdsrthGJG3R9wt3H+14AWS3MwBEYn0vhu03cCj
	i2wICl4stcHVS8rF+EnwihaCGV1WNu044e6h8DJsbL28ra0pv5eNTSBJcBTo7wiq
	pdpEqA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ds7s0kmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0981315c8so239127785a.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529663; x=1751134463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aqIaLvUpP1zFWPwZcv8zHZi9hcPKnIY5YKRhPTvJuk=;
        b=d4WxPzLslkEH7H6TJCLTtKx4ArB26bqhQwXYpF6bcKdbLx8BJJbekBb1C3LS1c9WRy
         /MPP/sTUUIbBdLrjzXVFkop29/LQAQ0CfUyjajTqqRYbK6sUUTGjSswhj/LE0B5KohCS
         8NHpMgLcoOLQlkuFvXIJVkyFnM1BszaNzqu1h2i0PQS9xe69CI9X9vM2XUa9t/c1zySy
         8eNdLf2HQ3DQqtwc85U8ZbWaaP4LPbx3cRDqn/6Le3HjqeWUmJG0rzIBxUoTRQq7mEN7
         9wSZJNSWVH/TRIdarPVJ/3WG9y8t6ft1y3Va7MYzUSed1w7EOM7l02q0RO0ebD5qZTVn
         pQSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBLShYaHzNUCxubeVu7YJIlHSLGBf87txlvYHakSi66fYxMCgmXcNh6WWSBOLadFFRXVgx19vGHLUrk+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy00eQtwgZv5GlpkunWN1H1FzNwd0LTC8x/41x7MIJ/ReKjyI1G
	EX4ONrRvCkCoKry3lNNVgdKWPsrS7I82+ZVKFamCI7bgO8cmCORRBNKtyjMZ49Ks260tX7c7UeE
	iRzi5oBnj4tYj1x1y6eYaaYUNJBIbX3w8c6wihlEn/45l3anggw8jrsAAuysRROJQq5dkKJhNWk
	4gDg==
X-Gm-Gg: ASbGncsVX4mZgUFAt7XUpouW3iY/Zr7qUArq/A7S6+fUWymIxvQ9Z3cn8wAh85E6zmv
	weOnBf4Rgv+wxdic6Fdk7gyKjxpVNzN2IOpbtRIR8Q5T8mKKSfP8NNRwtMLrU2O9ayDLKNhdVOp
	XTWhkg3LtW6a8LTk7hmLjzMaibCt45sIeXsvXoWb7kKLzFe7IKZ/0gMaZCH1BbgwyIdLm7oGLnR
	2kPfOAuvleG+nKtYJ9EPDnBzisqaAviv0/nwPlfkEiyJCIBjTMJkfuxtF8syOS37FQpc7ElLsYa
	ry3Y+W8wXstGoaWpOgAWQlawz8ocRp4+nZb4qn3hkrP2EarxjZ6KoxaO0PE2UrEoZV4by9COPlk
	ugBw3hnLENiYkj3huUWuLXOYnXeP09Tpk5pY=
X-Received: by 2002:a05:620a:2693:b0:7d3:ed4c:fe84 with SMTP id af79cd13be357-7d3f991d7d9mr1216212985a.31.1750529663609;
        Sat, 21 Jun 2025 11:14:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELim/6+6aSoh9DCQhdH9yeSt9LxI2hvvLw6WOJeokVXk9fuz4Lf6Jl1owf+XMfbDNvPIp+vw==
X-Received: by 2002:a05:620a:2693:b0:7d3:ed4c:fe84 with SMTP id af79cd13be357-7d3f991d7d9mr1216210585a.31.1750529663236;
        Sat, 21 Jun 2025 11:14:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:13:01 +0300
Subject: [PATCH 6/8] usb: typec: ucsi: yoga-c630: correct response for
 GET_CURRENT_CAM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-6-a86de5e11361@oss.qualcomm.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
In-Reply-To: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Run+O2mI2A76noQdH2tqShWLEpuGZIuywf14cmX4Kk8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZzwGwXYpmPvXDx4iRsvi9cjZU0WfvZSDkRh
 IDMJvCJeDyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cwAKCRCLPIo+Aiko
 1RSLB/4obyjbVEnnrgRFrKXyP8J/IIWxADau7nzq5Ef21hBWZml2P4EjvzYsPPBuYZSTClzcuAj
 i9NZEYyViwIasFDsQU9aDXQ36I65lGrnjnnTl1ii2BiHQggjgHDrBkcvET281KnEXY/1CemYaIq
 o5gMtd+k4A2/zRLotSO3SH6SC/yulmYj7ESWJxLmwllFHF4SWEM5XqSgmklCvheY2QxYdFJjCms
 5enH57R56RTgJYT8bkt2k0GGIOSkW+1R7s3ZVFdLw4xeBHlp5oDjDucDFKS0KHIPvBM3Nuj5BEO
 kHqLWEgb46YmdGXSNyV5WOCM40B7wuDuRBgucsJl25ETxJax
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: liqJhY14EXo2ZILioIkKsQaFzclIrP_F
X-Authority-Analysis: v=2.4 cv=cIPgskeN c=1 sm=1 tr=0 ts=6856f681 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=btjbPSU_vhCAQAxPhXgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: liqJhY14EXo2ZILioIkKsQaFzclIrP_F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX8ljHw+NA2Keh
 u9WysB6rhsbkO/zpMz7aHhALla/VZ33sl7kvdxvtRQunt4jjT0An+2hldgnQbShtSRozGjzIvTq
 tmLoW/2/jo3OeYwBq77EbGPcd2l41xruAyYeiObLBnaZUJJ/pnQfLWhEWYBQ9i2hDbvhIOQZ16x
 ayXpndmwsdfOPwb/ca/JDdPA7tQsdFNSMWeQv5jQFH8bX4TgZTGxpu2XkvM6rOSyZwAXyuxfNfF
 Hu1sBQ9Qyo7m00aG7ipUrwLzWsBXwBRgtdXlUYuvjXjf2v63Xw6liftvE638lfRSp6izRK7Dmeg
 shssNvPGQZyZ5UwHLmjqNlH07cxFGrm/efKgiiOS6wrrG0qxxgdU3ekNH5QoWYYS0S6tnYKWMxU
 L4BmByLzEKdyDpXEds90VgGE6EIivlzomJTND/VfXKnl36vGBR8Yj4jdJGXXSjeDSyNbYeS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 mlxlogscore=806 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

On Lenovo Yoga C630 the EC handles GET_CURRENT_CAM command, but it
returns 1 if DisplayPort is active and 0 otherwise. However in order to
let UCSI drivers handle AltModes correctly, it should return 0 / 0xff.
Correct returned value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 506faf31b6e3a056e067f2bb69f5e9e5ea40e514..76afd128d42a2573ff55433f815c2773462a6426 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -111,7 +111,15 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 		return 0;
 	}
 
-	return ucsi_sync_control_common(ucsi, command, cci, data, size);
+	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
+	if (ret < 0)
+		return ret;
+
+	/* UCSI_GET_CURRENT_CAM is off-by-one on all ports */
+	if (UCSI_COMMAND(command) == UCSI_GET_CURRENT_CAM && data)
+		((u8 *)data)[0]--;
+
+	return ret;
 }
 
 static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,

-- 
2.39.5

