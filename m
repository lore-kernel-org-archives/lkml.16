Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25C019ABAB
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864323; cv=none; b=geoOqH42HOPS0ntIi3jToxOSKAi+zxJSzlKaeEa9GgmSE8lglnekSk0x7d5Avs8YC83OUZrFq8M30CcKDSHZL+Lnw44c9kfQVm6qxQ8uDR29zQHksMChsf+CNtZQEWi4LBDuYTy8GyLdeQh5Qb9UanzEI6RMyQFmtBV6bDQI9qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864323; c=relaxed/simple;
	bh=/tZPSI4tLlYdd67Gn5X6uQRq5VHUcBzTCvXUIVHSdIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XB1VhPWv0XymA19fz5fjApNQcwgTSOuf01b35HOLqt86ifr5u/u0FJvb2S/LvQXBqOGJRA/FPhWHJfpJG3AOXvyFPF/tuw2qyZcc1Z+XsfKkp/vle0W0nxSyh6wCGnYOW4DOBEQ6juK0b6fkzv2VlvvaysYHXhWmb0+RvFTm6WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=YR+D6EwX; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="YR+D6EwX"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6S0pkPzlgTxx;
	Thu,  6 Feb 2025 17:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864315; x=1741456316; bh=NpbuW
	cy4rQo21vIeJu/W4J1T/fF0/mjMgQiWe6ZWklg=; b=YR+D6EwXvFaJWGefTwgoy
	MqBpwKA7q4iUFyjMvEpCAXGBnOsI23/jOj11Q34aNHr7QwJVBtE+FTua8Ql74H5R
	AIzXzEbZfMRawUYVYb6vzthTTJ49PNUQZjlwFxAETmqvV5RO6PbmuHY8SmRPd1Ow
	XYG+hXB1oHkKf8hiqgnDA1g0TiF50xNayhjhu4MBhSd8GMkXNJm3vYBVkR0YvVTi
	zxMv1jyibYBp6qiOj/JUkkz6LjHNybuHKSoivoZpo9FEXOTW9+jUIzB+ALz7m79X
	031lLxD4PRJtFlJYDeN4Dex/Of9CpKWIA0g5ISYcF59rZjfBlNvt+j4f38t/zCMH
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id HQ5hkbzhVahT; Thu,  6 Feb 2025 17:51:55 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl663w90zlgTwF;
	Thu,  6 Feb 2025 17:51:42 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH RFC 09/33] refcount: Add thread-safety annotations in <linux/refcount.h>
Date: Thu,  6 Feb 2025 09:50:50 -0800
Message-ID: <20250206175114.1974171-10-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Inform the Clang thread-safety analyzer that refcount_dec_and_mutex_lock(=
)
may lock a mutex.

Cc: Will Deacon <will@kernel.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/refcount.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index 35f039ecb272..dd854ad27df8 100644
--- a/include/linux/refcount.h
+++ b/include/linux/refcount.h
@@ -98,6 +98,7 @@
 #include <linux/limits.h>
 #include <linux/refcount_types.h>
 #include <linux/spinlock_types.h>
+#include <linux/thread_safety.h>
=20
 struct mutex;
=20
@@ -353,7 +354,9 @@ static inline void refcount_dec(refcount_t *r)
=20
 extern __must_check bool refcount_dec_if_one(refcount_t *r);
 extern __must_check bool refcount_dec_not_one(refcount_t *r);
-extern __must_check bool refcount_dec_and_mutex_lock(refcount_t *r, stru=
ct mutex *lock) __cond_acquires(lock);
+__must_check bool refcount_dec_and_mutex_lock(refcount_t *r, struct mute=
x *lock)
+	__cond_acquires(lock)
+	TRY_ACQUIRE(true, *lock);
 extern __must_check bool refcount_dec_and_lock(refcount_t *r, spinlock_t=
 *lock) __cond_acquires(lock);
 extern __must_check bool refcount_dec_and_lock_irqsave(refcount_t *r,
 						       spinlock_t *lock,
