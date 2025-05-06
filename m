Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D7C2857F7
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551404; cv=none; b=sm5xuRU1KXZn4McvwDel3ji4V6+c7+/KK3NcGmJTw3N7xNGmknPPxrRCtlpKV6/2/wXkoH+GWvnx/IFJp1ug3Mm/d0zo9pEUqN1ZARKmNjFco5ZeA28SrxGD6RFi/jhM79ikxX4bW9PvJbcGQm9H/QfLsJEtnJYpPBj4yAmDlXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551404; c=relaxed/simple;
	bh=7w+B3BnSAOt9aZff8G0TKHHwKXTbtM3d3heYLOXQjyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/hNv4EKVN3dq7XbTu8whWdwKkRzDjDLbFNBvdKSY6R3+WEPpLvHqxxhdPRo/j8sKje6qJmKWbbTPkdKPwya25j181OBrcM6Lw2exe8sZENJr5gRfg+Bl4Sjhb8IgycFQJsAZ7mn5rdevo2WIEIHABU0n5zMur5XxYrG6VX7rEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGJ16Fwo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGJ16Fwo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AA3C4CEE4;
	Tue,  6 May 2025 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551404;
	bh=7w+B3BnSAOt9aZff8G0TKHHwKXTbtM3d3heYLOXQjyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qGJ16FwopXdGHOf6AJdwMHy5hta1HsEERoNGtGzH7QWVZ9SFdEvE0eE6MAGtJeChU
	 ChEIs+0BT3GEY3GoI6+3rCcRd6y5vWTK7qYe7WXwQ7pk5L/ctJHmfopP7UEzDTK6VN
	 BpTolu9vKrzmBM0mJD/+eb3uXEKH+XfmBYISZXFpsnngb4C+NoRk3SXHI4Nv/e8nJx
	 V4x7MklvWaYxTPlG/Fgf+pkiU5aTOnw2KEpOvlzDzQn+SlBFklFLWUGAiTP/oJM6t0
	 CifXL1JGFLPH+BRkK60mqtDrxwUwqx46Zwy/TIWfRElYIBpWoc+lSFouCH/RE5ZTNK
	 VA+wYR4E/3qkg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
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
Date: Tue,  6 May 2025 19:09:19 +0200
Message-ID: <20250506170924.3513161-11-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506170924.3513161-1-mingo@kernel.org>
References: <20250506170924.3513161-1-mingo@kernel.org>
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
index df786b8b4e85..a32ed372e5bd 100644
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

