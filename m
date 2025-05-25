Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08746A33F
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 21:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748209324; cv=none; b=uqlANFirVk/JjHoIHjXSeJbXjf2CzwYKk6gXYp/4lXxmYtTtCMmC4UvXKOyZs7sGbLdDSn9JMyjNL0/VtJq5DaHoRLC2OnTqiEAdfB92eh1IaBGTZpep+Po1kVoTwi58/tNYayCX4Opmv92JeJzFLWXxB/2dV4+t8+Dt1c/Bpho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748209324; c=relaxed/simple;
	bh=bIyy4YlaAnitmqCYPR8vLW5WxPsArk6HGaEP9Hz2Lvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ul6CktVXkH4vx/5yMPRnPBo85plYhabkgikzX3z8MifyFHxmcvR4+oVd094+SXLulngU7N9/A86+TDksaM+UlnuELx13HKWjPgqaV7DKDj1lVeiAN+b+oh8kFsw6nhIWTPAfXfByjbSoW2OXjmcmLgqN/3pW+f/uKi3JD+huIhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=r8X3sMkx; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="r8X3sMkx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jV0eAQuxZquMZkIkG+EEpK9m6zlq0/VxrkCPW29T2/k=; b=r8X3sMkx3XZr+a90ZP8Zbj17ri
	Sv8sIwIYzGbtTORcCaqrGxKApVm7GNL8UGO7vUbhqL4v2iNK+LkSYQDoTdyKs++Ld6K5nGK8cVoBt
	wz7NUiRE8I9m6UW4IuO31Dp14vPPxMO5mTgqZjzpQ6JM86JaeJCuwa2Jiv6ZtZaMVIkig2azWCooI
	8iipPMdBpX26t7qIpVkJq/3yTlwmWVVHQcJ3HY0adNyRj8IvGux0qkL4x3TR345cs4FKacfJiz13N
	HRd5DmhUB0ocNiObwcAJT8Vb88AUu6fN13TVnxuYRrSjILPf8DZa4cCdJMhrdRheoBfdrW5MJch3h
	6zKhFuWw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJJ6V-00000000PjZ-2G5B;
	Sun, 25 May 2025 21:41:59 +0000
Date: Sun, 25 May 2025 22:41:59 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Illia Ostapyshyn <illia@yshyn.com>
Cc: linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] scripts/gdb: Use d_shortname instead of d_iname
Message-ID: <20250525214159.GV2023217@ZenIV>
References: <20250525213709.878287-2-illia@yshyn.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525213709.878287-2-illia@yshyn.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, May 25, 2025 at 11:37:10PM +0200, Illia Ostapyshyn wrote:
> Commit 58cf9c383c5c68666808 ("dcache: back inline names with a
> struct-wrapped array of unsigned long") introduced a d_shortname union
> in place of d_iname.  However, the gdb scripts for vfs still reference
> the old field.  Update the scripts to reference the correct field and
> union member.

You do realize that for dentries with names longer than 40 characters
that field contains garbage, right?
