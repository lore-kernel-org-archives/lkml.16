Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2779D22B8D2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496713; cv=none; b=D7PG2fo3o8NPjDMSlvF7CzmjF9GFBNyvyESa2xpVYesxP9PPLMiAFF1EWf/Ak2Jz82ZOZUK5jwA0ad++tY6oeL9juJm3lUZVYhKPW4f7cIDznQmXfPwYlHZmLS+fqI0++9wkVVmTvW75Z6hyTYLifTcamcdvDNkbugq/jgQVHVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496713; c=relaxed/simple;
	bh=K/aNIRvzEVig/olSE8zUcxcdUeVADyIxUVY144kzk7M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ARKBb8u7IfAHgjhlEJOJLYdVXjLIoMYJgEAkGL6HoQe9OY1NUKCVEo5N9y1ddxtEKgLEo+yCGYf2ffXtj7oHAJl5YuWPVoZ8pBA8MlodqTZsBoBy4p3aCazrUbVMPLOoQbikX/TpjCTMG3JI5Ztun8AxeYO2nZPj8Al+KXMAifo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcsva0cc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcsva0cc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3B0N006841
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ysPHr0oxErNRxpL2VqwsL629gPUNXWu017Q
	QhNrJas4=; b=lcsva0ccwmsI2kGh00uo1KpvRIxUV7pjP2/h0CqO375BO9MOW6A
	iK/8uGaDZRKpr+xgN89e6xJBafev+fECm9h7CY5bak7qtvYS/Qo09YjKoA4Dua9q
	lRNUiD7jFbKmm0VIreoDkBnB4UfbV7Q3NwQ6Ubq2TdZcNe/rvvNtWpi1w6IaYIAn
	w1CIU/AL7uOCeCM0jpcFK+SO0ZLq6IMDhs4oDahnjdPOH+iiR6onzkSELtl8pJ9Y
	FfcLg9bMlybUOdVLQlgofJefYZbslBov+EGlo7SX0maPr1w47jcjsWu4lpsn5dLf
	MKP2Dlf2ZfhbeMOFZdgKPzGXbbwxuEIFvAQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5dgu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:11:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73c09e99069so956874b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496709; x=1746101509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysPHr0oxErNRxpL2VqwsL629gPUNXWu017QQhNrJas4=;
        b=Q4aRIBJXVKxXeug46rXiVWUtHAdi9CUFIXSmdVYavDJJIDjoxO6ovf2ek38F4WMY2M
         cs1Z1C1tepn8x5YjraPuhwP7QhTaolRJvhUB0oyX/3a9WAI/pDF87ZIt1KmNNKwRM6V1
         QlyeZdRTJkZyUQEn4Lf1v3pxFzpFtuhU0HeAU0p0iwTyPJql9mCCW4RJ85JOTFVk5DcB
         6qiGo5pGECBhsUKacb8BHw+rp76NHyVjPEULER4Ev9wauWVPvSwbkv4vAM4Wlw495vhr
         9vs76dsyTiHXTErfAXvxluCHE9nfyacpXqd7Nk5rmm926xx59RWXbS/fUc4TMmbLt32f
         KUDw==
X-Forwarded-Encrypted: i=1; AJvYcCW9ua0NHTHGos5yNbSMqwJyCutAAGUSBEVdcJi0sGHTqtE44KQ/Tx8PSQ7jd0vFLyjLi1D4IIrDACMFKS4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5AMqG+5Pc8LFtXT59Brtm6GBrrm9NUmMlKd8hTRporBGfgi5/
	jQM8y8MQTcDOnh+GARtOnwY0lRU91Ouqzd6PzdtH/QfnhhvNwMF3YWV4WszzBnDIqc7mNNAOxdH
	39Uj0nwqO+N5CU3V5LYlTP9c84eWIf4iIP+kSsTCk5e/pr2g7BiEgdQQ+RmrEUXY=
