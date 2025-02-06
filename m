Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FB01A840A
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864353; cv=none; b=LuZwpYnJHaMhZa2wvS0f5F0aPtFGv9xOMYobCJHTfWpj4hLwsqEnwS0L31Hss9XAEWbevMpjx8eb5hmxKCS1EBlWYkegByDiL6WVgqhufjdfkAN13rIRxGYtNlZU2a8yeN0XJtkQjy5/0hW6eDlIzDY4o4v9Hqa03jcEuPoCWcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864353; c=relaxed/simple;
	bh=P9vQfPzRlQ++HJ0VuGGA6CMNKqqOiigCa1ygR0iKHNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKKnW9YPB2XgbVyINZPfBmrjEQOYMK7q6owjRZ6bkdbOvzVxwyqxcaTGOriBU1hzsmTNK9dSuGXFqY3iF6mN0JNGsxIVCKV4VBW4nfkIu25/fVG2GQU/mnJ/MS2gK8NbLYs2KugjRTNedv5lOjB/S7AbXGr/n2Kw75DI1i6QlPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=nBwdpTo4; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="nBwdpTo4"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl7374lCzlgTtx;
	Thu,  6 Feb 2025 17:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864346; x=1741456347; bh=inOoR
	H5HCmue/6AWYFWFrzhmM2rbGuegGYvMdqnS8x0=; b=nBwdpTo4eKW4Jtv6SgM9g
	khltw2NjRZsoC5wSfw2vCbgh56YNyS+ThX28gmpdETOofKTdyXgjpeXsu3OIhJH9
	YYgmgOH6O2e8l6+OgnHQLzfl18WEfJmosGkDV7dvWgeOp3w1lkVd4IHdsgIi48Z0
	waaLHYKoWPXyIa6g+UVids7RGYzO246ECXDx/Cyqi1wFUiuVaknUlsvs1R6litoe
	ZRKrPIA72mxaCRswABxH15VtZLKtzc8st5U5jRB+5NImg8wp/HvIzFHyDDkB0ZYE
	r2TXy2gYvSfrJQDpO3LWFvgK+zg8nMDRKYPjso5HSs6F6ewXZdrHyus1iJ1iJjGM
	w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id wohp3X1QTOYM; Thu,  6 Feb 2025 17:52:26 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6v6Z63zlgTxr;
	Thu,  6 Feb 2025 17:52:23 +0000 (UTC)
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
	Aleksandr Mishin <amishin@t-argos.ru>,
	Robert Foss <rfoss@kernel.org>
Subject: [PATCH RFC 23/33] drm: bridge: cdns-mhdp8546: Fix a locking bug in an error path
Date: Thu,  6 Feb 2025 09:51:04 -0800
Message-ID: <20250206175114.1974171-24-bvanassche@acm.org>
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

Unlock mhdp->link_mutex before returning.

This bug has been detected by the Clang thread-safety analyzer.

Cc: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Robert Foss <rfoss@kernel.org>
Fixes: 935a92a1c400 ("drm: bridge: cdns-mhdp8546: Fix possible null point=
er dereference")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/driver=
s/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 9295b2a9f9be..51e2caa9c815 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2053,8 +2053,10 @@ static void cdns_mhdp_atomic_enable(struct drm_bri=
dge *bridge,
 	mhdp_state =3D to_cdns_mhdp_bridge_state(new_state);
=20
 	mhdp_state->current_mode =3D drm_mode_duplicate(bridge->dev, mode);
-	if (!mhdp_state->current_mode)
-		return;
+	if (!mhdp_state->current_mode) {
+		ret =3D 0;
+		goto out;
+	}
=20
 	drm_mode_set_name(mhdp_state->current_mode);
=20
