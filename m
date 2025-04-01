Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB09B673
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496334; cv=none; b=u2WSwF79cGMa8S7AHCPO2DpILH5tmBtwTeMIkGUtotiGlnmQ7fWpsInnDvsJCfqf7H/0haFXwILSJAvUxMJbcSOHIxo/yc6As8JkVd2Sz5qNS5dHkUoAEtQEM8R28dTuFcBcwQVFy86giFlfy4Egv2/7RofnD1rpG0PBTcKv7uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496334; c=relaxed/simple;
	bh=cB4oVElOXCQnDKa4vJJKZ8rMOzrlLVc5WT0Ze16BulQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4utl0XD2+nr49TtPo2h9QJjXez4vM8+bx4kG8W0h3zbGzLTiO3PLplPziCQJhcd8ggWQtAw51uZ27hVQhPLWSNj/H9OoUhjosedF1E0MpiXSRIdAl+6+7o6oiSFzcG77Ry7MQv06XEX7JAmYS9g2kNk5VGb4dGR0/xtWvihyc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B952C150C;
	Tue,  1 Apr 2025 01:32:15 -0700 (PDT)
Received: from [10.17.201.184] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 518C03F63F;
	Tue,  1 Apr 2025 01:32:07 -0700 (PDT)
Message-ID: <837ee35a-ffa4-4ed7-a1c4-be97db3087f8@arm.com>
Date: Tue, 1 Apr 2025 10:32:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched/uclamp: Align uclamp and util_est and call
 before freq update
To: Xuewen Yan <xuewen.yan@unisoc.com>, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org
Cc: rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, hongyan.xia2@arm.com, qyousef@layalina.io,
 ke.wang@unisoc.com, di.shen@unisoc.com, linux-kernel@vger.kernel.org,
 xuewen.yan94@gmail.com
References: <20250325014733.18405-1-xuewen.yan@unisoc.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250325014733.18405-1-xuewen.yan@unisoc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/03/2025 02:47, Xuewen Yan wrote:
> When task's uclamp is set, we hope that the CPU frequency
> can increase as quickly as possible when the task is enqueued.
> Because the cpu frequency updating happens during the enqueue_task(),
> so the rq's uclamp needs to be updated before the task is enqueued,
> just like util_est.
> So, aline the uclamp and util_est and call before freq update.
> 
> For sched-delayed tasks, the rq uclamp/util_est should only be updated
> when they are enqueued upon being awakened.
> So simply the logic of util_est's enqueue/dequeue check.
> 
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> ---
> v2:
> - simply the util-est's en/dequeue check;
> ---
> Previous discussion:
> https://lore.kernel.org/all/CAB8ipk8pEvOtCm-d0o1rsekwxPWUHk9iBGtt9TLTWW-iWTQKiA@mail.gmail.com/
> https://lore.kernel.org/all/84441660bef0a5e67fd09dc3787178d0276dad31.1740664400.git.hongyan.xia2@arm.com/T/#u
> https://lore.kernel.org/all/CAB8ipk9LpbiUDnbcV6+59+Sa=Ai7tFzO===mpLD3obNdV4=J-A@mail.gmail.com/T/#u
> https://lore.kernel.org/all/aa8baf67-a8ec-4ad8-a6a8-afdcd7036771@arm.com/

LGTM.

Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
