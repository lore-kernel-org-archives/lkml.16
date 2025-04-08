Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8799257440
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154749; cv=none; b=Xvh8T1XWQzUZAeBTmKjKYG48ScXKsatvTK+U83JFvw/rWUODDIpeNk0X5XZS+skYrIPAmLN3SjWvdTTYcHWzvmfBJKRzXvP2+rjkyMJTTtsCHvbuBxqyEg+pYaHe15hJdlLkPy7jXN9wAGjdSjrvpK8xb1bWAA6yXPVx4490Zgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154749; c=relaxed/simple;
	bh=7NsYaOHtP6scSVgtfwrSOvUeDsS990s0l6D3dRmxvtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tuYfV7d5zQqvjvvPrBX7t64bxzjpZ88XWwqqtbn7iVTEU/bOTEw3PoRcpHSZXCdAsj/RlR6oAgkZ572Um+egtP6UgHr4fXYzw60j3N3GMc0wU8ZrFfpjqKliIHtDA4fcfQxYqrA6pU/1Qto8H73iO1Ixg15mzDiIDEtWRWmTG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=WzBfwFZ8; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="WzBfwFZ8"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22403cbb47fso66567795ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154746; x=1744759546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9ON5Qv7DJQ0DX/fAqZuOiE2IxL/TP/o5xQInqAXYAQ=;
        b=WzBfwFZ8w3y/TI4V7ShquYCDTrYDLQbx/TmBzMijaLqOpqvyisAgRsDWnjq872+fdu
         lIjgPoRnCOvU6Um7mZHkOG1Cljw3V82amZDMwsLgq3bl/XlGoYtRiaQ645O+r4EM+sHE
         xo/aGCegC9HdlV34YwdgQ3Z7R8hFt2wxpavin0q9I+dUmNnDPSG16zsIR8qjTPKL1VUM
         BX35x4SoTonsbu67Nr76fep/G1KDxsdawaT98XyVFlWp6WFemdrg/Y2n2ItsaiPsf7c9
         IJSsq2JsyvLYgIspjlkDQmEEbn6r2nGlx/8C60rSj1iSNYzN3T+s9p9cOFaKWRaxQswy
         4YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154746; x=1744759546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9ON5Qv7DJQ0DX/fAqZuOiE2IxL/TP/o5xQInqAXYAQ=;
        b=rWCKsx61g1CdRNPtJJpyM+Q2f2mKsl3pgcH1EUR69Cb1iFC/VEREFGLuUrsPHAkMJE
         zzaZdKYq9Q+htOmHr9+b9UpwFF8fH1ybYhXo3oEP3aEgjqdyjBcnbU33diFwVtQ2vsKO
         TK8LcQ/nVPacPIa8nyiNtq05QnUb8LGyBfnOhc7gpocY3QpbW4CnbkJF4MYEul4iOBlN
         mrURJE2wkG5pMw6tgoev04Ac2jiK5JbpPbM1YIFYkpCie4PQPPbJmZirKF9q3uAzxnvA
         i4GRvokQtoazx1RI1/UB5zUV7lU4zYn+TqKJdbtT0eNVkuXqvkhYaIjoK5inrQtEcE0M
         6hGA==
X-Forwarded-Encrypted: i=1; AJvYcCW4eBvB6ltrUQZGgzQXEHnCO86GbrJhLp53Cqw5/3IdLqYI8YHdUOvXgJMuPioTdkn6mo2kwXwoNbm5bAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFSmnb2sDNO6zFCF35vGr2tEwkaMnvRmccxFkOZ0n11F+k9U+B
	InOq5UTL5aAJvj20vssRE5TpBczW+4Csq1UgtHRHkq4xKlxszI8U4VltXq7YZj94bKlJkBdr5wg
	=
X-Gm-Gg: ASbGncs9jfXYnwTf7qgmriekZ3Zuv7Ew/V/FdnqGkCEfbR8gB+goo/EEjkfhVt/yCkv
	NWKY9RFc9V3Q4GhxH55Wle2/9YFd2PPLJHWDbgmDZJYJL+EAwP2MlTVPwWGmHXPKZDUQ5zRdDHd
	Qeq1DjIX8CvzRORob21jQXTO5cIFe0kQ3eY+MnyvZBdwFUx0a+yfmBRiQ1gwYzWG09MM+GNU79U
	kzVt0yKBHmMZccY7cLvbmkOn896P9hLEcxxZJ83qpO83uGiaNZsUxwfomwNN7g5Tr7717LGP2Mg
	40zNYNm+b0VBXYS6UrU4s50vRpfDrjQ9bKgdOKFcx3tSyCuRASJoI41mlGC36Au2gqx12y4RPek
	rcq4GdO04Ng5DsKSngzu+
