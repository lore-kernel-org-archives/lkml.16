Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3D4231CA2
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752424; cv=none; b=nINDU6PeNUzqla5vRiKDUNDgN3DEb86+ju3pWUqvWl74OcNp9kqxcpGRtfnnHzTJnr8PUuCYefU2Hfc6wenNtAUNH+eirDCxWaaj9W6M/ZfAcr+0bI7IMHKppRTaYjggaV9S6clxzH+tZXlOadPbQAVYS35KAm7ck+REBXGvX/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752424; c=relaxed/simple;
	bh=xRkFOWHuZ+4aavyCFjkbkfd+GJEMFsXNmhrm/e95+8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IgY03aVnZVpxXRvLJkSskPuq2EPrZMgecJMEdlmruytiwx8RYI9cNq7k5hHIK7KQUexRhJiiRpP1WjRSkkj6kKULfLBop2nlZVsafbuaD5AUKxAfiVwxYJrNIfAmYWWhk57qIHGb180Nmfh4LOYvyIe2cbrrN5pCWRUf4239FwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ziQSI3e5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sd8EGdt7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ziQSI3e5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sd8EGdt7"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ypoh5bPsfxOM77Dymarue9WtxfUD42b9bpRlgO7jFRQ=;
	b=ziQSI3e57QrJCb6Go3UMd6AGPlrdJG2fJjIOJsSZgsy3aAvBqcaNoGy1rmSlzC2n5eSPY2
	poEfVElDycTubu+LAZaIlX21OJO+iCX7FtWlLvGB7zShs3u2hGKocnV+FdL9TwBcNXmLuf
	QhgnEjmjJBJCcVahvH9J9cnMVvFEwI+P4bdyvnAElWZrFhCvTLksDOiyWpOOR8fj3N0Kxf
	bSoYQPVZgmBERGdSeB5VWPnASY3Xosbb+LptKBu9kay6EyEccjl4O3gpswK/stLtkl2/9j
	yuPQ9dxx6nW7pNAuoq4bnErm7FT30ZxRlQ/4KkUnGzi/o8AXvyNnqFWQqP4nrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ypoh5bPsfxOM77Dymarue9WtxfUD42b9bpRlgO7jFRQ=;
	b=sd8EGdt7DB+4jVCmgKh8tXZkIWY6VTBdXu+vH4nkCQO5EonW63pnBpOzDlwW4u0muILHtI
	pb4wJNo56bhqK6CA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v2 24/45] mailbox: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:12 +0100
Message-Id: <b742f81b6acdaa604511834a06a8aac3e6e63ca3.1738746904.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746904.git.namcao@linutronix.de>
References: <cover.1738746904.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely.

Replace hrtimer_init() and the open coded initialization of
hrtimer::function with the new setup mechanism.

Patch was created by using Coccinelle.

Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jassi Brar <jassisinghbrar@gmail.com>
---
 drivers/mailbox/mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index d3d26a2c9895..118beaf447aa 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -534,9 +534,7 @@ int mbox_controller_register(struct mbox_controller *mb=
ox)
 			return -EINVAL;
 		}
=20
-		hrtimer_init(&mbox->poll_hrt, CLOCK_MONOTONIC,
-			     HRTIMER_MODE_REL);
-		mbox->poll_hrt.function =3D txdone_hrtimer;
+		hrtimer_setup(&mbox->poll_hrt, txdone_hrtimer, CLOCK_MONOTONIC, HRTIMER_=
MODE_REL);
 		spin_lock_init(&mbox->poll_hrt_lock);
 	}
=20
--=20
2.39.5

