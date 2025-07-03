Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47283218584
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751511599; cv=none; b=m8sS8TiCrAaae+qMT37sq63IwB7LIpi1HeVrHnKdnMHbjguBvGROfaCG1Mzx6ifZnvbAatpurFprV5Lkr4eh/MCVyYAbH7Fd+NdoUMyFI+y25TVSXWCSNljr+xdJ5NXrf2OubOLX6ftw1MXGjmy0kr1uBTuJ6XzfIucd1oRxqvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751511599; c=relaxed/simple;
	bh=dc0q65wuq3GoR9j9LYlZBNRnSdKlprh5s7W9GHJWoMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXHvz55TGbSQfWgJp5HpRokR0EyZ9t7H6sZp7LoRB8DqmYkR+v9pIfGz9Rk96cOhX9bUjBn3jihS5udXRUIRqYZacg5SY0UtstdcGltNwG++dkgNjIALUjhgjmjHFGo3hfgHMcqdYOTZnKhntM17Kf4z28PY9q0d3AqlijsqnCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=CX8Ul4jv; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="CX8Ul4jv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dc0q65wuq3GoR9j9LYlZBNRnSdKlprh5s7W9GHJWoMo=; b=CX8Ul4jvxalmkYU9DQ87BpmkWy
	jHEzlbtbO7oL1HIl9uzZYxiYzn/aVkGYMaB5EI8sNI+S4RdA9FqwuHHgoZlBcdnOBH6Q7ksaud/Lt
	QQgBPvMA2vhWzrgcsC11chAy3BMtRPDtN3dJKG5jGo857cjcNmjhptFNB6w6MtevVuHA07ZJ0dEm1
	ygT6HHtFqfTZzVS6IxBJeMiBhKaRtp5HaQnoFVf89mpGDgT/BYNDbEiI/RB1SBd8T6Tj3dii7sTI8
	SGcM1mxah65biWkDcOxUbZEUziWlqxC9bmpfrNtU5fpFlw48Gjt7sMgiog+CNQ/0xpwvV7lea91ey
	rvFDcsZQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXAB1-0000000Gfbi-1tuK;
	Thu, 03 Jul 2025 02:59:55 +0000
Date: Thu, 3 Jul 2025 03:59:55 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: syzbot <syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [syzbot] Re: [syzbot] [nfs?] [net?] possible deadlock in
 rpc_close_pipes
Message-ID: <20250703025955.GJ1880847@ZenIV>
References: <68656f4c.a70a0220.2b31f5.0000.GAE@google.com>
 <6865ef59.a70a0220.2b31f5.000b.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6865ef59.a70a0220.2b31f5.000b.GAE@google.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.rpc_pipe
