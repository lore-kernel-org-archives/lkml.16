Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421D61F239B
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750523334; cv=none; b=Nkoq270MNoV/0wMpeKwrQMZMwb5/TlZm0NIeOwTVhw+7tTDf4XboQTREVpUmSKMDFDEf4qfkrply3QbSmKRfB9Mfv7Pl5jb6WmB8+BXKnpMhKkf+oxwg0PQAt07HKwPuq8F9nLSoNf+ALPHDJmWXkjf1X0Nkj4+R6va44cZoEhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750523334; c=relaxed/simple;
	bh=Br/AjUiqPK7kWS3d/p1T4f7jWJcitMJB/k21O5avM0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mKrRTA53ZmFTMOQs+BeSDfcSAxT6rUzJwyozJlX+iggg+7uY2r8WtkJgM75hJhptE12hWeS6hVquYFEtr3Y2IxLW+qIHs1D+K0C6XwN8UhfmHjYMimea3SbtC4C7gM28JfNwiRiiZ5AqWvr3BzJpancvUksnfKPeHd4RPnVPoLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=NW5GhdnB; arc=none smtp.client-ip=209.85.215.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="NW5GhdnB"
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-b31ef5f24b7so321295a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1750523332; x=1751128132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jqc1pNioaqt03KwmwQ7jb1MxVBLMpBdNgYbtBd1e3XU=;
        b=NW5GhdnBwU0xlJ5NsLYEEsg4VZeJbHAfcGzBOEmuGPMTCwIAD46mTXiAZzPy/z7W7r
         vrROsgrJZ5x6FDzX0H0SsBT8ImbiNToj8BSQYfA50WGBGm0uw2BeJI+cMp73CPYSdXMx
         2emtcemFp+Gqpfa2e3MxGkMW5Xjfc8GT+5OywsUHkD4KBriO/N33oZwxLlFZHnqbAEbx
         UXgDKrg23LuJOISYYoLH/w4EQEc7+W+D06A4c8L3uH5afFP0osb/miGzC+MRUx7oD0fW
         1e3kgvqhmD/zVKxdXgTZmF2QONZwCEjKXVQkgbjp9DVoGcHRdMwk4GOYyFjg0xyXrxw8
         R2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750523332; x=1751128132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqc1pNioaqt03KwmwQ7jb1MxVBLMpBdNgYbtBd1e3XU=;
        b=I0fACZO4IovIVPBN1xlsF803Cl1QD8ezVYr2Bi484BBxyo21re3nEH58bDVzmZb5Xe
         G8fD5Bu+I46CRZpVkqvQJJoXeJLb+951e3/e0m9xmv91pUgeUTsdOZlxwnscs1KAbe4a
         bCZDM6vkSFnGtR2I3hQYHc5gbh6y2QHCo9bV9Pw9ljkXXphaV1EHXT43ryGaA4RuUNeV
         nyj0GKX860+ooO+liTNyy2AN/xIs16RANOutYsulbAOXb1JO1pT0K56EES6wu6tvxggV
         WJAUf/UQlOkifIw62kG8Kn6oRNTC2xmZdg+BsKbu7uskI03IfvZTx50P1G0xiDHmtZV0
         xGmg==
X-Forwarded-Encrypted: i=1; AJvYcCWjiWAt+a9tED6RuCrBoARDa747jGzK8oJMwU79G2NfllgX6d12LyohKOHLuGeZ0MDXl9Gx+2/xDUKIQ6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxscMgVGgUigvv/dGu3qHmD3SPaYL6RbV9DXp4Xx9KFAEFAlRdO
	CzeGuuvp5D92b+Kzdo+u8xb1a9LGZp3AqsfUIzAJv8fYmSKOvA33+nwvwstbSwZth7C+VPgCnxr
	yNfSm7WxdBkQgkVbzXKE2WnC6xvNaPZJKE0dF
X-Gm-Gg: ASbGnctcLZg5vTNzqXB982Q6FwvkeY3iwFKfIPvNvc4qi5L9yvxpD8dtsJzkcY7uVpF
	g9Tdub4hbd/DydFGGSuK6+nFcIRD8AES5dNfrk4lxpez45KZ0cao8YQO9kdOiu+zEcHehEPCSOR
	YdmMDAxtNGmBhfnre7J690DkHJJ5z2NilIi6d34cccEeNyQemWHbQsNz3oyyTwAM4HZb+nzaCg+
	757kVlMdAxzTQ9cqynOBv2ce5DI9L6MCgKxWbWAt+s9V864LjEd5LRDcEeSelwv/bmh1fd6yjD8
	BDrh2FVEkClpBLSNSr0qufgh2ib7PnHeSVMk1jgCiLv4mNnh8gYS5VE=
X-Google-Smtp-Source: AGHT+IEBFdypyH71FaCNERa1yO+D1fgnOThDQ8WvWeH0QQB+6Sdy5Xr31fsXZ/ez38hI2Xk/wp4CgKkZkJ4t
X-Received: by 2002:a05:6a00:a1f:b0:736:559f:eca9 with SMTP id d2e1a72fcca58-7490d6117damr4263850b3a.3.1750523332468;
        Sat, 21 Jun 2025 09:28:52 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-b31f1259cfcsm222403a12.26.2025.06.21.09.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 09:28:52 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::1199])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id D48AF3400D0;
	Sat, 21 Jun 2025 10:28:51 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id B7A81E42425; Sat, 21 Jun 2025 10:28:51 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ublk: fix narrowing warnings in UAPI header
Date: Sat, 21 Jun 2025 10:28:41 -0600
Message-ID: <20250621162842.337452-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a C++ file compiled with -Wc++11-narrowing includes the UAPI header
linux/ublk_cmd.h, ublk_sqe_addr_to_auto_buf_reg()'s assignments of u64
values to u8, u16, and u32 fields result in compiler warnings. Add
explicit casts to the intended types to avoid these warnings. Drop the
unnecessary bitmasks.

Reported-by: Uday Shankar <ushankar@purestorage.com>
Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Fixes: 99c1e4eb6a3f ("ublk: register buffer to local io_uring with provided buf index via UBLK_F_AUTO_BUF_REG")
---
 include/uapi/linux/ublk_cmd.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/ublk_cmd.h b/include/uapi/linux/ublk_cmd.h
index 77d9d6af46da..c062109cb686 100644
--- a/include/uapi/linux/ublk_cmd.h
+++ b/include/uapi/linux/ublk_cmd.h
@@ -448,14 +448,14 @@ struct ublk_auto_buf_reg {
  */
 static inline struct ublk_auto_buf_reg ublk_sqe_addr_to_auto_buf_reg(
 		__u64 sqe_addr)
 {
 	struct ublk_auto_buf_reg reg = {
-		.index = sqe_addr & 0xffff,
-		.flags = (sqe_addr >> 16) & 0xff,
-		.reserved0 = (sqe_addr >> 24) & 0xff,
-		.reserved1 = sqe_addr >> 32,
+		.index = (__u16)sqe_addr,
+		.flags = (__u8)(sqe_addr >> 16),
+		.reserved0 = (__u8)(sqe_addr >> 24),
+		.reserved1 = (__u32)(sqe_addr >> 32),
 	};
 
 	return reg;
 }
 
-- 
2.45.2

