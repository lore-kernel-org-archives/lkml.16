Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3EE4A33
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 20:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750019250; cv=none; b=mvm1uywod/dDhvqW2Oiezt+tpR7GBhsv4SjNols7k6UKD++HaJjaU33pJeJ0MgHmPmf7on/XOWDn77e/tpR8BRbBK6IEEhYYVUIULHGP2Y8mjhJZ0TjicVfWhoQIjBRhjP//gbFvE8NBf7gE7wnRuNAzrTLN8LkoHRxU90KA7n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750019250; c=relaxed/simple;
	bh=Wfh/moJTmOO8BK4r3ZQ9P3PYtYv1MH0lQsApvw6w1lM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=C3EP9cXclBS53pdLQHWNETqwTqVIZeXj5g627uifNDvgSP9KvHaN43MrszKSvUUxurnAwOcAvm9CQRiWR1Q107MXZYHpx+VPQbqzQi/JqMvgxVW3kzGaZ80xL94Vj4VemO2JNRaVu6g/GJWW2f2IAnDX5ddY3JmzCRH+oOtdWP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=h/3Jn5iZ; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="h/3Jn5iZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:subject:message-id:mime-version;
  bh=abfaKeyevw9Ay5KmTa0AYQDgjodet9O1nCta6ElJx/U=;
  b=h/3Jn5iZHDTTA3Jr5ibOIBQ70fIeYsJjIdrGJd/nXnkwsvnak9W7unzK
   X0rQ1poXR5ZJnBkKMhjTyt7p4xHD6Vu1U0+7Q86eHpoMLFppFCeKZhPGe
   IXjrnnKf9UawsT7/Gloa8irvgKLl7TMePHnFYMcgImhKXRp7pnv5nIgLz
   c=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.16,239,1744063200"; 
   d="scan'208";a="227251113"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 22:26:17 +0200
Date: Sun, 15 Jun 2025 22:26:17 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
    Vincent Guittot <vincent.guittot@linaro.org>, 
    Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-kernel@vger.kernel.org
Subject: has_idle_core
Message-ID: <alpine.DEB.2.22.394.2506152216150.3463@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hello,

I wonder about the following code in select_idle_cpu:

        for_each_cpu_wrap(cpu, cpus, target + 1) {
                if (has_idle_core) {
                        i = select_idle_core(p, cpu, cpus, &idle_cpu);
                        if ((unsigned int)i < nr_cpumask_bits)
                                return i;

                } else {
                        if (--nr <= 0)
                                return -1;
                        idle_cpu = __select_idle_cpu(cpu, p);
                        if ((unsigned int)idle_cpu < nr_cpumask_bits)
                                break;
                }
        }

        if (has_idle_core)
                set_idle_cores(target, false);

set/test_idle_cores works at the LLC level.  But the mask cpus in
for_each_cpu_wrap depends on the set of cores on which the task to be
placed can run.  So can't the placement of one task that is pinned to a
small set of busy cores prevent the search for an idle core for subsequent
less restricted waking tasks, until the idle cores flag is reset?

For the moment, this is a purely theoretical question.  I don't have a
concrete example that illustrates the problem.

thanks,
julia
