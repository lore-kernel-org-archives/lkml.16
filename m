Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5028126B2BE
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528563; cv=none; b=qxLSsrf7XkUeNwyWwaImcRN8YOe3QQkBv6mPDUUx7oIYC78je8gOIflB3Atce3gw/g1fyyXqXGWcfqoGSCiMloJghtlCWJTxa808zfP/OjR2Q3AmX+xv7Ra7pY2KRyYQomw7UtfVGOmGBqZo9hDYG8Jq0Xo71NSOgChtBau7XIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528563; c=relaxed/simple;
	bh=MXqYVLlIC857YO1MJUKMFQ6APvJH33Iga5WRljoMUTE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D93AwDx3Lxg/wJu72SLAzYzmIWjN2H4JXSunUh5KJFlWTTtW0wQ1ZslfcNu1PbKnDeEZdozLOs8m2+4k3W0Td/pbHOVGoPIMRKOOFM1Xe+SFl8OaTfWUH7J5M0KxPMNMwD8C9IhHoJBiwgQhnlxKowJmoNKN7mPR511jyfsAXOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ays7/Tvw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ays7/Tvw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468JV9B007994
	for <linux-kernel@vger.kernel.org>; Tue, 6 May 2025 10:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1BT+9avoZ07YU8MroIjY3rzBacA3W/8MWgZ
	5I9HIHaY=; b=ays7/Tvwvf6CbqmSf1OpMWWqZqQ538BlTyYzmjpK9RU1QL6OTQ6
	+6K0xTk6T76lMedVlGvSGWueK8rBt5Afl2pSocczinlIF2rvMSZi4ocgYFX/aNye
	4reyaTNWfV7yaywQ4Y1ZJIzFjsm3rnIV49qboGpachsoHK+J/WbzReECa5WW8paj
	FE9uhimq2bgZrCDfDzMhExg904cnMfhlfzQaOCnM+TGNH1lNwOdZitf5s2s/rnqg
	eSedKGHQSH/SRwp/FE+++Mjue0gNmrE2m8yejof7jt/xMs/j412gr2UNBIhE/wtD
	CAaTGYJh7iybNJ7TiGpyp65ckfLGri2utmA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep7f5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:49:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b1f8d149911so4955293a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 03:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746528558; x=1747133358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BT+9avoZ07YU8MroIjY3rzBacA3W/8MWgZ5I9HIHaY=;
        b=fYb0CCXpLWPod1v4pw40z5Va4x2bmNhPVbXUyrOWOyNRO6mkDXVJ/Tp3p5Sv2BYXxb
         poAHI5psTuykk6kMyBanp6kkQ9EwEy5ko7x565jAKsuKSFAOCG8cIHzx2COu+wVpCnKw
         wdXCoEecgmqJwACjFI+hHaV1snpEfWw0FlkSEaAcvWTOWo0RYrE4TNWYLkWU2Ja6pbl3
         x7Zlm60PFhQlPP2z6KuvLvAKZN2V1WeFYiWeWHbpoSjdzlVSRmd55yaGUGSZLnJUjxtc
         HPahK0RH/c3lEQacp0kYtz7MQjlXEZ/zZ00TIsIRheXB5Kidpba4VmIO+lpLQCesQpru
         7qQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9phU0b7tq7l+35hPipXFKDYMV5o31ukJJFfU7s4p9F1c5o/EEJ+TaFb+ClcUWeZ8oCqoNRAf3hgKofGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz31wz0RIkKRoV+zXDkHJhRmTz7MEe1LQdmJFPjMy4URci2tGoz
	Xk8aS+m6htQAPgGek/SNADN+H1mpbqh7uyEUNkGJrhaqNavwojI3574ogRpZmWJ/2dxn8JhD5Lo
	U8QzoZVUHcd3j+AT+QUK2c/5VKJbKLwgGM8jWcO02aGiY4y6DdhjbK1L8ILVDgXM=
