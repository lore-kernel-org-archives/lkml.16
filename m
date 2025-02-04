Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78B52185B4
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738694342; cv=none; b=fG3Gf9I592hsjQNMI71H3i4yyrWc6Yvbm/gf3c+E1+tUi+bbuSvCUUIFTsOClvUNUYBrXSHWpYZtKpflsjser8VcRzlhiFM+jYirMZcSrbJr6KkXiATgPIaolE5oxrWrNhwYcSakyUeTOgg48kzjvEE6PjM9P3yxTYfk3qFBC1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738694342; c=relaxed/simple;
	bh=fRKoloywdrlX37UedTK6iRXUg3PH8h1dwsVEMA109bM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P3cP/vbMc+oHx5Xjf3UelBr38fCtZQ5kxtg3pDV51pSq5bgTj/IW0U1TjKluniu1lrNZ/2iZUGrtP0uNKsJjkOjHKAKfb1ifWcbwnyOCyRG0NUFB/9jqvdxIgoiJkuL5Io3xs7fOcGnbCOW0Uih+113F2fstK4M0d9cKog2WoRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=BfN72n9F; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="BfN72n9F"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14F33442CE;
	Tue,  4 Feb 2025 18:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1738694331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q85mX/Q0tg64+3YHYIAVBqkedCOn5BOV3jbFgpg8UiU=;
	b=BfN72n9FrIdMwcJRt9RYSLrlFfb0AR+79nN9pL+gOB7ZUy4p7ACOoXOutQCt4N52qPqMo3
	VrOBKvJ0S2kiOLzu3WALoviE8McaUFh5RegW+BOys2OObHp38U4JsIh2yGYolP8vU8MXvm
	4la42FiKAJMcRzIIoqeIql9neYRWRt1hQwfiDa5kPlsWboZdiO8DRo4iVI5dwwA9MxFPTU
	Q+WyUh+z+sbbO1kfmrUJ7LjEx6PCAX73SAC5lsU9CWh8VvlYYYtR1Kha9jHpxANVkqmUlJ
	a/XrZxZbqeq+rLGg4ZxP/d0BVhmkm7TBiy5v9DG6rCp1dZ6A17ZMnXi79SCcmw==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Tue, 04 Feb 2025 19:38:46 +0100
Subject: [PATCH] m68k: coldfire: Prevent spurious interrupts when masking
 IMR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-coldfire-spurious-irq-v1-1-b8f28855f690@yoseli.org>
X-B4-Tracking: v=1; b=H4sIALVeomcC/x3MSwqAMAwA0atI1gZq8VO9irgQm2pArCYognh3i
 8u3mHlASZgUuuwBoYuV45ZQ5BlMy7jNhOyTwRpbGWtKnOLqAwuh7qdwPBVZDmwb78YyOKq9g9T
 uQoHv/9sP7/sB14GLl2cAAAA=
X-Change-ID: 20250204-coldfire-spurious-irq-97d8a4f8e6d8
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738694330; l=2753;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=fRKoloywdrlX37UedTK6iRXUg3PH8h1dwsVEMA109bM=;
 b=Zn4j2dHTQbSdtvxgQIG+9jC+OCWbq3zp5GNLPiapbcJdp2vCK8PB8uuQ2wYnRZMmhz5t/DSLD
 aPk4Rg4ORGxBda2RHkJSVwhwtYgYQYaaM5F9vfNkbVyDCCNIQ74hA+Q
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepgfdvhffhgeefkeetffduheelgfeuleeuueegffetleeliefhgeeulefhfeevtedtnecukfhppedvrgdtudemvgdtrgemudeileemjedugedtmeelvgeisgemfhhfmehfvgehleemheelfegtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeduieelmeejudegtdemlegviegsmehffhemfhgvheelmeehleeftgdphhgvlhhopeihohhsvghlihdqhihotghtohdrhihoshgvlhhirdhorhhgpdhmrghilhhfrhhomhepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehjvggrn
 hhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvghrgheslhhinhhugidqmheikehkrdhorhhg
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

The ColdFire interrupt controller can generate spurious interrupts if an
interrupt source is masked in the IMR while the CPU interrupt priority
mask (SR[I]) is set lower than the interrupt level.

The reference manual states:

To avoid this situation for interrupts sources with levels 1-6, first
write a higher level interrupt mask to the status register, before
setting the mask in the IMR or the module’s interrupt mask register.
After the mask is set, return the interrupt mask in the status register
to its previous value.

It can be tested like this:
- Prepare a iperf3 server on the coldfire target (iperf3 -s -D)
- Start a high priority cyclictest:
    cyclictest --secaligned -m -p 99 -i 2500 -q
- Start iperf3 -c $COLDFIRE_IP -t 0

After a few seconds the dmesg may display:
[   84.784301] irq 24, desc: dbc502da, depth: 1, count: 0, unhandled: 0
[   84.784455] ->handle_irq():  0ba0aca3, handle_bad_irq+0x0/0x1e0
[   84.784610] ->irq_data.chip(): c6779d4f, 0x41652544
[   84.784719] ->action(): 00000000
[   84.784770] unexpected IRQ trap at vector 18

With this patch, I never saw it in a few hours testing.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 arch/m68k/coldfire/intc-simr.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/m68k/coldfire/intc-simr.c b/arch/m68k/coldfire/intc-simr.c
index f7c2c41b31564defe47b1edd63b9a51c27b2db8b..17aae7524c4e999083795a769219556f151eeeb3 100644
--- a/arch/m68k/coldfire/intc-simr.c
+++ b/arch/m68k/coldfire/intc-simr.c
@@ -58,6 +58,14 @@ static inline unsigned int irq2ebit(unsigned int irq)
 
 #endif
 
+static inline void intc_irq_setlevel(unsigned long level)
+{
+	asm volatile ("move.w %0,%%sr"
+		      : /* no outputs */
+		      : "d" (0x2000 | ((level) << 8))
+		      : "memory");
+}
+
 /*
  *	There maybe one, two or three interrupt control units, each has 64
  *	interrupts. If there is no second or third unit then MCFINTC1_* or
@@ -67,13 +75,17 @@ static inline unsigned int irq2ebit(unsigned int irq)
 static void intc_irq_mask(struct irq_data *d)
 {
 	unsigned int irq = d->irq - MCFINT_VECBASE;
+	unsigned long flags = arch_local_save_flags();
 
+	intc_irq_setlevel(7);
 	if (MCFINTC2_SIMR && (irq > 127))
 		__raw_writeb(irq - 128, MCFINTC2_SIMR);
 	else if (MCFINTC1_SIMR && (irq > 63))
 		__raw_writeb(irq - 64, MCFINTC1_SIMR);
 	else
 		__raw_writeb(irq, MCFINTC0_SIMR);
+
+	arch_local_irq_restore(flags);
 }
 
 static void intc_irq_unmask(struct irq_data *d)

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250204-coldfire-spurious-irq-97d8a4f8e6d8

Best regards,
-- 
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

