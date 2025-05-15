Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9A272618
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315677; cv=none; b=UfyOdFBHMQZynpT1yyQP1bwmXrSzn+FGxycLafudeMCYLw5o78fBjZ5018CFel1rxWAZ/8N6RukuLQLfgqTyQO7sYfrvZmTBl6z6kZANsQaP5CQ/5MtG8kqlikmaQXEqR2icN/OB2N9CELoS9CgU00IzCNLQl1YM5aeCrFM2HhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315677; c=relaxed/simple;
	bh=JYLghmRkU05ld+x0rHitCL9ivTFhGaFg/nc0k+2Qntk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCcfeREqNiRlPggmpGokMEG31iFDTkZ70Fa5G97/N9STtdOsbEofUNkKcSDLq0OxwWcNLiMO9U6v6keifO0Im/19kUCkdg99Ov+i7peDI4fU1Ts+uT7gHAmcsnRg2fhAYCchZxa1rQcFMLawhT6BJUxcpBp4n88uJkrGaTz1Sao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0L51VeE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0L51VeE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA128C4CEF0;
	Thu, 15 May 2025 13:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747315675;
	bh=JYLghmRkU05ld+x0rHitCL9ivTFhGaFg/nc0k+2Qntk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M0L51VeEvJlJJmm9QtCz74ikqOqlduqr8U0SfIGLwPag2I6mLBhBi0WYKqf0Aop5e
	 yJb0GGYzlzxFMR6jkNGQXAV82scyQ1uNMk7IWKJvxslIXz62JKxZ/FlIlOYS5zmS0m
	 uCsUryPy9szwYLntxZPu9czAkmCSIR1G6INnA3Ei7cYl3wokz6yGf+yr/gU1Hwi2G0
	 KWYqyOvwep/zvrGYgNGtO0WleJDqA/gvNtxUwMG3ZnLrBZDw5RnGF6+dWrMgnONM4l
	 wTgBR1cwQiIqGEzcOqFrIR6fK/QSmteUfEupkqIjpLStiSi9rDGFzgTSJpQ552uEae
	 m7vHPECegoXSA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Subject: [PATCH 08/13] x86/kconfig/64: Enable BPF support in the defconfig
Date: Thu, 15 May 2025 15:27:14 +0200
Message-ID: <20250515132719.31868-9-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515132719.31868-1-mingo@kernel.org>
References: <20250515132719.31868-1-mingo@kernel.org>
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
 arch/x86/configs/x86_64_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
index df786b8b4e85..a32ed372e5bd 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
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

