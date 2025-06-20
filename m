Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88CE1E0E0B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750437839; cv=none; b=k5VAt6+qCbZWWT4kcfHwmrdJhQsSzGFaq82igH3Efs9fYM2kC2JypIpLpf1oD6Gmjq5Ip/QwZmbnFPPoRRwJOOyyNGYZ9i7gtwVbAXjEzAkGXjWprAGTDcVyMBFUPnJkbSbpiu6cpTO5wp8iuR0E8Mtw6RP9h/Y6SL4Vdi4Rve4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750437839; c=relaxed/simple;
	bh=0EVbeZfTsrFJAs+fr1YOAKUVFiNAZHXZYc7YeBvgxJY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JlZ0mMsU39GXq2g42onqWxYGbjyAP6IPkblPbCm0MbvllB1u0IKAcBkZRlAhoeMkuEx6elm+Y7bK/+9+fnHhEzjzvzqEQnZaZZVze90sorHd4PNT9fchQ3ATKkVQka5aapeqYVKTSecbxjQAozCpUYvaawI1pUYDGRa1X2S5Pcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a32g3JZd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a32g3JZd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KG2Ojd008997
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xuEtKw7CVCzY7rX/A/xyoVgknCTtkl+u8Ne
	wJyyFkL0=; b=a32g3JZdmtZ7HgruRhHyloY0BtIP7txAXMeGc328069AO5u68dp
	4pO/s8182d+JHKc9QZoL+xqSsaXXypI4zrf+Ehch+N1PZUdDx9x7OEZYCyuwszol
	qaNVpd3ogAsfZlQUoKqYWZsXCl8VeORlDxk+yp62LxRCge1cSP+quurQfimUEgOy
	Wdm7oMvsFq9xuzCATJcD56m9KmxOfmeJ19eiRyl7ZbVFNHOjE0WrthwRCkLiNS1T
	U9PEM9de/aju61emu0olGlCz7/qP5jXksor5XuQF9lprZJy9XxZjhD49kmoZVe/7
	vCB0oV9xencAggRhS/+iNlaIyJ0m6cAmvpg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47date03ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:43:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7491814d6f2so393187b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750437835; x=1751042635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuEtKw7CVCzY7rX/A/xyoVgknCTtkl+u8NewJyyFkL0=;
        b=UDpOye0OahU063nNyRyGK4koDIjRlDqN+GxixRhiXXSN7VvUzKM+7k1uHhTcvcHT/Z
         ORA3mccQwN8DBi4v68BG65uScSjZeod50Pe70TrsLX1KT7qIvF0qlmt6n4nkdToroewD
         k22XdaFZf6e90VmxQvWXWbx/pLEpBbfehEpqaWPMfxVGsR/syyl3eZf+mzqJLlMtU4cw
         OzgpaJbXoRiIaLPQdDOOsMZzOnLsyzKs+yXEVbXKg8wUm0Wp+1vcbwXkSeH6y1dOAuHr
         tzWYLJjax0tdHfZjGiIhoqSTeupTH8zoiTJFVullpyxBGsmVuHi2K6AqCSezKcJX7L6i
         C2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVB6tEcLV/wS6Tq1PKrI9aoEtJBGCR1m85U5L+jyj1rRwN2IBesAvCCvZDwg6pqc08UBLGR+n9DlwNllQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk2DqLBKC6s3b0wX2r2YbVAP9MELF79YeKEkdlcOy3IKBTDxVu
	zZbyNLtu4kRxZiRKyzykHzyVq0/s4LuRKc24cmf69kjgOSL/bWBaxpHn9JpmxrPj3QpcMzIxVvM
	++iIzXxXiyF9A+2W9DxJN0Reaqr6x8RpF12bktD4l4L6cQb5A3vZrmIRZJv0R2lHVxKk=
X-Gm-Gg: ASbGnctUbWmBpebkqd2MrT0FZrV2XhAuy0jKM/yjcNdMEEsxUngZjDgXOHmqbKaqq6R
	e/rZ5B1gLVR2k8gGneIGm+PLCewNUAEi0DyYl5UYl35eX0VtTrqjreitKs0F+5MoCHtPX5LiYQt
	/h5R2oCgfSHaU9hHG/hC22Ku+0RdwBnAPXEpf8ac23V1V5Te2MF6t9Y4wDIQP/+FCj2NV0ueRV+
	IGFu91UhkyItQZcki2X8X7vsY7V+B4cKWn2IPw6wvuXbyjjQZWNM9jT+d6zAz9ABvm5w0eCpcXa
	7EEKODDXbpJlcjDxGv5Mbcg6hWtw5VgwOsdiDYQSYOxuTOPwrw==
