Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D843085CE;
	Wed, 18 Jun 2025 22:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750286973; cv=none; b=nz2dR+ppPJPpHTOmDt4kofxd64QazAJC4ZxY8S4m5VNJOO+TWiXBB/lyf/x3UJUG3NpKqHko+QykNJW2yIsxp24cPzLh3urVMLLI324rmwu5BNcz9aM5B3Yd10q/XbLBAI8m/YyDwjrEKhxCvK5yR6N/XRQIOJ+rqbYlRldQtSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750286973; c=relaxed/simple;
	bh=IM83kybDUB5R+aVBiqEcJqn6CL9eekdVMMXEVlgd+2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NawkhoTbElRJocxVJvXwd1ZE2ty7A2jmlR9+wHocbgVcSf4pBgEkEUCb2dMHUG0au2knXy85ZMUtlnEmD4PPKeOWSXc72hT/SKRziM+oGnvLUxbqj+w7XXg/2SmchpXcM9y7wHqws8OKLIeJ8csc75L0NgdVDXHsALAnvOno2yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=mz/u63D4; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="mz/u63D4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eNiqCK8g0vhQijB6E2hEAZVidkbJ7xf2WpZ2zCfMQ+Q=; b=mz/u63D45yIXpz4G3Af60CMMpC
	k1oBeGkjR0mHN+LSiKpV8e+WYSBJplaVvlbov7mfGuyQzBuS9nXDo8VZwGK09WUFNyLv47VJeIe+e
	nL3oY1tJENdzmkrjPTYzSIdmkMcEcihwP3t8hxIG51P5kUhb9TINJnu/lsLAf/g5m2w8JiHItHU5I
	oprN5qe6ucHA2xDHhY4AvCxitrivxPQIIaxxkc8ZvA3UCq2CjEaYJIozOa1c/qQg+T3G38t7BKAVA
	EyHuv9tDBQIlBX4X7vsTMvX+qCtheMzlvkg4TrA+09xDlgLJixU0G2n7FXKvj0uuWzAtffgHL8vAb
	oKYf/3cg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS1aw-0000000Eez1-0pqB;
	Wed, 18 Jun 2025 22:49:26 +0000
Date: Wed, 18 Jun 2025 23:49:26 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: mixer_oss: Replace deprecated strcpy() with
 strscpy()
Message-ID: <20250618224926.GS1880847@ZenIV>
References: <20250618223631.1244-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618223631.1244-2-thorsten.blum@linux.dev>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Jun 19, 2025 at 12:36:29AM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> No functional changes intended.

Have you actually read the damn thing?  Seriously, look at the uses
of 'str' downstream.  The only thing it is ever passed to is strcmp().

In other words, why do we need to copy it anywhere?  What's wrong with
having char *str instead of that array and replacing strcpy() with
plain and simple pointer assignment?
