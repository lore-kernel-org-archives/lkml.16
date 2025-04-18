Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FFD20767E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744983346; cv=none; b=g4sozrT9y5C3xAih+cTrMhqJbPWnOOvbV+L8McI9VwHPdWjVxbakU5eGiNjjtJgzSYnMUG+RHjSu8ITDlg0kXiQTTeGExW1yYcSNO33DxdYHbUdeJxjOZ4DpTuQv0v8yL4h2di9qA1MGYcZ9zs1lhYmlHUQwy4tQbFODplkk0+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744983346; c=relaxed/simple;
	bh=9Z9ofTBrJGalY51Q4gAy5WjR6yYQ+GQUnqWpo58FVdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKp+IYk3UZETl++pi5nehIOCnjqnLvNuybC+wVbq737UMLN2zR4VqUla7In9eQImfS0SKkZwAnxb/lyR9ZMxr8n1HltIFcyhaiiLvE+vmH2tj+ngE8SptjcYpemteuJa3QCh+nclTW06ofRPu4JINOl1IWbzmEq/cwpUhC1Ejh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMaPb2c7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMaPb2c7"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1084700f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983342; x=1745588142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MV8job60Y82iwEFYBAVEfpxYvg7U1JMjX/bkSgrnh50=;
        b=lMaPb2c7Guc/DKMeeT2QW9T+q8hfLoBzuLEH/LrDZwPk2EEdD9c8uXKpT9EBh91uA9
         I/Rk5LF2vBKFvU44v6vXq9zQfPZj5wH0Whje9CYDBockt8ogg9fjTy4NGob38Qdg9Ulz
         b2mfhqESIe8EDc8UFTGf/5nXb/eR15P6ysTZYIV5F2pztON1CNq8N9fD2T19NoA9P73G
         Ek9shZwSxuu7+MaDdU6foP22lKAlk9KfiPOB4a1Ccqdb6OPXVhRyEM+pHwu7cCF9u0zI
         lO01fvmXi84XvKc0U8Z+whm+9hRUViSlgtGMH67AVaNO/LbIWNQsT28fLHBAqg5ktQXo
         9Y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983342; x=1745588142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV8job60Y82iwEFYBAVEfpxYvg7U1JMjX/bkSgrnh50=;
        b=EFnx3A/B/twksRnodeK7TG4QzfeLLU6cCncRgKHWL7JjOTw/PV7OeBonymep5ZD5QT
         22B2rraK7ST56pADtApCAO/P3zvelY3Hlz6kfjEpM6gEtbTANvmSCN5kwHVaFXYON3O0
         IjU/fMoLYdo5zwR3REc/zaWEOkMZFAw9ULUqB6cViCrN4FFSt7MNYhrFvPHhsUpyIycK
         uZIm/lcPm6imMSw+7CrstVfIyTSv6aj2Qn129gh5/SFL37R3/X16qhnz2ugBXUgpxR7W
         m8fJf1UGcCXv8FE4gEmcMfaV1J/5xPkCVLNCnrE+tD2Z6rKnjA29m82XpmVBweCO3Mwm
         NAtg==
X-Forwarded-Encrypted: i=1; AJvYcCXgNqp1S83aWD9tOPqChV0GSaHu/+liqrux/2+4l8R7GfJBIDAGkGehq+sxYOy14kjdozbIvY36cb4mkbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+EZ7Vyq7lA3mfflTqHMhE3o4Yl0VygoHZCBaHMuwYVrDcK+wu
	HYpL3Du1dz19h7UmMkogjZTCDlRozbulMDmaSzrHHsdl6tYVy6JM
