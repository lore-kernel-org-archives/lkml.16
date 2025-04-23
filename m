Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF71010F9;
	Wed, 23 Apr 2025 05:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745386811; cv=none; b=VdIwRLyHOdKUP/PFBpqUYIjCfTi64bAbYv2Qv8PaEg3lIgFKQ5R4CJvL8EhO/x3aLpZzFVX07zOTsIgJkd4B4D7bAHO3X8pqVJXfSu10UELTTSgkwMAM1Va/y85o1pCsz0jHgQw4PHnx4JG7UVj5vp8Kf6rh5PGEfzmzbmIMM9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745386811; c=relaxed/simple;
	bh=T7NB6tRmyh0A2BPoT3iuyb4GSvwnPFYmEfFgZFbQuds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dj+27tawKVm8aReITlcD1wHTEmbyBPI7b1Dz6OpvzPSV9B2By7sP0H9OGHo1RBKp67AtQdQLTsYUOK7QIIpwZfR1NmMx/Ds76SlWgqNYJs+xWAkSWJuwJBKMqX0tdm53kCMJRFS/Ug4lnICGpIllE0NCXfKFPuyxgUUDddKIyx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 272BA67373; Wed, 23 Apr 2025 07:40:02 +0200 (CEST)
Date: Wed, 23 Apr 2025 07:40:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: syzbot <syzbot+f719dec20853d1563edc@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, arnd@arndb.de, hch@lst.de,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com,
	thuth@redhat.com, willy@infradead.org
Subject: Re: [syzbot] [fs?] [mm?] INFO: task hung in page_cache_ra_order
Message-ID: <20250423054001.GA23015@lst.de>
References: <6807eb4a.050a0220.36a438.0000.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6807eb4a.050a0220.36a438.0000.GAE@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Apr 22, 2025 at 12:17:30PM -0700, syzbot wrote:
> commit 3e25d5a49f99b75be2c6cfb165e4f77dc6d739a2
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Wed Oct 23 05:36:37 2024 +0000
> 
>     asm-generic: add an optional pfn_valid check to page_to_phys

Can you double check the bisection?  This just adds an optional warning
which didn't even trigger in the traces.  So if anything really gets
hung because of this and not just an unstable condition it's probably
a timing issue.

