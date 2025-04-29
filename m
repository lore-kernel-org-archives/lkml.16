Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6C2280339
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970559; cv=none; b=MaKig/JvkrGMieFkDelTYWTwLjYXVpHR5ba5zAJQylVAJ/PhNwI3Fi/BLy3sIAtaXdds7HUn9UCSzXDPCB2nBXmqx57IY5Ch5JvocSdOxXor0jl9YatkJUyqD9AbWltvwRBoHXWfVE5SXkv78alh2gsqjBzrjhkh4T9inFCofDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970559; c=relaxed/simple;
	bh=woCp2DoIvTQ3ohVyoybI/HYz+s6FKuiWQs3idtzxfRs=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=b3CtOzTZp2G9vDkbIK/pNE5rQKyHWxoPtu2OA79aVCZQJVWkSG1IwIF4MDn3eZFXueWcqpN8rrFZyrUvWystVrI8nrAFISpo8N9aA6X+tMPkji0Zcd2hX1oeOWyB122zASj21F3FJ018heScsyzq/CamnJdEbtYUNq9I0Q60oP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1ZlqRIoi; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1ZlqRIoi"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b00e4358a34so3624709a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745970556; x=1746575356; darn=vger.kernel.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4miyblymUWh4CB9qwAMZGQ/g7XpaifLef8Ab3PTixSc=;
        b=1ZlqRIoiCeMZrLqma9OJ0Ob7wul1L+rasV1ndrwPpnJxQvuOQFzC51Utfn5yz2ZZZ8
         egidHzpVluqK9yz9mhKvHh8df99HR9Qkk+MEDqN9pGgu/526F/ePrnuKrwKgqnIo80oK
         El27MIEgQXDC/iExIXRVG9tX1iVWmUZyq/CX4NhDzlIFeVXUYf+rt3ux2P4YEFGy+36M
         lhqMwysSEfVrC/v+UGx0ebbB+4A7TMtvGLZyaH/M4cF7/wy0/ixtlidTnD2s/yc4MFni
         OGxUB1lbSWsvIcVXKh9uFHwJ/lkEZWAFYHHaAEe3VQVKWS55BD60qwYsxkX3r04x2nyB
         QiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745970556; x=1746575356;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4miyblymUWh4CB9qwAMZGQ/g7XpaifLef8Ab3PTixSc=;
        b=Bd48dx0AmH/dFAYu1Hkcrtu/uIbP3GCH0Z3uGvWAUkIIuDB/AjfKx9cPwfW6iVFTbF
         9/SJppuBkZw59i2NjmwSYAiwvQnJxuK6ivi1mfw4/CYtt6t+F8kuK+pdcju6zx1gJUo3
         sEldFshghT3eoq+rUgmT1YfYrgrmYa3YG+ozKVgtTobZn18FaRfrp0iTDFP3ZE90aabh
         ohxXWcYUWLg495abCtCpDrNy29uktbKUY4eCwYGfS226wCytgkn2cFOEPq3+1R7zTWpc
         o4U16y2hPlf2qJGotKvi9OznUDJgbBKBHXT187r3E2vj1tcVVsmZn9OgSFErffmZzhsq
         GlIw==
X-Forwarded-Encrypted: i=1; AJvYcCXYifPusNHjOGP7XPoaSPfiiuAVH6+2VOnrtsTNv3jhHoB5wwbtsyVOuE85Q6cTjd4qAlNj1PPEE0xzcRE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3a9SUOqnxMkqzUVu2HRCS8XftyLl02NNybMWFafWoxU0ELRcw
	ek1ek6/Nk+jTAezP0+D+AY+v5vgur0P+B+0/N1IFm4agflIP0KCHBFoL+e0z7nStSwzri78Ea++
	uUrFN9yAGpT4OpQ==
X-Google-Smtp-Source: AGHT+IFsjk2IFjOMoJ9YANY7NqPvQC2AJ8xnUINbQ3Ung7D1u4/9oBYnYnCCMlL6uO6uB2+nePuki32LmQnMFto=
X-Received: from pjbrr12.prod.google.com ([2002:a17:90b:2b4c:b0:2ff:4be0:c675])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3d09:b0:305:5f28:2d5c with SMTP id 98e67ed59e1d1-30a33300d59mr1464342a91.15.1745970556580;
 Tue, 29 Apr 2025 16:49:16 -0700 (PDT)
