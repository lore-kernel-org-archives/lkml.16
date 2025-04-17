Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE11DDA36
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850752; cv=none; b=B+3zNMXqPupjHiW+9aswii2R2tqmnL+1MoMx2C0MYF5bmKFvdpOqJeBkfymfRpOJpQT3Y7XRvxpwcPtI3mbj71zcPzaMcxa3Si7IpglgE5sZsCHkmrmTeGNKZJ6SfVjgkeaoj14UYQmFeXDI1XQ++E1BGA7NT79lNPLDPj7OYPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850752; c=relaxed/simple;
	bh=vqqMD2vMr3KfIaXswxJ7mru+gGuO0Ld1w+78Qj406Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B94IjBaNpFxgMj9MngCqi3fmXNEvNfMxFpJs47UWArf+wYxGjde5ZNQ9xwA1PoHr3Ad82R2q5/uau+VXbtaccOzXmO8vx7UoA3rLGhbOnzt+XwA4WgP/jHWq5v8EUDs4y79PqVhst7sSnFPLw1YZ/PSMcx4ZoXWVma8Uv6QWhWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=YKYWYAia; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="YKYWYAia"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fb0f619dso3036695ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850750; x=1745455550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MpLJjSgDnPFGiVpHm3KvyZyL7VDXcVSfSDoSsrVCXw=;
        b=YKYWYAiaHa84H6rbv0xJmAoQ7cSnkkKpjgLds44JKefEw+0Vtw4NxUKtbWd4Pk5+ll
         ypYvx8Hq42QRxCgd+jRMRLyXYDC9WitHcyAXTe21VSrlPVXBkPOVPoArtF3aRSJPZr0x
         n3zNHeiCfy9lm4V1pd9O8u3i81BxlyNogF0QhaII7f5QqM2JY2lYic8hfmg9scQ5PXGe
         fnUvNCT10loD0l89D1fTJR4ttkbQsqljoPh13ckhY0k4TM1yMuMoE1cHJ/+LVyD8kHTc
         nviNMg9vL1GPzP9bBmrvtuent73w5SFSl3JAWsiJl6lgBIS87iAEbk/l3WEmpmlKkIol
         ctaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850750; x=1745455550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MpLJjSgDnPFGiVpHm3KvyZyL7VDXcVSfSDoSsrVCXw=;
        b=AEmpqzsqTK66Ye/kfuIfik5VNxgMSz4P9z4gIiy/+1Ai9B7hFZ/DpGCInufqa/22w6
         g5lHg8xOgKxlxXlEnX8q2uG8zjBoQLqvkT8AUyOMi22WpC6Z3VCs5QUKv+RB1w503MDo
         t+c+d3QqD3Nnw0Nhn4cRb9kyDIBHHSDVbQ7E20mvN2qcALhKMBOPHIB3Fu/TctYZIqtB
         c/i37WlOU3r/uMpTiiSeKUxVoAmLWbPgoXIoe0MtkTe3Sv4bvmwNQInGW4N8nn/l8UQt
         8KXwilWjV1UDD3WFXWGMQNw0vub8OgqhgXWGmNr7DJojKIM/CNvISqyZd1Okyv443cf6
         njqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyjdJJeTgjpc7lsCirz1eYYEkAW35QINV7V8tD188uOIqu2g8cgbv//WuTuujQ4Qqt8SKzWMolSqNCL94=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOTRzL/LXTpCGmtWVIlTkxY1Bcm1klk5gaMtPu6YTkw021oidS
	CTTJQfhC4b1sgA31M90PhIHVTXyltm62jyVyJtfxIdgMEdyVYtglVqEAfbE5VZQcqAGO+8mUUOs
	=
X-Gm-Gg: ASbGncsg0/2yOxbAHVh1yjMFncqZh+OL6LdjAbBQqjVlBuq5UleBqNcIUNF2xGNxQpy
	tJOpFIClXyipX8BVyb+s/3fCJDSN00cwWnphsM2+bTHnOTJBZhueim+U19xGVsaErchipiaKvD3
	zAiUcjDVwZH57mph/VcFrgY2zdFt/S+qFRxvhb41fuJcPFyobz2dPL+Vl3UcrNYKOOavmDTEP/k
	aUhDJsHw1pV0nv4lwlAtQhyiv41BsFmvsspvGeOd3ndGWlhRmjygn/UAnAWq+2E967qjWkk5RTy
	3W+jyuDQLhc9yQ4jABtNXRgCFwCBUAWV0kgZv1W/SEeXn0DSo6tMU8Njy51MdP7WBlC53HknlgU
	+vYYT0voDlTZLcu/4
X-Google-Smtp-Source: AGHT+IFKuJl/aeUSGhla9FOWsU2V8+3HJ8VUb4CYfV/wKpEd6/jg8WfSCM6hMpkMfJIdXmgjLpnGmA==
X-Received: by 2002:a17:902:c944:b0:220:e9ac:e746 with SMTP id d9443c01a7336-22c359a43dcmr64796545ad.53.1744850750593;
        Wed, 16 Apr 2025 17:45:50 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73c2b2122c5sm1565886b3a.76.2025.04.16.17.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:50 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 11/14] staging: gpib: pc2: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:30 +0000
Message-ID: <20250417004533.86765-12-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417004533.86765-1-matchstick@neverthere.org>
References: <20250417004533.86765-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'
Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index ae265e2eb46a..fd191d24d7a6 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -90,7 +90,7 @@ irqreturn_t pc2a_interrupt(int irq, void *arg)
 }
 
 // wrappers for interface functions
-static int pc2_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int pc2_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 		    size_t *bytes_read)
 {
 	struct pc2_priv *priv = board->private_data;
@@ -98,7 +98,7 @@ static int pc2_read(struct gpib_board *board, uint8_t *buffer, size_t length, in
 	return nec7210_read(board, &priv->nec7210_priv, buffer, length, end, bytes_read);
 }
 
-static int pc2_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int pc2_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 		     size_t *bytes_written)
 {
 	struct pc2_priv *priv = board->private_data;
@@ -106,7 +106,7 @@ static int pc2_write(struct gpib_board *board, uint8_t *buffer, size_t length, i
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int pc2_command(struct gpib_board *board, uint8_t *buffer,
+static int pc2_command(struct gpib_board *board, u8 *buffer,
 		       size_t length, size_t *bytes_written)
 {
 	struct pc2_priv *priv = board->private_data;
@@ -149,7 +149,7 @@ static void pc2_remote_enable(struct gpib_board *board, int enable)
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int pc2_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int pc2_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct pc2_priv *priv = board->private_data;
 
@@ -184,14 +184,14 @@ static int pc2_secondary_address(struct gpib_board *board, unsigned int address,
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int pc2_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int pc2_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-static void pc2_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void pc2_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct pc2_priv *priv = board->private_data;
 
@@ -205,14 +205,14 @@ static void pc2_parallel_poll_response(struct gpib_board *board, int ist)
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-static void pc2_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void pc2_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-static uint8_t pc2_serial_poll_status(struct gpib_board *board)
+static u8 pc2_serial_poll_status(struct gpib_board *board)
 {
 	struct pc2_priv *priv = board->private_data;
 
-- 
2.43.0

