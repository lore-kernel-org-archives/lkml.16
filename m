Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9659C22C328
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752427; cv=none; b=QGnAs410NSssH48kuF06SPZLyCMoWOnOP1bFVkJSRHFpgEidRP/UONg7s/A5WQNf6B9Aga1xsZRJQ7ypFevXGL7vfkEzvXT3OPxzASHysFDOEFf+uxHrGy87YtQOFkiJ2l16huCmw6mSyt3ZDFZguqE44KtfFs4sXkZ8GxSErxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752427; c=relaxed/simple;
	bh=GfqUII7lFtk1fgjBBoNABGMaHXZgp3I8jU6YpuDzaNY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AtRFFmtyk6wJplWMZj5z449VJvt2sdi7A1F+zqUs3YPGNsfVXI9ROPUS2FL0O/giO4O/cl764NCb/u40oT6q3RlvIrhz6xBQNKH2OBaaEfW3wB8ahjfEtUh4CvFyJHWKP7V3Jo2M0RohiW1EPZELF6U7yhGqghTBjnCNfsb3Np4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q+Qbmg5n; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G+y5FU3u; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q+Qbmg5n";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G+y5FU3u"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ow7fudlBfGM8CjAonrVZXh3DmryZO5a4Ve/tusEJ0iY=;
	b=Q+Qbmg5nlDjUPcjEGnBXxNg59+eqlDW3EH5GJE/0ma5VYKlMApNLk134FEvXQL6gjtfZD9
	m4UglMTXFbHI9enpeQn/XKSeMdvT1J/I6h7r0hKauSUjGoFKPN1z8Dmk/MwNLWw4GWmroy
	Unld+bUKnyL2bEl4gZG3GBHAlyhklClc+NGF9k1axCxDlduha+yOPQmj0X7w/9Y9WLE6tK
	eVDg9X2gKvjRiJo415QbX77UXz6QlHMO1CybvBN8GGV9Vq0HyqGZmLNWht8M+NPiFR1sYU
	cDyK80PzPtEkaDm93QZklv4HmmNstHM1nTQ7HwSm1DBDqvJk+cHQkfWnhGosIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ow7fudlBfGM8CjAonrVZXh3DmryZO5a4Ve/tusEJ0iY=;
	b=G+y5FU3u+i/sC1RnwHi7TNpxI+8CSjmFrgtXW42YNNLXAWEyEo6KilJvGnnRwk0SF3AZ/B
	RyE2XnUWX0PGszCA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 33/45] drm/i915/perf: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:21 +0100
Message-Id: <b712673a02c7132ea85eff57b0e7e59f6d5d0da0.1738746904.git.namcao@linutronix.de>
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
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/gpu/drm/i915/i915_perf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_p=
erf.c
index 5384d1bb4923..279e266b4b06 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -3359,9 +3359,8 @@ static int i915_oa_stream_init(struct i915_perf_strea=
m *stream,
 		"opening stream oa config uuid=3D%s\n",
 		  stream->oa_config->uuid);
=20
-	hrtimer_init(&stream->poll_check_timer,
-		     CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	stream->poll_check_timer.function =3D oa_poll_check_timer_cb;
+	hrtimer_setup(&stream->poll_check_timer, oa_poll_check_timer_cb, CLOCK_MO=
NOTONIC,
+		      HRTIMER_MODE_REL);
 	init_waitqueue_head(&stream->poll_wq);
 	spin_lock_init(&stream->oa_buffer.ptr_lock);
 	mutex_init(&stream->lock);
--=20
2.39.5

