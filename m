Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2F9288C32
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751887719; cv=none; b=Wr4SoNBA6zkbHM4F6/fIbMsArarYhxpVA/ocCe6KIa+jszRjNK2XV86oHdtRprie1bJnLdk24v/WLCakCiUahNBGPKOzragSrZyLG4qZlJRlfx2iTMeURU/Ml53e1lCkEzbDFVDQp0a3xT0ObzcsU/BgVpTAYgi6mlJOMCIaCbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751887719; c=relaxed/simple;
	bh=EA0hpz1UbcidrfIudaAkghUylB3IlkSpgXf2f5joHZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFT4EMK9Mb/lTdRC75XGD9GSgv9Qd/kwXSAuJPhmIdZpA8tzIZWktC5euzUO5hO/gvDYR7OFZBDtPcgV0C2uhvwzF5fFCgbLu6lapMMCdgc8o2dl//FDQOrUP88XuIDKoO5dz8kez4QcdWvteIEhRFS/or0ymKDpn1jflfbJPV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJxlFdSS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJxlFdSS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17403C4CEE3;
	Mon,  7 Jul 2025 11:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751887717;
	bh=EA0hpz1UbcidrfIudaAkghUylB3IlkSpgXf2f5joHZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJxlFdSS3WDgLvMAFDVDS0opoBzXxi8jYos6Doi52ULQNW7f0osIGoNdmEuhHnVqo
	 5FIKWuE7i0VbshYfV2dfOj4qcMV+MiDMY2fv5eFHnTwLlTpH4juiQPg5bKkXlhu0DT
	 iYiYNodZcciD15TFILEIUdtPRNWc+Ft1jRMjtquFpmlBOLylA+5wit7WLm3/QYJYfH
	 EdLAiFK6iVGEiyZ1jkpgG95CTflqWfNTf26iVz4bUzLDSrblIKJQnonHi1NwCfhbov
	 /UYTUxvcwAN0nMGYybRdaO/h9LWStBgWnePYeCEC4HCXUJiw96SIVy1R1mnovbknJX
	 6fGlz8nYa+fgw==
Date: Mon, 7 Jul 2025 13:28:34 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v7 5/7] sched/isolation: Force housekeeping if isolcpus
 and nohz_full don't leave any
Message-ID: <aGuvYlexf7wZxUG3@localhost.localdomain>
References: <20250626114900.106061-1-gmonaco@redhat.com>
 <20250626114900.106061-6-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626114900.106061-6-gmonaco@redhat.com>

Le Thu, Jun 26, 2025 at 01:48:58PM +0200, Gabriele Monaco a écrit :
> Currently the user can set up isolcpus and nohz_full in such a way that
> leaves no housekeeping CPU (i.e. no CPU that is neither domain isolated
> nor nohz full). This can be a problem for other subsystems (e.g. the
> timer wheel imgration).
> 
> Prevent this configuration by invalidating the last setting in case the
> union of isolcpus and nohz_full covers all CPUs.
> 
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
