Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FFB23A56A
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752430; cv=none; b=m1p9+77qZhzCBi4wYZJJTYPE2BY8WYZXXJDsYh9L24qsvZYGiinxZtPAkXtsPegafBoKdLHGkLkqw1dw3bmqQ+R+9/UJaBzQbgqXUvNmkkCIFyQ4RjKE62GAryEOf+jsLEoovlAiOh+rsn73uMhxM0tbJnutbNvPVp3nG1FyzZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752430; c=relaxed/simple;
	bh=6nsQYROfnQnGkMSpmE2baxymz0hx+lCr5DOiqsDqGMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d9FFab9XJ2da/TAKSTQjhvnx8JtBjEhYyD2t34EI9KWCz3IT3a6BIn1GAbA57EY+w6cH3QzZqmX2/djfH6rOUAXfZc1d/vR2NA/JwstsalKNsJjwoxLNxK/sNA4Mdq3Ve58D1kP+6TTvlpNkVsgzhXWr+WqWZgofApewmAkqBw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NhJY3/H7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P5oRV8Qz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NhJY3/H7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P5oRV8Qz"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jNewaaJJWh5lLXLCWuiOYoABRKEsvt2pN7qrAmPm1pQ=;
	b=NhJY3/H7q3D7lFmHlqq9IagYyaBKw4k56m0WfwpLtZNFfeMbXFexTzobH5J9VWhSKJrX/P
	rabK0tLGaQW+4cOMpczI7cJogk37nvNhawQ0Dn9Bt7rvmY6uycym2SoB33VAfHvvhxogr8
	xnuFRMGLBCG7V4zP+/QhVHzsyYnvB/Z9wormjnzahZnJIyyqy35RxHPKlAK5fR3YDMbD1f
	3ceteaxlON3Vof6/Mn1cNYw9qXJfwVcJDNxQIzHiJbPSFDwjoWX29aj49JgbO8zAJ4Xj0J
	zp1qHBX+28Z4CXWpUbpcIdxsXTi+Db7r+1s5PumF5faF/HeMYMbsGr3r3k8N2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jNewaaJJWh5lLXLCWuiOYoABRKEsvt2pN7qrAmPm1pQ=;
	b=P5oRV8QzBgzNCSJ/yOhkcFUbneth/kFMp+ZBrm3fhRYkITl5akLWs08iGEHPVf+mhtMYQW
	0yBUcjNX/P1gEVAQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2 41/45] virtio: mem: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:29 +0100
Message-Id: <4a911503d16684592b59a16d8ade97e42df64a54.1738746904.git.namcao@linutronix.de>
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

Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
---
 drivers/virtio/virtio_mem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 8a294b9cbcf6..56d0dbe62163 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -2950,8 +2950,8 @@ static int virtio_mem_probe(struct virtio_device *vde=
v)
 	mutex_init(&vm->hotplug_mutex);
 	INIT_LIST_HEAD(&vm->next);
 	spin_lock_init(&vm->removal_lock);
-	hrtimer_init(&vm->retry_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	vm->retry_timer.function =3D virtio_mem_timer_expired;
+	hrtimer_setup(&vm->retry_timer, virtio_mem_timer_expired, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
 	vm->retry_timer_ms =3D VIRTIO_MEM_RETRY_TIMER_MIN_MS;
 	vm->in_kdump =3D is_kdump_kernel();
=20
--=20
2.39.5

