Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1528C1E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745868899; cv=none; b=XwxuU0wlbrGLc60eZSujijDDT8JZtSoWJtVA9KFV09vyIVu/SD6gMzuHTtJxdUSr1aJQyOPyUXQml6KcRXu2qT6XGUgKdKnBoH6KbEfs+fwmvKKU3iXrMMBvqCkJ//Ke1VWwfWXCBmKd9NOIjScAWDtzqKz9Yrwro8P8kMsvPUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745868899; c=relaxed/simple;
	bh=bgsGRmfQLtx0IO6CERk2tanDiThmEWxmfrI6QC7XMUw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UyYfgtuZvGDdOG/nBDgDqvDbiGaUfplQYJBZHuG5h4xtIfKR8dkWLZrqI9Ul4Rn8bnFhOo56Der5YnZX59YSAFvd38LjDLP9ycd70iSgwsnhIoFd3pgt44ns+fXCY3P5VlZjsdu1lUmB1sSoTeOxx7gt2blRlUi9fwOIFFvE0vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wUsy6tV7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=26L3Ufjq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wUsy6tV7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="26L3Ufjq"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745868896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=inBDDmjqyJr2DRPgnNUQcluPwq2ACe+wMWnPzu3bOoM=;
	b=wUsy6tV7DDl7LGhdtGpffnE8IcPjpZ5s91Lvrk8ZNY1a7UjAL8hmB7qu3a6tGPDvKaD+me
	InUkMky+QHMmwWvoFe2yNaF+L6vX1gAsZN43uhOefwxHg9sfi9zA9N4vEcT296f7wLFUZe
	74daH3IwzFPwxhWFRwSpcQKHBxGEEoJ01dcrHV8HkdqrrwfiDYMLRWSqnyD683jHQUO0Nc
	8jTnd5ZPMJ6yXO2je31/UmQbVN8IKNeyjFihl3umPGB/6oC3YQI2C87q5EaGrGUL8Bs1ZD
	KtOfPgHNVdXwOvV56VHXnAv2mygLHqiXynym2WTkqEh5UnN2W3aiOQ5ZAvT26A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745868896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=inBDDmjqyJr2DRPgnNUQcluPwq2ACe+wMWnPzu3bOoM=;
	b=26L3Ufjq1sBNJpaNH+qaGedg150yjlLEZJG5lpBOMWB5S5sFgvHMt1iVmqVnIPalbaIihM
	GfXV7G0vI5WxDSAg==
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH] futex: Fix outdated comment in struct restart_block
Date: Mon, 28 Apr 2025 21:34:45 +0200
Message-Id: <20250428193445.4571-1-namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since commit 2070887fdeac ("futex: fix restart in wait_requeue_pi"),
futex_wait_requeue_pi() no longer uses restart_block. Update the comment
accordingly.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 include/linux/restart_block.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/restart_block.h b/include/linux/restart_block.h
index 13f17676c5f4..2d46702e7474 100644
--- a/include/linux/restart_block.h
+++ b/include/linux/restart_block.h
@@ -26,7 +26,7 @@ struct restart_block {
 	unsigned long arch_data;
 	long (*fn)(struct restart_block *);
 	union {
-		/* For futex_wait and futex_wait_requeue_pi */
+		/* For futex_wait */
 		struct {
 			u32 __user *uaddr;
 			u32 val;
--=20
2.39.5

