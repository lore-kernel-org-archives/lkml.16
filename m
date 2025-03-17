Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8391D9A79
	for <linux-kernel@vger.kernel.org>; Mon, 17 Mar 2025 07:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742196816; cv=none; b=KjS00wFDhT9u0MlAy8e7OdopeK4e/xMA4X2MwSHCcgtJ3H4DtAa9M/Q7nbppBkkmX5zYmymIEjv2GFe30+ccLBFns/Y5ko5hGPOMujjc8K6hyJ+/NtjzoaTZI/PIibLwgxQ3VtBtzssFkZx72fEeWzEmQas3uXhi3m+3e3Tkis0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742196816; c=relaxed/simple;
	bh=UU+a68L6t+cHsFbWnvfSxYR7gGVjob+U7UJsyob5/S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oohsVYAVGrwTVSPsxkX2PR3P7jnZYZqAVrIR6SPVJdP9hdfygHGFJfM/W0v4fQv5Jc6iPakMiX0G/yqV6+SAoQkee1a/MY+qFuyWtF4pqFzKOaD40BAM+fslCl451itd9T4jqhb0MPm2hg/GWNBKLl2QLK7dPp9Pi9JkQAvaBVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 52H7Iac3005123;
	Mon, 17 Mar 2025 08:18:36 +0100
Date: Mon, 17 Mar 2025 08:18:36 +0100
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: drop manual stack pointer alignment
Message-ID: <20250317071836.GA5114@1wt.eu>
References: <20250316-nolibc-sp-align-v1-1-1e1fb073ca1e@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250316-nolibc-sp-align-v1-1-1e1fb073ca1e@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Mar 16, 2025 at 08:46:07PM +0100, Thomas Weiﬂschuh wrote:
> The stack pointer is already aligned by the kernel to a multiple of 16.
> See STACK_ROUND() in fs/binfmt_elf.c.
> 
> The manual realignment is unnecessary, drop it.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Looks good to me, thanks Thomas!
Acked-by: Willy Tarreau <w@1wt.eu>
Willy
