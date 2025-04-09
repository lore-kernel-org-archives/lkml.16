Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73AF27604C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222200; cv=none; b=WIkMvwzljgA3P4wdz8pAtxnnL8Aj4voViLAZxym7qdXdj9nJI2X5CVsrShaDwZNsA6FYc3KO2iuAPeWWCU/0iDbC491vKMkujFUB4sn0Eb5rr65n3/FM50nhQG/ZtsyrWRCgWWQnEUKmfm5eCx3+LzWjYGCro6UbST2pM1/Ldig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222200; c=relaxed/simple;
	bh=jv0LIyQ/kXORfNNcRuXF9G5dZ9Omkw842xxoFqD7IHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYyl83XqC3pSDUmNxBCAqX7ZtdSJQ52NrfxDFCRLsDSg7WphKCEw0AgZWEZnNV3v3F3XEUkRJvp+GO7j6ddgJIDrUa2q2I9iA2YkNwEnsYyre+17/S1pOgQQDLla+EIQMMgA/7AtcfQ7slyYn0mvy/Is+awl81OiYTRf2F9/OtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=XSfgVsQI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="XSfgVsQI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223fd89d036so88426335ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222198; x=1744826998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geiDrb7/j3k3dfNthoTd3Ix1fwxNOoI+cRfZOJm5C8A=;
        b=XSfgVsQIS+e7Ajk9OcD5EJNoLPFJs4TFC95+uaC7P/jdwFDM4HG4OI69f230PWR1m6
         FsTL4/d6ivJ8PD4/XpFaQ4JuidOMqb2vaHT3EiAg4y9xgVp8EHFMZcVGNXmr5WCWE1Lf
         KWN3lQ2zCfA+BJpv/ZMaaifwLAQx6Y36AdQpF0s7HoJvEBd4F7NhcrurAgjp8xhKGai3
         YTrEyF8rPw+urXRDGrn9k32vZ4cehNDABsz5DSzSVQaswU/pTLWX85cCF6lqopQ4GXKy
         YmCyxdto8jz0iiPfYgErT0ZueLet0NRQJSEI4OYCPxRikZOJ5XO4VZGjWTtdsnK+2SBI
         e8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222198; x=1744826998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=geiDrb7/j3k3dfNthoTd3Ix1fwxNOoI+cRfZOJm5C8A=;
        b=IT/VtQvcpZhXU5py7hQfY/1hhuRR3lcHwSm3BGGJQsSJoZPc7B2ROH09aWcPA/5jpm
         rcwrzbSnwzGH0eGNlP+AkGx+oknFhcpIvVNNehLLv3l4esvHC4wpVqzonmiGw9AZFi36
         ONCzDTmVrYehe845s215ZGjRvf4FL5dof+LThVteO/J8f98ZIcYprWn64y7pE3V3nbar
         GoBu000cMC8hmJrvqYxuOs1nUhKM6rXRSOFyhscBOO3lpzBcsLCMlw+Unt8Q+Grwa2ND
         Wn5qwVZYShxSbiagIgooEnwQLBfT3b/yGci/sPdKlMaBjiKSNovnAa5ktieYp4VHwWwW
         6epA==
X-Forwarded-Encrypted: i=1; AJvYcCX7AbQfpwedUdWlRycPcsWukEKAbzjwZ+gGVPupzdtfbP486DvWRW3FDhybsezJyrp3AF6K/cXQVAEs0W0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWu327dlgSjeciUlJFej6U8BneUEZJbilvwuyjI0LUHapAA8mu
	HYxo6yVyz18DSqX5VPkY3U7FxuUirymwGlKlT00/i59etWt1SAAhRi8osG5cpg==
X-Gm-Gg: ASbGncts2SdOzQhYCZpe9U6QVDzNuRNhSGm/FUaTz+yMeycxCj+7ps6y0mmyes5PNxY
	at/3D6pS3LFAxLKBPJSn4eZAYfO6wg3j3Nj/2hxpufQsezYkla5WPX4N2aAkew9Z35wKQRj0ts7
	xRBZn4Nc1c2T2ZZhsTc7+ox1IV9NM7Um9lBYDA89BN37NlbN2HJ4l2QOO4nVyXvxZOYOw/1amY6
	OTDZ/bFvKlxwjESdG5B2RBcLQ0BasQMAZPbffIGnu0Zci4HxA3VeGvwnlpUYwKQq8xdngwXXK+n
	dmIq9fxwiIfScewl1EahISu9Iyl3e2UctO0pTdvU654R6upNqb1uNHP+Y4RHOWjIQDwBn1NibQT
	/6rLDVA==
