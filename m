Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85312E5438
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949249; cv=none; b=RNLPtxpkYpsWKhNQzc1+gPAjhUQWVr18KEVaw4gr9c6rLZgGOYGtC2bADgDyIgHdWUSqXTtPZDJYFJh58t0HK6TvCNdhxsbpyLh3VIzZfOXKCRwgeggXpO2k7o4GzHo2DCeLQhRdDkcW3hypgQsi5HA7A2OPD9EzsBGRo9IE5Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949249; c=relaxed/simple;
	bh=zNQeEG3jkd74BbtPOGEXwAMgZofLIGcOA7V+BefpxfE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GS63LiXLC+buFhELqu0eyQy2OBZmM/Cs3bY27tKmAlwo3kAdB5L6M8GNO/TJVUXxoNd0TRPZYrjiOJo4FS2CVjjmUq76Onxznqi5IIMQXsNPBjoN8tONkF7VrDIwfKLimNbpVHmJLE9RfPwCJx0eRLLO4uI4PG5Zjji2xafnFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uT10fAhS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hQCjcwYq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uT10fAhS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hQCjcwYq"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mMACwKQ45OFKp3dqM69V6dG6kIbJSpYqiKbZLP7Vh9g=;
	b=uT10fAhSsV9cz89bABA+WeC8KQvJ8SxMxJa20uSkA3MPkPDtQbtJUVUBo9dsyxtKDt4o2W
	b9uwOmJYazrbtXFVNDYow4MF9i3AOOxUicfRLH9+9Dq2FyJsN/Uyt+Lv04YwQ9brDXQXD9
	nYnAI67KtwE2Bzn2lfVOeaYGm6JCm4QpH6bWl/D+ZpsTTsQi5CHDqOHpmW2h/UslmKIKf9
	gapHY1a65YGxpxBDdC0OOISbGvl6auZZktvR43Sd063SM8TqNXhyYcaW6ESmkcJK/jEEg2
	96r4rZyqrGVGJowzLAEfxrZFz9/f54L+mIOoIqgmHM6QEGJKWNNFef9Mz92Rgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mMACwKQ45OFKp3dqM69V6dG6kIbJSpYqiKbZLP7Vh9g=;
	b=hQCjcwYqJJ2PyvAblYu+pT2ArzJfI6f/LcTDy9a5X68jkNrwT3LMB6pR3L/SrtWYr6xpu2
	SWiD1l4eTqEGH+Dw==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 0/1] um: MSI parent domain conversion
Date: Thu, 26 Jun 2025 16:47:14 +0200
Message-Id: <cover.1750947651.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The initial implementation of PCI/MSI interrupt domains in the hierarchical
interrupt domain model used a shortcut by providing a global PCI/MSI
domain.

This works because the PCI/MSI[X] hardware is standardized and uniform, but
it violates the basic design principle of hierarchical interrupt domains:
Each hardware block involved in the interrupt delivery chain should have a
separate interrupt domain.

For PCI/MSI[X], the interrupt controller is per PCI device and not a global
made-up entity.

Unsurprisingly, the shortcut turned out to have downsides as it does not
allow dynamic allocation of interrupt vectors after initialization and it
prevents supporting IMS on PCI. For further details, see:

https://lore.kernel.org/lkml/20221111120501.026511281@linutronix.de/

The solution is implementing per device MSI domains, this means the
entities which provide global PCI/MSI domain so far have to implement MSI
parent domain functionality instead.

This series converts the um's driver to implement MSI parent domain.

 arch/um/drivers/Kconfig    |  1 +
 arch/um/drivers/virt-pci.c | 46 +++++++++++++++++++-------------------
 2 files changed, 24 insertions(+), 23 deletions(-)

--=20
2.39.5

