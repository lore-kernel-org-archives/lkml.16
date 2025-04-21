Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A02C1F4CA9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261629; cv=none; b=IaIgkR0pM0ctG7ZJP39Kz1TTSMTr9/Jqmqis9TY3gh+gG0cEun8PxNV7e1gHX9o3kMiFWsrG5WGM8cga1Yn4nkA1XBcpezKA+I/5SNnWri1JBY1y6K2hnKqhL3LTBDgk80u36AB/kbI3+Q/bKeVY23l3HqHcWnjFHJCvbKZstwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261629; c=relaxed/simple;
	bh=8KHJkVov36KW/o3haD+BpmraKNKIgEBevaVz3JzNsZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+6qEu3vY3ozOd+iM1FQDERDc39ICWk99xaRrNNorGmPkUIRk399F/JV3hYb/+GKM72uOxmDPiy5yHzz6aMEwIrfc5up4nPJqvmpnYm2/iRHLralPX/sCa3StlLdeUWKSBUSov/P7BSdVW1RaBahkesXj33vgyHZla5ABfVwTtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyVeVm89; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyVeVm89"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E99FC4CEEB;
	Mon, 21 Apr 2025 18:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261628;
	bh=8KHJkVov36KW/o3haD+BpmraKNKIgEBevaVz3JzNsZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CyVeVm89vtt2vxBvqdr6vRwqWpzFWsY2eoZ77GmD/lH/tbz4srRxc09910xES7oAV
	 avq+U8sKTd139xBesB+ZiAnXzktLA/833lrfGeeuw/ZGg9ZRhT9JbApTiy/EvY9+nN
	 ESsi9BYDrpKfYYMUUbQofrRS3/e/xC0WMGzfl0qPzEPuNBTc9BhCZwjOuJo2N00YuM
	 bIzY5wozHzOkAxT4gQXU2ChP/YNDxOhHLR4+aml2YktYomDvO1F+6/KYer2Fzcvv3a
	 46bBJWHfVrlq2vnPa6XwXFhqMRZEZa3QCZSSez+rlf9YFQgWY+En2G+ddv7+JgHUeJ
	 4T8qA3bT5TamA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 21/29] x86/boot/e820: Change e820_search_gap() to search for the highest-address PCI gap
Date: Mon, 21 Apr 2025 20:52:01 +0200
Message-ID: <20250421185210.3372306-22-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421185210.3372306-1-mingo@kernel.org>
References: <20250421185210.3372306-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now the main x86 function that determines the position and size
of the 'PCI gap', e820_search_gap(), has this curious property:

        while (--idx >= 0) {
	...
			if (gap >= *gap_size) {

I.e. it will iterate the E820 table backwards, from its end to the beginning,
and will search for larger and larger gaps in the memory map below 4GB,
until it finishes with the table.

This logic will, should there be two gaps with the same size, pick the
one with the lower physical address - which is contrary to usual
practice that the PCI gap is just below 4GB.

Furthermore, the commit that introduced this weird logic 16 years ago:

  3381959da5a0 ("x86: cleanup e820_setup_gap(), add e820_search_gap(), v2")

  -                       if (gap > gapsize) {
  +                       if (gap >= *gapsize) {

didn't even declare this change, the title says it's a cleanup,
and the changelog declares it as a preparatory refactoring
for a later bugfix:

  809d9a8f93bd ("x86/PCI: ACPI based PCI gap calculation")

which bugfix was reverted only 1 day later without much of an
explanation, and was never reintroduced:

  58b6e5538460 ("Revert "x86/PCI: ACPI based PCI gap calculation"")

So based on the Git archeology and by the plain reading of the
code I declare this '>=' change an unintended bug and side effect.

Change it to '>' again.

It should not make much of a difference in practice, as the
likelihood of having *two* largest gaps with exactly the same
size are very low outside of weird user-provided memory maps.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 01d50331856c..24b2e8a93853 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -697,7 +697,7 @@ static int __init e820_search_gap(unsigned long *gap_start, unsigned long *gap_s
 		if (last > end) {
 			unsigned long gap = last - end;
 
-			if (gap >= *gap_size) {
+			if (gap > *gap_size) {
 				*gap_size = gap;
 				*gap_start = end;
 				found = 1;
-- 
2.45.2

