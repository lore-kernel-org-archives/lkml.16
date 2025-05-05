Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550122F478A;
	Mon,  5 May 2025 23:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486951; cv=none; b=iz3eqxYiidhTJ1Ycw5rNC46l7nInUC4rnVFPG3rLi9f3mwv9dpyCpmLhI/SJE9NINSmH71/g68HifuFBXEi9+sMn8R+JzTEijKZ6h+nJ2zdHtU9qd7EVtuVjZz0CbjTkMo1jytvLieKVGIoNZz/CjsYpKkelXPt0q5jGoijxncg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486951; c=relaxed/simple;
	bh=pHKueES8/Xf6oiD7xIjwXZCnandN1qb9OpE6s5N8vrA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C8CkLdheLBJRgkdeLMCrNC375/5+i2DKDWybKlRu9ieAmuwR20aCZ0RaAXNLaowP2HAy2LSatVr1NqVn/fQrYo9obcWUE01WB0Ooj+fARD6IYmeK/BQUBigR8TZi2sE/+vFx9yOjRxUxgf/Be9OJNtZqduYjW/PYhGhXymN0iIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlHnt2cB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlHnt2cB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CF0C4CEED;
	Mon,  5 May 2025 23:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486950;
	bh=pHKueES8/Xf6oiD7xIjwXZCnandN1qb9OpE6s5N8vrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mlHnt2cBKBrFHYwjqKgwKbXBDKFGRcY0fi9lrDn7mij4ZNwQ/qR0hrh6j4526rAcu
	 bNtMb6esmZ4R0cdod4bpohqWRy6YA+dWmoSQkck4IAe9jni2XJ3w+3Koa7L2lanXvQ
	 q/TrnN1nYyxMMq7mVQDXooVz9zBgL1N7QwZHa9PmoK3ZD8Lp1+KTdqx+23X+Zqjws4
	 CYeZ1moSKX23DyHaVtLXm9nGlcT63CI52mkg2gjyc3m0mcVz45QCS0pydVGzSBjHqY
	 Elcnvq+jBsrtFi2IIaF80HC4fgHIG1oCxpbptfjDPggzGjJMWA/mke2mHlkCwo3tqw
	 wgBAVqRPzzuuQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Breno Leitao <leitao@debian.org>,
	Ingo Molnar <mingo@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	David Kaplan <David.Kaplan@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	corbet@lwn.net,
	tglx@linutronix.de,
	bp@alien8.de,
	mingo@redhat.com,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	akpm@linux-foundation.org,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	thuth@redhat.com,
	ardb@kernel.org,
	gregkh@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 074/153] x86/bugs: Make spectre user default depend on MITIGATION_SPECTRE_V2
Date: Mon,  5 May 2025 19:12:01 -0400
Message-Id: <20250505231320.2695319-74-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
Content-Transfer-Encoding: 8bit

From: Breno Leitao <leitao@debian.org>

[ Upstream commit 98fdaeb296f51ef08e727a7cc72e5b5c864c4f4d ]

Change the default value of spectre v2 in user mode to respect the
CONFIG_MITIGATION_SPECTRE_V2 config option.

Currently, user mode spectre v2 is set to auto
(SPECTRE_V2_USER_CMD_AUTO) by default, even if
CONFIG_MITIGATION_SPECTRE_V2 is disabled.

Set the spectre_v2 value to auto (SPECTRE_V2_USER_CMD_AUTO) if the
Spectre v2 config (CONFIG_MITIGATION_SPECTRE_V2) is enabled, otherwise
set the value to none (SPECTRE_V2_USER_CMD_NONE).

Important to say the command line argument "spectre_v2_user" overwrites
the default value in both cases.

When CONFIG_MITIGATION_SPECTRE_V2 is not set, users have the flexibility
to opt-in for specific mitigations independently. In this scenario,
setting spectre_v2= will not enable spectre_v2_user=, and command line
options spectre_v2_user and spectre_v2 are independent when
CONFIG_MITIGATION_SPECTRE_V2=n.

Signed-off-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: David Kaplan <David.Kaplan@amd.com>
Link: https://lore.kernel.org/r/20241031-x86_bugs_last_v2-v2-2-b7ff1dab840e@debian.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 ++
 arch/x86/kernel/cpu/bugs.c                      | 10 +++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ede522c60ac4f..0bbe79287596d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5430,6 +5430,8 @@
 
 			Selecting 'on' will also enable the mitigation
 			against user space to user space task attacks.
+			Selecting specific mitigation does not force enable
+			user mitigations.
 
 			Selecting 'off' will disable both the kernel and
 			the user space protections.
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 75cd45f2338dc..f47590a9f6896 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1262,9 +1262,13 @@ static __ro_after_init enum spectre_v2_mitigation_cmd spectre_v2_cmd;
 static enum spectre_v2_user_cmd __init
 spectre_v2_parse_user_cmdline(void)
 {
+	enum spectre_v2_user_cmd mode;
 	char arg[20];
 	int ret, i;
 
+	mode = IS_ENABLED(CONFIG_MITIGATION_SPECTRE_V2) ?
+		SPECTRE_V2_USER_CMD_AUTO : SPECTRE_V2_USER_CMD_NONE;
+
 	switch (spectre_v2_cmd) {
 	case SPECTRE_V2_CMD_NONE:
 		return SPECTRE_V2_USER_CMD_NONE;
@@ -1277,7 +1281,7 @@ spectre_v2_parse_user_cmdline(void)
 	ret = cmdline_find_option(boot_command_line, "spectre_v2_user",
 				  arg, sizeof(arg));
 	if (ret < 0)
-		return SPECTRE_V2_USER_CMD_AUTO;
+		return mode;
 
 	for (i = 0; i < ARRAY_SIZE(v2_user_options); i++) {
 		if (match_option(arg, ret, v2_user_options[i].option)) {
@@ -1287,8 +1291,8 @@ spectre_v2_parse_user_cmdline(void)
 		}
 	}
 
-	pr_err("Unknown user space protection option (%s). Switching to AUTO select\n", arg);
-	return SPECTRE_V2_USER_CMD_AUTO;
+	pr_err("Unknown user space protection option (%s). Switching to default\n", arg);
+	return mode;
 }
 
 static inline bool spectre_v2_in_eibrs_mode(enum spectre_v2_mitigation mode)
-- 
2.39.5

