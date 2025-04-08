Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2C825F999
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095746; cv=none; b=PwvVPiuAcRpk2AneMDTtDicM+E6bK72dufxsY+MNHgDHvDTuFJmq9K5YDCVDRApksFY4aBxzN2Zw1nm7TJiVEWtLyhWEqubXJ+FIfI6FCqu9RMAz4ila7nnRCd26qrfLhZZG/6AD+DUfE2t8IcAPHSU5vbx78WczOvIWCnUkE0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095746; c=relaxed/simple;
	bh=ssSk/dLBIqnA2lH+wz9VIJewqhP/EcXBDWETR4atZWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEgnMnO0uq/BOJy5gbXHTP3VmWo402oDuRMUIDPFuM8xo3nlGBHPGF8o+ZM/9Sr5yFb1O5vPZ/NGvBFJbb1mguihNBAH5gdoMA1sxUooPfXEIEQGWdDKEUsVE8fad2ff5OQPAWBY6C+tZ+Ra2CyGYMlVDDggmQSf8ceS1LaVxwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUSAg2QI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUSAg2QI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14AF2C4CEEC;
	Tue,  8 Apr 2025 07:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744095746;
	bh=ssSk/dLBIqnA2lH+wz9VIJewqhP/EcXBDWETR4atZWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hUSAg2QIfWVCoNA4Ecwd3LzWu0neMiKLTHRrmZKFThDz2F0XJ3Izp1h7iTSa/jyrf
	 q+dNuhp08z+Ko6lf55tRn55Z2fqHManN5j2IeVR25lIoGXi1N7GvgxANO6H1vIKbux
	 eoIy7tiRnPt5Xa4w3LYFcbx+0SMDuvy/ol3uxJsq//WQ+7VvtIlv1v697tFrUgHzL6
	 Pq2Ozy8zZXj9h+EC3NbyGUbElKg5yXKZe4ozNU3StVj1gsWXZrDZ1MZGWpwdHOTA/q
	 WOXqfXiiSCNyDFkEpZMvLfg/8ASLoZ65RCXmZ/Cjd8VErpbWDywq4aI7+2f1xCMTwu
	 V3EOzjL2eDubg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 1/4] objtool: Fix INSN_CONTEXT_SWITCH handling in validate_unret()
Date: Tue,  8 Apr 2025 00:02:13 -0700
Message-ID: <f5eda46fd09f15b1f5cde3d9ae3b92b958342add.1744095216.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744095216.git.jpoimboe@kernel.org>
References: <cover.1744095216.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The !CONFIG_IA32_EMULATION version of xen_entry_SYSCALL_compat() ends
with a SYSCALL instruction which is classified by objtool as
INSN_CONTEXT_SWITCH.

Unlike validate_branch(), validate_unret() doesn't consider
INSN_CONTEXT_SWITCH in a non-function to be a dead end, so it keeps
going past the end of xen_entry_SYSCALL_compat(), resulting in the
following warning:

  vmlinux.o: warning: objtool: xen_reschedule_interrupt+0x2a: RET before UNTRAIN

Fix that by adding INSN_CONTEXT_SWITCH handling to validate_unret() to
match what validate_branch() is already doing.

Fixes: a09a6e2399ba ("objtool: Add entry UNRET validation")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 4a1f6c3169b3..c81b070ca495 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3886,6 +3886,11 @@ static int validate_unret(struct objtool_file *file, struct instruction *insn)
 			WARN_INSN(insn, "RET before UNTRAIN");
 			return 1;
 
+		case INSN_CONTEXT_SWITCH:
+			if (insn_func(insn))
+				break;
+			return 0;
+
 		case INSN_NOP:
 			if (insn->retpoline_safe)
 				return 0;
-- 
2.49.0

