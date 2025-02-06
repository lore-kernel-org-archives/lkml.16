Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8651A7262
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864350; cv=none; b=EKL70RupuRsOy2vkbJLTeeC2vijHKU0Rrbs+tNQnqWzgfOOWzvBx+nx6nhnZ8eopqwR9SlKy+LBt+GpognBiT1DiLG61cKXh1i9H+O/pGbWmRvYLNXhjacYV8AhDjC9Fom6EZNaCgLv9LE55K0RfC8EmZpxwr+uwijNRcEy0qiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864350; c=relaxed/simple;
	bh=JI7PUChicr3T5l0g0BaPpX87i4nYyFWEblZN3Gyd4zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfzSwGK+uXfTB1F1SeLvNtuzZ4YvIswTNLENS8pWnTt4VUPJOSX94pXGBF83Ozr+IBaHPVtJIS3d9+SlfexusRNwvL1GNAhyZXoDDtRFfAgDSffEjopLQ6HP21uYAY7m/HybmTK+EgAzTXUFlyIFj3sEbmjYclRMDpN0i6a5CeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=E+Lgdetw; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="E+Lgdetw"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl704XHFzlgTtm;
	Thu,  6 Feb 2025 17:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864343; x=1741456344; bh=Dg7Gx
	zyvWAo6yHyjGsfECxE+EVYO7MMkK7dA9XomxNQ=; b=E+Lgdetw3s5O20PDD4mwR
	q6zQUkhlaCwC2KfcTaV5avx3dLjDsYzs1fhaToNSWogYueFLirhs5IDoaxG9EF0L
	dTNcFZyfMZy4obyzRqE6nJzKtTBjiUIKH//BuPNWQdRh/8lSej1vQTa33o7IA7rh
	MbEmCJ7FE6D5n7wKEGuvl4adFY1sZvEfV9qmT3Vbu/OcHKdUAplr6vyKZnoZIpEY
	aqQNsooKP1RtCp1mKOXx0xrr1HakRkHFf9Sg19fAjvsSza8nZ0GBNkZfQy86Fs/S
	LVczK0GHRpCOGsi73wS8P3IA5d32jyp8BmK3gpUJIwyYJk6gGU1y39Kbri3K4SKu
	g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id MvlR6oSXit_t; Thu,  6 Feb 2025 17:52:23 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6s0ZCpzlgTxg;
	Thu,  6 Feb 2025 17:52:20 +0000 (UTC)
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
	Swapnil Jakhade <sjakhade@cadence.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH RFC 22/33] drm: bridge: cdns-mhdp8546: Fix a locking bug in an error path
Date: Thu,  6 Feb 2025 09:51:03 -0800
Message-ID: <20250206175114.1974171-23-bvanassche@acm.org>
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

Do not unlock mhdp->mbox_mutex if it has not been locked.

This bug has been detected by the Clang thread-safety analyzer.

Cc: Swapnil Jakhade <sjakhade@cadence.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/D=
P bridge")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/driver=
s/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d081850e3c03..9295b2a9f9be 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -502,8 +502,7 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mhdp=
, unsigned int nlanes,
=20
 	if (nlanes !=3D 4 && nlanes !=3D 2 && nlanes !=3D 1) {
 		dev_err(mhdp->dev, "invalid number of lanes: %u\n", nlanes);
-		ret =3D -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
=20
 	payload[0] =3D nlanes;