X-Gm-Gg: ASbGncsHEM0+NZ0tfG1BKJ4vvDdeBHpwq3qEQKjYHIhC6d9R6mrYwKvtG+7ejqbogKc
	wuJtzru+OcNawy04U6y93UKMVop2DjMNbDSIPgv+EkOKctE7DcgMnB3BolXwy2/Nnrs+5+QK/wZ
	Lv1Uypnn51/AcWlfLTUWu/yYh9tUdnsx+TdllCyUModI2h+F1hrjBjJ2Moq8mNOgcXGLS78wyLy
	JZAPxPiNnc0d7lq/hJHIEiamSU5MEqQZ3a9ZyUo2/Xq0isGigKCwOd9grW/N6C4TKr8C0gOHW8P
	znbYB2hdTFRlquFLG9KiTfbGoHxzQQQuQcqnJsrc
X-Received: by 2002:a05:6a20:431e:b0:1f3:486c:8509 with SMTP id adf61e73a8af0-20444f0e2c8mr3750350637.25.1745496709345;
        Thu, 24 Apr 2025 05:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0Jc5QAJOW0a8314p+AABfN5ecVt6FL9OxrqvMvwq7E3oY3+jyOyXnww3hGQO3KFo9b80TSA==
X-Received: by 2002:a05:6a20:431e:b0:1f3:486c:8509 with SMTP id adf61e73a8af0-20444f0e2c8mr3750321637.25.1745496709009;
        Thu, 24 Apr 2025 05:11:49 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912c5asm1226788b3a.6.2025.04.24.05.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:11:48 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Michael Walle <mwalle@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] usb: gadget: u_serial: Implement remote wakeup capability
Date: Thu, 24 Apr 2025 17:41:42 +0530
Message-Id: <20250424121142.4180241-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MiBTYWx0ZWRfX1h08EHECt1If wgCrUzSyLS2hFYFEq9R7HP0OQaqyTFxngU97Dnpgixmffeb8RYNfmHtiHDQhG/EvhIPpNLClblN IGckr/K0y8Rc3ISnmDnay94gKaQNrCKMToGFBrraIgyAX/lT+z7JIydFZV5f7T3rtteVWi0STTz
 zLoFUI2I7QIzsmV7A4ncFKsSGGWTd5L1+SqJnIUnaKUgEa7nD1Oan9Mb5rNkNSfCt3WCPM7Z6H4 t5qowOm+6/CpGfKCkUwXZbTuZS2M8oUjcge3cy8qd2qLBb2eBK/KuANJr/qT0v87TNl7a+RNrSU MraFnQOttwUWet6S5Hc8axva1g6bTmGfFQCSNRwPpUZ+qzNfPcffQ8RVrcy1UVSt0Q6QoPfGg1P
 JfbkHbvOGh8G5crYJgldf6OtlDxFJ+OVbghXPmrmC8YBcLDJbFu7nnWBUi/TXvaI2x9Qj37C
X-Proofpoint-GUID: AoHBjZV9PoHRrTyIgGIpr6ATe6U4IQ9-
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a2a86 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=9gX2OuH4G143YozJX2wA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: AoHBjZV9PoHRrTyIgGIpr6ATe6U4IQ9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240082

Implement the remote wakeup capability for u_serial. The newly added
function gserial_wakeup_host() wakes up the host when there is some
data to be sent while the device is suspended. Add gser_get_status()
callbacks to advertise f_serial interface as function wakeup capable.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/gadget/function/f_serial.c |  7 +++++
 drivers/usb/gadget/function/u_serial.c | 43 ++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/usb/gadget/function/f_serial.c b/drivers/usb/gadget/function/f_serial.c
index 8f7e7a2b2ff2..0f266bc067f5 100644
--- a/drivers/usb/gadget/function/f_serial.c
+++ b/drivers/usb/gadget/function/f_serial.c
@@ -364,6 +364,12 @@ static void gser_suspend(struct usb_function *f)
 	gserial_suspend(&gser->port);
 }
 
