Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8D9269823
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862544; cv=none; b=IfId9FFBiGheKD57+HWr4oXXXm4iYyaORdVNHBCH4Zs2AeXjo0YGr0AvkBzxFcZfxr9BI9bonLvalypA1r+5o7J041wCcJd2HdMvzyQEqeunRxfcatktHiauAii1iiabnVglTvVfdga9QYrxuoWI69Q+j3tGARxhLb+MpLX8krA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862544; c=relaxed/simple;
	bh=NKc0SY3T4jIAU97bw0efLd0WnsVUB1R7Af5NQoJf/Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBGwJjIcES++ghOv8luvdF5L/Z5h0H7JBQ2Ut4hlP4FIAGZ88NEwDpMdmpshvpMwRxtuJI4Jf8Ln7ro6SsdJbR4cCKrFPCV9fGYFUqKNkNF24rvH4/bxUuaFk2YrcPfXrZqoOgZKBxg/BhPBl+RXDyJDHR23zQ0cJFr+d2bvVlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKY23PNS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKY23PNS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821C7C4CEEF;
	Wed, 25 Jun 2025 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750862543;
	bh=NKc0SY3T4jIAU97bw0efLd0WnsVUB1R7Af5NQoJf/Gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gKY23PNSCm+VJuzMvl1eEFd1tUm9T47R4cy5e9m/rHDDUpRCLgyz5tW4eg0yDOtjT
	 J/FLk/qCMMRfIcKT/UOAR/VqXgA7j2NW5GCSE4w3/4uiTZTz5nkNScffQXl6h8vSFr
	 t/s9Bt5MBxKNnkNCU+PuYKiI29erg2I4HMS+FhRXNIt0lHMzKfXbP8WFQ9nfmAakrf
	 AC5t34SjqyO7nINg8LMYXNoTxCdPnb7ORQVcgA/oG/w7wCcfchMYVyOE5+d5Waah7x
	 +TKDfUBZ9ewuAicZaYy5DXbNLu74bKCj1Mjnu2HDZOpAdyI8SwdYa16Qk8F4NMQU0V
	 9LPXf/ScILvNg==
Date: Wed, 25 Jun 2025 16:42:21 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v6 6/6] timers: Exclude isolated cpus from timer migation
Message-ID: <aFwKzZiIRnJM4TIE@localhost.localdomain>
References: <20250530142031.215594-1-gmonaco@redhat.com>
 <20250530142031.215594-7-gmonaco@redhat.com>
 <875xgqqrel.ffs@tglx>
 <b33dcafca895da1d9c64a7d6ab771952a932e579.camel@redhat.com>
 <878qlhnunz.ffs@tglx>
 <1bc41a7a5bd46860318b0417fa27121758f28448.camel@redhat.com>
 <aFq7rqbHugtiWF6Z@localhost.localdomain>
 <87a55waylv.ffs@tglx>
 <aFv2mLdH3lNHdKtp@localhost.localdomain>
 <7955e52177e1ad9c309df9e6f788103ae46541cf.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7955e52177e1ad9c309df9e6f788103ae46541cf.camel@redhat.com>

Le Wed, Jun 25, 2025 at 03:46:02PM +0200, Gabriele Monaco a écrit :
> Thanks both for the reviews.
> I'm a bit puzzled by what is expected now, though.
> 
> The late initcall would work just fine to replace the call to
> tick_nohz_cpu_hotpluggable(), indeed superfluous for hotplug calls,
> however the checks for housekeeping CPUs is required to prevent
> isolated CPUs getting online from becoming available and so will run on
> early boot too (without any practical reason, only because the hotplug
> handlers run there).
> 
> I might avoid it by playing with cpuhp_setup_state_nocalls perhaps, but
> that feels even more hacky.
> 
> Otherwise, I can refactor the code to maintain a separate field
> (isolated), restore the 'online' field and keep the functions for
> online/offline and isolation as separate as possible, while considering
> available = !isolated && online
> 
> This would make reading housekeeping masks superfluous on hotplug (and
> boot) code, but again, it doesn't look simpler to me.
> 
> Am I missing some obviously elegant solution here?

I keep being confused as well but yes, I think you're right, we need to
keep the checks anyway on CPU up.

> 
> Thanks,
> Gabriele
> 

-- 
Frederic Weisbecker
SUSE Labs
