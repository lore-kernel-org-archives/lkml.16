Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A023222DFA8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751999; cv=none; b=ptLIa5OI9IRZTiCTXs2fIax6JFk8m2xF92wl5zSa/SSwu7dwzEe65E2hG6RYeza2I7BejPkq+lE2A/cBkjF7P5u01obNzVMafvMx+8OGXtB/h3Ylq4QbJ6hHLbfUJLTmapx9e+1DdWQ+eo4uWPG2ch0stOqqVFe/xvwRbRo7ZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751999; c=relaxed/simple;
	bh=vvk9VgHZ5HgTwbdh4w7mEa7Iljw0JHLYk31avvHA5NI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UhFiDVEBJkYvMQ1EMFuatdlNsEpmphogUfSxGTHKmLsvZOn9N+gXgNbQA33a5edn+duBRdVTXBqE/bGNKTsUDDUNfCzDhCBRD161SQVvL2b9eTGnM8AKSHS9NirtdW1SDMvddhDFmZiRYDTfmRm8lAFLriFXp9rLp5XLw2uvbwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O+yQWMvh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bw47NZnk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O+yQWMvh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bw47NZnk"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s39lbmV2IXqF2ss/8vs1KZOHzfRVzb/SaOq7s58i3mc=;
	b=O+yQWMvhMWYn5XxbAjJNuTHxrxIjoUWETvelT45kKoeizs2cSvMgisooNZZ+JnDF4dAGn5
	tKhoQUrNF0/OlkZtMI6MYW/lpBPLPJnIbwNKn/eNlYCX+QoUKb7FNnRHQ37H8/S6plftZ8
	stM/zO56Skv8OdzAxMLxpd2ZoMw+LCL+dIAz7RdfIzlDYxSL4PRGB9URiHphHWWxWODGpC
	iTzOW8n5waU8W5/9eFYe3Ia/qkytsCaTSCcQmiDvi3TURw9QvmJ1troldY2mFs2ksB/PQ/
	KBJ6zSJsWb+z+YahWdoQ6Kh8yJPjfGMj0qJ25umR7xK+ZCfEcC1ZFwAFyv3FMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s39lbmV2IXqF2ss/8vs1KZOHzfRVzb/SaOq7s58i3mc=;
	b=bw47NZnkmnMHbrO7cDbrVtX4bBWx06kLO2Tscn4FulxgsQSsnOGbIM+N6H2nKkSDfjBZ5o
	Dum7Nt30a/RaaQCw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH v2 26/31] ata: pata_octeon_cf: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:10 +0100
Message-Id: <a36ae1e4be26f8359bf2777b1813bbf4d7a7983f.1738746821.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746821.git.namcao@linutronix.de>
References: <cover.1738746821.git.namcao@linutronix.de>
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

Acked-by: Damien Le Moal <dlemoal@kernel.org>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/ata/pata_octeon_cf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/pata_octeon_cf.c b/drivers/ata/pata_octeon_cf.c
index dce24806a052..2d32125c16fd 100644
--- a/drivers/ata/pata_octeon_cf.c
+++ b/drivers/ata/pata_octeon_cf.c
@@ -935,9 +935,8 @@ static int octeon_cf_probe(struct platform_device *pdev)
 		ap->mwdma_mask	=3D enable_dma ? ATA_MWDMA4 : 0;
=20
 		/* True IDE mode needs a timer to poll for not-busy.  */
-		hrtimer_init(&cf_port->delayed_finish, CLOCK_MONOTONIC,
-			     HRTIMER_MODE_REL);
-		cf_port->delayed_finish.function =3D octeon_cf_delayed_finish;
+		hrtimer_setup(&cf_port->delayed_finish, octeon_cf_delayed_finish, CLOCK_=
MONOTONIC,
+			      HRTIMER_MODE_REL);
 	} else {
 		/* 16 bit but not True IDE */
 		base =3D cs0 + 0x800;
--=20
2.39.5

