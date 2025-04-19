Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875F686338
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745074795; cv=none; b=qTKri/RbSJ5Af3FSRGxsgCNqSfHnd7PVjLO9X9SWLAXU5WutZRVpET2p9hdRfIxgBOr3fhMi/v0wi8+SWYQCl6fFZ6q+QxpCB52mAH2Ex8qZTAySP17QnxPkJcl3sSXebRaoWO+KohzBN7GMkl+JsGjrvXVIa+3V+RAf1VthZoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745074795; c=relaxed/simple;
	bh=IpgN1Njnfk7mBYg5twRHN7Yx0wpZkPBTRXAWA+XrYf0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YLOyehtIjhcffsWLdLT2qwUq687sVHaeV/zse17n4k7VYoTnZ7b8LHcFaW6v/pLdvhJ2Un6ulHIj1qzSrWa5LEq7i85cRMU5hezjncLn3mMHOaTSeOWkY+K+oyIWK0+If/r/5VwqXAWlcc6mjYYF7w6ocMQ2hMxHP8hokOT9hCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXN1wlHf; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXN1wlHf"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30ddad694c1so28723061fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 07:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745074791; x=1745679591; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=92Xlbjn8pcllk6A3nj5D1Xc4Q88TIuQccR7PFHaH3ew=;
        b=QXN1wlHf71O/OIhTS+yiMMsA2u1ZQnJDqswalKlFoluvSrj7Rb2daWpqbzrfw8kImA
         IS68h84l05thbxpD+lKk4F4hJfNqsVYpuHutMONIJNeaEz+M4y+NInlIU8k6yTBJCY0w
         BvCGxkBfuqJQvCV9LfU/LVuA0YYjb+B+1+lI+VkBOJNhProqyVnLgolgujGVANA6A5FG
         zw++c6M5vRTR4ZuuPHpJOPrptpNd/Lw21jx/tPWwrRz8VlLi4go7QxC+2uS7pWJelHzN
         NoJ9+b2DX5babF4EGcZq4NjKqTcrj+nLn4SFNmEyVx5OJTmZqT2o7eLAuTt6tgCXFiwr
         ZrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745074791; x=1745679591;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92Xlbjn8pcllk6A3nj5D1Xc4Q88TIuQccR7PFHaH3ew=;
        b=P7yJmFnh3QsguKSXjuLXK6qsSSGlVlJEHIM16xcSwN2XZo9gdVxvQtz3hW/jXxIoNK
         2RoxU/UA/bNxJ87AE38CGXSVvtjyDDCVRmVtlcMO0YeqY2pgv4KJ9cc7R83pQBwJjdkn
         GLtBXqyDOFu6ze+VR83DbgT4zhRWbL1NJgJ8cWE/NaLLQeyQrZcbJwk2xP/a92niIog6
         bcrBNMv+Zz2AJS8wk5LiJMxRfpVXupJkHiyGt93WjCf3QMYHyFWC2yOvPl8KEVTdvZlA
         fjyTZegpkwcbEzSVtfsjIj37o0iU8ym0vO8hJWS2/XP8DLgrpgUMW+ofu9oq8XS0TLpT
         PZAg==
X-Gm-Message-State: AOJu0Yy3XBBnyT96W+Q6MW8wxLsDqcWk4V3kyVUiwBf21zZindljPty/
	7IrpGiH6ZD9teDHEEhEcC74PMgSBcBOr+6urkl+v7qutPJ4aai5porvxYpLZwVoDDe2AJ6I9w8q
	9mC+NbNBBDgB4Zw0nHTAmYuvYhgTyQHtDYY8=
X-Gm-Gg: ASbGncsvg6cgErMaaUy+xrmZqIaaZT5rz6cX7WwDrSnzhTRlhOnlkNWBBYIS0ZgsIZK
	1LVkiz59AbbACkdC0C2G2Ff0aSQZwAxFpf+0wFCnHbyJRlUBclzduKRGfUuHpcsLZz/AzQ12Fwa
	1Qg3VIl/WVM3ui8rEQTpNUUXo=
X-Google-Smtp-Source: AGHT+IElNtdDgnVEFHqfumsQoyd2kLBcy3Wmuft3U7LxnSZrMXTqLsjKqe/2w2yyWzjaqOBUCDEhlx675DrZsgJtrwg=
X-Received: by 2002:a2e:a883:0:b0:30d:6a17:518b with SMTP id
 38308e7fff4ca-310904b266amr19460431fa.5.1745074791471; Sat, 19 Apr 2025
 07:59:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tinu Kuriakose <tinuk11c@gmail.com>
Date: Sat, 19 Apr 2025 20:29:40 +0530
X-Gm-Features: ATxdqUEcYzVQfdc1V45SLVdCd8VT8pS7Rl1Om4SH12mvUXEpZ7QQv2RYg_YDPj0
Message-ID: <CAC=vsvCmQncx=vov_OM7WvyXaBt9N3pQnG6DNJxBBd0tkzi3Gw@mail.gmail.com>
Subject: [patch] Documentation:fixed a small typo in Documentation/hid/hiddev.rst:11
To: skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From c7594b07c54617f552d39617714b042e5b7a99b8 Mon Sep 17 00:00:00 2001
From: tinukcheriya <tinuk11c@gmail.com>
Date: Wed, 16 Apr 2025 01:28:28 +0530
Subject: [PATCH] Helloworld kernel module

---
 Makefile     |  7 +++++++
 helloworld.c | 20 ++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 Makefile
 create mode 100644 helloworld.c

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..0b7a8ac
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,7 @@
+obj-m +=helloworld.o
+
+all:
+ make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
+
+clean:
+ make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
diff --git a/helloworld.c b/helloworld.c
new file mode 100644
index 0000000..7bcc53b
--- /dev/null
+++ b/helloworld.c
@@ -0,0 +1,20 @@
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+
+static int __init helloworldinit(void){
+ pr_info("helloworld kernel module\n");
+ return 0;
+}
+
+static void __exit helloworldexit(void){
+ pr_info("goodbye exiting\n");
+}
+
+module_init(helloworldinit);
+module_exit(helloworldexit);
+
+MODULE_LICENSE("MIT");
+MODULE_AUTHOR("TINU");
+MODULE_DESCRIPTION("a simple helloworld module");
+
-- 
2.25.1
