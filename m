Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B606328CF60
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546862; cv=none; b=a0405dijHeyCS+yzLK+ToOfbpIWtKWiWLYx1dH/WYAg1TshHJfp+CoSZ3E4zq9bzLi3lUzKt+gLt2Gg6OghCBE8QX8grZw1LqIBpQjzY/BlyLpzVeCGydSxJwZsZEsWP8UWstrhi/va71SfpmjjCrUAhFrfvXS2v15WWUJ4GitA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546862; c=relaxed/simple;
	bh=euV+fbYXNTbYMl4eJVb4KK0RriCHNxifXVblrf9rQ20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pj0ZTRCbeNgGmztesYLuQvZd9AJwvyHhoB7KZuKQzcPxEd1CH1R/j5V6Xj0CL3S/Q6C/SF6eUI6+bDx7O2ORwRCbGavsfkAAWKqN7UsI3VwB6vealxDi6xH9SfyOsAjQh2oKzj9QPHXcQKuXZWYLtcRb/G/CvprQv71XgMWF8ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4ZgTby1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4ZgTby1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8fL1g017716
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Nk+S4I0TlH2
	z4qmWoHPeH+Psft3DzglIZdxip0XMeN4=; b=O4ZgTby1v4QYeaY5EhV/Dd34Wk1
	js7nNev59Imtwd6iJxpmJ8o/tRsBPGai++SeTGVR3cRX/s+7ZZY+QL+r+yclVOZM
	4AmS5Te677kWH8TEnpn42kVt8paOMzlGAzDpc5G+4z/5pX/uc2j+vX2irLhsVtub
	NFzf+1E2wbqiQesZyZnQ8eYDaRyuYBKo8lT6791ZBd8t9WYkgIUciXSoxpxccjCq
	4ZqtMur5b/w+Xf6sRjlGRwfFklPo8e5wY21xH97F6JvMQU+tA4oZo9IksN/cT0C0
	55OnPUMgYmvYDaG98bR5fPGYI7uGUnHlDFjwITYSYwG84r11oWy/q8M8PjQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mchjgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:14:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3122368d82bso8127705a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546858; x=1750151658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nk+S4I0TlH2z4qmWoHPeH+Psft3DzglIZdxip0XMeN4=;
        b=hZw+G/xf3v/kDzEQdlMhOASl+XPbuloIsVbMo+NTMGAk/Juf6SOEWFxWqcA6KVc3Xd
         cy7ZBrhje36i605UVT9E1XTAefvmizepWaJkzEP6AHe6Clnj6rL1pyLThhLXPFZxyBZV
         XcjFXji3IveCDweJlgr+SwP6WRlfBL2yoP39bviCEDv4BQwlKnf0S/B/jsvaYJoUjlBN
         ZznsdVwA3cW9li2WUE+ZEKTVOy0hkKA2HcQqTd7ez6r0GQiXl+wQQploXzn83bbpYFyh
         i7crXw1kp/Uiw/hhLK0P8kCieGJLUyS66A9/lensAc4kySb9Q0JUdJAUUgSE7DwGFM5P
         FeRA==
X-Forwarded-Encrypted: i=1; AJvYcCXzTLZKqVupVrqbFQ8kHGZ1wdCgxfEKjrURAJUj5xJtMCcYq5pIfq3Yx/WZnijdgyd3WX4dNUHSv/i3ksg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8yiUzvc/42Ul3u12Lt7lAowglvU0enQZVYX4nbEDMeCyAf/71
	hoAenKk7kNqzrUWgGBOdKG642+BlMm7A738Nbm0Wil5JFd043AZDRefDQGPLaER6ZlT0AHoUG/m
	TFwAGiEAuk4CTTH5f2d5nyCbK9P4aA1r0dTSJyQcrL3uwsCx2ah0VWjMwgIh36VWlnu4=
