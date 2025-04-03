Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF2024DFF6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678506; cv=none; b=Nfm9llznyNs97ZX1+rGlpuRmSZsoArAehzpt1LJ3i0tM68ottrgTRpeSKxeq7dQRJi65R4GH8CSSx1P6QALiZ732yl/+cZ/Yabc5OBQJ0dyPGq0gkGp78mEWidG5W4IM5ijewzUdbgO2+OQsyvormBOkA4uJGihSfYbI7yTAd9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678506; c=relaxed/simple;
	bh=SAhT8oXXBABARfOtRCkhrfAzM6PBXMhEP4kkAlDH7as=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hl5B99Lfz51XvJAFZAqmDPdMwPzu0QaBNsJHyYa3NdLeIawbAS1iCGFV4DOM0i0mBtTu6R+3TO4zIn57jL3mZG/IxB0SnUqyiwZjidgiKlBNY6RP7d0zHo0oNpT9aH1K846gBTSK+zcPJNVb7ViUPmdMaYlecyjWJSfqpi1BH+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqSdt+K1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqSdt+K1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339rvFA012853
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 11:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Pc8x+bOJYD7
	a6Q3kzvOhZuB9UZxdxUbT0wfrdYVtQBU=; b=LqSdt+K1dg4C4CtLTqMPQYPv9mM
	iU+lEF9KhAgn6QGDvYIM/A2AtMkAniQhyki24jSqFjI99xcvAfPafYDe6Qo8zfVL
	0cv1FKJaRbV8O2VVZOJXIXvsPYo7lky2iAqeJhsqdFeXV4vjGfPcRx93/RFFKMe+
	/XbpbP2HSwtQdZO19b0C/awPR2aq1IdVTljiRNQkWNzvvX+fhCHqJocf3IzdhHvC
	jFds2nK7Cj+Lk9un0Xkq2dw3G5yE4rl2dMHwHn3Krs7lqFFlk5w75RaPNk0KY60U
	P8oGp2Hkf6sgvQTA2nDBS/wPPeTZ65VlbpxBH6IR8gPKjH8HlWGGW3A6O6g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45spnp0gaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:08:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30364fc706fso814538a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 04:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743678501; x=1744283301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pc8x+bOJYD7a6Q3kzvOhZuB9UZxdxUbT0wfrdYVtQBU=;
        b=URfScBG+ormxHemrZvYxFn7HT5z0QTwAjNLwCz2BVIDVjB2ZuwrXej4OCrNy280ljH
         /kmYK0UwXz37Qx0qeQW+4wmSgwQ8Mtij4ZwuZxJtnE2gQXMjzffjFN7JlMs8VJB1sWXR
         QCf0CTaFYJrzAXPnEtVjI08Gp/tRzhrtqlDgm9hpzVCU9IWuHylHEfQhof7kgdwvvLdp
         M958CDxlnBRHm0QbQbbt83TshRzXQ6wjSFZR1I9OHOJAQN8KKnWKBAaWMHjTk47CLCIP
         /oJZtXbFv9RfSvXMxR022PcUSrcmAJv8GEKS81fXtm4p5YSZxyqERNlFX68ItBPqhlsZ
         P51w==
X-Forwarded-Encrypted: i=1; AJvYcCXlW9bv0ZUfocP7y2Khk0aCvxpEF6VWl9+J1r1cURTTOen92g8icxXjAywxbGsre/BF+arQSqUrcPftbiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPED2ULixfkhz37mb3V1bPigHt61Yq8mVjet9h+JSJCaU/fL7h
	fNh5wh2qmX3Bf3pJwJ9mX09NJAZj6thDxq0YTU8wVn/C8W6O0Z3fIvclFyB8QwvqYFCgkgMDN2k
	FrcGCUDEIkj8YNkuGXUYPdbRKM0PUtHh7b5yi1wihyB5+Bi4OXalVyXtnZuHWj5g=
X-Gm-Gg: ASbGnct5R5d0+Ev/3oB/WQdvGmQbgOzTPexJfX3VJm/Mbm4YG6EZPywSkYl9HE/t6EI
	A/kyasr3HXZTCv5TH90qJ0qYmQTE6hTQJ/jW048LUn6LDNca3rSxgV0q0eF4RkHPzeZW9phmWos
	yZ388pUOxpbiRpia7tFRPi0Z0+xoRvfUAoCS9ZmUCSskFOp5B27nicJ6/eFjJNHhL8MPvxF54mx
	OkXrAviimwC0+iTpEz1wsqTrkfZ7IzvKfXn07ahj21lq8PNvCvjlcX572SN4Umvq8+22YV+0esY
	+IArBV4eQUBrbtXYSxfv7AcQihOJZXU6i0JbhcKwKBAy
