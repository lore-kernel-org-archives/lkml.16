Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7A719D08F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864329; cv=none; b=fU0uD1wK8KMWCCqnz8PBky3z8NillwXWZjD5etyDZQd0RhSYsefKKwYKaXE+NtpXWR//aaUEC/hM1R0+s31w8c/TyKQqDP7R4eoMnQ+Hk3AtqKG5GSqeUC7U7KrK289oGdD4FbLUGqcMYzc7D9HXzflvo6bBbAzo02cGbDmxDbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864329; c=relaxed/simple;
	bh=k4VMekKFYzGHweNrFPiF/MET3GfdaSCtWaHr22xNlOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9EP6p0rGGoshWcLejwFIC+tMDmCyCHnQXAXsxuEELGsTSmrjS2J85CVmrpUGbhT3E1bdhWDkMB7ZVtIKPrpOyFXxCk4Fqe0xJSYv/TeG1Jdpply4ZnDAiDYgkq9sKP5WE7EP+LSkQD6vfuSQEzHf3OAC/wtPTh5IkL5K1TMIc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=D0E9REt+; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="D0E9REt+"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6Y58P9zlgTxt;
	Thu,  6 Feb 2025 17:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864319; x=1741456320; bh=8vxnI
	LpjZPH6Zxvc0iLBNorL9Q2Ho/QjdOO1Z0y8suU=; b=D0E9REt+WFD64FmievFLj
	JffzFB8ScLXnY83WpHW7BLeQiCVBjKaP39eoq1fmiVypLq8OsWcHBQw1JbXKc278
	ulDJ2EzRpfQ/FsX1p6gfk4CJX0rEnvnOEAA0sot+IOIShpq9ja3G30JvdowByZXH
	KfQ/tTVhJFCIldkRKst9MExzfADBi6QVArzDrqb/HOMowomb14bwyLs+XhNf9N2A
	QUe0RjwL87aCUMNmNzIDplD8U3cAhEcSiQ3N5Zgk1YZWjZeixTXKPlErMhc08l/0
	32CSpw6c2vYNc2Y856mZZzE31ucm09DYQduO7gdvcxdNMRFQMs1LGCtP9tqtNgwV
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id SaOEoJZNcVoY; Thu,  6 Feb 2025 17:51:59 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6C4SyhzlgTy5;
	Thu,  6 Feb 2025 17:51:47 +0000 (UTC)
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
	Bart Van Assche <bvanassche@acm.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Adam Belay <ambx1@neo.rr.com>
Subject: [PATCH RFC 11/33] PNP: isapnp: Check the isapnp_cfg_begin() return value
Date: Thu,  6 Feb 2025 09:50:52 -0800
Message-ID: <20250206175114.1974171-12-bvanassche@acm.org>
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

Instead of ignoring isapnp_cfg_begin() failures, propagate the value
returned by this function in case of a failure. This patch prepares
for annotating mutex operations since isapnp_cfg_begin() only locks
a particular mutex if it returns zero.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Adam Belay <ambx1@neo.rr.com>
Fixes: f72e5c5c861c ("[PATCH] PnP Rewrite V0.9 - 2.5.43")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/pnp/isapnp/core.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pnp/isapnp/core.c b/drivers/pnp/isapnp/core.c
index c43d8ad02529..261bf85b0200 100644
--- a/drivers/pnp/isapnp/core.c
+++ b/drivers/pnp/isapnp/core.c
@@ -851,7 +851,9 @@ static int isapnp_get_resources(struct pnp_dev *dev)
=20
 	pnp_dbg(&dev->dev, "get resources\n");
 	pnp_init_resources(dev);
-	isapnp_cfg_begin(dev->card->number, dev->number);
+	ret =3D isapnp_cfg_begin(dev->card->number, dev->number);
+	if (ret)
+		return ret;
 	dev->active =3D isapnp_read_byte(ISAPNP_CFG_ACTIVATE);
 	if (!dev->active)
 		goto __end;
@@ -885,10 +887,12 @@ static int isapnp_get_resources(struct pnp_dev *dev=
)
 static int isapnp_set_resources(struct pnp_dev *dev)
 {
 	struct resource *res;
-	int tmp;
+	int tmp, ret;
=20
 	pnp_dbg(&dev->dev, "set resources\n");
-	isapnp_cfg_begin(dev->card->number, dev->number);
+	ret =3D isapnp_cfg_begin(dev->card->number, dev->number);
+	if (ret)
+		return ret;
 	dev->active =3D 1;
 	for (tmp =3D 0; tmp < ISAPNP_MAX_PORT; tmp++) {
 		res =3D pnp_get_resource(dev, IORESOURCE_IO, tmp);
@@ -934,9 +938,13 @@ static int isapnp_set_resources(struct pnp_dev *dev)
=20
 static int isapnp_disable_resources(struct pnp_dev *dev)
 {
+	int ret;
+
 	if (!dev->active)
 		return -EINVAL;
-	isapnp_cfg_begin(dev->card->number, dev->number);
+	ret =3D isapnp_cfg_begin(dev->card->number, dev->number);
+	if (ret)
+		return ret;
 	isapnp_deactivate(dev->number);
 	dev->active =3D 0;
 	isapnp_cfg_end();
