Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F382E36F6
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 03:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751771212; cv=pass; b=BiPtnMPBzPKvds3EUXc9qNBxfrt1Zg87kaNf72500d68ywGXKrjTnCh2CFdTanEP7I/RIktBp/iPAy/IqYEyu0HrrqDOrMoUPVFQKirM9rv+IoZu2jwoVVAtW3YGynBz2K2Qi8POp0fLCFweQsxx84i0ew94a7DwVyLkn7V2vV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751771212; c=relaxed/simple;
	bh=ddlUgXhqoj41WdlFKrngejGXPJ1fpcjnBG8qek09PnE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sXI/Q3tdWDCf3tBMUYvqH5mXGKAYW8T5442c+VskEYAmvqy7OBtCy8IVS9XOcrAti59bZWK8pVgYAqZuK15KWus7iZAknO+Z8POr5tp554Fi+TSo+Xc2wmssgvlAHTW4yQBdGwePz2zBCb8OKznYG8oDG6KiZjFxdmiGA5etfrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=PY5bfbpw; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="PY5bfbpw"
ARC-Seal: i=1; a=rsa-sha256; t=1751771205; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JrvI4JRu3lNCucShp6eZ5YwmVFlEak0Ftz0gPdUZaf2an5apgnOTjBGCDW0n4qPCz83ijHzZMQBmlhCOEMh5XRuEGHu2KAq40aP42dAI21KMA5WpalmswXARUlTB5evrBsSChUh6/PMMuFoGhBVYHaEflEVCqWl3kxeB6IyJXCo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751771205; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=7kjdld81wUq7y8PDAZ+vU+RLxvhuoDRPjvJUCsxFJjA=; 
	b=gFkVF8DyCn6157Fqh1yxO/jpvA2JjXSRUpP2djkf3gFGNn0ti9ftW292sihFfS38RNv9IK76T2npPfo/hDKz/KsVP2wqzu9G0M+m+He4TAcyohULTtAm/yxX6BRwNexh4uhy+VH45Zk5UXsFTfNqAsFGMBIYsWZIG4RoEwn1ljk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751771204;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=7kjdld81wUq7y8PDAZ+vU+RLxvhuoDRPjvJUCsxFJjA=;
	b=PY5bfbpw6IB79dxIXDnXrxDzOWdjEdnWfyLLZavpmcVldW1KHXGFmG4ulumR6UHK
	6vjoVfPGIkqj/qAtjwBNgcDI9AZUOx96TfWUSTUmN6IOi18oiQNcRcs/wdV0wf5z+zx
	qiQmgxad4cDUZqY7ZBjSrgI++T+jwe9CYwuzawUU=
Received: by mx.zohomail.com with SMTPS id 1751771202980263.4048949758843;
	Sat, 5 Jul 2025 20:06:42 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Li Chen  <me@linux.beauty>," Thomas Gleixner "<tglx@linutronix.de>," Ingo Molnar "<mingo@redhat.com>," Borislav Petkov "<bp@alien8.de>," Dave Hansen "<dave.hansen@linux.intel.com>,<x86@kernel.org>," H . Peter Anvin "<hpa@zytor.com>," Rafael J . Wysocki "<rafael.j.wysocki@intel.com>," Peter Zijlstra "<peterz@infradead.org>," Sohil Mehta "<sohil.mehta@intel.com>," Brian Gerst "<brgerst@gmail.com>," Patryk Wlazlyn " <patryk.wlazlyn@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] x86/smpboot: tidy sched-topology and drop useless SMT level
Date: Sun,  6 Jul 2025 11:06:28 +0800
Message-ID: <20250706030636.397197-1-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

This series cleans up sched-domain topology handling and
eliminates hundreds of pointless attach/destroy cycles for large
machines when SMT is not available.

Patch 1, 2, and 3 do some cleanup and refactor.

Patch 4 is a follow-up that simply skip SMT domain when
cpu_smt_num_threads <= 1, so the SMT level never gets created.

Tested on Qemu.

changelog:
v2: fix wording issue as suggested by Thomas [1]
v3: remove pointless memset and adjust PKG index accordingly, as
    suggested by Thomas [2], and refine some other wording issues.
v4: v4: Split refactor patche into three parts (as suggested by Peter [3])
    and refined patch 4 logic (as done by K. [4]).

[1]: https://lore.kernel.org/all/87msa2r018.ffs@tglx/
[2]: https://lore.kernel.org/all/875xglntx1.ffs@tglx/
[3]: https://lkml.org/lkml/2025/6/25/584
[4]: https://lore.kernel.org/lkml/1b706790-2fec-4582-a425-55eeff36c32e@amd.com/

Li Chen (4):
  smpboot: introduce SDTL() helper to tidy sched topology setup
  x86/smpboot: remove redundant CONFIG_SCHED_SMT
  x86/smpboot: moves x86_topology to static initialize and truncate
  x86/smpboot: avoid SMT domain attach/destroy if SMT is not enabled

 arch/powerpc/kernel/smp.c      | 34 ++++++++-------------
 arch/s390/kernel/topology.c    | 10 +++----
 arch/x86/kernel/smpboot.c      | 55 ++++++++++++++++------------------
 include/linux/sched/topology.h |  6 ++--
 kernel/sched/topology.c        | 16 ++++------
 5 files changed, 53 insertions(+), 68 deletions(-)

-- 
2.49.0

