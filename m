Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1D4200BBC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317967; cv=none; b=IC/8ttoJZw+pUNBlRm2FI9rAXtXJJvy+xpG/bnpG7OEXqgLktxlw4vJQxx8ckrhCKqsEll30I4mohZN7LwM8lhnY4XPqcrQaPk2KEpCe0pVx70GlU5Bs1cAnFrIsHF3LwrrC2l7B5MgD/lFJVh099x3VWuApDpEZRhv//w4rGxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317967; c=relaxed/simple;
	bh=p27y9NFMXzVvj00e8ZA7+IGcsY4E7svOnJQzifljnL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MZ9D0CGqNkb2fDWJBXKJ+/t9HpeQReeD0gdzSO+RbQsaXnvZc9HR8ysWYziPiqM+0/d7S9P/YV7Cmr1dz+IGYjnzJL4oQtb2P/QUHpVfon1t+ag6bL6fyPaN3Mnn4cfhMdxuLG/Mm5HCKLU6SeK+1ByVigc2JX+fMrwANLbraFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpLwoBUw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpLwoBUw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4P00p011611
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lpT545Y/gOY
	A7sVvZRT5W/scaeQvyDclWBr3nb3bgNI=; b=mpLwoBUwiIBnfHKPY7/AFp8LVW3
	Auu1NKKO9gBXyhDman87Bsvst2mjZbgH92mHmQuIwnaOV9gtF91SMVMfsBg8Pe5Y
	3YTUQW3JP3AmwXl5t4eJC+YS2Qd9yRGbv7BtXUPUHrKzFB0yPiJQVQE8XpBeznlh
	hLzXqP7xzsCsMSNh10uZOBW1aHuHR82R8Uh5CFyb0QnzL4QJ2SPgKX3UD9h8CQzT
	d2Y1YceSY8jP1xIWslfGlohzBz+jmkTgaLjcYZfCVZmR0pRPuy1USE8NBkLDxAt5
	6ainCqdpquAVU7RxLv3+F9Sc5fa+RKiff+JOY/+Zvv7qQ3OTfRI4iAXzNWA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450peyvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:32:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-739525d4d7bso3943677b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317964; x=1745922764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpT545Y/gOYA7sVvZRT5W/scaeQvyDclWBr3nb3bgNI=;
        b=I/SBZFLSuU4VPi/H/xwqh5e1nZlWTrorYB2HJqwhsaTVLitDipWY+WqOPy+GqdWl5w
         D2rzMO9FdsMvDRbtI/LRAqC17SNRlruxZKoXvGhupZe+VVzaZ7FK4UpMoIWybkuwSmNI
         Oz/a2wqZXlvTExqKF4SJ0QSss2CzRo52fOBR1NU7t3s8zF2nEVFoitGpP/Z7m972wbwJ
         TaBdGSB0LZLYbQX9j1SkL+ct0DuA54QGIKTaCrteWJAgvyXlqBSvAbAriGzQePQqmSuh
         tF6AfPIjpRa5FthvGr5ASrd69LPBDip6eEsmuLbmeyquy723NmeiOiQjQcHUXn5iZNyi
         OabA==
X-Forwarded-Encrypted: i=1; AJvYcCXZfpAXqbDOzTdZe81aqf80ujHDtBaUXylg9do6mMJB+kKyAdWnRe8CQ7gwrUaLxYUul3wvBT+BhRNS11o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxzjgasRaL3safhunz3YlJ4CvnrDxdBlpnF2M8YhcqnswMqdNK
	mL61gNuYUhwghTtpqWTTGcSK+4GJNpeQ8HYYHyCPXDZj0bEpciXmesOvrFKzDXNfPyhYx1CnVDy
	2B1wQ/xUvYNUzixpWMLjW0jGYvK5Wu8lBkLEK3lHua4sFXwmrjklDobdxWo6ZXB8=
