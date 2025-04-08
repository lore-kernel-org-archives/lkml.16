Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252632566EE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150853; cv=none; b=RSl/VPm7ZthssoulxLmv5yPAwzUj5sQB0luhtyQVPslz+VL4ShGWE/s+/OTelwVRUgZfNqdgnICPIOG8yUEw26I9tTT+Cx1SLU8YoE+aFcyA4pEqLGxsnY6LTmFq/5UQfGhYN3Q3+WljWgTqDELTfHD7L2zwRSS+FHZzoBoncqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150853; c=relaxed/simple;
	bh=oBBYOAmpgUw5a7dxTRshWlTjsaxcp9v/LnvzWbvKVBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IM2YL38VmixHdEZQsuJGvgBl4cy5ClollNwGkksev/uxLfdPb/GCU/DT7Sskh77hyTmN6XSwX0vNbLUh8FCvZvebkiTBY/GcZYAmUD4ug8o7J79zbO6fEfB61ig1uVihYRnsgYlwJFnheIUmsHG7xRmNvfvQ2aQRWlthM7LDKV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=D82N3efq; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="D82N3efq"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736aaeed234so5170917b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150851; x=1744755651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aH5efzQNfnzHQttdntJspd+Jpl/C2wJCDQ9hJl8bD0=;
        b=D82N3efqRsvGnHfdS9al+Ogd425sEVGRrW+yy+b1xvQ2U727nk6QZ5YbdcTAgShpmB
         ETZnHU519BPwj8p31WuFEEyaNQIRf1wvKGdGMcHB58/J+UJezFYS6oCnWNZq8wHss2Yr
         RhwRVpHbL+AAQTwas4/AsYPp12coB1FgITTvFGRr/dil9gCaHBqRPdF8t0Shce3XoSF3
         CkpJkSgt8EQh+H1buFn4cUkZa+hpFdEsodueEr9ta1Nz07NlZgijg96S/hPsUESQtuoJ
         PxMgP1LxyYrMEoVTIaM3eB/fT+PHidqmEoLc/j1NEaxjzbu3SFaH1njDuj9VBxkf7YU1
         uh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150851; x=1744755651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aH5efzQNfnzHQttdntJspd+Jpl/C2wJCDQ9hJl8bD0=;
        b=OYLsu3BHjVxbIRM//mtrYhXUmbpVlRmTBUTf8YDRYe6fFuwkAyn0SRB2XfU29CncwG
         forGA1hWnRi1+0ARWtycBog4RxvBr5ehPBx0v7/RCNqmeCjGzOqZzc5NmLdhU3SSElfG
         Scc+we5PrkpWfuU7dhEdhBQ3GsNxr9nCPgN1pVA7/tqKzmAunq3XBugTT4f35HFUHHQt
         i10go5YqwdfpRou/eMwmTSKwok/kCRzGCKf4NAxX/0xZtz33zBwvfZ4SeFbIWjJPmruC
         xGe1auou/ZLLJYFzncrwX5ugNmn/UPb8+oUX2VEswaYftSqvi/zvQ/bajLh9rd492g76
         +SPg==
X-Forwarded-Encrypted: i=1; AJvYcCVVU9IcQUvFv29doZnVNEogp5WJoLatYreC0t6BWhdq2+lon9G+XFTG9hQkP8WkYZyvpCuQUg+w/SNgDHg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo9Mp3bKXiDZ2yZBh2u0Ms49RtPuljpXuTupg1yN1XIutiL2fI
	NQxWGQ1vMsQpQpFvWtzfZzhuj8nQL0bE9W0K90FZWHi4pbKiKFH2RdWIgGr1jA==
X-Gm-Gg: ASbGncvzCkvkA+6LkhHhnxZqnXWHoAr0rCUFz1eMCf0ROYJk1uldWo+iyxsAshEH+XK
	DpXTB+VLOXu8ob45etcvLu3oxJOLD0H7mWvBMRyGsk4KoPXtWKMvD4ISebqNL6ikK96yguoIEuX
	r/qULRpwjvYa0oGezS9HuLGbWv9IbHFEVTOdiQFpAB7vsRTRen7TFbJ4UkDThzHq8wSyigLdNo4
	U+qq01X/mbQMaRqXXEuI0Qv822A9qkWQgOphxK6Ks4VVktdXoBijjll5NQxDqD3M5x4K25UQt8l
	KVJAWjzUJhcwvYL0LyUld5tpbFBrX3gfKhqALkj1J/a5yaDG6BVTD6POUQCYFhsYtPRbx0Ty0cS
	n6PfctVk25g==
