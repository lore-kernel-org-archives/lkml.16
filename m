Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com [99.78.197.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112AF186E26
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768237; cv=none; b=VjCfF/ASK4noYpLSu+t4+yC8UKzAJkVKp6V71GG8tc/G7vGXQPoFNjuy4SR4jOGTZIKoMAnAQpMqHPN9ZI8DmxCDf4ml5akdx7WI1ddMSFLCDtRpVBODEx99daaFPJbEkvrogo7nM51+w7M/YcH7osIgn8w0fTcC0Z3jyqAmOdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768237; c=relaxed/simple;
	bh=J1nGqDWW10WBhBiYNrkC/C3k65WV/7N3L+wHhQKfAc0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=im50xFtSkeKfp4IO8cwl7T4hBNE3DpLMX+sgeAVuTAwSKMT0o1JNuptDlm73uCKuBxKGYCU/HKkP9IbH09F+yxsUWUMUGbSM8riGpG1bfMskTwW1fNWF4wRh+TGWWnY6vXTfOLlemHVgr5bCN3F4r4AA2nrJHQ0Q847jaPUFzzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=pTiR8gCh; arc=none smtp.client-ip=99.78.197.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="pTiR8gCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1738768236; x=1770304236;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cX8Pnm0THHl47qkT9b4KW+qqkQab6I5xdxLo7olx0zQ=;
  b=pTiR8gChvSBSsqYbO2dRRggNmKOxiOtv2rXRr7PoWfJYRzz74aoTK3oR
   5YiK2oUcdDg9lwUn6uxOlNh7YwTfkUt6BDUu7QE8QqPqKjCAjA549fEg3
   FVMylB9kjClLnhgFeGT9wwWN8mEnClXGYfegWKUUj8eWMdyadJg/JF9Eq
   c=;
X-IronPort-AV: E=Sophos;i="6.13,261,1732579200"; 
   d="scan'208";a="167062478"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 15:10:31 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.43.254:39770]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.12.78:2525] with esmtp (Farcaster)
 id efc0f1f6-e5d8-45b4-8d16-6af7c0f91192; Wed, 5 Feb 2025 15:10:30 +0000 (UTC)
X-Farcaster-Flow-ID: efc0f1f6-e5d8-45b4-8d16-6af7c0f91192
Received: from EX19D018EUC004.ant.amazon.com (10.252.51.172) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 5 Feb 2025 15:10:30 +0000
Received: from EX19MTAUWC002.ant.amazon.com (10.250.64.143) by
 EX19D018EUC004.ant.amazon.com (10.252.51.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 5 Feb 2025 15:10:30 +0000
Received: from email-imr-corp-prod-iad-all-1b-af42e9ba.us-east-1.amazon.com
 (10.25.36.210) by mail-relay.amazon.com (10.250.64.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Wed, 5 Feb 2025 15:10:29 +0000
Received: from dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com (dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com [10.253.65.58])
	by email-imr-corp-prod-iad-all-1b-af42e9ba.us-east-1.amazon.com (Postfix) with ESMTP id 4D4C24081C;
	Wed,  5 Feb 2025 15:10:29 +0000 (UTC)
Received: by dev-dsk-hagarhem-1b-b868d8d5.eu-west-1.amazon.com (Postfix, from userid 23002382)
	id 0A9C420DC1; Wed,  5 Feb 2025 15:10:29 +0000 (UTC)
From: Hagar Hemdan <hagarhem@amazon.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: Hagar Hemdan <hagarhem@amazon.com>, wuchi <wuchi.zero@gmail.com>,
	<linux-kernel@vger.kernel.org>, <Mohamed@amazon.com>,
	<Abuelfotoh@amazon.com>, Hazem <abuehaze@amazon.com>
Subject: BUG Report: Fork benchmark drop by 30% on aarch64
Date: Wed, 5 Feb 2025 15:10:24 +0000
Message-ID: <20250205151026.13061-1-hagarhem@amazon.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi,

There is about a 30% drop in fork benchmark [1] on aarch64 and a 10%
drop on x86_64 using kernel v6.13.1.

Git bisect pointed to commit eff6c8ce8d4d ("sched/core: Reduce cost
of sched_move_task when config autogroup") which merged starting
v6.4-rc1.

The regression only happens when number of CPUs is equal to number
of threads [2] that fork test is creating which means it's only visible
under CPU contention.

I used m6g.xlarge AWS EC2 Instance with 4 vCPUs and 16 GiB RAM for ARM64
and m6a.xlarge with also 4 vCPUs and 16 GiB RAM for x86_64.

I noticed this regression exists only when autogroup config is enabled.

Run the fork test with these combinations and autogroup is enabled:

Arch      | commit eff6c8ce8d4d | Fork Result (lps)  |  %Cpu(s)
----------+---------------------+--------------------+------------------
aarch64   | without             | 28677.0            |  3.2 us, 96.7 sy
aarch64   | with                | 19860.7 (30% drop) |  2.7 us, 79.4 sy
x86_64    | without             | 27776.2            |  3.1 us, 96.9 sy
x86_64    | with                | 25020.6 (10% drop) |  4.1 us, 93.2 sy
----------+---------------------+--------------------+------------------

It seems that the commit is capping the amount of CPU resources that can
be utilized leaving around 18% idle in case of aarch64 and 3% idle in
x86_64 case which is likely the main reason behind the reported fork
regression.

When autogroup is disabled:

Arch      | commit eff6c8ce8d4d | Fork Result (lps)  |  %Cpu(s)
----------+---------------------+--------------------+------------------
aarch64   | without             | 19877.8            |  2.2 us, 80.1 sy  
aarch64   | with                | 20086.3 (~same)    |  1.9 us, 80.2 sy
x86_64    | without             | 24974.2            |  4.9 us, 92.5 sy 
x86_64    | with                | 24921.5 (~same)    |  4.9 us, 92.4 sy
----------+---------------------+--------------------+------------------

So when autogroup disabled, I still see the amount of idle CPU resources 
18%, 3% on aarch64 and x86_64 regardless of commit.

Is this performance drop an expected of this commit when autogroup is
enabled?

Thanks,
Hagar

[1] https://github.com/kdlucas/byte-unixbench/blob/master/UnixBench
[2] Used command: ./Run -c 4 spawn
