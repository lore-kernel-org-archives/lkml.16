Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DBC233144
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752426; cv=none; b=PvsO67mWpYh2lJ5uDpWxAHEB+k7pNqadeOmW1IOf77EE4vIyAS8kSygy/EkxWtVY5muSOHHk97bqeVFq5iRuGsKl7ZhmZlVUY1d637SKEZAuUODyLUTMTjEqGMPykJltHUXMDLDUH25zmHcat3IeyC1msyGVym6w0KEMt+btau8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752426; c=relaxed/simple;
	bh=u9/EDuRcB82GNyKjqYa8EalLD45Pfwdwr9NZZJ5+Nmk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pFYgpeniUzIfG8XNUJtjn7Ddq8z1DPei5aizemHdU8fi8tQ1qsz37Qn4ZNc/1ksOnj8U4epZPViyUagLisdGgZd+i04ofh7QeR6/5+xU8Wn3T+tYuCbg1iI+Td5njgTk1E2hcf1smnyFZID1aOYiyZej1VWQ9iEHOBhxuVWApg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dtQdVW4y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q0t2mhmi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dtQdVW4y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q0t2mhmi"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbGMIjxYIde2al+sdEmg7IbJRUAqtWqPlO9YZ1B56SU=;
	b=dtQdVW4yu5A1uOz7AD5vQk57c/DBPYl8t+XzE+SlwyGCsA4YX2Ga1tBaX5ULYS5csWNMf1
	D5nglRjcxpWYtwbVdlzpvx4VrVJSaP29S0bMlYkgv3vzTg2xyqxzxtYGIRVOW2THwHuGQZ
	tFgl42wesGGH4p+RQgsmzOWZiJ0uJqOfesVtO8yx5wYHyoNvYl5nzXS8w53gguJA3xNRSS
	hPh3vnLeU/2VrhRdKmN6c3PXFr/xEGBF6dIlSGhAeVPGoxunmeQxcEkILUXKrEdRYVH6z9
	IM+fxBy9BQwRLylQRocW4DTaLVrYcjQCHdodcjiibgXvF8g5yrIldnsLC30FdA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbGMIjxYIde2al+sdEmg7IbJRUAqtWqPlO9YZ1B56SU=;
	b=Q0t2mhmio+IC0Ftc3R8qCcZjZDhAWP2cPQMViXiLRErW6rx6x3fZZglUNCyEKS8unKyiKX
	z/W9o06BV6+hnODw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 31/45] drm/i915/huc: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:19 +0100
Message-Id: <d293dd4dd9cb6a9bb9e99f3fc11ea174c6525bf8.1738746904.git.namcao@linutronix.de>
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
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/=
gt/uc/intel_huc.c
index b3cbf85c00cb..00d00c480cc5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -231,8 +231,8 @@ static void delayed_huc_load_init(struct intel_huc *huc)
 			   sw_fence_dummy_notify);
 	i915_sw_fence_commit(&huc->delayed_load.fence);
=20
-	hrtimer_init(&huc->delayed_load.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	huc->delayed_load.timer.function =3D huc_delayed_load_timer_callback;
+	hrtimer_setup(&huc->delayed_load.timer, huc_delayed_load_timer_callback, =
CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
 }
=20
 static void delayed_huc_load_fini(struct intel_huc *huc)
--=20
2.39.5