X-Google-Smtp-Source: AGHT+IG52w3InnLTyWxAM0DeNTrDyCR5cFdsTkwznxzpjIVJTgm6/qAi3+aBwVwOF8Z/NEPbzlb5FA==
X-Received: by 2002:a17:903:94e:b0:223:fbc7:25f4 with SMTP id d9443c01a7336-22ac29a9929mr13305635ad.14.1744154745866;
        Tue, 08 Apr 2025 16:25:45 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c0127sm106693085ad.91.2025.04.08.16.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:45 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 6/7] staging: gpib: Removing typedef gpib_descriptor_t
Date: Tue,  8 Apr 2025 23:25:34 +0000
Message-ID: <20250408232535.187528-7-matchstick@neverthere.org>
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

Removing gpib_descriptor_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c     | 26 +++++++++++------------
 drivers/staging/gpib/common/iblib.c       |  6 +++---
 drivers/staging/gpib/include/gpib_proto.h |  6 +++---
 drivers/staging/gpib/include/gpib_types.h |  6 +++---
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index b06cbd53c36f..6aaf15ffb02b 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -494,7 +494,7 @@ int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
 	return retval;
 }
 
-static gpib_descriptor_t *handle_to_descriptor(const gpib_file_private_t *file_priv,
+static struct gpib_descriptor *handle_to_descriptor(const gpib_file_private_t *file_priv,
 					       int handle)
 {
 	if (handle < 0 || handle >= GPIB_MAX_NUM_DESCRIPTORS) {
@@ -509,7 +509,7 @@ static int init_gpib_file_private(gpib_file_private_t *priv)
 {
 	memset(priv, 0, sizeof(*priv));
 	atomic_set(&priv->holding_mutex, 0);
-	priv->descriptors[0] = kmalloc(sizeof(gpib_descriptor_t), GFP_KERNEL);
+	priv->descriptors[0] = kmalloc(sizeof(struct gpib_descriptor), GFP_KERNEL);
 	if (!priv->descriptors[0]) {
 		pr_err("gpib: failed to allocate default board descriptor\n");
 		return -ENOMEM;
@@ -563,7 +563,7 @@ int ibclose(struct inode *inode, struct file *filep)
 	unsigned int minor = iminor(inode);
 	struct gpib_board *board;
 	gpib_file_private_t *priv = filep->private_data;
-	gpib_descriptor_t *desc;
+	struct gpib_descriptor *desc;
 
 	if (minor >= GPIB_MAX_NUM_BOARDS) {
 		pr_err("gpib: invalid minor number of device file\n");
@@ -869,7 +869,7 @@ static int read_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
 	int end_flag = 0;
 	int retval;
 	ssize_t read_ret = 0;
-	gpib_descriptor_t *desc;
+	struct gpib_descriptor *desc;
 	size_t nbytes;
 
 	retval = copy_from_user(&read_cmd, (void __user *)arg, sizeof(read_cmd));
@@ -943,7 +943,7 @@ static int command_ioctl(gpib_file_private_t *file_priv,
 	unsigned long remain;
 	int retval;
 	int fault = 0;
-	gpib_descriptor_t *desc;
+	struct gpib_descriptor *desc;
 	size_t bytes_written;
 	int no_clear_io_in_prog;
 
@@ -1027,7 +1027,7 @@ static int write_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
 	unsigned long remain;
 	int retval = 0;
 	int fault;
-	gpib_descriptor_t *desc;
+	struct gpib_descriptor *desc;
 
 	fault = copy_from_user(&write_cmd, (void __user *)arg, sizeof(write_cmd));
 	if (fault)
@@ -1189,7 +1189,7 @@ static int cleanup_open_devices(gpib_file_private_t *file_priv, struct gpib_boar
 	int i;
 
 	for (i = 0; i < GPIB_MAX_NUM_DESCRIPTORS; i++) {
-		gpib_descriptor_t *desc;
+		struct gpib_descriptor *desc;
 
 		desc = file_priv->descriptors[i];
 		if (!desc)
@@ -1228,7 +1228,7 @@ static int open_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned
 		mutex_unlock(&file_priv->descriptors_mutex);
 		return -ERANGE;
 	}
-	file_priv->descriptors[i] = kmalloc(sizeof(gpib_descriptor_t), GFP_KERNEL);
+	file_priv->descriptors[i] = kmalloc(sizeof(struct gpib_descriptor), GFP_KERNEL);
 	if (!file_priv->descriptors[i]) {
 		mutex_unlock(&file_priv->descriptors_mutex);
 		return -ENOMEM;
@@ -1311,7 +1311,7 @@ static int wait_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
 {
 	wait_ioctl_t wait_cmd;
 	int retval;
-	gpib_descriptor_t *desc;
+	struct gpib_descriptor *desc;
 
 	retval = copy_from_user(&wait_cmd, (void __user *)arg, sizeof(wait_cmd));
 	if (retval)
@@ -1438,7 +1438,7 @@ static int pad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
 {
 	pad_ioctl_t cmd;
 	int retval;
-	gpib_descriptor_t *desc;
+	struct gpib_descriptor *desc;
 
 	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
 	if (retval)
@@ -1474,7 +1474,7 @@ static int sad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
 {
 	sad_ioctl_t cmd;
 	int retval;
-	gpib_descriptor_t *desc;
+	struct gpib_descriptor *desc;
 
 	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
 	if (retval)
@@ -1600,7 +1600,7 @@ static int autospoll_ioctl(struct gpib_board *board, gpib_file_private_t *file_p
 {
 	autospoll_ioctl_t enable;
 	int retval;
-	gpib_descriptor_t *desc;
+	struct gpib_descriptor *desc;
 
 	retval = copy_from_user(&enable, (void __user *)arg, sizeof(enable));
 	if (retval)
@@ -2015,7 +2015,7 @@ struct gpib_board board_array[GPIB_MAX_NUM_BOARDS];
 
 LIST_HEAD(registered_drivers);
 
-void init_gpib_descriptor(gpib_descriptor_t *desc)
+void init_gpib_descriptor(struct gpib_descriptor *desc)
 {
 	desc->pad = 0;
 	desc->sad = -1;
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index 136be22f7eb2..902807066d60 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -507,7 +507,7 @@ int ibstatus(struct gpib_board *board)
 }
 
 int general_ibstatus(struct gpib_board *board, const struct gpib_status_queue *device,
-		     int clear_mask, int set_mask, gpib_descriptor_t *desc)
+		     int clear_mask, int set_mask, struct gpib_descriptor *desc)
 {
 	int status = 0;
 	short line_status;
@@ -574,7 +574,7 @@ static void init_wait_info(struct wait_info *winfo)
 }
 
 static int wait_satisfied(struct wait_info *winfo, struct gpib_status_queue *status_queue,
-			  int wait_mask, int *status, gpib_descriptor_t *desc)
+			  int wait_mask, int *status, struct gpib_descriptor *desc)
 {
 	struct gpib_board *board = winfo->board;
 	int temp_status;
@@ -623,7 +623,7 @@ static void remove_wait_timer(struct wait_info *winfo)
  * no condition is waited for.
  */
 int ibwait(struct gpib_board *board, int wait_mask, int clear_mask, int set_mask,
-	   int *status, unsigned long usec_timeout, gpib_descriptor_t *desc)
+	   int *status, unsigned long usec_timeout, struct gpib_descriptor *desc)
 {
 	int retval = 0;
 	struct gpib_status_queue *status_queue;
diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 80046218c834..333f5c62da9e 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -23,7 +23,7 @@ static inline unsigned long usec_to_jiffies(unsigned int usec)
 };
 
 int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout);
-void init_gpib_descriptor(gpib_descriptor_t *desc);
+void init_gpib_descriptor(struct gpib_descriptor *desc);
 int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
 	  unsigned int usec_timeout, uint8_t *result);
 int ibAPWait(struct gpib_board *board, int pad);
@@ -45,11 +45,11 @@ int ibpad(struct gpib_board *board, unsigned int addr);
 int ibsad(struct gpib_board *board, int addr);
 int ibeos(struct gpib_board *board, int eos, int eosflags);
 int ibwait(struct gpib_board *board, int wait_mask, int clear_mask, int set_mask,
-	   int *status, unsigned long usec_timeout, gpib_descriptor_t *desc);
+	   int *status, unsigned long usec_timeout, struct gpib_descriptor *desc);
 int ibwrt(struct gpib_board *board, uint8_t *buf, size_t cnt, int send_eoi, size_t *bytes_written);
 int ibstatus(struct gpib_board *board);
 int general_ibstatus(struct gpib_board *board, const struct gpib_status_queue *device,
-		     int clear_mask, int set_mask, gpib_descriptor_t *desc);
+		     int clear_mask, int set_mask, struct gpib_descriptor *desc);
 int io_timed_out(struct gpib_board *board);
 int ibppc(struct gpib_board *board, uint8_t configuration);
 
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 6a34500af65c..2b4e98d1aa76 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -332,17 +332,17 @@ struct gpib_status_byte {
 void init_gpib_status_queue(struct gpib_status_queue *device);
 
 /* Used to store device-descriptor-specific information */
-typedef struct {
+struct gpib_descriptor {
 	unsigned int pad;	/* primary gpib address */
 	int sad;	/* secondary gpib address (negative means disabled) */
 	atomic_t io_in_progress;
 	unsigned is_board : 1;
 	unsigned autopoll_enabled : 1;
-} gpib_descriptor_t;
+};
 
 typedef struct {
 	atomic_t holding_mutex;
-	gpib_descriptor_t *descriptors[GPIB_MAX_NUM_DESCRIPTORS];
+	struct gpib_descriptor *descriptors[GPIB_MAX_NUM_DESCRIPTORS];
 	/* locked while descriptors are being allocated/deallocated */
 	struct mutex descriptors_mutex;
 	unsigned got_module : 1;
-- 
2.43.0

