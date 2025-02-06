Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9AC1A0BE1
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864337; cv=none; b=dkBs6VzhyJMJqZohQ6AI/pbppEjnKOVO9I7yLB393Z5njU2mOCd1luNmZcOHnvOcP/SUSI5y0oW7keuLK3BeIrn377qeux4ztxqKXaygb8FVvDVlr+oGiiNNDBhzqTfw4ss8otEvhkookhLp3WHRxHf7bdUGdYoAc4uFT78bxgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864337; c=relaxed/simple;
	bh=X2rabvTnSEaCztO8FphC62/86+rSYZO6c7zIRaEqT5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmrHMNnvM/EWY7iVqHO0Ned8oDEtewciGyU9M4rLFgZUCcabRlSvS15ghQAdsKqz8R27KAKeYNuGFjjV6HOeZNgs3I3FRXazitEwbHnntizmXJEyJKGhOqQbYCgaDigyAp2lDPi8FJ4i3JdZC2PoZCZIXL50uCIh0hMhOeq5yvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=1jfhq5On; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="1jfhq5On"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6k6Z2gzlgTtj;
	Thu,  6 Feb 2025 17:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864328; x=1741456329; bh=cOiIK
	J7bVU7I02SoiGLvbDIor3Z+MGUOGpDV2NqdnUE=; b=1jfhq5On3ZqreUzaHyMqh
	X3j3dyCk8vhVGVKYmzDKt3Mf7t6d3WckHtzmh4zDICI+Z90Eev2ECfksvQfTWpk6
	mL0xg0Lc8KrQsk//zTILrN3xAa8y1zpB2/zuUD8MB77fgr8O3MHxOS2yJbyAsSwG
	aVwqu2a4txH2JML4Mij9evn8h4zjJX5Dop03kw8PJhZsFUUFOz/abo5bv53Hz6cs
	oesTQ7jpLpuM4BXL3tTNS53RsL1ZdVqoGBn2Ttu4S8cPSGg4DU6L0qRG6f8y+LE+
	Yt3PemDTD9H+b832E26q+IwDndWYElt6PVWDpmlmeD4sDv8zw6ab9gSpu1Dky05T
	w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id gTu-8qSkeYQI; Thu,  6 Feb 2025 17:52:08 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6Y6ZqSzlgTy5;
	Thu,  6 Feb 2025 17:52:05 +0000 (UTC)
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
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Nick Dyer <nick@shmanahar.org>
Subject: [PATCH RFC 17/33] Input: synaptics-rmi4 - fix a locking bug in an error path
Date: Thu,  6 Feb 2025 09:50:58 -0800
Message-ID: <20250206175114.1974171-18-bvanassche@acm.org>
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

Lock f54->data_mutex before the first 'goto error' statement since
jumping to the 'error' label causes that mutex to be unlocked.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Nick Dyer <nick@shmanahar.org>
Fixes: 3a762dbd5347 ("[media] Input: synaptics-rmi4 - add support for F54=
 diagnostics")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/input/rmi4/rmi_f54.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
index 5c3da910b5b2..f7387527e8b3 100644
--- a/drivers/input/rmi4/rmi_f54.c
+++ b/drivers/input/rmi4/rmi_f54.c
@@ -541,6 +541,9 @@ static void rmi_f54_work(struct work_struct *work)
 	int i;
=20
 	report_size =3D rmi_f54_get_report_size(f54);
+
+	mutex_lock(&f54->data_mutex);
+
 	if (report_size =3D=3D 0) {
 		dev_err(&fn->dev, "Bad report size, report type=3D%d\n",
 				f54->report_type);
@@ -548,8 +551,6 @@ static void rmi_f54_work(struct work_struct *work)
 		goto error;     /* retry won't help */
 	}
=20
-	mutex_lock(&f54->data_mutex);
-
 	/*
 	 * Need to check if command has completed.
 	 * If not try again later.
