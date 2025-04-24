Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C4328F53D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513454; cv=none; b=b3d0ICvS6J8E11T6gcXm0y2FVWH4peu9KykaUFB2KgdAgeDkQsxYB8N1HBR6J9vUmUY+hp18is1dcm0QnurI2VSiAxcyR6+Qo36iEpxp+TPk9i10rCUBUUyGte0SnoXGss/ydR0odp0GtJYgaGXHE91PZDWkZzWUs/eUHHA/8y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513454; c=relaxed/simple;
	bh=LPUq/AG1jJWICrGW0I7sQ269PYBFUmUzBdCAtijMfSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=it1EMHBVb9Q6Koo9ot1R1g549QF41GcwU4gmZ4sYW/TDDdonKZcA0/fJpeunmI6cICy1ojJmOIyV9VH7m+7O1//HGNY/PGTZULwzz75ZMJ53WN28QMEazwwtG5TgikWxyopZqEni0ZgR0IBVbv0fEq1h5yPqsBQT5Xzl7lMilJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=AYNdDDV/; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="AYNdDDV/"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3f7f7b70aebso793571b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513451; x=1746118251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvR8oUvm5AANjxDmH4zqg+trywtqJbWELpqwDmIHFLI=;
        b=AYNdDDV//UrwGAQ4z+B/vy5BBNOV8vAAxOZUCDleMeQix4DgbHKFkf9BCa9fVc/htd
         iSqethTf2CpcogwWx5hZQi8VDXGQEagr/M56RNRIogSeo2dxEV4qCZunLauZ0rMHomK/
         60TorrFKsEOe5JOsz1dAzop9vTtn/JUW4zPSC+lmg9z7UH3+4B8ADP15C61qp2MEUSzq
         RxEQWN0+1K6LnOoxXDZ4LC7ZDg9lbLlkvDPk0xchMeaHGu6dYru4IbmUMBGDZvRQA9GE
         W83E/h16dJvCL71HsT3vXbWBZlv08FDr52EoNOsxfMQH1Jki9S1egSRgAUXLvF2w6MG/
         tGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513451; x=1746118251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvR8oUvm5AANjxDmH4zqg+trywtqJbWELpqwDmIHFLI=;
        b=GdtdpbBAKFRhp3wyLVEYvaGo6Hsv0v7eWSTsrFFMCxW1m6l5Yyw3wZ0/EDCGmGFKcD
         rzJ23zCNdJfzdf2ayvF5f2eegBg52CkYcqG4q9FUHTDw7ISZizAZTqPgQaKq9vNnCG11
         LzZW7IzhX4ihXO67oI7CgEkGvbzXHkEe04wqW5fsDfImL+8q3G82ikYtgllXDa5d03yI
         GCliNE5yFykns5P2lWVFSANaN1AX/nHiBQd9tvHBzKTD583W3+W1Hbj8PKqyWdSAdk+V
         /g2qyNg22Uvf1ubpnwhHJzdbJOPqeRYgly8elu/bZuk4MEg01wL/R5r/3/PqScVIPxRc
         oMRQ==
X-Gm-Message-State: AOJu0YwIG9TB4GPE3xU4uSfKX/lIub53lRkwYyBovIZYzaxKVdansebf
	29GzCDkbOpipH/KLOnxAfVTzTDzSQ47gg0LR00mMoMr4LfAn8KxnAGsqKeUvcaKcB3D/L7ZA753
	u
X-Gm-Gg: ASbGncvOHO4UDWJ/0+U/4I9GSItvb0rXvXY3kyX/IwSyShFCMjkwSowA4eQycbmQ0I0
	eYsJL7K+6P8YV17AQF+lczgsz8aO76WOhJ4N7BnBkLGQw+v+O0wED2pYC2aMqP5D0fpLsA4WN90
	KZvDONh49KfhK1/bgtPTxELzNWairrpy6xYTkd1+bU+iMH3ir256oLmFJTXqB4rulDgwPPZcF6o
	LbaqDrOK7+XS1Tb0pFVthl9Q3aL6mfhbfciS1U2vibQ+l279YKo9zzdY/TtU5OrsszkQdgYPzVt
	+tIlPCoUQBEmZu652sGWlv3/mHNYnOINp6o=
X-Google-Smtp-Source: AGHT+IGxBh3dRs7oF9SPvu9xegYdzcEYSKMLeofJNaEOzl0NBrLhyFwnB+PDh2QGaXrXXoSthZFQbQ==
X-Received: by 2002:a05:6808:7005:b0:3fb:46cc:e08 with SMTP id 5614622812f47-401f1231827mr69872b6e.28.1745513450759;
        Thu, 24 Apr 2025 09:50:50 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-401ec8cd325sm315773b6e.19.2025.04.24.09.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:50 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 13/23] ipmi:msghandler: Don't acquire a user refcount for queued messages
Date: Thu, 24 Apr 2025 11:49:50 -0500
Message-ID: <20250424165020.627193-14-corey@minyard.net>
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

Messages already have a refcount for the user, so there's no need to
account for a new one.

As part of this, grab a refcount to the interface when processing
received messages.  The messages can be freed there, cause the user
then the interface to be freed.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 32 +++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index d05032dc1f69..edc53c22ca84 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -958,20 +958,14 @@ static int deliver_response(struct ipmi_smi *intf, struct ipmi_recv_msg *msg)
 		ipmi_free_recv_msg(msg);
 		atomic_dec(&msg->user->nr_msgs);
 	} else {
-		struct ipmi_user *user = acquire_ipmi_user(msg->user);
-
-		if (user) {
-			/* Deliver it in smi_work. */
-			mutex_lock(&intf->user_msgs_mutex);
-			list_add_tail(&msg->link, &intf->user_msgs);
-			mutex_unlock(&intf->user_msgs_mutex);
-			queue_work(system_wq, &intf->smi_work);
-			/* User release will happen in the work queue. */
-		} else {
-			/* User went away, give up. */
-			ipmi_free_recv_msg(msg);
-			rv = -EINVAL;
-		}
+		/*
+		 * Deliver it in smi_work.  The message will hold a
+		 * refcount to the user.
+		 */
+		mutex_lock(&intf->user_msgs_mutex);
+		list_add_tail(&msg->link, &intf->user_msgs);
+		mutex_unlock(&intf->user_msgs_mutex);
+		queue_work(system_wq, &intf->smi_work);
 	}
 
 	return rv;
@@ -4827,6 +4821,13 @@ static void smi_work(struct work_struct *t)
 		mutex_unlock(&intf->users_mutex);
 	}
 
+	/*
+	 * Freeing the message can cause a user to be released, which
+	 * can then cause the interface to be freed.  Make sure that
+	 * doesn't happen until we are ready.
+	 */
+	kref_get(&intf->refcount);
+
 	mutex_lock(&intf->user_msgs_mutex);
 	list_for_each_entry_safe(msg, msg2, &intf->user_msgs, link) {
 		struct ipmi_user *user = msg->user;
@@ -4834,9 +4835,10 @@ static void smi_work(struct work_struct *t)
 		list_del(&msg->link);
 		atomic_dec(&user->nr_msgs);
 		user->handler->ipmi_recv_hndl(msg, user->handler_data);
-		release_ipmi_user(user);
 	}
 	mutex_unlock(&intf->user_msgs_mutex);
+
+	kref_put(&intf->refcount, intf_free);
 }
 
 /* Handle a new message from the lower layer. */
-- 
2.43.0

