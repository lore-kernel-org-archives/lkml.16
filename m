Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13112BD019;
	Thu,  3 Jul 2025 22:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581636; cv=none; b=HoezulkQz8Pwg0BN1WvlDTmKWXDwgkj0HvUgT+vg/x6VqzSJi4OaSK1sLIW6dZOq5zLV4CwcQRzJ1wla9kyCrtuPH4qkyMzKcFr3le5qwWMLCyd/U3+D2JG3cwGrVnq80f/2ccg5OLSza7qtSJn5rUQUmQiWqMbbj6xckQdwEHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581636; c=relaxed/simple;
	bh=AnoYsGhMMYOqSn39SzKC6//1PGGwZO2/anx17MpHsgM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TNLuZRuXeioKW9ol13sXf6ZsQo23/6Aq4QukiPu3VfJBUMArums+eCPT3X1uRbyBZTBqiOvdDfDDkT7OaqY5emDXNGWMn3xNznjTKVWEJSEPvsVL+BtxDMEwphp7n/PpwqiyZEPO7IL/DP1Fwx75yNXWXBg0E4vIhF5ioGc6/4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsR37Bo3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsR37Bo3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432CCC4CEE3;
	Thu,  3 Jul 2025 22:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751581636;
	bh=AnoYsGhMMYOqSn39SzKC6//1PGGwZO2/anx17MpHsgM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GsR37Bo35/J3Ib//8ibRwBbZDSKkV/lV4hComARbmZU/lmb0+ywizGgOCUt8e/H6d
	 ikIEJyiro2J8/aAGGCzmlcjyF/zjcDNVI7DscVOJ1mQksSd+G9ctUKjym/A9GtSHZa
	 okYVO/U8L9fAEf9lFxpvg+IU0i+B0pmvPWklFEAJ4VCcJ/fOLHE/DvkdmsUl4GdIm9
	 02SGCDkqf6FMuJYdO8G8rdlUfolM21eNCMKvQc0Lzq/IgfGfguFegf3865bmOCrtn0
	 HbpXU4/6XxSn3XTB7f+cFGT3Wp3VMIIMgkby8rxC0EkTGRYjCKk1G29/w8Q1acsAKR
	 jZNtgv1UwpJuQ==
Date: Fri, 4 Jul 2025 00:27:12 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 2/7] docs: kdoc: micro-optimize KernRe
Message-ID: <20250704002712.05933173@foz.lan>
In-Reply-To: <878ql5kuou.fsf@trenco.lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
	<20250701205730.146687-3-corbet@lwn.net>
	<20250703173848.721de72c@sal.lan>
	<878ql5kuou.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 03 Jul 2025 12:14:57 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hmm... I opted for this particular way of checking is that I
> > expect that check inside a hash at dict would be faster than
> > letting it crash then raise an exception.   
> 
> Raising an exception is not quite a "crash" and, if the caching is doing
> any good, it should be ... exceptional.  That pattern is often shown as
> a better way to do conditional dict lookups, so I've tended to follow
> it, even though I'm not a big fan of exceptions in general.
> 
> > Btw, one easy way to check how much it affects performance
> > (if any) would be to run it in "rogue" mode with:
> >
> > 	$ time ./scripts/kernel-doc.py -N .
> >
> > This will run kernel-doc.py for all files at the entire Kernel
> > tree, only reporting problems. If you want to do changes like
> > this that might introduce performance regressions, I suggest
> > running it once, just to fill disk caches, and then run it
> > again before/after such changes.
> >
> > Anyway, I did such measurements before/after your patch.
> > the difference was not relevant: just one second of difference:
> >
> > original code:
> >
> > real	1m20,839s
> > user	1m19,594s
> > sys	0m0,998s
> >
> > after your change:
> >
> > real	1m21,805s
> > user	1m20,612s
> > sys	0m0,929s
> >
> > I don't mind myself to be one second slower, but this is hardly
> > a micro-optimization ;-)  
> 
> Docs builds generally went slightly faster for me, but that is always a
> noisy signal.

Maybe it is just some noise. When I ran the test, I executed the script
a couple of times just to ensure that disk cache won't be affecting it
too much. 

The advantage of running just kerneldoc without Sphinx is that we
avoid doctree cache and other things that would add too much
randomness at the build time.

> Anyway, I am not tied to this patch and can drop it.  Or I suppose I
> could just redo it with .get(), which avoids both the double lookup and
> the exception.

I'm fine with .get().

Thanks,
Mauro
