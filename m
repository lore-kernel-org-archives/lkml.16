Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65956221544
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168502; cv=none; b=dSbGmbe/ki5ctN44BKe8bMBur1Ab/THdCcv9Rsu34MqVM8VA3bCWL2asFmpu0PMa3Zpx8LVLG1YdFy/LXUneBZaGGnv2XtjtGvL4CjChPmsgz3NzoF46NchR7hIedeCMgL+NQWW3/vMSGH8eew82v9w6Sbbvl615xG1/pZORLzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168502; c=relaxed/simple;
	bh=n7ntESqylVRPbiYcAi7Lvjwrj3FNVhCQtHzxQk/n5tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6BeRCH9kmk5+IV3y4FgM5UEtaL+YMsFkU0VmMXDDyvzM0viDIg6M29zjQXPtpP3IPr6aVFKG+o+Qhv5FgWNBeI/rp+t+JCoo7Pzz506gJNxVXLjAQw01QxDMkGL++7HgkxLT1N2TZA2qHmk1NBqGYm+hmPuER5AMnklnC4w9Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1TqWFTm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1TqWFTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A72C4CEE4;
	Fri, 28 Mar 2025 13:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168501;
	bh=n7ntESqylVRPbiYcAi7Lvjwrj3FNVhCQtHzxQk/n5tk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L1TqWFTmtzksYIF0lLS1ZEq6jZOf1ChDlXrOwOEddAUtOjUHp4AiiwVyRnaFFtQ+A
	 /egvDvllKqpL33fEazBdnSNET6PokExuAEACzYMFLSlth/XpMkP3LLj/H7uPSSV3W5
	 +nNiGoCGiYfhOGAbCtH1Wf/bBsi2yhk3y2WurTcrdGaCrs+z+KP+CEyRWEz1tyAg9/
	 ds+f0AAqj29p3BkV7y88RjV5hdsm5RzMcTp9WJVkLdtVccxsZN4HvExjrfamgqaGj+
	 4JpFaW9HBSHdg8x+At+C/7XejqoZOtQjxwexvl/d4dCfcw09ul50SfCkwUH0pfizcw
	 RGwxfcl62nG5g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 24/49] x86/alternatives: Assert input parameters in smp_text_poke_batch_process()
Date: Fri, 28 Mar 2025 14:26:39 +0100
Message-ID: <20250328132704.1901674-25-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>
References: <20250328132704.1901674-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At this point the 'tp' input parameter must always be the
global 'tp_vec' array, and 'nr_entries' must always be equal
to 'tp_vec_nr'.

Assert these conditions - which will allow the removal of
a layer of indirection between these values.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 70abc636b87c..6652863539e8 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2627,6 +2627,9 @@ static void smp_text_poke_batch_process(struct smp_text_poke_loc *tp, unsigned i
 
 	lockdep_assert_held(&text_mutex);
 
+	WARN_ON_ONCE(tp != tp_vec);
+	WARN_ON_ONCE(nr_entries != tp_vec_nr);
+
 	int3_vec.vec = tp;
 	int3_vec.nr_entries = nr_entries;
 
-- 
2.45.2