X-Gm-Gg: ASbGncu8mcGwEgByc4p2o6b1IvXP5+MMsBbIVyZg4VJpzQajCmJmUeOM/kujPniqWnl
	IEFPXiuwxwZ/W+UI33Kueurkd+0AggZ/AFDRK+xJgIy/FD561NsfHw6raUOH66NEgeHsPh8I75n
	NBqq4mvNLvUd7JQ7lnXFkE8brTxLj06wlesgAW2deWgM9UIcHJh/oz1jo5Mrsm0YCLL+8sFLe5S
	hKxsgUnEOMi1s2QOAr1uQsSOMBCE78JKqLggN22TUK8yXwsYyyIO7sofjeUVaOrKw6gPBczVOt2
	DHyybWdDSteaaqmDjJv+BTJRadyStNegH2dEmgd2
X-Received: by 2002:a05:6a00:14c6:b0:736:ab1e:7775 with SMTP id d2e1a72fcca58-73dc118f8e9mr19677461b3a.0.1745317964442;
        Tue, 22 Apr 2025 03:32:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRWf0lx18yKey+Dgn5Q3XgsBWDvoSeOATiYIf/l2yJT5PB6Phu4kV78DU3R7y2nqx1MOLnHQ==
X-Received: by 2002:a05:6a00:14c6:b0:736:ab1e:7775 with SMTP id d2e1a72fcca58-73dc118f8e9mr19677425b3a.0.1745317964048;
        Tue, 22 Apr 2025 03:32:44 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90dc88sm8228059b3a.83.2025.04.22.03.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:32:43 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@kernel.org
Subject: [PATCH v2 2/3] usb: gadget: Use get_status callback to set remote wakeup capability
Date: Tue, 22 Apr 2025 16:02:30 +0530
Message-Id: <20250422103231.1954387-3-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422103231.1954387-1-prashanth.k@oss.qualcomm.com>
References: <20250422103231.1954387-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=6807704d cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fe4CDuQzCUjxA5onUuAA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 2dlhgLZOj73RFf2a0sIV-MCyAtidBchx
X-Proofpoint-ORIG-GUID: 2dlhgLZOj73RFf2a0sIV-MCyAtidBchx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220079

Currently when the host sends GET_STATUS request for an interface,
we use get_status callbacks to set/clear remote wakeup capability
of that interface. And if get_status callback isn't present for
that interface, then we assume its remote wakeup capability based
on bmAttributes.

Now consider a scenario, where we have a USB configuration with
multiple interfaces (say ECM + ADB), here ECM is remote wakeup
capable and as of now ADB isn't. And bmAttributes will indicate
the device as wakeup capable. With the current implementation,
when host sends GET_STATUS request for both interfaces, we will
set FUNC_RW_CAP for both. This results in USB3 CV Chapter 9.15
(Function Remote Wakeup Test) failures as host expects remote
wakeup from both interfaces.

The above scenario is just an example, and the failure can be
observed if we use configuration with any interface except ECM.
Hence avoid configuring remote wakeup capability from composite
driver based on bmAttributes, instead use get_status callbacks
and let the function drivers decide this.

Cc: stable@kernel.org
Fixes: 481c225c4802 ("usb: gadget: Handle function suspend feature selector")
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/gadget/composite.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 869ad99afb48..8dbc132a505e 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2011,15 +2011,13 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 
 		if (f->get_status) {
 			status = f->get_status(f);
+
 			if (status < 0)
 				break;
-		} else {
-			/* Set D0 and D1 bits based on func wakeup capability */
-			if (f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP) {
-				status |= USB_INTRF_STAT_FUNC_RW_CAP;
-				if (f->func_wakeup_armed)
-					status |= USB_INTRF_STAT_FUNC_RW;
-			}
+
+			/* if D5 is not set, then device is not wakeup capable */
+			if (!(f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP))
+				status &= ~(USB_INTRF_STAT_FUNC_RW_CAP | USB_INTRF_STAT_FUNC_RW);
 		}
 
 		put_unaligned_le16(status & 0x0000ffff, req->buf);
-- 
2.25.1

