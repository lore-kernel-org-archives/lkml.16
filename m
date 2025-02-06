Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA0A225760
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738824388; cv=none; b=Q7Xf6VvAJj2FoqbenslFgJAzM1oyq5ihCepXMS6GDHjxGpn8kv8QtsOAMoANd4m4sAyKXSTINg1nLn+EZjl0DUbUn+9MQM4gf275CpkVKYetHpJj5po+uy1qhg7fHJBwn7XrXyEQmgJJZwiog3yly2MaNhLua9zJ/VH77o1BTUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738824388; c=relaxed/simple;
	bh=L/04Y76RLArXwdFii0mJtBTfcSdeQFU6jkHVLh9O17I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K8LkE4yQ0QsmdViNrqW5rZvMtSo32W89jdtgDYg8ghkcBBkVKDhLaqDnBnPy98fHsuqExnlW+TaM8gXeMhtb0DdmD4TVAzik+KrFYmE3YYEewJnZzQrQNVbYDzqDH87/8HDIPouCGK9d6UlqyEVBxSMAxJqDYmhQ7x4lq8ozPNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CoE5a86r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CoE5a86r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD725C4CEE5;
	Thu,  6 Feb 2025 06:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738824388;
	bh=L/04Y76RLArXwdFii0mJtBTfcSdeQFU6jkHVLh9O17I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CoE5a86ris0IpWocXajhAtzTjF7wF76YDX55jHiMlo14Mjc/i3UBb3864/TVtlzOi
	 81Kl0BzNU7RrcHX5bhm53cYxkcc/T2hLaVlprbofXwWJ4Zz5YISrU9mlSHOuEN+2wf
	 Pa/1UhWaxAmMW0cZbVvTvfAzTaV9iawAxSAsuebOB8OpmBXVSJw2xrYF5Ht2DrrcXQ
	 Mw2xQu5W1Elzoxqg9/AublBW1yH6BqMF4FxyctC9a50tkGjfjpFxvuyHroCffZEP2H
	 5Jq2etxnWlfhy4Z3yBjSLcnC29KHo9Yh2kCERYNxS0MzaanDQTXfuV5qbi5A6hB4dH
	 j6ejlkS29g4NA==
From: SeongJae Park <sj@kernel.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: SeongJae Park <sj@kernel.org>,
	Bharata B Rao <bharata@amd.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Raghavendra K T <raghavendra.kt@amd.com>,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	lsf-pc@lists.linux-foundation.org,
	gourry@gourry.net,
	nehagholkar@meta.com,
	abhishekd@meta.com,
	ying.huang@linux.alibaba.com,
	nphamcs@gmail.com,
	feng.tang@intel.com,
	kbusch@meta.com,
	Hasan.Maruf@amd.com,
	david@redhat.com,
	willy@infradead.org,
	k.shutemov@gmail.com,
	mgorman@techsingularity.net,
	vbabka@suse.cz,
	hughd@google.com,
	rientjes@google.com,
	shy828301@gmail.com,
	liam.howlett@oracle.com,
	peterz@infradead.org,
	mingo@redhat.com,
	nadav.amit@gmail.com,
	shivankg@amd.com,
	ziy@nvidia.com,
	jhubbard@nvidia.com,
	AneeshKumar.KizhakeVeetil@arm.com,
	linux-kernel@vger.kernel.org,
	jon.grimm@amd.com,
	santosh.shukla@amd.com,
	Michael.Day@amd.com,
	riel@surriel.com,
	weixugc@google.com,
	leesuyeon0506@gmail.com,
	honggyu.kim@sk.com,
	leillc@google.com,
	kmanaouil.dev@gmail.com,
	rppt@kernel.org,
	dave.hansen@intel.com
Subject: Re: [LSF/MM/BPF TOPIC] Unifying sources of page temperature information - what info is actually wanted?
Date: Wed,  5 Feb 2025 22:46:24 -0800
Message-Id: <20250206064624.3225-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205160529.GB1183495@cmpxchg.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 5 Feb 2025 11:05:29 -0500 Johannes Weiner <hannes@cmpxchg.org> wrote:

> On Wed, Feb 05, 2025 at 11:54:05AM +0530, Bharata B Rao wrote:
> > On 31-Jan-25 6:39 PM, Jonathan Cameron wrote:
> > > On Fri, 31 Jan 2025 12:28:03 +0000
> > > Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
[...]
> > Here is a compilation of available temperature sources and how the 
> > hot/access data is consumed by different subsystems:
> 
> This is super useful, thanks for collecting this.

Indeed.  Thank you Bharata!

[...]
> For the following table, it might be useful to add *when* the source
> produces this information.  Sampling frequency is a likely challenge:
> consumers have different requirements, and overhead should be limited
> to the minimum required to serve enabled consumers.

+1

> 
> Here is an (incomplete) attempt - sorry about the long lines:
> 
> > And here is an attempt to compile how different subsystems
> > use the above data:
> > ==============================================================
> > Source			Subsystem		Consumption         Activation/Frequency
[...]
> > ==============================================================
> > PTE A bit via		DAMON		LRU activation,                     Continuous sampling (configurable)?
> > rmap walk				hot page promotion,                 (I believe SJ is looking into
> > 					demotion etc                         auto-tuning this).

You're right.  I'm working on auto-tuning of the sampling/aggregation intervals
of DAMON based on its tuning guide theory[1].  Hopefully I will be able to post
an RFC patch series within a couple of weeks.

> > ==============================================================
> > Platform hints		NUMAB		NUMAB=1 Locality based
> > (AMD IBS)				balancing and
> > 					NUMAB=2 hot page
> > 					promotion
> > ==============================================================
> > Device hints		NUMAB		NUMAB=2 hot page
> > 					promotion
> > ==============================================================
> > The last two are listed as possibilities.

I'm also trying to extend DAMON to use PROT_NONE faults and AMD IBS like access
check sources.  Hopefully I will share more details of the plan and experiment
results for the PROT_NONE faults extension by LSFMMBPF.

[1] https://lore.kernel.org/20241202175459.2005526-1-sj@kernel.org


Thanks,
SJ

[...]
