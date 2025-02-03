Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BC320765D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591194; cv=none; b=ZCtNo9M7ZY9tVe0q84hZun9ZfQMgKy7v3clLgLBfGiKmVb7csnfrEUq9sNEA3LqJFgd6SDYg6cMTZpb+BQ1xkyBXz/+3DnAXQTYFMLied1V23pN6EC9RVrRFP/yTd15io5iLwusug4fbWF8JjaBPIZp6nuNvFWY2G1tuycpsrIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591194; c=relaxed/simple;
	bh=TPjwjY4OUGLtB55FXtC5lAL4JV26Lw/HwIxeSp2mBTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQ75mBCKt3Q5J/8O5/b5ebzP2rWeXM7IC2D9Y22J35+5SpA5glcXe8S81FUoFVSfIBa/IPAbapwfDeLfZRh/fOb1VhFI/HciY69fbOXnktjhGakl9zbINK/T/JazkflJnBDmmTa445egUGJOCJDuSEe34boLO2FEYmVkuPGCsCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aT9TDmyY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Y4Ln6iJr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aT9TDmyY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Y4Ln6iJr"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jywQLBSVGQH5BxKU7UyDrrI350h2lNTE0NJeLSeDe7U=;
	b=aT9TDmyYIXjST5Y2sAThBQtKEzd3myjwC3G7LQ00rI5ELKnhjwsV4tRnyjsjfQd/F8pb0r
	7jNJ97Zl0lCanHl4w0Ccv5ZbCXuZCeGp+SVRLD9pCYkxtwj6xehLcnW6mHAOsyWICEvt/z
	59s45hu7qdZlDzuWxWI4m24PMqwxHN90+5R9GQ2OftfJxXwPsjLcy/xSdOgLSCQlnULbq0
	Vwv3wk/q+a675afp58K8D3vAw5RtIErb8oq0azXgCxSn8tsFe3CuE6E7AV+oKj0dBNU34u
	s2xEOK4IQIbT9jKToHpBlo5gT1z/pYQB7EOioG79zBzWxHIUCM1StO+2yhp+6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jywQLBSVGQH5BxKU7UyDrrI350h2lNTE0NJeLSeDe7U=;
	b=Y4Ln6iJrnmDAulJbs+lUwZwg4ucwwRwXsrY0Skw0Ix1cufuXqBzrCrlnYFSLoyc/QCuyiC
	5eE3apvAFQCfKBBA==
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
Subject: [PATCH v8 15/15] futex: Avoid allocating new local hash if there is something pending.
Date: Mon,  3 Feb 2025 14:59:35 +0100
Message-ID: <20250203135935.440018-16-bigeasy@linutronix.de>
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If a new private hash has been prepared but not yet applied then
creating a new thread will lead to the allocation of another private
hash which will be freed later.

This is an optional optimisation to avoid allocating a new private hash
if the already prepared private hash matches the current requirement.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 9e32bfa7ba4ab..7f61f734ca5d9 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1424,6 +1424,13 @@ static int futex_hash_allocate(unsigned int hash_slo=
ts)
 					&alloc_size)))
 		return -ENOMEM;
=20
+	if (mm->futex_phash_new) {
+		scoped_guard(mutex, &mm->futex_hash_lock) {
+			if (mm->futex_phash_new && mm->futex_phash_new->hash_mask >=3D hash_slo=
ts - 1)
+				return 0;
+		}
+	}
+
 	hb_p =3D kvmalloc(alloc_size, GFP_KERNEL_ACCOUNT);
 	if (!hb_p)
 		return -ENOMEM;
--=20
2.47.2