X-Received: by 2002:a05:6a00:2789:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7490d6089e3mr4881808b3a.13.1750437835188;
        Fri, 20 Jun 2025 09:43:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+mlnNp+NYv/5F3VQSUkNQ13bw4oYCkNCD2zEFLoQeeMCUK09WXH/1bwz8n1x/AWHoK21U8A==
X-Received: by 2002:a05:6a00:2789:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7490d6089e3mr4881763b3a.13.1750437834662;
        Fri, 20 Jun 2025 09:43:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6490c9sm2386919b3a.110.2025.06.20.09.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 09:43:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] pinmux: fix race causing mux_owner NULL with active mux_usecount
Date: Fri, 20 Jun 2025 22:13:24 +0530
Message-Id: <20250620164324.3616153-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExOCBTYWx0ZWRfX5EgO21G4KZUE
 LwQeElJtLUdfMZm3CetE2rbFo41yb48Fw2k/qHCvQWCe/1nmSB+1ZBsScqFBnLOGr8PDKGJB0Xx
 88KlAgJeGHkUlrm5zC/xZ/yfJv8DrEC6uendVeorbdcMRbkfD49riugxWoksMH5vtRz7I/1d09j
 M2ie1NeZn+6Bp4/C3ye+8+txp9SJIXscSA7woY2zIZBooPlC+6CEm7bVv6DwCH/lfHhOFOZnCRI
 OgajJuI1qQYudcu1fMAs41Mw8lyg5LO9Ng+RRvVsMDvJrC/6hsTCmHiOXM3k7ad+Tbs7xoRC+OJ
 RLlUgHMDHMuizN6hGqiNg6F3doBPTf+RLZModZg8nt5nhqp1LDk+HjAb4WfqMEPkfbdnjDN4n8n
 6+656bJbQ7gptf1wsxSugSj+DIuk/HE5X1C1fxNsco4VLHCRFbyqSW4RZHYvjCdXOHhq7sLT
X-Proofpoint-GUID: LdsHh6pL8Rdw4lqShHzYyu-oI3nSLeIs
X-Authority-Analysis: v=2.4 cv=DO6P4zNb c=1 sm=1 tr=0 ts=68558fcc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=PkRvFfspCsMwYezBOQkA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: LdsHh6pL8Rdw4lqShHzYyu-oI3nSLeIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200118

Commit  ("pinmux: Use sequential access to access desc->pinmux data")
tried to address the issue when two client of the same gpio calls
pinctrl_select_state() for the same functionality, was resulting in
NULL pointer issue while accessing desc->mux_owner. However, issue
was not completely fixed due to the way it was handled and it can
still result in the same NULL pointer.

The issue occurs due to the following interleaving:

     cpu0 (process A)                   cpu1 (process B)

      pin_request() {                   pin_free() {

                                         mutex_lock()
                                         desc->mux_usecount--; //becomes 0
                                         ..
                                         mutex_unlock()

  mutex_lock(desc->mux)
  desc->mux_usecount++; // becomes 1
  desc->mux_owner = owner;
  mutex_unlock(desc->mux)

                                         mutex_lock(desc->mux)
                                         desc->mux_owner = NULL;
                                         mutex_unlock(desc->mux)

This sequence leads to a state where the pin appears to be in use
(`mux_usecount == 1`) but has no owner (`mux_owner == NULL`), which can
cause NULL pointer on next pin_request on the same pin.

Ensure that updates to mux_usecount and mux_owner are performed
atomically under the same lock. Only clear mux_owner when mux_usecount
reaches zero and no new owner has been assigned.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/pinctrl/pinmux.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 0743190da59e..1cea04d57ca2 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -235,19 +235,9 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 			desc->mux_usecount--;
 			if (desc->mux_usecount)
 				return NULL;
-		}
-	}
 
-	/*
-	 * If there is no kind of request function for the pin we just assume
-	 * we got it by default and proceed.
-	 */
-	if (gpio_range && ops->gpio_disable_free)
-		ops->gpio_disable_free(pctldev, gpio_range, pin);
-	else if (ops->free)
-		ops->free(pctldev, pin);
+		}
 
-	scoped_guard(mutex, &desc->mux_lock) {
 		if (gpio_range) {
 			owner = desc->gpio_owner;
 			desc->gpio_owner = NULL;
@@ -258,6 +248,15 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 		}
 	}
 
+	/*
+	 * If there is no kind of request function for the pin we just assume
+	 * we got it by default and proceed.
+	 */
+	if (gpio_range && ops->gpio_disable_free)
+		ops->gpio_disable_free(pctldev, gpio_range, pin);
+	else if (ops->free)
+		ops->free(pctldev, pin);
+
 	module_put(pctldev->owner);
 
 	return owner;
-- 
2.34.1

