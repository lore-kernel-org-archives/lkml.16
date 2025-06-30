Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6FC2A1CA
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266291; cv=none; b=sUyaWyq2BtqWE0kF0JHtoKbDPD1dXQw8eDPZS7BuQRVkPfRsDchWiRpQnCCdXiXd6A/+vPumK+idfvt1LLgd2usSXxaOCLy8DixmbzACtdxhVgsdQKHH9Gy4Ql4ZrGjv16Nl+FHgbuM2FkU/zbo+7GEgtHnxSuxjvu2SKVSr4Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266291; c=relaxed/simple;
	bh=m2Gjb3iKXjoK1eoV2RM6zaS1MqAkvTxi6kLcK7siZ+4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VOneuOrqN7w+6ZoGazX8PNughmkkwNa1b+ROg1wJ0W75ITd1PzFMjukSgKm0Mbl1b5aSZDiH+H2jF3Od/5/MyMTA197TyYCgyLFSsXBe/SoOrjmCf296mVaFEdeIBNt2RncpJ0Y7cNpAuhOmBpqIBFkxczbldd2MXRURGxVp2FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j1sv8PIs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8BCumvic; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j1sv8PIs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8BCumvic"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751266288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VOem6DFTTBYtd/vEfcGkm8LWs/7rqMWLb2YBeulRl+0=;
	b=j1sv8PIsIWX0hpZELMY6hqQzKgDyy12A70T6BfRczuL2qJTrjiVdSTOBCPz8zpsBNjHbGQ
	wgi3atCrmjxPfMqCrS+Ydk6JNnzGAr6uD9okbDz/KwKh6K0rdpyGPZDUCp21+7S8ir7t9x
	OFMTsKliyKKdWjfchci8mOanx2YfeoO0/R/HyaTXDjCBJ7kWCnw+mYt4Ml0RguJNpkGUQ9
	pnl8mLrv/Vr8K6t20UqW2FH9NXKCfM6gkkV5gqy35DGatCO1oxPXToVkJ0ou0sUNr51pMw
	dA9EvWNohUO+NHK+e9akS/fsSmWK4iiPc/I7t04GxbIqI5jAQPpwUsNNvDiNkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751266288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VOem6DFTTBYtd/vEfcGkm8LWs/7rqMWLb2YBeulRl+0=;
	b=8BCumvic4SrldCHtcOnYKNz1vML2QeEHDqac5qxWs92gE9mT4FvcKNz7Wfl+JD+xvJ0z8o
	Kc76aanG7kIN7bDg==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 0/1] um: MSI parent domain conversion
Date: Mon, 30 Jun 2025 08:51:15 +0200
Message-Id: <cover.1751266049.git.namcao@linutronix.de>
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
 arch/um/drivers/virt-pci.c | 45 +++++++++++++++++++-------------------
 2 files changed, 23 insertions(+), 23 deletions(-)

--=20
2.39.5

