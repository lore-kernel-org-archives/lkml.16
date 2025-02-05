Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02CE231A56
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752424; cv=none; b=j4uUQC9gaF4yfY9slC4x3KPYggtFzhvQz0LSyIxcDo43eVf+9FA0wUMQxwKE7t3f2VQMcTANWRYyxuC2X3QiSCOOYhNIhYmk4Q//7fnzIHUu9rkq+mk9zF4Azz9AhcUErKJDCbF+RYpPcYjKN9fyuytTULXLPrZo86d7ibFY4nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752424; c=relaxed/simple;
	bh=+/v+DBFOKvZ6C1gyZn6NPsri4C7kmGvx5U9E169BkxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lIhM33F8c1POleDk85qeGrr6oG+sqyK5yMkE3Y+I83XLmGLwyzvfLA+dteVSetfY49g9Co24yzuVa/phbQ5VVn7OYYWH7ptGcvRKwlv6SnmLBqRfST+fLHgZR/3K2D1IDgRuxXQqS2cx02LdDoofZnUqM7OC/kKpq+xB1RG8nT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=USNBOLJ5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UXeGAzW3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="USNBOLJ5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UXeGAzW3"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YbUPMTaZt/M9AaKi667HoikX83gz5kNwlQt6n1L9PN8=;
	b=USNBOLJ5+YFvfzSS5JAaLXVpLLlXnu1jYWsav69rMgFAUgF5ciXUBp+c7s/QPkBY5He7Zt
	GowLT8NDAtL91eXDlhoBhFuW6Kh8ZL3EaIvxJKvwwDYV0ncV07A2YAhvai3NkGbW5JvZbe
	592mukJx2fMXnXOckTH0nojSeW+1rrswv03LZxLqa2aQYVA8y2OHXRc8H6otg85d40bsIC
	pMsE0M9VkWoKybDhOv8sWfanTGnuT/OBhqGRgiajuDf/iRMZXqYNbBW289+O/pkW6gaOCT
	VnG9JV4FQDdb12ZqJSNbFZeqNAmi30ZFRM8tkDkorLgQcDkfC20pNoEA6f51jw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YbUPMTaZt/M9AaKi667HoikX83gz5kNwlQt6n1L9PN8=;
	b=UXeGAzW3npbNYghnG1hZ++GApQnS7UJZVsI4VbfEA53rBtIhIY0vqTkxxjvEKPL7jyO02k
	NmmSesduzxxtjTBg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH v2 21/45] mmc: dw_mmc: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:09 +0100
Message-Id: <4dec579387ced5e97bb25739fad2ac852e5a689c.1738746904.git.namcao@linutronix.de>
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
Cc: Jaehoon Chung <jh80.chung@samsung.com>
---
 drivers/mmc/host/dw_mmc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 3cbda98d08d2..31f40c04afda 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -1875,8 +1875,7 @@ static void dw_mci_init_fault(struct dw_mci *host)
 {
 	host->fail_data_crc =3D (struct fault_attr) FAULT_ATTR_INITIALIZER;
=20
-	hrtimer_init(&host->fault_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	host->fault_timer.function =3D dw_mci_fault_timer;
+	hrtimer_setup(&host->fault_timer, dw_mci_fault_timer, CLOCK_MONOTONIC, HR=
TIMER_MODE_REL);
 }
 #else
 static void dw_mci_init_fault(struct dw_mci *host)
--=20
2.39.5

