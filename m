Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1A72609C4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025199; cv=none; b=iHbCrrU7y/QGuwmla2PPjzmZILrji6HKIQUDW9dUP3bc1lKa4eylMnWYhWY1e5xR7hofXpo8hlQllyiXKV1BKA2lSfNszkV8GhJJaPHpOK/UsE2njZtglCczADtFHij8tetNKrKo4a2fPATuGvyH/SeEI4PvT3bDlbyrVDFekn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025199; c=relaxed/simple;
	bh=zLd4bDp57dG7iX53UvVTk+jZNYyvqIkgpPTsb3J6Uo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkogf4k5KNq+g+a8Fh68d81Z4ykfoXYccZti1h6SdpAEhXExtEVXg9KIqHM6hBrpP212ZzqlbPfpFsEHgG4MVbqzQk9VG5y2dLocI04+7INzTa4Tg4loxAZ4roOLwyHfSbkFB/ZQoALA9SW0KBHcJAFQfy7MEbWvD3QOnqX4nn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DDAEP5An; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=raOVk9+r; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DDAEP5An";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="raOVk9+r"
Date: Wed, 30 Apr 2025 16:59:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746025195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zLd4bDp57dG7iX53UvVTk+jZNYyvqIkgpPTsb3J6Uo4=;
	b=DDAEP5Anjssm+BsLv2RIOsRRcacEBdL3FNd6BOW7T6tsdvAKjz5yCXS2uTSXpWHmBzbzCb
	0jyRxEmSkLu2B+ycXe9jAd8gKL37q57S2BgVGdZ4arJ0wWdGZ7FcDx1cMGvH3MQZ9nN8bg
	iMuX1NDgWgCSVasGNZV35Ufg08CoHo7VHoOR8xRNpLob73VnUwPxIgU3l/eO6hWXgA7I6v
	vXOXsvHv1P9DxbsHzr3L9+DFzVmX0thQMU1btUaN+11h39RePdv9ltDzQza7vPZ4ahNkZ4
	9KBDi3JJCsxICxX+53eFhXIy36VcsaC/9ot3KkMbB1YOCUJ9oE47tsnokbVHSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746025195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zLd4bDp57dG7iX53UvVTk+jZNYyvqIkgpPTsb3J6Uo4=;
	b=raOVk9+r369qzYKZXXhuUSRVfZOL4FuBpuhQfiPX4+Biz1LqfjFkHYFS8qqPvXYfDoBLIL
	ntGVLWmUQOJig2CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Leonardo Bras <leobras@redhat.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] local_lock: Minor improvements of
 local_trylock*() documentation
Message-ID: <20250430145954.hsnIXmYO@linutronix.de>
References: <20250430073610.163846-1-leobras@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430073610.163846-1-leobras@redhat.com>

On 2025-04-30 04:36:10 [-0300], Leonardo Bras wrote:
> Fix local_trylock_init() documentation, as it was mentioning the non-try
> helper instead, and use the opportunity to make clear the try_lock*() needs
> to receive a try-enabled variable as parameter.

Maybe replaced "try-enabled lock" with "local_trylock_t". "Try enabled
lock" as mentioned in the documentation or "try-enabled variable" as here
in the description does not really fit.

> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Sebastian
