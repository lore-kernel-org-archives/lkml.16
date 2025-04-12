Received: from out.smtpout.orange.fr (out-15.smtpout.orange.fr [193.252.22.15])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC223645
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744440520; cv=none; b=I7BUc3pJ4Rm4I2CfYVpIoTEdANQ/PNGt2/ENz2n4d8p2fy2UO9L8aUeei9FpMoMONMgJYqL6cR/vHgfoSCptn+L4hjBBt8rV+/GG0trJlsOSa+kmIcvwGaCbdiz94ZfLyBz0kn3Njp0TaKQjfnVD5OH+KhfSApZGANQTjPNfaKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744440520; c=relaxed/simple;
	bh=O1JgI00a/efCbNOGQpa+5xqZJHTLJe8jQNXtRk7lwXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VlTO8ep8eCWgSDH9eqJITsqj+jZprhqZDtzgp/Vm0uel4zUlYCnx22/O4kWnnQMDuhb/4s3jrmjW1TBcFki1WEzDgtFVDjdZlExCyyegJLbXIns2vWphLpj5Cu9I8ZSuCDIJX1WVnm0SNH6+oiCp7I5cpTY21jN1I5qyIn+jXoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=EmdFd7Qi; arc=none smtp.client-ip=193.252.22.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="EmdFd7Qi"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3UeAuNICOB75R3UeEuB4Ro; Sat, 12 Apr 2025 08:47:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744440448;
	bh=AphogcM6Nx5fUPKv40KkaG6PJmjwevwNNLjesePnqVI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=EmdFd7QieXenGN/JHWEMeAwpU4Kk+Wj8TnNUFXZh1nsDQbsVGx5ZA14YBL3lnx/VB
	 k/9MJUG5gAidN97wVRa8TM+ankn1mtOkv9EIkL7u2hl/lN0hnOQkAB1PuUVY/YfOL7
	 F1YKyoiNww57+7VbQqw7iE+O+KmUdZDyiR/+bl224hg+YHfLn/mwDhSauIhYvD+ulG
	 hYiKcz/4o4xgRn3tXKYy2CPC4or0EWnq+ckT8aHN9BQjQY12rb2V4z4joCDFMZzUKi
	 CQ5Bb43dZtuIfXE++Xs1KLW6Aw+ORXGD2hjaMdUZ5uGKeifvkNj79fy3/CCwD2aN0C
	 cQzAl/mFd9FeQ==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:47:28 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/16] staging: gpib: ines: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:47:18 -0700
Message-ID: <69a082f18148881a673e1d57b4a9d83767d87a2a.1744438358.git.paul.retourne@orange.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744438358.git.paul.retourne@orange.fr>
References: <cover.1744438358.git.paul.retourne@orange.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the style of multiline comments to comply with the linux kernel
coding style.

