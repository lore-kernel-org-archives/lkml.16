Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6895138F9C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745700; cv=none; b=Li+X6XWMhXgaaCn9EJoAHkHIgENk9fNW2tpl6RqQyONJ0sRlDFxyyIOmeRkWDGE0shyfRGdptsmZSP+k8uNiYBupCjiTQMJJAJ5djYXC4YTGevjaULcdMKW4GQRxDCkKtIjrHF5qVt5r5dMEXU/Vo726dTCt3lqPTpG6PngTysQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745700; c=relaxed/simple;
	bh=4ghlF+ZB001nqPhonnfAFdu/Q8InC5XUHZfMn6VjgTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJ5nEx6MH8PsdIwx8JoCdHd4FxVBhO8VUL7uROwT3t3fQ9WNpDpu/ClnDqj1f9JaxWLkl/oR79GFvXj2g5HyQOaVGIqGBzM2umNY0ZxahWdwcn4eCNW4cEZNOGjWwVgZgS/jV9UCYAAwS4L/l8kT5QnyAtpE0xqcOGweMTrTsl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55O6Evqk030937;
	Tue, 24 Jun 2025 08:14:57 +0200
Date: Tue, 24 Jun 2025 08:14:57 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: use arm64 name over aarch64
Message-ID: <20250624061457.GC30919@1wt.eu>
References: <20250623-nolibc-aarch64-arm64-v1-1-a2892f1c1b27@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623-nolibc-aarch64-arm64-v1-1-a2892f1c1b27@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Jun 23, 2025 at 11:48:34PM +0200, Thomas Weiﬂschuh wrote:
> Nolibc generally uses the kernel's architecture names.
> aarch64 is the only exception.
> 
> Remove the special case.
> Nothing changes for the users.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

I have been hesitating to do the same as well but remained
undecided. The fact that you thought the same confirms that
it's better this way.

Acked-by: Willy Tarreau <w@1wt.eu>

Thanks!
Willy
