Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D4192B74
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120306; cv=none; b=fgSrn5CRGDJGE+WtLtFSf/FtD0nKffR3UDqlTZ7xOGC5bcCABPoH7XUg0MX+qqkSuSf/szVmFtyL/Nui5uWsp0GWAJl5SMPVchV6V3VHXei9zvzC1mGFlORuV0oUoBT0HUJQ/ipdb84QOJvdP7orUfNCOlVTXgZUPYtYFNtltKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120306; c=relaxed/simple;
	bh=Br0GpRlk/gY9ofBH+m/PPCzq+CoPXPpfMa4/xvKfTb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WbQE9KVDWDeIEY0WZGR8pI6tmOFUN7r9J5sNS0tHqfw0HmoiiwrpTX2Cmntvji8tQ9T54K0qAC4nl/1E3YTB+kUgdo79Bs2vegOwN5yBrm9upQXH2pkX28Vad8R1UHgP1FfxGGf1gPmPscwGt9tXkuw2MWX3JfqdMedebp5Auc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=MDJYeEQB; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="MDJYeEQB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q/bfPzkRTCHaIEjZzcNTugsXIizQo2IiLgYO9ErpqcY=; b=MDJYeEQB8aaDQMZXqrV8Hqx/3D
	/u8s32a2H4xo1Rcwf9SWBGeMqWEj+NKmeF05TDv0aPTzbrLnAVAFK8YiySbyThtAATgR2toJscpzz
	eNb3ZT4ICg0JyjUbx57Woo+Ye+fxgjHF6z0vcDpPzno3knNcEK9d9xTlmiQgCm26L/8+6nTT9aSZf
	Utu+28P9XgUpELK3w1RO8uRMv9hBwuINKgWJ39HB1Y/OPtUWZlKYZ+f/6Spiowx4d7Tx3j62ZGGli
	F7bKjdTGfWpGAKE/sR/S9R3l2VfybAPiwjB3kwpkjUW0S2RNMo7Agfrp64z11KbLepjDwHEby2uxL
	iiOhlleQ==;
Received: from [187.57.129.172] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u29MT-00DKtT-Tg; Tue, 08 Apr 2025 15:51:34 +0200
Message-ID: <df442511-8a3d-496b-bd7f-a1c7b0973a3c@igalia.com>
Date: Tue, 8 Apr 2025 10:51:29 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/19] futex: Add support task local hash maps,
 FUTEX2_NUMA and FUTEX2_MPOL
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250407155742.968816-1-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sebastian,

Thanks for your patchset. I think the perf support is great, but usually 
those new uAPI options should come with some selftests too.

Em 07/04/2025 12:57, Sebastian Andrzej Siewior escreveu:
> this is a follow up on
>          https://lore.kernel.org/ZwVOMgBMxrw7BU9A@jlelli-thinkpadt14gen4.remote.csb
> 
> and adds support for task local futex_hash_bucket.
> 
> This is the local hash map series with PeterZ FUTEX2_NUMA and
> FUTEX2_MPOL plus a few fixes on top.
> 
> The complete tree is at
>          https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git/log/?h=futex_local_v11
>          https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v11
> 
> v10…v11: https://lore.kernel.org/all/20250312151634.2183278-1-bigeasy@linutronix.de
>    - PeterZ' fixups, changes to the local hash series have been folded
>      into the earlier patches so things are not added and renamed later
>      and the functionality is changed.
> 
>    - vmalloc_huge() has been implemented on top of vmalloc_huge_node()
>      and the NOMMU bots have been adjusted. akpm asked for this.
> 
>    - wake_up_var() has been removed from __futex_pivot_hash(). It is
>      enough to wake the userspace waiter after the final put so it can
>      perform the resize itself.
> 
>    - Changed to logic in futex_pivot_pending() so it does not block for
>      the user. It waits for __futex_pivot_hash() which follows the logic
>      in __futex_pivot_hash().
> 
>    - Updated kernel doc for __futex_hash().
> 
>    - Patches 17+ are new:
>      - Wire up PR_FUTEX_HASH_SET_SLOTS in "perf bench futex"
>      - Add "immutable" mode to PR_FUTEX_HASH_SET_SLOTS to avoid resizing
>        the local hash any further. This avoids rcuref usage which is
>        noticeable in "perf bench futex hash"
> 
> Peter Zijlstra (8):
>    mm: Add vmalloc_huge_node()
>    futex: Move futex_queue() into futex_wait_setup()
>    futex: Pull futex_hash() out of futex_q_lock()
>    futex: Create hb scopes
>    futex: Create futex_hash() get/put class
>    futex: Create private_hash() get/put class
>    futex: Implement FUTEX2_NUMA
>    futex: Implement FUTEX2_MPOL
> 
> Sebastian Andrzej Siewior (11):
>    rcuref: Provide rcuref_is_dead().
>    futex: Acquire a hash reference in futex_wait_multiple_setup().
>    futex: Decrease the waiter count before the unlock operation.
>    futex: Introduce futex_q_lockptr_lock().
>    futex: Create helper function to initialize a hash slot.
>    futex: Add basic infrastructure for local task local hash.
>    futex: Allow automatic allocation of process wide futex hash.
>    futex: Allow to resize the private local hash.
>    tools headers: Synchronize prctl.h ABI header
>    tools/perf: Allow to select the number of hash buckets.
>    futex: Allow to make the private hash immutable.
> 
>   include/linux/futex.h                  |  36 +-
>   include/linux/mm_types.h               |   7 +-
>   include/linux/mmap_lock.h              |   4 +
>   include/linux/rcuref.h                 |  22 +-
>   include/linux/vmalloc.h                |   9 +-
>   include/uapi/linux/futex.h             |  10 +-
>   include/uapi/linux/prctl.h             |   6 +
>   init/Kconfig                           |  10 +
>   io_uring/futex.c                       |   4 +-
>   kernel/fork.c                          |  24 +
>   kernel/futex/core.c                    | 794 ++++++++++++++++++++++---
>   kernel/futex/futex.h                   |  73 ++-
>   kernel/futex/pi.c                      | 300 +++++-----
>   kernel/futex/requeue.c                 | 480 +++++++--------
>   kernel/futex/waitwake.c                | 201 ++++---
>   kernel/sys.c                           |   4 +
>   mm/nommu.c                             |  18 +-
>   mm/vmalloc.c                           |  11 +-
>   tools/include/uapi/linux/prctl.h       |  44 +-
>   tools/perf/bench/Build                 |   1 +
>   tools/perf/bench/futex-hash.c          |   7 +
>   tools/perf/bench/futex-lock-pi.c       |   5 +
>   tools/perf/bench/futex-requeue.c       |   6 +
>   tools/perf/bench/futex-wake-parallel.c |   9 +-
>   tools/perf/bench/futex-wake.c          |   4 +
>   tools/perf/bench/futex.c               |  60 ++
>   tools/perf/bench/futex.h               |   5 +
>   27 files changed, 1585 insertions(+), 569 deletions(-)
>   create mode 100644 tools/perf/bench/futex.c
> 

