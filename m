Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242131C2324
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750287976; cv=none; b=eOjJ4Nkxz5iNHBgNfHKQvHSdElydqr0aK0BvmquMh/wgBGsO3SIf822rUkddRsZTVil2FWKcJC1/zaCxbl+cHhUGR2nNohZfMVk7K/sQCPUdSe2YsvBrkgntZOarf/ZYHIxI1+h5nE3TPoY+XegqR4MyyEVe9uso13mWP0XFG8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750287976; c=relaxed/simple;
	bh=BxNRELJCv8xh2C7UZi+0KHsQjfF46eSQoB3JSyofgFg=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=flY518tsh1o17DC34yOuIpX69mVTcqkfdeR0MZO9MnEZb6lIG9dPtR82+zTc4NSPMgCQHCdnzxNQHMKm0h13gl0ss8IOc1cFLNnGoPfwDU8+PlOgXY4Pg0vdVInuLFK4YanGHmHK0SNyQmXyc91plUNhxZ6FMI3UKkMt13yCX8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WENfoz9k; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WENfoz9k"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3139c0001b5so76777a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 16:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750287974; x=1750892774; darn=vger.kernel.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/kW3pEgv8ky25+r9zWrjkXPocA0BbZz1zBitqJN6Zf4=;
        b=WENfoz9k3H4SGRVXkgesIT+nldqxHrZzx8Y8zwRz71tKvpPy65WjLYFeAhWgUSj0hM
         O1vcNpFg9qhJF8KWhJowfoF9ArjYXuQl7w/L61wBOMa0U3CWNb3/XG3Fnf0wRrEMA4Qp
         v+xF9TIN+m0Jw0IaE0809KeeSmG23xFTKaJJdqF0ytbw5IP/TOHtR8IFKIpRec2mVqtb
         Xu2WkAlWMq6zJLNSt5V4hbQP5dryTrfiXu2kWtNjV21jW71OT4cQxbmMSrIssR+aITog
         hygXP2uxW+/aKQ57OG9waoypFl7qUZxWkYKQ39PP6g12T+5QwS1/dpi1NSF6axXdvxQ8
         rgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750287974; x=1750892774;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/kW3pEgv8ky25+r9zWrjkXPocA0BbZz1zBitqJN6Zf4=;
        b=wh7Apu5Hc2R4Iw18fxiK+DY2WS/4zmSPCOLBlhm/Ct4ypJaemxcJRsXzaw3BtYQ1TI
         VAb0YX31nnA5zNZwU+POVjlmBN3vBZslWC5gfJJ0EnqS7hOD1w0jFHkYXb7y/84/Qn0f
         KvNbueZHi3G2tW9nt8xbsfGm6zK1Gc61R9VF8HUupxbVsoT6gIenmvv4VOWT7ik9TdUo
         VqKQtv7u7pzpSwcbq+IiY2qcikv4NchYdAM/BQ+vF9RF7T0ygxVko9oJiFWXdW06HVrR
         tZl0D/KZFwEhO+RK3Vid2oCpipK4ipR7Rq9levsVganWM5XNdO3urEh8VU51KecDkY9U
         1izg==
X-Forwarded-Encrypted: i=1; AJvYcCUwJH6DH7dxkKJweD7GqLmDvqdMYG9ZpdhHwCJ1GuqqR7jrRgi+Hy3N6lauYkBX1KrBnE+OOiqEv5DQpVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkvT1ebqlZ4NIpykuHmkoksjt0TGA8LBnosaASugy1JI1NcB+9
	XVjLIkI458AWMS8+aQKKjMgBi094ebdH7RuS4JzwRCZYRbFgCC9ub9MAH1LkEy+UY08kvogbzQp
	egTRng0AtEiO//xzFmQ==