X-Gm-Gg: ASbGncv5jWUFwo69WVa77gj/rC0MmStXnCMb8AUfe2DOMsiadlWbR8quiEWh002Cmmc
	5zBln2wfBksdXp2m59Yd5U8QOaLYaEJKPr3r1Xvl/y8i4cHdxJCaSvRXVhR21aKV1e5kPhkbbjV
	2mOF1XhQCE05lIJZg3xi3av20YzjxKkjgMf33UL9i8jwzRWwwXLFn9d7qMPgJEhlen8/O8/3JT2
	i6/WmJLCda//HCpCB2Nra2BvqssgbQvNTNZaHFVtmgrlnhe8rkw6L63io/ZBQEHHSJOVGk6nvem
	5yRlKAFgM9AUd3QsIl9/FdLVHHuPnMoSpGBJszSTYgyDwAv979RpVCnjO1Iz
X-Received: by 2002:a17:90b:3b92:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-313472ec763mr22830132a91.13.1749546857950;
        Tue, 10 Jun 2025 02:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELox5dA0ziiallWsp271HuMBN3cbaKKMWH6TLzvTwcc9o/ILNrURvqAD8FhsIAGvrwut4eEw==
X-Received: by 2002:a17:90b:3b92:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-313472ec763mr22830082a91.13.1749546857459;
        Tue, 10 Jun 2025 02:14:17 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fc3e72sm6913550a91.31.2025.06.10.02.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:14:17 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 4/4] usb: dwc3: qcom: Remove extcon functionality from glue
Date: Tue, 10 Jun 2025 14:43:57 +0530
Message-Id: <20250610091357.2983085-5-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6847f76b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=HsaRtseu1FE5unmruSMA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: f6K1FklQACTJ4l8dBUTGoRVu7RluC2Bp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MCBTYWx0ZWRfXwCkaRm1+0bYj
 WbSErJhjs5WzCpqvVJghYwNMu2sO5RgwJ1K5bk0GIcb1h0fjvnzy3dTM7LgijT7hU4c7cO/ntEX
 U8X93fZNhpd90hRuz8SGYCREc/YWNkUWlaReo5/zbEiOO72CUAOyLV0bxzkGNPSywt8190b6vJJ
 zZ+MNObBtvYtYPA2DUghxHlfBmWveL6XVgvAJAkFYA10xF97UY3d/A9P/z0ighZDCneFiVMHRwc
 LC7J8/m/XQcOpA5sGRfzBGTyE/+tD47AtQoeYhUign1srUiKVu0n7szpf0v9vNWOB/WYkVAc7g0
 o9RDtePU+HldbI8WBl27oCOYMI9sym6UZdSBHBvPZINx/zdGUxRvcHbTPnzyAszjzk/94icpeM+
 w9in136niBqowJ6c013I/+9opWrwEulfxKCMj1nmeP0wTgAYR7WYj8AYK30EN7UB6fWJlrY2
X-Proofpoint-GUID: f6K1FklQACTJ4l8dBUTGoRVu7RluC2Bp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100070

Deprecate usage of extcon functionality from the glue driver. Now
that the glue driver is a flattened implementation, all existing
DTs would eventually move to new bindings. While doing so let them
make use of role-switch/ typec frameworks to provide role data
rather than using extcon.

On upstream, summary of targets/platforms using extcon is as follows:

1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
effect on them.

2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
driver which relies on id/vbus gpios to inform role changes. This can be
transitioned to role switch based driver (usb-conn-gpio) while flattening
those platforms to move away from extcon and rely on role
switching.

3. The one target that uses dwc3 controller and extcon and is not based
on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
This platform uses TI chip to provide extcon. If usb on this platform is
being flattneed, then effort should be put in to define a usb-c-connector
device in DT and make use of role switch functionality in TUSB320L driver.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 91 ------------------------------------
 1 file changed, 91 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 17bbd5a06c08..1a73a7797d41 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -79,11 +79,6 @@ struct dwc3_qcom {
 	struct dwc3_qcom_port	ports[DWC3_QCOM_MAX_PORTS];
 	u8			num_ports;
 
-	struct extcon_dev	*edev;
-	struct extcon_dev	*host_edev;
-	struct notifier_block	vbus_nb;
-	struct notifier_block	host_nb;
-
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
@@ -125,11 +120,6 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
 	readl(base + offset);
 }
 
