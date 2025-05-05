Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8661D20469E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443424; cv=none; b=M4/uj92+kNQ6AsjdqlstfPGzPB/PBgp37FGowleA79/gn2032iusTwRaT+ciCrIqjln/6rHXxKxGr65Nw8v4rhYHRBNDR+vFF6kUoXl5+9Z43gGPBidYYg7l+f67YI8zDfmpqSAP1Lq3sWCv8fjUVODbsJsQJ7sAEnF3x4BX6lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443424; c=relaxed/simple;
	bh=uLf8hrlGrsElWYp3/h7aQWzMdEp7sbji39NK31OjpzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QfyTn9qnNfi6ctr6eje9BaCEh5FmkykvhQBRiXZ8A+EgOXWN3KGAPrRsyxdCxPNiRhd39DC4IZSlamjnWzkWiuROcSA2EDv/Q/ORpuLm6RUSvu9oSSujU+1VwzxTuI5Ysn96/p0q14ynNYESzbzhE0txtftAF90RdSx6giahdTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArhgLvfi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArhgLvfi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45BBC4CEE4;
	Mon,  5 May 2025 11:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443424;
	bh=uLf8hrlGrsElWYp3/h7aQWzMdEp7sbji39NK31OjpzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ArhgLvfivl89Mje5cUbdb4wQQ2B9llagBG2XN9SL95ThghJ/Lfa+1V2+i7GRqytWw
	 RnxKpzqJrv6SZt6eZ9XMnIoawpxZg2mwZbp2p3I5mQSW9xlM94eH79pXncU+cwWcnL
	 t2Pmy+GYhv30asUCbxiiQkM+N8uO5WUX6lTtasqEtNGMZz395+Z8+LPzB7mBq3LQD0
	 IUW1GdTwRo5pvWY3VntZIBT+LQbd/z9Ja/kAmNSmrINRbi80r/tQ4p96XVGGCDolzu
	 YK/crzfAoFVutNZEgKESiZsyuXPmtml6WQZaWPVXIpc/69/ISnBhWfZhN4ZiWyZRAo
	 0YhR5THRKU0dg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Subject: [PATCH 10/15] x86/kconfig/64: Enable BPF support in the defconfig
Date: Mon,  5 May 2025 13:09:41 +0200
Message-ID: <20250505110946.1095363-11-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250505110946.1095363-1-mingo@kernel.org>
References: <20250505110946.1095363-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the x86 defconfig aims to be a distro kernel work-alike with
fewer drivers and a shorter build time, enable BPF support, which
is enabled in all major Linux distributions.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Andrii Nakryiko <andrii@kernel.org>
---
 arch/x86/configs/defconfig.x86_64 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/configs/defconfig.x86_64 b/arch/x86/configs/defconfig.x86_64
index 514f8fdc2102..9961742fe78c 100644
--- a/arch/x86/configs/defconfig.x86_64
+++ b/arch/x86/configs/defconfig.x86_64
@@ -4,6 +4,12 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_AUDIT=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_BPF_JIT=y
+CONFIG_BPF_JIT_ALWAYS_ON=y
+CONFIG_BPF_PRELOAD=y
+CONFIG_BPF_PRELOAD_UMD=y
+CONFIG_BPF_LSM=y
 CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_TASKSTATS=y
@@ -22,6 +28,7 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_PERF=y
+CONFIG_CGROUP_BPF=y
 CONFIG_CGROUP_MISC=y
 CONFIG_CGROUP_DEBUG=y
 CONFIG_BLK_DEV_INITRD=y
-- 
2.45.2