X-Gm-Gg: ASbGncv3FuNryexYU7Kt6CIijBf/JZKXFwDkLAE+LNye1Qkyfu1Lxb5L6/K07+5VhjJ
	NtkTLEzNyiWGnXSxGddXeThs0X8BoDWGGBtLLrQdgjfpOw/JnHs6hQJEWMkKn1N5d/Gow5BsM/W
	AY7D7CJm3exMyAjg6AxatbJBmwApuWUKFB0rg44eTYs4v1qoVhuchIdJzB0qA+K6jV7nQDP8ckD
	/ktsxjRwIOG4zHqC87ZrldorLAgl3BXjoO+75gGG76aPfluGdpyyLAUeuq7gNv0ta27eJyLJtMT
	uWENm1uMjNfntEgBxcku4hp3XRnI+F73CQzb27EpFQHsx4pBgSDqtk9y0PYSBwKQ860euMgVRgQ
	w
X-Google-Smtp-Source: AGHT+IHTqIe/uudBsLAGQYiM0KtQ/f0GY6fw4NZs9PovHw3QmwJerOZyvbOeuy3t3nN2+w7ynbUzhg==
X-Received: by 2002:a05:6000:1869:b0:391:952:c728 with SMTP id ffacd0b85a97d-39efba26158mr1840555f8f.4.1744983341915;
        Fri, 18 Apr 2025 06:35:41 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4330bfsm2791417f8f.23.2025.04.18.06.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:35:41 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V2] staging: gpib: Add return value to request_control
Date: Fri, 18 Apr 2025 15:35:37 +0200
Message-ID: <20250418133537.22491-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A number of drivers are unable to release control due to hardware or
software limitations. As request_system_control was defined as void,
no error could be signalled.

This patch changes the prototype of request_system_control to int and
adds the appropriate checking and returns. In the case that a board
cannot release control EINVAL is returned.  If a driver does not
implement request_system_control EPERM is returned.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
Changes v1->v2
   Simplify the patch by
   - testing for failure conditions first
   - keeping the diffs small
   - deferring corrections to the logic to other patches
   Adapt and reformat the commit message
   
 .../gpib/agilent_82350b/agilent_82350b.c      |  6 ++---
 .../gpib/agilent_82357a/agilent_82357a.c      | 22 +++++++++----------
 drivers/staging/gpib/cb7210/cb7210.c          |  4 ++--
 drivers/staging/gpib/cec/cec_gpib.c           |  4 ++--
 drivers/staging/gpib/common/gpib_os.c         |  4 +---
 drivers/staging/gpib/common/iblib.c           | 17 ++++++++++----
 drivers/staging/gpib/eastwood/fluke_gpib.c    |  4 ++--
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      |  4 ++--
 drivers/staging/gpib/gpio/gpib_bitbang.c      | 16 +++++++-------
 drivers/staging/gpib/hp_82335/hp82335.c       |  4 ++--
 drivers/staging/gpib/hp_82341/hp_82341.c      |  4 ++--
 drivers/staging/gpib/include/gpib_proto.h     |  2 +-
 drivers/staging/gpib/include/gpib_types.h     |  2 +-
 drivers/staging/gpib/include/nec7210.h        |  4 ++--
 drivers/staging/gpib/include/tms9914.h        |  4 ++--
 drivers/staging/gpib/ines/ines.h              |  2 +-
 drivers/staging/gpib/ines/ines_gpib.c         |  4 ++--
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        | 11 +++++-----
 drivers/staging/gpib/nec7210/nec7210.c        |  5 +++--
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  8 +++----
 drivers/staging/gpib/pc2/pc2_gpib.c           |  4 ++--
 drivers/staging/gpib/tms9914/tms9914.c        |  5 +++--
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   |  6 +++--
 23 files changed, 76 insertions(+), 70 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 14ff7f19c8f7..94bbb3b6576d 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -341,9 +341,7 @@ static int agilent_82350b_go_to_standby(struct gpib_board *board)
 	return tms9914_go_to_standby(board, &priv->tms9914_priv);
 }
 
-static void agilent_82350b_request_system_control(struct gpib_board *board,
-						  int request_control)
-
+static int agilent_82350b_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct agilent_82350b_priv *a_priv = board->private_data;
 
