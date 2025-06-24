Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EEC2C3769
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774314; cv=none; b=YaVeb9T/g9Tx8nF56huxuLxMUrAgU5mwzT86IKoBZFQsisuRd69UB7eGOUdOQ+/a0C6xI3DMvkhNhL03jFINStKvQkcbUp0/ERvbUG410UT7RRg2BopOGw2WRo3JEZSAKH33VOn/RoZk7ntB6kd6iYAQJ7kVW0F2ex8ofsEfgpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774314; c=relaxed/simple;
	bh=Gsme+zfIKoFJ26sAHfvBEk62kt8F+ueupl48uTmKDVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PM2vGoyy0YKBf3zJfxmK2mGS9qa0Gcs+81ynrtIRlqHYPnYVUz2FEtzAspfACpopVXRRNOCSti2R1Mqe7KPof2HtNU0OGnrhl3+B2xl4WhKdECl7Jqo5xnrR2nQax09HWKsuJbLBSX7yIdPYddWGvx5WReCBom+nUV3P+YOic0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tf/fOa/Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tf/fOa/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93DE8C4CEE3;
	Tue, 24 Jun 2025 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750774312;
	bh=Gsme+zfIKoFJ26sAHfvBEk62kt8F+ueupl48uTmKDVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tf/fOa/Z9YL09J+RAROCTsQgtxv5kEUH0A4WKlGicvvMRiHCCZVzCR7LGVCpUG9qk
	 Xtzn4pw+EIJuGxc5IgavWiEL2IigrbwU3/BuLykiTCI05+KplSJhQeDnBFKCcpW5tf
	 38Km+kEZ0muYbF4Bj3AvwUxByLhq0+uYPEiB+RBcRR+SZivaLiQY/JnR/Hpd1m0Ta9
	 ijGhk9Yek8ivVQ5mO8f/98Y/5ZTW+iHV1XaH4SYmYeQDvHfe2faIoZo27iEHWaone8
	 wmFhE/+YEOSKLf+OFC0/7Dhy1TQDYwqtpHtrXdxOIG8cDYAOlOAbdHTpB4xEbW2JOL
	 A1tZTCiGfBVqg==
Date: Tue, 24 Jun 2025 16:11:50 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v5 5/6] cgroup/cpuset: Fail if isolated and nohz_full
 don't leave any housekeeping
Message-ID: <aFqyJiE0EeJdHYd_@localhost.localdomain>
References: <20250508145319.97794-8-gmonaco@redhat.com>
 <20250508145319.97794-13-gmonaco@redhat.com>
 <aCyRhAeGwLSVf2LZ@localhost.localdomain>
 <3acad4a1a07ccbde615ea19eb13a96f37d4a3a2f.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3acad4a1a07ccbde615ea19eb13a96f37d4a3a2f.camel@redhat.com>

(Sorry for the delay, I forgot to reply that one)

Le Fri, May 23, 2025 at 01:15:44PM +0200, Gabriele Monaco a écrit :
> On Tue, 2025-05-20 at 16:28 +0200, Frederic Weisbecker wrote:
> > 
> > Apparently you can't trigger the same with isolcpus=0-6, for some
> > reason.
> > 
> > One last thing, nohz_full makes sure that we never offline the
> > timekeeper
> > (see tick_nohz_cpu_down()). The timekeeper also never shuts down its
> > tick
> > and therefore never go idle, from tmigr perspective, this way when a
> > nohz_full
> > CPU shuts down its tick, it makes sure that its global timers are
> > handled by
> > the timekeeper in last resort, because it's the last global migrator,
> > always
> > alive.
> > 
> > But if the timekeeper is HK_TYPE_DOMAIN, or isolated by cpuset, it
> > will go out
> > of the tmigr hierarchy, breaking the guarantee to have a live global
> > migrator
> > for nohz_full.
> > 
> > That one is a bit more tricky to solve. The easiest is to forbid the
> > timekeeper
> > from ever being made unavailable. It is also possible to migrate the
> > timekeeping duty
> > to another common housekeeper.
> > 
> > We probably need to do the latter...
> 
> I'm thinking about this again, is it really worth the extra complexity?
> 
> The tick CPU is already set as the boot CPU and if the user requests it
> as nohz_full, that's not accepted.

Actually that's possible, unfortunately...

> In my understanding, this typically happens on CPU0 and this CPU is
> kinda special and is advised to stay as housekeeping. As far as I
> understand, when nohz_full is enabled, the tick CPU cannot change.

It can change, fortunately on early boot.

> 
> Said that, I'd reconsider force keeping the tick CPU in the hierarchy
> no matter if we isolate it or not when nohz_full is active (e.g. what
> you mentioned as the /easy/ way).
> We'd not prevent domain isolation (as the user requested), but allow a
> bit more noise just on that CPU for the sake of keeping things simple
> while not falling into dangerous corner cases.
> If that's still a problem for the user, they are probably better off
> either selecting a different mask or setting nohz_full consistently
> (I'm still wondering how common a scenario this is).
> 
> Am I missing something here?

Agreed, forcing the tick CPU to stay in the hierarchy when nohz_full is
enabled is the easiest.

Thanks.

> 
> Thanks,
> Gabriele
> 

-- 
Frederic Weisbecker
SUSE Labs
