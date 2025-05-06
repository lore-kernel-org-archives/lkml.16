Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487F2286D61
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551395; cv=none; b=NMstzAlL9VOHrrWybhuz41BVfIVs7IJrD1xeSvH6PU+CD3SoxgSwyW3UYBjYhsLhKmOeCaa6cqwHboxeyThSar9VK0fgQumHK1b3IZUNKOvPNgfE0EJo98pNUvX83Jr/UqEGb9vCBMesMWs6DKgYXvFyPgh21062LC8xSuAGMsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551395; c=relaxed/simple;
	bh=wAoDI1YaN5dxg6WT9WRKd3hmOWwjwJ7b0sdWyMGaRTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WjnMjCl/dW3rfF80Po3y5NXp6sPkE4oRWpvzTMEECTTp4TFNB9n+xsbI8ZbrZLg9RCHtpl/4oeuXWOnGiZWXyR5nbqH/fHitBbzraYUzIX3OpkkbJ9fRshGJu8PR+H6Ul3xZ6fjYQsNLnuUxl/8JBbb/nLexarQsJf2dJpVlbFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8NQGt8A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8NQGt8A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56656C4CEEB;
	Tue,  6 May 2025 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551395;
	bh=wAoDI1YaN5dxg6WT9WRKd3hmOWwjwJ7b0sdWyMGaRTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g8NQGt8AhQZNFVjxif33zGhL2+xyjke+lv0S5p0EHJhVu4ydEQq+cQcjszoN0pq3w
	 G3ll0Odg1IcZHYmcvWQvr2KPcdhwwBCTAnF4/+EOaYGrm9Jj0UynFJ0nuN+BLOr2jB
	 cxfoJ00BQR5MRl91seVgKPzLj0qtJxkzYp4ZpXJhm2Wm7n4psfLMnydFQl2jgq5XKe
	 zLyL+6D5FGnxDUkvAS4zuCualKmduUAK5ArD5WAS0PD55ztud5c38a1qLE7s009W3P
	 MafrOO8F4D01Q0rlw5TczX6IJwgMgx97PayyMcxoO/xKwBJBbZ9yxc8igPcYmuMtsx
	 qjcEPKaNntEaQ==
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
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 08/15] x86/kconfig/64: Enable the KVM host in the defconfig
Date: Tue,  6 May 2025 19:09:17 +0200
Message-ID: <20250506170924.3513161-9-mingo@kernel.org>
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

These days all distros enable KVM, and since the x86 defconfig
aims to be a distro kernel work-alike with fewer drivers and
a shorter build time, enable the KVM host in the defconfig too.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 arch/x86/configs/defconfig.x86_64 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/configs/defconfig.x86_64 b/arch/x86/configs/defconfig.x86_64
index 7d7310cdf8b0..156e9490e29b 100644
--- a/arch/x86/configs/defconfig.x86_64
+++ b/arch/x86/configs/defconfig.x86_64
@@ -50,6 +50,11 @@ CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_ONDEMAND=y
 CONFIG_X86_ACPI_CPUFREQ=y
 CONFIG_IA32_EMULATION=y
+CONFIG_KVM=y
+CONFIG_KVM_INTEL=y
+CONFIG_KVM_AMD=y
+CONFIG_KVM_XEN=y
+CONFIG_KVM_MAX_NR_VCPUS=4096
 CONFIG_KPROBES=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
-- 
2.45.2

