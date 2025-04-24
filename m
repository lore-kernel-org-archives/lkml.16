Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2EE38DEC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745505217; cv=none; b=ThgNOiG93zisdfKBY3/DIcDVXubIvr0wRq5kovxdSGPfoTWR2dsn8lZatjGviRO21c4FQ9Q7LwD9fJVwPCe+ptsCdiM01jwY2fR0vYJ+/PGqYr+cDKFvsUtBs+qK5u8vob2r9JJJmEnaLsih18LwATRCWzBWL25whaozbszQPww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745505217; c=relaxed/simple;
	bh=jMpiOwiOVMAi86J76T/7cZ3gnTHVBJSDvooJIBTkBBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q7nBEBSFFiJ7TLyV82Br8BxjdPycRNxHHNTUvcfJop7Vh82nfAF7g3vRia6aY5IlENCNIAK4KzyzquGvSHoIX8kJkiFxqCRDkTXAYyIhpAaVdBPvDnmXbQ+0KQjf5Qvr3iSdBVJeDtNjFkuELN+Ykuxmybyb4sTVQH3QC0+9wpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwiYTRqA; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwiYTRqA"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7396f13b750so1211188b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745505215; x=1746110015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xkpv3eutKSVxUAeX7VS2J9T/6sjpELMJr+ORogjI7os=;
        b=KwiYTRqAgDmuQZq5sVGvuMYsd7DL+UB6z0RK6v2N0ZTQkk67xWca3+jrqAUOsbE029
         TyQ86WY8wBLj8ZJt27LJFchtm0BispiyYVZDOVgrPR+MQFTjwd2ivJsHpr+62BmJRVzM
         6WcOmztnwHSIhuWYBZyeoJzJGByIucSRpnh6W8WN4F5//aWNma9B/iMHZiVB/EDgv3s/
         tZfcGEbuiR2Rel9W3olNGS7UpwMsRLOxTr2EZT1KwGU+6D6M0Zl1cAHpyeYWRqsN2HO+
         8GdeftOxYZoJAB9Gi28LmTNx6ONCiPKIuCIjQfAuWpiHTGIbs5qwOLA9lHKgNtbyLP3f
         trCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745505215; x=1746110015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkpv3eutKSVxUAeX7VS2J9T/6sjpELMJr+ORogjI7os=;
        b=iJy5I+L0boNYaQ7I6xY81HNU+AS5ejSSFJzGwUfSd0NuxjwtZBtfq8bH2N5LEXFmcx
         ePfQHOBOS/waN6VavHp6vo25oGV+3/arurY7j8P6yD1ZYZAMP0B0LMQgcHOg+Lj0XaL3
         f5KJHqzlw0K6Ik4PbaXPBkDmPb7mWeYlDHixgyOniVZorNbVBb8+uOqnFM8SKrDiXTEP
         EjIsU17YE2r7dP31ZczeoWormB5+wvPt8YxG/TVnyFwHFbEJ2JK2uR1B1vR92KlnTFy0
         HjvqlF7T7oVvHtueaqMnUxGjNBQ8zPb6/Es0EuNWr9+Muhb5osPBjz6nMCk2mWFgGpLN
         bFmg==
X-Forwarded-Encrypted: i=1; AJvYcCVE+LLAu7DSFCyjfY/mgkRWyQ439BmtawpsAQPe04b0TkneBL/14GA4nXviZSe2kALS3akRORL/JbyTAVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI78kyYj8v8Hy+dQU6aaceckbv9K4dGL2CVUakgbpFXbp6fw7e
	miTiLZknPTgT/xkKUQ1NmX3G0E3QmcguWgAwTWjZ7TnQK4GU3VI9
X-Gm-Gg: ASbGncvbJdqxr0TQ5TEQmZbtnL248vdKoyaIT5l7jBOElTI5FleJDTdAXKRhho8VSeN
	/fa/Nl7ZKhH12ddPeqnmUJ7ZsZgQdXniucP2TPbEB8EwfJTlf18UUvi6rn58+NlJSnTJqiq0geT
	bscwWX+wJbn/oV9YQygHyC491V3I1e8E01Jc0vMlFdo4lxYp7HtT+XQObLs9LGkhEfqGVbeQeZP
	ddEBh9rCtBGVKnd7IpSGYDqa/W/7GOodVhMRC83eiAnNLncUAYDUddfv7+Cvw3eRcy0Z1KiQxJG
	B52smtkLj755RWc1U7V7Zz0n20Zvz/GMaOa14YpYTV0kcHhb7QH9JkbdQuUxb5TUcsziYm2phtF
	ujJ0N
X-Google-Smtp-Source: AGHT+IE+bgMGe+2UdmLilAKyNGi2q1uAeA/1zgkIgVklHFeGwvmkTKwAHEFRvLwr6K6GDd7kqUWWwg==
X-Received: by 2002:a05:6a21:32a9:b0:1ee:efa5:6573 with SMTP id adf61e73a8af0-20444e71b60mr4969589637.8.1745505215041;
        Thu, 24 Apr 2025 07:33:35 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597f5csm1283969a12.43.2025.04.24.07.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:33:34 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: akpm@linux-foundation.org,
	Liam.Howlett@Oracle.com
Cc: lorenzo.stoakes@oracle.com,
	willy@infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+a2b84e569d06ca3a949c@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v3] ipc: fix to protect IPCS lookups using RCU
Date: Thu, 24 Apr 2025 23:33:22 +0900
Message-ID: <20250424143322.18830-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported that it discovered a use-after-free vulnerability, [0]

[0]: https://lore.kernel.org/all/67af13f8.050a0220.21dd3.0038.GAE@google.com/

idr_for_each() is protected by rwsem, but this is not enough. If it is not
protected by RCU read-critical region, when idr_for_each() calls
radix_tree_node_free() through call_rcu() to free the radix_tree_node
structure, the node will be freed immediately, and when reading the next
node in radix_tree_for_each_slot(), the already freed memory may be read.

Therefore, we need to add code to make sure that idr_for_each() is protected
within the RCU read-critical region when we call it in shm_destroy_orphaned().

Reported-by: syzbot+a2b84e569d06ca3a949c@syzkaller.appspotmail.com
Fixes: b34a6b1da371 ("ipc: introduce shm_rmid_forced sysctl")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
v3: Add necessary descriptions and links as advised by Lorenzo Stoakes
- Link to v2: https://lore.kernel.org/all/20250422124843.17188-1-aha310510@gmail.com/

v2: Change to use RCU read critical section only when it is certain that idr_for_each() is called
- Link to v1: https://lore.kernel.org/all/20250219132905.8214-1-aha310510@gmail.com/
---
 ipc/shm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ipc/shm.c b/ipc/shm.c
index 99564c870084..492fcc699985 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -431,8 +431,11 @@ static int shm_try_destroy_orphaned(int id, void *p, void *data)
 void shm_destroy_orphaned(struct ipc_namespace *ns)
 {
 	down_write(&shm_ids(ns).rwsem);
-	if (shm_ids(ns).in_use)
+	if (shm_ids(ns).in_use) {
+		rcu_read_lock();
 		idr_for_each(&shm_ids(ns).ipcs_idr, &shm_try_destroy_orphaned, ns);
+		rcu_read_unlock();
+	}
 	up_write(&shm_ids(ns).rwsem);
 }
 
--
