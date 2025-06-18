Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DD11C8FBA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750245684; cv=none; b=Y6sBVCKGGKcROpN3mNvjBmLNs0by704hhAE8CBAf+qDDnid4zqiIkdSxGrpoKYZY52r+XGYifli8fVcKr2UE8YmYWdXNeVJIwgtXEjYU+BZFeSI40Rp4MVwBbIbIqyfgNKP456yjDmzLjV9xIpvSPB16k5hJTgkYFXBC/hUpwt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750245684; c=relaxed/simple;
	bh=GTY877nYRRJlofXawBaHN+DSyQdZpNS1FIRTCy9ljYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgEXB8bmcnGk6tETkt6bjpuSQrGCVXJyxFwuQ1QXggVRUXV+FKfvOaAkw/WiRhZV4/EIL0fS5TbMhFdqXNjqKShXmRAVDnENhO/3dHeq8E3bRUFtrNfcwm9mlmUSsKALqHyynGtx2nAkwYHgxNqd0JCVMJNM8apea1rKdxT/0/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yfrdM3yX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yfrdM3yX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2488BC4CEE7;
	Wed, 18 Jun 2025 11:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750245684;
	bh=GTY877nYRRJlofXawBaHN+DSyQdZpNS1FIRTCy9ljYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yfrdM3yXQVPw6uud6a+iF9TUmNClcbxvwbCTJ9ZpVjyjqSMATmSA6BXTHMjRcX20U
	 Nb6VAZw6nXbOoBYuhFpVmFHnMGoT4c6c9cbiPBQzKISopZ9kcWGZFYS5bRiuxuvMVG
	 4RYfJ2JVf6XxImRMUX4xQ5YscxehnrKOHXb3PFlk=
Date: Wed, 18 Jun 2025 13:21:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: CVE-2025-38026: x86/sev: Do not touch VMSA pages during SNP
 guest memory kdump
Message-ID: <2025061809-cattishly-refutable-956e@gregkh>
References: <2025061848-CVE-2025-38026-5674@gregkh>
 <43a8d610-68b9-4107-9df6-827535022543@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43a8d610-68b9-4107-9df6-827535022543@suse.com>

On Wed, Jun 18, 2025 at 11:57:22AM +0200, Juergen Gross wrote:
> On 18.06.25 11:29, Greg Kroah-Hartman wrote:
> > From: Greg Kroah-Hartman <gregkh@kernel.org>
> > 
> > Description
> > ===========
> > 
> > In the Linux kernel, the following vulnerability has been resolved:
> > 
> > x86/sev: Do not touch VMSA pages during SNP guest memory kdump
> > 
> > When kdump is running makedumpfile to generate vmcore and dump SNP guest
> > memory it touches the VMSA page of the vCPU executing kdump.
> > 
> > It then results in unrecoverable #NPF/RMP faults as the VMSA page is
> > marked busy/in-use when the vCPU is running and subsequently a causes
> > guest softlockup/hang.
> > 
> > Additionally, other APs may be halted in guest mode and their VMSA pages
> > are marked busy and touching these VMSA pages during guest memory dump
> > will also cause #NPF.
> > 
> > Issue AP_DESTROY GHCB calls on other APs to ensure they are kicked out
> > of guest mode and then clear the VMSA bit on their VMSA pages.
> > 
> > If the vCPU running kdump is an AP, mark it's VMSA page as offline to
> > ensure that makedumpfile excludes that page while dumping guest memory.
> > 
> > The Linux kernel CVE team has assigned CVE-2025-38026 to this issue.
> 
> I don't see how this issue could be triggered by an unprivileged user.
> I think this CVE should be revoked.

Now rejected, thanks for the review.

greg k-h
