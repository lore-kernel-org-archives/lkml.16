Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B736010F9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743612050; cv=none; b=SWZffnKvBRKLOJtlXaQK2WfNd8QDNcJBqDXJKM1g6HUe7ViHmZUo1CeCWr+S/0pDwtBDM0zSN5WMBAePgN1bGahdwfqPQHyQRbL5MqDkb6P+aamhocXFCwjQ26cmV6WoqPkMX9KpQ0rre3oizLFaB3Lwl8Xrkf9FAGvMx5QpgUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743612050; c=relaxed/simple;
	bh=8ai0NWyr9jtQ6M5VqMnfVwxl41HFCLq4tElHMoMcia8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAc6cIBGp/anTehauEU3l6Vs/bNNMAZb3LpaXxkLGnqglLZPwaf8xlFRMwe3pEJzWM1APtPT1QDZQplJKYX9FN7yWUMbKayTGhb/IAvl6WnPJMS//CrSCMZiZ6C4+avzW2bKZAgsOMwgrsdOyYp/rHHPRWizxtHKegM1Xphh3uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/QVfx+s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/QVfx+s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73C7C4CEDD;
	Wed,  2 Apr 2025 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743612050;
	bh=8ai0NWyr9jtQ6M5VqMnfVwxl41HFCLq4tElHMoMcia8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/QVfx+sK6hmpazBR8nC8Ncp17MGstzaGvZ0QOOVE9CDOCIeGK1Ejyo05YlF8KpeA
	 w0uslmM+e5YhQ+XJ9KQYZbzMNm1qVJ4zLBwsOfOxgeaq1/iCiJe3De8UGkkkPWBvMz
	 6e7YmmxRlYvJ/5XXvgTePtOcDsDIUIlNJLmf2a7tk66kBd8OuVQuk0pvbxN7aewYQm
	 MZS/QMS/1lteoJjVQ0iiv7sufnA8fJ2coVV9vKowaEbqYjMSe5Z7xyjaxAih4m7q3m
	 uY8NqKKefmLzukadMZkwbJ77yqNKgfyZsSpsRQz7C4p0CnbZw+o6eiRinNzhA1cEN+
	 kDF7Idz0OXhow==
Date: Wed, 2 Apr 2025 18:40:47 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Tejun Heo <tj@kernel.org>, Marco Crivellari <marco.crivellari@suse.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	open list <linux-kernel@vger.kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] workqueue: Always use wq_select_unbound_cpu() for
 WORK_CPU_UNBOUND.
Message-ID: <Z-1oj4zCByGN38J2@localhost.localdomain>
References: <20250221112003.1dSuoGyc@linutronix.de>
 <Z7iSboU-05uMJ7-e@localhost.localdomain>
 <Z7iuUObJGgZtsaJe@slm.duckdns.org>
 <20250226161847.eYrJFpIg@linutronix.de>
 <Z79E_gbWm9j9bkfR@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z79E_gbWm9j9bkfR@slm.duckdns.org>

(Adding Marco who may help us in this long adventure)

Le Wed, Feb 26, 2025 at 06:44:46AM -1000, Tejun Heo a écrit :
> We can rename APIs too and it's going to be a slog, which, to be fair, this
> is going to be no matter what.
> 
> > > 2. There still are cases where local execution isn't required for
> > >    correctness but local & concurrency controlled executions yield
> > >    performance gains. Workqueue API currently doesn't distinguish these two
> > >    cases. We should add a new API which prefers local execution but doesn't
> > >    require it, which can then do what's suggested in this patch.
> > 
> > I see. So we get rid of the old naming and have them something like
> > 	schedule_bound_work()
> > 	schedule_unbound_work()
> > 	schedule_hopefully_local_work()
> 
> If we're renaming, I'd deprecate the schedule_*() interface and always use
> queue_*() and maybe:
> 
> - Replace WQ_UNBOUND with its complement WQ_PERCPU.

This one scares us a bit. Currently the default for alloc_workqueue() is
WQ_PERCPU. After that the default will be the reverse. Even if this
happens as a single patch treewide change, there will be conflicts
in the merge window with new users coming up that will happen to be
unbound whenever they were not intended to.

But there is a way out of that if we are patient:

1) For one release, do a treewide change that introduces WQ_PERCPU and apply
   it to all relevant users. Keep WQ_UNBOUND around for now and warn if neither
   WQ_PERCPU nor WQ_UNBOUND has been passed (this and grep/coccinelle will catch
   missed patches from other trees after the merge window).

2) Once that complete, remove WQ_UNBOUND and its uses on the next release.

How does that sound?

> - Add WQ_PREFER_PERCPU.

This can be done afterward case by case.

> - Rename system_wq -> system_percpu_wq.
> - Add system_prefer_percpu_wq.
> - Rename system_unbound_wq -> system_dfl_wq.

Easy steps.

Thanks!
