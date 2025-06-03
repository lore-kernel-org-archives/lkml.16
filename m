Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5067328934A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976248; cv=none; b=cJvDa6LmUsJTbdW3e3p5tSVTkMSm9IOX0sjetmm69X1LGGNaO91R3SOCOb1r5/0nirYloZU3TsSFs3NWLe60NVJZk7oxhXOenSzTBJOtFtX2zueW2hPFh2RmWDR3IBQjKS/FDVMATDHuzEE8f7SwmfZYvdawdJZ5S66JmRT6Ths=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976248; c=relaxed/simple;
	bh=yPesDnhB9t5yVMCCj6DKkbOKpQJNQFkvzUbwNjyUwFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6HobQeDWbOjpXBxJdelkTIYDu8k8pZVkbydLqHxQRaS34vk1ZTTXEFicwNenSA/Aw9lE8MhifRkb5tQIixFc02cI71Efho7DbkQLRFyh/gq7T4HtuL90DBBYSfF9wIEYylNskDZvJxNoQXQ+DRj/YQFfpV89kphymqshzMsLsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPDs2le7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPDs2le7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso1392295f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748976244; x=1749581044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHcQIzbO8vErc+yJtqA1zwASX4NEt6ytpvqXfDCS3ds=;
        b=PPDs2le7vdjoSK/1wjZfV6TspmIv1wr22tlamYINuiRFzPvhXJYmVcqes5HEUpwM4o
         HguVehjnwacaOOdfcVBRyChBty3iTaXYsT2ni2nPvf8AgzgQp6j4nUVwL4k+h1C2NGcW
         mOUy8NzdBcibiLvAxKTHlm9aCxWIziN9LvTIdphbeHrjH5t84fK+JwdjlCz+901OFtvT
         4OTdqoiXL4Q3leMD0eXoBNJ2c07tl0VGjPM4dpa3zxyNSH2QJNNrb26pWiUreu4XwN6d
         CeW3tvhxP+EtFQ3uX5OfhULNo1/NchGwMI74nvF/L5Cz+w8TrEPApZ8jb/WhMIxbsCv1
         u+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748976244; x=1749581044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHcQIzbO8vErc+yJtqA1zwASX4NEt6ytpvqXfDCS3ds=;
        b=EEWWQTSryDHKx87SJfwYU8KU0QruTZnzzGVxLQXnt4SdEtnCengLLWNDbp0qDCkwDK
         P7Ohnpe+iT/U2MGF4gvQo8dumBaNdnvFBVd8vFiU/ad18Qnm8rj0iWYLXm9ScXzdmuUq
         MEqDDfyBhH35pU8KABbqp4AF105kV63u8lhYcuzOND5GUIp5nRhUOmYWSA7iq78/2PYA
         Dj38qb1LPATdlL9kOj31LNh3wkH/uo7QIp+ANiC4N6MZ86zP7QqJ1i++XyP2Flm0lL+n
         dx0bS0w/cXMY9p8xDNXmSbyxXu0TThlr9DA6qIWLuR+Qb9XYkiEyRLqtGbC4pEGrvCp8
         hxew==
X-Forwarded-Encrypted: i=1; AJvYcCUD5Q/1tetNztLnG99cFvxxbCDT5uLnH4Hoa6UzmR7YkG6HUulDIq3bLK8NkN2uI/ORyqpQfaMPMyBEpxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZaP9XP40W7C3pIA3tz6YWTktIl6jmni30ffgUGy66nxS9TlB8
	cMVnekJiJv1fYvvFJDMxydKZkZKRsEeXrKd0uGxq7BjZ4Q4RGVaRb5hhCZI1Yw==
X-Gm-Gg: ASbGncvn/hxfvTgo/5ZUGUW5ftmmGJMCh7avUuZ4K63kto3SORX0E5zqfQW+WWmWQg7
	Fm7BXWBHxO4qzAV2fG34l/492roXaG64vd41PnQO+8yHhn8V4jdyEjhR02Q7gYd8i6XlBLcEwlO
	yN7+Pj7bWFxZ3uXYKTU098haGY5RP9llDog7rltcYDma0FUro9SOcZLDWjXQm+XQhpLmu2Pw79G
	r6LHT0G/7Ph2k67ZIWfIwGZfU5ju+r9YGQY5fV5hKIdtlUi2oI068QNk2dczMkZrzQTtmCheji3
	B0zy8sJdN+NYwLivfM0u3G2MqKZm6bw2O6d967cY4HI1fOugqlQT/ydM1r7EZ9SHjkjV1P/UhIs
	AQkFA9MZhZ0E=
