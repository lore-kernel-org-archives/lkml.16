Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB4C27A10F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909702; cv=none; b=kaEi7ahATAMKH3RXf9BpkAw553kCHtQQtiad6bfR/7ozrh8PzqLJwbFiLFqGhrmIx3Jfkmf8maKKbBBmTItnuU44ReJ9uGmL+jjoyjmfpT8HisQvZAVBOIp0c2LVzyldtAH6IoqD/SiPDQNbnJyNTC3uCj5IU5g/P4xrl9uoRVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909702; c=relaxed/simple;
	bh=Efc28UI0TELlOA0c5EdrNjTiDCYUoXeOH5VEJZfc9a4=;
	h=Message-ID:From:To:Cc:Subject:Date; b=nfhfdvAKCKr2GXYlfD1xbpWX89tDT8+u2/jym4rSy2fxnHxQAQqdiRDVpOD6olADXdtvYCpK/Z9SM/Dv+ADWOjLNU5ZVE+UdFuba0WYAl2egY+gebOh+wPZhM+iDH3+OhNSgK4xiBN9V65WXTOSE1z8SXoCqOFiyzGhgnxNbkcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tIxprtYt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=23EC4lUj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tIxprtYt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="23EC4lUj"
Message-ID: <20250429065337.117370076@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=DDY5kh4BbgYkVfb6FnZEI2S/u32O42fJeAeFc9IoR20=;
	b=tIxprtYts19Evdxacecf3yreuiavEjqgDfXXK61831h5AvcF3v/tn4vsHp89aoAL4G9o7T
	r7LiqfnmpbZA3ZM0WfRvtexK0JRFWOrVDk0DgEHO6AaeWS6J7UnOEFfYV25cm+c3i2HgIv
	/XT2ORSys40bDARY8+Qhy/tsiiEgdn8pMetdEFvu0kMOSYZRFwhLmg5KWg5iCKdglVF4Uk
	gIPw9axQxjGqxkOwTsBU1jmn9HWlXgLBpFRR4iKEUaWtXtctVfyyvUEUy/3YWPcpXqB1aK
	RyGHGgAlMcMqzGnLQrvYiObFs4jInrhifJSj2MWeDiZPiBj4hgNxqS0Rv82J4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=DDY5kh4BbgYkVfb6FnZEI2S/u32O42fJeAeFc9IoR20=;
	b=23EC4lUjO+WTk9iFo3Qii8F9yb0++VsL/UlWQ+zP6/cqdBc8oBiKMqAfyZFuOd4HiNX08A
	3Fho6QgZWb3p7GDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 00/45] genirq: Cleanups and conversion to lock guards
Date: Tue, 29 Apr 2025 08:54:47 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

This is V2 of the generic interrupt locking overhaul. V1 can be found here:

   https://lore.kernel.org/all/20250313154615.860723120@linutronix.de

The generic interrupt core code has accumulated quite some inconsistencies
over time and a common pattern in various API functions is:

    unsigned long flags;
    struct irq_desc *desc = irq_get_desc_[bus]lock(irq, &flags, mode);

    if (!desc)
       return -EINVAL;
    ....
    irq_put_desc_[bus]unlock(desc, flags);

That's awkward and requires gotos in failure paths.

This series provides conditional lock guards and converts the core code
over to use those guards. Along with that it converts the other open coded
lock/unlock pairs and fixes up coding and kernel doc formatting.  The
conversions were partially done with Coccinelle where possible.

Changes vs. V1:

  - Rebase on latest tip irq/core

  - Make coding style consistent (Jiri, Shrikanth)

The series applies on

    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core

and is also available from git:

    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core

Thanks,

	tglx

---
 include/linux/irq.h     |    2 
 kernel/irq/autoprobe.c  |   26 -
 kernel/irq/chip.c       |  609 ++++++++++---------------
 kernel/irq/cpuhotplug.c |   10 
 kernel/irq/debugfs.c    |    3 
 kernel/irq/internals.h  |   47 -
 kernel/irq/irqdesc.c    |  127 +----
 kernel/irq/manage.c     | 1154 ++++++++++++++++++++----------------------------
 kernel/irq/pm.c         |   38 -
 kernel/irq/proc.c       |   65 --
 kernel/irq/resend.c     |   50 --
 kernel/irq/spurious.c   |  104 +---
 12 files changed, 913 insertions(+), 1322 deletions(-)