@@ -357,7 +355,7 @@ static void agilent_82350b_request_system_control(struct gpib_board *board,
 			writeb(0, a_priv->gpib_base + INTERNAL_CONFIG_REG);
 	}
 	writeb(a_priv->card_mode_bits, a_priv->gpib_base + CARD_MODE_REG);
-	tms9914_request_system_control(board, &a_priv->tms9914_priv, request_control);
+	return tms9914_request_system_control(board, &a_priv->tms9914_priv, request_control);
 }
 
 static void agilent_82350b_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 4728ec85caa8..454d46b8b677 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -756,9 +756,7 @@ static int agilent_82357a_go_to_standby(struct gpib_board *board)
 	return 0;
 }
 
-//FIXME should change prototype to return int
-static void agilent_82357a_request_system_control(struct gpib_board *board,
-						  int request_control)
+static int agilent_82357a_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
 	struct usb_device *usb_dev;
@@ -767,7 +765,7 @@ static void agilent_82357a_request_system_control(struct gpib_board *board,
 	int i = 0;
 
 	if (!a_priv->bus_interface)
-		return; // -ENODEV;
+		return -ENODEV;
 
 	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	/* 82357B needs bit to be set in 9914 AUXCR register */
@@ -776,9 +774,7 @@ static void agilent_82357a_request_system_control(struct gpib_board *board,
 		writes[i].value = AUX_RQC;
 		a_priv->hw_control_bits |= SYSTEM_CONTROLLER;
 	} else {
-		writes[i].value = AUX_RLC;
-		a_priv->is_cic = 0;
-		a_priv->hw_control_bits &= ~SYSTEM_CONTROLLER;
+		return -EINVAL;
 	}
 	++i;
 	writes[i].address = HW_CONTROL;
@@ -787,7 +783,7 @@ static void agilent_82357a_request_system_control(struct gpib_board *board,
 	retval = agilent_82357a_write_registers(a_priv, writes, i);
 	if (retval)
 		dev_err(&usb_dev->dev, "write_registers() returned error\n");
-	return;// retval;
+	return retval;
 }
 
 static void agilent_82357a_interface_clear(struct gpib_board *board, int assert)
@@ -1593,7 +1589,7 @@ static int agilent_82357a_driver_resume(struct usb_interface *interface)
 {
 	struct usb_device *usb_dev = interface_to_usbdev(interface);
 	struct gpib_board *board;
-	int i, retval;
+	int i, retval = 0;
 
 	mutex_lock(&agilent_82357a_hotplug_lock);
 
@@ -1604,8 +1600,10 @@ static int agilent_82357a_driver_resume(struct usb_interface *interface)
 				break;
 		}
 	}
-	if (i == MAX_NUM_82357A_INTERFACES)
+	if (i == MAX_NUM_82357A_INTERFACES) {
+		retval = -ENOENT;
 		goto resume_exit;
+	}
 
 	struct agilent_82357a_priv *a_priv = board->private_data;
 
@@ -1628,7 +1626,7 @@ static int agilent_82357a_driver_resume(struct usb_interface *interface)
 			return retval;
 		}
 		// set/unset system controller
