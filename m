Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D3A24635E;
	Thu, 17 Apr 2025 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744896540; cv=none; b=Ntb8n2RyuGYUxvT8Rj0Z4P1kvnxroz0Ewwz820RSe9pcHT8sx25aPaKU2kXo2pjtjm06p2oifqlYEBi4/9GRrGghz/nMKnfI04Z49gIiC7Gn5SzxkOYozaWHtRKOCiae3NymWD67MzZ6PInXaIR62hxeau+XLJrMMENsGsCi6Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744896540; c=relaxed/simple;
	bh=Wb5FML++ffu7BKTnVHKn9Qktq8g0SdVudA58F5+Hafg=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=k9jRsHbExytI3OP4J/Q2BBFE+6o1Gd/qW/S64RdS/n1DT94TmHSxgbQ4maUh5QXzAE8axuhmwS8iZIisC9CL4VpzvTktzJ73TXn3xATORmHxiI/vKz1DqoAAgrPFu8Ueu0b17wM21S6lOKf349zq5K4+c5hca2gL+0VvDBxQsgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=QUmikXXv; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="QUmikXXv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744896223; bh=P6Pul/+ArKPg34akN0qY9pzKeWou+xvJwhzhlTJnEiA=;
	h=From:Date:Subject:To:Cc;
	b=QUmikXXv1qOIAjI2kO7C5q4dJqxYEVGSea0Q41ROwR71HFHcOf4adngB+dbkshpog
	 +w8J2Scd8pMS0s+JQMB/GPGACeYPcl5XQe8YwN60kpZFs2JSqIGgEzwVzUCtwUdpv0
	 KFx2M9hO9/7Ss8Z1qarX9TsNvbUVnyF8dz9gQiuM=
Received: from [127.0.1.1] ([112.48.46.45])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 5E928AC7; Thu, 17 Apr 2025 21:23:41 +0800
X-QQ-mid: xmsmtpt1744896221tejjf7pu0
Message-ID: <tencent_BA80A2305727877DEE7BE20655D9CA825B09@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5SfsZIqWlqfHM8mFg5y9TSNOBVhYHOKcwmrijH8Te5f7Ue4yOKK
	 zG10c4DkehMtofINRJ5Dc7Uetd4MoNHC1qnAXsZzQs0K98ZGdEDUO9jmpuW+o8wMk/ZXfOEhUZco
	 4NkaZBoxigVY2LkLdvwvXaC4OAH4w4qx0pTfVGLRpm9IEUdiMTz6u5CMUup3nvXMmqI605yuiLzj
	 /xkSuhbCeML9Bow1X3bHs8DLTkEcXNl6UWg5JFxCStPSH6cNhgUOjTQWYe4oF0P6rethacc9UAqW
	 KwTI2jp4ipHDp6EzmeuPKJao3vKYPTH1E9/EcABxweOTFb7OhXLTD92nkqxddzwaj2eaV4QSx3sG
	 RLou+b2r3AK/8Dt1W497CtzV+BaNrbmGzX12YC2i3SNkprGyfYq16/3R+VAlcb+WdzK5d3UTfEmQ
	 0upvB1xNbU+CrV13A3RFIi5lcZUXgHkYi20K28/u4QlrPc6z/lr98UCxGl5UNgDSJfrMk+uIo70a
	 5mjnQvq4NmgqSDeGgW/EwTPvTMbzujyx46P61ZGjJrFkrjLq5mpVVEHak1O0hSyISOeixpXFzt4u
	 O2cVwdd3YwIr8aRRYDFpeBukDbJi4+kJF655tRQ/I7rSZJZ0OMjvDCz5t7W/DYO9y1PoUFw/FGzr
	 C24J8f/te8GMX8Ai3d/4pGky7bgaJOLxwdjkLHWRxhiJmqr6v5I2w+WBRQ/iuMnK/OpNZDAEQJoT
	 NVD9OovwsOuvQJCmwm/nVdbIu+YNwmD988nacO+hP3ZQzNY7ol7Xjq7/c1dp9N1UXGSDOOfBaNKq
	 3QPt3qZgQIxQH3o3NGXOGumtdCGRanIN7Fr0VnFJb+wH9ogF1llqeGo+n5UDtlRJ72E3qFI4w/ID
	 8v1wUfqqZj87Im3jVmt7DL+YavDiQ71Cv84/lrN2xoiwNV9SteNWNK5pyZ3qJEKSdJ4ch+fbMWNj
	 Dflsf7mARKXGZCx1uEZZBfo3+mH9X0TfpsS3nR2Hm9dfs3Mfa74iSSTApquAMUv8YS1OQSpwxBDW
	 B3foKdBzchIpa/08UHhXrMumXouKE7IFEL+uqMtsdw5tGM12ZTSY2aEWZ2K9D+bOdj3hSCANpLCV
	 3oZ3Ow
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Liya Huang <1425075683@qq.com>
Date: Thu, 17 Apr 2025 21:23:38 +0800
Subject: [PATCH] of: Build warn for missing fn() in _OF_DECLARE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20250417-_of_declare-v1-1-945a4b69c984@qq.com>
X-B4-Tracking: v=1; b=H4sIANkAAWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0Nz3fj8tPiU1OScxKJU3cRkC4MkU8sUS1OjFCWgjoKi1LTMCrBp0bG
 1tQCd/pH5XQAAAA==
