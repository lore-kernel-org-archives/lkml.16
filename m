Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB3D78F3A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 01:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745804885; cv=none; b=JMLWXS/XIkIKDZRqCStcE5FCtHDUekWRSunVB/n+I0+MR/FM1N67su0e76yhMABVsFS77kIrWr29QvXmEz7rffMMsZcNvMC2rhqhZe8PEhshMZsmWHWBEC+vFW8JIMXd7I0fKu/eiMKYIx6gQEXSEKe2Is86cjtvGskRQVIQLRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745804885; c=relaxed/simple;
	bh=owGtJR24HD2E6i4X8inDB6UKRhxV+y9BjvZ6z88yvn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aTVbCT4iHNoCyNF8ZnlYqDAqvsTqI2AxburyOsH3kcZ80ka8T8ORCLL4iv5ZFINX04po2rdWVuOmj0M2RBFdwZkTTtB9LSawYMQOLjB2i0udFMSD60CNLM0erWh+jJv3/+6vl25vNf+07gmOO1Y15TQJu7XzFXU+bl+dwXVmVXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nb70Yske; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nb70Yske"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F550C4CEE3;
	Mon, 28 Apr 2025 01:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745804884;
	bh=owGtJR24HD2E6i4X8inDB6UKRhxV+y9BjvZ6z88yvn8=;
	h=From:To:Cc:Subject:Date:From;
	b=Nb70YskeU9bJFucJNCp3tJueeGIlkULNib4jfKQiJDiu1ECK8ECQ8pG2S3MtJNIdx
	 c/ee4JiTBjYpQJPq8igFt05o8SLJL+TCJH5OAQGuWodzWQWSzCyoqjTj7Ym3BSxLwi
	 dCoM2WYrKMzBQAZH5yZc5rKT4apTCtMhV+cQE6HUH7JHweuv7ylwP+YP9LD5gXRdlv
	 8+NfGLRsk+7ZvLwkO+LH0j7HpvycKFsudOwCg5u0dScyzqN7f/ISHGD0guzR6dxsRo
	 LZMuGznujw7I1dh//oxJ0b/XoRUt/lAjfal2qO3OpfOxSA2HLqgbNllCsqPig6wJDh
	 b7ptwOVNCK4JA==
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
Subject: [PATCH 0/2] x86: Fix insn decoder to support 0xEA as UD
Date: Mon, 28 Apr 2025 10:48:00 +0900
Message-ID: <174580488057.388420.1338751162448700082.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

Peter found that the current x86 instruction decoder reports the 0xEA
instruction as "JMP Ap" always. But objdump says that is invalid on
64bit mode. Thus there is a difference of lenght of 0xEA between
objdump and x86 insn decoder.

I found the opcodes which have (i64) superscript are invalid in 64bit
mode, if it is not paired with (o64). Thus this stops decoding such
instructions if insn->x86_64 is set.

With this fix, the single "0xEA" is correctly decoded as 1 byte
instruction in 64bit mode.
------
printf "0:\tea\t\n" | insn_decoder_test -y -v
insn_decoder_test: success: Decoded and checked 1 instructions
------

In this series, I also found a bug in previous (!REX2) tag. The first
commit fixes that.

---

Masami Hiramatsu (Google) (2):
      x86: Fix opcode map (!REX2) superscript tags
      x86: Stop decoding i64 instructions in x86-64 mode at opcode


 arch/x86/include/asm/inat.h                |    6 +++
 arch/x86/lib/insn.c                        |    7 +++-
 arch/x86/lib/x86-opcode-map.txt            |   56 ++++++++++++++--------------
 arch/x86/tools/gen-insn-attr-x86.awk       |    7 ++++
 tools/arch/x86/include/asm/inat.h          |    6 +++
 tools/arch/x86/lib/insn.c                  |    7 +++-
 tools/arch/x86/lib/x86-opcode-map.txt      |   56 ++++++++++++++--------------
 tools/arch/x86/tools/gen-insn-attr-x86.awk |    7 ++++
 8 files changed, 94 insertions(+), 58 deletions(-)

--
Masami Hiramatsu (Google) <mhiramat@kernel.org>
