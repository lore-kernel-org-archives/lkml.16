Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE81F099F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774936; cv=none; b=qqXRDwcd6+DidD+HYFoi6wORxN76woEc6Rh4JvlWh5FiqnHsdB23qzpdaKhxc8Zc8zEq792MUhSML2F+mFt7AYclyP4BNvakhpbnZa+H1I7PabrR75Ir3VV7a3rJApuwbgbo7WrVP7CmqQ+H+0VlQkeg3umo2+lOYQfP69e6iJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774936; c=relaxed/simple;
	bh=ZSeOpEv9FwaJSB+eGAyFO6sTOppKhI6DSLlTJPZijas=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CxokJWnq/WMgVZ6AfF4SZs9DJEmUdZqlPBtpGhVWd3o3w/ZbHnxfFtMgRDy/torNsQXH5QUJqemxQzUQYSiOoQ4DoCJyvS98zVZ4Iw9uRFpJJy4gAzNz+uhhcF0iL2cE+l0Ow6I3PpLw+2bSZbBgS/BTiDEe5JLJdUIHQ1Tg1ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmAw3upK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmAw3upK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C611C4CEDD;
	Fri,  4 Apr 2025 13:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743774935;
	bh=ZSeOpEv9FwaJSB+eGAyFO6sTOppKhI6DSLlTJPZijas=;
	h=From:To:Cc:Subject:Date:From;
	b=OmAw3upKNZz7a4Q9UDnMcmxfs+q1TG6YG82InBt0iNlYQHG3yiS3q6bp4/en/op8U
	 TuxGYNTF5si7kckkQ3dat0h2yqPGdtqTwW6YA8ZLjKFcXsHUOmLFtuFCWrsiXDAvm7
	 AFDEgKlEfJXlgLzgaV81S9SIj/tT6bemw8A0KMVfD17LC0Y0+N3fnIu4pRSFaXAhgm
	 3FpAhuFwFM6rtF5PlWJhrfLgTE46a1gzja8Nn8YfBgbUOi2TI7U6V6FMc9cvEjEsZ8
	 Kr5/napQCFWtc+2qhVvnAa+hFwgEz4fYhzcmA1DWX7zHwOpN1VVczw0BL62Vtgdc0E
	 fmRLbzOogstlA==
From: Arnd Bergmann <arnd@kernel.org>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firmware: turris-mox-rwtm: fix building without CONFIG_KEYS
Date: Fri,  4 Apr 2025 15:55:25 +0200
Message-Id: <20250404135531.2421755-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

"struct key" is defined conditionally, so the code referencing it
must be made conditional as well:

In file included from drivers/firmware/turris-mox-rwtm.c:29:
include/linux/turris-signing-key.h: In function 'turris_signing_key_get_dev':
include/linux/turris-signing-key.h:26:19: error: invalid use of undefined type 'const struct key'
   26 |         return key->payload.data[1];
      |                   ^~

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/turris-signing-key.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/turris-signing-key.h b/include/linux/turris-signing-key.h
index 032ca8cbf636..8a435b73c3a9 100644
--- a/include/linux/turris-signing-key.h
+++ b/include/linux/turris-signing-key.h
@@ -11,6 +11,7 @@
 
 struct device;
 
+#ifdef CONFIG_KEYS
 struct turris_signing_key_subtype {
 	u16 key_size;
 	u8 data_size;
@@ -29,5 +30,6 @@ static inline struct device *turris_signing_key_get_dev(const struct key *key)
 int
 devm_turris_signing_key_create(struct device *dev, const struct turris_signing_key_subtype *subtype,
 			       const char *desc);
+#endif
 
 #endif /* __TURRIS_SIGNING_KEY_H */
-- 
2.39.5

