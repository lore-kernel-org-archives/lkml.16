Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA8B288CC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128862; cv=none; b=TpEo8/GugCLjaQ3EqIS72dYdx3HLI9o/WbyoGj5EfXltyJ6rVvZQzTLi4sLYr9HdwAH+elSzb5w60sz4RFuHKUDjxQAeWEZbMj56FTaoe8mRjXEhWPzRVNzSkkw0L5YnhatTHow+D97Dfk+rnfCilh58hGSeD+cBa85Rvbwkzco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128862; c=relaxed/simple;
	bh=C6ukl8x0/ghLtDCKRtgYCae3sNn5WYbGaA1IAinZTgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r6xMmapsj0RisX8pRvBNdWG5N5I58OB8G7V2uRbdE9FDUPbb2edf7j4PSZ1ptpAQz8IehDuftaT8Q+VF27J/nXZT0Y/GIqRiUfEeC4b+1H/83WudqIOwO1H2NInartf8UNSG7zqHtHSjimMyweJPka3F97PgwnsiX6JVInuzg4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WN/Y6nFO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WN/Y6nFO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AVUj2018786
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 16:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JChD1O+yvBzCtKJYKyDcBQ
	V0cXUyrIoaCqUHMw537Mw=; b=WN/Y6nFOrDT1UqPuXYnL6kcEPZ3GE6wdWWvZJS
	mrQkLkuCkMLwTL1T6gF75IgU+U41DniIV/Vqd5vM8j+nd7wwspRcYG1t9/VYMyt1
	wPIjp0AxGpzrquaVgP2asBqRSBu2gZy03WmC1hdPjk1LkitKor5hqubFG7owVlZd
	1KTK97lhdULYJ77dd0jmBykLzPZGl6UpKHT7LZ9geLUebjHur8nMDMn+WOkcAM0U
	z0lE80k6+b6A4EneHJV93zyWDsKnRaSE7sltgPA0ryCvIoYBL6kjLeRf1Qa3sfTM
	dagWWD3c1KevuHngcaJIkJ2gbTRkyEIE4SkeDAfXmLD39MXA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdggdnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:14:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so5048225a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 09:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744128858; x=1744733658;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JChD1O+yvBzCtKJYKyDcBQV0cXUyrIoaCqUHMw537Mw=;
        b=K7jo38TY3VrrqBhN/WogVicIXYKhPNJkh82p6yuNmfjdXJUl4b8ws0YfsTm0wHhADm
         kXtvG5TPwEJTSKuPeMf6w/0qGScaua/7ohT2C6QAkP38iH6BxDKsgfCvEZTI1CYEpPNw
         VhVPZ4xHaVz/4mxEVKeqSwka5SMG3dpuaX175Ku6SfMu0nFSQHw7eTK+zkxe3HYtOw7x
         zRgZIL8y3f7kWskYNVfyzQaVGMRH/uJC0W+kXK3+Ect0V4kDgUTyH4sdM/PpxYh8BXDO
         jeUogn+2X2rR1wvYXeTiIzElu+jGozIJd6KivQJ8CjS+Zq/rUjq5TjTMmwHvAtMUuprm
         RUKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqK6xVM3QK6mz9qv/BDNikc15MVYF+ltFnUZ+RwSd1zfuSAM0iBx2AI2NMc4ar9tHDIJMTd2pwfIGAJfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YykSva9/qyFbR1pIFOjwSCXWAfQW2M+VjEAAK+epLnOjLwAR48G
	hcVfnq7ZDvfxTxlqL9g4XGX3s9EgJ47/KAYE2AWaoQp2XwCYDgbr7WZTPdDgwgWBt3mTKsNEchK
	xc9cujxpnsNWaYxt1PgMCvvbNHwWiliny7busAicsCRLhE2n6b2ytOg2DQUl9EkI=
