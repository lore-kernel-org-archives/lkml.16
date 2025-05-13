Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92D428ECCB;
	Tue, 13 May 2025 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141749; cv=none; b=AFTvYKj15DftKgleWC3whv1fbR51U5xNCV0h6eHDaMM8cofN3GMRfNwDxfW6+B68OAz71XF46Hdn3TtaKu2V/NwHj2S/P2k2JbAQ+8rbxYZm22kG1wF3//Uzz3iCH3BGSu8JcTgRgYHq9GYvW1fWrfyjUzRLkPMrBmLjyyKYXOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141749; c=relaxed/simple;
	bh=5/Y6EJVmF4DB+oWCs6oaK0sniE4Ne4EigB/OJbPea9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s4YZ67XBfLeEdJrQ5OHy7cBNHuaGf7mTUd2GrEy4oVGXtTOyAUy6u4eAaCJbW/bGPSQKHk/RK7NSXi4fNMzO7afQmspVp7LP3xjKxXR15HXfBgyjna7NjMeeR1P4/UsgzUBM69o+N8Cs7mKfF6CUNXktmSgMdf5jwbI35DSjkLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiQlxZiP; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiQlxZiP"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso4477303b3a.1;
        Tue, 13 May 2025 06:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747141747; x=1747746547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8IPebdiQyz6+b4I6llbGi3nXjR0k6+4GTE2l/0cCeM=;
        b=NiQlxZiPNpv63bijowMa+4I1JrFWlDwiJoQN9IMea98XMjiM5cN3+sSvP6I2Njj+th
         vattxHOz8R3hKin8hGcgPrpIkDlIL+9dbwNyYdE35Th18qfOSyfI1EOnynWaIy5NsA26
         s3e85mIkWRaFiMqXHdMEGyfBsoXBnAWnvMSHz7LS/vycUTVA2msu9zCe0BeHToI8/Av4
         1csw8dewu7VLiI5+2u/cXJdNzQuECXRKMPketPO4wy9nJTIciK0WGXjdSyboTt/dSE07
         WNhfqzcAJW7bcoFNXeM+jd1y3fPoHze6N7JU4G3ciw3idV7M4x6i4dkWml+X9a+hGL5W
         DuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141747; x=1747746547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8IPebdiQyz6+b4I6llbGi3nXjR0k6+4GTE2l/0cCeM=;
        b=oRLsAGLGVQm2ZSfvpt9V7V3ylpuP4ZXo27gGfHy0YeYSuHGgYhZh9sHlQ7DwKdumhJ
         335YreIJHo/nWHqtTcBeon6K2BPb3g2qrUn5bttzln+Xek6UCX+ZIw/gQXF4g+nmXVq4
         bF2DzEtvf3851Q7EcIXpGSmt3Qi+wj5GLEqi8mzVDo5hLtnkL2xEXDpphtZw05o0frgL
         sGnUEIRty3Dk95/uMC05aSINWN6KNmsw7FLC1wYpL9Fi3zvlVHqs8c3tCD0rXGWvY3Qt
         lNI93ZqxW/mpw3HK1uDLp2TmoyNlbSCXLd5ZxY2Fv/ve6+AImAHpXA0HhNTRsUNqUxlk
         GwVg==
X-Forwarded-Encrypted: i=1; AJvYcCVAJdiCVyjubEsV553b/fS0Cb3tdTjMzU2r+Rssg9jnriw7wgPpt+Ek2VXwTRU0+I1NIaZ3hUd9+0zwKTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOSTgRSl9BQF/pSzknPM28d43ysMx3JmT/B2UScT60SEi+Qbf8
	77dIfsZPRq82ssNKxfDV2U/MjdIqyymeHGafw9Ki3toKf+ug+abJ