X-Google-Smtp-Source: AGHT+IH9de6l1eYgbMosfCN8sNQR1ZI031trCbqUp2lURLBgeAQzLCKb9JHE5vSnNS8crOtiNcZ97pQ3VHVcxpw=
X-Received: from pjbsn16.prod.google.com ([2002:a17:90b:2e90:b0:30e:5bd5:880d])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c49:b0:312:1ae9:1525 with SMTP id 98e67ed59e1d1-313f1cc2ae9mr29093451a91.8.1750287974478;
 Wed, 18 Jun 2025 16:06:14 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:06:04 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3109; i=rdbabiera@google.com;
 h=from:subject; bh=BxNRELJCv8xh2C7UZi+0KHsQjfF46eSQoB3JSyofgFg=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDBnBbnFM53c/E2r2OLxw2b7ZqVv4lgdOsj7IFe+bKpuQ2
 PD31mKVjlIWBjEOBlkxRRZd/zyDG1dSt8zhrDGGmcPKBDKEgYtTACaidYrhf+n3hCNh3zxWVUz5
 6GRw5alIhx/H7SPhFRklKnsk5A+xfmRk2Pfx3LMWZ0EBhWALScVFYWf1e3f7lgTOyj5VVZHzOWI rKwA=
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250618230606.3272497-2-rdbabiera@google.com>
Subject: [PATCH v3] usb: typec: tcpm: apply vbus before data bringup in tcpm_src_attach
From: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, RD Babiera <rdbabiera@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patch fixes Type-C compliance test TD 4.7.6 - Try.SNK DRP Connect
SNKAS.

tVbusON has a limit of 275ms when entering SRC_ATTACHED. Compliance
testers can interpret the TryWait.Src to Attached.Src transition after
Try.Snk as being in Attached.Src the entire time, so ~170ms is lost
to the debounce timer.

Setting the data role can be a costly operation in host mode, and when
completed after 100ms can cause Type-C compliance test check TD 4.7.5.V.4
to fail.

Turn VBUS on before tcpm_set_roles to meet timing requirement.

Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
Cc: stable@vger.kernel.org
Signed-off-by: RD Babiera <rdbabiera@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes since v1:
* Rebased on top of usb-linus for v6.15

Changes since v2:
* Restored to v1, usb-next and usb-linus are both synced to v6.16
so there is no longer a version mismatch possibility.
---
 drivers/usb/typec/tcpm/tcpm.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 1a1f9e1f8e4e..1f6fdfaa34bf 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4410,17 +4410,6 @@ static int tcpm_src_attach(struct tcpm_port *port)
 
 	tcpm_enable_auto_vbus_discharge(port, true);
 
-	ret = tcpm_set_roles(port, true, TYPEC_STATE_USB,
-			     TYPEC_SOURCE, tcpm_data_role_for_source(port));
-	if (ret < 0)
-		return ret;
-
-	if (port->pd_supported) {
-		ret = port->tcpc->set_pd_rx(port->tcpc, true);
-		if (ret < 0)
-			goto out_disable_mux;
-	}
-
 	/*
 	 * USB Type-C specification, version 1.2,
 	 * chapter 4.5.2.2.8.1 (Attached.SRC Requirements)
@@ -4430,13 +4419,24 @@ static int tcpm_src_attach(struct tcpm_port *port)
 	    (polarity == TYPEC_POLARITY_CC2 && port->cc1 == TYPEC_CC_RA)) {
 		ret = tcpm_set_vconn(port, true);
 		if (ret < 0)
-			goto out_disable_pd;
+			return ret;
 	}
 
 	ret = tcpm_set_vbus(port, true);
 	if (ret < 0)
 		goto out_disable_vconn;
 
+	ret = tcpm_set_roles(port, true, TYPEC_STATE_USB, TYPEC_SOURCE,
+			     tcpm_data_role_for_source(port));
+	if (ret < 0)
+		goto out_disable_vbus;
+
+	if (port->pd_supported) {
+		ret = port->tcpc->set_pd_rx(port->tcpc, true);
+		if (ret < 0)
+			goto out_disable_mux;
+	}
+
 	port->pd_capable = false;
 
 	port->partner = NULL;
@@ -4447,14 +4447,14 @@ static int tcpm_src_attach(struct tcpm_port *port)
 
 	return 0;
 
-out_disable_vconn:
-	tcpm_set_vconn(port, false);
-out_disable_pd:
-	if (port->pd_supported)
-		port->tcpc->set_pd_rx(port->tcpc, false);
 out_disable_mux:
 	tcpm_mux_set(port, TYPEC_STATE_SAFE, USB_ROLE_NONE,
 		     TYPEC_ORIENTATION_NONE);
+out_disable_vbus:
+	tcpm_set_vbus(port, false);
+out_disable_vconn:
+	tcpm_set_vconn(port, false);
+
 	return ret;
 }
 

base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
-- 
2.50.0.rc2.701.gf1e915cc24-goog