-		agilent_82357a_request_system_control(board, board->master);
+		retval = agilent_82357a_request_system_control(board, board->master);
 		// toggle ifc if master
 		if (board->master) {
 			agilent_82357a_interface_clear(board, 1);
@@ -1646,7 +1644,7 @@ static int agilent_82357a_driver_resume(struct usb_interface *interface)
 resume_exit:
 	mutex_unlock(&agilent_82357a_hotplug_lock);
 
-	return 0;
+	return retval;
 }
 
 static struct usb_driver agilent_82357a_bus_driver = {
diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 54c037aabc26..c686896bb088 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -578,7 +578,7 @@ static int cb7210_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void cb7210_request_system_control(struct gpib_board *board, int request_control)
+static int cb7210_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct cb7210_priv *priv = board->private_data;
 	struct nec7210_priv *nec_priv = &priv->nec7210_priv;
@@ -589,7 +589,7 @@ static void cb7210_request_system_control(struct gpib_board *board, int request_
 		priv->hs_mode_bits &= ~HS_SYS_CONTROL;
 
 	cb7210_write_byte(priv, priv->hs_mode_bits, HS_MODE);
-	nec7210_request_system_control(board, nec_priv, request_control);
+	return nec7210_request_system_control(board, nec_priv, request_control);
 }
 
 static void cb7210_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 737d78736ea5..e8736cbf50e3 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -83,11 +83,11 @@ static int cec_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void cec_request_system_control(struct gpib_board *board, int request_control)
+static int cec_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct cec_priv *priv = board->private_data;
 
-	nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
+	return nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
 }
 
 static void cec_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 163d9a64e7df..d87025aadccc 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1988,9 +1988,7 @@ static int request_system_control_ioctl(struct gpib_board *board, unsigned long
 	if (retval)
 		return -EFAULT;
 
-	ibrsc(board, request_control);
-
-	return 0;
+	return ibrsc(board, request_control);
 }
 
 static int t1_delay_ioctl(struct gpib_board *board, unsigned long arg)
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index a8a215d4ffe4..7a44517464ab 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -422,12 +422,21 @@ int ibsic(struct gpib_board *board, unsigned int usec_duration)
 	return 0;
 }
 
-	/* FIXME make int */
-void ibrsc(struct gpib_board *board, int request_control)
+int ibrsc(struct gpib_board *board, int request_control)
 {
+	int retval;
+
+	if (!board->interface->request_system_control)
+		return -EPERM;
+
+	retval = board->interface->request_system_control(board, request_control);
+
+	if (retval)
+		return retval;
+
 	board->master = request_control != 0;
-	if (board->interface->request_system_control)
-		board->interface->request_system_control(board, request_control);
+
+	return  0;
 }
 
 /*
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index f6a84200e3a1..491356433249 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -94,12 +94,12 @@ static int fluke_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void fluke_request_system_control(struct gpib_board *board, int request_control)
+static int fluke_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct fluke_priv *priv = board->private_data;
 	struct nec7210_priv *nec_priv = &priv->nec7210_priv;
 
-	nec7210_request_system_control(board, nec_priv, request_control);
+	return nec7210_request_system_control(board, nec_priv, request_control);
 }
 
 static void fluke_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index ca07e6ecb0a8..4138f3d2bae7 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -86,12 +86,12 @@ static int fmh_gpib_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void fmh_gpib_request_system_control(struct gpib_board *board, int request_control)
+static int fmh_gpib_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct fmh_priv *priv = board->private_data;
 	struct nec7210_priv *nec_priv = &priv->nec7210_priv;
 
-	nec7210_request_system_control(board, nec_priv, request_control);
+	return nec7210_request_system_control(board, nec_priv, request_control);
 }
 
 static void fmh_gpib_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 0da718389182..9670522fe36e 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -883,16 +883,16 @@ static int bb_go_to_standby(struct gpib_board *board)
 	return 0;
 }
 
-static void bb_request_system_control(struct gpib_board *board, int request_control)
+static int bb_request_system_control(struct gpib_board *board, int request_control)
 {
 	dbg_printk(2, "%d\n", request_control);
-	if (request_control) {
-		set_bit(CIC_NUM, &board->status);
-		// drive DAV & EOI false, enable NRFD & NDAC irqs
-		SET_DIR_WRITE(board->private_data);
-	} else {
-		clear_bit(CIC_NUM, &board->status);
-	}
+	if (!request_control)
+		return -EINVAL;
+
+	set_bit(CIC_NUM, &board->status);
+	// drive DAV & EOI false, enable NRFD & NDAC irqs
+	SET_DIR_WRITE(board->private_data);
+	return 0;
 }
 
 static void bb_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 3d08d2f726e1..d0e47ef77c87 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -68,11 +68,11 @@ static int hp82335_go_to_standby(struct gpib_board *board)
 	return tms9914_go_to_standby(board, &priv->tms9914_priv);
 }
 
-static void hp82335_request_system_control(struct gpib_board *board, int request_control)
+static int hp82335_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct hp82335_priv *priv = board->private_data;
 
-	tms9914_request_system_control(board, &priv->tms9914_priv, request_control);
+	return tms9914_request_system_control(board, &priv->tms9914_priv, request_control);
 }
 
 static void hp82335_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 41accfdbc49a..1b0822b2a3b8 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -294,7 +294,7 @@ static int hp_82341_go_to_standby(struct gpib_board *board)
 	return tms9914_go_to_standby(board, &priv->tms9914_priv);
 }
 
-static void hp_82341_request_system_control(struct gpib_board *board, int request_control)
+static int hp_82341_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -303,7 +303,7 @@ static void hp_82341_request_system_control(struct gpib_board *board, int reques
 	else
 		priv->mode_control_bits &= ~SYSTEM_CONTROLLER_BIT;
 	outb(priv->mode_control_bits, priv->iobase[0] + MODE_CONTROL_STATUS_REG);
-	tms9914_request_system_control(board, &priv->tms9914_priv, request_control);
+	return tms9914_request_system_control(board, &priv->tms9914_priv, request_control);
 }
 
 static void hp_82341_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 1c8e5955b9ce..42e736e3b7cd 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -31,7 +31,7 @@ int iblines(const struct gpib_board *board, short *lines);
 int ibrd(struct gpib_board *board, u8 *buf, size_t length, int *end_flag, size_t *bytes_read);
 int ibrpp(struct gpib_board *board, u8 *buf);
 int ibrsv2(struct gpib_board *board, u8 status_byte, int new_reason_for_service);
-void ibrsc(struct gpib_board *board, int request_control);
+int ibrsc(struct gpib_board *board, int request_control);
 int ibsic(struct gpib_board *board, unsigned int usec_duration);
 int ibsre(struct gpib_board *board, int enable);
 int ibpad(struct gpib_board *board, unsigned int addr);
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 2af4574d400c..db040c80d778 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -100,7 +100,7 @@ struct gpib_interface {
 	 */
 	int (*go_to_standby)(struct gpib_board *board);
 	/* request/release control of the IFC and REN lines (system controller) */