Signed-off-by: Paul Retourné <paul.retourne@orange.fr>
---
 drivers/staging/gpib/ines/ines_gpib.c | 86 ++++++++++++++-------------
 1 file changed, 44 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index d93eb05dab90..f143fe8011bd 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -990,12 +990,13 @@ static struct pci_driver ines_pci_driver = {
 
 static const int ines_pcmcia_iosize = 0x20;
 
-/*    The event() function is this driver's Card Services event handler.
- *    It will be called by Card Services when an appropriate card status
- *    event is received.  The config() and release() entry points are
- *    used to configure or release a socket, in response to card insertion
- *    and ejection events.  They are invoked from the gpib event
- *    handler.
+/*
+ * The event() function is this driver's Card Services event handler.
+ * It will be called by Card Services when an appropriate card status
+ * event is received.  The config() and release() entry points are
+ * used to configure or release a socket, in response to card insertion
+ * and ejection events.  They are invoked from the gpib event
+ * handler.
  */
 
 static int ines_gpib_config(struct pcmcia_device  *link);
@@ -1007,31 +1008,31 @@ static irqreturn_t ines_pcmcia_interrupt(int irq, void *arg);
 static int ines_common_pcmcia_attach(struct gpib_board *board);
 /*
  * A linked list of "instances" of the gpib device.  Each actual
- *  PCMCIA card corresponds to one device instance, and is described
- *  by one dev_link_t structure (defined in ds.h).
+ * PCMCIA card corresponds to one device instance, and is described
+ * by one dev_link_t structure (defined in ds.h).
  *
- *  You may not want to use a linked list for this -- for example, the
- *  memory card driver uses an array of dev_link_t pointers, where minor
- *  device numbers are used to derive the corresponding array index.
+ * You may not want to use a linked list for this -- for example, the
+ * memory card driver uses an array of dev_link_t pointers, where minor
+ * device numbers are used to derive the corresponding array index.
  */
 
 static struct pcmcia_device *curr_dev;
 
 /*
- *   A dev_link_t structure has fields for most things that are needed
- *  to keep track of a socket, but there will usually be some device
- *  specific information that also needs to be kept track of.  The
- *  'priv' pointer in a dev_link_t structure can be used to point to
- *  a device-specific private data structure, like this.
+ * A dev_link_t structure has fields for most things that are needed
+ * to keep track of a socket, but there will usually be some device
+ * specific information that also needs to be kept track of.  The
+ * 'priv' pointer in a dev_link_t structure can be used to point to
+ * a device-specific private data structure, like this.
  *
- *  A driver needs to provide a dev_node_t structure for each device
- *  on a card.	In some cases, there is only one device per card (for
- *  example, ethernet cards, modems).  In other cases, there may be
- *  many actual or logical devices (SCSI adapters, memory cards with
- *  multiple partitions).  The dev_node_t structures need to be kept
- *  in a linked list starting at the 'dev' field of a dev_link_t
- *  structure.	We allocate them in the card's private data structure,
- *  because they generally can't be allocated dynamically.
+ * A driver needs to provide a dev_node_t structure for each device
+ * on a card.	In some cases, there is only one device per card (for
+ * example, ethernet cards, modems).  In other cases, there may be
+ * many actual or logical devices (SCSI adapters, memory cards with
+ * multiple partitions).  The dev_node_t structures need to be kept
+ * in a linked list starting at the 'dev' field of a dev_link_t
+ * structure.	We allocate them in the card's private data structure,
+ * because they generally can't be allocated dynamically.
  */
 
 struct local_info {
@@ -1042,13 +1043,13 @@ struct local_info {
 };
 
 /*
- *   gpib_attach() creates an "instance" of the driver, allocating
- *   local data structures for one device.  The device is registered
- *   with Card Services.
+ * gpib_attach() creates an "instance" of the driver, allocating
+ * local data structures for one device.  The device is registered
+ * with Card Services.
  *
- *   The dev_link structure is initialized, but we don't actually
- *   configure the card at this point -- we wait until we receive a
- *   card insertion event.
+ * The dev_link structure is initialized, but we don't actually
+ * configure the card at this point -- we wait until we receive a
+ * card insertion event.
  */
 static int ines_gpib_probe(struct pcmcia_device *link)
 {
@@ -1079,10 +1080,10 @@ static int ines_gpib_probe(struct pcmcia_device *link)
 }
 
 /*
- *   This deletes a driver "instance".	The device is de-registered
- *   with Card Services.  If it has been released, all local data
- *   structures are freed.  Otherwise, the structures will be freed
- *   when the device is released.
+ * This deletes a driver "instance".	The device is de-registered
+ * with Card Services.  If it has been released, all local data
+ * structures are freed.  Otherwise, the structures will be freed
+ * when the device is released.
  */
 static void ines_gpib_remove(struct pcmcia_device *link)
 {
@@ -1103,9 +1104,9 @@ static int ines_gpib_config_iteration(struct pcmcia_device *link, void *priv_dat
 }
 
 /*
- *   gpib_config() is scheduled to run after a CARD_INSERTION event
- *   is received, to configure the PCMCIA socket, and to make the
- *   device available to the system.
+ * gpib_config() is scheduled to run after a CARD_INSERTION event
+ * is received, to configure the PCMCIA socket, and to make the
+ * device available to the system.
  */
 static int ines_gpib_config(struct pcmcia_device *link)
 {
@@ -1125,8 +1126,9 @@ static int ines_gpib_config(struct pcmcia_device *link)
 	dev_dbg(&link->dev, "ines_cs: manufacturer: 0x%x card: 0x%x\n",
 		link->manf_id, link->card_id);
 
-	/*  for the ines card we have to setup the configuration registers in
-	 *	attribute memory here
+	/*
+	 * for the ines card we have to setup the configuration registers in
+	 * attribute memory here
 	 */
 	link->resource[2]->flags |= WIN_MEMORY_TYPE_AM | WIN_DATA_WIDTH_8 | WIN_ENABLE;
 	link->resource[2]->end = 0x1000;
@@ -1159,9 +1161,9 @@ static int ines_gpib_config(struct pcmcia_device *link)
 } /* gpib_config */
 
 /*
- *   After a card is removed, gpib_release() will unregister the net
- *   device, and release the PCMCIA configuration.  If the device is
- *   still open, this will be postponed until it is closed.
+ * After a card is removed, gpib_release() will unregister the net
+ * device, and release the PCMCIA configuration.  If the device is
+ * still open, this will be postponed until it is closed.
  */
 
 static void ines_gpib_release(struct pcmcia_device *link)
-- 
2.49.0