+static int gser_get_status(struct usb_function *f)
+{
+	return (f->func_wakeup_armed ? USB_INTRF_STAT_FUNC_RW : 0) |
+		USB_INTRF_STAT_FUNC_RW_CAP;
+}
+
 static struct usb_function *gser_alloc(struct usb_function_instance *fi)
 {
 	struct f_gser	*gser;
@@ -387,6 +393,7 @@ static struct usb_function *gser_alloc(struct usb_function_instance *fi)
 	gser->port.func.free_func = gser_free;
 	gser->port.func.resume = gser_resume;
 	gser->port.func.suspend = gser_suspend;
+	gser->port.func.get_status = gser_get_status;
 
 	return &gser->port.func;
 }
diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 36fff45e8c9b..41dee7c8cc7c 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -592,6 +592,17 @@ static int gs_start_io(struct gs_port *port)
 	return status;
 }
 
+static int gserial_wakeup_host(struct gserial *gser)
+{
+	struct usb_function	*func = &gser->func;
+	struct usb_gadget	*gadget = func->config->cdev->gadget;
+
+	if (func->func_suspended)
+		return usb_func_wakeup(func);
+	else
+		return usb_gadget_wakeup(gadget);
+}
+
 /*-------------------------------------------------------------------------*/
 
 /* TTY Driver */
@@ -746,6 +757,8 @@ static ssize_t gs_write(struct tty_struct *tty, const u8 *buf, size_t count)
 {
 	struct gs_port	*port = tty->driver_data;
 	unsigned long	flags;
+	int ret = 0;
+	struct gserial  *gser = port->port_usb;
 
 	pr_vdebug("gs_write: ttyGS%d (%p) writing %zu bytes\n",
 			port->port_num, tty, count);
@@ -753,6 +766,17 @@ static ssize_t gs_write(struct tty_struct *tty, const u8 *buf, size_t count)
 	spin_lock_irqsave(&port->port_lock, flags);
 	if (count)
 		count = kfifo_in(&port->port_write_buf, buf, count);
+
+	if (port->suspended) {
+		spin_unlock_irqrestore(&port->port_lock, flags);
+		ret = gserial_wakeup_host(gser);
+		if (ret) {
+			pr_debug("ttyGS%d: Remote wakeup failed:%d\n", port->port_num, ret);
+			return count;
+		}
+		spin_lock_irqsave(&port->port_lock, flags);
+	}
+
 	/* treat count == 0 as flush_chars() */
 	if (port->port_usb)
 		gs_start_tx(port);
@@ -781,10 +805,22 @@ static void gs_flush_chars(struct tty_struct *tty)
 {
 	struct gs_port	*port = tty->driver_data;
 	unsigned long	flags;
+	int ret = 0;
+	struct gserial  *gser = port->port_usb;
 
 	pr_vdebug("gs_flush_chars: (%d,%p)\n", port->port_num, tty);
 
 	spin_lock_irqsave(&port->port_lock, flags);
+	if (port->suspended) {
+		spin_unlock_irqrestore(&port->port_lock, flags);
+		ret = gserial_wakeup_host(gser);
+		if (ret) {
+			pr_debug("ttyGS%d: Remote wakeup failed:%d\n", port->port_num, ret);
+			return;
+		}
+		spin_lock_irqsave(&port->port_lock, flags);
+	}
+
 	if (port->port_usb)
 		gs_start_tx(port);
 	spin_unlock_irqrestore(&port->port_lock, flags);
@@ -1464,6 +1500,13 @@ void gserial_suspend(struct gserial *gser)
 		return;
 	}
 
+	if (port->write_busy || port->write_started) {
+		/* Wakeup to host if there are ongoing transfers */
+		spin_unlock_irqrestore(&serial_port_lock, flags);
+		if (!gserial_wakeup_host(gser))
+			return;
+	}
+
 	spin_lock(&port->port_lock);
 	spin_unlock(&serial_port_lock);
 	port->suspended = true;
-- 
2.25.1