X-Gm-Gg: ASbGnctT8SZIB6QAk7hImrVsSOctskicMKp7lPqy/FdihUy5oCGu91kpq5JOgqyjyZ8
	PWt22l/oP1UfR1HNgNk+i0srhWBW72oarFgh1R/E26I1l3vaSqdLmXRvsx5pMcBbXdgjbH81e8O
	fNBCWX75zqUne8vpFXeyimqpFZYH4QvlXkeJHB1Kcf7l2WGuFpdmN9dNNRvhPiQEan9a8aMEA3Q
	x2t9kdo09j2Ye92X/DW6UyfiQ3C+2FZDFE1R8W5CZT6NfjADgfRRIgyyd7nrXTUNIVFZ28MxT9B
	gE5TELBsw/NyG9UJrieo3CpRqxCr2Nk5Lj+As23A
X-Received: by 2002:a17:903:22d0:b0:22e:3279:990a with SMTP id d9443c01a7336-22e35fdfebbmr31963345ad.17.1746528558595;
        Tue, 06 May 2025 03:49:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKK6d45h63Gdu4TDOKJt0NRyzixLAgMez8xflvSEFkVTtmtil0jJ03NTWeRlH3BhT/YnRWWA==
X-Received: by 2002:a17:903:22d0:b0:22e:3279:990a with SMTP id d9443c01a7336-22e35fdfebbmr31963135ad.17.1746528558221;
        Tue, 06 May 2025 03:49:18 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e3b99dce9sm10786985ad.6.2025.05.06.03.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:49:17 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] usb: gadget: u_serial: Avoid double unlock of serial_port_lock
Date: Tue,  6 May 2025 16:19:12 +0530
Message-Id: <20250506104912.3750934-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6819e92f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gJab5K-lH3zide7aClcA:9 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HUgaQIscVS57OR_POUGBlZ6GK_JjXbV5
X-Proofpoint-GUID: HUgaQIscVS57OR_POUGBlZ6GK_JjXbV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEwMyBTYWx0ZWRfX8vGPH2rNAIPT
 0+JpIQonx5CWq6qhmJ2/bE1CoMdZtSNozd9zcjAiQfjpO8DjNXzzQ9nDLaIdgb6LYpRdn0xp14u
 9etsOIkvMe3QQRe805Oc2zW+ETiV6JlK9eCtrlBAFHrYlyeMg813NihgJ//QkyC4EylAdW5pVeG
 SNff/zLA2h3knbM2he2qI8W9oOsfHje3LhNPm62lMB5XfUAIru5195jVPbwICBCj74eKe0EoI3S
 knnJLnFWf8VXqXyUHulSrKFvwNzyT5Pw8mhkuYlSJlFwyE2rbQI68ZRrru8chpCG73OqP7n1/1+
 mp803YREOqw+9I8woJsuw6gJBtZqZRy/7A7uXwddr4OR6oDhqmjucEP5/nKa6op2aaQwLxIvD7E
 BKxDKgN9sREr2gEtl4VG5K4IFZG0EeXj8hHsL6lxpc/3+0BfTrZ2FaV0Dv4RZ/T0mGdY7/ma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=881 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060103

Avoid unlocking serial_port_lock twice in gserial_suspend(), this can
occur if gserial_wakeup_host() fails. And since wakeup is performed
outside spinlock, check if the port is valid before proceeding again.

Fixes: 3baea29dc0a7 ("usb: gadget: u_serial: Implement remote wakeup capability")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aBHatifO5bjR1yPt@stanley.mountain/
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/gadget/function/u_serial.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 41dee7c8cc7c..ab544f6824be 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1505,6 +1505,13 @@ void gserial_suspend(struct gserial *gser)
 		spin_unlock_irqrestore(&serial_port_lock, flags);
 		if (!gserial_wakeup_host(gser))
 			return;
+
+		/* Check if port is valid after acquiring lock back */
+		spin_lock_irqsave(&serial_port_lock, flags);
+		if (!port) {
+			spin_unlock_irqrestore(&serial_port_lock, flags);
+			return;
+		}
 	}
 
 	spin_lock(&port->port_lock);
-- 
2.25.1

