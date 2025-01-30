Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DF119C561;
	Thu, 30 Jan 2025 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738231141; cv=none; b=X40aT3cCARc1NrxBQ/rrc1WywST386JylYaCzyQdIVOdrChj+Ta+4PizavEJVy++P9VyE2e2ul4wvoU1cLal0qmsx/syc0hKpsRQo2G/ZH79FnLM0kJHqfPSQ1OrwnyJQw+Sqf/KwL4wKdTwnoZp+YcNOYehb0tAu+HGXtOVDmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738231141; c=relaxed/simple;
	bh=WJ5CPo2cL6txpBAqM10YCNfNMWyNtls9jEKPFLVyd+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ht2kWxEke6HmlDd01ImtmRb7MpkC2L31c7PZdDrdqz1IPvMBrvgoUqn4jU40ArN4Un1CFJDBaDMvRGVArTYx0n4NDlCCsbx9izZnIaAbIUe27JUBb/KEonTaHx2FSgGUnV5CxJ61ETU0EOd2G0jEIsVX3h6NErFZSQ77uOr+e20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKPQIAGx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKPQIAGx"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-216401de828so8935695ad.3;
        Thu, 30 Jan 2025 01:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738231139; x=1738835939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5G4otVTYC+tig0BY8ynh8SXx+gzdwmf+0n3cW3Fp4Mc=;
        b=EKPQIAGxnwTBS6T/p2JQxQNZLwWdfDjIlKA5lnocofPX5Dw3RltriZU5tCUSU9DQbk
         OjdtzAzWzPaVTyQNcyJc8alLFHSkXxnP8qDYaC1Y7ymnqsin8uToG8ZGMAyRZ/DEA3u+
         BwEDc4KC/eif4gfQoIisGlB4saUBg3gWlQGloxPCNFLIXeeX5ya6SYGAOJb4JhYDK2H2
         3JzwgXbSQpdtVsAbJYXuZ9H720EvwH+tUJE3FVqCfpTfH7UNdBhNU5bjclZVlJeIdsFq
         tVO+4T3ccKIljCJKyO1OHgPMbIJfKtFy+EJhANh9Jg+YmErZyn6quUghPNCZNh5R0ydE
         gftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738231139; x=1738835939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5G4otVTYC+tig0BY8ynh8SXx+gzdwmf+0n3cW3Fp4Mc=;
        b=snq++WGSRIqhBtoRrFunfZuYjA5sOzHH5RT2YK/CiYY4SaGcDjwMKo5eQ7TrVNw8hJ
         3Fskn/jA1oua6tvVPaLm24a+tocr1PZNf0vK4B4FFOia33UMg8+thAa1U1K0tFjjHKZp
         wyZhulUDv8R9M0bFMAhpsEUkuNOxino6ngI2dVZfuNpwuPv4BiMgqwldoNiKr1nwPvlB
         hI1sBWdkOKmpryWKtjm2BtUnLz5EODv5jwFdhnFTo+uHR5uWJaCAHGBTpcQfJAhBbnp8
         Kw1rrlr8fmEUy1UHiobpZtwXpO30WwVfOndpdJSaK426mDQGGFCg6BuxydFM0392J1Nw
         FOIA==
X-Forwarded-Encrypted: i=1; AJvYcCUz3+SD9mUHEHKQEyzN+fQQa9mve0CXh15e2GZmoffA68368KFk9bMid/dioAASll0jM8CCZyIrdxAc@vger.kernel.org, AJvYcCW7rQ3VYnXVeLLUAX3slT80SBpisLVMpmjQsRjofvLwsF37XG62cv2firK6PgXp6BWaHAt1KOF92TnUDwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjiXeNVwSco3+mUu2YVbTZ3ZMc1zxCJq53ymBGgUjhouRIKw7E
	VIox3VTikjCq+lr9dx2gregMVjfmVQoc3KgkgyHm4vvdwOyM1f5o
X-Gm-Gg: ASbGnctJrLHSIsCUAgskne6GtpUaw/kVqfJ2pTd/KrPHanv/S02aB6D81Btbf7/k+Gq
	Ovq+OnZtUBL0MTwdriPn9frMuYgFrc/H5ATTgZm9t3/3lhUUnnxLApKQbbpGIWt3TnbUpgvWt36
	CgTuMrFahpi099OTHqsQzDdnTERB9q2KemScd0Jhy1w0mjToDwvn+qPDdK89O4okWnBR5gItCgJ
	+q9Tb44lvI1nEYRHWk6IYgs+BmWksGJo1sK73Y1HS3lY/CZU9t2Bk/IprmSkD/ex/2fgw4OfTS1
	UmW9tJKYEZ7dxLDI
