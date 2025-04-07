Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23302063FF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041476; cv=none; b=I+n/q1SaGfljGe657H/SymIZeATvNhdAfj9IgsQxp6UD99hBSMEXaO0laaYDaYMDffZTQj6flcBrFIFtUIdr0KF64cu4RXyW6Bz8UinK/T1EywHxrRZfOxOw0wO2FKaEYe9/HbBkXH23g910VblSr5vBDFYZnT+6js+87qD2cr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041476; c=relaxed/simple;
	bh=LaZS6UPiImzSyxqxJCcwrXkWJyg0hTcn7pnVQilLcwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAnlY89cVEDMBHk8g4KlVTrroKUTsxNepLixpQbpoWfkMOOnjteH5iJwqH+rGd0lBN+VqFGfwHQ+k5RslTuZmsMtUfte9sNAWKqKQCZFhUQNClqBbEkF2sXScW5KBqjbPH5Cs7o5YkLzhxiuQ1qFNi8Ok/YTdYi1gY40s2RVDgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aIHV2yLW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8+SSnLGM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aIHV2yLW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8+SSnLGM"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744041471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ADpzXL+em4lIAaBMKlTSOE1lA/L53fXWSsZH7Iu6lc=;
	b=aIHV2yLWQvA8C+gn0aTfvag3wc+rrbX8nXaKQUP1o8YSox7v0hoTk7tMBM8zSOK8LoD7OT
	NBKTkPiAmTTulBuhXFBjspt+9jdt6QXf3aftjBnRN6WKpdaO1IOVaIUKEQ/xZv9WOK86wl
	LuhqRvr3YoOv5BdiprgcZDyF9wXj2Z/4vzbyyJsdxlbZhmAd4x0rgC7XBOu98NoiNetw2X
	CWDCON8jH5Xe7vKkU/f9sp2jNsXGPsmgbByvq3at+NBpMmW1Au9lzxgsghdTR5860nZwBB
	v79IE+4VKXdP2m31mwaFohzjQ1QBQMrZKclGYpftscqQSKpNsVB4O1Pu0swOYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744041471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ADpzXL+em4lIAaBMKlTSOE1lA/L53fXWSsZH7Iu6lc=;
	b=8+SSnLGMQoCC+6/mMxGYE9vjMLeavfaVL/i4BoheZNKJ2n1yZHev1QqBZfu3BZn1u6Eww2
	AHj08e1cxgnjLpDQ==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v11 07/19] futex: Create private_hash() get/put class
Date: Mon,  7 Apr 2025 17:57:30 +0200
Message-ID: <20250407155742.968816-8-bigeasy@linutronix.de>
In-Reply-To: <20250407155742.968816-1-bigeasy@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Zijlstra <peterz@infradead.org>

This gets us:

  fph =3D futex_private_hash(key) /* gets fph and inc users */
  futex_private_hash_get(fph)   /* inc users */
  futex_private_hash_put(fph)   /* dec users */

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c  | 12 ++++++++++++
 kernel/futex/futex.h |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 56a5653e450cb..6a1d6b14277f4 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -107,6 +107,18 @@ late_initcall(fail_futex_debugfs);
=20
 #endif /* CONFIG_FAIL_FUTEX */
=20
+struct futex_private_hash *futex_private_hash(void)
+{
+	return NULL;
+}
+
+bool futex_private_hash_get(struct futex_private_hash *fph)
+{
+	return false;
+}
+
+void futex_private_hash_put(struct futex_private_hash *fph) { }
+
 /**
  * futex_hash - Return the hash bucket in the global hash
  * @key:	Pointer to the futex key for which the hash is calculated
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 77d9b3509f75c..bc76e366f9a77 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -206,10 +206,18 @@ extern struct futex_hash_bucket *futex_hash(union fut=
ex_key *key);
 extern void futex_hash_get(struct futex_hash_bucket *hb);
 extern void futex_hash_put(struct futex_hash_bucket *hb);
=20
+extern struct futex_private_hash *futex_private_hash(void);
+extern bool futex_private_hash_get(struct futex_private_hash *fph);
+extern void futex_private_hash_put(struct futex_private_hash *fph);
+
 DEFINE_CLASS(hb, struct futex_hash_bucket *,
 	     if (_T) futex_hash_put(_T),
 	     futex_hash(key), union futex_key *key);
=20
+DEFINE_CLASS(private_hash, struct futex_private_hash *,
+	     if (_T) futex_private_hash_put(_T),
+	     futex_private_hash(), void);
+
 /**
  * futex_match - Check whether two futex keys are equal
  * @key1:	Pointer to key1
--=20
2.49.0

