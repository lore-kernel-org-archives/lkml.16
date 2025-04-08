Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CB9257443
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154749; cv=none; b=AKHvIfidyKWWaeKU+CDSLZ60YejmyyQcjGqWsQfeiVowP4tWhwVVldFEjGzCOS6FX1rE+3vQxyVD4ZC622dTFh2SKfzRFMXX20jCTiOyA7TNfuTzAB1FH0ONkj2XOyZuX1slZsRC+amJjTb8hALJuN5vkwkzMWDcbSjBaZB1Ieg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154749; c=relaxed/simple;
	bh=Lmctd6vpHrfJUTj3ifUWKkU/sArZCAoIqbGi/Med02Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jL0KP/4uq2Z+kv3ZDrFHYSbwZFJBZHjNwRIjyiSxBHnhcVtW1pk3oijB248sm77w0Ms1UEbIAcejnQOds5rPkxi2pwSNZ0rt0OuakoCJAJqkiR9NzjaqNwAG/SePXIRRybONXkv53coh/w+9s15/9Y1ZiNwTNFOfMUBbw5DJLz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=io+gw6dg; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="io+gw6dg"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227a8cdd241so71535875ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154747; x=1744759547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MoK6FPlVFbuKd+bgN/UwDHVwPNikkjjLk9d6W5WBjg=;
        b=io+gw6dgsm3usjF3zGq/eGqpmiuprfMv+fmbTZDILV6EgPIIxB4As/7f4YS9vudu7A
         rcYkjyMJThj5PdgEbNhRFoqZQKb6TEiZzbjggVq20V8a0y8f76N0R8hgtZpFgmTOTunj
         7fJWBDVypXK1Ogh41MM+lq5hUk8A27yYQzhd42idkiJtBlT9r/GBboFwzj4UKeD25vPD
         ythnHir9FyXfi9T8o+EMcoKigDS1XzSDKThfFsXC/28KMU7aP/Kalf6KeVeFHnEn4v2N
         ZHRzs+8syAXkoHpWk5h/oeeHMNNSlWmZuR8xpJzX+s8csg2P8KC0FZBmjdBXfs9jk0Nw
         lskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154747; x=1744759547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MoK6FPlVFbuKd+bgN/UwDHVwPNikkjjLk9d6W5WBjg=;
        b=BrCtGYgqTT9Pn3UgpVJz9whr7ix9crZRoFGRYjftF2hH7N+e/QLi74cfeJnElp2/Mq
         UZR8Bes9/v9DPyCahAzSzdhF2/jphJWRInbAd1b8HN03/j1oolASZqg0g9dKga+0cKTK
         0bTf+cP1vgaT70ifjg4JSBBXuTBDIe1QwTu80rK9PWiTDPp0WcHfOjHfTVcMGPzppyUZ
         2IDUZ5OEJ01hlMrBVfsPSUT2XzlZ9XUmGLQjtdfxV4rSUECU/0XXNPNNLy3oxi8ecvF4
         Jw5BOLE4nziVroCMjwbs37L4xIK/sKTW8sP3zW4BvtuZWPEAcN52sucl1fNS86/gNSey
         /lXw==
X-Forwarded-Encrypted: i=1; AJvYcCXNsdwJJ8PF9kEhWyOKyacVYyLo1DRZRekL36ykoHKtfFlJK7jqALpDUxCk5SIBGO9dLJ2ymoId2lrGRFU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/b1vjY9PIuKV0k/dL51r/y/q5pmK/Z0thTLbNEOaAfJIMGy2e
	2l5eEmpORV/j0OIeRktICtTIy6iLiwJibdWUeTt2A0QEzdL0eXl/2vVFU43tSA==
X-Gm-Gg: ASbGncvGXeL5jNh4IxHnpmekcCNguSDmAl8vftwaYZDcbiNzr+BkeaH1l68B2nszw0G
	QPEZIMgI2gRh4LqVbAU6HUypSCRkZIrVVyLpbDSLR/oFZCB1+Vverm1cG1kMqvdANjggbhWOeom
	wQJ/ZjrFhHIibQ3ER6J+LxvPAoBy2rIZTJ7Ul6rtQsNGyhAytfSze+vas6hd1bRUgKXXnqCiaHE
	fTsd/gYHdxvoqjMKrlu6Btz1ABtqGkusfj2ii7MjPHUbTuVilEC9pSZeX7ATQHD81jTEQHFx+h8
	gcrBzcdLL0GwCzyZqDV4SjPYzGBWBIB4CIrzs6HaXzt1gmkenxnhmpF3QRH6JHC+Yzg6LdZWLJF
	kqLV6kkxvPg==
X-Google-Smtp-Source: AGHT+IFWX5QMJi9HBKsf6eI3URaf8Mln6NBm+b8Pqz2yg9dB+B2ryEhNl8VacoYUHHJvA2n82ZHxzg==
X-Received: by 2002:a17:903:248:b0:223:517a:d2a3 with SMTP id d9443c01a7336-22ac29a69aemr12776565ad.17.1744154747108;
        Tue, 08 Apr 2025 16:25:47 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e066sm106849045ad.137.2025.04.08.16.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:46 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 7/7] staging: gpib: Remove typedef gpib_file_private_t
