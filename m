Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F6822CBE0
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752429; cv=none; b=AwwrJr4FtyrrvTPA/jqhY4Vb8gR4OfjOCuhJk7lr01jykc6c6I0BTDxM93g7HnoIx+g0OYWuaYzoX45wCCS5kmHHqMXlKgkVEYQFgelG0RNfer3LRCq87v2D63nHuIlzpoRtoocrF3pdSuNzxDGqH6YUTPRYm1fvCydxa7ex6vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752429; c=relaxed/simple;
	bh=enJGw3z8wc4NfZPVf5yVNrotbBw3uybTAVe5mnXm8gs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jVEt9P6/qqhib90lg5uMY6ZtfVTgxoIN1o8UCyy0fe85NMCApQqeuiNXmaijsNaaVxOAQuOYnzZeumwdsA7nQk8aTZFs7AAsVEVT39cMB8nTyiVc3IVNgXOxgEJL6rT6ik92QDB2cS3gCJwK2Nsq4qfDv61RfLlPTQ9ScH0H1wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2y2DpE/v; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z9NCN1gU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2y2DpE/v";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z9NCN1gU"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GE0vxm6kJ8AmR1y9odNbcvEuJAJGoBR2o8boyWzFAFc=;
	b=2y2DpE/vhDwASauPgM3z9rmhWLPYT+FD0BfSLU6RYlgRM8G9xXfQb1ZsETs31iY9pMUXRt
	khv3cpjH3XxqYyl+lzYpdY8Et2vo4Mtcn/eRJJ+J/F9C+ZNupFGsvnRs0fDRDGf60OU6cH
	02gkW3D/F3rdHBNX0/aAT3V/sHEVa0a9botdwzNdOAoY4Oe2qJLbKEyUg9I9JhQKT7eOci
	TNfMDIfUXXn+4baNwEKBVgZTj/sFKlF3eRBc2+kkXOqT3wnmRTrpEsVpFpf0Ref6A/0emP
	PP74Re1MsaSA0cPPopbLa7clcZHTTA25lslQjkGxsiPJCsO5cI+cj0wXVLrbfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GE0vxm6kJ8AmR1y9odNbcvEuJAJGoBR2o8boyWzFAFc=;
	b=z9NCN1gUGalRx4v45ml/ym6cUE9LfELvCPiqmm/X7LNBKruz4/5J0r7TCTo0TGLEEZuHMr
	3zWBoWm+BEcHRvDg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v2 39/45] drm/xe/oa: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:27 +0100
Message-Id: <08238e193b1f63ae7d5d607fa975420735a869a5.1738746904.git.namcao@linutronix.de>
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

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/gpu/drm/xe/xe_oa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index eeb96b5f49e2..7fbedd83ccfd 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1763,8 +1763,8 @@ static int xe_oa_stream_init(struct xe_oa_stream *str=
eam,
=20
 	WRITE_ONCE(u->exclusive_stream, stream);
=20
-	hrtimer_init(&stream->poll_check_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL=
);
-	stream->poll_check_timer.function =3D xe_oa_poll_check_timer_cb;
+	hrtimer_setup(&stream->poll_check_timer, xe_oa_poll_check_timer_cb, CLOCK=
_MONOTONIC,
+		      HRTIMER_MODE_REL);
 	init_waitqueue_head(&stream->poll_wq);
=20
 	spin_lock_init(&stream->oa_buffer.ptr_lock);
--=20
2.39.5

