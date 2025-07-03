Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC5E1B95B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537874; cv=none; b=PL1bAy3iVnsbH5TEOAJV3QghymSnd5nWZzjkqmJ+vB/m7LmGd/LIKI032zQGnMKY600ZdnI1anFzRXdqbklS/y8E/Tr+JvW8dD6rHVPEtHz09nfSqWcfnEEeYTkpmbFZkAeOhLPs7Zya/MjOEDkekIHq7wI4+9rgANaTsaxnB4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537874; c=relaxed/simple;
	bh=ER02OiMo1j2b8+tomvM5c3wginFDh0J7GTUTjj6coh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqGHDw400oPP2p5LnUESqLo3YjPGJuduLORl3O+wJ6hhaPp53P7vfenKhMzI2/uEt0BCFRn3T8YqGpqPQ14avDRb9kwzCknO1TRuhKLaadFK1bzOazk7UUu/AWi7fJg1/6nU73YkKNAsWhwtrWe/pSGM+9TcDjhivbH869wQ6XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1718B1596;
	Thu,  3 Jul 2025 03:17:37 -0700 (PDT)
Received: from [10.1.37.73] (unknown [10.1.37.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A1593F58B;
	Thu,  3 Jul 2025 03:17:46 -0700 (PDT)
Message-ID: <8a64cb22-24f7-4ca7-8e4e-22e1612124d9@arm.com>
Date: Thu, 3 Jul 2025 11:17:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/uclamp: Exclude kernel threads from uclamp logic
To: Zihuan Zhang <zhangzihuan@kylinos.cn>, xuewen.yan@unisoc.com,
 vincent.guittot@linaro.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com
Cc: rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, hongyan.xia2@arm.com, linux-kernel@vger.kernel.org,
 ke.wang@unisoc.com, di.shen@unisoc.com, xuewen.yan94@gmail.com,
 kprateek.nayak@amd.com, kuyo.chang@mediatek.com, juju.sung@mediatek.com,
 qyousef@layalina.io
References: <20250703091437.79861-1-zhangzihuan@kylinos.cn>
 <675563a5-8f1d-4249-9828-9fb353dd7dd1@arm.com>
 <6414cb05-11d3-4b2a-ae97-7bb0ca0ea898@kylinos.cn>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <6414cb05-11d3-4b2a-ae97-7bb0ca0ea898@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/3/25 11:07, Zihuan Zhang wrote:
> Hi Christian,
> 
> Thanks for the question!
> 
> 在 2025/7/3 17:22, Christian Loehle 写道:
>> On 7/3/25 10:14, Zihuan Zhang wrote:
>>> Kernel threads (PF_KTHREAD) are not subject to user-defined utilization
>>> clamping. They do not represent user workloads and should not participate
>>> in any uclamp logic, including:
>> Why not?
>>
> As Xuewen mentioned, some kernel threads may intentionally set scheduling attributes for performance. So instead of unconditionally excluding all kernel threads, I’m now considering a more conservative approach:
> skip only those kthreads that haven’t explicitly set any clamp values.
> 
> This should help avoid unintended clamp aggregation while still supporting performance-tuned kthreads.

I'm skeptical, fundamentally you cannot exclude some fair tasks from uclamp logic.
At least the cpufreq part they will be affected by, so if you 'exclude' some
kthread that doesn't have clamps set (i.e. has min=0, max=1024) its
utilization may not contribute to sugov frequency selection by being
clamped by other task(s) (let's say you only have one other task with 
max=0, excluding the unclamped kthread now leads to sugov requesting
the lowest OPP? Is that always correct/desired?)

Is there a specific issue you're trying to solve?
FYI there has been discussion around reworking the uclamp mechanism to solve
some issues you may have been facing, but so far they haven't lead anywhere:
https://lore.kernel.org/lkml/cover.1741091349.git.hongyan.xia2@arm.com/