Date: Tue, 29 Apr 2025 23:49:08 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6569; i=rdbabiera@google.com;
 h=from:subject; bh=woCp2DoIvTQ3ohVyoybI/HYz+s6FKuiWQs3idtzxfRs=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDBmCqaVuMrZpAtM3K+6Kl85kvnzV1e3ijUQD1z38v5fa6
 h2QUrrbUcrCIMbBICumyKLrn2dw40rqljmcNcYwc1iZQIYwcHEKwEQ+uTL8j3hwcaq/l6e9n58D
 /7z7C4zfnUmoXVDonHrKLXPRjRlODxkZbm2xK/4vE7Vu+Y2dKY9T3OtV42dFxG6+ktf++AX/qTN aTAA=
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250429234908.3751116-2-rdbabiera@google.com>
Subject: [PATCH v1] usb: typec: tcpm: move tcpm_queue_vdm_unlocked to
 asynchronous work
From: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, RD Babiera <rdbabiera@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A state check was previously added to tcpm_queue_vdm_unlocked to
prevent a deadlock where the DisplayPort Alt Mode driver would be
executing work and attempting to grab the tcpm_lock while the TCPM
was holding the lock and attempting to unregister the altmode, blocking
on the altmode driver's cancel_work_sync call.

Because the state check isn't protected, there is a small window
where the Alt Mode driver could determine that the TCPM is
in a ready state and attempt to grab the lock while the
TCPM grabs the lock and changes the TCPM state to one that
causes the deadlock.

Change tcpm_queue_vdm_unlocked to queue for tcpm_queue_vdm_work,
which can perform the state check while holding the TCPM lock
while the Alt Mode lock is no longer held. This requires a new
struct to hold the vdm data, altmode_vdm_event.

Fixes: cdc9946ea637 ("usb: typec: tcpm: enforce ready state when queueing alt mode vdm")
Cc: stable@vger.kernel.org
Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 91 +++++++++++++++++++++++++++--------
 1 file changed, 71 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 784fa23102f9..9b8d98328ddb 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -597,6 +597,15 @@ struct pd_rx_event {
 	enum tcpm_transmit_type rx_sop_type;
 };
 
+struct altmode_vdm_event {
+	struct kthread_work work;
+	struct tcpm_port *port;
+	u32 header;
+	u32 *data;
+	int cnt;
+	enum tcpm_transmit_type tx_sop_type;
+};
+
 static const char * const pd_rev[] = {
 	[PD_REV10]		= "rev1",
 	[PD_REV20]		= "rev2",
@@ -1610,18 +1619,68 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
 	mod_vdm_delayed_work(port, 0);
 }
 
-static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
-				    const u32 *data, int cnt, enum tcpm_transmit_type tx_sop_type)
+static void tcpm_queue_vdm_work(struct kthread_work *work)
 {
-	if (port->state != SRC_READY && port->state != SNK_READY &&
-	    port->state != SRC_VDM_IDENTITY_REQUEST)
-		return;
+	struct altmode_vdm_event *event = container_of(work,
+						       struct altmode_vdm_event,
+						       work);
+	struct tcpm_port *port = event->port;
 
 	mutex_lock(&port->lock);
-	tcpm_queue_vdm(port, header, data, cnt, tx_sop_type);
+	if (port->state != SRC_READY && port->state != SNK_READY &&
+	    port->state != SRC_VDM_IDENTITY_REQUEST) {
+		tcpm_log_force(port, "dropping altmode_vdm_event");
+		goto port_unlock;
+	}
+
+	tcpm_queue_vdm(port, event->header, event->data, event->cnt, event->tx_sop_type);
+
+port_unlock:
+	kfree(event->data);
+	kfree(event);
 	mutex_unlock(&port->lock);
 }
 
