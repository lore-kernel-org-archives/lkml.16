Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D70255F4A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032265; cv=none; b=SaIYJzXMmGpDctcTzOAca7bLAuEe6cIoqU0HKicCPwBOcOyYi/Pq3AeEYIRHpklsr/RZXOx38uu/938K2rYNgy0BQIuAl3bds3HXlknTkWHMUOTSAbNE4m1xYo1GqwGNBcgnNYCGMYSu4UsM6v3+DQj2a5okOb8qoLOBK8Otxj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032265; c=relaxed/simple;
	bh=6wn4OMVIx7dJN6XPNRemjiDxiT2owami0NgCrkbsKHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NaasZ4vdJHZZtxT0E7/5QP8j4jOTC2ywQgRnz9/dTKqkMO+FuVi/KdmExGKI2eV0Ug+9PJgWkEPo3/m0NJNzyAkVlqyjD6y46Mn6P06UDrfenKcZg/m8lySIzcbtCLK+0s08qWvXWOg5WNq8sAX58RttZNt2Fgp8EGI/NixximE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=YOBsh37K; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="YOBsh37K"
Received: from terminus.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3:0:0:0:136])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54C6hsAv1535999
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 11 May 2025 23:43:58 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54C6hsAv1535999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747032238;
	bh=/Tp04FFyLZuYBUsTETYfaJln1buoXkSb8RpBpDNwre8=;
	h=From:To:Cc:Subject:Date:From;
	b=YOBsh37KwOS0JN3hkO3ilATDTulE+UKXqpubvq30QlgWktgmW7DLaV4YbM9fO9RqZ
	 DakX5IjzfBZrSzfQvleheoeVsVIh6xsSncEb63mXpEuELBEAKz7qr0HakZTbUeX8gQ
	 6PiQCV8mHU3a39mIpiimUzLj51Lm7lGKs90VFbloBcTnxoMSax3OS8L4Y7LoJi5/CG
	 BdlGy30spQDqQ2YbF2pckTU5aCc4w3pD0FEMiouP8bEV8wZiERvAGsWJicUgwzQYG3
	 usHs/e2+1/e6EjQ4DZNg5U5M7kqc0wH6DNd1ejp1s5vOPcHikfbiR6IQPHXQbrd9Em
	 rNts7/dMnfJzQ==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org
Cc: luto@kernel.org, tglx@linutronix.de, mingo@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        peterz@infradead.org, brgerst@gmail.com
Subject: [PATCH v4 0/2] x86: Allow variable-sized event frame
Date: Sun, 11 May 2025 23:43:51 -0700
Message-ID: <20250512064353.1535984-1-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was initially posted as part of the FRED patch series and turned
down due to its unacceptable quality:
  https://lore.kernel.org/lkml/20230410081438.1750-31-xin3.li@intel.com/

Now comes another attempt to meet the bar.


A FRED event frame could contain different amount of information for
different event types, e.g., #MCE could push extra bytes of information,
or perhaps even for different instances of the same event type. Thus
the size of an event frame pushed by a FRED CPU is not fixed and the
address of a pt_regs structure that is used to save the user level
context of current task is not at a fixed offset from top of current
task kernel stack.

This patch set adds a new field named 'user_pt_regs' in the thread_info
structure to save the address of user level context pt_regs structure,
thus to eliminate the need of any advance information of event frame
size and allow a FRED CPU to push variable-sized event frame.

With the above change, we can remove the padding space at top of the
init stack because there is no user level context for init task.


Link to v3: https://lore.kernel.org/lkml/20250321053735.2479875-1-xin@zytor.com/

Change in v4:
* Drop the patch that zaps TOP_OF_KERNEL_STACK_PADDING on x86_64
  (Brian Gerst, hpa).

Change in v3:
* Replace "(struct pt_regs *)TOP_OF_INIT_STACK - 1" with
  (struct pt_regs *)__top_init_kernel_stack (Brian Gerst).
* Add declaration for __top_init_kernel_stack[] (Intel lkp).

Change in v2:
* Rebase on latest tip/master.


Xin Li (Intel) (2):
  x86/fred: Allow variable-sized event frame
  x86: Remove the padding space at top of the init stack

 arch/x86/entry/entry_fred.c        | 10 ++++++++++
 arch/x86/include/asm/processor.h   | 28 ++++++++++++++++++++--------
 arch/x86/include/asm/thread_info.h | 11 ++++++++---
 arch/x86/kernel/process.c          | 22 ++++++++++++++++++++++
 arch/x86/kernel/vmlinux.lds.S      |  7 +++++--
 include/linux/thread_info.h        |  1 +
 kernel/fork.c                      |  6 ++++++
 7 files changed, 72 insertions(+), 13 deletions(-)


base-commit: 8e3f385164626dc6bbf000decf04aa98e943e07e
-- 
2.49.0

