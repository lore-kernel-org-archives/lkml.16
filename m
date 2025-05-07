Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95A128750A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625226; cv=none; b=bxtn93B+p40NQjjCki2edTKpZA8Yffzc9ovsWmP0Rg+D2rvb3wK/T0intIFRyOsuD0WzMqzDyRt7oUifXl+kDdepxqZBXfjCwQlqQncNEI8jHY8emrFUfhh/MnffVyrW2I8yn18bmhDTvxQYHlGCFeotOUuMm15L/k5OsnYuicA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625226; c=relaxed/simple;
	bh=gWnfKNZyzMrtzpRcUWQ2mVL8CbobfVNiC5GlA7+/iZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BszlkkbmJUkVMyyPgtjlQviXyoO8F6eXNMZQKqLJlmHCO/G5EWMr8+QLR96ODGxxm4Ql9ffdaoFCtZxg6tgJHyMwBf7RcSt+sYlgV6GyZUY+zNFh7km5q1eFkEsfdsPU+9D8E+HCnewmsehWaVEWWp793EJ5bNPa0yG65ElYCL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kynczDTw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kynczDTw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60139C4CEE7;
	Wed,  7 May 2025 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746625226;
	bh=gWnfKNZyzMrtzpRcUWQ2mVL8CbobfVNiC5GlA7+/iZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kynczDTwdqOU1zA8lexp1K4KyhEEF+9ptTfE/o6NKytQfltUbOs9NJdC0PGuWS+jZ
	 cOU+F/3OwKWFz3kDcU7VNeh+E1Wy7juic3nZao4Oy6KqGB1Va/6QWZWq4AjDfNmPfA
	 J1tKdHx3SBvMPhC8UKWLcJfCky+JFpYUuvTXjiKMRmn/CvSfMhWSRF7vtqhOtnlj41
	 sjBYbsnRchYdwdn7HYN5kBeUBFGGjTisd1gXwh/r1Vubhl+cbFMDqkMoGcc2TkYGeJ
	 v0ESk/w9UKq71rhmR2RARVGDtiSN4Jpqsvp4oMXuqvxqtyodRMiei5DnCbX0pMxllh
	 G2XAW/t1ZimwA==
Date: Wed, 7 May 2025 15:40:23 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v4 2/5] timers: Add the available mask in timer migration
Message-ID: <aBtix0VHFCRI_Y-c@localhost.localdomain>
References: <20250506091534.42117-7-gmonaco@redhat.com>
 <20250506091534.42117-9-gmonaco@redhat.com>
 <aBozrJ0C6yzW7oB_@localhost.localdomain>
 <3f54534266f4405fc3c6943599edd9be88becd57.camel@redhat.com>
 <aBtRSSCxyHcypo4b@localhost.localdomain>
 <9b96acdb43b80f067a34b83c5fe9fc3e79f1e3a4.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b96acdb43b80f067a34b83c5fe9fc3e79f1e3a4.camel@redhat.com>

Le Wed, May 07, 2025 at 02:46:39PM +0200, Gabriele Monaco a écrit :
> 
> I'm not so sure about this one though.
> As far as I understand [1], is preventing the user from setting
> different CPUs while doing isolcpus=nohz, and nohz_full= (which is now
> equivalent). But I seem to be able to do isolcpus=0-3 and nohz_full=4-7
> without any problem and I believe I'd hit the issue you're mentioning.

Duh!

> (The same would work if I swap the masks as 0 cannot be nohz_full).

Unfortunately 0 can be nohz_full...

> 
>   # vng -a isolcpus=0-7 -a nohz_full=8-15 head
> /sys/devices/system/cpu/{isolated,nohz_full}
> 
>   ==> /sys/devices/system/cpu/isolated <==
>   0-7
> 
>   ==> /sys/devices/system/cpu/nohz_full <==
>   8-15
> 
> (where probably some CPUs are set up to do housekeeping stuff anyway,
> but if we just look at the masks, we won't notice)
> 
> Then I assume this should not be allowed either, should it?
> Or am I missing something here?

Exactly then. housekeeping_setup() already handles cases when
there is no housekeeping left. I guess that section could be
made aware of nohz_full + isolcpus not leaving any housekeeping left.

> 
> > 
> > But if nohz_full= is passed on boot and cpusets later create an
> > isolated
> > partition which spans the housekeeping set, then the isolated
> > partition must
> > be rejected.
> 
> Mmh, that would make things easier actually.
> I assume there's no real use case for that kind of hybrid setup with
> half CPUs nohz_full and half domain isolated..

I guess we can accept nohz_full + isolated partition as long as a housekeeping
CPU remains.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