X-Gm-Gg: ASbGnctkmzxPKWHGPSBt/a3N+8BF8moUJ+jLLUYqgHsWnI4np6IZLJNwSTU7SlD8Cke
	TE+4pBuo5fxvGIS0MxGie1b9BUxNXPqEqyA41nmGZ25QEnpsZrtFk/zS/wgGKaR3bO0dhzZcrwL
	oeTbujwPsN6zATf7BQqwjISm4gCxSyALJ0S8EjVBREPiLiRVwMQ7p88AkMKW0EQWp6N/27/MVd6
	XuJuVowCW8EXlJm4ZjVoQYs2Vqvun6K9QChSpiX/RtMPDj4aEd7EsG6jPPRGkMozF1FL0uu7++Q
	S8QpNQn+D6cnnsMNzfU8pzYA3XRBhxvTDQYbNLrRlbiCeRV9oL6w
X-Received: by 2002:a17:90b:568b:b0:2ef:31a9:95c6 with SMTP id 98e67ed59e1d1-306a6153940mr24692354a91.14.1744128857880;
        Tue, 08 Apr 2025 09:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOioE+oyWgP7nuMALMOBlPvbaof1KJ+SidMoWLQ93dXA/LLo0o1Vnym6X8fAaQxiq3YX1F3w==
X-Received: by 2002:a17:90b:568b:b0:2ef:31a9:95c6 with SMTP id 98e67ed59e1d1-306a6153940mr24692273a91.14.1744128856950;
        Tue, 08 Apr 2025 09:14:16 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a32066sm11217405a91.27.2025.04.08.09.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 09:14:16 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 09:14:12 -0700
Subject: [PATCH ath-next] wifi: ath12k: ahb: Replace del_timer_sync() with
 timer_delete_sync()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-timer_delete_sync-v1-1-4dcb22f71083@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFNL9WcC/4WOQQ6CMBBFr0K6tqStUNSV9zCGTMsgTaDVthII4
 e4W1kY3k/z8vPdnIQG9wUAu2UI8jiYYZ1Pgh4zoDuwDqWlSJoKJkhXsRKMZ0NcN9hixDrPVVEk
 NR1k1ooGWJO7psTXT7rwRiB21OEVyT42CgFR5sLrbnFs3gLEb1JkQnZ/3P0a+oz8mR045VWeQH
 AWXqmJXF0L+ekOv3TDk6ex7o/grEkmkJTJWSF22WHwRrev6AZ6aBkInAQAA
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f54b5b cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bC-a23v3AAAA:8 a=rOUgymgbAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=L6nWsz-Al0U9Y10IXFUA:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-ORIG-GUID: -FqvqG3LYh8SA8OlX86_oYNrUZUIXeTL
X-Proofpoint-GUID: -FqvqG3LYh8SA8OlX86_oYNrUZUIXeTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080112

A linux-next build error was reported in [1].

This is the result of a treewide timer cleanup [2].

The ath12k AHB support has not yet landed in the tree where the
cleanup occurred, and hence a new call to del_timer_sync() was not
addressed by the treewide cleanup.

So fix that one instance.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://msgid.link/20250408105146.459dfcf5@canb.auug.org.au # [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=8fa7292fee5c5240402371ea89ab285ec856c916 # [2]
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 1c2171e2bb73..a9d9943a73f4 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -334,7 +334,7 @@ static void ath12k_ahb_stop(struct ath12k_base *ab)
 		ath12k_ahb_ce_irqs_disable(ab);
 	ath12k_ahb_sync_ce_irqs(ab);
 	ath12k_ahb_cancel_workqueue(ab);
-	del_timer_sync(&ab->rx_replenish_retry);
+	timer_delete_sync(&ab->rx_replenish_retry);
 	ath12k_ce_cleanup_pipes(ab);
 }
 

---
base-commit: ac17b1211841c98a9b4c2900ba2a7f457c80cf90
change-id: 20250408-timer_delete_sync-b6ca367d2daf

