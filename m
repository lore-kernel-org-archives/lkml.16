Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269442D97A5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022302; cv=none; b=WAA/mL5w5/udwM7wlGMofE8baNGW7FMt19+NZIagAbZhskLvmD3S8es9nGtU+a8A6PhfYktkZp3E4hsHA4r+hOO2s02HsI/1DyLo0xfy+VDzdOVCFGw9RytNgk0zdGEBKbewYLI74KiweWi8m9xNZSh/O2KsJIJ1g3ylhBgp++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022302; c=relaxed/simple;
	bh=53SUZkKkjxscIAqlkQITcQ1KZr4z6o4imOL4pAKn8R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdoJoVrEDfhz0GH5fxo6sl/DAVXbu50jOhb6FCwhH4bqIP7g894UoEqr+A5h5kAVFKQLt2RIvN+zqj52+kSJ/nn9Pp7CNeX6hJ+gXnhIpYqMNwe9BNOkLB2G3ciGel/WpGEYlcKMAjl018H8wYjFyyNpy99+3lejnx+KEJyTve4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hMcgpgz8; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hMcgpgz8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=owxRs8KmguaiUoSu/NbuS4i+zoSOnNsktkyd1wxEyDI=; b=hMcgpgz82uy42WSk4TbgQlNl/P
	g/Vjmu5YcIgozIdljJjX/go0h+PL1TPLA5lGApYXSDoYStRzm5r+Z34AbyU/TAxPRNwUT9kgeWPpw
	Pg1vP3KHT6LkZgEWbCB33CfQ+mgB/yir8YYKds7gFGVPODeyJPE5WrI0NvgGrQhsC3Nw6l8IOPaCC
	QJpEzHO8GCD6bJ0UmkvKe1DV1arUFA/f71F05wPgyyPSxAUhvyKCqPH/D0NO7M7MM0QpsPVNfkG6v
	U38x6GdR4pnxkinBaZFfchdWvnFF2w0Y9olxyeJaWDJ7ghAWy1T2B/kM03SZAH9QrGzikb9hpcRJK
	ccQEqj2Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6t8-00000006JkQ-2qCO;
	Fri, 27 Jun 2025 11:04:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 00FEC30023C; Fri, 27 Jun 2025 13:04:57 +0200 (CEST)
Date: Fri, 27 Jun 2025 13:04:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
Message-ID: <20250627110457.GA1613200@noisy.programming.kicks-ass.net>
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
 <20250606070638.2Wk45AMk@linutronix.de>
 <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
 <71ea52f2-f6bf-4a55-84ba-d1442d13bc82@meta.com>
 <20250626131715.GI1613200@noisy.programming.kicks-ass.net>
 <20250626135034.18sab4Xp@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626135034.18sab4Xp@linutronix.de>

On Thu, Jun 26, 2025 at 03:50:34PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-06-26 15:17:15 [+0200], Peter Zijlstra wrote:
> > > I'd vote for defaulting to global for one more release.
> > 
> > Probably best to do that; means we don't have to rush crazy code :-)
> 
> If we do that, that means we need to ensure that the private hash is not
> deployed while a thread is created and the prctl() function can only
> work create the private hash if the application is single threaded.

I was thinking something like so..

---
diff --git a/init/Kconfig b/init/Kconfig
index af4c2f085455..666783eb50ab 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1716,9 +1716,13 @@ config FUTEX_PI
 	depends on FUTEX && RT_MUTEXES
 	default y
 
+#
+# marked broken for performance reasons; gives us one more cycle to sort things out.
+#
 config FUTEX_PRIVATE_HASH
 	bool
 	depends on FUTEX && !BASE_SMALL && MMU
+	depends on BROKEN
 	default y
 
 config FUTEX_MPOL
