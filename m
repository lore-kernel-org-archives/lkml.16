Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B263289832
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976251; cv=none; b=M8eFqAJuFNrQdFjkE2bbENIjBjXbyRklMvSKi+HIGORXQr/RJ69ZKUP8CyBBqFZOMRPPaBMiX6cXLpxMseMpSCWOyfgQQg+7xfI+bBChZaegJQ6HWpGHeqAfcYryZN3ODxpKR+yxNruGV8IiL9bjLjq1pWLSOnmBFbSlu0qXFS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976251; c=relaxed/simple;
	bh=cs0d62jUhTsQ4M0UtMJEMQnYLyBLCUuZP7GJM7VZ4Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4XLb3kFTUmNOGFzdtQjIHLtzND+4z+bavmyyQB3TH1R7tGkVkIZKpxld1xpTk1R/UD0VTnjPBTyMWz0WQb4xilKzVHEqGGJLCTU4MEb/AnvAO+tA57gv2XfDESJl7uXZ6vd8qjTyieTm8XFNFhSmURl5qhy/4Pp2ZiMcJ+ra4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6P2mhWF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6P2mhWF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a3758b122cso3977997f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748976248; x=1749581048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9FZ5oqjuv5Ikr1VhUnEUNb3J4Oy/+PaHPwc/4HpVkQ=;
        b=h6P2mhWFj/Wh14JvoZTqlDsCRl0yLer1qZTqY6mO5NvHagL5CMrB7GUEXfKtVo4OHo
         eTYz4eqvuL1KPoZ4X/HyGXd+YHoduUYf2+dh4T9cCTw+jtunGCwAXrrYr2p9HMV8hJDL
         2B5TyWQNt/62hNETkPA+kSiRvuhAEBi4EEZk+8mXlJAoM/9s3Ks4qyX82tkfQtP5+eai
         sL0RvQRKHaRHgQ5YGtAFusGMv7/2Vrg25IdJu9LnCMURq+dxaYPUV9q+//6a1HxhMDAT
         0hUfkRcsSilxJ7tlLl1ReaKjMiq2kcIgcZ8MGBRLKvaJuUQqZNhX0o/SyoLo+ja29mLm
         00ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748976248; x=1749581048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9FZ5oqjuv5Ikr1VhUnEUNb3J4Oy/+PaHPwc/4HpVkQ=;
        b=AMKttGj9noy5sEaWdmGddaQYl3EMKLp2s58s6vkbuZQPMxRaAPVwEyb4HfQtCQGSr0
         82TBIHVjSjFeZqXi3+AXY6E9yDKlEzsf6VLIJp0FY2Io/aVHpeq+0yD30wDRWFXNXLWy
         mQ40w+slPqxOlFupWrjt5aKiANb8jKCN7cYz+v+bpTKZJYVnXqAWdxuemtFaFHYHrmPj
         HthWjjVZHQQzy8IRqvVBbK0bU9rfXpQ5v8sNnVOC78nMslq64igyWclvJquESwYd1m4t
         dsEPe27xmdkrgGYAAuDgq1D8T/Qfr4pEDd2ZYgSkTr4wF43XvL3lQiFzJC6bL4gXwB5f
         rl8w==
X-Forwarded-Encrypted: i=1; AJvYcCXS0f452tLjofDODGp4pVJqGHBZSw9Pqykzs3D1HfPr3HZDRUr+lnHbsyvzUocpi6fBLmYHOv+geJYxCPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ8i4DlhenfLaXEXRRAChsmtc2dMsrUMIakhPWOCPw3s0Q7Z+y
	e3AoL9YIlff3y2uVFWpmme+BBIp9yGUnXVnBxfjnIfNT/XaH/r3EGFLl
X-Gm-Gg: ASbGnctZM26oNYGyeOoEuJcWDcmcvCXDseNlJ0VIC1Ea7+LXAe1E7dycVkfvnfc1Au5
	raD2i58m4BlA5OQNDoyaH+CWvXfw5SZ7V76SarnvQFCowK3KXGO2/5Zec0Hq/Z9CJZFK0nnuetR
	Ph6hBXhhT3lp4S59pZg/+PAnuX+ufQDYHsiKhhKKHxkR+1EfEwcfyjSBPHTEeNujauc2GakkzDp
	F7p0mo35OytULegg6w3vCmDIA5XFLa7Czhx+xbuEbiD6i5rQ0IsoSO/m79uiEPnbQFMbo8nLNPd
	5IK4DKT5jNv86MLfzw0t2o8SVd+Bzl5zdss05MVDtBYBd2d4QuHp+66wJgIMqvByrs8KW4XnSeu
	SoZy/D0W//hU=
X-Google-Smtp-Source: AGHT+IF5Hwuvnc/0J0y8rHsrGxR6kUfr4vat5I1FdEtpqaq/YMu7JxaNXcvi1U8W2zY7/o/ig/bjaw==
X-Received: by 2002:a05:6000:2089:b0:3a4:e68c:beeb with SMTP id ffacd0b85a97d-3a4f7a4d34dmr12758179f8f.22.1748976247866;
        Tue, 03 Jun 2025 11:44:07 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f83sm18449959f8f.49.2025.06.03.11.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:44:07 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 4/4] staging: gpib: Add bit and byte padding to ioctl structs
Date: Tue,  3 Jun 2025 20:43:20 +0200
Message-ID: <20250603184320.30594-5-dpenkler@gmail.com>
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

Ensure that all structs have a size that is an integral mutliple
of 32 bits.

Change trailing single bit field to __u32 in gpib_open_dev_ioctl
Add byte padding to  gpib_serial_poll_ioctl and gpib_request_service2
Add bit padding to gpib_board_info_ioctl and gpib_ppoll_config_ioctl

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 0da47e28caaa..55bf5e55507a 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -29,7 +29,7 @@ struct gpib_open_dev_ioctl {
 	__u32 handle;
 	__u32 pad;
 	__s32 sad;
-	unsigned is_board : 1;
+	__u32 is_board;
 };
 
 struct gpib_close_dev_ioctl {
@@ -40,6 +40,7 @@ struct gpib_serial_poll_ioctl {
 	__u32 pad;
 	__s32 sad;
 	__u8 status_byte;
+	__u8 padding[3];   // align to 32 bit boundary
 };
 
 struct gpib_eos_ioctl {
@@ -79,6 +80,7 @@ struct gpib_board_info_ioctl {
 	__u32 t1_delay;
 	unsigned ist : 1;
 	unsigned no_7_bit_eos : 1;
+	unsigned padding :30; // align to 32 bit boundary
 };
 
 struct gpib_select_pci_ioctl {
@@ -90,6 +92,7 @@ struct gpib_ppoll_config_ioctl {
 	__u8 config;
 	unsigned set_ist : 1;
 	unsigned clear_ist : 1;
+	unsigned padding :22; // align to 32 bit boundary
 };
 
 struct gpib_pad_ioctl {
@@ -110,6 +113,7 @@ struct gpib_select_device_path_ioctl {
 // update status byte and request service
 struct gpib_request_service2 {
 	__u8 status_byte;
+	__u8 padding[3]; // align to 32 bit boundary
 	__s32 new_reason_for_service;
 };
 
-- 
2.49.0

