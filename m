Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68EE213E76
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317971; cv=none; b=qCg+ORGlR30qw2BSTC4oOUQT03ui4fvA8bvris+g4YYrXWLPdXGGvZ7nARY0dKcG+uzMWhUiFubgLS/tfK7piDF6KjkCJZbpcKKbrwgO2aQmKNDh12k4EdJXzZNx5IbzKayWWuqsVHVu8B5hXv1vndedhpyXSZvkwtJwwpSoh5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317971; c=relaxed/simple;
	bh=qbhS7bsOrZKDOkbN12rXpfPUFYm+boS/N917aBAvtfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LHQb0YI96bU0HgeTzJS+RyZKI6iWp7LtSqPqMCSbiorNrl0LU6RDMN2W9GlgQrjrp0sJb2NvPS0hwXYualhZU6VVqiG1ZQMsDgjYLZ0QYZnj6wQ3E7vbsECiV1dj+0E2Z5rrWBMhQRxOnF+WRksjf7uMjggFXuUPWCDYHSeOkhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BqbvQItV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqbvQItV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4ObxY025943
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7QuJSuAaz6B
	LADYfrH5eY44lI3tsRy/GKAQrW+Z71q8=; b=BqbvQItV6KxsjuswZuO0srA93mb
	wONDHiFoVIa6DHo266Oma2jZPrPtyy9IPFim3nGg/Ak0U8BWuNqSXNYrMur95P4x
	RjOAjgWvnnhY39VyBoHcLFSOXg7ML3P3L8mvIP77GZJD3UaEeIhH42vIyt0P1N1N
	Yaoa3AFoIQmBxXMYjxAixjfJNCUd8cELa8bPm83xG8DWZy/HI80UbjRHoLycMOob
	XbTuVgCL4uuFabsnhpsLjAVfhirsDoyhTQ4S4AeSMpUp5T6EMlZbAye3byP5rVfx
	mlWhasPtUp/12r4XI59wX7YkjUpnOhe+ixNp5j4sVABlhU+BHS4vjjZ8aZA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4644kjey69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:32:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-739515de999so4442997b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317968; x=1745922768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QuJSuAaz6BLADYfrH5eY44lI3tsRy/GKAQrW+Z71q8=;
        b=D5390ZvrAWFmmfA1RozEeeo64hpcT0Vf7rS3VRwPB/MltupuYMEPlrmHu440Gx/L0Y
         RxFSfhlHbHgzaD6nAfD3jmBHmKdmyKqdB+gTAcO+VUFxtpHsKlb4ZqE5/MLwlvzjxfID
         0ci5ewO7fE6Ep6b0MD5jNNQPhEsFWUqkOT8QA5PBRY5ls/n7S6FaMGAXqemLpjSu0KlZ
         8XskE+u9HlT4czFTi/3ub4AD+rcfUu9/2MR95FzasSTnRe5l28z1IM8hgeGCjsBPHQeq
         DAR2KOsUuIx6n4wMB73fYeTkCiiod/vCPLBKdxRx/Qrs1XlvwdRGSNhErjX4xM8hj+/Q
         qS0w==
X-Forwarded-Encrypted: i=1; AJvYcCVp5RlHMM+qF9cOgScZZGuz9pTdtfU0cY48hb3nYlTT0Xksg24tD5twyoqg2G4MGG4y8OKy5xr43q11Sek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2UKSRPXiHgowY4DdkA1YLXOE2h5Uv4zeLYlo1KGJb5kBU7F6N
	BEuaWjkZqIei/9A1Ldb/eK1+z+mSF/9bqSsXKiza5uclxCP10IkfL25aJYhWnjdVjr2txNwvmMa
	HH291LDJFR2e0Q7mRjhZpJD+w+jSbTKyHz5Fd7hBmRABMvGwtQwztBGEdpK3rew4=
