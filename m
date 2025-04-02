Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DCA1F5FD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743579810; cv=none; b=o1t0jB0h7B2Pxa7amBtHYalQJSwQh7pcDDZYvicm5CKhUUROHgjfhWEmX1n29SzuW4XV7aZfehfqrLkeKQ8Yv4bu0h49y6S2/apv2OMYTihHR5LLHD8Ib9jbQkunLhuEwRfJ83Mgh9YkroDdeV/jS+Bs6lcVUWm8rKZgkgS/ZtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743579810; c=relaxed/simple;
	bh=IiOhZa2RGc/ELLYpE693fE82sDNLJ1amZ3QlPXMsue8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujJZowEHXP9jYlqhpNdz2htr9e+nE4HD3oR7KjXtP5nk5LNz104Hr7SXxoPTwfiv8PHRUWY23zCWywfWWto1A5yuqf2mZutHlmGJGuyFhZHIsmpvbGrsSoW0RQhImEVQZYe1X0d+A+48UOGzJbIO4qKEehH3NmBKFq2gNYyEVeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Atneoo/5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Atneoo/5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D9DC4CEDD;
	Wed,  2 Apr 2025 07:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743579810;
	bh=IiOhZa2RGc/ELLYpE693fE82sDNLJ1amZ3QlPXMsue8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Atneoo/5ap3o0C3HV0oQytsTPtd0CWYrFgCTd9vQQuPtvdgtTQq4zYa9PLWvBGyCq
	 ZWpZB9NMUOc35Qz/TTn0e5y4drqVwWWNmziVLqX2NEXZme+om8x6awUxu5SzwWI/My
	 +UsJtqlTgdQKAGs18HAIy3BLHftDb69OhJlu17wU=
Date: Wed, 2 Apr 2025 08:41:59 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <siddh.raman.pant@oracle.com>
Cc: "cve@kernel.org" <cve@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] published: CVE-2025-0927: Fix up JSON schema.
Message-ID: <2025040221-curtain-walnut-2540@gregkh>
References: <2025033057-CVE-2025-0927-1436@gregkh>
 <80cd3f46783cd5702b3abd40c11f3f08f64717ec.1743576485.git.siddh.raman.pant@oracle.com>
 <2025040248-hut-sevenfold-82c3@gregkh>
 <4d521717c418c873225d220ca65fd6740c496c8f.camel@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d521717c418c873225d220ca65fd6740c496c8f.camel@oracle.com>

On Wed, Apr 02, 2025 at 07:16:33AM +0000, Siddh Raman Pant wrote:
> On Wed, Apr 02 2025 at 12:36:20 +0530, Greg Kroah-Hartman wrote:
> > On Wed, Apr 02, 2025 at 12:21:52PM +0530, Siddh Raman Pant wrote:
> > > It doesn't match the schema of other CVEs as it was not generated
> > > by bippy.
> > 
> > It was created by vulnogram for obvious reasons :(
> > 
> > Also, please cc: cve@kernel.org for stuff like this.
> 
> Okay, noted.
> 
> > 
> > > Fixed by hand / manually.
> > > 
> > > programFiles were added from the info in mbox.
> > 
> > So this did two different things?  Why does the layout matter here?
> > Eventually it will be created properly when someone gets the fix
> > upstream, I'm waiting for Canonical to do it as they are responsible for
> > fixing this mess at the moment, but don't seem to be responding to my
> > emails anymore...
> 
> Apparently, they fixed it in February and backported it:
> 
> https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/noble/commit/?h=Ubuntu-6.8.0-54.56&id=09ad3b1e99befe042ae5219e4020eb54411d98ef
> 
> https://ubuntu.com/security/CVE-2025-0927

Yes, they did that without telling anyone, and assigned a CVE for it
which they are not allowed to do at all, which is why I had to
hand-create this one when it was transferred to kernel.org.  They should
be working to get that change upstream properly, but again, they seem to
be ignoring us totally at the moment :(

greg k-h
