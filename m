Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C5F253F1B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134250; cv=none; b=CPMNzxeRajenpP2fKfvXXFzaitdCYdeAZtdK/UijguMlhXzhcu3jMS4zrXQshOhiXGLO9KjedX+Cc0B8xO0p/qq71LuFZru2cPPQsiAJJUOqG3GytC+zCXkKTns9PgjrAjYS38yugovV6SviNoM25Kc5qDj1hHvf5UOnEmY8E/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134250; c=relaxed/simple;
	bh=h6TuMZ8NsTPjlfYRH4O93ZA4QFgYtVi5cpvqX4afx/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZAVPcnZ2xVDXsqGf0VFpaZ7+4djp67O/zdVj2wAduRZJZPA5j5lfg4vBzJiTFPVQHnZ9N5uGZ/KvnvNilmsr2Ylq4X/5f2aAoWYoHQcqKfB7k7II0E3J9FX2hKffyjhAuuZ0gaxkVCYkzc4RUDuMB+ChvuAATFFerJGGuBI8blI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBzHMkLD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBzHMkLD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D32C4CEEB;
	Tue, 13 May 2025 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747134249;
	bh=h6TuMZ8NsTPjlfYRH4O93ZA4QFgYtVi5cpvqX4afx/M=;
	h=From:To:Cc:Subject:Date:From;
	b=HBzHMkLDyskjJ6eSyfyk4T8elA4NlfbKCzcTD6F/PqNjrWr+BoVjIHrrVmB1oIoyw
	 YEmOpHQ1+QH9P/P8B/vqc+AntJthrx6ckq13ce1LPNHS/syQoOgKnTTiS5JKwmfghC
	 8/e08DhymFsGa7rISelR9MDnllLULCnqaay287JqC8iyWnnJjVQy2hpfX1wUGhS8WC
	 lpL4UdIx8dxfqeKXyJ+OUtT1kcrWvyYVbbWvJx3NjLg/KrIOxznPIuABRDm6J8UvQI
	 k/rzYqN/OremMGj++nYXhBl7JWZoZpDOR3iVmYsUtOTsh6nRqV8OJIOxB63BV0q8O6
	 zIehluQHN0Tug==
From: Borislav Petkov <bp@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH] x86/bugs: Fix SRSO reporting on Zen1/2 with SMT disabled
Date: Tue, 13 May 2025 13:04:05 +0200
Message-ID: <20250513110405.15872-1-bp@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

1f4bb068b498 ("x86/bugs: Restructure SRSO mitigation") does this:

  if (boot_cpu_data.x86 < 0x19 && !cpu_smt_possible()) {
          setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
          srso_mitigation = SRSO_MITIGATION_NONE;
          return;
  }

and, in particular, sets srso_mitigation to NONE. This leads to
reporting

  Speculative Return Stack Overflow: Vulnerable

on Zen2 machines.

There's a far bigger confusion with what SRSO_NO means and how it is
used in the code but this will be a matter of future fixes and
restructuring to how the SRSO mitigation gets determined.

Fix the reporting issue for now.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Cc: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 47c74c4ae206..dd8b50b4ceaa 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -2942,7 +2942,9 @@ static void __init srso_update_mitigation(void)
 	    boot_cpu_has(X86_FEATURE_IBPB_BRTYPE))
 		srso_mitigation = SRSO_MITIGATION_IBPB;
 
-	if (boot_cpu_has_bug(X86_BUG_SRSO) && !cpu_mitigations_off())
+	if (boot_cpu_has_bug(X86_BUG_SRSO) &&
+	    !cpu_mitigations_off() &&
+	    !boot_cpu_has(X86_FEATURE_SRSO_NO))
 		pr_info("%s\n", srso_strings[srso_mitigation]);
 }
 
-- 
2.43.0

