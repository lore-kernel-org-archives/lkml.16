Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B879279784
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359870; cv=none; b=ja7/IDnGgNTm0PvGWXSl9ivJ8BFzANa43dkD4kj3J9Zw0Tb/qFG9wlfw8L5F+H5seRcR0H87iLckqdFqzGKSm9bXXIuYmxIEwuUpLDFOF2jLYbSMVdynDauq8Qw3Ee1RQNBo9uHHSRqMlLXPsRiR3PEzpbWBJWQW/k5xsX1JKoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359870; c=relaxed/simple;
	bh=BAhJ8b07z0CL+zogYz9RgQpw/mCTKYttsWo1Db9J5i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nw7KEAErPNk6m9wZndueIOGh8SE/aIJrqb1wB0+bnReguu5FyEBgxH1zQgk7/lWPV1V/qz7rMeOA4hEWY9S91T8zS7+5ddpnCb1d3GXTX10T6d4iLXfii31UMpSwHWPVCtY6+UqoRZwSved2U13hhDsGStO0OciztZCtiMR5fSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=s/zomrM4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DFsga0Xi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s/zomrM4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DFsga0Xi"
Date: Tue, 27 May 2025 17:31:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748359867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mghd6ymj7AZHKQfj/EO9+xXkykC2InOaEHCIjdtP6Hk=;
	b=s/zomrM4LmvNvCE5plMSguD5TmcbApPgBn4OMLzTi0OqNnnU2vWKQhmRGJxhQACCUB1XL0
	Hau8NuRak+f18oNwqZpgap2iXnKDEn/Mi9KnttfKigy9uX4waOt8DH3TanuYX9LNPjbsGO
	35JiVugTbiJxXGfNFk56FYT7fN0dPrMf2eweKO/mp2wQKsp/7oseeBAxpwHyuGkLowRH+x
	Pv/goRkoarYEwIykNzuPSIY0xeELmWGWbh/UrlyPYci0wSmtY2o87i5H04c7AeTF0InZXf
	YIaCWz37vFtJiwMKoq2UMEOI1s1mIYG007vO/PFd9zE4kerhrbYXPWn4SZZDsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748359867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mghd6ymj7AZHKQfj/EO9+xXkykC2InOaEHCIjdtP6Hk=;
	b=DFsga0XiZDpjjjwrmUstv5jOJuUWsgmd8wTDGstEEDxAxcgBZFY5y1m5XDc/KaqJYtper6
	3eMosbusPABZSsBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: syzbot <syzbot+9afaf6749e3a7aa1bdf3@syzkaller.appspotmail.com>,
	andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org,
	linux-kernel@vger.kernel.org, mingo@redhat.com,
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Subject: Re: [syzbot] [kernel?] KASAN: wild-memory-access Read in
 get_futex_key
Message-ID: <20250527153106.WFmvR15N@linutronix.de>
References: <6835bfe3.a70a0220.253bc2.00b5.GAE@google.com>
 <20250527142217.GA7747@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250527142217.GA7747@noisy.programming.kicks-ass.net>

On 2025-05-27 16:22:17 [+0200], Peter Zijlstra wrote:
> >  get_futex_key+0x595/0x1540 kernel/futex/core.c:587
> 
> Does the this help?

it avoids boom but reject FUTEX_NO_NODE. What about

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 19a2c65f3d373..d0f5645eac61c 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -583,8 +583,9 @@ int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
 		if (futex_get_value(&node, naddr))
 			return -EFAULT;
 
-		if (node != FUTEX_NO_NODE &&
-		    (node >= MAX_NUMNODES || !node_possible(node)))
+		if ((node != FUTEX_NO_NODE) &&
+		    (node < 0 || node > nr_node_ids ||
+		     !node_possible(node)))
 			return -EINVAL;
 	}
 

Sebastian
