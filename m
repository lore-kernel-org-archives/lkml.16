Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4AF27468
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743433974; cv=none; b=sZPwatNU+AVPXvNhtww2i5VrfPxmhrCeJTca4w943qFVy+wW69aJ9QgsBsjyRbarglqbKHLmF9ZTs6Cy00tEd8oJdZwz+yLmGmi9kYvZgBqGRjKVsmeAXLKq61Vg7DT07DEk5NFhJT9vI9I2cepcJ1BlWKDhRf+U+zfZyy+5l6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743433974; c=relaxed/simple;
	bh=XcFZqpkFdfumCssHpY+R4EU93qtN+IaOOKM0uvxL5n8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s9kOYo3Xi3qNNvQ7pRmJByTK16PMjeXHjIHrIg+2pLrNEsaxCrxm5HttXOQtUF1zdOgGB2tyBzwbRdOwZh36n3/O8RB3cjU+lYAYwTqJDl4gn+ehQOlcgB8bzfM1VUfxTMqwSqQICrVNU1NHJXRpSc3+s4tKF/iBOzvlgceUUuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQVA5ycr; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQVA5ycr"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2264aefc45dso115542545ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743433972; x=1744038772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UQs6q6PQtFgVe2Al3n7AGyLmvRZf/U28ub434FoB4Us=;
        b=PQVA5ycr909ZUHzGlpkSM//VG1ZvGwh83tX21x9AS2jDuk8K+dC8fWS8N77/tT/bHS
         i6Ye3sORepl+Y1f86FsQHa3cyCVvVz+DDKZAHKYIYHsr0qY2o3TEk+ovvcrFADjrjLZr
         mCzfirFJ0SEvYJMQva9bTkbeDyUcXxKXySgnPnuXn759HZ78+7JIphYOsNJBTmgJgMaO
         sjlzDEX3sl305GkDfgU4cjO7RV2HMT75FPdH5Yevx4C09em239mTrIcwEjYA6fVVi7CY
         nzlFNIY42XWvvSQPa0CxELVs40289Efo2tkk6K9kJX7Li5HYxUZqf/iePZ/DH0TNqSBp
         Tj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743433972; x=1744038772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQs6q6PQtFgVe2Al3n7AGyLmvRZf/U28ub434FoB4Us=;
        b=Axy4sEOrNOj7pIvRR22rHMuySSVhEtR7mcLGjbIH2D6snp+OU95n2MHflCWFcCWk+r
         OVn5AnJjievcyZbl0/TBz+ascstkHyhmadBi1EDQZtKINKVaOzXDk+UGhkY9EYFmAC17
         qq5B1kAiyGn4Lw8gAsqw6tWMNFrX0YyVljh54rwWGMsZckaSQTjfcto+a8lptNVM44p4
         4QHSFmt8HfBXJ5gKM0AuLMaVbJE3o4ISoNTOsG+YF152b8pLEdPcCQ/c7boSS7kL0YzR
         xFF2dLkJrPYC5JyawuiMsadDnYJ2i3cjccFBhnmllga9OvzBBRGMs4rwwBwglH+qBIbI
         8f5A==
X-Forwarded-Encrypted: i=1; AJvYcCWOxTFD0akbmGBiq/9ciaOlJGiBd0oEW0pi9Ddly4bChLnXNTOorAPvf75tE0czHb6U08TvCaWYQKk6ezg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn2nK9IwQavSM+NgmPVXkbjSHA26LXeKbW8IgOsUOX8DAMsjKx
	5sC60Vq6Zbh49Zp6mfCOWxlnxK8IWWD1nXSfvMCTfDAw427nhHG1wcIhH05GWLyBfw==
X-Gm-Gg: ASbGncvFqkdkqp9w+rceK1On8zoFlRQT8lag6boiaOh8DDLRp0makhNP1Zq1X0/8dyp
	SAOirN26sfvZeMI+Pero/yagCyvdHWOMK9EvbjhVhzw9bRe5fnuxY7R40jefxx7SDNwNHpcBY2Y
	wQZuTc6RMIi45dMmx5w7P7uHrZZWQDOWKLLfDo5uMXU7LxYAb/SiigfIPXN6rj6USuCFMhXrMdY
	mhL0GVkAf1wO1ZK0DYfr0Tx4jED4XzRd8admN81p20g+kGlMCHUUcvYdmI8zSorLywUK8eK60vF
	pXI0GOIG4RaF9bKrmMBi1fgCCf/HDlDXAEcK82G0flIYdEsn4Ebo7kTf8cnZerQSndS7Nx6htlA
	xxiFzTQ==
X-Google-Smtp-Source: AGHT+IFu36yXNBcYaTdIut4XpIU2h0wu30Oj49ASXXvk6ejJjANWdSL5zYgJyYHCGhMg5H3r4F/Duw==
X-Received: by 2002:a05:6a00:b8c:b0:732:a24:7354 with SMTP id d2e1a72fcca58-7398033f3ecmr14860283b3a.4.1743433972309;
        Mon, 31 Mar 2025 08:12:52 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710684bcsm7033689b3a.113.2025.03.31.08.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:12:51 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: bsdhenrymartin@gmail.com,
	u.kleine-koenig@baylibre.com,
	arnd@arndb.de,
	herve.codina@bootlin.com,
	gsomlo@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drivers/misc: Add NULL check in aspeed_lpc_enable_snoop
Date: Mon, 31 Mar 2025 23:12:38 +0800
Message-Id: <20250331151238.13703-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL if memory allocation fails. Currently,
aspeed_lpc_enable_snoop() does not check for this case, leading to a NULL
pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Removed blank line between tags.

Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9ab5ba9cf1d6..376b3a910797 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -200,6 +200,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_snoop->chan[channel].miscdev.name =
 		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	if (!lpc_snoop->chan[channel].miscdev.name)
+		return -ENOMEM;
 	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
 	lpc_snoop->chan[channel].miscdev.parent = dev;
 	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
-- 
2.34.1

