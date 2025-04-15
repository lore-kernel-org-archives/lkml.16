Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BFC2820C3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714099; cv=none; b=LRN+vU+3k1Cdp/VVzODtRjx8opDvoRjFc1UzdIdcc2remVFQTmqPWexpXwq1Jh/+bCfCB6Q42WHicebbBnTrLBteBHim/QnS2YocSNGbSDzMw0AFWFy06xQbG64XGiktFZUzc+B4qjK3xSNjh/GUuR+P38r6Y0EbRlzkG6W9AUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714099; c=relaxed/simple;
	bh=3ilXhPmbEz4ZrAZSeC/9Y+xhdKwK/8ZkVS7tDoedNWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k3Bb/NXEg6jFoGDrZYxXPzqlGZ+8bcpVbxVRiyvdisaOINHtGEBSE+L3HapGPlLnmlnGN/mkrDxWiyHzgacuZmJGP9Sw/Vjgc6mtL9s3R8DcMEghNZ9Svd41xYgccUnjcCgOiX0G/fec61KpEeQaK33/zsHbdxAJ2TtbPiWwn8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oha9wvhF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oha9wvhF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA13C4CEE7;
	Tue, 15 Apr 2025 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744714099;
	bh=3ilXhPmbEz4ZrAZSeC/9Y+xhdKwK/8ZkVS7tDoedNWc=;
	h=From:To:Cc:Subject:Date:From;
	b=Oha9wvhFH9njyGwiXkBsZYEuTK80RSzoMjvA5V729/ojxTAvJpGb4WCFiXYgw7tJX
	 ioGmGqso/kYA8GDPriDAoa0peKU7nYVsZ+QGLWhEsCwjSTkfCmqEjvHfcu63bJtmlf
	 f6KmRY7Qpc5UwV3xO8AodhEiUOCoLK1SE3q+sJFkSxsP8l6x+9ooco6JO/8bt7B0AA
	 cF37X1VeZZw8BF5H2ZLA3fHOUwk1Jx0727xsIquBb+gwpzJANwhprG24hedHzWBI6Y
	 xP4zVMmiUOJNrK161J34jj+5OKGqqtt5MRTlIcLktUNiYDsIagaLT3ign/vETzhFzQ
	 U/hv1oXg0mNCQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: mingo@redhat.com
Cc: tglx@linutronix.de,
	maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] irqdomain: x86: Switch to of_fwnode_handle()
Date: Tue, 15 Apr 2025 12:48:15 +0200
Message-ID: <20250415104815.106920-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
defined of_fwnode_handle(). The former is in the process of being
removed, so use the latter instead.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
This is an indepent patch, please apply directly.

The patch was previously a part of a large series [1], but I would like
maintainers to feed the independent parts through their trees.

[1] https://lore.kernel.org/all/20250319092951.37667-1-jirislaby@kernel.org/
---
 arch/x86/kernel/apic/io_apic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index eebc360ed1bb..487992cb0836 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -2225,7 +2225,7 @@ static int mp_irqdomain_create(int ioapic)
 
 	/* Handle device tree enumerated APICs proper */
 	if (cfg->dev) {
-		fn = of_node_to_fwnode(cfg->dev);
+		fn = of_fwnode_handle(cfg->dev);
 	} else {
 		fn = irq_domain_alloc_named_id_fwnode("IO-APIC", mpc_ioapic_id(ioapic));
 		if (!fn)
-- 
2.49.0

