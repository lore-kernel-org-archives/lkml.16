Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F2723717C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455432; cv=none; b=IDT4Gc55aSSwpDRjWHLza5/CJdo/EzDCEafkrTRS1Ui6bD0a9B1dPlO5u7Vh5GacZOozUwkmtVLYyCfTventb50yhb/wRMIcjyeVxK/I6WIv3LIfzigQWQnHiOldPNl2EN/pLHFi9BeZjCoASFGeQv6KDRHXq25JPzpcpLYngAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455432; c=relaxed/simple;
	bh=iSaK/kSAC75L/ftrY0q+3E/xQHUAU8Ylxq3MSesKkvM=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LvBN454lnXsNzz5b4E4WSXG9Dru08LSSawhdTxCxvujKJJkH6oiLXL6c73mA02MDRBKAzxRYEwqhIzcYH84B4m7NuxhNPJ7Gr71lXWRN8rf+VmGFbiluxGHZ2NgakDLmcGfFp7FJDYyBi5r8kbF9HlUGHWnnwwTS2D0Q+ExTiSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i2r94G+c; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f0snmXhE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i2r94G+c";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f0snmXhE"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750455428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HKPLejyOUInoi54ILYONFUCCPlhhwaiZaEI46ps7ZxI=;
	b=i2r94G+clPE6nH0YzelYZezlx5GUKE3tFtMYk6OvXgMQJkPelAk1Pgg7omP31ATZfXc039
	o9Xi+jXzJCLITKYRqmQ8/anTwV5MYTwZHd2OPU9dmjxR7UIIqrjoKNBBlZ5Lt+GZu3aQf+
	imgYd1u+PQ0j3OF8KruRgrC0r5sv2qgszVyRO71XYIuZ3btLsp+cSem/erurEZmROqtEUx
	zRpjtOEThsnlUOoLcyz4cpUV+yxCv3r0+8mC7i2GqZEHYQwnD0JDKxbKc1FuH+DD3/C++Y
	qoEVtDdPl9KjnYEqXld+j8uRapq4pnl6zKtdbUyODL37tYcKcmyuehYdLAX5+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750455428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HKPLejyOUInoi54ILYONFUCCPlhhwaiZaEI46ps7ZxI=;
	b=f0snmXhERwc/CSK5t8xWogI4gfaEI1ohSKDcXIXXU58uu20wmy7WM7v+pQtrHiQXDn+FBz
	Ps6qVD1rloFjbdBA==
To: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, "Yury
 Norov [NVIDIA]" <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, John Stultz <jstultz@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 0/3] bitmap: introduce find_random_bit() and use in
 clocksource
In-Reply-To: <20250619182626.393541-1-yury.norov@gmail.com>
References: <20250619182626.393541-1-yury.norov@gmail.com>
Date: Fri, 20 Jun 2025 23:37:07 +0200
Message-ID: <87frfup01o.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jun 19 2025 at 14:26, Yury Norov wrote:
> nodemasks implement node_random(), which may also be useful for other
> subsystems. Generalize the function, and propagate to cpumask API.
>
> v1: https://lore.kernel.org/all/20250604212125.25656-1-yury.norov@gmail.com/
> v2: https://lore.kernel.org/all/20250608194536.28130-1-yury.norov@gmail.com/
> v3: https://lore.kernel.org/all/20250617200854.60753-1-yury.norov@gmail.com/
> v4: return NUMA_NO_NODES instead of MAX_NUMNODES in node_random() (Andrew)
>
> Yury Norov [NVIDIA] (3):
>   bitmap: generalize node_random()
>   cpumask: introduce cpumask_random()
>   clocksource: Improve randomness in clocksource_verify_choose_cpus()

Assuming this goes through the bitmap tree, for the clocksource change:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
