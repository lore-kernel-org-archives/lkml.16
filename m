Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452B325FA32
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095747; cv=none; b=s7rsHmARZ1JloivlNnjZjlzD2r3NQkc12mA0/qGNEWeK6zp5Dp6Kk+fbYEj1ohA4h67a2mTGXlg88goSCOH9CphZuQIkEtoWU9U0kcrRpcd0Hd7EUgS9eThj8Wmz1c3VHvcCfQtne7fA4HwC7ARuDNRJrHK9WtFQ0itd1uMsyqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095747; c=relaxed/simple;
	bh=SBUDINiLyQ7t66jKolDruYGdHapsNuOiOzSyeiA3nqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnS7bb/sSRekBYuuFkjtH9Icq5FqWJpFNIRN1EYP3lpY1sVzRbsJWfrWk8nUvsbOu6CoKXV/I+otWNuJDxQT3mR7nFZ02XqZn3Uluh8iuD2qPuW4ngJ9ZeQqgo8ZYV8iPARhyE+B2bMF13ktN9Vfxn2VArvAPkiubl42e4z+lIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehr36aq3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehr36aq3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEADDC4CEEC;
	Tue,  8 Apr 2025 07:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744095747;
	bh=SBUDINiLyQ7t66jKolDruYGdHapsNuOiOzSyeiA3nqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ehr36aq3g4yD9MDkfuZOnbbQlwCL1vDRhazEB5LNY+ji13HMQDSzBI4WMFcNjHHdc
	 zaO5PcKnHNltbkrhVp7FXU8m3myan5PqxXuvWQy1oEm7OAzgFXo4q3Hoz3DbF7pvXK
	 P+5vsy7f7i/4tjjgFKZ2PODVvrrtM+yP1Q8INAFmX/OtO2HHkitZHb4gVJRet2hliK
	 wVgTm3K40EOemYmkzsvSz+VEKii8h+AewGNWj8NQRDQI50xGF9LSilkpWuD5xNm1jo
	 VU3F1trO9nXUoSqBjdx2dvR7f+h+EhNDInC7e5yGbQ6mY/+Ohf95fr01/95UOwAHQK
	 2r1tXgL2YSWpQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 3/4] objtool: Stop UNRET validation on UD2
Date: Tue,  8 Apr 2025 00:02:15 -0700
Message-ID: <ce841269e7e28c8b7f32064464a9821034d724ff.1744095216.git.jpoimboe@kernel.org>
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

In preparation for simplifying INSN_SYSCALL, make validate_unret()
terminate control flow on UD2 just like validate_branch() already does.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 2c703b960420..2dd89b0f4d5e 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3902,6 +3902,9 @@ static int validate_unret(struct objtool_file *file, struct instruction *insn)
 			break;
 		}
 
+		if (insn->dead_end)
+			return 0;
+
 		if (!next) {
 			WARN_INSN(insn, "teh end!");
 			return 1;
-- 
2.49.0