X-Google-Smtp-Source: AGHT+IEaYugd1Bzmxdo25O5eGf9bDCkGUg2bWy9KO82Cpyr3wcHbDMDauKCI7GZU/MWDQ42LhRRkqw==
X-Received: by 2002:a17:90b:6ce:b0:301:1d03:93cd with SMTP id 98e67ed59e1d1-306dd556630mr5319095a91.24.1744222198056;
        Wed, 09 Apr 2025 11:09:58 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df09071fsm1814296a91.25.2025.04.09.11.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:09:57 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 02/23] staging: gpib: ibsys: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:32 +0000
Message-ID: <20250409180953.398686-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/common/iblib.c | 12 ++++++------
 drivers/staging/gpib/common/ibsys.h |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index 6c13e3e917e0..632653ea45c7 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -96,7 +96,7 @@ static int check_for_command_acceptors(struct gpib_board *board)
  *          must be called to initialize the GPIB and enable
  *          the interface to leave the controller idle state.
  */
-int ibcmd(struct gpib_board *board, uint8_t *buf, size_t length, size_t *bytes_written)
+int ibcmd(struct gpib_board *board, u8 *buf, size_t length, size_t *bytes_written)
 {
 	ssize_t ret = 0;
 	int status;
@@ -297,7 +297,7 @@ int iblines(const struct gpib_board *board, short *lines)
  *          calling ibcmd.
  */
 
-int ibrd(struct gpib_board *board, uint8_t *buf, size_t length, int *end_flag, size_t *nbytes)
+int ibrd(struct gpib_board *board, u8 *buf, size_t length, int *end_flag, size_t *nbytes)
 {
 	ssize_t ret = 0;
 	int retval;
@@ -343,7 +343,7 @@ int ibrd(struct gpib_board *board, uint8_t *buf, size_t length, int *end_flag, s
  *	1.  Prior to conducting the poll the interface is placed
  *	    in the controller active state.
  */
-int ibrpp(struct gpib_board *board, uint8_t *result)
+int ibrpp(struct gpib_board *board, u8 *result)
 {
 	int retval = 0;
 
@@ -358,7 +358,7 @@ int ibrpp(struct gpib_board *board, uint8_t *result)
 	return retval;
 }
 
-int ibppc(struct gpib_board *board, uint8_t configuration)
+int ibppc(struct gpib_board *board, u8 configuration)
 {
 	configuration &= 0x1f;
 	board->interface->parallel_poll_configure(board, configuration);
@@ -367,7 +367,7 @@ int ibppc(struct gpib_board *board, uint8_t configuration)
 	return 0;
 }
 
-int ibrsv2(struct gpib_board *board, uint8_t status_byte, int new_reason_for_service)
+int ibrsv2(struct gpib_board *board, u8 status_byte, int new_reason_for_service)
 {
 	int board_status = ibstatus(board);
 	const unsigned int MSS = status_byte & request_service_bit;
@@ -677,7 +677,7 @@ int ibwait(struct gpib_board *board, int wait_mask, int clear_mask, int set_mask
  *          well as the interface board itself must be
  *          addressed by calling ibcmd.
  */
-int ibwrt(struct gpib_board *board, uint8_t *buf, size_t cnt, int send_eoi, size_t *bytes_written)
+int ibwrt(struct gpib_board *board, u8 *buf, size_t cnt, int send_eoi, size_t *bytes_written)
 {
 	int ret = 0;
 	int retval;
diff --git a/drivers/staging/gpib/common/ibsys.h b/drivers/staging/gpib/common/ibsys.h
index a9fdf95cfa96..e5a148f513a8 100644
--- a/drivers/staging/gpib/common/ibsys.h
+++ b/drivers/staging/gpib/common/ibsys.h
@@ -24,11 +24,11 @@ void gpib_deallocate_board(struct gpib_board *board);
 
 unsigned int num_status_bytes(const struct gpib_status_queue *dev);
 int push_status_byte(struct gpib_board *board, struct gpib_status_queue *device,
-		     uint8_t poll_byte);
+		     u8 poll_byte);
 int pop_status_byte(struct gpib_board *board, struct gpib_status_queue *device,
-		    uint8_t *poll_byte);
+		    u8 *poll_byte);
 struct gpib_status_queue *get_gpib_status_queue(struct gpib_board *board,
 						unsigned int pad, int sad);
 int get_serial_poll_byte(struct gpib_board *board, unsigned int pad, int sad,
-			 unsigned int usec_timeout, uint8_t *poll_byte);
+			 unsigned int usec_timeout, u8 *poll_byte);
 int autopoll_all_devices(struct gpib_board *board);
-- 
2.43.0