-/*
- * TODO: Validate that the in-core extcon support is functional, and drop
- * extcon handling from the glue. Make in-core extcon invoke
- * dwc3_qcom_vbus_override_enable()
- */
 static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 {
 	if (enable) {
@@ -145,80 +135,6 @@ static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 	}
 }
 
-static int dwc3_qcom_vbus_notifier(struct notifier_block *nb,
-				   unsigned long event, void *ptr)
-{
-	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, vbus_nb);
-
-	/* enable vbus override for device mode */
-	dwc3_qcom_vbus_override_enable(qcom, event);
-	qcom->mode = event ? USB_DR_MODE_PERIPHERAL : USB_DR_MODE_HOST;
-
-	return NOTIFY_DONE;
-}
-
-static int dwc3_qcom_host_notifier(struct notifier_block *nb,
-				   unsigned long event, void *ptr)
-{
-	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, host_nb);
-
-	/* disable vbus override in host mode */
-	dwc3_qcom_vbus_override_enable(qcom, !event);
-	qcom->mode = event ? USB_DR_MODE_HOST : USB_DR_MODE_PERIPHERAL;
-
-	return NOTIFY_DONE;
-}
-
-static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
-{
-	struct device		*dev = qcom->dev;
-	struct extcon_dev	*host_edev;
-	int			ret;
-
-	if (!of_property_present(dev->of_node, "extcon"))
-		return 0;
-
-	qcom->edev = extcon_get_edev_by_phandle(dev, 0);
-	if (IS_ERR(qcom->edev))
-		return dev_err_probe(dev, PTR_ERR(qcom->edev),
-				     "Failed to get extcon\n");
-
-	qcom->vbus_nb.notifier_call = dwc3_qcom_vbus_notifier;
-
-	qcom->host_edev = extcon_get_edev_by_phandle(dev, 1);
-	if (IS_ERR(qcom->host_edev))
-		qcom->host_edev = NULL;
-
-	ret = devm_extcon_register_notifier(dev, qcom->edev, EXTCON_USB,
-					    &qcom->vbus_nb);
-	if (ret < 0) {
-		dev_err(dev, "VBUS notifier register failed\n");
-		return ret;
-	}
-
-	if (qcom->host_edev)
-		host_edev = qcom->host_edev;
-	else
-		host_edev = qcom->edev;
-
-	qcom->host_nb.notifier_call = dwc3_qcom_host_notifier;
-	ret = devm_extcon_register_notifier(dev, host_edev, EXTCON_USB_HOST,
-					    &qcom->host_nb);
-	if (ret < 0) {
-		dev_err(dev, "Host notifier register failed\n");
-		return ret;
-	}
-
-	/* Update initial VBUS override based on extcon state */
-	if (extcon_get_state(qcom->edev, EXTCON_USB) ||
-	    !extcon_get_state(host_edev, EXTCON_USB_HOST))
-		dwc3_qcom_vbus_notifier(&qcom->vbus_nb, true, qcom->edev);
-	else
-		dwc3_qcom_vbus_notifier(&qcom->vbus_nb, false, qcom->edev);
-
-	return 0;
-}
-
 static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom)
 {
 	int ret;
@@ -848,11 +764,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_core;
 
-	/* register extcon to override sw_vbus on Vbus change later */
-	ret = dwc3_qcom_register_extcon(qcom);
-	if (ret)
-		goto interconnect_exit;
-
 	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
 	device_init_wakeup(&pdev->dev, wakeup_source);
 
@@ -860,8 +771,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	return 0;
 
-interconnect_exit:
-	dwc3_qcom_interconnect_exit(qcom);
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 unregister_notify:
-- 
2.34.1