-	void (*request_system_control)(struct gpib_board *board, int request_control);
+	int (*request_system_control)(struct gpib_board *board, int request_control);
 	/*
 	 * Asserts or de-asserts 'interface clear' (IFC) depending on
 	 * boolean value of 'assert'
diff --git a/drivers/staging/gpib/include/nec7210.h b/drivers/staging/gpib/include/nec7210.h
index 97a56f74258b..312217b4580e 100644
--- a/drivers/staging/gpib/include/nec7210.h
+++ b/drivers/staging/gpib/include/nec7210.h
@@ -86,8 +86,8 @@ int nec7210_command(struct gpib_board *board, struct nec7210_priv *priv, u8 *buf
 		    size_t length, size_t *bytes_written);
 int nec7210_take_control(struct gpib_board *board, struct nec7210_priv *priv, int syncronous);
 int nec7210_go_to_standby(struct gpib_board *board, struct nec7210_priv *priv);
-void nec7210_request_system_control(struct gpib_board *board,
-				    struct nec7210_priv *priv, int request_control);
+int nec7210_request_system_control(struct gpib_board *board,
+				   struct nec7210_priv *priv, int request_control);
 void nec7210_interface_clear(struct gpib_board *board, struct nec7210_priv *priv, int assert);
 void nec7210_remote_enable(struct gpib_board *board, struct nec7210_priv *priv, int enable);
 int nec7210_enable_eos(struct gpib_board *board, struct nec7210_priv *priv, u8 eos_bytes,
diff --git a/drivers/staging/gpib/include/tms9914.h b/drivers/staging/gpib/include/tms9914.h
index 352fc516fd40..50a9d3b22619 100644
--- a/drivers/staging/gpib/include/tms9914.h
+++ b/drivers/staging/gpib/include/tms9914.h
@@ -93,8 +93,8 @@ int tms9914_take_control(struct gpib_board *board, struct tms9914_priv *priv, in
 int tms9914_take_control_workaround(struct gpib_board *board, struct tms9914_priv *priv,
 				    int syncronous);
 int tms9914_go_to_standby(struct gpib_board *board, struct tms9914_priv *priv);
-void tms9914_request_system_control(struct gpib_board *board, struct tms9914_priv *priv,
-				    int request_control);
+int tms9914_request_system_control(struct gpib_board *board, struct tms9914_priv *priv,
+				   int request_control);
 void tms9914_interface_clear(struct gpib_board *board, struct tms9914_priv *priv, int assert);
 void tms9914_remote_enable(struct gpib_board *board, struct tms9914_priv *priv, int enable);
 int tms9914_enable_eos(struct gpib_board *board, struct tms9914_priv *priv, u8 eos_bytes,
diff --git a/drivers/staging/gpib/ines/ines.h b/drivers/staging/gpib/ines/ines.h
index 396cf0bd9ad1..07b82f790c4b 100644
--- a/drivers/staging/gpib/ines/ines.h
+++ b/drivers/staging/gpib/ines/ines.h
@@ -47,7 +47,7 @@ int ines_accel_write(struct gpib_board *board, u8 *buffer, size_t length,
 int ines_command(struct gpib_board *board, u8 *buffer, size_t length, size_t *bytes_written);
 int ines_take_control(struct gpib_board *board, int synchronous);
 int ines_go_to_standby(struct gpib_board *board);
-void ines_request_system_control(struct gpib_board *board, int request_control);
+int ines_request_system_control(struct gpib_board *board, int request_control);
 void ines_interface_clear(struct gpib_board *board, int assert);
 void ines_remote_enable(struct gpib_board *board, int enable);
 int ines_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits);
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index bf830defcad3..49947ac30feb 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -441,11 +441,11 @@ int ines_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-void ines_request_system_control(struct gpib_board *board, int request_control)
+int ines_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct ines_priv *priv = board->private_data;
 
-	nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
+	return nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
 }
 
 void ines_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 19127ee906c2..2e315c7756c4 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -911,15 +911,14 @@ static void usb_gpib_remote_enable(struct gpib_board *board, int enable)
 
 /* request_system_control */
 