X-Gm-Gg: ASbGncuzXRWOCijpeEGXW5gZzOpLo5MrGViRbII4uf6NnrHQDQBzM4wxbyMN+EMwuH3
	wrIuAQKMUJhsaTF4P8dBO27Rt9l2E5clkZ+xFQ5JTdBrwbe8/XbTwdXlhX6+ywyW9RAcvVID5s5
	JhaE41ydAFkNa5CSAB5bPCJ5tcejD5isVaClAE66HxePOo9/3TSn+WJJDzlPKdFhmQQudWYIKWB
	gVkgOgcVav4aL54QSz4PfxGtYzSGc1fzbF+IPpKWWVWn3K+kEC+x7jLP5dGROnHjf2K26i6HKYe
	LuwAc/x3C6IiDovyTCXAOhVVEb0geUocqXI7WbY4
X-Received: by 2002:a05:6a00:3cc2:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-73dc14a3296mr17035196b3a.7.1745317967645;
        Tue, 22 Apr 2025 03:32:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbq89ZKlhNrIC1F5xSOztoAMur+x71lgU4GC2F9m/6YrZPS7Y2uwXjRLzHWpnKEftkLD7DvA==
X-Received: by 2002:a05:6a00:3cc2:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-73dc14a3296mr17035150b3a.7.1745317967146;
        Tue, 22 Apr 2025 03:32:47 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90dc88sm8228059b3a.83.2025.04.22.03.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:32:46 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@kernel.org
Subject: [PATCH v2 3/3] usb: dwc3: gadget: Make gadget_wakeup asynchronous
Date: Tue, 22 Apr 2025 16:02:31 +0530
Message-Id: <20250422103231.1954387-4-prashanth.k@oss.qualcomm.com>
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
X-Proofpoint-GUID: GnzETeePSa0maDnSYDfBMmsTRM_-J15o
X-Authority-Analysis: v=2.4 cv=f5pIBPyM c=1 sm=1 tr=0 ts=68077050 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j9-q7YbHbCxKn5U3djcA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: GnzETeePSa0maDnSYDfBMmsTRM_-J15o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=917 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220079

Currently gadget_wakeup() waits for U0 synchronously if it was
called from func_wakeup(), this is because we need to send the
function wakeup command soon after the link is active. And the
call is made synchronous by polling DSTS continuosly for 20000
times in __dwc3_gadget_wakeup(). But it observed that sometimes
the link is not active even after polling 20K times, leading to
remote wakeup failures. Adding a small delay between each poll
helps, but that won't guarantee resolution in future. Hence make
the gadget_wakeup completely asynchronous.

Since multiple interfaces can issue a function wakeup at once,
add a new variable wakeup_pending_funcs which will indicate the
functions that has issued func_wakup, this is represented in a
bitmap format. If the link is in U3, dwc3_gadget_func_wakeup()
will set the bit corresponding to interface_id and bail out.
Once link comes back to U0, linksts_change irq is triggered,
where the function wakeup command is sent based on bitmap.

Cc: stable@kernel.org
Fixes: 92c08a84b53e ("usb: dwc3: Add function suspend and function wakeup support")
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.h   |  4 +++
 drivers/usb/dwc3/gadget.c | 60 +++++++++++++++------------------------
 2 files changed, 27 insertions(+), 37 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index aaa39e663f60..27eae4cf223d 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1164,6 +1164,9 @@ struct dwc3_scratchpad_array {
  * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
  *		       DATWRREQINFO, and DESWRREQINFO value passed from
  *		       glue driver.
+ * @wakeup_pending_funcs: Indicates whether any interface has requested for
+ *			 function wakeup in bitmap format where bit position
+ *			 represents interface_id.
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1394,6 +1397,7 @@ struct dwc3 {
 	int			num_ep_resized;
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
+	u32			wakeup_pending_funcs;
 };
 
 #define INCRX_BURST_MODE 0
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 47e73c4ed62d..69ec9cf57663 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -276,8 +276,6 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
 	return ret;
 }
 
