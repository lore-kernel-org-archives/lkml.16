Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAD719DF60
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 21:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272551; cv=none; b=u2OEDTXOhnRVRTSDkKT4Esqew0SbgcBLkKU/Lt2CjksyaWZWgeFywyoKUoNfiHBhS7j8/X1vDiGa1t0vxRco201CEoMu4gDtDKx30resYlpRrAI5Jt8ePWRC6XMY4Fuynzft3hdyEZMF+Ks24dvdybZQP7J6kP9lUfGNBcaIVAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272551; c=relaxed/simple;
	bh=lI75L79hIQED/UnUUkdMXjJ2eiCGcUnneQhH2aI+1XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIr2jjj+2biJ0P0KhlY2cRFIGQ/ofvQOkAQDi+aE446Zw4PFpTVTC90e/dYaG/fiNZwiOFVSmutXS0LR1i2keJ8gpU+wPAgIC//4WZ1X9UqdRWEddV0dhGMgzWft+Y2+rw4kIbztQB5iJoXjmLyISdpLrzO3y/PGzVQyLyr7fGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=suyNI5jA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="suyNI5jA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3D1C4CED3;
	Thu, 30 Jan 2025 21:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738272550;
	bh=lI75L79hIQED/UnUUkdMXjJ2eiCGcUnneQhH2aI+1XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=suyNI5jAIW010pAsDhsxeul4iiol9BjKUM7mTbg3aGCItAkSEQxG3p8JVfHnGf9nO
	 8BNhOE+y3zZMJsDHS5LMDSuHze4WpSXxReCY9je7NvcSnfIRWHrsWjVdGB0pO6WUaE
	 66LiRWg2mz+qxOF4gUQdtWusf3Szu4cHXuTndBxc=
Date: Thu, 30 Jan 2025 16:29:09 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: tools@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] b4: Include git notes when generating patches
Message-ID: <20250130-powerful-versed-carp-ce8ecc@lemur>
References: <20250130201331.73584-1-yazen.ghannam@amd.com>
 <20250130-rich-orangutan-from-eldorado-04f621@lemur>
 <20250130210453.GA615204@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250130210453.GA615204@yaz-khff2.amd.com>

On Thu, Jan 30, 2025 at 04:04:53PM -0500, Yazen Ghannam wrote:
> > I'd love to do that, but git-filter-repo currently doesn't do the right thing
> > with notes, so anyone who starts to rely on notes will find that they are
> > easily lost with most common b4 operations. There's a long-standing RFE to
> > support notes with git-filter-repo:
> > 
> > https://github.com/newren/git-filter-repo/issues/22
> > 
> > Until that happens, I really don't want to pretend that we support notes,
> > because this will result in bad experiences for most who try it.
> > 
> 
> Right, I've encountered issues myself. I've found that the 'tip-commit'
> cover letter strategy works, since git-filter-repo will only operate on
> the final commit.

Unfortunately, tip-commit is not going to fix all instances where this is
likely to break. E.g. running 'b4 trailers -u' will also rebase your series
and lose your notes.

> Could we document some tips for this topic? Or just leave it for now?

I'd just leave it for now. Hopefully, we'll eventually get to the point where
notes are supported without any workarounds (though I've been waiting for a
few years now).

-K