-static void usb_gpib_request_system_control(struct gpib_board *board,
-					    int request_control)
+static int usb_gpib_request_system_control(struct gpib_board *board, int request_control)
 {
-	if (request_control)
-		set_bit(CIC_NUM, &board->status);
-	else
-		clear_bit(CIC_NUM, &board->status);
+	if (!request_control)
+		return -EINVAL;
 
+	set_bit(CIC_NUM, &board->status);
 	DIA_LOG(1, "done with %d -> %lx\n", request_control, board->status);
+	return 0;
 }
 
 /* take_control */
diff --git a/drivers/staging/gpib/nec7210/nec7210.c b/drivers/staging/gpib/nec7210/nec7210.c
index e68361d213ee..34a1cae4f486 100644
--- a/drivers/staging/gpib/nec7210/nec7210.c
+++ b/drivers/staging/gpib/nec7210/nec7210.c
@@ -332,14 +332,15 @@ int nec7210_go_to_standby(struct gpib_board *board, struct nec7210_priv *priv)
 }
 EXPORT_SYMBOL(nec7210_go_to_standby);
 
-void nec7210_request_system_control(struct gpib_board *board, struct nec7210_priv *priv,
-				    int request_control)
+int nec7210_request_system_control(struct gpib_board *board, struct nec7210_priv *priv,
+				   int request_control)
 {
 	if (request_control == 0) {
 		write_byte(priv, AUX_CREN, AUXMR);
 		write_byte(priv, AUX_CIFC, AUXMR);
 		write_byte(priv, AUX_DSC, AUXMR);
 	}
+	return 0;
 }
 EXPORT_SYMBOL(nec7210_request_system_control);
 
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index d5b281fa8b37..9ec850c4749f 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -1055,7 +1055,7 @@ static int ni_usb_go_to_standby(struct gpib_board *board)
 	return 0;
 }
 