Date: Tue,  8 Apr 2025 23:25:35 +0000
Message-ID: <20250408232535.187528-8-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408232535.187528-1-matchstick@neverthere.org>
References: <20250408232535.187528-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing gpib_file_private_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c     | 61 ++++++++++++-----------
 drivers/staging/gpib/include/gpib_types.h |  4 +-
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 6aaf15ffb02b..8365eb293d0b 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -26,26 +26,27 @@ MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB base support");
 MODULE_ALIAS_CHARDEV_MAJOR(GPIB_CODE);
 
-static int board_type_ioctl(gpib_file_private_t *file_priv,
+static int board_type_ioctl(struct gpib_file_private *file_priv,
 			    struct gpib_board *board, unsigned long arg);
-static int read_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
+static int read_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		      unsigned long arg);
-static int write_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
+static int write_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		       unsigned long arg);
-static int command_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
+static int command_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 			 unsigned long arg);
 static int open_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned long arg);
 static int close_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned long arg);
 static int serial_poll_ioctl(struct gpib_board *board, unsigned long arg);
-static int wait_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board, unsigned long arg);
+static int wait_ioctl(struct gpib_file_private *file_priv,
+		      struct gpib_board *board, unsigned long arg);
 static int parallel_poll_ioctl(struct gpib_board *board, unsigned long arg);
 static int online_ioctl(struct gpib_board *board, unsigned long arg);
 static int remote_enable_ioctl(struct gpib_board *board, unsigned long arg);
 static int take_control_ioctl(struct gpib_board *board, unsigned long arg);
 static int line_status_ioctl(struct gpib_board *board, unsigned long arg);
-static int pad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int pad_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		     unsigned long arg);
-static int sad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int sad_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		     unsigned long arg);
 static int eos_ioctl(struct gpib_board *board, unsigned long arg);
 static int request_service_ioctl(struct gpib_board *board, unsigned long arg);
@@ -53,9 +54,9 @@ static int request_service2_ioctl(struct gpib_board *board, unsigned long arg);
 static int iobase_ioctl(struct gpib_board_config *config, unsigned long arg);
 static int irq_ioctl(struct gpib_board_config *config, unsigned long arg);
 static int dma_ioctl(struct gpib_board_config *config, unsigned long arg);
-static int autospoll_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int autospoll_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 			   unsigned long arg);
-static int mutex_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int mutex_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		       unsigned long arg);
 static int timeout_ioctl(struct gpib_board *board, unsigned long arg);
 static int status_bytes_ioctl(struct gpib_board *board, unsigned long arg);
@@ -71,7 +72,7 @@ static int event_ioctl(struct gpib_board *board, unsigned long arg);
 static int request_system_control_ioctl(struct gpib_board *board, unsigned long arg);
 static int t1_delay_ioctl(struct gpib_board *board, unsigned long arg);
 
-static int cleanup_open_devices(gpib_file_private_t *file_priv, struct gpib_board *board);
+static int cleanup_open_devices(struct gpib_file_private *file_priv, struct gpib_board *board);
 
 static int pop_gpib_event_nolock(struct gpib_board *board,
 				 struct gpib_event_queue *queue, short *event_type);
@@ -494,8 +495,8 @@ int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
 	return retval;
 }
 