+static int tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
+				   const u32 *data, int cnt, enum tcpm_transmit_type tx_sop_type)
+{
+	struct altmode_vdm_event *event;
+	u32 *data_cpy;
+	int ret = -ENOMEM;
+
+	event = kzalloc(sizeof(*event), GFP_KERNEL);
+	if (!event)
+		goto err_event;
+
+	data_cpy = kcalloc(cnt, sizeof(u32), GFP_KERNEL);
+	if (!data_cpy)
+		goto err_data;
+
+	kthread_init_work(&event->work, tcpm_queue_vdm_work);
+	event->port = port;
+	event->header = header;
+	memcpy(data_cpy, data, sizeof(u32) * cnt);
+	event->data = data_cpy;
+	event->cnt = cnt;
+	event->tx_sop_type = tx_sop_type;
+
+	ret = kthread_queue_work(port->wq, &event->work);
+	if (!ret) {
+		ret = -EBUSY;
+		goto err_queue;
+	}
+
+	return 0;
+
+err_queue:
+	kfree(data_cpy);
+err_data:
+	kfree(event);
+err_event:
+	tcpm_log_force(port, "failed to queue altmode vdm, err:%d", ret);
+	return ret;
+}
+
 static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
 {
 	u32 vdo = p[VDO_INDEX_IDH];
@@ -2832,8 +2891,7 @@ static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
 	header = VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTER_MODE);
 	header |= VDO_OPOS(altmode->mode);
 
-	tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TCPC_TX_SOP);
-	return 0;
+	return tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TCPC_TX_SOP);
 }
 
 static int tcpm_altmode_exit(struct typec_altmode *altmode)
@@ -2849,8 +2907,7 @@ static int tcpm_altmode_exit(struct typec_altmode *altmode)
 	header = VDO(altmode->svid, 1, svdm_version, CMD_EXIT_MODE);
 	header |= VDO_OPOS(altmode->mode);
 
-	tcpm_queue_vdm_unlocked(port, header, NULL, 0, TCPC_TX_SOP);
-	return 0;
+	return tcpm_queue_vdm_unlocked(port, header, NULL, 0, TCPC_TX_SOP);
 }
 
 static int tcpm_altmode_vdm(struct typec_altmode *altmode,
@@ -2858,9 +2915,7 @@ static int tcpm_altmode_vdm(struct typec_altmode *altmode,
 {
 	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
 
-	tcpm_queue_vdm_unlocked(port, header, data, count - 1, TCPC_TX_SOP);
-
-	return 0;
+	return tcpm_queue_vdm_unlocked(port, header, data, count - 1, TCPC_TX_SOP);
 }
 
 static const struct typec_altmode_ops tcpm_altmode_ops = {
@@ -2884,8 +2939,7 @@ static int tcpm_cable_altmode_enter(struct typec_altmode *altmode, enum typec_pl
 	header = VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTER_MODE);
 	header |= VDO_OPOS(altmode->mode);
 
-	tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TCPC_TX_SOP_PRIME);
-	return 0;
+	return tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TCPC_TX_SOP_PRIME);
 }
 
 static int tcpm_cable_altmode_exit(struct typec_altmode *altmode, enum typec_plug_index sop)
@@ -2901,8 +2955,7 @@ static int tcpm_cable_altmode_exit(struct typec_altmode *altmode, enum typec_plu
 	header = VDO(altmode->svid, 1, svdm_version, CMD_EXIT_MODE);
 	header |= VDO_OPOS(altmode->mode);
 
-	tcpm_queue_vdm_unlocked(port, header, NULL, 0, TCPC_TX_SOP_PRIME);
-	return 0;
+	return tcpm_queue_vdm_unlocked(port, header, NULL, 0, TCPC_TX_SOP_PRIME);
 }
 
 static int tcpm_cable_altmode_vdm(struct typec_altmode *altmode, enum typec_plug_index sop,
@@ -2910,9 +2963,7 @@ static int tcpm_cable_altmode_vdm(struct typec_altmode *altmode, enum typec_plug
 {
 	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
 
-	tcpm_queue_vdm_unlocked(port, header, data, count - 1, TCPC_TX_SOP_PRIME);
-
-	return 0;
+	return tcpm_queue_vdm_unlocked(port, header, data, count - 1, TCPC_TX_SOP_PRIME);
 }
 
 static const struct typec_cable_ops tcpm_cable_ops = {

base-commit: 615dca38c2eae55aff80050275931c87a812b48c
-- 
2.49.0.967.g6a0df3ecc3-goog

