Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D50A24676A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749578342; cv=none; b=ftJiPM+1fTc90eRI/EEbj9vTrtp40AQpI4Vg9n3B3VryL2VFOleakWga4kixfK66T9O/9HZLTpafEf05PRhR8/uLLdpionnUT4+Dm/GETHBbs90tg/PQp8m7gixLh8TN9EbwEpXKVxrG9NB+tNKbFOqHrtUZAD1rJEBHCsjC/hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749578342; c=relaxed/simple;
	bh=Tj1nxpN0VKwKazhrIR1THN30dPk4WOklRSgTT2qH1L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2GsMVyJYjCNd1LxeHgW9oNzymEhh/RIlM5eKzsRdReTmIjNFH9c4Es9R4J8qDBvknnxvOvhDhlL5OTLvSAi/W9Q6MbQ1mo99mo9j3pDtS658DXcHhsp3jwnrP/OM+7r1+uCD0DkOaRDYtYrFqN1V6FbpXfW8QlJpi8LLW7J24c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUAOj73m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUAOj73m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C50C4CEED;
	Tue, 10 Jun 2025 17:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749578341;
	bh=Tj1nxpN0VKwKazhrIR1THN30dPk4WOklRSgTT2qH1L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUAOj73m8NkJBVjICfvxAoj7ZppOE5j0JIQjuhD8iIaXILCOjnBJFKEbFGBNrQCrE
	 auTjEPvJ0hVfadckocEo95vK4PRHDLEMj/VzJPTXmXXjrKYK1SzwFG/o0Dhr+mLIdV
	 Eqig1ITzDF8sfTrphTfSBI+fF1RL25Mb+tzBmjDeNhQvsp9Jet0zexw3jNkRmMTkWv
	 LfP81znTIreU4Y2TMEZjPbTOcWTVbvS8+J+obMUqwQ5YqG5uIFZjAgQ7JQe8KiWeRS
	 pMceI3W7/MhztlaxzEUv4+d/sv8d9aPjaQ+0lNQRkrmm9v5+lGzbTUcKZL+EcEiw2b
	 wmqOknzh8Rk1A==
Date: Tue, 10 Jun 2025 07:59:00 -1000
From: 'Tejun Heo' <tj@kernel.org>
To: liuwenfang <liuwenfang@honor.com>
Cc: 'David Vernet' <void@manifault.com>, 'Andrea Righi' <arighi@nvidia.com>,
	'Changwoo Min' <changwoo@igalia.com>,
	'Ingo Molnar' <mingo@redhat.com>,
	'Peter Zijlstra' <peterz@infradead.org>,
	'Juri Lelli' <juri.lelli@redhat.com>,
	'Vincent Guittot' <vincent.guittot@linaro.org>,
	'Dietmar Eggemann' <dietmar.eggemann@arm.com>,
	'Steven Rostedt' <rostedt@goodmis.org>,
	'Ben Segall' <bsegall@google.com>, 'Mel Gorman' <mgorman@suse.de>,
	'Valentin Schneider' <vschneid@redhat.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: Re: [PATCH] sched_ext: introduce cpu tick
Message-ID: <aEhyZJmjhYJfVe9v@slm.duckdns.org>
References: <2d771c1f293845e09edf73f5db5b2837@honor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d771c1f293845e09edf73f5db5b2837@honor.com>

Hello,

On Tue, Jun 10, 2025 at 08:59:45AM +0000, liuwenfang wrote:
> Assume one CPU is running one RT task and one runnable scx task on
> its local dsq, the scx task cannot be scheduled until RT task enters
> sleep, if RT task will run for 100ms, the scx task should be migrated
> to other dsqs, then it can have a chance to be scheduled by other CPUs.
> 
> So cpu_tick is added to notitfy BPF scheduler to check long runnable
> scx on its local dsq, related policy can be taken to improve the
> performance.

(cc'ing Kumar as we discussed similar issue recently)

There are some race conditions we need to address but calling
scx_bpf_reenqueue_local() from ops.cpu_release() is the intended way of
handling these situations. I don't think periodically polling from ticks is
a good approach, especially given that ticks can be skipped w/ nohz_full.

Thanks.

-- 
tejun
