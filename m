Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0F029B792
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310829; cv=none; b=LCsqUUCeIjlQGPF4CVa+V5iSK7z+Y6henjovuXWoOO16QlkNmrEGRhKFRu404QOIgrzDltbSVDgObWtRouSTqE9H7lR2J27EUiqXrjh7Ia0qEK1ws/Ct2e6LtcDEsd21SiBgKzG5dnXfoq1ji/XUXmXpFX7x3fdHAvX+SzO1+XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310829; c=relaxed/simple;
	bh=0bVLepRmSf4x42XCWjSkvidF6vxwDbzkDvwqQdZ6Yjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EkUNIa6VsLFCgORyk48eyZlg8U1QUHtOmXHk2A7enW3vRErSY2UVLg/0qH3cL1p9t0r4q+FxWsrNtgl7s4pDSLbHzoMYygg3CK0BZ6UcJc8S0TSDYvds7LrH7sxHRWgkTZTI7GmTycKDpsBS34wEy13hoNlIt7EH/42qDNZ5NB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cmz/Dffe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cmz/Dffe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CBE2C4CEE9;
	Thu, 15 May 2025 12:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310829;
	bh=0bVLepRmSf4x42XCWjSkvidF6vxwDbzkDvwqQdZ6Yjo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cmz/DffeKKpKIicL52xP7tQz7bi5fjZsxgdh2m9n4LvmmEeDwm8/fZFfqp3Ocqrnc
	 fT+hKgwkwJAa6TH8mYlx1fPa/65KpIGMote3OZTIz4AaWrkv73yWg2eMeeT8Ujdbyt
	 iPWfUMto5FmZVw79MLvUOU8RCa4bD5QgnGebGA3RDAqbYsG9dnOrE7hkfP5kskb3Pl
	 zDpLDO4Y9PzDgFryVRJQzR9i7xrvYXY3VCWvpQAz9FesGPnbwklVbzuyhDrQw7ns04
	 QMORKDrDf9VgjzOetR4HGQMFCHaqE6MHdCxsWlnMnSiQVzQUaAk5El16IsfpgufkME
	 WNfFzvt7fUS3Q==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
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
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 21/32] x86/boot/e820: Change e820_search_gap() to search for the highest-address PCI gap
Date: Thu, 15 May 2025 14:05:37 +0200
Message-ID: <20250515120549.2820541-22-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515120549.2820541-1-mingo@kernel.org>
References: <20250515120549.2820541-1-mingo@kernel.org>
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
index d00ca2dd20b7..b2e2ada50adb 100644
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

