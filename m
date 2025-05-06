Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3E82F15C6;
	Tue,  6 May 2025 01:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746496188; cv=none; b=CUWiruFhGOca9LpgueTiTIGDTIC3wS6O+gT7gH8lZfJRGOFjr4MggW/UEkG7Q0kSbj/oPmHMdW71jpz1IWT+meYMigcBDDoOQ6iqrf1kn2c/gwYzgkY3iVTu/J2GYLvuS7adRZSA/NYxDl6Zu/sPW9/R3r/PwoIXNkUZ0x7EBxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746496188; c=relaxed/simple;
	bh=t3xhsc8cHlLfdU3Sihp5X0hn3szSOG3sA+OfTUgaocE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sS7DbVDd2X+G4CmRUum+lkmHcOj7Ww8eeu41pIpEmcWjbrb2xfiGzLanwijKJeypzCY8XJIeotIei7CXZ92bzuZn2RoPE3CAajW7ZQCJBpj4ITOgD7mcKY3yQAqU8zZNcySWVMhb1ecTEaaSviQHo+QZuBVq3mM+ZFNporx0qrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oILyJBcK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oILyJBcK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3714C4CEE4;
	Tue,  6 May 2025 01:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746496186;
	bh=t3xhsc8cHlLfdU3Sihp5X0hn3szSOG3sA+OfTUgaocE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oILyJBcKTZFM3+EQT9Hsp0+r7OuHCdRp1PheWXVcR/mwn0OLY1LyD2CtA+WhvP+c+
	 xu/1pxQti2uuuBiCQWUWlo6yMCBZze60Ts9hVNJEFk5OengC0ANFKX6ZwhfCw0ILsr
	 tmgdHjkyQPAVKj/A0j0TCoUkYZrckvGVz9m9nBIek9x0i0RNV6RfI5y09gWZz+HERU
	 cNZ9ruF86fGWyEiuLhuiLkzd4yhjFXRwb3CBoY4bKbouHdqOlQ0mllfBA0Extto09Q
	 5S6Ec2pFT9hI0b3u/9nl89pJwCnI+ZpwlfBSzvPo3VYj9fbDizteMfvcYD5o7oDWoX
	 nyWYpv7ys+WPQ==
Date: Mon, 5 May 2025 18:49:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Moon Yeounsu <yyyynoom@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: dlink: add synchronization for stats
 update
Message-ID: <20250505184945.5adcac55@kernel.org>
In-Reply-To: <CAAjsZQwymBUvn67+jWJ1WRG2iJHyQFLwWEh8+3O_ryfX31mesw@mail.gmail.com>
References: <20250425231352.102535-2-yyyynoom@gmail.com>
	<20250429143503.5a44a94f@kernel.org>
	<CAAjsZQwymBUvn67+jWJ1WRG2iJHyQFLwWEh8+3O_ryfX31mesw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 3 May 2025 08:50:49 +0900 Moon Yeounsu wrote:
> Also, I believe that `spin_lock_irq()` in `get_stats()` should be
> changed to `spin_lock_irqsave()` since `get_stats()` can be called
> from IRQ context (via `rio_interrupt()` -> `rio_error()` ->
> `get_stats()`).  In my view, calling `spin_unlock_irq()` in this
> context could be risky, as it would re-enable local IRQs via
> local_irq_enable().
> 
> There are two ways to lock the `get_stats()` function: either add a
> new parameter to check whether it's in IRQ context, or simply use
> `spin_lock_irqsave()`. I found that `rio_free_tx()` behaves like the
> first case. I'd appreciate your opinion on which approach would be
> preferable here.

If there's a call path from the IRQ I'd go with spin_lock_irqsave()
