Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD211DE2C9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018013; cv=none; b=oWfOJX7Nws1TATLgY22QbQTslJq66T1+68RJq52Hi+OUB7D1skGoHgGSMy+GPPvhkYuMVGUceEbtjOzvckkpNVraDJ1oEcJcn/PO4ZLoY9gl1unZ5uSemZTRjkB4KcKaT7kMGIcFpaBRT4wI848NbD7/Dhxx0Xth7wurQhM+i2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018013; c=relaxed/simple;
	bh=kmRQkEN2KNCvcisa7bUIX6+rp+G2mwUuwtT+WIoz/7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbQxBvDYd/ajJadlNqV4JnEyPlL1xY5wUVfLgJ3aPrr7UL4OCva65bcEtHiu2h44XBr2/ZAgdAYWvlwarN+D6K5uQnfOc7IPwDvhgIu9LEwIbVUDEEZWbIUfkEE55vy1/WWxY5WG2TcZKHwNQXx0v2CXyi/xRsHmGNaHuKVD884=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k2iADpdv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L9WITtaa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k2iADpdv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L9WITtaa"
Date: Fri, 27 Jun 2025 11:53:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751018010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y9vhrsp7QZvTqYOj7ek2BlquX7altZRuzwvy5tsKFHE=;
	b=k2iADpdvrNuJCjXW1lpo4dsA7Opqr7yQ5DO0tTz/zTCDj9UqBrAMwp1OR35WLItIHKLp4S
	nJH8hw5PiWQgpRqzuC5K6G7k8wEJ5GAhCrojtwwMbiAvMXqEiAhqKoW2TiXbyQb8OpYQE0
	73oh0jTNBks9kVXJtgYHY14TdNYiZx7vFefanmvJrDv/pTM/ayYIAZoZNxxlTTW6gI1+Qv
	epr6XQ7KEh1PYaDKCzWuE5HoZPWRV+tx3veil77Wgs4cnTcNMU6KRGeClvANwmHCCB2twH
	53v4yFRh7vlilzAK4cYTEXTL+MXhLGbUfRTkx4D02KGmUz/pg5FdXyQ8VsGtiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751018010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y9vhrsp7QZvTqYOj7ek2BlquX7altZRuzwvy5tsKFHE=;
	b=L9WITtaakBJQMLHa8mH/q+Ou4J2hqnEjRagwucfnjjTG16tO/c8US9UlAUe2TzfS/rvM0w
	kXbeqk3jtRNVI5BQ==
From: Nam Cao <namcao@linutronix.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] um: virt-pci: Switch to
 msi_create_parent_irq_domain()
Message-ID: <20250627095328.ce5O9YWf@linutronix.de>
References: <cover.1750947651.git.namcao@linutronix.de>
 <b911c2f15c031354850eee277a773832890c3c17.1750947651.git.namcao@linutronix.de>
 <45f44f0298259abf1862b965805307b7c01a279d.camel@sipsolutions.net>
 <20250627084943.nCYOI4Vp@linutronix.de>
 <94de787f4c3ad6fc3a44c50c2a5d5311861ddd6c.camel@sipsolutions.net>
 <20250627094901.bkxjYmHj@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627094901.bkxjYmHj@linutronix.de>

On Fri, Jun 27, 2025 at 11:49:03AM +0200, Nam Cao wrote:
> My understanding of UM is limited, but I think I get it. We dereference a
> NULL pointer and get SIGSEGV. We go into that code path and lockdep yells.
> 
> With the NULL pointer deref removed, we won't go into that path, so it
> should be good.

By "that code path" I mean SIGSEGV handler.

Nam
