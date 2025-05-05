Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091B120D519
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443416; cv=none; b=nH4hBCHU5urdzHskehvDJuIBgVgx03W/0ReIvbNWwunkvjtpZP6innQdgO2mfMVi4nsN/ML/OBc2M/lm+aJTzYUYdenCFUY41naqIpsyGNXQtgs7bdezD8kRcqJDOnYc1NsxwSpn+6GmE+cM4KJpyUYv8ZP1CQ5LTNp4XMbb0Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443416; c=relaxed/simple;
	bh=wAoDI1YaN5dxg6WT9WRKd3hmOWwjwJ7b0sdWyMGaRTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uyn6JpIX5vW4zRD5AD7sD7jT9fq2n8c86W3VzfyvUeOCBP83v1lZQuMzeD1SSupCDQS3MwiZkIbJxKZjI5nrG4PSbQfucoAR9Nfuq2ZLquZzvzo7FVWsCw+LbWYtHS5CkDQUCcMvRQY28ANbBXn9tweX/MZuffYIF/ueQgH3UEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGLekv0U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGLekv0U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC7EC4CEEF;
	Mon,  5 May 2025 11:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443415;
	bh=wAoDI1YaN5dxg6WT9WRKd3hmOWwjwJ7b0sdWyMGaRTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kGLekv0UWXRgIUJ/GiflZ75BbbwJewSWUNATE638UlRJGNmXIa9aI/kA6PaaOjhmv
	 xIHJVp8VGiI87lgYJpxPLh42iwN4qBCIBwT2h6aFThEmOwdZRf3HsXl4ckscXDMpTR
	 kYFJWHfrft6WipkfpK992YQDVMQtrNxbAKh27cUAmb837Jfk7z1iH0bI3JjP9+1yJ7
	 TH/KzfDz+EZsVcAAwxwbg4FktPfi2H/zVlsuUt94QV6frx9UE0YA+gldZc+UKVbwN+
	 Beq40P1WhTNocthg93/fvyD+h+NuSTn/Zq8ITd5PZdRdsPg0GPhyMulRLlNxNxpC5b
	 7de2Mb0k5SyTA==
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
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 08/15] x86/kconfig/64: Enable the KVM host in the defconfig
Date: Mon,  5 May 2025 13:09:39 +0200
Message-ID: <20250505110946.1095363-9-mingo@kernel.org>
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