X-Gm-Gg: ASbGncuYFwKm2uq1MrLjyCHNiRioi4L0nTsB1Ypovrhh8uSzmBFPF03L+M3kWaQO7Q6
	wkd+sV+8ZvRtp8/ihJqa68nc7wRJK3lslDzmSSbIN29xoXKTv+WKEV3XshYBsj/25drfowpCgr3
	AMeksbZ9R6TDias5PC5GZxbLRjWkJ3hhvkSPcSbKaPzg37KQnwv4HapBvl9dPQeH0Q2QMp55iQC
	KQvl9GIYp8RezaQd3B6KiIHexiQvO7M/2a9UYs88NjI0r/Py0HDIgfnow2KURMLQ2WTw4ahkF8S
	4BTSnMC5zOge7nvKbRVRlHb8C7MvVFiIuNkSFvjAAk8H0ijXYP4IAMEnUD0MSVtrw4TJ4ZRRu0G
	N/vTbnbzlfI46W+xfaQtB38YvQzOhgdfvPjHg1bWfBnrS60fAUvDk
X-Google-Smtp-Source: AGHT+IFQ3m4yCK+ppMcpl0QJccpa/po7ZnPQFvbBYq1xVipSJv4daPLsHxqkhFVZMg9x/w5RDCKieA==
X-Received: by 2002:a17:903:32d0:b0:22e:421b:49b1 with SMTP id d9443c01a7336-22fc91aea35mr280650885ad.48.1747141747042;
        Tue, 13 May 2025 06:09:07 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75469e0sm80248185ad.48.2025.05.13.06.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:09:06 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH v2] usb: typec: tcpm: Use configured PD revision for negotiation
Date: Tue, 13 May 2025 21:08:34 +0800
Message-ID: <20250513130834.1612602-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize negotiated_rev and negotiated_rev_prime based on the port's
configured PD revision (rev_major) rather than always defaulting to
PD_MAX_REV. This ensures ports start PD communication using their
appropriate revision level.

This allows proper communication with devices that require specific
PD revision levels, especially for the hardware designed for PD 1.0
or 2.0 specifications.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
Change log:

v2:
  - Add PD_CAP_REVXX macros and use switch-case for better readability.

---
 drivers/usb/typec/tcpm/tcpm.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 8adf6f954633..48e9cfc2b49a 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -313,6 +313,10 @@ struct pd_data {
 	unsigned int operating_snk_mw;
 };
 
+#define PD_CAP_REV10	0x1
+#define PD_CAP_REV20	0x2
+#define PD_CAP_REV30	0x3
+
 struct pd_revision_info {
 	u8 rev_major;
 	u8 rev_minor;
@@ -4665,6 +4669,25 @@ static void tcpm_set_initial_svdm_version(struct tcpm_port *port)
 	}
 }
 
+static void tcpm_set_initial_negotiated_rev(struct tcpm_port *port)
+{
+	switch (port->pd_rev.rev_major) {
+	case PD_CAP_REV10:
+		port->negotiated_rev = PD_REV10;
+		break;
+	case PD_CAP_REV20:
+		port->negotiated_rev = PD_REV20;
+		break;
+	case PD_CAP_REV30:
+		port->negotiated_rev = PD_REV30;
+		break;
+	default:
+		port->negotiated_rev = PD_MAX_REV;
+		break;
+	}
+	port->negotiated_rev_prime = port->negotiated_rev;
+}
+
 static void run_state_machine(struct tcpm_port *port)
 {
 	int ret;
@@ -4782,8 +4805,7 @@ static void run_state_machine(struct tcpm_port *port)
 		typec_set_pwr_opmode(port->typec_port, opmode);
 		port->pwr_opmode = TYPEC_PWR_MODE_USB;
 		port->caps_count = 0;
-		port->negotiated_rev = PD_MAX_REV;
-		port->negotiated_rev_prime = PD_MAX_REV;
+		tcpm_set_initial_negotiated_rev(port);
 		port->message_id = 0;
 		port->message_id_prime = 0;
 		port->rx_msgid = -1;
@@ -5048,8 +5070,7 @@ static void run_state_machine(struct tcpm_port *port)
 					      port->cc2 : port->cc1);
 		typec_set_pwr_opmode(port->typec_port, opmode);
 		port->pwr_opmode = TYPEC_PWR_MODE_USB;
-		port->negotiated_rev = PD_MAX_REV;
-		port->negotiated_rev_prime = PD_MAX_REV;
+		tcpm_set_initial_negotiated_rev(port);
 		port->message_id = 0;
 		port->message_id_prime = 0;
 		port->rx_msgid = -1;
-- 
2.43.0

