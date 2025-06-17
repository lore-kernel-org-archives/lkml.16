Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B512C08BB
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165714; cv=none; b=UkONUMxTIp4LEOZyocrkNNb6wjIbDx3NeuGyZoJZiHkE4IDUBCzEWY/tiuuwuEoYqbibdcUykBgUJU/a5Io5UweyXVTj1iUnMzpie/jjpcBaxyts2mlI0wKz9etg8/aFcz9Durf5j1+a0HpbHTJCafKlP0SmOdwTOPd49pdnO1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165714; c=relaxed/simple;
	bh=AyTUTNLjWBATyHbjVw17F4xXlhTSyaPg3Ia/Umh903s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmO5Cc+6t/RTyjosGBa3QYsFr/XD/4vupPf+txeGnDPoR23ZepvnPXDzFZ5aaOzx14L+QInlwHbO/bCnR9jpqzPCpWcvP1qbMI21cb8jnTgt2JSxZQEcztTg6txGa5pJyMBhK4QGvRYOPjCX0Z9K2PqcENfjbm8YJUV/PRtKwrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAXFordH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAXFordH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11487C4CEE3;
	Tue, 17 Jun 2025 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750165713;
	bh=AyTUTNLjWBATyHbjVw17F4xXlhTSyaPg3Ia/Umh903s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VAXFordHMA/gkCOqFMV4TzCebuHiM2OhA6jWEQ0xosiXV0I9NInpi5EXuWyGH88zh
	 SurVYw0G6Np1BJCX1KBxBERoyw4Docls9aOnWJKIKs5IaWpjEstpImQkomnLLOKfyE
	 h/BrGSKSztVTdpGHfW+8htswPe2S7P1md3KfaWDFbn2pZeitLttcUqvOM3y/jSiBr3
	 cr/mFXTlel/nvZmZr8NlPspQQSDxayRtyJOSiVILcdQFS5CFTPZhusBqSPPPH6uzjT
	 tEmo6yrD8c/ooSKArQfRjiW4U1YLRRrq7lZ381202hYbHcHZNU+MvmMn4sZ4f0FR0q
	 b9jUcR5fuADnA==
Date: Tue, 17 Jun 2025 15:08:30 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v5 0/3] Workqueue: add WQ_PERCPU, system_dfl_wq and
 system_percpu_wq
Message-ID: <aFFozq_dzk8Qn7XN@localhost.localdomain>
References: <20250614133531.76742-1-marco.crivellari@suse.com>
 <aFBj9PXQiw-7O6yQ@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFBj9PXQiw-7O6yQ@slm.duckdns.org>

Le Mon, Jun 16, 2025 at 08:35:32AM -1000, Tejun Heo a écrit :
> On Sat, Jun 14, 2025 at 03:35:28PM +0200, Marco Crivellari wrote:
> > Marco Crivellari (3):
> >   Workqueue: add system_percpu_wq and system_dfl_wq
> >   Workqueue: add new WQ_PERCPU flag
> >   [Doc] Workqueue: add WQ_PERCPU
> 
> Applied 1-3 to wq/for-6.17. I applied as-is but the third patch didn't need
> to be separate. Maybe something to consider for future.

If this is for the next merge window, I guess the easiest is to wait for it
before sending patches to other subsystems to convert them?

I guess we could shortcut that with providing a branch that other subsystems
could pull from but that doesn't look convenient...

Thanks.

> 
> Thanks.
> 
> -- 
> tejun

-- 
Frederic Weisbecker
SUSE Labs
