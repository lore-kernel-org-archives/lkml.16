Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73EE256C9A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151833; cv=none; b=BpcOwKU5XT5/NkXf0Nk5Th4ATIBNhRspaYHbaxDAGcbWnksdoXxejgCVNJzvAToL7BjmI9x0t4XVpB2uPbCswAqkznFbHRjyhjdaKzB4mt4zu4bsJUUdd15XTtanePABwjjKpYhMvLCKdO2I6xK2nDqIT4Vji5BFmX2/NvQneJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151833; c=relaxed/simple;
	bh=X2KhSNYsB2/23tHVl1psd3ZQKbNsc1BjZp9JQ+vPiUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qfEUbxVihmbic579Rvx+rvnfRzGp4jxUtgFSsQTFMLhTZzo3Y+yLG0qPseD0rMId9pkW4JgwmcVLZG3jO+aOuFGD9qp73OZ7ShaoUcDg0LTe8z9NYCYkj2ANmHVd5YISiVpVVLeZTS8SBHUqO+A9Mo8gS3YTErUT4JfXTuYLaRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=APCcDVp0; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="APCcDVp0"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-739525d4e12so5552049b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151831; x=1744756631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KxdZYlQTl7PeDblUTMa5/yJKQsZIFffGHGPPKkxlHI=;
        b=APCcDVp0JYdZyHKx8PfGaqFryyGrVJzeK2RBX8sH5M5Ktcz86WCPshOGAQ/W+c2NOq
         mfly39eDjDD6MJoJGu0oAaBcNEFXeU8Kv4Od5ntrQq3QYF4zB6RSV7HC0k+ZP9zdbcsI
         FNkCJmWs/dxxG9V9br1y5wmd/fGkksUzLbmOAotXwVcOAMRjA2TYATKtyEs5lChg4IEE
         PvjIH606F7UiDp/DRLpobNZSzr4WFTfuOXv9xHK5SQm4bDgBXqz2AxUD+Z83v6N940e4
         9adDKKs08CDo8XgULihU5DDcaq6JZnoycUzeX4rDw4yfE+roMgHEvsFqB1FUG5dqcUM4
         xENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151831; x=1744756631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KxdZYlQTl7PeDblUTMa5/yJKQsZIFffGHGPPKkxlHI=;
        b=GDmhh42YsJxYRAyDN+E1oXjrnkrTFe19SV8sjPTchJT6HWc345VWOkJ78SJWF6kzl8
         XeVU9P7enYBAmPclto5iFb6Sl1XU2LlSC11TqsEZg56OjWd0zuLmM/gnJX+JfW+CvsKC
         1Pbty3EG2MYbnxOQVluv4MSI+rGp/X/0aVwD6PTxtPUQW2d/1WITtELbvtQgUpveldGL
         DkT9nB8HA2VAIaucfcdOYSZ0IyhvpulFqi6jwhvZnDyPq1oDQOHw0OXJPP3ViDDnlTH/
         1+TuhmZrmXNFGM+zS+CGgIvpV3d7WQW7Kwi4NsLn9VzVqJ0W8Ws1C+MGAw9pwuy/bbiE
         bwrg==
X-Forwarded-Encrypted: i=1; AJvYcCXC7qPN6fq4BFYs1ccZNJCk8EE08oo7nyOwWZtEt+H9fDIRgw8kY+45n3Y7lK5RMvgUKwM/RFXCH7cdfpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyydaOiyS5fJi5Dm1CY5Kky2wxua/CGFgHVnHTpvXCQC4xpAeXf
	pAaJInUy/NKFejSMT5IEqwkcEMBKyM8GUetdrdPatJW+90SX+T2O+lE17+PNXw==
X-Gm-Gg: ASbGncsGaQvCf11758eD+s9TYRc5Oz7lzUq1ILjx7DKWm8DeaXy7BKjnkyy+yZ1itBr
	e3Pwwj4Wq8Ljtnhq++v2+gq7m0Cm1aEu/OqdB4ELTYq7aq6Ix45Obsft2JuqJhVjVFKBcJF6qrX
	/1nHahnGKMeu/sGAGIu8SmkPW+Nw8M1cNbfz6Uqx/HdZVno8BaaBLN+FASP5I8JgU7/MRjM0Ezt
	fxwoeJSfAqukQOc4TQeoN7XnqH91lJi8o1Dgvw8OKIdHvE6mbA7UI5+lhjy1BYnTpJ0/ddgLCD7
	yBDzEwcYNZ6MQzHLE8+BdUJHvuA9HO4jyOg2fHEv077Bt44OTC0aa5AGEybPwxMTimsriri9oCV
	bt92lnxXybA==
X-Google-Smtp-Source: AGHT+IELnbIS31LEPqBsQyZVs/Pf5TPwyZfntfuAq7loIQm+HN4BwTJihQ4iJwPvkxGmFogIT1uUNA==
X-Received: by 2002:a05:6a21:a34c:b0:1f5:82ae:69d1 with SMTP id adf61e73a8af0-201591ce35emr970643637.20.1744151831029;
        Tue, 08 Apr 2025 15:37:11 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41af71sm7939275a12.75.2025.04.08.15.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:10 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 07/18] staging: gpib: eastwood: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:47 +0000
Message-ID: <20250408223659.187109-8-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 68f888a75edc..e1f8598e4e04 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -24,8 +24,10 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB Driver for Fluke cda devices");
 
-static int fluke_attach_holdoff_all(struct gpib_board *board, const gpib_board_config_t *config);
-static int fluke_attach_holdoff_end(struct gpib_board *board, const gpib_board_config_t *config);
+static int fluke_attach_holdoff_all(struct gpib_board *board,
+				    const struct gpib_board_config *config);
+static int fluke_attach_holdoff_end(struct gpib_board *board,
+				    const struct gpib_board_config *config);
 static void fluke_detach(struct gpib_board *board);
 static int fluke_config_dma(struct gpib_board *board, int output);
 static irqreturn_t fluke_gpib_internal_interrupt(struct gpib_board *board);
@@ -943,7 +945,7 @@ static bool gpib_dma_channel_filter(struct dma_chan *chan, void *filter_param)
 	return chan->chan_id == 0;
 }
 
-static int fluke_attach_impl(struct gpib_board *board, const gpib_board_config_t *config,
+static int fluke_attach_impl(struct gpib_board *board, const struct gpib_board_config *config,
 			     unsigned int handshake_mode)
 {
 	struct fluke_priv *e_priv;
@@ -1049,12 +1051,12 @@ static int fluke_attach_impl(struct gpib_board *board, const gpib_board_config_t
 	return fluke_init(e_priv, board, handshake_mode);
 }
 
-int fluke_attach_holdoff_all(struct gpib_board *board, const gpib_board_config_t *config)
+int fluke_attach_holdoff_all(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return fluke_attach_impl(board, config, HR_HLDA);
 }
 
-int fluke_attach_holdoff_end(struct gpib_board *board, const gpib_board_config_t *config)
+int fluke_attach_holdoff_end(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return fluke_attach_impl(board, config, HR_HLDE);
 }
-- 
2.43.0

