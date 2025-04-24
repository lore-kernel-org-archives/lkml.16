Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39686291158
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513463; cv=none; b=JaEPwfmzkbPaUTNleRq63P7DLnj5i2fzmGW6yTmD2KAnUDQAZmXjhDEK5mpxzuzrJw1IK2fKg89ki1rkcd8VAZai1uBKGXzOGDFUxkzJPnp5VBoF7WebDI1oOrurupXFjW9j+XzErfvdwQpNWPduVk7ZVlfWKWH9Xq30VD6lheQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513463; c=relaxed/simple;
	bh=hUi0pMy5Cqhathph59WzODpUH0Rto3mKQRA3vrZzR4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZEk4OQsRoQP/W+f4DZ1Udk307pmQ1TYCeIrGEjzHLf35FLcNAvInLhyY43VzJNf7ZGrN7hKkO41+E8j/OMvE0jZ65yydusP20jC3AglfOpuwoxgnSi+e/X/OJl26EUUt9XJPjBLY7u2sB+cxXSgDHR3sU+gqmeRSlBt7kVmNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=qFgtL46t; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="qFgtL46t"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72bc3987a05so758918a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513461; x=1746118261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBLLv3lBQauMahCNm+2PIxA3w9/5v8v0uZ/gJ4AQluo=;
        b=qFgtL46tEtdRpVHQs0HJxAjypVmFnZGjmsMG1kY3RHenETGYUvF/FNnhwZjs2+yLnX
         JO0IF6cbdEqAEPnBi8XOJjSWG+C8AJsAdxOu6tYpdmyC3hgxUSc7SrxdDRgHukUNovU8
         hmA3Wi32sTTFuym5deS5MqV/rP27IvmYfPzZiSu4zk7ePK1Q4GJAAHWWygJpa3GYmvxw
         YE9Afl2yILrp6d5C9Kyn6DAWrZ8Ymfr1mc58zoQu/HVzwN0v1DOzqi8EUl1qjvqATIk3
         dzzhsYlWJPy/hiJ5wndHN90Fp7tqyuAutm2+BbHvHeQPiTF7KNt/2QHv6EDLtJcHcU/N
         fofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513461; x=1746118261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBLLv3lBQauMahCNm+2PIxA3w9/5v8v0uZ/gJ4AQluo=;
        b=Aa8XElxh9XX+uL+EECvpLgErus/nAkaaP1Kx3bQkpJChirPRzelpImpMZksEXYo0nS
         c7HtXBMfhCa5tXfscjpu3MJYYMSG0rjyg0p956CBs/jfSb6xh3qaVc2OB0KcBj/i/510
         i9zY+T1DKkYdwLmOcveUcoxRSSuiWrQmZCzKfgtAmmqvjOVg1eqJEFkiY089jXyqbQi0
         mxrxcx0GUgaxbygpcJjd53/lzGf7q6yY+tME09Ym6y4ZezZ+UUiU/a0PhvSb0LpCXRxn
         YZ9zavtdyGtpSRPhbFSfymPejf+UUs9bcJE9af/CVF96BQ56xHBaAcRcnyYPtIH/3dII
         s9LQ==
X-Gm-Message-State: AOJu0YxXI+0mDmG6wSXGq1teneaAj2ZDI1yoozT0VclAi9oOWhN6Ac5S
	CaR3cqoTalbaC0ZtijtH8Pg/p2460a9PTMM9lreG73bJbaJSe3Eg4cAUtOP9aob2LWtwCnUM2nu
	m
X-Gm-Gg: ASbGnctCMCyOeABoM8Ws4hRlRmsT+VfBXnJkmxI+PXeTYYoHoxEosYaBG53+OI/Ch+l
	Yzee6f/N146SSiSzZmEVeravfcyaSTlpWqTc1Z+nI6c8hiGU7wUQj59Qurlup9kzeHQm4u7bzaG
	RP/VYeuq1HfgNIIDzewvtqo4QS33bHC6efjwqXkjwINYDbCcFyHhJTzdLB9QXfCO4MF8QsNum4s
	IfOdsVa3W8LT4Wet4P5P9M/JX/SnzG2pk65IKaD3Bjxt7/z3XVDU4UeWN5A2nMo6qT61bJ3ttgc
	a6qh4Up0BS+FaOw7K+08rKWeNxzFWBSS8rkJGkXSdV0sqQ==
X-Google-Smtp-Source: AGHT+IE8rOflQid2RZybnE7oYt//PQVoakrhLTkTbYiVydjxxNfwTgHdK3bahsZQOYX2nqAIz9IazQ==
X-Received: by 2002:a05:6830:620d:b0:72a:b78:1c5a with SMTP id 46e09a7af769-7304fab52c2mr2030378a34.10.1745513460875;
        Thu, 24 Apr 2025 09:51:00 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7304f1a62absm301288a34.28.2025.04.24.09.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:51:00 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 19/23] ipmi:msghandler: Don't deliver messages to deleted users
Date: Thu, 24 Apr 2025 11:49:56 -0500
Message-ID: <20250424165020.627193-20-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424165020.627193-1-corey@minyard.net>
References: <20250424165020.627193-1-corey@minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check to see if they have been destroyed before trying to deliver a
message.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index c72ff523216c..938c566624d9 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -1327,6 +1327,7 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
 	unsigned long    flags;
 	struct cmd_rcvr  *rcvr;
 	struct cmd_rcvr  *rcvrs = NULL;
+	struct ipmi_recv_msg *msg, *msg2;
 
 	if (!refcount_dec_if_one(&user->destroyed))
 		return;
@@ -1377,6 +1378,15 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
 		kfree(rcvr);
 	}
 
+	mutex_lock(&intf->user_msgs_mutex);
+	list_for_each_entry_safe(msg, msg2, &intf->user_msgs, link) {
+		if (msg->user != user)
+			continue;
+		list_del(&msg->link);
+		ipmi_free_recv_msg(msg);
+	}
+	mutex_unlock(&intf->user_msgs_mutex);
+
 	release_ipmi_user(user);
 }
 
@@ -4844,8 +4854,22 @@ static void smi_work(struct work_struct *t)
 		struct ipmi_user *user = msg->user;
 
 		list_del(&msg->link);
-		atomic_dec(&user->nr_msgs);
-		user->handler->ipmi_recv_hndl(msg, user->handler_data);
+
+		/*
+		 * I would like for this check (and user->destroyed)
+		 * to go away, but it's possible that an interface is
+		 * processing a message that belongs to the user while
+		 * the user is being deleted.  When that response
+		 * comes back, it could be queued after the user is
+		 * destroyed.  This is simpler than handling it in the
+		 * interface.
+		 */
+		if (refcount_read(&user->destroyed) == 0) {
+			ipmi_free_recv_msg(msg);
+		} else {
+			atomic_dec(&user->nr_msgs);
+			user->handler->ipmi_recv_hndl(msg, user->handler_data);
+		}
 	}
 	mutex_unlock(&intf->user_msgs_mutex);
 
-- 
2.43.0

