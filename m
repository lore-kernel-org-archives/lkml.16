Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C421EB5D4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489248; cv=none; b=mJnS8+/UqZxlYjYux3ZB7Pk3oOEDjcm1reUJgE8gXfshLtKJC3dA3yF6XOCyqvZp79FDPvFQ/xrrxP6VKVUlteDmqQa+Yv+El/G8TEmP9VFRx3tWTt5UbegkP8nSWHN1TqTLq5MCss6UqH6OhprND2UJaL2M9QYQJRteaBOM4Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489248; c=relaxed/simple;
	bh=yyLeyUNGU3/8laij0GGzuu+0DqJYDKth3Y/kTZOEoas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g+E7VCIvWNE6f/YHXkv3ThoHidfU5vV/kaZO542UaV/Ozl9Q6Fbh7aJTzKXHBMgmtOmuPc/81KQii31j4J5hD2SpoCOWvHB0hAQ+rvC1It9DuYWW+AJ8wSRF9m6b0gWo3Mcm0L4MEB3sdN4UZFotp5gFuBX3gNn6G236iUB1Cok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpTRX8fe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpTRX8fe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D91C4CEE3;
	Thu, 24 Apr 2025 10:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745489248;
	bh=yyLeyUNGU3/8laij0GGzuu+0DqJYDKth3Y/kTZOEoas=;
	h=From:To:Cc:Subject:Date:From;
	b=kpTRX8fem3VQJrSxMeffzEim00JBHw8UJs77oRTkMGX/99bxinghB8PPJqlnkvzlZ
	 4Wz6TpqeAwdBvqjjLexDvTfm69hgSf7KqJimkMSysEuaccvDgg/XStYmcah4EJ47SY
	 yLeGAllRpteDUMecFlfeLuucELmDdN0PiVhDoxEJs+SdoLM58p91+/g2IgN+NRGk6u
	 rQhVn8oMT2nul0bf7fs3yJOm8dze4PwStB1ARF07XctJ0quvyFVVtNZl+pWy1Wn7q6
	 m734bm/orBcbfJT0rhUh2tcce1V3e/1nZJ5MjAVVL3+oIC2HW6JYRegUPkXkcV/7BB
	 91vVPS8yT69+Q==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2] drm/nouveau: Remove surplus accel_done
Date: Thu, 24 Apr 2025 12:07:19 +0200
Message-ID: <20250424100718.27651-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit ebb945a94bba ("drm/nouveau: port all engines to new engine module
format") introduced a TODO to nouveau_chan.h, stating that an
unspecified rework would take place in the "near future".

This seems to mean the variable 'accel_done' below which is never read
and, therefore, must be a relict forgotten in a previous cleanup.

Remove the TODO and accel_done.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Remove accel_done, too. (Danilo)
---
 drivers/gpu/drm/nouveau/nouveau_chan.h | 2 --
 drivers/gpu/drm/nouveau/nouveau_dma.h  | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 016f668c0bc1..7133e4a03504 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -33,8 +33,6 @@ struct nouveau_channel {
 		u64 addr;
 	} push;
 
-	/* TODO: this will be reworked in the near future */
-	bool accel_done;
 	void *fence;
 	struct {
 		int max;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index c52cda82353e..790045ff5fff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -92,7 +92,6 @@ FIRE_RING(struct nouveau_channel *chan)
 {
 	if (chan->dma.cur == chan->dma.put)
 		return;
-	chan->accel_done = true;
 
 	if (chan->dma.ib_max) {
 		nv50_dma_push(chan, chan->push.addr + (chan->dma.put << 2),
-- 
2.48.1

