Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB23278F51
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 01:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745804894; cv=none; b=dzuZ0Q5grRlNYpjSRqlL4haAhdVOyFnz+TkPaTf1x9g1Zt6RDefZ926+MBQkZ3C0nRZINigzUXvjooelCWOurVX9mhNYd5Ot1sB/rkbvQca/p1F1ojMmqJuOOmBjnPL0EuMu9rfs3bHbCwIaOAkdayYQArcLwVQnhfQj6gmsA9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745804894; c=relaxed/simple;
	bh=NTJ5NmMjmIs4TsuN1yCnCiO567hQj22BwG2ZQtwnGeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F4RfvYXrmKA3az0yelZ7tr9OqZ9D+Vpz4H2gUKMbGGv5pxipe/gvr+ai7TsmO1K8REBltGE9HCddKYtr/7s0Ip5EszI4EUk6xYFbOy3WWuVNv2vwKMJkNHq5o3OrolEBxcL3/sWWzYYzJePvYbLKJKl5DacCcGdXI0Yjtlv0a00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qaUbiF7r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qaUbiF7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729CAC4CEE3;
	Mon, 28 Apr 2025 01:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745804894;
	bh=NTJ5NmMjmIs4TsuN1yCnCiO567hQj22BwG2ZQtwnGeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qaUbiF7rIDBvUeDmRumJ/wX6L1V9sIqcKKqxOaR6d17evgT+tQ+DWRXZ/nfI2clkz
	 zsIYD6nhIGJLLfaqwn6TYa8n91AP/5lbgwP8tiNoG0FYEpkuZFRwSJMeeKfbYkdvCw
	 6ar/nLL/7COIVtT8PQFzK2AfSXw86W53tjLSauZRwkcPCIpF2mc0T2Agt8lVS4PKdy
	 5E9ckMzoiMNb5pqRFhSUJJcEloFqz6/GVlf1xvVt4Luhr4iv7NxwQ4n2bztx1QaDK4
	 /wJEUOoNQb4u0Q9sISheq0Uf0lEKob64+TXFFLtNTpPNdTKI1hFXaw45VA4bZkEGyH
	 rAFEEUnt7B57Q==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH 1/2] x86: Fix opcode map (!REX2) superscript tags
