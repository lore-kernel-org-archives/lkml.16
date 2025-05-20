Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F7D24A074
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751231; cv=none; b=ivLlh+DO+Xs44WyjztkZUo9/AT496v1pn5W7c7j5KlWzjqdzg4+b2MnvXrRpoX5OuMiGCO8BfBriKTPQFp981mXVu5/zB2D5fXlmFr8T45wFKHEE1m9m6RZfaSn76OrEFtcDcn3s97DzLps60Jl1WrlFDiAeT1GCvxWPMtkJLiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751231; c=relaxed/simple;
	bh=QY76H3aN4a/GJqZDNBay2k7eHvSo+DkI5zzBCIEhHAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVin3w/tHYsAoqW28nzdgXe8F7F7v0guD80iRtdB00PBNvdTOoh/5wkWLZCu1+mdbXqjuQTss9R3RCahyZ6BymF6J+lnPOWdrq3TOVWbWcMLbBm3y70rZMwwquH7Qpv4YM+R3//L9hKDoK9/FX5rztlyfxuIMkiqiURvIwJXciw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oaqEGIw/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oaqEGIw/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62776C4CEEA;
	Tue, 20 May 2025 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747751230;
	bh=QY76H3aN4a/GJqZDNBay2k7eHvSo+DkI5zzBCIEhHAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oaqEGIw/NJOh6x430/5jTKkndZ0q+3cvLSTM6YzlCvIC2dcBmCYyZgaIUbHC27Q7w
	 EfhyBetwdY3JbhQW/CHGkwFGLqOAX4AoGSX6EKsNZ+dUCpANf14ZNAvMQw/5X7eSp7
	 oyjWeO7n+w+t03IMVyqQnOV6bjnLU1b64fyn8PHY=
Date: Tue, 20 May 2025 16:00:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: CVE-2022-49933: KVM: VMX: Reset eVMCS controls in VP assist page
 during hardware disabling
Message-ID: <2025052038-reheat-upstroke-8d44@gregkh>
References: <2025050200-CVE-2022-49933-2147@gregkh>
 <b876424f-3364-4348-a20a-5ff271806452@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b876424f-3364-4348-a20a-5ff271806452@suse.com>

On Sat, May 17, 2025 at 07:26:58AM +0200, Juergen Gross wrote:
> On 02.05.25 17:54, Greg Kroah-Hartman wrote:
> > From: Greg Kroah-Hartman <gregkh@kernel.org>
> > 
> > Description
> > ===========
> > 
> > In the Linux kernel, the following vulnerability has been resolved:
> > 
> > KVM: VMX: Reset eVMCS controls in VP assist page during hardware disabling
> > 
> > Reset the eVMCS controls in the per-CPU VP assist page during hardware
> > disabling instead of waiting until kvm-intel's module exit.  The controls
> > are activated if and only if KVM creates a VM, i.e. don't need to be
> > reset if hardware is never enabled.
> > 
> > Doing the reset during hardware disabling will naturally fix a potential
> > NULL pointer deref bug once KVM disables CPU hotplug while enabling and
> > disabling hardware (which is necessary to fix a variety of bugs).  If the
> > kernel is running as the root partition, the VP assist page is unmapped
> > during CPU hot unplug, and so KVM's clearing of the eVMCS controls needs
> > to occur with CPU hot(un)plug disabled, otherwise KVM could attempt to
> > write to a CPU's VP assist page after it's unmapped.
> > 
> > The Linux kernel CVE team has assigned CVE-2022-49933 to this issue.
> 
> Is this really a security issue?
> 
> I don't see how an unprivileged user could trigger the mentioned NULL deref,
> as it requires CPU hotunplug (can't be triggered by user) to happen in parallel
> with unloading the kvm module (can't be triggered by user either).

Now rejected, thanks for the review!  This came in from the big "GSD
import" which is why it is for an old issue like this.

thanks again,

greg k-h
