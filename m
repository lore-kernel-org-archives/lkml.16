Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A31819;
	Fri, 31 Jan 2025 01:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738287940; cv=none; b=ncpCQZm7gYuOrA7zpHLxOmTkVHEYSfFyl3owAwbFHIkG91hsVxE8ulZycpZd6HcQ2/zcNWjj5X6lV1XNSuFX/jEqL+hmQRnicnXVg5IxBNceJDiKnAdTTnrS7VfKPXdqdPQMSigWArKFVHxsQb5zgdUTtq+EdIMqa+8TnB7dghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738287940; c=relaxed/simple;
	bh=JtAQGOHUv3o0ogksYqN1fbD5H5awn6N5Nubdwmr5qOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MwwPYVizzcTnQ6oSfnSLbnps0JdThNybU7Gz2mCIrBGNr0KwWEPyb7ZBNhcH6LU0+uk0lj9btd0nuPLSPj/MSVcDmNOrm0VXCpVWvf/Bd8KpbfVBPsSBIjDcpI6vN6t+ukqnQHcJYhxpBIQfTpejSoeBpQpyRuywB0cY/1A6fCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcTwO1dF; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcTwO1dF"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso1957732a91.1;
        Thu, 30 Jan 2025 17:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738287938; x=1738892738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/ta6WjINCS6OPf52VwhYAulMXDAqLI73z8WNENTzCY=;
        b=AcTwO1dFuVajpMuwi4eC9J+feC6+6zxJG9GwJrvoVw1WSJVwoO8p4LSVj4jbRe2En2
         L8XJpc21pT6OZ0Z8dHel2YhzrwZqHqMGKIHTLDWsShHAAwPdKiGlt3yg2S02msifKtN0
         uav2BauFIVwlcDw8hVB/ehctCFb1avwdFFi8gQ6rB9jXoLzgi6YCOOArtHXHcYUlUbl+
         elbIQc84XSb9ViBFxTOjQl1Bgmk2jwWtyQ2eMgP2I8evcoajHoZ2OxD68zK8Unhy7Aw1
         S6scuNOjffxyIVdGHDTIWnGEyqhqOhUr7X9pDxKoYQ9SeeM6fpeOmYQCyKQfIKKhaRa0
         K+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287938; x=1738892738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/ta6WjINCS6OPf52VwhYAulMXDAqLI73z8WNENTzCY=;
        b=ch+0Xsfj+oH2orfeBNgRE5/H34IdeyBnIGFiyAbfEIOuGZnlbeWa7txL2qk0wWxlfd
         ERT3+6Wk4+GAPfYSAnLsDQ/lxOmyKeCfF7Ld3yz475Z0uRDS7jyBQP+/QvAOuyEPWQ2J
         d/Qw2kqXKwfCokP9dI97GYRGxVy2hP9SXEFA+rNn4XiypqHkTr5+09LPXGg7/CxoS3xr
         vw73A2gimqU2KoL0wdf2zcJ9TF+b5LNoAPP5cvEn1qt1Wm5W4NHR1XVzuK1GoLhsJLUv
         /GxsVPM951RuQnUiIxOm413Dv1BuydybUibFYqvzxNFfZ38WDUqdfdbVWnxwxpCfOhzU
         Dmqw==
X-Forwarded-Encrypted: i=1; AJvYcCV+2aWAAvkbcIuKtxDTudLvXxy+ie0hsEIfRocD/fESPxqTIgXYqCQWmLLF1ACJMUGRJZ3rN7a3vxLd@vger.kernel.org, AJvYcCVzLY2B5MU806hBlxZjVgcc8EcOoAS1PsKeBYFVYlluRpGYPO59aHjBDj5oMs1lvVbjn+o29thLFRtocUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+bM4YSiGAP3H1vI6DUfGEMDqw7CloFENUGuqJ3dVpvx+m2fJF
	eCRzyyBXxNB4E5qV7FiZWpAEPDwBgR9y3eGGCnoZtvh7IuMB6rDYwWIQWRSI
