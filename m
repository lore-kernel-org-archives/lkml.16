Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3AE2253B2;
	Mon, 17 Mar 2025 13:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742219265; cv=none; b=Z7EDg5asjWLahZSckKYwzI6uxDYJIX3FB35879TzoeZmWeEk29w2HVDDxi8/WlrnRGUaKDmrvEcNwKq7KrQBMIcuMLqGTk7HlBlt4uCwHH6t+0OwJIZi5jU7UFVeezhuDRO4/ja7qLWR71jj3a4M8cuquBYetpSmEexFCSs1AcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742219265; c=relaxed/simple;
	bh=APpyBzeHrERkrfYDypeg50f/VwE8NlywBf95x9pAa9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FM34bbcWtrVo5DzgVoc44RZP4yQVEnEvgMp5aHun6uVsSLY+j/l3WautSzWx1bk5iRbZIvDqLQ9tb3MRv/1VL5gbrcj02HE7IDTjl8RbDbrgrDkehodXPpHBXwJIl38+UoL7asvAJLYUXSegJSctsfBG5m/pCei8ti0ULzaWFMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nSU0aWuE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nSU0aWuE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC91C4CEE9;
	Mon, 17 Mar 2025 13:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742219264;
	bh=APpyBzeHrERkrfYDypeg50f/VwE8NlywBf95x9pAa9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSU0aWuEQ/v+Q9DRLUBVavPm2lAlmHu1OEoLD+yeh/bovPCoh/072Nv649dVG3TRX
	 Mm66JOvSJN6oQAyy6N1S0hyUxOc2NTrlykxsG0pgH6k0kolmyMUnSiDisNMPp1sQkA
	 3ftWzgAWaNetHS3eBIHs9WUtDyHZhRGVAbHLSGEw=
Date: Mon, 17 Mar 2025 14:46:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: CVE-2022-49444: module: fix [e_shstrndx].sh_size=0 OOB access
Message-ID: <2025031759-pretzel-automated-fc3e@gregkh>
References: <2025022658-CVE-2022-49444-ff21@gregkh>
 <20250317081416.377784-1-jackmanb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317081416.377784-1-jackmanb@google.com>

On Mon, Mar 17, 2025 at 08:14:16AM +0000, Brendan Jackman wrote:
> > It is trivial to craft a module to trigger OOB access in this line:
> 
> Requires loading a crafted module?  I don't think there's any coherent threat
> model where this is a vuln. Probably a CVE to revoke?

Look at the commit this is marked as fixing.  It was a "feature"
introduced to properly harden elf sections in modules.  So if you are
relying on that new thing, then yes, this is a vulnerability.  If your
system does not, then your system is not vulnerable to this issue.

thanks,

greg k-h
