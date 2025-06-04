Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F21204C2F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749029287; cv=none; b=jv5N9jN/sYP/hQhIZU7WpbmDCQq3hm3x3/V1XFtdycEkBD6ZeAyjcKVDJ4HSii8tqZaeIdwkH6p2GrbM60lQyzUeIPkW4YHYYTugKaJ3tGXzuj/8FCfslfkT2OeZMdARJDBW46xJluRJMqI5oPuy9az8k4Zyz1OlpxLdC3qH5T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749029287; c=relaxed/simple;
	bh=xyBEour67kosDw6VnzqgDITeq5mziVJmhwKehj6NCsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrODgRAZQf/Z2Qs3MRVcudZ1Svza0sEsJStbTYWam9Ad0D0SKsMiTWZYgM8WL+uwEjs6fxuYgxcCxpZX5MuEI+XK2xLugXhxriH+j2tv32sGHWRja0S8/RtHyLNF6KUdWSJzLPbqv5XFn+CoX9ll4nsVql244vqTs7lZ6gRqTsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bR7GGfyj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bR7GGfyj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9461C4CEF0;
	Wed,  4 Jun 2025 09:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749029286;
	bh=xyBEour67kosDw6VnzqgDITeq5mziVJmhwKehj6NCsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bR7GGfyjQ+prwXfXxqNxbfx/3yrfimoOKYMb9mjgXQLe0SCVv+S5TvcfxU9rnZLiX
	 g9c0iFWYmFELlnB8lrS6x2ETzE2TNg/ubCLBqWKIX61BO6BGQwGqw/luATBSIbBX/7
	 f5dGNKN3B9AgUdPfknxoD36LxDRdj0us1TU8QjQ4=
Date: Wed, 4 Jun 2025 11:28:03 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <siddh.raman.pant@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: CVE-2025-21991: x86/microcode/AMD: Fix out-of-bounds on systems
 with CPU-less NUMA nodes
Message-ID: <2025060430-rimless-splinter-4131@gregkh>
References: <2025040257-CVE-2025-21991-6aae@gregkh>
 <793ae4a30ab15d0993ce9152ce91b6b98a05b1a5.camel@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <793ae4a30ab15d0993ce9152ce91b6b98a05b1a5.camel@oracle.com>

On Wed, Jun 04, 2025 at 09:24:12AM +0000, Siddh Raman Pant wrote:
> On Wed, 2 Apr 2025 13:51:58 +0100, Greg Kroah-Hartman wrote:
> > In the Linux kernel, the following vulnerability has been resolved:
> > 
> > x86/microcode/AMD: Fix out-of-bounds on systems with CPU-less NUMA nodes
> > 
> > [...]
> > 
> > This does not have any security implications since flashing microcode is
> > a privileged operation but I believe this has reliability implications by
> > potentially corrupting memory while flashing a microcode update.
> 
> If it is explicitly specified that this does not have any security
> implication, why is this a CVE?
> 
> IMO this should be rejected.

Doesn't "causing corrupted memory when flashing a microcode update" fit
the cve.org definition of a "vulnerabilty"?

thanks,

greg k-h
