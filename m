Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E66F20D516
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747494907; cv=none; b=LjzlqGYPBRBd0OnzyiHTo7yrS4h1Ya+G+bHwUz6u1maWXmKr4GfEGoLlO/ndHt5KNmxHbNdaQD/v7jIRVd+JG17LIYwAJ5OqqCyO0Jik5gt15oyw35p28iRCo5OYld+ldlN6eHOdQGLAqshREhMNcBvx60qBiKvV3FpchN/p+lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747494907; c=relaxed/simple;
	bh=QwL5UTZb5VDMfNGxGWHnJ5EDf+WSNqcCfowPSq1/Ndw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uAMeU0aJh9oCDQ546OOUsBAJHasjQdehKVRa778vYZo8OxWmnMmNKd/+Zf29DEvyeiuF9gnjahTP0FkH/a7azPS/2FCoFP9Cpe2X5DTQ/dvFfncc1jqNb9nRtPGvCPElP64L16pvErc34Z9zGcaUeZYl05bmcU3t225T2aVwXpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Sdw6GdR5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z2/dRCOA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Sdw6GdR5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z2/dRCOA"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747494901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZaDBuiR2gKznTjuWYmUloD3ZUVLsi1k8LQTJYuhNwNg=;
	b=Sdw6GdR5DjW1HMPHdstwd5pNEwgyESSi0QRvjB4K9OftlpmxN1uxj4tj+l1/9aq4hCgXsf
	Gjg5R3LHWsTpIMQanpTfh0BoPafduG2R+kvAg2T2R9HsMh7gz9z0jXwb9MRXNT0AAJEh87
	l7TAyQDsiG1RmYFxQgnwL4dbj/r5rRk7d8qf1Bc+C6c0+VF+uIAtV0KjRTntk+hGa/bEg2
	cFPHImaL0DKF0R7rcvauxEiUmSvV25aw0amTbbtQ9pPSF+S27u1BmpZS2f6Hr87Etx71OL
	d4TJW+u6eG2MCR0xRDv47b1tpq3z/yU6lG4VSAKtQgSy28hHIIAHZwm0dQkrzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747494901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZaDBuiR2gKznTjuWYmUloD3ZUVLsi1k8LQTJYuhNwNg=;
	b=Z2/dRCOAyr/t6S+hiuO3zjPqP8cT8wpw2gMGs03K9GrscMrEPPHVoqa0XXCp5BBg7gHDcT
	mfStfliSCreLMfDA==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2 5/5] futex: Correct the kernedoc return value for futex_wait_setup().
Date: Sat, 17 May 2025 17:14:55 +0200
Message-ID: <20250517151455.1065363-6-bigeasy@linutronix.de>
In-Reply-To: <20250517151455.1065363-1-bigeasy@linutronix.de>
References: <20250517151455.1065363-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The kerneldoc for futex_wait_setup() states it can return "0" or "<1".
This isn't true because the error case is "<0" not less than 1.

Document that <0 is returned on error. Drop the possible return values
and state possible reasons.

Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/waitwake.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index b3738fbe83c62..e2bbe5509ec27 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -585,7 +585,8 @@ int futex_wait_multiple(struct futex_vector *vs, unsign=
ed int count,
  *
  * Return:
  *  -  0 - uaddr contains val and hb has been locked;
- *  - <1 - -EFAULT or -EWOULDBLOCK (uaddr does not contain val) and hb is =
unlocked
+ *  - <0 - On error and the hb is unlocked. A possible reason: the uaddr c=
an not
+ *	   be read, does not contain the expected value or is not properly alig=
ned.
  */
 int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
 		     struct futex_q *q, union futex_key *key2,
--=20
2.49.0

