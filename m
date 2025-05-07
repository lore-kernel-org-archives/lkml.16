Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C6B20FAB4;
	Wed,  7 May 2025 23:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746659119; cv=none; b=pDUMw23a5ShU74iY2Zk7puMU3OFF8jnpmyHNEcsBiJgZ3qWkXoBF/4j4+F7wUnlNw9djOcwXkYKjtEcLgeDRCM6Nt9xycMPd13tCN21S4c3WTyl0+nMonnejjOH7PDKxMHwqDnhjj1U3Ga3FuPajXjunIt9ttBjzgR0AoM/CXDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746659119; c=relaxed/simple;
	bh=Xzh3R1+5X8CSogqLzjGWaEBZSNYD4mdIa2j8iDwWstI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjzgxokLtmtJKEZtQ6+YLNiOD6PDvWpjpV/ZOciYLTjhcEaJlf5udZJ3m5Qkf7lHqWdKoZ1rBVsDYnYypZ5v+ywlz2HManPkhhMV1nZkSK+aY4YYGnabYjJ7/2MBxwUzx2/TMTe+y37YEJkGNGdE4KCt+mp25oQEtklMAM6SF4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=ZRuiNtY3; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="ZRuiNtY3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3YtOVnz8Naz9BdSMdKJ1oOLMQLBL9SbNPPPSsGJDfGQ=; b=ZRuiNtY38leGiFCxb+2bGaD9wy
	u2hZC4kjeZL82YBFruMDCqe8356myD9s1RQUGDWvSIiMfGZAbrePyoWJaO9CC9mnaPcyRktm/BeAZ
	gPr9rrQ9ZAGx4YOiT2CLSVw4z1QgDQJ5WiTbE5tMTzC3KXv6uLEPGtFf+jKFGWO98JbfIZK20FQK/
	E/5uBw9jrGhdfkqpmdgJHYMGZFIeVqyJgX+JcVjknJjD3MnjT4fNb9oajdmjoy7iQqyl/nAPngIE7
	39C9gyYbm5d4qo0TEdSYVjw42RhBMvMm0oTG+mT7K+IcatEpMCBkt5OjE5I3yLG2yExhmXLmCDpxd
	qEb2u8yQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCnpA-000000028bk-039z;
	Wed, 07 May 2025 23:05:12 +0000
Date: Thu, 8 May 2025 00:05:11 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	Sentaro Onizuka <sentaro@amazon.com>
Subject: Re: [PATCH] fs: convert mount flags to enum
Message-ID: <20250507230511.GA2023217@ZenIV>
References: <20250507223402.2795029-1-stephen.s.brennan@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507223402.2795029-1-stephen.s.brennan@oracle.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, May 07, 2025 at 03:34:01PM -0700, Stephen Brennan wrote:
> In prior kernel versions (5.8-6.8), commit 9f6c61f96f2d9 ("proc/mounts:
> add cursor") introduced MNT_CURSOR, a flag used by readers from
> /proc/mounts to keep their place while reading the file. Later, commit
> 2eea9ce4310d8 ("mounts: keep list of mounts in an rbtree") removed this
> flag and its value has since been repurposed.
> 
> For debuggers iterating over the list of mounts, cursors should be
> skipped as they are irrelevant. Detecting whether an element is a cursor
> can be difficult. Since the MNT_CURSOR flag is a preprocessor constant,
> it's not present in debuginfo, and since its value is repurposed, we
> cannot hard-code it. For this specific issue, cursors are possible to
> detect in other ways, but ideally, we would be able to read the mount
> flag definitions out of the debuginfo. For that reason, convert the
> mount flags to an enum.

Just a warning - there's a bunch of pending changes in that area,
so debuggers are going to be in trouble anyway.

Folks, VFS data structures do *NOT* come with any stability warranties.
Especially if the object in question is not even defined in include/*/*...

_Anything_ that tries to play with these objects must be version-dependent
and be ready to be broken by changes in underlying code at zero notice.