Date: Mon, 28 Apr 2025 10:48:10 +0900
Message-ID: <174580489027.388420.15539375184727726142.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <174580488057.388420.1338751162448700082.stgit@devnote2>
References: <174580488057.388420.1338751162448700082.stgit@devnote2>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Commit 159039af8c07 ("x86/insn: x86/insn: Add support for REX2 prefix
to the instruction decoder opcode map") added (!REX2) superscript with
a space, but the correct format requires ',' for concatination with
other superscript tags.
Add ',' to generate correct insn attribute tables.

I confirmed with following command.
-----
> awk -f arch/x86/tools/gen-insn-attr-x86.awk \
    arch/x86/lib/x86-opcode-map.txt | grep e8 | head -n 1
[0xe8] = INAT_MAKE_IMM(INAT_IMM_VWORD32) | INAT_FORCE64 | INAT_NO_REX2,
-----

Fixes: 159039af8c07 ("x86/insn: x86/insn: Add support for REX2 prefix to the instruction decoder opcode map")
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/x86/lib/x86-opcode-map.txt       |   50 +++++++++++++++++----------------
 tools/arch/x86/lib/x86-opcode-map.txt |   50 +++++++++++++++++----------------
 2 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/arch/x86/lib/x86-opcode-map.txt b/arch/x86/lib/x86-opcode-map.txt
index caedb3ef6688..5e2fa3f7128e 100644
--- a/arch/x86/lib/x86-opcode-map.txt
+++ b/arch/x86/lib/x86-opcode-map.txt
@@ -35,7 +35,7 @@
 #  - (!F3) : the last prefix is not 0xF3 (including non-last prefix case)
 #  - (66&F2): Both 0x66 and 0xF2 prefixes are specified.
 #
-# REX2 Prefix
+# REX2 Prefix Superscripts
 #  - (!REX2): REX2 is not allowed
 #  - (REX2): REX2 variant e.g. JMPABS
 
@@ -286,10 +286,10 @@ df: ESC
 # Note: "forced64" is Intel CPU behavior: they ignore 0x66 prefix
 # in 64-bit mode. AMD CPUs accept 0x66 prefix, it causes RIP truncation
 # to 16 bits. In 32-bit mode, 0x66 is accepted by both Intel and AMD.
-e0: LOOPNE/LOOPNZ Jb (f64) (!REX2)
-e1: LOOPE/LOOPZ Jb (f64) (!REX2)
-e2: LOOP Jb (f64) (!REX2)
-e3: JrCXZ Jb (f64) (!REX2)
+e0: LOOPNE/LOOPNZ Jb (f64),(!REX2)
+e1: LOOPE/LOOPZ Jb (f64),(!REX2)
+e2: LOOP Jb (f64),(!REX2)
+e3: JrCXZ Jb (f64),(!REX2)
 e4: IN AL,Ib (!REX2)
 e5: IN eAX,Ib (!REX2)
 e6: OUT Ib,AL (!REX2)
@@ -298,10 +298,10 @@ e7: OUT Ib,eAX (!REX2)
 # in "near" jumps and calls is 16-bit. For CALL,
 # push of return address is 16-bit wide, RSP is decremented by 2
 # but is not truncated to 16 bits, unlike RIP.
-e8: CALL Jz (f64) (!REX2)
-e9: JMP-near Jz (f64) (!REX2)
-ea: JMP-far Ap (i64) (!REX2)
-eb: JMP-short Jb (f64) (!REX2)
+e8: CALL Jz (f64),(!REX2)
+e9: JMP-near Jz (f64),(!REX2)
+ea: JMP-far Ap (i64),(!REX2)
+eb: JMP-short Jb (f64),(!REX2)
 ec: IN AL,DX (!REX2)
 ed: IN eAX,DX (!REX2)
 ee: OUT DX,AL (!REX2)
@@ -478,22 +478,22 @@ AVXcode: 1
 7f: movq Qq,Pq | vmovdqa Wx,Vx (66) | vmovdqa32/64 Wx,Vx (66),(evo) | vmovdqu Wx,Vx (F3) | vmovdqu32/64 Wx,Vx (F3),(evo) | vmovdqu8/16 Wx,Vx (F2),(ev)
 # 0x0f 0x80-0x8f
 # Note: "forced64" is Intel CPU behavior (see comment about CALL insn).
-80: JO Jz (f64) (!REX2)
-81: JNO Jz (f64) (!REX2)
-82: JB/JC/JNAE Jz (f64) (!REX2)
-83: JAE/JNB/JNC Jz (f64) (!REX2)
-84: JE/JZ Jz (f64) (!REX2)
-85: JNE/JNZ Jz (f64) (!REX2)
-86: JBE/JNA Jz (f64) (!REX2)
-87: JA/JNBE Jz (f64) (!REX2)
-88: JS Jz (f64) (!REX2)
-89: JNS Jz (f64) (!REX2)
-8a: JP/JPE Jz (f64) (!REX2)
-8b: JNP/JPO Jz (f64) (!REX2)
-8c: JL/JNGE Jz (f64) (!REX2)
-8d: JNL/JGE Jz (f64) (!REX2)
-8e: JLE/JNG Jz (f64) (!REX2)
-8f: JNLE/JG Jz (f64) (!REX2)
+80: JO Jz (f64),(!REX2)
+81: JNO Jz (f64),(!REX2)
+82: JB/JC/JNAE Jz (f64),(!REX2)
+83: JAE/JNB/JNC Jz (f64),(!REX2)
+84: JE/JZ Jz (f64),(!REX2)
+85: JNE/JNZ Jz (f64),(!REX2)
+86: JBE/JNA Jz (f64),(!REX2)
+87: JA/JNBE Jz (f64),(!REX2)
+88: JS Jz (f64),(!REX2)
+89: JNS Jz (f64),(!REX2)
+8a: JP/JPE Jz (f64),(!REX2)
+8b: JNP/JPO Jz (f64),(!REX2)
+8c: JL/JNGE Jz (f64),(!REX2)
+8d: JNL/JGE Jz (f64),(!REX2)
+8e: JLE/JNG Jz (f64),(!REX2)
+8f: JNLE/JG Jz (f64),(!REX2)
 # 0x0f 0x90-0x9f
 90: SETO Eb | kmovw/q Vk,Wk | kmovb/d Vk,Wk (66)
 91: SETNO Eb | kmovw/q Mv,Vk | kmovb/d Mv,Vk (66)
diff --git a/tools/arch/x86/lib/x86-opcode-map.txt b/tools/arch/x86/lib/x86-opcode-map.txt
index caedb3ef6688..5e2fa3f7128e 100644
--- a/tools/arch/x86/lib/x86-opcode-map.txt
+++ b/tools/arch/x86/lib/x86-opcode-map.txt
@@ -35,7 +35,7 @@
 #  - (!F3) : the last prefix is not 0xF3 (including non-last prefix case)
 #  - (66&F2): Both 0x66 and 0xF2 prefixes are specified.
 #
-# REX2 Prefix
+# REX2 Prefix Superscripts
 #  - (!REX2): REX2 is not allowed
 #  - (REX2): REX2 variant e.g. JMPABS
 
@@ -286,10 +286,10 @@ df: ESC
 # Note: "forced64" is Intel CPU behavior: they ignore 0x66 prefix
 # in 64-bit mode. AMD CPUs accept 0x66 prefix, it causes RIP truncation
 # to 16 bits. In 32-bit mode, 0x66 is accepted by both Intel and AMD.
-e0: LOOPNE/LOOPNZ Jb (f64) (!REX2)
-e1: LOOPE/LOOPZ Jb (f64) (!REX2)
-e2: LOOP Jb (f64) (!REX2)
-e3: JrCXZ Jb (f64) (!REX2)
+e0: LOOPNE/LOOPNZ Jb (f64),(!REX2)
+e1: LOOPE/LOOPZ Jb (f64),(!REX2)
+e2: LOOP Jb (f64),(!REX2)
+e3: JrCXZ Jb (f64),(!REX2)
 e4: IN AL,Ib (!REX2)
 e5: IN eAX,Ib (!REX2)
 e6: OUT Ib,AL (!REX2)
@@ -298,10 +298,10 @@ e7: OUT Ib,eAX (!REX2)
 # in "near" jumps and calls is 16-bit. For CALL,
 # push of return address is 16-bit wide, RSP is decremented by 2
 # but is not truncated to 16 bits, unlike RIP.
-e8: CALL Jz (f64) (!REX2)
-e9: JMP-near Jz (f64) (!REX2)
-ea: JMP-far Ap (i64) (!REX2)
-eb: JMP-short Jb (f64) (!REX2)
+e8: CALL Jz (f64),(!REX2)
+e9: JMP-near Jz (f64),(!REX2)
+ea: JMP-far Ap (i64),(!REX2)
+eb: JMP-short Jb (f64),(!REX2)
 ec: IN AL,DX (!REX2)
 ed: IN eAX,DX (!REX2)
 ee: OUT DX,AL (!REX2)
@@ -478,22 +478,22 @@ AVXcode: 1
 7f: movq Qq,Pq | vmovdqa Wx,Vx (66) | vmovdqa32/64 Wx,Vx (66),(evo) | vmovdqu Wx,Vx (F3) | vmovdqu32/64 Wx,Vx (F3),(evo) | vmovdqu8/16 Wx,Vx (F2),(ev)
 # 0x0f 0x80-0x8f
 # Note: "forced64" is Intel CPU behavior (see comment about CALL insn).
-80: JO Jz (f64) (!REX2)
-81: JNO Jz (f64) (!REX2)
-82: JB/JC/JNAE Jz (f64) (!REX2)
-83: JAE/JNB/JNC Jz (f64) (!REX2)
-84: JE/JZ Jz (f64) (!REX2)
-85: JNE/JNZ Jz (f64) (!REX2)
-86: JBE/JNA Jz (f64) (!REX2)
-87: JA/JNBE Jz (f64) (!REX2)
-88: JS Jz (f64) (!REX2)
-89: JNS Jz (f64) (!REX2)
-8a: JP/JPE Jz (f64) (!REX2)
-8b: JNP/JPO Jz (f64) (!REX2)
-8c: JL/JNGE Jz (f64) (!REX2)
-8d: JNL/JGE Jz (f64) (!REX2)
-8e: JLE/JNG Jz (f64) (!REX2)
-8f: JNLE/JG Jz (f64) (!REX2)
+80: JO Jz (f64),(!REX2)
+81: JNO Jz (f64),(!REX2)
+82: JB/JC/JNAE Jz (f64),(!REX2)
+83: JAE/JNB/JNC Jz (f64),(!REX2)
+84: JE/JZ Jz (f64),(!REX2)
+85: JNE/JNZ Jz (f64),(!REX2)
+86: JBE/JNA Jz (f64),(!REX2)
+87: JA/JNBE Jz (f64),(!REX2)
+88: JS Jz (f64),(!REX2)
+89: JNS Jz (f64),(!REX2)
+8a: JP/JPE Jz (f64),(!REX2)
+8b: JNP/JPO Jz (f64),(!REX2)
+8c: JL/JNGE Jz (f64),(!REX2)
+8d: JNL/JGE Jz (f64),(!REX2)
+8e: JLE/JNG Jz (f64),(!REX2)
+8f: JNLE/JG Jz (f64),(!REX2)
 # 0x0f 0x90-0x9f
 90: SETO Eb | kmovw/q Vk,Wk | kmovb/d Vk,Wk (66)
 91: SETNO Eb | kmovw/q Mv,Vk | kmovb/d Mv,Vk (66)

