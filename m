Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420E74430
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747802404; cv=none; b=YNwcBVoAgOEK2MOrHIQDvS3xz0JJLfg2JEmHFDRdfLgJSEYRUIxcu3j07MHWNkx6OQw7wnEhMgue7iPWhT5ZhyDeJCc2sbPFRh5xdUY9jqaabILpgWC5HNY0u4LQ9Fs78DEpZeQeX6nzZO3Ki4fVPQHjkf0uyWymToqYx7/6xw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747802404; c=relaxed/simple;
	bh=MXqYVLlIC857YO1MJUKMFQ6APvJH33Iga5WRljoMUTE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SxqWe9Cm3FBlQXS0TAOCWl6VxkKc3OxT8PEw4nT04I5o79aF3wZPGUdXRbm6B6PUz3y9wXLp91BIY17aMdTVWVX8CDZaE+sDS55l7Syeyo69dlmEtWth7axPGtLa9zM73IpGuaeKsxDi+eaZoZI2Pcf601+FN3KigAM+fOrXxAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGrDxxhZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGrDxxhZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGhxf2029021
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1BT+9avoZ07YU8MroIjY3rzBacA3W/8MWgZ
	5I9HIHaY=; b=hGrDxxhZ41U9ZfGAFmB6ZfIH0mK0giqnxPsAUJS/9DkY8NqGIm4
	1Kxyf1ji4dFyTOmgRs31JJY2UiQpmqM5jkz8rNsVl/UoL1qUCiRmdpqGdyrQwt1Q
	mQaYfg1XcELGuKEtYTe06sOGphb50KCZcitZG4UzxU5a1mbJyOwwo4Yt76BZUK2E
	bDVuJZzXhwwfdQNET3vUWVHmPIMrJjFphJc73BJB7lYVe9AcNTBjm2BRkAmD/vs9
	5jLWeCLI68Y5qcg/R33Vy2Nt5n+suZ7dL6JW0KGSRyFw88SUEeVWWpbN9IkFpaDK
	CF5dDha9fF7sDaQgyMWTrMWcZOQi81x2g8g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf01hmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:40:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30e78145dc4so6895980a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747802401; x=1748407201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BT+9avoZ07YU8MroIjY3rzBacA3W/8MWgZ5I9HIHaY=;
        b=YZoeKrx7hxiZrdVFeP7Z47ZBA2CCWgK4bPz1/P1Cb6uIMkUoPknMDUp4cBSYbzf7Ov
         eI+ZVdyb+Yo/4hQnO6NXSP15u1zEo5PfrQPQ9WTi5n8UDakvVia88AQvAFFUMF7xs0YL
         x9EHfc97B0/hkhwyvfwwOwU3nU0LvUjVFE5TUvGkCOdSMMygi2nuqK+Hir4se9Z9ELkN
         SlE1/dmz2/Mf+NiWDxlY6f6vJFM8hd+6LJr0Hdfp/Nr8rKAHGtMwJOOFDwkUAIvUhpxa
         Zz3WgaKWUbVQOYkdDOCPCcOzq/8e3VMgaurcVcQAPRej6zj6kIFhH3NP0l5p4pxnODzW
         /3hw==
X-Forwarded-Encrypted: i=1; AJvYcCV6Ex2hawFur2TrqTWaG93Nw/YuvfeCFd6CjwOVZdfAQSTR+eGgc1lGXv9RXEYki/eOMXz5SUnxvuZPBTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtrU/o7mRjUM4NgTyNfUKkXsIAIuyMux0uZVi9gB0vONZbQ3sG
	V/wKbFVnJ1Nv5pieqhlfqiy2L6Pw4TF0AegR6pW8Q+SABGGFRGGCec/6z4hInXZFR/H9amdG9as
	OQjVMt5MuSjCtqTddjiYKlMK2xj+Z3hpQn7/4iDM1zYf6S1SUs8Lt6iluSsLP9bEzO4A=
X-Gm-Gg: ASbGncvuC9ymQ382dLhB7yZbcHCc75EkupSbgW9HgOv7XWD3yyRqku0iHdTsE4HFho/
	0PusctVkUZX3UGTk9o4mcga7cllIGujgGyCxbpw29h70v2nT7FwPCsALWA3IMvd+8xKAPu9jk7+
	cbNDJPqu+yygbvIdhpJNekEBqL6TtTxCw4sZsOvCjhM1imYDtq53HS3wiM+NN0nP6Vpdn6F3HTZ
	QAVbQ6G7ISlb+i/DTuJnL/TrkTvdk2Kx7NaGi3q1zM9bWhrL0Z8z4g70CehFjjdHTqHQqWcn27V
	YOIYjsPlxKqTqU6Aj52mTJS/92bNWyOUQVRpQcvS
X-Received: by 2002:a17:902:e78c:b0:21f:dbb:20a6 with SMTP id d9443c01a7336-231d459682fmr299636055ad.33.1747802401447;
        Tue, 20 May 2025 21:40:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU4EJptW2RrlBGMP2/5O+s4rbOQfCsE5GvhR+3qiIpmTRK0+nzuEmADXMEIXCPu0RsvWZN5Q==
X-Received: by 2002:a17:902:e78c:b0:21f:dbb:20a6 with SMTP id d9443c01a7336-231d459682fmr299635825ad.33.1747802401017;
        Tue, 20 May 2025 21:40:01 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-232053579d7sm65632025ad.80.2025.05.20.21.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 21:40:00 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH RESEND] usb: gadget: u_serial: Avoid double unlock of serial_port_lock
Date: Wed, 21 May 2025 10:09:51 +0530
Message-Id: <20250521043951.1028481-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zfGuYyUZxi8-yA8IaUNYw7UAmnAJzjoO
X-Proofpoint-ORIG-GUID: zfGuYyUZxi8-yA8IaUNYw7UAmnAJzjoO
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682d5922 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gJab5K-lH3zide7aClcA:9 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA0MyBTYWx0ZWRfX3FsQO+DqsEt5
 hEoYlJYrk/AwvJX4rNhDCzw6K7oEoxVInMm+rAtn8GKxChwH+W7YptnFVmynN5pl+D/a0Sv2RkR
 e//+HhYO7B4o7W7cmhc7ffR1uzcudriFDn/4RThzMTi8mXr34v9jR3u3sMGXTGq/VzZzEQDz4SD
 5HSz6FL6icylBOMj5TJbCQzWVIEc9fJsMqlOPkdNZlxCe8axq0SBXm7iAkEiU/oKvJXquv/cDrE
 pXKJwOH4EfMDr3BdbXokW3wSA/ZpZWBzNtHDccKkpSUHx/usUyxrbAAfWjm1F7KqcI4aeWtlEzn
 hgB2vWUuhPEkQQ3OGZPakEnJgb6E2s+YdMOnNN3jU8MBOg/UjwTQ8VLFKAI88m3pFEMfBgCJDLR
 hQN35Yk97FKwlB410a4ahWCufm8VY+1zavAA7FdzWWKG9PcvUeR0kmnoqaIekT5iQJznfv9X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=891 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210043

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