X-Google-Smtp-Source: AGHT+IHoIUDTjjorHNG489vANXesx0FdgqbGTBXMSlyCs6GX5oc2Mcf0DJbhyZRVVvAbBlCfmNBoLA==
X-Received: by 2002:a17:903:298d:b0:216:3436:b87e with SMTP id d9443c01a7336-21dd7dff854mr121469835ad.44.1738231139177;
        Thu, 30 Jan 2025 01:58:59 -0800 (PST)
Received: from ubuntu.. ([175.141.178.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3303a8fsm10275105ad.197.2025.01.30.01.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 01:58:58 -0800 (PST)
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Subject: [PATCH v2] thunderbolt: Disable Gen 4 Recovery on Asymmetric Transitions
Date: Thu, 30 Jan 2025 09:51:09 +0000
Message-ID: <20250130095704.10779-4-rahimi.mhmmd@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250130095704.10779-1-rahimi.mhmmd@gmail.com>
References: <20250130095704.10779-1-rahimi.mhmmd@gmail.com>
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
 drivers/thunderbolt/tb.c      | 28 +++++++++++++++++--
 drivers/thunderbolt/tb.h      |  3 ++
 drivers/thunderbolt/tb_regs.h |  1 +
 drivers/thunderbolt/usb4.c    | 52 +++++++++++++++++++++++++++++++++++
 4 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index a7c6919fbf97..31a8269a5156 100644
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
@@ -1075,15 +1076,29 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 			continue;
 
 		/*
-		 * Disable CL states before doing any transitions. We
-		 * delayed it until now that we know there is a real
-		 * transition taking place.
+		 * Disable CL states and Link Recovery flow before doing any
+		 * transitions. We delayed it until now that we know there is
+		 * a real transition taking place.
 		 */
 		if (!clx_disabled) {
 			clx = tb_disable_clx(sw);
 			clx_disabled = true;
 		}
 
+		ret = usb4_port_link_recovery_disable(up);
+		if (ret < 0) {
+			tb_port_warn(up, "failed to disable the link recovery\n");
+			break;
+		}
+		link_recovery_up = ret > 0;
+
+		ret = usb4_port_link_recovery_disable(down);
+		if (ret < 0) {
+			tb_port_warn(down, "failed to disable the link recovery\n");
+			break;
+		}
+		link_recovery_down = ret > 0;
+
 		tb_sw_dbg(up->sw, "configuring asymmetric link\n");
 
 		/*
@@ -1091,6 +1106,13 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 		 * transtion the link into asymmetric now.
 		 */
 		ret = tb_switch_set_link_width(up->sw, width_up);
+
+		/* Re-enable Link Recovery flow if they were previosly enabled */
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
index e51d01671d8e..99fd6aa1704e 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/ktime.h>
 #include <linux/units.h>
+#include <linux/string_helpers.h>
 
 #include "sb_regs.h"
 #include "tb.h"
@@ -1518,6 +1519,57 @@ bool usb4_port_clx_supported(struct tb_port *port)
 	return !!(val & PORT_CS_18_CPS);
 }
 
+static int __usb4_port_link_recovery_enable(struct tb_port *port, bool enable)
+{
+	bool was_enable;
+	int ret;
+	u32 val;
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
+ * Returns -ERRNO on failure, otherwise the previous state of the Link Recovery.
+ */
+int usb4_port_link_recovery_enable(struct tb_port *port)
+{
+	return __usb4_port_link_recovery_enable(port, true);
+}
+
+/**
+ * usb4_port_link_recovery_disable() - Disable the Link Recovery
+ * @port: USB4 port
+ *
+ * Disables the Link Recovery for @port.
+ * Returns -ERRNO on failure, otherwise the previous state of the Link Recovery.
+ */
+int usb4_port_link_recovery_disable(struct tb_port *port)
+{
+	return __usb4_port_link_recovery_enable(port, false);
+}
+
 /**
  * usb4_port_asym_supported() - If the port supports asymmetric link
  * @port: USB4 port
-- 
2.45.2

