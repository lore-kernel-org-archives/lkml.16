Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FD623BD09
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749591901; cv=none; b=ccQJ8nuXgQd0RIgGiatIsTiGnT7kMx1nJkC/B1ylV0B2aHoD42bEThrtytiRNYq+5XpB/9WK8WTYznj6jSOMDTlnzd19gpAON9t0Vvh5dnQmLFS0oPeCqj4VXGTxR0yasirAzvvnEQTt9M8xrabD/rAO8keI8QZUTxB6csf3yZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749591901; c=relaxed/simple;
	bh=GiejgXeKLvAfaPGXBmgkTBUHP6Y+D5GJRgNwYfn5veU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBoQa6hzOp9w6Gr4jX8ihZCK4H3VO7cQW+so1dKF/MKsJf4KvwpT+73AG6Oyz+fjTvqqZbbAJyQVmsuE+eiE1Q0wjQ/qywafmnMhdg6rk2lQFAn0tiSokmWR35uWbARhOxfqVTUQgs5Py7dW8R3pP2oFHeWQlLWHffy80BJVgAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cm4CGng4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cm4CGng4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C6FC4CEED;
	Tue, 10 Jun 2025 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749591900;
	bh=GiejgXeKLvAfaPGXBmgkTBUHP6Y+D5GJRgNwYfn5veU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cm4CGng439oBrGEfkUUn13VaJkpAMs3GmoJeVqEUCN+vgFyoipTaefuP5UKjPM3jD
	 /n5ptLn0TZVdq7pGVSTQYA2HZfygZyu3A91BIgQbONfvpxMH4EM45WSuSJJnsv2ipK
	 zjFD4RB+vKXSsE/nSGJpNz7h7eaRyTU5UNVANJUtjElRCfWhTxgc875mD9yZDuD6YH
	 qYyDx35OxJ/AQeY3eYtMaWfvDu3PSwnFxZGP8kWPxR1NPWvgFHBUx6zy5zD3U8bgAi
	 dAza/TeNuA7LUfMqlg98ZMpMavLE4xkDDoVMWQSJndz+te/1l6ePZoyI9ts5l+Swnz
	 eDgkCwZV/QIyQ==
Date: Tue, 10 Jun 2025 11:44:59 -1000
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v2 2/4] Workqueue: add system_dfl_wq
Message-ID: <aEinW8EpI2x6JrnO@slm.duckdns.org>
References: <20250609103535.780069-1-marco.crivellari@suse.com>
 <20250609103535.780069-3-marco.crivellari@suse.com>
 <CAJhGHyBVWDKXfMLT3LBKFUu9ot2uRk=1xLebGf_Grh_j1_VOSg@mail.gmail.com>
 <CAAofZF7KRtTzLk7hhBSAirQ=sstmQG2gxGtbTW6LseNFzrxK1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAofZF7KRtTzLk7hhBSAirQ=sstmQG2gxGtbTW6LseNFzrxK1g@mail.gmail.com>

Hello,

On Tue, Jun 10, 2025 at 10:56:13AM +0200, Marco Crivellari wrote:
> >What is the reason for removing system_unbound_wq? I believe system_unbound_wq
> >is a perfectly appropriate and descriptive name for its callers. I’m not opposed
> >to system_dfl_wq as long as it will be an alias for system_unbound_wq (or even
> >system_percpu_wq, if that can be configured at boot time by sysadim).
> 
> The rename to system_dfl_wq is mostly to make sure this is the default wq choice
> when per-cpu is not strictly needed.
> It has been proposed here, anyhow:
> 
> https://lore.kernel.org/all/Z79E_gbWm9j9bkfR@slm.duckdns.org/

I think we ultimately want to converge on one thing and I think it does make
sense to make one behavior default over the other. ie. If we make percpu the
flavor that requires explicit designation, unbound by default becomes the
default. ie. I don't want a situation where there are system_percpu_wq and
system_unbound_wq as it's not clear which one is preferred, and if we add
system_dfl_wq to clarify the situation, at least in the long term, having
another alias for it makes things unnecessarily confusing.

So, if we're flipping the default, I'd rather remove the unbound name from
the interface. We can keep using unbound inside workqueue implementation of
course.

Thanks.

-- 
tejun
