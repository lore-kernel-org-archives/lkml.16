Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD421A458
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014196; cv=none; b=GERwqpcpLPf+1aCzX7vUwRPRyzm7cT0fU8KrFFhQWtN6RKXjmZGiePhhpMmjjdsDi2a/bphMOamubpF4butNO18Xvwk2PMm1siQ02od1sirOvNy7huaiD8Nmc+fm3GQOCqiVFvNGuLBk/ZGdozbn0Ogp4rTqEUuV/JSHZiV0R30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014196; c=relaxed/simple;
	bh=7CCk0AZstRikK8RYTscBwk1xpqzyBKEqzcjZHKPbQj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5Yhjdt0rTenC9AqDjoVsfdechzHfVo3wtgNeaeB6BK100JSb+iJXDHePlRlh2BlyR2y7S0oddENIgx3eLuQMTGBDWrspgBs+RxtfCC5F+6DqyDmvLKkek3bt2G7w/QnkuET2O8A52AsOLtZ0N5LY9ZvO81FV7QzU075/qHaeuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NGXN/xbm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DAlzIDfn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NGXN/xbm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DAlzIDfn"
Date: Fri, 27 Jun 2025 10:49:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751014188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7N/fRingZ0nASgb9h3OMYxTeVtNaki5J/VzCocS1PI=;
	b=NGXN/xbm2bgHmL3wkRzDn+imuZsQlZtVyxnNlr0WK8Q/7WGHOCX31dp7jplzYqn1WZuhcW
	vUrXgtR4xwvBXNwOPP24vtGSnBBy3QwblBcguGCKbl5gZizLbktpP+SjcDzf4WEtgKnn86
	jYBIS2iT/w3IkHmf/I0abKzMszwAreiMTQIVE+th7yoDW6dTwpJEYGcgFINOHg1u+ZSvgs
	oDY0t0WEhkK8lpGdbnp4wGPBSfABNcBBt+5DjZG/+iD0ajr5Emqk0WkLncyPZ8PvNpD+ni
	0ujH/O5ZyWdTSeP/HPhDSMEIG+6+gr9SIKV9zCvHBArJ+rM/iSIXq6NyJgkFMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751014188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7N/fRingZ0nASgb9h3OMYxTeVtNaki5J/VzCocS1PI=;
	b=DAlzIDfnOVEXQ5IrxilGNN+9PrzqbKnb95yvYKHXhneFlYqFEc8775sJf9IJmBp5MQPMIq
	ydptbHXp58yJ+ECA==
From: Nam Cao <namcao@linutronix.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] um: virt-pci: Switch to
 msi_create_parent_irq_domain()
Message-ID: <20250627084943.nCYOI4Vp@linutronix.de>
References: <cover.1750947651.git.namcao@linutronix.de>
 <b911c2f15c031354850eee277a773832890c3c17.1750947651.git.namcao@linutronix.de>
 <45f44f0298259abf1862b965805307b7c01a279d.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45f44f0298259abf1862b965805307b7c01a279d.camel@sipsolutions.net>

On Fri, Jun 27, 2025 at 10:24:38AM +0200, Johannes Berg wrote:
> On Thu, 2025-06-26 at 16:47 +0200, Nam Cao wrote:
> > Move away from the legacy MSI domain setup, switch to use
> > msi_create_parent_irq_domain().
> 
> I applied this on 6.16-rc1 (plus a handful of local patches), and got a
> lockdep warning and kernel crash with this change:

Thanks for testing! The later kernel crash should be fixed with:

diff --git a/arch/um/drivers/virt-pci.c b/arch/um/drivers/virt-pci.c
index e51a9357934da..557d93aea00a1 100644
--- a/arch/um/drivers/virt-pci.c
+++ b/arch/um/drivers/virt-pci.c
@@ -407,7 +407,6 @@ static const struct irq_domain_ops um_pci_inner_domain_ops = {
 
 #define UM_PCI_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS		| \
 				   MSI_FLAG_USE_DEF_CHIP_OPS		| \
-				   MSI_FLAG_PCI_MSI_MASK_PARENT		| \
 				   MSI_FLAG_NO_AFFINITY)
 #define UM_PCI_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK		| \
 				    MSI_FLAG_PCI_MSIX)


I have no immediate idea about the lockdep warn, I don't see how the
MSI_FLAG_PCI_MSI_MASK_PARENT flag can be related to that. Probably there's
another problem, let me stare at it..

Nam
