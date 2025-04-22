Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D417253F1F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335649; cv=none; b=MMgAejUqSpmmg52m6LcUAQ2u/+w01o+QA7HBTzwvNvk48NsSTxXGgZH0XhwxMCV+ZmegJv86t7NDaEx8n8dS1t9zfD/WBDUTgabxmb4F9w1jZbxL9U+CTppaLDJ5Bj/iOcIyskuOUcJYfC5YNevXtm2PGazv7ynmhZFQQsKP0pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335649; c=relaxed/simple;
	bh=RqAjqW/oeuHqI2V+Z2PRLJKUi9Cjf4AXtQ9+pGczJtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNzhFg1HicAbNUXpABa0H6Tu1ZV00XubuHTze5N5A/7PilNwBsdyeKY+oKWof24Zh+a3a6bXPUZy0FJvQ1rpp7+N+3+LejLZkkuj7MWph8cKdWWVGbUBzgsrEPvC8nvh83MyMPuc7u7JeBMNongvQbnKhKYCD2o4cS3r6HzV5IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1FAA152B;
	Tue, 22 Apr 2025 08:27:20 -0700 (PDT)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F2073F5A1;
	Tue, 22 Apr 2025 08:27:22 -0700 (PDT)
Message-ID: <77de8033-4364-44a5-b21b-ffe511b8f5d3@arm.com>
Date: Tue, 22 Apr 2025 17:27:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/2] sched: Align uclamp and util_est
To: Xuewen Yan <xuewen.yan@unisoc.com>, vincent.guittot@linaro.org,
 mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com
Cc: rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, hongyan.xia2@arm.com, linux-kernel@vger.kernel.org,
 ke.wang@unisoc.com, di.shen@unisoc.com, xuewen.yan94@gmail.com,
 kprateek.nayak@amd.com, kuyo.chang@mediatek.com, juju.sung@mediatek.com,
 qyousef@layalina.io
References: <20250417043457.10632-1-xuewen.yan@unisoc.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250417043457.10632-1-xuewen.yan@unisoc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2025 06:34, Xuewen Yan wrote:
> Now, both uclamp and util_est have been adapted for DELAYED_DEQUEUE,
> and the double enqueue/dequeue issue no longer exists.
> However, there is still room for optimization in both uclamp and util_est.
> Previous discussions as following:
> https://lore.kernel.org/all/CAB8ipk8pEvOtCm-d0o1rsekwxPWUHk9iBGtt9TLTWW-iWTQKiA@mail.gmail.com/
> https://lore.kernel.org/all/84441660bef0a5e67fd09dc3787178d0276dad31.1740664400.git.hongyan.xia2@arm.com/T/#u
> https://lore.kernel.org/all/CAB8ipk9LpbiUDnbcV6+59+Sa=Ai7tFzO===mpLD3obNdV4=J-A@mail.gmail.com/T/#u
> https://lore.kernel.org/all/aa8baf67-a8ec-4ad8-a6a8-afdcd7036771@arm.com/
> https://lore.kernel.org/all/20250325014733.18405-1-xuewen.yan@unisoc.com/
> 
> patch[1]: Simply the condition for util_est_dequeue/enqueue; 
> patch[2] aligns uclamp and util_est and call before freq update to improve
> the performance and power.
> 
> Xuewen Yan (2):
>   sched/util_est: Simply the condition for util_est_dequeue/enqueue
>   sched/uclamp: Align uclamp and util_est and call before freq update
> 
>  kernel/sched/core.c | 17 ++++++++++-------
>  kernel/sched/fair.c |  4 ++--
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 
> ---
> v3:
> - split previous patch in 2 patches.
>  
> v2:
> - simply the util-est's en/dequeue check;
> ---

LGTM.

Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>

I assume you can add Hongyan's test tag from:
https://lkml.kernel.org/r/be0cace9-d173-4de3-959e-861876ad77fc@arm.com
as well.

