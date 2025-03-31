Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8093BBC9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434730; cv=none; b=M9QZahIChvcrtKhpxLm52n5TSRkQ2lV7XnyM8wzIac/yvo5iQKGVTvpZp37EEmw9QgUbHeiJgNnjv3duXqACkjaGfy/HyoGbpb3A+kk0aOd5J8F3kdHpsNFlHTntb/uvBqIhNM3iJRhT/hJZ0oxu+X1IdVHC1nQN6M3czqRaJlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434730; c=relaxed/simple;
	bh=MxYicsa7zNpBg/ssHY5baMXjK0/Qg9EI1tX2qcTcxAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OT+h3Ov9MvXbIYtaVAsLlR7T876Jw2TfmlzH4xp4TxTJH6dwYcCxPNq8bjKLpEjE4b5JT4jXamRvjpV5+o1w5EM2Pca97JKblc37dBkcusKZV0hIEGsCpr3uT+/YQFuL1rOqaPwRrWMVZgY2Ywgn83vhwZXPi7isqA/4PRmA4fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vd0sS36I; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vd0sS36I"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso46722315e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743434726; x=1744039526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w1tt8qzUuinVbzUW/8V4BmxV1MSQ9WRk7iYpGOY8Di8=;
        b=vd0sS36IcdyNu7Vjt4uhx4t4R3vE5vpPR10uRRqHWVV98rtmXRghRxFopoyBWi9AqK
         RmnFp+62u+kDhjPM8AzVSkuPccMv31MaZuRcc6iuVcQ8ZjCAcinRMwroa3GlPPXNClJN
         aOAs7zS5ek5L30B+zMLymZLSXtUtxqskGvIMPvZGektkmss+mJsqETrfnqfBrsZQR7Xz
         MhbvEJiDif4WmVdx88ND7EFN73M5DtCMLXzOZL4pjshQjVk/4jy8nPuJp2ASAJhG2+qD
         KSXthrSdht4ae+CxAqUaETPHDN3vKnIkTA+PTuw+necJghD5bP5/uJqCko7ZOEAKCLjE
         VEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434726; x=1744039526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1tt8qzUuinVbzUW/8V4BmxV1MSQ9WRk7iYpGOY8Di8=;
        b=lmrccYGLXvqVcSUuctfexIe6SyNuK0UvkmMfhl13wHSM2toXUPi0Fzd/5wFN+QnlNZ
         KatZo4mb1JokhzSgUzSvgEZscd+kLsQluRNm6vzCPvrPUVd3sz0XVmwZm9zURqBXGCeE
         KiKZ2oxjiBhXaM421CG5HgOL0TfprBdSxeBbk81kfowOrUZn32KkWTINR6WB/4B4eRkK
         9Aac5Jifcn/be8AFjEKDGN/7oYeI+Wnc2/I/Wq/OaBvKHCSeAMF5r2zqUwltgzvBrget
         aCeT24RChugViLSI7o7EeKxjhBrK3TQTggyOpdMi2NSntVYan7v8IiHGHfH13dsoW4GD
         BEeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUApV6pmYovdziBQer/s1RUJWw25YVJSL/W6A+mT9wVjxlZT412QnFFy6Qlt+PcdPhPypxdbtKmA5z/HoU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk4Riu9c9U7cT9RZGPsfbqte4MYBh+plkBthpILGGyu/JZJEfm
	ZXPQqbODx+NsXV2CUICE7Zw64W1NeVOUPg74UsSUD6PCCkCyleQjMb3UcQs91Tg=
X-Gm-Gg: ASbGncvH8giQ1/P1CAeK9sR9veRa7Aw45A1PNO35l1uGjT7WgjK+GRNB3s1NctIWWfl
	h1SV4vFWzf8T/sAJZHTKi8SLNREQQA0FNn/QJj3r4FgkFVcy9Q/eO8hH1CK09VNKLelHMDMIm4+
	ijzucLGJmSbNZ8T1fcrVC2rSHM8dbzoUS6Yhp8QD+NxV6xeJcuONegGk28iVi6XWpkE1aBHEJwC
	lSH1H8t91piYK9xz1FSPPnOCcyzIPKMEQs8hUAY7uYnw/q6p08HnY2nW/pcHZjhmoxCtV1M+VK0
	h/iOzv9TQPNfHtSZSX6hDxze+vcIp5di9NcnKmiaCT9xsJEEzkdJ0Py7ihZKeB027P641Jzr
X-Google-Smtp-Source: AGHT+IGoa9qAtKWuSlEZcX3/2RvJysHoPsI6Azqau9m89jMS4DNcYUxcGwtiVa9xvo1/t6HIzaO4PA==
X-Received: by 2002:a05:6000:2511:b0:39c:13fd:e50e with SMTP id ffacd0b85a97d-39c13fde631mr7481977f8f.10.1743434725542;
        Mon, 31 Mar 2025 08:25:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e33asm11708596f8f.66.2025.03.31.08.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:25:24 -0700 (PDT)
From: Frode Isaksen <fisaksen@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>
Cc: Frode Isaksen <frode@meta.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] binder: do not crash on bad transaction in binder_thread_release()
Date: Mon, 31 Mar 2025 17:24:14 +0200
Message-ID: <20250331152515.113421-1-fisaksen@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frode Isaksen <frode@meta.com>

Instead of calling BUG(), set the binder_thread to NULL,
as is done in other parts of the code.
Log if it is a bad transaction (other than in or out).
The BUG in binder_thread_release() was preceded by
these warning logs:
binder: 1198:1217 got reply transaction with bad transaction stack,
 transaction 49693 has target 1198:0
binder: 1198:1217 transaction failed 29201/-71, size 4-0 line 3065
...
binder: release 954:1333 transaction 49693 out, still active
...
binder: release 1198:1217 transaction 49693 out, still active
kernel BUG at drivers/android/binder.c:5070!

Signed-off-by: Frode Isaksen <frode@meta.com>
---
This bug was discovered, tested and fixed (no more crashes seen) on Meta Quest 3 device.

 drivers/android/binder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 76052006bd87..c21d7806e42b 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -5302,7 +5302,8 @@ static int binder_thread_release(struct binder_proc *proc,
 			     "release %d:%d transaction %d %s, still active\n",
 			      proc->pid, thread->pid,
 			     t->debug_id,
-			     (t->to_thread == thread) ? "in" : "out");
+			     (t->to_thread == thread) ? "in" :
+			     (t->from == thread) ? "out" : "bad");
 
 		if (t->to_thread == thread) {
 			thread->proc->outstanding_txns--;
@@ -5317,7 +5318,7 @@ static int binder_thread_release(struct binder_proc *proc,
 			t->from = NULL;
 			t = t->from_parent;
 		} else
-			BUG();
+			t = NULL;
 		spin_unlock(&last_t->lock);
 		if (t)
 			spin_lock(&t->lock);
-- 
2.49.0

