Received: from out.smtpout.orange.fr (out-70.smtpout.orange.fr [193.252.22.70])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157C913AD1C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744439154; cv=none; b=I/uyJVhFG3mHajUI4a694U2wsmK16O30fnpAMsGZN3ySkhr5BJhP8WXblMfC7ns4Qz2G8rAqCRJzRbewg+YLtQfCBzA9gn/Nk2vsSk2Hq/XcH3BzAWKo2JYJyevEja2eFW3JUeA4gdSwZNTvhstEvoMi+DOsRry4bg1e1vMg4NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744439154; c=relaxed/simple;
	bh=325t6xAI6HmPt2h7UuYsI0IH+8YEuV8oarfXrv538hU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hq3litnPucBWsP/KjqysmoT0YHyKHVqeO9+iKOJl0o76NPFYni4Nt3Uz2KO2KefhxYhv3To61GPfnfOcN/6p9E6odzy1USW0oVQKw5aByoh/FfCYy5rjTIfmDqWGRSCidgJJzUFVqlHoQThX7xZTVBIsWqoHiPrHMixLJpslN0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=nC9QTDHV; arc=none smtp.client-ip=193.252.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="nC9QTDHV"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3UI4u7H5JdZ1m3UIFuovBG; Sat, 12 Apr 2025 08:24:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744439084;
	bh=BTYeDY62fAwGNjpwRghfOx+adz/TljBBiQP6TNR/L8s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nC9QTDHVMh3HL0J3MbHTniIiBDQTSsxSVo0cYOdzPhG7ABgGg3kBi5+/Q3f/9OMwZ
	 E4m3Xq501lgApdhdbyewjgBfIIKfuABSTyA3PfU7MN5aV2d6Pr1jZ+ZiI2hnZa7Pm2
	 Q4wUba9+x3CaB55rM3cptNep11f1EkANOQ7Bj0tTlr5H8wLHl8LBiYraW5JRzRpt7A
	 tXAoKVsrk0S6f5vk3eflFyHRV+Kwzs5sk7IjWICoNv4S/iTVwqrtfai4uMIUj9CFXW
	 W/bBo3O3o/3BCXtCYEL/70nLDmbpj8q04l70OecyRM9NK0RqZeJTPn756+52HHlx4m
	 0Bjr+BqLXQn6A==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:24:44 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/16] staging: gpib: common: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:21:55 -0700
Message-ID: <2ffeae1761ba77526e6aa7188f07d25a2f9a1950.1744438358.git.paul.retourne@orange.fr>
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
 drivers/staging/gpib/common/gpib_os.c | 47 +++++++++++++++++----------
 drivers/staging/gpib/common/iblib.c   | 19 +++++++----
 2 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 8456b97290b8..12cd91a4c677 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -119,7 +119,8 @@ int io_timed_out(struct gpib_board *board)
 	return 0;
 }
 
-/* this is a function instead of a constant because of Suse
+/*
+ * this is a function instead of a constant because of Suse
  * defining HZ to be a function call to get_hz()
  */
 static inline int pseudo_irq_period(void)
@@ -291,7 +292,8 @@ int autopoll_all_devices(struct gpib_board *board)
 	}
 
 	dev_dbg(board->gpib_dev, "complete\n");
-	/* need to wake wait queue in case someone is
+	/*
+	 * need to wake wait queue in case someone is
 	 * waiting on RQS
 	 */
 	wake_up_interruptible(&board->wait);
@@ -665,8 +667,9 @@ long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		retval = board_info_ioctl(board, arg);
 		goto done;
 	case IBMUTEX:
-		/* Need to unlock board->big_gpib_mutex before potentially locking board->user_mutex
-		 *  to maintain consistent locking order
+		/*
+		 * Need to unlock board->big_gpib_mutex before potentially locking board->user_mutex
+		 * to maintain consistent locking order
 		 */
 		mutex_unlock(&board->big_gpib_mutex);
 		return mutex_ioctl(board, file_priv, arg);
@@ -736,8 +739,9 @@ long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		retval = take_control_ioctl(board, arg);
 		goto done;
 	case IBCMD:
-		/* IO ioctls can take a long time, we need to unlock board->big_gpib_mutex
-		 *  before we call them.
+		/*
+		 * IO ioctls can take a long time, we need to unlock board->big_gpib_mutex
+		 * before we call them.
 		 */
 		mutex_unlock(&board->big_gpib_mutex);
 		return command_ioctl(file_priv, board, arg);
@@ -760,8 +764,9 @@ long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		retval = query_board_rsv_ioctl(board, arg);
 		goto done;
 	case IBRD:
-		/* IO ioctls can take a long time, we need to unlock board->big_gpib_mutex
-		 *  before we call them.
+		/*
+		 * IO ioctls can take a long time, we need to unlock board->big_gpib_mutex
+		 * before we call them.
 		 */
 		mutex_unlock(&board->big_gpib_mutex);
 		return read_ioctl(file_priv, board, arg);
@@ -790,8 +795,9 @@ long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		retval = timeout_ioctl(board, arg);
 		goto done;
 	case IBWRT:
-		/* IO ioctls can take a long time, we need to unlock board->big_gpib_mutex
-		 *  before we call them.
+		/*
+		 * IO ioctls can take a long time, we need to unlock board->big_gpib_mutex
+		 * before we call them.
 		 */
 		mutex_unlock(&board->big_gpib_mutex);
 		return write_ioctl(file_priv, board, arg);
@@ -913,7 +919,8 @@ static int read_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
 	}
 	read_cmd.completed_transfer_count = read_cmd.requested_transfer_count - remain;
 	read_cmd.end = end_flag;
-	/* suppress errors (for example due to timeout or interruption by device clear)
+	/*
+	 * suppress errors (for example due to timeout or interruption by device clear)
 	 * if all bytes got sent.  This prevents races that can occur in the various drivers
 	 * if a device receives a device clear immediately after a transfer completes and
 	 * the driver code wasn't careful enough to handle that case.
@@ -967,10 +974,11 @@ static int command_ioctl(gpib_file_private_t *file_priv,
 	if (!access_ok(userbuf, remain))
 		return -EFAULT;
 
-	/* Write buffer loads till we empty the user supplied buffer.
-	 *	Call drivers at least once, even if remain is zero, in
-	 *	order to allow them to insure previous commands were
-	 *	completely finished, in the case of a restarted ioctl.
+	/*
+	 * Write buffer loads till we empty the user supplied buffer.
+	 * Call drivers at least once, even if remain is zero, in
+	 * order to allow them to insure previous commands were
+	 * completely finished, in the case of a restarted ioctl.
 	 */
 
 	atomic_set(&desc->io_in_progress, 1);
@@ -1068,7 +1076,8 @@ static int write_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
 			break;
 	}
 	write_cmd.completed_transfer_count = write_cmd.requested_transfer_count - remain;
-	/* suppress errors (for example due to timeout or interruption by device clear)
+	/*
+	 * suppress errors (for example due to timeout or interruption by device clear)
 	 * if all bytes got sent.  This prevents races that can occur in the various drivers
 	 * if a device receives a device clear immediately after a transfer completes and
 	 * the driver code wasn't careful enough to handle that case.
@@ -1116,7 +1125,8 @@ static int increment_open_device_count(struct gpib_board *board, struct list_hea
 	struct list_head *list_ptr;
 	gpib_status_queue_t *device;
 
-	/* first see if address has already been opened, then increment
+	/*
+	 * first see if address has already been opened, then increment
 	 * open count
 	 */
 	for (list_ptr = head->next; list_ptr != head; list_ptr = list_ptr->next) {
@@ -1242,7 +1252,8 @@ static int open_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned
 	if (retval < 0)
 		return retval;
 
-	/* clear stuck srq state, since we may be able to find service request on
+	/*
+	 * clear stuck srq state, since we may be able to find service request on
 	 * the new device
 	 */
 	atomic_set(&board->stuck_srq, 0);
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index b297261818f2..b05c26d47aa0 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -33,9 +33,10 @@ int ibcac(struct gpib_board *board, int sync, int fallback_to_async)
 		return 0;
 
 	if (sync && (status & LACS) == 0)
-		/* tcs (take control synchronously) can only possibly work when
-		 *  controller is listener.  Error code also needs to be -ETIMEDOUT
-		 *  or it will giveout without doing fallback.
+		/*
+		 * tcs (take control synchronously) can only possibly work when
+		 * controller is listener.  Error code also needs to be -ETIMEDOUT
+		 * or it will giveout without doing fallback.
 		 */
 		retval = -ETIMEDOUT;
 	else
@@ -50,7 +51,8 @@ int ibcac(struct gpib_board *board, int sync, int fallback_to_async)
 	return retval;
 }
 
-/* After ATN is asserted, it should cause any connected devices
+/*
+ * After ATN is asserted, it should cause any connected devices
  * to start listening for command bytes and leave acceptor idle state.
  * So if ATN is asserted and neither NDAC or NRFD are asserted,
  * then there are no devices and ibcmd should error out immediately.
@@ -218,7 +220,8 @@ int ibonline(struct gpib_board *board)
 		board->interface->detach(board);
 		return retval;
 	}
-	/* nios2nommu on 2.6.11 uclinux kernel has weird problems
+	/*
+	 * nios2nommu on 2.6.11 uclinux kernel has weird problems
 	 * with autospoll thread causing huge slowdowns
 	 */
 #ifndef CONFIG_NIOS2
@@ -313,7 +316,8 @@ int ibrd(struct gpib_board *board, uint8_t *buf, size_t length, int *end_flag, s
 		if (retval < 0)
 			return retval;
 	}
-	/* XXX resetting timer here could cause timeouts take longer than they should,
+	/*
+	 * XXX resetting timer here could cause timeouts take longer than they should,
 	 * since read_ioctl calls this
 	 * function in a loop, there is probably a similar problem with writes/commands
 	 */
@@ -514,7 +518,8 @@ int general_ibstatus(struct gpib_board *board, const gpib_status_queue_t *device
 
 	if (board->private_data) {
 		status = board->interface->update_status(board, clear_mask);
-		/* XXX should probably stop having drivers use TIMO bit in
+		/*
+		 * XXX should probably stop having drivers use TIMO bit in
 		 * board->status to avoid confusion
 		 */
 		status &= ~TIMO;
-- 
2.49.0