X-Received: by 2002:a17:90b:4d0d:b0:2ee:bc7b:9237 with SMTP id 98e67ed59e1d1-3057de29f94mr2335840a91.27.1743678501412;
        Thu, 03 Apr 2025 04:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYuQzVGsN8qmYnUxRZW+dC/Lr+3CWx+mANZ7m41xHK3NDbhnKMtmEfFMwQF0WIN4EQNZcFoQ==
X-Received: by 2002:a17:90b:4d0d:b0:2ee:bc7b:9237 with SMTP id 98e67ed59e1d1-3057de29f94mr2335803a91.27.1743678500796;
        Thu, 03 Apr 2025 04:08:20 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3c3a8sm1185414a91.28.2025.04.03.04.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:08:20 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@kernel.org
Subject: [PATCH v1 3/3] usb: dwc3: gadget: Make gadget_wakeup asynchronous
Date: Thu,  3 Apr 2025 16:38:05 +0530
Message-Id: <20250403110805.865311-4-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rDIipyG4FLwuFTlx7MEYmd4wJHvJ9ILB
X-Authority-Analysis: v=2.4 cv=N/gpF39B c=1 sm=1 tr=0 ts=67ee6c26 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z2qHnLmh7nH1upWU5EYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: rDIipyG4FLwuFTlx7MEYmd4wJHvJ9ILB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_04,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=990
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030043

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
add a new variable func_wakeup_pending which will indicate the
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
 drivers/usb/dwc3/gadget.c | 60 ++++++++++++++++-----------------------
 2 files changed, 28 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index aaa39e663f60..2cdbbd3236d7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1164,6 +1164,9 @@ struct dwc3_scratchpad_array {
  * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
  *		       DATWRREQINFO, and DESWRREQINFO value passed from
  *		       glue driver.
+ * @func_wakeup_pending: Indicates whether any interface has requested for
+ *			 function wakeup. Also represents the interface_id
+ *			 using bitmap.
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1394,6 +1397,7 @@ struct dwc3 {
 	int			num_ep_resized;
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
+	u32			func_wakeup_pending;
 };
 
 #define INCRX_BURST_MODE 0
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 89a4dc8ebf94..3289e57471f4 100644
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
@@ -2351,10 +2349,8 @@ static int dwc3_gadget_get_frame(struct usb_gadget *g)
 	return __dwc3_gadget_get_frame(dwc);
 }
 
-static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
+static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
 {
-	int			retries;
-
 	int			ret;
 	u32			reg;
 
@@ -2382,8 +2378,7 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
 		return -EINVAL;
 	}
 
-	if (async)
-		dwc3_gadget_enable_linksts_evts(dwc, true);
+	dwc3_gadget_enable_linksts_evts(dwc, true);
 
 	ret = dwc3_gadget_set_link_state(dwc, DWC3_LINK_STATE_RECOV);
 	if (ret < 0) {
@@ -2404,25 +2399,6 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc, bool async)
 	 * Since link status change events are enabled we will receive
 	 * an U0 event when wakeup is successful. So bail out.
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
 
@@ -2443,7 +2419,7 @@ static int dwc3_gadget_wakeup(struct usb_gadget *g)
 		spin_unlock_irqrestore(&dwc->lock, flags);
 		return -EINVAL;
 	}
-	ret = __dwc3_gadget_wakeup(dwc, true);
+	ret = __dwc3_gadget_wakeup(dwc);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
@@ -2471,14 +2447,10 @@ static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
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
+		dwc->func_wakeup_pending |= BIT(intf_id);
+		ret = __dwc3_gadget_wakeup(dwc);
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		return ret;
 	}
 
 	ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
@@ -4300,6 +4272,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 {
 	enum dwc3_link_state	next = evtinfo & DWC3_LINK_STATE_MASK;
 	unsigned int		pwropt;
+	int			ret, intf_id = 0;
 
 	/*
 	 * WORKAROUND: DWC3 < 2.50a have an issue when configured without
@@ -4375,7 +4348,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 
 	switch (next) {
 	case DWC3_LINK_STATE_U0:
-		if (dwc->gadget->wakeup_armed) {
+		if (dwc->gadget->wakeup_armed || dwc->func_wakeup_pending) {
 			dwc3_gadget_enable_linksts_evts(dwc, false);
 			dwc3_resume_gadget(dwc);
 			dwc->suspended = false;
@@ -4398,6 +4371,21 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 	}
 
 	dwc->link_state = next;
+
+	/* Proceed with func wakeup if any interfaces that has requested */
+	while (dwc->func_wakeup_pending && (next == DWC3_LINK_STATE_U0)) {
+		if (dwc->func_wakeup_pending & BIT(0)) {
+			ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
+							       DWC3_DGCMDPAR_DN_FUNC_WAKE |
+							       DWC3_DGCMDPAR_INTF_SEL(intf_id));
+			if (ret)
+				dev_err(dwc->dev, "function remote wakeup failed for %d, ret:%d\n",
+					intf_id, ret);
+		}
+		dwc->func_wakeup_pending >>= 1;
+		intf_id++;
+	}
+
 }
 
 static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
-- 
2.25.1

