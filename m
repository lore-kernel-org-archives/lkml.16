Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C61291E;
	Thu,  3 Apr 2025 09:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743673811; cv=none; b=GBEgX0ZMv6ij5V6jZJFkxs5dXd1KVdvK1GJdbm6sRdIzoAuvE8r3mCKhwCrzh+lmkDuuQvkk2XjMNvZ0qu40O0FHTgBifqMIxeAO8EBBPNUmfF1p9nW+n2fQcZ7ODEiAWh5GatKBmn+AhPQ+8e4ZeyE+YGEcSRRPGrp8WsmX3y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743673811; c=relaxed/simple;
	bh=TnGDFNFHTjy2FssdrhuKJ9L2jDl28k5d2aCQtujzw1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m9P+fsNkj8fNlakl909Ee5EiTGnywL4qE8uuxcMU/kbbscItLQN1Qw6kfar01N7+mTFciHObg9/jiM/2Wf65rLEsa2cR/aDoKkBSwTqjLUdcPwyP3QodqJYm+Fi4ux/57VsOMzBDmhGDkIdskji8D1uQSbjKh8T6w+JhQShJsIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUpxvzTI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUpxvzTI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35ACC4CEE3;
	Thu,  3 Apr 2025 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743673811;
	bh=TnGDFNFHTjy2FssdrhuKJ9L2jDl28k5d2aCQtujzw1A=;
	h=From:To:Cc:Subject:Date:From;
	b=VUpxvzTIroDftu7xzkqU3G/Nh0W8uussLJIX98Le2Z6n4amtOHIgoQiG1LvAF6Z8i
	 sMqKodcUMMCJhjWdYV3TAcPmLAtzmWhewtRH7BfAliauDfhh8E3S8Mhc+RnG+mSznP
	 bkXbXEVCAVJnqBiyl24udmlFPu6JJijOtH8O7CbE+CCPJzJJ1SUcH1iTXMZc2ZvQlB
	 vULBjB4jsjj5YT8dpzLE42V764eC/8Z5HY3VecRPwvw9aoy3uKt2lCBTSDRViQybOj
	 ayygayRC9VMw34WCYtJmlNCra8sXajEnxsyhW2rgyGE2bVh/Ddluj8bGjpW4nrA2aT
	 xzvT1joLazQ+g==
From: "Naveen N Rao (AMD)" <naveen@kernel.org>
To: <linux-kernel@vger.kernel.org>,
	linux-doc@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	<x86@kernel.org>
Subject: [PATCH] Documentation/x86: Clarify naming of CPU features for /proc/cpuinfo
Date: Thu,  3 Apr 2025 15:13:08 +0530
Message-ID: <20250403094308.2297617-1-naveen@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 78ce84b9e0a5 ("x86/cpufeatures: Flip the /proc/cpuinfo appearance
logic") changed how CPU feature names should be specified. Update
document to reflect the same.

Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
---
 Documentation/arch/x86/cpuinfo.rst | 42 +++++++++---------------------
 1 file changed, 13 insertions(+), 29 deletions(-)

diff --git a/Documentation/arch/x86/cpuinfo.rst b/Documentation/arch/x86/cpuinfo.rst
index 6ef426a52cdc..fecdc36e02a1 100644
--- a/Documentation/arch/x86/cpuinfo.rst
+++ b/Documentation/arch/x86/cpuinfo.rst
@@ -124,37 +124,21 @@ also defined in cpufeatures.h.
 Naming of Flags
 ===============
 
-The script arch/x86/kernel/cpu/mkcapflags.sh processes the
-#define X86_FEATURE_<name> from cpufeatures.h and generates the
-x86_cap/bug_flags[] arrays in kernel/cpu/capflags.c. The names in the
-resulting x86_cap/bug_flags[] are used to populate /proc/cpuinfo. The naming
-of flags in the x86_cap/bug_flags[] are as follows:
-
-a: The name of the flag is from the string in X86_FEATURE_<name> by default.
-----------------------------------------------------------------------------
-By default, the flag <name> in /proc/cpuinfo is extracted from the respective
-X86_FEATURE_<name> in cpufeatures.h. For example, the flag "avx2" is from
-X86_FEATURE_AVX2.
-
-b: The naming can be overridden.
---------------------------------
 If the comment on the line for the #define X86_FEATURE_* starts with a
-double-quote character (""), the string inside the double-quote characters
-will be the name of the flags. For example, the flag "sse4_1" comes from
-the comment "sse4_1" following the X86_FEATURE_XMM4_1 definition.
+double-quote character (""), the string inside the double-quote characters will
+be the name of the flag. For example, the flag "sse4_1" comes from the comment
+"sse4_1" following the X86_FEATURE_XMM4_1 definition. /proc/cpuinfo is a
+userspace interface and must remain constant. If, for some reason, the naming
+of X86_FEATURE_<name> changes, one shall retain the name already used in
+/proc/cpuinfo.
 
-There are situations in which overriding the displayed name of the flag is
-needed. For instance, /proc/cpuinfo is a userspace interface and must remain
-constant. If, for some reason, the naming of X86_FEATURE_<name> changes, one
-shall override the new naming with the name already used in /proc/cpuinfo.
-
-c: The naming override can be "", which means it will not appear in /proc/cpuinfo.
-----------------------------------------------------------------------------------
-The feature shall be omitted from /proc/cpuinfo if it does not make sense for
-the feature to be exposed to userspace. For example, X86_FEATURE_ALWAYS is
-defined in cpufeatures.h but that flag is an internal kernel feature used
-in the alternative runtime patching functionality. So, its name is overridden
-with "". Its flag will not appear in /proc/cpuinfo.
+If the comment on the line does not start with a double-quote character, then
+it will be omitted from /proc/cpuinfo. This is desirable if it does not make
+sense for the feature to be exposed to userspace. For example,
+X86_FEATURE_ALWAYS is defined in cpufeatures.h but that flag is an internal
+kernel feature used in the alternative runtime patching functionality. So, no
+name is specified within double-quotes and its flag will not appear in
+/proc/cpuinfo.
 
 Flags are missing when one or more of these happen
 ==================================================

base-commit: 1c13554a1d43317fe9009837ef6524f808e107b7
-- 
2.48.1

