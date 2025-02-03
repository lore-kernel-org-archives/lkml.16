Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB16984A3E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586789; cv=none; b=VHQzNma2wRgPjKnQJDMO9qXPzEfGPUKm9nEKH9oeYYjSK7D/88vcgsojqV3onMDPQOl6qCvMdn0284mT19cFVoDLBEg6ZVGyMxtVSnktu+Cg4GW7zH9cR3twZB39sahXq3bE2GTN/VihkqdhecLKNLw8tvm/Og5LzxWD7WHGkPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586789; c=relaxed/simple;
	bh=0KrHFodUjLevlVu6Rkl2eZ5Wpg/PlueyiJGALxz8CoM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUyRIrUjMx9GDnzz7yKGly/8aqWAX3k3hgola7OsXrLssHYlL4jTolDK3CpR1F5PkZqg1bdIosTdvlvqJkGRyFnrI837LUqVLr386EoQoNTSUVRSEjJJoeeLL3VPKv1i3blPad/S414BaZuRWgvjdGoOdz1U6MOBgHoMBJa6XSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from localhost (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 9F1832003D3;
	Mon,  3 Feb 2025 13:46:22 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id 68FA640042; Mon, 03 Feb 2025 13:44:05 +0100 (CET)
Date: Mon, 3 Feb 2025 13:44:05 +0100
From: Etienne Buira <etienne.buira@free.fr>
To: daniel.lezcano@linaro.org, tglx@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: Re: Kconfig condition on BCM2835_TIMER (and others)
Message-ID: <Z6C6FQxsyX_D4jhY@Z926fQmE5jqhFMgp6>
Mail-Followup-To: daniel.lezcano@linaro.org, tglx@linutronix.de,
	linux-kernel@vger.kernel.org
References: <Z6C5BegftEGzwkN_@Z926fQmE5jqhFMgp6>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6C5BegftEGzwkN_@Z926fQmE5jqhFMgp6>

Resend with corrected email address.

On Mon, Feb 03, 2025 at 01:39:33PM +0100, Etienne Buira wrote:
> Hi all,
> 
> I want to build a kernel for Raspberry pi 4B, which, according to the
> dtb, has a bc2835-system-timer. This device is handled by
> drivers/clocksource/bcm2835_timer.c, which is built depending on
> CONFIG_BCM2835_TIMER.
> 
> However, the config option is guarded by "if COMPILE_TEST" condition.
> 
> Shouldn't that condition be ARM64 || COMPILE_TEST (ie be selectable on
> arm64 builds)?
> 
> Regards.
> 
