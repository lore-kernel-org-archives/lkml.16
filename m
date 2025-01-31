Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4A34C74;
	Fri, 31 Jan 2025 01:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738286404; cv=none; b=ugJ1CcWgAQGSAhdWix12E0Q2knuJPt/qAyjU8Oy3jSwHhR+xF4KsxUbW8LnGgf3xO9CWwqZlDRFVtQaa89LIKXsMt1qC6m7NAVT7y9Z6QDSMCY6H55PrRlqhEcFcDxlBkDrE6TP8eW48yXzsYbmwspVFKxeesHyZvTF1YVqWIBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738286404; c=relaxed/simple;
	bh=HrUQd1HvIyBmTrc53EcUGWlmdAB9swyI3R7GvG32+fU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fRmYhyfu/wEGOi9VtBijKdphiogakvTAcjfwHUE8txdx/byFSrLhAipFeZ0W9ZIFNwmIJhf6YvrG6KxNfTIPrv4L5Xpb7vYONghX2DLhlnmlTyRaTyNwu+3KXbs6ccSmtJNzdV2GWoXfoWfgT0WgAqUJMIhLtJyW1OwhmtLnKu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAUM3wK0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAUM3wK0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-216426b0865so25281675ad.0;
        Thu, 30 Jan 2025 17:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738286402; x=1738891202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXGFhshaCZEXrXmQObXGTXD0pggXIhe2HF3AE6TDiAg=;
        b=jAUM3wK0ra9vOTzBM1ergNbgeJJLOE+uViCA6YpoCHrQw4w5iD6rflYhZsyOWT+N0Y
         XJ3/LOiCilGNCkzno7+XrBeJhmxaEd7UbyjTNShFjF8Tk9eDfUzA0qO96BT6RumsDDv4
         yN9xsgMec4CoTV170mWbltBGSx4cZi2zSPKsQONGYqE7HQgxVHQTUIdbf1W5WWftxet9
         u9X8Z2gqQBKuKfc720KnLkZreEdGzIFgAaziBajMGi07pcnZpwY5u4npKML0EAX4SF4O
         otPK01qsA/c2UYzoooRv4Iqd1kADVSXTPryhhxTNQDfflIlwt937T/wayJc5DhXKSD3y
         B6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738286402; x=1738891202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXGFhshaCZEXrXmQObXGTXD0pggXIhe2HF3AE6TDiAg=;
        b=Sow4rz7uLmWzaggk01kBadNivKXlWglhhG5K3B8iNwBSKDnAVzReRZSH3bxe9Eeqa+
         szdc7NsKZoA0atKy8598OQFBa1yWVb8IckDJMoA15RJrnyBeuw1Fiu5cHQmbnN7yqpuG
         w2iWKrRY1QxuSF//lA4ZcaCsTFCuj9+ZrLxRUpBfPTyH/9MBV1HsvRl6fqdOFCv1kOij
         3u/ajMipbnqBn5eJ2uduoCSJJUddVztiGJoggPEqgcq8suSZCzN0qJeQcA/AzedznP89
         Nhkd6hb6MoHR4UxZkANAQukdO6mQIYu2/im/iCLZuD/NVkyuk4zz1cp8kwN5RvtjB6Je
         tpIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7qP0yhyZZT9/8Hnr0Z4sCeYwq9GN5p2HUXG5ig5yHsxn5D/rgLafSpJT81Uc5Vl3QStngaMiGe/RSd5o=@vger.kernel.org, AJvYcCVU4veob64McLrflq4MXRzZWbXvQQlX6r3J1LqNrl6vENhezVukYNIs/BZH/VblGJbfBIKCIk7oYGUt@vger.kernel.org
X-Gm-Message-State: AOJu0YxwcwSmyv5IcHevM0Y/iVM0KKz2izxlKWa4ngiJFbJQ4p/kPFZQ
	4a7qvtsPurj+UoKtZo78tYbp5K6Me3SYrco3caJQw/RqZ9qM8AK8
X-Gm-Gg: ASbGncvERci0x8BOsnO6p6TfH2XYtdWLdWsBu8gq3rFDI0NZtqedNA0T8HxQjOa7yKx
	1OPjJKvOjrP8VvmXwVQefVaXv8ViNZBeawU7aAF6dK3nhuBva5OiJb8SEph3Ll13s0+rdKcr5wD
	MRWsFOPrMbnX5SbYWiG9DIw4Qh9THHc91yMxIlMO/EgDBAZioWT07pBQW3WaX5G0RwE4rZ4HzsA
	N5WoW1yI8XK9ljZK747M1s0BVI/4TzPpofR2TuZDev5b2XnU4Oz5xrHl3U3Gvq3erd/OLsCRSzH
	biMJEf11PoRT3InX
X-Google-Smtp-Source: AGHT+IFRERziNrowyPnYbOUyn7QfEr7jnVm89y+8PWR2l7MIb0iTuDKFrAowUeC+NT9hTYJnwaLP3g==
X-Received: by 2002:a17:903:11c3:b0:215:b1a3:4701 with SMTP id d9443c01a7336-21dd7d64c1emr136948765ad.13.1738286401693;
        Thu, 30 Jan 2025 17:20:01 -0800 (PST)
Received: from ubuntu.. ([175.141.178.229])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796c9sm2004816a12.62.2025.01.30.17.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:20:01 -0800 (PST)
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Subject: [PATCH v3] thunderbolt: Disable Gen 4 Recovery on Asymmetric Transitions
Date: Fri, 31 Jan 2025 01:17:01 +0000
Message-ID: <20250131011820.7099-1-rahimi.mhmmd@gmail.com>
X-Mailer: git-send-email 2.45.2
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
---
 drivers/thunderbolt/tb.c      | 18 ++++++--
 drivers/thunderbolt/tb.h      |  3 ++
 drivers/thunderbolt/tb_regs.h |  1 +
 drivers/thunderbolt/usb4.c    | 77 +++++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index a7c6919fbf97..923d08b26631 100644
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
+		link_recovery_up = (0 < usb4_port_link_recovery_disable(up));
+		link_recovery_down = (0 < usb4_port_link_recovery_disable(down));
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
index e51d01671d8e..96ba27b8fb55 100644
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
+        return -EINVAL;
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
+ *	* %-EINVAL      - Capability not present.
+ *	* %-ENODEV      - Switch unplugged.
+ *	* %-ETIMEDOUT   - Config space access timed out.
+ *	* %0            - Successfully enabled.
+ *	* %1            - Already enabled.
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
+ *	* %-EINVAL      - Capability not present.
+ *	* %-ENODEV      - Switch unplugged.
+ *	* %-ETIMEDOUT   - Config space access timed out.
+ *	* %0            - Already disabled.
+ *	* %1            - Successfully disabled.
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

