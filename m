Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECB61D7E26;
	Sun,  8 Jun 2025 23:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749426986; cv=none; b=kOaF/k4LqKsZJulRU+uIX3nDo55myhtgqiFC2d0USLCftZOwbrNekXvXRTX97R6K172PVm3G3h4p/gsPXUfhXs6CoG6L4qJNtf+fFxK+BIGphIImNhGL/KpxIj5Yf7iw+4fWfACCy7QsakXhWVhSat1xLvV9w1YXphtcpksGDaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749426986; c=relaxed/simple;
	bh=u5xYsTnGy1AJyvJymV7jx4kZswjXoUV+JFE54ziUBSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b4hYdNERDh/YxH9gNFO8o59RtwFzDNwqw88P92QyLdxnA+xsgI2L/ATmfAIbDp9kBF+gZ9/HCIMCDnUiMw08NxxO47Do7/3mglMJl+QR2wFlKwcw0FaQj5Z/gI/HC+IlIGWrZAWVbx7yAOy7xSgRjgoJYUv96QaGU/fZTspWCrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=pwilPovl; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="pwilPovl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=YPWssQlTXDSI3t2RATSpzlw/gpxFS97PzwjrGfpMDqo=; b=pwilPovlCz6FBoE5
	nOiJ6YA6hLO54HEkwam9HCe4eXzPSaAmGyybDMHve9EfMYirQSY0ddTbb1UivfqmiVezTM2bIwKxS
	EU0kLZc85dlMBIwpj0QxiPXpSW7t3KyD2Kz0b8LgfPqXpCrDlww5d1mSU6Dt+BtOoyu4TKhWo6bBq
	546JzyeJowIESZhdlOaQda++twqu34MvWveR1Fl7aj8xgLV1akXCVnzgNh+qeAhSpeeD80l0Rtu3B
	tqqNdKE8hGQ5KZYv3vLvfy+f/igQ4JrP4AcE1GGQjN9omme4xahje8/mIZuTKY7iij4J89oIILOIv
	NQjYPd70078MQG7Yyw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uOPsA-008J5r-23;
	Sun, 08 Jun 2025 23:56:18 +0000
From: linux@treblig.org
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] usb: core: Remove unused usb_unlink_anchored_urbs
Date: Mon,  9 Jun 2025 00:56:17 +0100
Message-ID: <20250608235617.200731-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

usb_unlink_anchored_urbs() has been unused since it's last use was
removed in 2009 by
commit 9b9c5aaeedfd ("ar9170: xmit code revamp")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 Documentation/driver-api/usb/anchors.rst | 11 ---------
 drivers/usb/core/urb.c                   | 29 +++---------------------
 include/linux/usb.h                      |  1 -
 3 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/Documentation/driver-api/usb/anchors.rst b/Documentation/driver-api/usb/anchors.rst
index 4b248e691bd6..5a93d171e76c 100644
--- a/Documentation/driver-api/usb/anchors.rst
+++ b/Documentation/driver-api/usb/anchors.rst
@@ -45,17 +45,6 @@ This function kills all URBs associated with an anchor. The URBs
 are called in the reverse temporal order they were submitted.
 This way no data can be reordered.
 
-:c:func:`usb_unlink_anchored_urbs`
-----------------------------------
-
-
-This function unlinks all URBs associated with an anchor. The URBs
-are processed in the reverse temporal order they were submitted.
-This is similar to :c:func:`usb_kill_anchored_urbs`, but it will not sleep.
-Therefore no guarantee is made that the URBs have been unlinked when
-the call returns. They may be unlinked later but will be unlinked in
-finite time.
-
 :c:func:`usb_scuttle_anchored_urbs`
 -----------------------------------
 
diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 5e52a35486af..0e58a8531d6e 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -597,10 +597,9 @@ EXPORT_SYMBOL_GPL(usb_submit_urb);
  * code).
  *
  * Drivers should not call this routine or related routines, such as
- * usb_kill_urb() or usb_unlink_anchored_urbs(), after their disconnect
- * method has returned.  The disconnect function should synchronize with
- * a driver's I/O routines to insure that all URB-related activity has
- * completed before it returns.
+ * usb_kill_urb(), after their disconnect method has returned. The
+ * disconnect function should synchronize with a driver's I/O routines
+ * to insure that all URB-related activity has completed before it returns.
  *
  * This request is asynchronous, however the HCD might call the ->complete()
  * callback during unlink. Therefore when drivers call usb_unlink_urb(), they
@@ -890,28 +889,6 @@ void usb_unpoison_anchored_urbs(struct usb_anchor *anchor)
 	spin_unlock_irqrestore(&anchor->lock, flags);
 }
 EXPORT_SYMBOL_GPL(usb_unpoison_anchored_urbs);
-/**
- * usb_unlink_anchored_urbs - asynchronously cancel transfer requests en masse
- * @anchor: anchor the requests are bound to
- *
- * this allows all outstanding URBs to be unlinked starting
- * from the back of the queue. This function is asynchronous.
- * The unlinking is just triggered. It may happen after this
- * function has returned.
- *
- * This routine should not be called by a driver after its disconnect
- * method has returned.
- */
-void usb_unlink_anchored_urbs(struct usb_anchor *anchor)
-{
-	struct urb *victim;
-
-	while ((victim = usb_get_from_anchor(anchor)) != NULL) {
-		usb_unlink_urb(victim);
-		usb_put_urb(victim);
-	}
-}
-EXPORT_SYMBOL_GPL(usb_unlink_anchored_urbs);
 
 /**
  * usb_anchor_suspend_wakeups
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 1b2545b4363b..e8662843e68c 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1780,7 +1780,6 @@ extern void usb_block_urb(struct urb *urb);
 extern void usb_kill_anchored_urbs(struct usb_anchor *anchor);
 extern void usb_poison_anchored_urbs(struct usb_anchor *anchor);
 extern void usb_unpoison_anchored_urbs(struct usb_anchor *anchor);
-extern void usb_unlink_anchored_urbs(struct usb_anchor *anchor);
 extern void usb_anchor_suspend_wakeups(struct usb_anchor *anchor);
 extern void usb_anchor_resume_wakeups(struct usb_anchor *anchor);
 extern void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor);
-- 
2.49.0

