Received: from lichtman.org (lichtman.org [149.28.33.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC94179BC;
	Thu, 30 Jan 2025 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.33.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738231488; cv=none; b=KZniXWlDLAx1e8ZmWnHYXVgwMmp55/eWx6L+wXGwZnwfw+VlU3Z9wNty4VUKEuu8S5fQuQ2rji9N3xOjRDD7GgS1wEHEyW8c3dRhveSyJi0gOV64nS4RIjvcT28A66QrknEKVjrwd10p6OfMVICuyW1qBaCup45ayWeKGZ7oAyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738231488; c=relaxed/simple;
	bh=qxUJ81cmT5eQnceH7+c837NRV3/Vm0lzi6+bHFokCCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIl3KZ7SnEHMrCwOMsvPaWKfSHoROV2ond0FL4q6PjQw5NDsOzkVjp0OzopARuCwnTUD/4Fo0E0KUtEAIRliCCVZIUy9e1+qJm6DW9O8DFOI4Z9JEbDES8Eab0JlN16DR07yki0yPQkpwzWRrHdP/QDW9dOlvyA3/0ysqAHTU34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org; spf=pass smtp.mailfrom=lichtman.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=ieprxYp9; arc=none smtp.client-ip=149.28.33.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="ieprxYp9"
Received: by lichtman.org (Postfix, from userid 1000)
	id 1A30D1771FA; Thu, 30 Jan 2025 10:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1738231486; bh=qxUJ81cmT5eQnceH7+c837NRV3/Vm0lzi6+bHFokCCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ieprxYp92rPyjHOiu+5od9v6Yq1tDnnSlhXWpAjO0AWV9Ls8wEitc6IYHsBDqplFq
	 TpPDw8lQdd7Xs7bxcvC65V0AVIOoqNDWmOmqAVv7P2Jnbzpq8KhMCr0qGawznJJUDq
	 IcX+ypnbZWJylbcZCeuRkZRR1udiIghmLiugMpsddaEiYfJsa9QLjeJZIZugi5qCSq
	 aW8pnm0y6qwohErC4sXLy1VFTA/CsaUE5lLIeB6sxEoa+7XgB2PsFWCTsyqsJx5LDe
	 t7GOGoz0S41VJZnNhkxtYX2YUBylszBQM6WMS+ANDcNtLJyrrRkMMa1L856/vh7Pp3
	 6KwE09b3eH+7g==
Date: Thu, 30 Jan 2025 10:04:46 +0000
From: Nir Lichtman <nir@lichtman.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, paulmck@kernel.org, akpm@linux-foundation.org,
	rostedt@goodmis.org, Neeraj.Upadhyay@amd.com, mcanal@igalia.com,
	thuth@redhat.com, ardb@kernel.org, bp@alien8.de,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rob@landley.net
Subject: Re: [PATCH] docs: clarify rdinit precedence and correct ramdisk to
 initramfs
Message-ID: <20250130100446.GA1162389@lichtman.org>
References: <000201db72f5$49b11e60$dd135b20$@lichtman.org>
 <2025013037-feel-strategic-4a25@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025013037-feel-strategic-4a25@gregkh>

On Thu, Jan 30, 2025 at 10:52:02AM +0100, Greg KH wrote:
> On Thu, Jan 30, 2025 at 10:59:33AM +0200, Nir Lichtman wrote:
> > Problem: Current documentation regarding the init and rdinit params is
> > confusing,
> > The description of rdinit claims that it is related to ramdisks, even though
> > in practice
> > It only controls the init executable of the initramfs
> > (the deprecated ramdisk mechanism is initialized only after attempting to
> > load rdinit
> > or its default "/init")
> > Rob Landley's document from 2005 "Ramfs, rootfs and initramfs"
> > clarifies the distinction between initramfs and ramdisk.
> > Another confusing point is that the init param is ignored, in case rdinit or
> > "/init"
> > exist and are executable in the initramfs; the source code gives priority to
> > rdinit.
> > 
> 
> Odd line-wrapping, please fix :(
> 
[..]
> 
> Your patch is also line-wrapped and will not apply at all :(

Oops mistake, sorry about that, sending a fixed v2.

> 
> thanks,
> 
> greg k-h
