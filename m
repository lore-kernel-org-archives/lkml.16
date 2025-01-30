Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA96186294
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 07:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738221874; cv=none; b=TPWGCni7iYSUGO1KAwGLD6b3dT5SbE03uvBxg9aZejLA+L5mhSASGG3E8t8bRFp887zHxYpaJquTcAXSpe1suCIcNzglbaJH3iALlGZoZUagxf8R+pyG0Odho5gxAM8pSMltxOb8kfkktZJsDuGxJgIicB3Vfa+GqnEluc4rl+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738221874; c=relaxed/simple;
	bh=EPRi1PZ01B954G23dxbaIvbyjxv6VV7OvewloRYel8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDYodXK30ZzDB5eEkRLpY9kx8a3guDvY/Cxr+OO7JS2orjrUzkSEo6rLoCR8jqECYmty7rx1BGeDdgskbD3aSOBP1IfUN0caUBdOJhdtuFQmclXAPzb9zVI3swpa255t43ZUEuW/5ofnZO6GwDg0ld3BYcfvwmxPsaufOKjRPSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X0Bj1ocB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dIYv1HUH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X0Bj1ocB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dIYv1HUH"
Date: Thu, 30 Jan 2025 08:24:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738221870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pMDIP5Gw6qFAZGvmnilj/v5Bwf6V8vvxq9BnwnjWizA=;
	b=X0Bj1ocBsnOEPhk3r20oo3qJXpp/9aOIyHuSSVmbtYrNkbkh+MmnBUj5wQ6FyDJMOHyX7L
	pKi7O4Kb+czTLeb0Fu3IgNoKEjvGRYvcqok/3zxB0gcEOXve3MmPeG2tsOgm3+EXPk3MQ9
	19EnNF99ix5Inmy1wyclzJ5P4PFZlhIZN5HOB0RC4f7ICAeh/W53YOycSVIPJ4EPoMMRqH
	ADCdDqS5rH85/S2VrozUFnekqI3MVMNcwVnHDyNTYLy/tP4R6vgK9Z8l9gri+f6kW8Oiof
	lcmiQfaNPA0tWFTsFKr56Xox9K+Uptsh/dlkZnfNjJpMCu8Ga2ZkCO9vBQc7oA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738221870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pMDIP5Gw6qFAZGvmnilj/v5Bwf6V8vvxq9BnwnjWizA=;
	b=dIYv1HUHf5IVw/vFekseaKR4+CK1wjsMyYkOeMg7OZ9Moo6QF8it5RKIPbkVrb0M8PNG74
	YQ5AXUAIQYc4DmCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Waiman Long <longman@redhat.com>
Cc: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>, Feng Tang <feng.tang@intel.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 1/2] clocksource: Use pr_info() for "Checking
 clocksource synchronization" message
Message-ID: <20250130072428.tDDW2DKs@linutronix.de>
References: <20250129224001.430506-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250129224001.430506-1-longman@redhat.com>

On 2025-01-29 17:40:00 [-0500], Waiman Long wrote:
> The "Checking clocksource synchronization" message is normally printed
> when clocksource_verify_percpu() is called for a given clocksource if
> both the CLOCK_SOURCE_UNSTABLE and CLOCK_SOURCE_VERIFY_PERCPU flags
> are set. It is an informational message and so pr_info() should be used
> instead of pr_warn().
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> Acked-by: John Stultz <jstultz@google.com>
> Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
