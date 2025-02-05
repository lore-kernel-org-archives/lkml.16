Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519E722CBF3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752242; cv=none; b=oULhMJB3SsnWBhNc0LmjCjetJe+5e6SYCWvoFqbgigHWgIq+bRN/+TkfAqT3OyIyDsgNlXmij9q7L0xEOFS/WOMWy7sA6jzofMrNv7GpFAjlK4hXC1TjgLoeqzBVQYYDRthpbISDNxiRPcjh9KJHJXADKB0eENPG3sWQ1uo8ulA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752242; c=relaxed/simple;
	bh=uarWz4KSbrYWFPZp9xzHJgg5bKqubxvpg5+6WKDWvac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C8+QPqh7Rqng9oVMqtix8EhPVpoTeLcGWcYrE/RTqpyY+WKxDn4+4WQWwycVkon7i6cl5D+rd1c7GgFYIr6mN6002YbE/ymlCmNuerbIRE5dsF3rjVfIurgzDk40M9pj1+4QQfIZOmsnahZCOuLo1xwRYPlwdu8CyBh72sRd03s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=csy/eiPN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=F8rRfihX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="csy/eiPN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="F8rRfihX"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Khragn3AIjYHvjej5Ja5Djv2dPm1xi0w8Hk1OR/WwmU=;
	b=csy/eiPNOGcmvPSL9y3KU0Tj05HraWeAr+OFCoq7PdO2ZICxUIEY+15T5x6IHSNz8Y6Uzj
	nxfxPAfkhc3dCtgzkNZXnp3JuSG4G7dC+U+swquYJRZf4SdT3I/7jX/c0w/2N4y7c1/pma
	jXwbhLdD6K6gRdv4Yugdjo39Jzzu3UWBYcIsVEloShcmGMAKo5l9sfuNWOyWihh3qTUhHk
	djN++9ENkgq2IUM1M4NLuBkEbbMk6muQVj+JhnTCSN5KpRKM9BwHR7AR+9fNLXkX2uZ6Va
	q+NxjJOFXLGNSAad1bEJaImQQ812+o7RBHjPaPIN5hC4Q+O63G3HOsgUJW7HEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Khragn3AIjYHvjej5Ja5Djv2dPm1xi0w8Hk1OR/WwmU=;
	b=F8rRfihXOfR+KoKubZ7sv/0fPwQhM19LZ8kEM4A1+swJOkPivficZBzd20HRRm91PcwnWZ
	K/CM2DLpDlutkEAg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 03/24] mac802154: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:23 +0100
Message-Id: <5a89d86092d11a1d0cdfdfaa33990aaf7f1eec87.1738746872.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746872.git.namcao@linutronix.de>
References: <cover.1738746872.git.namcao@linutronix.de>
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

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 net/mac802154/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/mac802154/main.c b/net/mac802154/main.c
index 21b7c3b280b4..ea1efef3572a 100644
--- a/net/mac802154/main.c
+++ b/net/mac802154/main.c
@@ -213,8 +213,8 @@ int ieee802154_register_hw(struct ieee802154_hw *hw)
 		goto out_wq;
 	}
=20
-	hrtimer_init(&local->ifs_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	local->ifs_timer.function =3D ieee802154_xmit_ifs_timer;
+	hrtimer_setup(&local->ifs_timer, ieee802154_xmit_ifs_timer, CLOCK_MONOTON=
IC,
+		      HRTIMER_MODE_REL);
=20
 	wpan_phy_set_dev(local->phy, local->hw.parent);
=20
--=20
2.39.5