X-Gm-Gg: ASbGncsL7Xwmdn+sDmbQ0hsVf5RkX4w3mQY9x//+ih6WxZQoEYcYMVS6Cm6fOQDJymQ
	fDHu9uEzzlbB0OuQBZmgZREot9iTPuFIfES7XhjUfHSiB6U09xt6wKsfjzKKzK8t8s9yz7PicUn
	JWqVwTimNMLIY2ve6GEU24jzdrGOpMueqzfLFQ7SeVR6l76MYWO0coENKb4D50hMxaKYHftgm92
	yv/B32XlcLIxFIUQGa61Goli/0odTDRzJvqP92NzD6T3DOqX57t71WaAJ9jpSI/52ha6XS7ulAz
	umdXo99/KYZcrEkj
X-Google-Smtp-Source: AGHT+IFb1+HRfVziyZqEzWWLse9XtiJ+GDIO9kqIQ6V1EaRYMFt7n97BuIIgdyObQXu6Wc/r79rZHg==
X-Received: by 2002:a17:90b:37c3:b0:2f4:47fc:7f18 with SMTP id 98e67ed59e1d1-2f83abd9952mr14446378a91.10.1738287938084;
        Thu, 30 Jan 2025 17:45:38 -0800 (PST)
Received: from ubuntu.. ([175.141.178.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f830a66a23sm4179992a91.1.2025.01.30.17.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:45:37 -0800 (PST)
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Subject: [PATCH v4] thunderbolt: Disable Gen 4 Recovery on Asymmetric Transitions
Date: Fri, 31 Jan 2025 01:41:27 +0000
Message-ID: <20250131014406.28645-4-rahimi.mhmmd@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250131014406.28645-1-rahimi.mhmmd@gmail.com>
References: <20250131014406.28645-1-rahimi.mhmmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Updates the Connection Manager to disable the Gen 4 Link Recovery
flow before transitioning from a Symmetric Link to an Asymmetric
Link, as specified in recent changes to the USB4 v2 specification.

According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
published in September 2024, the rationale for this change is:

  "Since the default value of the Target Asymmetric Link might be
  different than Symmetric Link and Gen 4 Link Recovery flow checks
  this field to make sure it matched the actual Negotiated Link Width,
  we’re removing the condition for a Disconnect in the Gen 4 Link
  Recovery flow when Target Asymmetric Link doesn’t match the actual
  Link width and adding a Connection Manager note to Disable Gen 4 Link
  Recovery flow before doing Asymmetric Transitions."

Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
---
 drivers/thunderbolt/tb.c      | 18 ++++++--
 drivers/thunderbolt/tb.h      |  3 ++
 drivers/thunderbolt/tb_regs.h |  1 +
 drivers/thunderbolt/usb4.c    | 77 +++++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index a7c6919fbf97..a3ccfb398797 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1013,6 +1013,7 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 			     struct tb_port *dst_port, int requested_up,
 			     int requested_down)
 {
+	bool link_recovery_up = false, link_recovery_down = false;
 	bool clx = false, clx_disabled = false, downstream;
 	struct tb_switch *sw;
 	struct tb_port *up;
@@ -1075,15 +1076,19 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 			continue;
 
 		/*
-		 * Disable CL states before doing any transitions. We
-		 * delayed it until now that we know there is a real
-		 * transition taking place.
+		 * Disable CL states and Link Recovery before doing any
+		 * transitions. We delayed it until now that we know
+		 * there is a real transition taking place.
 		 */
 		if (!clx_disabled) {
 			clx = tb_disable_clx(sw);
 			clx_disabled = true;
 		}
 
+		/* Ignore non-critical errors of disabling Link Recovery */
+		link_recovery_up = (usb4_port_link_recovery_disable(up) > 0);
+		link_recovery_down = (usb4_port_link_recovery_disable(down) > 0);
+
 		tb_sw_dbg(up->sw, "configuring asymmetric link\n");
 
 		/*
@@ -1091,6 +1096,13 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 		 * transtion the link into asymmetric now.
 		 */
 		ret = tb_switch_set_link_width(up->sw, width_up);
+
+		/* Re-enable Link Recovery if they were previously enabled */
+		if (link_recovery_up)
+			usb4_port_link_recovery_enable(up);
+		if (link_recovery_down)
+			usb4_port_link_recovery_enable(down);
+
 		if (ret) {
 			tb_sw_warn(up->sw, "failed to set link width\n");
 			break;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index ddbf0cd78377..d37d778082fc 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1332,6 +1332,9 @@ int usb4_port_router_online(struct tb_port *port);
 int usb4_port_enumerate_retimers(struct tb_port *port);
 bool usb4_port_clx_supported(struct tb_port *port);
 
+int usb4_port_link_recovery_enable(struct tb_port *port);
+int usb4_port_link_recovery_disable(struct tb_port *port);
+
 bool usb4_port_asym_supported(struct tb_port *port);
 int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width);
 int usb4_port_asym_start(struct tb_port *port);
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 4e43b47f9f11..085139e1a958 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -398,6 +398,7 @@ struct tb_regs_port_header {
 #define PORT_CS_19_WOD				BIT(17)
 #define PORT_CS_19_WOU4				BIT(18)
 #define PORT_CS_19_START_ASYM			BIT(24)
+#define PORT_CS_19_ELR				BIT(31)
 
 /* Display Port adapter registers */
 #define ADP_DP_CS_0				0x00
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index e51d01671d8e..450e3920f20c 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/ktime.h>
 #include <linux/units.h>
+#include <linux/string_helpers.h>
 
 #include "sb_regs.h"
 #include "tb.h"
@@ -1518,6 +1519,82 @@ bool usb4_port_clx_supported(struct tb_port *port)
 	return !!(val & PORT_CS_18_CPS);
 }
 
+static int __usb4_port_link_recovery_enable(struct tb_port *port, bool enable)
+{
+	bool was_enable;
+	int ret;
+	u32 val;
+
+	if (!port->cap_usb4)
+		return -EINVAL;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_usb4 + PORT_CS_19, 1);
+	if (ret)
+		return ret;
+
+	was_enable = !!(val & PORT_CS_19_ELR);
+
+	if (enable)
+		val |= PORT_CS_19_ELR;
+	else
+		val &= ~PORT_CS_19_ELR;
+
+	ret = tb_port_write(port, &val, TB_CFG_PORT,
+			    port->cap_usb4 + PORT_CS_19, 1);
+	if (ret)
+		return ret;
+
+	tb_port_dbg(port, "link recovery %s\n", str_enabled_disabled(enable));
+	return was_enable ? 1 : 0;
+}
+
+/**
+ * usb4_port_link_recovery_enable() - Enable the Link Recovery
+ * @port: USB4 port
+ *
+ * Enables the Link Recovery for @port.
+ *
+ *	Returns:
+ *	* %-EINVAL		- Capability not present.
+ *	* %-ENODEV		- Switch unplugged.
+ *	* %-ETIMEDOUT		- Config space access timed out.
+ *	* %0			- Successfully enabled.
+ *	* %1			- Already enabled.
+ */
+int usb4_port_link_recovery_enable(struct tb_port *port)
+{
+	int ret = __usb4_port_link_recovery_enable(port, true);
+
+	if (ret < 0)
+		tb_port_warn(port, "failed to enable link recovery\n");
+
+	return ret;
+}
+
+/**
+ * usb4_port_link_recovery_disable() - Disable the Link Recovery
+ * @port: USB4 port
+ *
+ * Disables the Link Recovery for @port.
+ *
+ *	Returns:
+ *	* %-EINVAL		- Capability not present.
+ *	* %-ENODEV		- Switch unplugged.
+ *	* %-ETIMEDOUT		- Config space access timed out.
+ *	* %0			- Already disabled.
+ *	* %1			- Successfully disabled.
+ */
+int usb4_port_link_recovery_disable(struct tb_port *port)
+{
+	int ret = __usb4_port_link_recovery_enable(port, false);
+
+	if (ret < 0)
+		tb_port_warn(port, "failed to disable link recovery\n");
+
+	return ret;
+}
+
 /**
  * usb4_port_asym_supported() - If the port supports asymmetric link
  * @port: USB4 port
-- 
2.45.2

