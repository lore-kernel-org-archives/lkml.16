Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn [202.108.3.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92DD264FB1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457321; cv=none; b=sqiHlG0yTG8JWT9Ii3x6F0abvoSRGUZ55bH+TYl52TIXFTONKwv4YcA1793d3oilhyn4Jj0EHTpDBfEEXodNEUcyGTqtl5Dc4f7oEfe4XaJcWqFgNHW/gohymVWkrn15CmPJm5cG5Yc51UFDQCt6g+XoT2ZIEmLSgvHm48xLNvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457321; c=relaxed/simple;
	bh=dlx2FKvh5KxNnKfT7plX+nNxjpgRTjf2jmxci8Y3K18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AdcLsiusHw7mNv1MUBhzitNLiR0diuyDvOu0xB18kKFK9V94T1OGbM0QUxKAiBQ3EIffgDLMkf6cVtemv19tC3O70Xrx950kwGANZG7TzFZffxPKWKaj5kU0jowjPJp9ahza9gNw0uw34TCtyHdxRMJa5Qx15qvvuy1bPcuDdNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=mPgYLH6p; arc=none smtp.client-ip=202.108.3.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="mPgYLH6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751457314;
	bh=CHgdD7ib/9vm5T5SbLulw41eXK/ubaOG9XmTPiLdi9c=;
	h=From:Subject:Date:Message-ID;
	b=mPgYLH6pLxmIVa0ZYQc+p/mhSGRmWZ5dUasjOB1IxqSMs9C3MVrqBZQ4B6jy3Sz7c
	 lQDdjA/lL0eqsHzQ4KWt/FiNTT4CsYQTgm0VDvHroyInt//+jqxMwKORfv3QKrftn4
	 koGHvsXm71fHwlXK3kN2wYN+C55YYlrftxF+zViM=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.31) with ESMTP
	id 68651E1800002759; Wed, 2 Jul 2025 19:55:05 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 7825396816273
X-SMAIL-UIID: 7BD8B49E7D8E4E6D88D35DF59CB6F904-20250702-195505-1
From: Hillf Danton <hdanton@sina.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 0/6 v3] sched/mm: LRU drain flush on nohz_full
Date: Wed,  2 Jul 2025 19:54:52 +0800
Message-ID: <20250702115454.2183-1-hdanton@sina.com>
In-Reply-To: <aGPWYWKKWhr2rxMG@localhost.localdomain>
References: <20250410152327.24504-1-frederic@kernel.org> <20250412025831.4010-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 1 Jul 2025 14:36:49 +0200 Frederic Weisbecker wrote
>Le Sat, Apr 12, 2025 at 10:58:22AM +0800, Hillf Danton a écrit :
>> On Thu, 10 Apr 2025 17:23:21 +0200 Frederic Weisbecker wrote
>> > Hi,
>> > 
>> > When LRUs are pending, the drain can be triggered remotely, whether the
>> > remote CPU is running in userspace in nohz_full mode or not. This kind
>> > of noise is expected to be caused by preparatory work before a task
>> > runs isolated in userspace. This patchset is a proposal to flush that
>> > before the task starts its critical work in userspace.
>> > 
>> Alternatively add a syscall for workloads on isolated CPUs to flush
>> this xxx and prepare that yyy before entering the critical work, instead
>> of adding random (nice) patches today and next month. Even prctl can
>> do lru_add_and_bh_lrus_drain(), and prctl looks more preferable over
>> adding a syscall.
>
>In an ideal world, this is indeed what we should do now. And I still wish we
>can do this in the future.
>
>The problem is that this has been tried by the past and the work was never
>finished because that syscall eventually didn't meet the need for the people
>working on it.
>
>I would volunteer to start a simple prctl to do such a flush, something that
>can be extended in the future, should the need arise, but such a new ABI must
>be thought through along with the CPU isolation community.
>
>Unfortunately there is no such stable CPU isolation community. Many developers
>in this area contribute changes and then switch to other things. As for the CPU
>isolation users, they are usually very quiet.
>
Given your footprint in the MAINTAINERS file,

HIGH-RESOLUTION TIMERS, TIMER WHEEL, CLOCKEVENTS
M:	Anna-Maria Behnsen <anna-maria@linutronix.de>
M:	Frederic Weisbecker <frederic@kernel.org>
M:	Thomas Gleixner <tglx@linutronix.de>

NOHZ, DYNTICKS SUPPORT
M:	Anna-Maria Behnsen <anna-maria@linutronix.de>
M:	Frederic Weisbecker <frederic@kernel.org>
M:	Ingo Molnar <mingo@kernel.org>
M:	Thomas Gleixner <tglx@linutronix.de>

POSIX CLOCKS and TIMERS
M:	Anna-Maria Behnsen <anna-maria@linutronix.de>
M:	Frederic Weisbecker <frederic@kernel.org>
M:	Thomas Gleixner <tglx@linutronix.de>

READ-COPY UPDATE (RCU)
M:	"Paul E. McKenney" <paulmck@kernel.org>
M:	Frederic Weisbecker <frederic@kernel.org> (kernel/rcu/tree_nocb.h)
M:	Neeraj Upadhyay <neeraj.upadhyay@kernel.org> (kernel/rcu/tasks.h)
M:	Joel Fernandes <joel@joelfernandes.org>
M:	Josh Triplett <josh@joshtriplett.org>
M:	Boqun Feng <boqun.feng@gmail.com>
M:	Uladzislau Rezki <urezki@gmail.com>

I am happy to close the chance for you to deliver patch like a starter.

>I can't assume all the possible usecases myself and therefore I would easily do
>it wrong.
>
>In the meantime, the patchset here is a proposal that hopefully should work for
>many usecases.
>
>Thanks.
>
>-- 
>Frederic Weisbecker
>SUSE Labs