-static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async);
-
 /**
  * dwc3_send_gadget_ep_cmd - issue an endpoint command
  * @dep: the endpoint to which the command is going to be issued
@@ -2359,10 +2357,8 @@ static int dwc3_gadget_get_frame(struct usb_gadget *g)
 	return __dwc3_gadget_get_frame(dwc);
 }
 
-static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
+static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
 {
-	int			retries;
-
 	int			ret;
 	u32			reg;
 
@@ -2390,8 +2386,7 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
 		return -EINVAL;
 	}
 
-	if (async)
-		dwc3_gadget_enable_linksts_evts(dwc, true);
+	dwc3_gadget_enable_linksts_evts(dwc, true);
 
 	ret = dwc3_gadget_set_link_state(dwc, DWC3_LINK_STATE_RECOV);
 	if (ret < 0) {
@@ -2410,27 +2405,8 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
 
 	/*
 	 * Since link status change events are enabled we will receive
-	 * an U0 event when wakeup is successful. So bail out.
+	 * an U0 event when wakeup is successful.
 	 */
-	if (async)
-		return 0;
-
-	/* poll until Link State changes to ON */
-	retries = 20000;
-
-	while (retries--) {
-		reg = dwc3_readl(dwc->regs, DWC3_DSTS);
-
-		/* in HS, means ON */
-		if (DWC3_DSTS_USBLNKST(reg) == DWC3_LINK_STATE_U0)
-			break;
-	}
-
-	if (DWC3_DSTS_USBLNKST(reg) != DWC3_LINK_STATE_U0) {
-		dev_err(dwc->dev, "failed to send remote wakeup\n");
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
@@ -2451,7 +2427,7 @@ static int dwc3_gadget_wakeup(struct usb_gadget *g)
 		spin_unlock_irqrestore(&dwc->lock, flags);
 		return -EINVAL;
 	}
-	ret = __dwc3_gadget_wakeup(dwc, true);
+	ret = __dwc3_gadget_wakeup(dwc);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
@@ -2479,14 +2455,10 @@ static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
 	 */
 	link_state = dwc3_gadget_get_link_state(dwc);
 	if (link_state == DWC3_LINK_STATE_U3) {
-		ret = __dwc3_gadget_wakeup(dwc, false);
-		if (ret) {
-			spin_unlock_irqrestore(&dwc->lock, flags);
-			return -EINVAL;
-		}
-		dwc3_resume_gadget(dwc);
-		dwc->suspended = false;
-		dwc->link_state = DWC3_LINK_STATE_U0;
+		dwc->wakeup_pending_funcs |= BIT(intf_id);
+		ret = __dwc3_gadget_wakeup(dwc);
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		return ret;
 	}
 
 	ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
@@ -4353,6 +4325,8 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 {
 	enum dwc3_link_state	next = evtinfo & DWC3_LINK_STATE_MASK;
 	unsigned int		pwropt;
+	int			ret;
+	int			intf_id;
 
 	/*
 	 * WORKAROUND: DWC3 < 2.50a have an issue when configured without
@@ -4428,7 +4402,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 
 	switch (next) {
 	case DWC3_LINK_STATE_U0:
-		if (dwc->gadget->wakeup_armed) {
+		if (dwc->gadget->wakeup_armed || dwc->wakeup_pending_funcs) {
 			dwc3_gadget_enable_linksts_evts(dwc, false);
 			dwc3_resume_gadget(dwc);
 			dwc->suspended = false;
@@ -4451,6 +4425,18 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 	}
 
 	dwc->link_state = next;
+
+	/* Proceed with func wakeup if any interfaces that has requested */
+	while (dwc->wakeup_pending_funcs && (next == DWC3_LINK_STATE_U0)) {
+		intf_id = ffs(dwc->wakeup_pending_funcs) - 1;
+		ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
+						       DWC3_DGCMDPAR_DN_FUNC_WAKE |
+						       DWC3_DGCMDPAR_INTF_SEL(intf_id));
+		if (ret)
+			dev_err(dwc->dev, "Failed to send DN wake for intf %d\n", intf_id);
+
+		dwc->wakeup_pending_funcs &= ~BIT(intf_id);
+	}
 }
 
 static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
-- 
2.25.1