X-Google-Smtp-Source: AGHT+IEPUjrHIM8w+hLMNfdvZdmDakFawpMsDKi66ziESAhpfDonRnZVB+51x3xZBxW4m94yUHhDdQ==
X-Received: by 2002:a05:6a00:3a11:b0:736:3d7c:2368 with SMTP id d2e1a72fcca58-73bae4b724bmr806628b3a.7.1744150851478;
        Tue, 08 Apr 2025 15:20:51 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d1befsm11175659b3a.30.2025.04.08.15.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:51 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 06/14] staging: gpib: tms9914: lines exceeded 100 columns
Date: Tue,  8 Apr 2025 22:20:32 +0000
Message-ID: <20250408222040.186881-7-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

CHECK: line length exceeds 100 columns

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/tms9914.h |  3 ++-
 drivers/staging/gpib/tms9914/tms9914.c | 19 ++++++++++++-------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/include/tms9914.h b/drivers/staging/gpib/include/tms9914.h
index 424c95ad85c6..6cbaf5a041e0 100644
--- a/drivers/staging/gpib/include/tms9914.h
+++ b/drivers/staging/gpib/include/tms9914.h
@@ -110,7 +110,8 @@ void tms9914_parallel_poll_configure(struct gpib_board *board,
 				     struct tms9914_priv *priv, uint8_t config);
 void tms9914_parallel_poll_response(struct gpib_board *board,
 				    struct tms9914_priv *priv, int ist);
-void tms9914_serial_poll_response(struct gpib_board *board, struct tms9914_priv *priv, uint8_t status);
+void tms9914_serial_poll_response(struct gpib_board *board,
+				  struct tms9914_priv *priv, uint8_t status);
 uint8_t tms9914_serial_poll_status(struct gpib_board *board, struct tms9914_priv *priv);
 int tms9914_line_status(const struct gpib_board *board, struct tms9914_priv *priv);
 unsigned int tms9914_t1_delay(struct gpib_board *board, struct tms9914_priv *priv,
diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
index 5f167c518c7b..4064320df4c1 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -66,7 +66,8 @@ EXPORT_SYMBOL_GPL(tms9914_take_control);
  * The rest of the tms9914 based drivers still use tms9914_take_control
  * directly (which does issue tcs).
  */
-int tms9914_take_control_workaround(struct gpib_board *board, struct tms9914_priv *priv, int synchronous)
+int tms9914_take_control_workaround(struct gpib_board *board,
+				    struct tms9914_priv *priv, int synchronous)
 {
 	if (synchronous)
 		return -ETIMEDOUT;
@@ -251,7 +252,8 @@ void tms9914_parallel_poll_response(struct gpib_board *board,
 }
 EXPORT_SYMBOL(tms9914_parallel_poll_response);
 
-void tms9914_serial_poll_response(struct gpib_board *board, struct tms9914_priv *priv, uint8_t status)
+void tms9914_serial_poll_response(struct gpib_board *board,
+				  struct tms9914_priv *priv, uint8_t status)
 {
 	unsigned long flags;
 
@@ -279,7 +281,8 @@ uint8_t tms9914_serial_poll_status(struct gpib_board *board, struct tms9914_priv
 }
 EXPORT_SYMBOL(tms9914_serial_poll_status);
 
-int tms9914_primary_address(struct gpib_board *board, struct tms9914_priv *priv, unsigned int address)
+int tms9914_primary_address(struct gpib_board *board,
+			    struct tms9914_priv *priv, unsigned int address)
 {
 	// put primary address in address0
 	write_byte(priv, address & ADDRESS_MASK, ADR);
@@ -449,7 +452,8 @@ static int wait_for_read_byte(struct gpib_board *board, struct tms9914_priv *pri
 	return 0;
 }
 
-static inline uint8_t tms9914_read_data_in(struct gpib_board *board, struct tms9914_priv *priv, int *end)
+static inline uint8_t tms9914_read_data_in(struct gpib_board *board,
+					   struct tms9914_priv *priv, int *end)
 {
 	unsigned long flags;
 	u8 data;
@@ -585,8 +589,8 @@ static int pio_write(struct gpib_board *board, struct tms9914_priv *priv, uint8_
 	return length;
 }
 
-int tms9914_write(struct gpib_board *board, struct tms9914_priv *priv, uint8_t *buffer, size_t length,
-		  int send_eoi, size_t *bytes_written)
+int tms9914_write(struct gpib_board *board, struct tms9914_priv *priv,
+		  uint8_t *buffer, size_t length, int send_eoi, size_t *bytes_written)
 {
 	ssize_t retval = 0;
 
@@ -620,7 +624,8 @@ int tms9914_write(struct gpib_board *board, struct tms9914_priv *priv, uint8_t *
 }
 EXPORT_SYMBOL(tms9914_write);
 
-static void check_my_address_state(struct gpib_board *board, struct tms9914_priv *priv, int cmd_byte)
+static void check_my_address_state(struct gpib_board *board,
+				   struct tms9914_priv *priv, int cmd_byte)
 {
 	if (cmd_byte == MLA(board->pad)) {
 		priv->primary_listen_addressed = 1;
-- 
2.43.0

