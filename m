Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929101F12FB;
	Thu,  1 May 2025 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109201; cv=none; b=ZLmZEM0hiXDoxtjlytP9M+WCnpmISl/jqMAqZ/wkdu+ssuB6p7sE7bL+uylWisGaR+Rj/zTeOHsd+2/Gdb8aQQ115Nx8kR1BAWOFCgX+XBG+VS24YQJUt1dSPTlyavSDx2YXey+pxCYuUPb3CtKsUmZgwWv1UHQS/2H5vrSqjjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109201; c=relaxed/simple;
	bh=yTGDsV/qkDX6/wJxY2XfQH1gt/Bhq2Z1tO1gg0yohu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ab4GJMVM/bperV+QsQ9shIGzjyMy+GlQaMgaH/IMSsOCnCfFEeXlF0vAIr3gr6/tA9eMhKLfXs0HhtLbPuKeaq2tk8C/OF+0KxlaxTNx/PHO4wiMRBynbjnrqvKHNf9AAKimz139teGDHJwHNDCIbgkKqUxkGBt3sJiF/arfa2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=n6BU+4l8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n6BU+4l8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB779C4CEE3;
	Thu,  1 May 2025 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746109201;
	bh=yTGDsV/qkDX6/wJxY2XfQH1gt/Bhq2Z1tO1gg0yohu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n6BU+4l8c5gq/ZzPAFK9xFGa97oxCn6dQah+wqoItLFSJp008SxoaKOWO26yRdzNB
	 xQT7RKvtO4ljIlwjF7UQInffIGB0vttyPhz5JZ6qlM+KDNDQA+XpSjVtT8XfyGgrpQ
	 2jmuSSlB7sDWhamBaYp/EcgCRF/CUdKcs3RDgwH0=
Date: Thu, 1 May 2025 16:17:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, cve@kernel.org,
	linux-kernel@vger.kernel.org, linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2025-22029: exec: fix the racy usage of fs_struct->in_exec
Message-ID: <2025050148-celtic-espresso-60d2@gregkh>
References: <2025041655-CVE-2025-22029-349f@gregkh>
 <aBH93qMAhgMEGDAY@tiehlicka>
 <20250430112033.GA9277@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430112033.GA9277@redhat.com>

On Wed, Apr 30, 2025 at 01:20:33PM +0200, Oleg Nesterov wrote:
> On 04/30, Michal Hocko wrote:
> >
> > Based on a follow up update from Oleg[1] I would like to dispute this
> > CVE.
> 
> Agreed. Let me quote my reply to my "fix", see
> https://lore.kernel.org/all/20250429154944.GA18907@redhat.com/
> 
> 	Damn, I am stupid.
> 
> 	On 03/24, Oleg Nesterov wrote:
> 	>
> 	> check_unsafe_exec() sets fs->in_exec under cred_guard_mutex, then execve()
> 	> paths clear fs->in_exec lockless. This is fine if exec succeeds, but if it
> 	> fails we have the following race:
> 	>
> 	> 	T1 sets fs->in_exec = 1, fails, drops cred_guard_mutex
> 	>
> 	> 	T2 sets fs->in_exec = 1
> 	>
> 	> 	T1 clears fs->in_exec
> 
> 	When I look at this code again, I think this race was not possible and thus
> 	this patch (applied as af7bb0d2ca45) was not needed.
> 
> 	Yes, begin_new_exec() can drop cred_guard_mutex on failure, but only after
> 	de_thread() succeeds, when we can't race with another sub-thread.
> 
> 	I hope this patch didn't make the things worse so we don't need to revert it.
> 	Plus I think it makes this (confusing) logic a bit more clear. Just, unless
> 	I am confused again, it wasn't really needed.
> 
> Sorry for the confusion caused by my patch :/

Sorry for the delay, the CVE is now rejected, thanks.

greg k-h
