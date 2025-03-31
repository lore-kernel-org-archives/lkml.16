Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C8A215F5D;
	Mon, 31 Mar 2025 19:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743450269; cv=none; b=W06MW66+TOCToCKdd0Un/okkWObRg+pm33yLqZWZzQ1CtfQR7Yh5FzsAbLlL+7H95XcAGI1+jqmw4sSiQrRFPtDuUdZsKMiTQpbWHaFBAnG4X9OiEwQ+clBHpZqh9YS4gEKuvWKLwQk/TwiPr5+Cis5I85jziml6WQFLXVqXg70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743450269; c=relaxed/simple;
	bh=3oHNk/rQpHH7CVM6IKsi/S8cXQWJJHM3BqaD4B+YGEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mfzuc//wp+I5zCFhCY7vasV9JKdGuN4fi3TJpPh4Ymu42fk9i2P4JDpIomcMt7VxG0v2pWW6Genwk0X592K6kdRtRjrT85pk5P/xbAqfLp08dtJMsVshcmf5qwYRQyntM977SF4SFpiR5Y8yOxsE6Fxza3qnogovhkYYGzxTEX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nOOvaftE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nOOvaftE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E724C4CEE3;
	Mon, 31 Mar 2025 19:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743450268;
	bh=3oHNk/rQpHH7CVM6IKsi/S8cXQWJJHM3BqaD4B+YGEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOOvaftEyQeiVQTb7s4t6N0lCPALlsBDCUJtAVXj+2GJiv4AJl/TJl3C8n4O69gkF
	 1Sw64i56z1bKiW/vD3GZIQx6hwf8RYB2OlGQP2dJRDIHA/O6qACk8WdJ4wOWFFJJvb
	 hyUHvPzMUONdmS6byNZs3sUzGBAXTboKQYvkQRlc=
Date: Mon, 31 Mar 2025 20:43:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Sterba <dsterba@suse.cz>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2022-49761: btrfs: always report error in
 run_one_delayed_ref()
Message-ID: <2025033118-hardship-reliant-2f7a@gregkh>
References: <2025032703-CVE-2022-49761-9b1e@gregkh>
 <20250331180316.GJ32661@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331180316.GJ32661@suse.cz>

On Mon, Mar 31, 2025 at 08:03:17PM +0200, David Sterba wrote:
> On Thu, Mar 27, 2025 at 05:43:19PM +0100, Greg Kroah-Hartman wrote:
> > Description
> > ===========
> > 
> > In the Linux kernel, the following vulnerability has been resolved:
> > 
> > btrfs: always report error in run_one_delayed_ref()
> > 
> > Currently we have a btrfs_debug() for run_one_delayed_ref() failure, but
> > if end users hit such problem, there will be no chance that
> > btrfs_debug() is enabled.  This can lead to very little useful info for
> > debugging.
> > 
> > This patch will:
> > 
> > - Add extra info for error reporting
> >   Including:
> >   * logical bytenr
> >   * num_bytes
> >   * type
> >   * action
> >   * ref_mod
> > 
> > - Replace the btrfs_debug() with btrfs_err()
> > 
> > - Move the error reporting into run_one_delayed_ref()
> >   This is to avoid use-after-free, the @node can be freed in the caller.

This text here is why a CVE was assigned for this, is this not a
use-after-free fix?

> > The Linux kernel CVE team has assigned CVE-2022-49761 to this issue.
> 
> I'm disputing this CVE, there is no vulnerability. The code moves a
> debugging print and makes it a more verbose error but does not have any
> other functional change. Specifically it does not extend error handling
> in any sensible way.
> 
> There is no apparent _vulnerability_, the patch was in stable likely
> because it adds some user convenience, but thre's no Fixes nor CC:stable
> tags so it was probably picked by AUTOSEL. Please reject the CVE, thanks.

This was part of the big GSD import of security vulnerability
identifiers that cve.org is having us do.  I read the above text about a
use-after-free which is why I agreed with the original assignment of a
GSD id and gave it a CVE id.

If this isn't the case, I'll be glad to revoke it, but at least now you
know why it was assigned one :)

thanks,

greg k-h
