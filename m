Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5783F182D0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458374; cv=none; b=ECYVx+OB6ES/ObhrqAY2+qCN9QCITVmV/EIgKYrFppY9wFRxNrYw2vXj8k2UtLnISx3aB8b2G7hLG6WYR9zUZBm8NCNfDfqJrXvB6ewgc97ISyBTp10QnqR5qPO0ej00DIgEbVyuCQkvdgl0cQr25Hf+FG2yFlJhMBrNdpjqOfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458374; c=relaxed/simple;
	bh=hjrOH/DyRiwQN7L97mVRQ8B6fYAQ5hdNaE2oSEhJssU=;
	h=Message-ID:Date:From:To:Cc:Subject; b=Hc6IfnvjbaJAfMsf9Il14WKn+mb+LgVZpKjRlqnWoFjDeCnkv0bvFwdWi27RENRTcjqrakNg+TbkC1F/IqAW5VZf+G3WclPmaOm0YbzbwNwKF9KL8UxcN7y/e1F7cFo79z6BtukAozRWAtFDdgTFmCDY4cyeRvlWjZTCUzd3qxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=riB24QJW; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="riB24QJW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=baQ2kUn8mW4HR3oLyl8RqpRcPxER907THYJHhIqRP/g=; b=riB24QJWZ+wlRScg4S/ARiDEfV
	EqF/L8X627+MrcHCtKEf+2iktw3W1/P/r21VKJuMhSEX0Cksnd9BL8L6icw5Z2mV8vtSnfDs0oCAw
	rmh3xi3MIyDSoBGZnIEoa62xEP/4TrRjEKIODEzXu8IasUI4OurbVCS/rXl01O5/kxyMI4q0tiil9
	kZ5t0z0Zd9Ysy3WqoFIHGtSdRfKKTjl5eKQ8k9qcGV281rqh+zxCQPb7LpsE2EO2Ju7jUgTeWHq3A
	Sjo9D4KyIF7qwzM7EktiR4CfWF+CjW5rdmFu1353317iwjya49SKGW6nri5wO5YiaAHO7GHVKUyFg
	YqZu3K1w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwKV-00000007Lo7-0onb;
	Wed, 02 Jul 2025 12:12:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id B597B300125; Wed, 02 Jul 2025 14:12:46 +0200 (CEST)
Message-ID: <20250702114924.091581796@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 02 Jul 2025 13:49:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@redhat.com,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 clm@meta.com
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org
Subject: [PATCH v2 00/12] sched: Address schbench regression
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi!

Previous version:

  https://lkml.kernel.org/r/20250520094538.086709102@infradead.org


Changes:
 - keep dl_server_stop(), just remove the 'normal' usage of it (juril)
 - have the sched_delayed wake list IPIs do select_task_rq() (vingu)
 - fixed lockdep splat (dietmar)
 - added a few preperatory patches


Patches apply on top of tip/master (which includes the disabling of private futex)
and clm's newidle balance patch (which I'm awaiting vingu's ack on).

Performance is similar to the last version; as tested on my SPR on v6.15 base:

v6.15:
schbench-6.15.0-1.txt:average rps: 2891403.72
schbench-6.15.0-2.txt:average rps: 2889997.02
schbench-6.15.0-3.txt:average rps: 2894745.17

v6.15 + patches 1-10:
schbench-6.15.0-dirty-4.txt:average rps: 3038265.95
schbench-6.15.0-dirty-5.txt:average rps: 3037327.50
schbench-6.15.0-dirty-6.txt:average rps: 3038160.15

v6.15 + all patches:
schbench-6.15.0-dirty-deferred-1.txt:average rps: 3043404.30
schbench-6.15.0-dirty-deferred-2.txt:average rps: 3046124.17
schbench-6.15.0-dirty-deferred-3.txt:average rps: 3043627.10


Patches can also be had here:

  git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core


I'm hoping we can get this merged for next cycle so we can all move on from this.

