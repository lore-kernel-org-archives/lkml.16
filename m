Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581C91F4727
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 07:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749367698; cv=none; b=jlegZEpHrurTvzzcLfrS3tuZAA7B0x8A7wJSfT+ulsFEiunBWTZcwhLpJVoZczLBfaWZ8nZOSRnjdqKHhm3qsmv41120JocfET2ueaG347wJR44dMY28nJjS/sUpqtk+na2VvxKgc8YgI1ara3neBEzbw3lPvwL7R2ONfxE7YFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749367698; c=relaxed/simple;
	bh=x+1vfGbKa2lpFBVW1I2jJOrZdN99aM7xfLzzYF11YZ4=;
	h=From:To:Cc:Subject:References:Message-ID:Content-Type:
	 MIME-Version:Date; b=Tz+0VI34/wUjlVDSdNBwaasLAYhnqiwdzWc+K3NDZRdkx39OhV07qlW8yskBfQLiou29aFZ0v1FEdCOWSBgMwEAqosOcn/elzIDkaFqfWaNSpHHjTIwYi4BEN0NY7rEtXAqvb05Y/jQEC81AbYqElQ0Csd0Nuvi7CvAS3//xk6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sOuj95Ms; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sLR9aVEn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sOuj95Ms";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sLR9aVEn"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749367695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=j8A/TXe87nEFj8Q4UeioFaWVNgQiGOWeay1Bz9ZENdM=;
	b=sOuj95MsvDOhznHoTz12Q323u164hQJcnxoFh5pYv7yKnYmXdp+nHOB5oip8la1I844neP
	0vSuAi+9bP34fvOnUEOOTLpoUOWcOeem3ml0I27fbNUpoM7X0SEjExGicJqI+H/4KbBW25
	MzZhPjV22fZu2tCLZ4OXgfoHGbpIZJJR1Xw7VDLCfRd0MngxoLdFA30Cmc8cQ2oNO1QahB
	8HovU1VMPZSM6WwiW7laQXQPMhonMr8lswMk6gsY6f5uLEiluFeruY8WvjT0j5vHw4G5+W
	3I3UQ0khQ7jA1+5qS6MjU0er5Wt6aZb5qBp+Pnrj4yo+eKFTkQVhuJoMMisM8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749367695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=j8A/TXe87nEFj8Q4UeioFaWVNgQiGOWeay1Bz9ZENdM=;
	b=sLR9aVEnKoqdwkhhq3ONaDYHOpyKndngqfwTHB/lNdPLSvOnqTWeA/t9ykKU+PTGVTof0u
	MCNgwjK/RdSZPSBA==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] timers/urgent for v6.16-rc1
References: <174936764731.749406.17114868218275391074.tglx@xen13>
Message-ID: <174936765291.749406.6511905103929149348.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun,  8 Jun 2025 09:28:14 +0200 (CEST)

Linus,

please pull the latest timers/urgent branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-20=
25-06-08

up to:  434d7f9b0e24: timens: Add struct seq_file forward declaration


Add the missing seq_file forward declaration in the timer namespace header.


Thanks,

	tglx

------------------>
Herbert Xu (1):
      timens: Add struct seq_file forward declaration


 include/linux/time_namespace.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/time_namespace.h b/include/linux/time_namespace.h
index 0b8b32bf0655..bb2c52f4fc94 100644
--- a/include/linux/time_namespace.h
+++ b/include/linux/time_namespace.h
@@ -12,6 +12,7 @@
 struct user_namespace;
 extern struct user_namespace init_user_ns;
=20
+struct seq_file;
 struct vm_area_struct;
=20
 struct timens_offsets {

