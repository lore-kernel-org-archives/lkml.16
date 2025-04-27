Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329E623F405;
	Sun, 27 Apr 2025 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745741946; cv=none; b=H+c7uaAAKgoHK1zM2tt4g73HxrvIrQIyFtLso24NEm99k1s5SZ+oWFfacQMgYmjrSwE8SnjjxcKjY2u6HQc5ooOXbPjeqYdsgComem85MmcsCkgQmGXvgqBfuC8b8f4gsVAK27G5jGxAsoiX/mDKT1xEPtErsg6A/5aCKrBVu6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745741946; c=relaxed/simple;
	bh=Ijg8SeK53NZeNsOWw9D+jmGbqG48rxmkdalilXk4r8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyd5av/FB9bRSTnsMIEHj1NmdJdNghswsjiPB6d/mCclUT1OnoPCPRPVvTOKb7VysA962tx3gj8/xr3tGanULgMBgvWDPMGvvrHWt0d/EOJvs9WE/CYrdtHlRhDGZOy6arMPGDEVEGGicsh9GSqeQNApxe7RTqEDSTrPSZSiP6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u8xE4-0007QV-00; Sun, 27 Apr 2025 10:19:00 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E45F8C0A9A; Sun, 27 Apr 2025 10:16:49 +0200 (CEST)
Date: Sun, 27 Apr 2025 10:16:49 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH] MIPS: rename rollback_handler with skipover_handler
Message-ID: <aA3n8Z-NIff3n7Zw@alpha.franken.de>
References: <20250405143705.343960-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405143705.343960-1-marco.crivellari@suse.com>

On Sat, Apr 05, 2025 at 04:37:05PM +0200, Marco Crivellari wrote:
> Recently the rollback region has been changed into an
> idle interrupt region [1]. This patch make the appropriate
> changes renaming functions and macro, to reflact the change.
> 
> [1] https://lore.kernel.org/linux-mips/20250403161143.361461-2-marco.crivellari@suse.com/
> 
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  arch/mips/include/asm/idle.h |  2 +-
>  arch/mips/kernel/genex.S     | 10 +++++-----
>  arch/mips/kernel/traps.c     | 10 +++++-----
>  3 files changed, 11 insertions(+), 11 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