X-Google-Smtp-Source: AGHT+IG8RYYFqv2zCyGW60oYb4bDuCDm3BVjHRqREoqS7uHzhn1Vs+5KcEjOWDpFdSFBlBrsiQv6Tg==
X-Received: by 2002:a05:6000:2910:b0:3a5:1cc5:aa6f with SMTP id ffacd0b85a97d-3a51cc5aa90mr415146f8f.34.1748976244478;
        Tue, 03 Jun 2025 11:44:04 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f83sm18449959f8f.49.2025.06.03.11.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:44:03 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 3/4] staging: gpib: Use standard size basic uapi types
Date: Tue,  3 Jun 2025 20:43:19 +0200
Message-ID: <20250603184320.30594-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603184320.30594-1-dpenkler@gmail.com>
References: <20250603184320.30594-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change unsigned int to __u32,
       int          to __s32
  and  short        to __s16

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 106 ++++++++++++-------------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 0fed5c0fa7f2..0da47e28caaa 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -19,71 +19,71 @@ struct gpib_board_type_ioctl {
 /* argument for read/write/command ioctls */
 struct gpib_read_write_ioctl {
 	__u64 buffer_ptr;
-	unsigned int requested_transfer_count;
-	unsigned int completed_transfer_count;
-	int end; /* end flag return for reads, end io suppression request for cmd*/
-	int handle;
+	__u32 requested_transfer_count;
+	__u32 completed_transfer_count;
+	__s32 end; /* end flag return for reads, end io suppression request for cmd*/
+	__s32 handle;
 };
 
 struct gpib_open_dev_ioctl {
-	unsigned int handle;
-	unsigned int pad;
-	int sad;
+	__u32 handle;
+	__u32 pad;
+	__s32 sad;
 	unsigned is_board : 1;
 };
 
 struct gpib_close_dev_ioctl {
-	unsigned int handle;
+	__u32 handle;
 };
 
 struct gpib_serial_poll_ioctl {
-	unsigned int pad;
-	int sad;
+	__u32 pad;
+	__s32 sad;
 	__u8 status_byte;
 };
 
 struct gpib_eos_ioctl {
-	int eos;
-	int eos_flags;
+	__s32 eos;
+	__s32 eos_flags;
 };
 
 struct gpib_wait_ioctl {
-	int handle;
-	int wait_mask;
-	int clear_mask;
-	int set_mask;
-	int ibsta;
-	int pad;
-	int sad;
-	unsigned int usec_timeout;
+	__s32 handle;
+	__s32 wait_mask;
+	__s32 clear_mask;
+	__s32 set_mask;
+	__s32 ibsta;
+	__s32 pad;
+	__s32 sad;
+	__u32 usec_timeout;
 };
 
 struct gpib_online_ioctl {
 	__u64 init_data_ptr;
-	int init_data_length;
-	int online;
+	__s32 init_data_length;
+	__s32 online;
 };
 
 struct gpib_spoll_bytes_ioctl {
-	unsigned int num_bytes;
-	unsigned int pad;
-	int sad;
+	__u32 num_bytes;
+	__u32 pad;
+	__s32 sad;
 };
 
 struct gpib_board_info_ioctl {
-	unsigned int pad;
-	int sad;
-	int parallel_poll_configuration;
-	int autopolling;
-	int is_system_controller;
-	unsigned int t1_delay;
+	__u32 pad;
+	__s32 sad;
+	__s32 parallel_poll_configuration;
+	__s32 autopolling;
+	__s32 is_system_controller;
+	__u32 t1_delay;
 	unsigned ist : 1;
 	unsigned no_7_bit_eos : 1;
 };
 
 struct gpib_select_pci_ioctl {
-	int pci_bus;
-	int pci_slot;
+	__s32 pci_bus;
+	__s32 pci_slot;
 };
 
 struct gpib_ppoll_config_ioctl {
@@ -93,13 +93,13 @@ struct gpib_ppoll_config_ioctl {
 };
 
 struct gpib_pad_ioctl {
-	unsigned int handle;
-	unsigned int pad;
+	__u32 handle;
+	__u32 pad;
 };
 
 struct gpib_sad_ioctl {
-	unsigned int handle;
-	int sad;
+	__u32 handle;
+	__s32 sad;
 };
 
 // select a piece of hardware to attach by its sysfs device path
@@ -110,7 +110,7 @@ struct gpib_select_device_path_ioctl {
 // update status byte and request service
 struct gpib_request_service2 {
 	__u8 status_byte;
-	int new_reason_for_service;
+	__s32 new_reason_for_service;
 };
 
 /* Standard functions. */
@@ -123,38 +123,38 @@ enum gpib_ioctl {
 	IBWAIT = _IOWR(GPIB_CODE, 5, struct gpib_wait_ioctl),
 	IBRPP = _IOWR(GPIB_CODE, 6, __u8),
 
-	IBSIC = _IOW(GPIB_CODE, 9, unsigned int),
-	IBSRE = _IOW(GPIB_CODE, 10, int),
+	IBSIC = _IOW(GPIB_CODE, 9, __u32),
+	IBSRE = _IOW(GPIB_CODE, 10, __s32),
 	IBGTS = _IO(GPIB_CODE, 11),
-	IBCAC = _IOW(GPIB_CODE, 12, int),
-	IBLINES = _IOR(GPIB_CODE, 14, short),
+	IBCAC = _IOW(GPIB_CODE, 12, __s32),
+	IBLINES = _IOR(GPIB_CODE, 14, __s16),
 	IBPAD = _IOW(GPIB_CODE, 15, struct gpib_pad_ioctl),
 	IBSAD = _IOW(GPIB_CODE, 16, struct gpib_sad_ioctl),
-	IBTMO = _IOW(GPIB_CODE, 17, unsigned int),
+	IBTMO = _IOW(GPIB_CODE, 17, __u32),
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
 	IBEOS = _IOW(GPIB_CODE, 19, struct gpib_eos_ioctl),
 	IBRSV = _IOW(GPIB_CODE, 20, __u8),
 	CFCBASE = _IOW(GPIB_CODE, 21, __u64),
-	CFCIRQ = _IOW(GPIB_CODE, 22, unsigned int),
-	CFCDMA = _IOW(GPIB_CODE, 23, unsigned int),
+	CFCIRQ = _IOW(GPIB_CODE, 22, __u32),
+	CFCDMA = _IOW(GPIB_CODE, 23, __u32),
 	CFCBOARDTYPE = _IOW(GPIB_CODE, 24, struct gpib_board_type_ioctl),
 
-	IBMUTEX = _IOW(GPIB_CODE, 26, int),
+	IBMUTEX = _IOW(GPIB_CODE, 26, __s32),
 	IBSPOLL_BYTES = _IOWR(GPIB_CODE, 27, struct gpib_spoll_bytes_ioctl),
 	IBPPC = _IOW(GPIB_CODE, 28, struct gpib_ppoll_config_ioctl),
 	IBBOARD_INFO = _IOR(GPIB_CODE, 29, struct gpib_board_info_ioctl),
 
-	IBQUERY_BOARD_RSV = _IOR(GPIB_CODE, 31, int),
+	IBQUERY_BOARD_RSV = _IOR(GPIB_CODE, 31, __s32),
 	IBSELECT_PCI = _IOWR(GPIB_CODE, 32, struct gpib_select_pci_ioctl),
-	IBEVENT = _IOR(GPIB_CODE, 33, short),
-	IBRSC = _IOW(GPIB_CODE, 34, int),
-	IB_T1_DELAY = _IOW(GPIB_CODE, 35, unsigned int),
+	IBEVENT = _IOR(GPIB_CODE, 33, __s16),
+	IBRSC = _IOW(GPIB_CODE, 34, __s32),
+	IB_T1_DELAY = _IOW(GPIB_CODE, 35, __u32),
 	IBLOC = _IO(GPIB_CODE, 36),
 
-	IBAUTOSPOLL = _IOW(GPIB_CODE, 38, short),
+	IBAUTOSPOLL = _IOW(GPIB_CODE, 38, __s16),
 	IBONL = _IOW(GPIB_CODE, 39, struct gpib_online_ioctl),
-	IBPP2_SET = _IOW(GPIB_CODE, 40, short),
-	IBPP2_GET = _IOR(GPIB_CODE, 41, short),
+	IBPP2_SET = _IOW(GPIB_CODE, 40, __s16),
+	IBPP2_GET = _IOR(GPIB_CODE, 41, __s16),
 	IBSELECT_DEVICE_PATH = _IOW(GPIB_CODE, 43, struct gpib_select_device_path_ioctl),
 	// 44 was IBSELECT_SERIAL_NUMBER
 	IBRSV2 = _IOW(GPIB_CODE, 45, struct gpib_request_service2)
-- 
2.49.0