-static struct gpib_descriptor *handle_to_descriptor(const gpib_file_private_t *file_priv,
-					       int handle)
+static struct gpib_descriptor *handle_to_descriptor(const struct gpib_file_private *file_priv,
+						    int handle)
 {
 	if (handle < 0 || handle >= GPIB_MAX_NUM_DESCRIPTORS) {
 		pr_err("gpib: invalid handle %i\n", handle);
@@ -505,7 +506,7 @@ static struct gpib_descriptor *handle_to_descriptor(const gpib_file_private_t *f
 	return file_priv->descriptors[handle];
 }
 
-static int init_gpib_file_private(gpib_file_private_t *priv)
+static int init_gpib_file_private(struct gpib_file_private *priv)
 {
 	memset(priv, 0, sizeof(*priv));
 	atomic_set(&priv->holding_mutex, 0);
@@ -524,7 +525,7 @@ int ibopen(struct inode *inode, struct file *filep)
 {
 	unsigned int minor = iminor(inode);
 	struct gpib_board *board;
-	gpib_file_private_t *priv;
+	struct gpib_file_private *priv;
 
 	if (minor >= GPIB_MAX_NUM_BOARDS) {
 		pr_err("gpib: invalid minor number of device file\n");
@@ -533,12 +534,12 @@ int ibopen(struct inode *inode, struct file *filep)
 
 	board = &board_array[minor];
 
-	filep->private_data = kmalloc(sizeof(gpib_file_private_t), GFP_KERNEL);
+	filep->private_data = kmalloc(sizeof(struct gpib_file_private), GFP_KERNEL);
 	if (!filep->private_data)
 		return -ENOMEM;
 
 	priv = filep->private_data;
-	init_gpib_file_private((gpib_file_private_t *)filep->private_data);
+	init_gpib_file_private((struct gpib_file_private *)filep->private_data);
 
 	if (board->use_count == 0) {
 		int retval;
@@ -562,7 +563,7 @@ int ibclose(struct inode *inode, struct file *filep)
 {
 	unsigned int minor = iminor(inode);
 	struct gpib_board *board;
-	gpib_file_private_t *priv = filep->private_data;
+	struct gpib_file_private *priv = filep->private_data;
 	struct gpib_descriptor *desc;
 
 	if (minor >= GPIB_MAX_NUM_BOARDS) {
@@ -608,7 +609,7 @@ long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 {
 	unsigned int minor = iminor(filep->f_path.dentry->d_inode);
 	struct gpib_board *board;
-	gpib_file_private_t *file_priv = filep->private_data;
+	struct gpib_file_private *file_priv = filep->private_data;
 	long retval = -ENOTTY;
 
 	if (minor >= GPIB_MAX_NUM_BOARDS) {
@@ -808,7 +809,7 @@ long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	return retval;
 }
 
-static int board_type_ioctl(gpib_file_private_t *file_priv,
+static int board_type_ioctl(struct gpib_file_private *file_priv,
 			    struct gpib_board *board, unsigned long arg)
 {
 	struct list_head *list_ptr;
@@ -860,7 +861,7 @@ static int board_type_ioctl(gpib_file_private_t *file_priv,
 	return -EINVAL;
 }
 
-static int read_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
+static int read_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		      unsigned long arg)
 {
 	read_write_ioctl_t read_cmd;
@@ -935,7 +936,7 @@ static int read_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
 	return read_ret;
 }
 
-static int command_ioctl(gpib_file_private_t *file_priv,
+static int command_ioctl(struct gpib_file_private *file_priv,
 			 struct gpib_board *board, unsigned long arg)
 {
 	read_write_ioctl_t cmd;
@@ -1019,7 +1020,7 @@ static int command_ioctl(gpib_file_private_t *file_priv,
 	return retval;
 }
 
-static int write_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
+static int write_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		       unsigned long arg)
 {
 	read_write_ioctl_t write_cmd;
@@ -1183,7 +1184,7 @@ static inline int decrement_open_device_count(struct gpib_board *board, struct l
 	return subtract_open_device_count(board, head, pad, sad, 1);
 }
 
-static int cleanup_open_devices(gpib_file_private_t *file_priv, struct gpib_board *board)
+static int cleanup_open_devices(struct gpib_file_private *file_priv, struct gpib_board *board)
 {
 	int retval = 0;
 	int i;
@@ -1212,7 +1213,7 @@ static int open_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned
 {
 	open_dev_ioctl_t open_dev_cmd;
 	int retval;
-	gpib_file_private_t *file_priv = filep->private_data;
+	struct gpib_file_private *file_priv = filep->private_data;
 	int i;
 
 	retval = copy_from_user(&open_dev_cmd, (void __user *)arg, sizeof(open_dev_cmd));
@@ -1261,7 +1262,7 @@ static int open_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned
 static int close_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned long arg)
 {
 	close_dev_ioctl_t cmd;
-	gpib_file_private_t *file_priv = filep->private_data;
+	struct gpib_file_private *file_priv = filep->private_data;
 	int retval;
 
 	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
@@ -1306,7 +1307,7 @@ static int serial_poll_ioctl(struct gpib_board *board, unsigned long arg)
 	return 0;
 }
 
-static int wait_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
+static int wait_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		      unsigned long arg)
 {
 	wait_ioctl_t wait_cmd;
@@ -1433,7 +1434,7 @@ static int line_status_ioctl(struct gpib_board *board, unsigned long arg)
 	return 0;
 }
 
-static int pad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int pad_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		     unsigned long arg)
 {
 	pad_ioctl_t cmd;
@@ -1469,7 +1470,7 @@ static int pad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
 	return 0;
 }
 
-static int sad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int sad_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		     unsigned long arg)
 {
 	sad_ioctl_t cmd;
@@ -1595,7 +1596,7 @@ static int dma_ioctl(struct gpib_board_config *config, unsigned long arg)
 	return 0;
 }
 
-static int autospoll_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int autospoll_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 			   unsigned long arg)
 {
 	autospoll_ioctl_t enable;
@@ -1633,7 +1634,7 @@ static int autospoll_ioctl(struct gpib_board *board, gpib_file_private_t *file_p
 	return retval;
 }
 
-static int mutex_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
+static int mutex_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		       unsigned long arg)
 {
 	int retval, lock_mutex;
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 2b4e98d1aa76..0dbe45894884 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -340,13 +340,13 @@ struct gpib_descriptor {
 	unsigned autopoll_enabled : 1;
 };
 
-typedef struct {
+struct gpib_file_private {
 	atomic_t holding_mutex;
 	struct gpib_descriptor *descriptors[GPIB_MAX_NUM_DESCRIPTORS];
 	/* locked while descriptors are being allocated/deallocated */
 	struct mutex descriptors_mutex;
 	unsigned got_module : 1;
-} gpib_file_private_t;
+};
 
 #endif	/* __KERNEL__ */
 
-- 
2.43.0

