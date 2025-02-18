Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58264EB51
	for <linux-kernel@vger.kernel.org>; Tue, 18 Feb 2025 13:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739884223; cv=none; b=D1trxTgX5e4xUBjesS2QtSBIMH4ZwmF24WIVS4yJeAf/rMirCIRMLCC+kKCPgGuI+R4gZFlTZpAfV8jhtgEEOk0JcDaf1XQjBGnBoURPDw5CgKJqhmO52yhL7Ga53b7qR4BS6ZXFj8p5946UJr0X7XyWRoOLfYu3AqOY7ThEB94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739884223; c=relaxed/simple;
	bh=t4OTFAl8ReHMwhUHGvLxAue9P0FrPWgwIuI1QO5CzVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/unou19FsXUkyGiEIVFl5qmuxu3N87RTIkfO3OAbo+2WF57/EloLhGyviMbizo5nNW8dYWFzVd7VKz7sltb73rdLSG2MlOXGFx3deks3JXRF7UqQisqRoOLT6bC8eBdYet+cU/YpgxrSnAYDwpLp38UGPgDm4p216N+qZnPppw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XwWvnMcK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XwWvnMcK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B64C4CEE2;
	Tue, 18 Feb 2025 13:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739884223;
	bh=t4OTFAl8ReHMwhUHGvLxAue9P0FrPWgwIuI1QO5CzVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XwWvnMcKazaWZ3t/IJ6y+s7JlR3QJtxTtdEen4cgxYEgdA1GUTz6sZf9YudeGvVgy
	 p8e6gdXsN0Smh04/NDlWUuS2DcNQCjpiPNfkfJdDfvbyLtbztcyfxE47HUWijxFtV9
	 U/t0d/zi8bfXPtpPzNcFiW9A5/x4RgDvGJv/Kq5o=
Date: Tue, 18 Feb 2025 14:10:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <siddh.raman.pant@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: CVE-2024-56642: tipc: Fix use-after-free of kernel socket in
 cleanup_bearer().
Message-ID: <2025021818-police-task-b198@gregkh>
References: <2024122737-CVE-2024-56642-71ee@gregkh>
 <6ad79bb59b3535c9666ed5873dee4975f0745676.camel@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ad79bb59b3535c9666ed5873dee4975f0745676.camel@oracle.com>

On Tue, Feb 18, 2025 at 01:04:05PM +0000, Siddh Raman Pant wrote:
> The commit message has:
> > tipc: Fix use-after-free of kernel socket in cleanup_bearer().
> >
> > syzkaller reported a use-after-free of UDP kernel socket
> > in cleanup_bearer() without repro. [0][1]
> >
> > When bearer_disable() calls tipc_udp_disable(), cleanup
> > of the UDP kernel socket is deferred by work calling
> > cleanup_bearer().
> >
> > tipc_net_stop() waits for such works to finish by checking
> > tipc_net(net)->wq_count.  However, the work decrements the
> > count too early before releasing the kernel socket,
> > unblocking cleanup_net() and resulting in use-after-free.
> 
> This is incorrect, the function which waits is tipc_exit_net, which has
> the spinning while loop.
> 
> That function is an exit function so this can't be triggered without
> privileges.
> 
> Could it be grounds for rejection? Probably not but I thought I should
> ask.

If you think the text is incorrect, please send us a patch for the text
and we can apply it to the cve data.

> > Fixes: 26abe14379f8 ("net: Modify sk_alloc to not reference count the netns of kernel sockets.")
> 
> The fixes tag is incorrect. It should be the commit which adds the
> counter, which is:
> 
> 04c26faa51d1 ("tipc: wait and exit until all work queues are done")
> 
> Maybe this needs to be corrected in the JSONs (as the commits are set
> in stone).

Again, if the Fixes: tag is incorrect, please send us the correct
information as a .vulnerable file as our vulns.git cve documentation
shows and we will be glad to regenerate the entry.

thanks,

greg k-h
