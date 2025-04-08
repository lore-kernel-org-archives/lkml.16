Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB200258CCC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151842; cv=none; b=irecrt7GZWVbX3Ff9ggmAXOqdMjpJ3snxaKpZ4ihGqjA8vDi2z+z5EW7GHF8y07g5Q2mPrfzbHGnP5PF0jSP5B70m18Ey90EXmrUgO/Ry5DQWBQngsuUJVjeOdDMvHdSI0qSSGoZoa070s2saMOhGZcTDcYGSEPKP+XaX6Ewo3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151842; c=relaxed/simple;
	bh=7F6FhaL4ogWcnxhKShNpnm/dYuOadJGedBmOtrq5hbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTJ49nVrEi5rHXqGCXGir51paarN645VD4MhZon7X6vZd/6aplsaR5NqWPULgv2Z8Qc1sb4Lcf+sZjIr+nQKxP7r+yBJosgDh+6sYDyCQbeTUXUS3H8WcGWC4QBc2CXBCy/yrQ/svsj/Y5p0h2aB7Z03Mito7/ZX+OCA5Su0BKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=nIM4EUgv; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="nIM4EUgv"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736e52948ebso7147473b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151839; x=1744756639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+kyrdUmFMRxwM7TLfTUq/Q5pqKH9DQRyxYg9eWRSlc=;
        b=nIM4EUgvUtyeeqTNSpnTYKHu4TS4y5fupONmvxG5cPMi4Axrh6PckcesYZjdtxrKl6
         Mak5HIlGVB7KVOwRS4KFpmbSh21GiGdJBC18OgDcHOYdPYXMu0jwliffggit2luqXblM
         6/LUKMmqj+RHrd+TSvprjYynzHg8liua26AnFjRRRKM/dJcWznO7HhjftgcO/crD3/Ar
         yRAQbjQdLTXpBfg7rkkGKAH5gDMMjA/t/JORTmswS5epBWEJ75dM5bXU79EgLxXgzbQY
         ZLV3kAiO1u5/xtjm3ixjrKQx3jV7V7Dn3S94ljz85wiKBjEwXSUPQMhaJmHebKjwBEGb
         F0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151839; x=1744756639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+kyrdUmFMRxwM7TLfTUq/Q5pqKH9DQRyxYg9eWRSlc=;
        b=NS4kTs1F3GO9NO6hhFygEvrKUo+9pMgWXg7LUaHSfuAdzglVwoHZNyPzNHdqbUpbRj
         jlwUg2v9T8x4rPJatUSsisARonbvVL4o60DBf+aqN1a08ze21fCJC2RBRmFbF5MP84hT
         y4ckg60sYS8ihRLx1V42W0Oj3bx7XNAn2XpdCPpAnpBCBIowpVTwxF0+jDEr/0l5rSvk
         T5w8JGOugnxgHpFKqtg2aYPUgOJmQkYzGxrYNzx9zTetCB0Ath1Add8OIxfbUT77DcPW
         JmAxF44qEfabbgLBZlp+sUGBTYbCvtobRc4DeytDqNW/yZRUrtHykjxrao0vgQPAUV2J
         JnGw==
X-Forwarded-Encrypted: i=1; AJvYcCVbhqgdydQCeZngpoZKqUqEjRLDWxG28QLtfHF3fVRDuKk3fmcu/DjqTu0aMz2JIGWeHebXj7ul7h/97dQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx28s0ZUy5Eack6SIO2Fj1UPnke9gqAyfCvl4koyixlOdDITzsf
	O6w+lQkJauiKCIaz/r9Tk8q1AhIMecH9Fwa3Wb/G/FppZlqF4ItS0Et13KCHEg==
X-Gm-Gg: ASbGncuyk2kg+NRxIfW7tzXVCZbDNWFkZgKCxYfjFt5nUi+Kc2DMpa4cLc2YR3vMqmQ
	CweeH4mcukZGH0dReLxb7mStWKcfliZZQF/qDIShibaHxg8BuCXsEodiuTT0U7cy7Ecp7mJU4GS
	ma6QOrzQBa/e58zOZyljmdnHME2A57XYYFHxri+Pi/sl3+L9DpzWTSN/Umf0V3V2GAe8jRoizRg
	lgNyBIYJM/m/+SlXaFPPVupis62BNcrIqIgFZWaqXpXM17vr9z9dVtruCS/eoKvJ8uYyFdEF2ur
	gtE/jCD7jM43gj13KSil7uoz79MyWaDhEZv9Bb8y+W8jhvO0xEH41+h9H8gY42IBy0r5abLjUc6
	04/4K9uUWkJrqs1DsPyF+
X-Google-Smtp-Source: AGHT+IEHQS9JC2mKiQHcrs2AcKO96cjryH9ihDw9UUcv5vUP+SgmmoGFg6vz1axdsS/RsAHlHf0rXg==
X-Received: by 2002:a05:6a00:ace:b0:736:4b85:ee05 with SMTP id d2e1a72fcca58-73bae4d84f6mr799363b3a.11.1744151839039;
        Tue, 08 Apr 2025 15:37:19 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee90asm11550584b3a.57.2025.04.08.15.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:18 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 14/18] staging: gpib: lpvo_usb: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:54 +0000
Message-ID: <20250408223659.187109-15-matchstick@neverthere.org>
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
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index a4bfa95357bd..fa185171cc69 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -384,7 +384,7 @@ static void set_timeout(struct gpib_board *board)
  * detach() will be called. Always.
  */
 
-static int usb_gpib_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int usb_gpib_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	int retval, j;
 	u32 base = config->ibbase;
-- 
2.43.0