X-Change-ID: 20250417-_of_declare-ac80b59d952d
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Liya Huang <1425075683@qq.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744896221; l=2083;
 i=1425075683@qq.com; s=20250415; h=from:subject:message-id;
 bh=Wb5FML++ffu7BKTnVHKn9Qktq8g0SdVudA58F5+Hafg=;
 b=AGvWJer6vFeAeJbpmXk0wlvtVa/tkbFAWt9i5DioScxeU0tQOsA578r//3ekgZZW0yNGV5IgB
 eKSRfH6YwZzCyXeDEflFcqrAPDHzXitr6u0NcfgrH6DsAAuHx4rIzRq
X-Developer-Key: i=1425075683@qq.com; a=ed25519;
 pk=nSnzeGGcMXBimuyIWYIZpZRN8DboZqwr67IqWALwrGs=

The function pointer fn() in _OF_DECLARE macro might be NULL. For example,
in __reserved_mem_init_node(), only non-NULL cases are handled, and NULL
function pointers are ignored.

This patch introduces a check to handle cases where fn() is NULL. If fn()
is found to be NULL, a warning is issued during compilation to notify
developers about the missing function pointer.

---
The function pointer fn() in _OF_DECLARE macro might be NULL. For example,
in __reserved_mem_init_node(), only non-NULL cases are handled, and NULL
function pointers are ignored.

This patch introduces a check to handle cases where fn() is NULL. If fn()
is found to be NULL, a warning is issued during compilation to notify 
developers about the missing function pointer.

Link: https://lore.kernel.org/all/CAL_JsqK733Q9bbxC0Wz5uxyZ9m7bs+bci5kUJF9GJMv73-dO4w@mail.gmail.com/

Signed-off-by: Liya Huang <1425075683@qq.com>
---
 include/linux/of.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index a62154aeda1b6a600c2b155ac486c0e0b56e0bf2..99d1d553e65b7970a3ecb5158774ca5185f297a0 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1523,6 +1523,7 @@ static inline int of_get_available_child_count(const struct device_node *np)
 }
 
 #define _OF_DECLARE_STUB(table, name, compat, fn, fn_type)		\
+	static_assert((fn) != NULL);	\
 	static const struct of_device_id __of_table_##name		\
 		__attribute__((unused))					\
 		 = { .compatible = compat,				\
@@ -1530,6 +1531,7 @@ static inline int of_get_available_child_count(const struct device_node *np)
 
 #if defined(CONFIG_OF) && !defined(MODULE)
 #define _OF_DECLARE(table, name, compat, fn, fn_type)			\
+	static_assert((fn) != NULL);	\
 	static const struct of_device_id __of_table_##name		\
 		__used __section("__" #table "_of_table")		\
 		__aligned(__alignof__(struct of_device_id))		\

---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250417-_of_declare-ac80b59d952d

Best regards,
-- 
Liya Huang <1425075683@qq.com>

