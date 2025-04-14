Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642D825D525
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620903; cv=none; b=j4lehA36IyJIapRuz94VlmeWM9TzxO90gYZWsTRFbUIEMjFH4Bhezu0tDpfDHiPXqMUNhZzdZ0Q2m+bkx6Cbd0n77Hjbe8ce0pNtcO3KfDdmNBJYbmNWDn264s8RJKkHPqE9YPwbA3zeKEjaw3uXUQSFbjpeauenbW51uI4+OJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620903; c=relaxed/simple;
	bh=GICOfrRPaM3VxAz9clYPC3DMT67npjEodJIQmPxsfoI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QMuK5zhDDq9vTwj7cOc+D3QxCVBAugiLe5NHblveJ2gcFyb/rf/TSdaGxTk+sY6GHIO2wc3/ZToylOXAz8Lc3LEmOxCYbRxYTh1MbqzSO+handlb4C5Oy4PxnqErmKOnbNcvNQfXZnS2TBLxcA9iJf1JMPPfpSykMUP95oUEurI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b=YNo2GH5K; arc=none smtp.client-ip=185.136.65.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b="YNo2GH5K"
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250414085449f2c4fe3c6abb47b6f7
        for <linux-kernel@vger.kernel.org>;
        Mon, 14 Apr 2025 10:54:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=GICOfrRPaM3VxAz9clYPC3DMT67npjEodJIQmPxsfoI=;
 b=YNo2GH5Kh9fDsXfXE/Esxi2Qo+pNEy4aa/1ep+ivcddTzhHUbsCqQnoOLe0ZhHvcuwECPq
 UBg+uHLNjzpjJSIsAyx7Xh/r7JakZu8B/9THAf6eaEB5YX7yBUXMiHLGOwEYZ2nevtuB3HvN
 pDfxizKatApAoR3zwT8cd+K0fkOYAPBOGuDz6vCF8MUyb9YZ+xhEj83YpaaB0MzSL7EgL98l
 P2roX6TbWQiclrphKNKeQUwZVrBB6LilTvu7uZgXZFydvL9+I9GKKah9iUxaK6LzZStrv1NI
 me/sDHx2hrSvO8sDgVXX5O8WKKdKTksZWCHUu2Tmc5Gg3ybqGs1uTs5Q==;
Message-ID: <cee5bca4e2b024d3406b40b84c0d5db91c7d276f.camel@siemens.com>
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Aaron Lu <ziqianlu@bytedance.com>, Valentin Schneider
 <vschneid@redhat.com>,  Ben Segall <bsegall@google.com>, K Prateek Nayak
 <kprateek.nayak@amd.com>, Peter Zijlstra	 <peterz@infradead.org>, Josh Don
 <joshdon@google.com>, Ingo Molnar	 <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang	 <xii@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,  Chengming Zhou
 <chengming.zhou@linux.dev>, Chuyi Zhou <zhouchuyi@bytedance.com>, Jan
 Kiszka	 <jan.kiszka@siemens.com>
Date: Mon, 14 Apr 2025 10:54:48 +0200
In-Reply-To: <20250409120746.635476-1-ziqianlu@bytedance.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer

Hi Aaron, Hi Valentin,

On Wed, 2025-04-09 at 20:07 +0800, Aaron Lu wrote:
> This is a continuous work based on Valentin Schneider's posting here:
> Subject: [RFC PATCH v3 00/10] sched/fair: Defer CFS throttle to user entr=
y
> https://lore.kernel.org/lkml/20240711130004.2157737-1-vschneid@redhat.com=
/
>=20
> Valentin has described the problem very well in the above link. We also
> have task hung problem from time to time in our environment due to cfs qu=
ota.
> It is mostly visible with rwsem: when a reader is throttled, writer comes=
 in
> and has to wait, the writer also makes all subsequent readers wait,
> causing problems of priority inversion or even whole system hung.

for testing purposes I backported this series to 6.14. We're currently
hunting for a sporadic bug with PREEMPT_RT enabled. We see RCU stalls
and complete system freezes after a couple of days with some container
workload deployed. See [1].=C2=A0

It's too early to report "success", but this series seems to fix the
circular dependency / system hang. Testing is still ongoing.

While backporting I noticed some minor code style "issues". I will post
them afterwards. Feel free to ignore...

Best regards,
Florian

[1] https://lore.kernel.org/linux-rt-users/20250409135720.YuroItHp@linutron=
ix.de/T/#t


