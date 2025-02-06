Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1410D1AB6C8
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864367; cv=none; b=S01EsZ7NKG/SdoLKI1Xsh2x4478oa6na4QxmwK26pidxzRuPGV8BjRAVGuDKEm95EW0Ibx1ftrb0UVEFkAXfUjBTFLyFALptGxM3fSMxtdUdR6LwkepibX31k+FXvBPjdyKlesRK3idxWFRT/QRBjdE7/orWpXnM5zka1xN/s+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864367; c=relaxed/simple;
	bh=aniC6S3kqyQiMLO/4qxM/4Xy6Y8l0wrKcHxfKiNkAc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVMc6BZLXgS9DDZSIKQT5HAhuOVVe6h+oyYA9O4pBfmzX+XMzA76kBXj8AFboImNXvnHWZAzfNK6I8JFoIvxDRq4BXDCwCTZDeajgsvDdjnnyMJDz3snVEv4W+7W6I+XS+bVLWSw65PFjN13o1MqVTxRvJ11Ze2uB4y2eDQCV0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=5GWs9nsd; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="5GWs9nsd"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl7K49gRzlgTvC;
	Thu,  6 Feb 2025 17:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864360; x=1741456361; bh=w/2wf
	TFoZ/813Z1AKjjXK5RmQ73/6PAnXWrTN9IGy/U=; b=5GWs9nsd33ZbCBH66Wwwm
	+nkTXfXtnfGXUyNqQQMmWUyusXKlHqGtoBfNtDUsyoWGRCBzKzRYgwuLSlhImZtA
	XWAK/BiMUE/S3TRX5LQx6ce34JelFacWGayopa3M295EgFggKdDEvADAxuVtq4Gz
	w9CwU/Fg/Yp9O3wHIo54EBrvFzy6PHKbpTYrzxrz64sG20uQLCW6VTj1vogEkkY8
	de13MQt/uCqbd0FsRPE5vVZc04aiMiOPs2CsKXDTpWLNlZizsfPkE52ofLe6+PdE
	PYvO9cpKa84qe8WiH2fz2AsoYWlAB5Pu3Y1tYt9GS/Bviff0Ml0RlIyI83HIjwaO
	g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id IZI_2A-uRSuy; Thu,  6 Feb 2025 17:52:40 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl795zt8zlgTxg;
	Thu,  6 Feb 2025 17:52:37 +0000 (UTC)
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
	Charles Han <hanchunchao@inspur.com>,
	Felix Fietkau <nbd@nbd.name>
Subject: [PATCH RFC 28/33] wifi: mt76: mt7925: Fix a locking bug in an error path
Date: Thu,  6 Feb 2025 09:51:09 -0800
Message-ID: <20250206175114.1974171-29-bvanassche@acm.org>
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

Call mt792x_mutex_release() before returning.

This bug has been detected by the Clang thread-safety checker.

Cc: Charles Han <hanchunchao@inspur.com>
Cc: Felix Fietkau <nbd@nbd.name>
Fixes: 5cd0bd815c8a ("wifi: mt76: mt7925: fix NULL deref check in mt7925_=
change_vif_links")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/main.c
index 98daf80ac131..40e898f24628 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1992,8 +1992,10 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, s=
truct ieee80211_vif *vif,
 					     GFP_KERNEL);
 			mlink =3D devm_kzalloc(dev->mt76.dev, sizeof(*mlink),
 					     GFP_KERNEL);
-			if (!mconf || !mlink)
-				return -ENOMEM;
+			if (!mconf || !mlink) {
+				err =3D -ENOMEM;
+				goto free;
+			}
 		}
=20
 		mconfs[link_id] =3D mconf;