-static void ni_usb_request_system_control(struct gpib_board *board, int request_control)
+static int ni_usb_request_system_control(struct gpib_board *board, int request_control)
 {
 	int retval;
 	struct ni_usb_priv *ni_priv = board->private_data;
@@ -1065,7 +1065,7 @@ static void ni_usb_request_system_control(struct gpib_board *board, int request_
 	unsigned int ibsta;
 
 	if (!ni_priv->bus_interface)
-		return; // -ENODEV;
+		return -ENODEV;
 	usb_dev = interface_to_usbdev(ni_priv->bus_interface);
 	if (request_control) {
 		writes[i].device = NIUSB_SUBDEV_TNT4882;
@@ -1097,12 +1097,12 @@ static void ni_usb_request_system_control(struct gpib_board *board, int request_
 	retval = ni_usb_write_registers(ni_priv, writes, i, &ibsta);
 	if (retval < 0) {
 		dev_err(&usb_dev->dev, "register write failed, retval=%i\n", retval);
-		return; // retval;
+		return retval;
 	}
 	if (!request_control)
 		ni_priv->ren_state = 0;
 	ni_usb_soft_update_status(board, ibsta, 0);
-	return; // 0;
+	return 0;
 }
 
 //FIXME maybe the interface should have a "pulse interface clear" function that can return an error?
diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index fd191d24d7a6..2282492025b7 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -128,11 +128,11 @@ static int pc2_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void pc2_request_system_control(struct gpib_board *board, int request_control)
+static int pc2_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct pc2_priv *priv = board->private_data;
 
-	nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
+	return nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
 }
 
 static void pc2_interface_clear(struct gpib_board *board, int assert)
diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
index 9208c50d9c75..04d57108efc7 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -118,8 +118,8 @@ void tms9914_remote_enable(struct gpib_board *board, struct tms9914_priv *priv,
 }
 EXPORT_SYMBOL_GPL(tms9914_remote_enable);
 
-void tms9914_request_system_control(struct gpib_board *board, struct tms9914_priv *priv,
-				    int request_control)
+int tms9914_request_system_control(struct gpib_board *board, struct tms9914_priv *priv,
+				   int request_control)
 {
 	if (request_control) {
 		write_byte(priv, AUX_RQC, AUXCR);
@@ -127,6 +127,7 @@ void tms9914_request_system_control(struct gpib_board *board, struct tms9914_pri
 		clear_bit(CIC_NUM, &board->status);
 		write_byte(priv, AUX_RLC, AUXCR);
 	}
+	return 0;
 }
 EXPORT_SYMBOL_GPL(tms9914_request_system_control);
 
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index 9f7f8b311da3..a17b69e34986 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -645,19 +645,21 @@ static int tnt4882_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-static void tnt4882_request_system_control(struct gpib_board *board, int request_control)
+static int tnt4882_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct tnt4882_priv *priv = board->private_data;
+	int retval;
 
 	if (request_control) {
 		tnt_writeb(priv, SETSC, CMDR);
 		udelay(1);
 	}
-	nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
+	retval = nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
 	if (!request_control) {
 		tnt_writeb(priv, CLRSC, CMDR);
 		udelay(1);
 	}
+	return retval;
 }
 
 static void tnt4882_interface_clear(struct gpib_board *board, int assert)
-- 
2.49.0

