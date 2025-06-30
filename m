Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD71190072
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266983; cv=none; b=ItJW5sKqLIUHRPTARU4p13jS1eSzhsdBUiOqu//VhA/T9aG4KxBgfK1bi2FnqRTUw3Vc5uP24+ElZaWiAcyJ+SILd2NZEULraa3XSohWU+iBVZkm6qAEwmvkRjExs3mA4JFqIhx7KF46JuyDz1oyU4AmIYdFTVW/3U4wyzGMK0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266983; c=relaxed/simple;
	bh=1k3CeGvWX/0br1iJVUORj5eMhsU0uC5ROWG7mJy4CwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uW8/Xdggr67W0kvBiyo+gfjOsEm0qr11oa0DcJQ+Z5T/PhjHAZVasGubl8cF08DRH/kwt429z04MHSWyJh9eh2/ujz7AQlmLdqgu4HA5f0O3qMRKX7Alm6h9pVwiljzAP409Sp96HyBz3iFXtTJ4ygJwtUtLlzp19cJShqSgV5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3+2dPfQ7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PdPHjBFF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3+2dPfQ7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PdPHjBFF"
Date: Mon, 30 Jun 2025 09:02:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751266980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cv5jFCV6649v8T92JDjCzLnbRUBb+ZSyb2iskcXEgiI=;
	b=3+2dPfQ7tbpVGAI70PTpFpOcOtCR0ab0jP8TunCiqfKZKQm8ZSC58eqc/DLg3gVaZMFHzd
	nYJumLVbddzsAScfyENayXXLaVk21dmRf7RqYaTPWHVGAYrgpbK3Npf6OSESTxFwfBrlwu
	mgPPnf4Xf+syf0RmBS/wlh7eRAuqW9mKqjffuznPUFwpAqIbaMs8cQ1bgdztFKKNFPl1oT
	qsNQD1t6TI14jLkNRO1ZKNyH0K+h1v93HEbmDp4k28ef9qDXn7dfcSsmRXXGM8r2UrIDPs
	X2dwULQvs71mVE79ogv4fIYhij9leR3e/Rahc5gDexT1sgT4IA5hgj4MlqVcdA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751266980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cv5jFCV6649v8T92JDjCzLnbRUBb+ZSyb2iskcXEgiI=;
	b=PdPHjBFFCrcV0zbXN1MAY/71Yvygnof3oUdoz5iVHFpZVxgwj4QiBnOe5CJRxLJpis6qtL
	RWScS2G5qsNHZ5CA==
From: Nam Cao <namcao@linutronix.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] um: virt-pci: Switch to
 msi_create_parent_irq_domain()
Message-ID: <20250630070249.oVVkmFZg@linutronix.de>
References: <cover.1751266049.git.namcao@linutronix.de>
 <5f0bd8e877e7bfdfb1a7e99d6b126caf6a7eea48.1751266049.git.namcao@linutronix.de>
 <e64a4c40b0234fc265a74cb60633117dc6911518.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e64a4c40b0234fc265a74cb60633117dc6911518.camel@sipsolutions.net>

On Mon, Jun 30, 2025 at 08:55:54AM +0200, Johannes Berg wrote:
> On Mon, 2025-06-30 at 08:51 +0200, Nam Cao wrote:
> > Move away from the legacy MSI domain setup, switch to use
> > msi_create_parent_irq_domain().
> > 
> 
> Do you want this to go through the UML tree, or is it a dependency
> somewhere else? In the latter case, I suppose you can add

Please take it into the UML tree.

> Acked-by: Johannes Berg <johannes@sipsolutions.net>
> Tested-by: Johannes Berg <johannes@sipsolutions.net>

Thanks!
Nam
