Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7152A1C9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745007526; cv=none; b=m0KU8eN+330nW4gGWK5nAfCX7/8au7YnAYAf6TLVRE+1GzXBTqQlieWcLlzZekVauX6WhIappIGpcomvMtrpZ2ubaH3LuN3/fEZc3k4s77euGeMzUECJshOtdQlmTiF8DEkiW2FK/LMtghO4yPON0hOJqe5k/ag7BEY8j50QwKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745007526; c=relaxed/simple;
	bh=oI25l/tYuye+etcbzoAcIjQEHufHp/aZs+B168kAb0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CsBHsSG4b91tZlDIVljYtf4OcgGAJWgGeV8K9cubBnIGpE0ET7sYObsJSsgK5rwrjq6aZQrJbrhFjTUP9UfSmmXR52Boy7o2FcF/S8NgdWB72JDZ6479DN1GJ+yZWKmA1mKqEtTm8+xmIwaioKqFk3sGiqxZsnVJji6YkLltAdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFFXpGlf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFFXpGlf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D775C4CEE2;
	Fri, 18 Apr 2025 20:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745007526;
	bh=oI25l/tYuye+etcbzoAcIjQEHufHp/aZs+B168kAb0g=;
	h=Date:From:To:Cc:Subject:From;
	b=LFFXpGlf5UDQJ9LRQhAir/evTLVdQZ68heCchsiG7GWR3Vbc8aCLygQgVWtpHZObk
	 RoSqLJDRzhm5/9VunAEIGPrmDnSAfuXmbTnlbXAqN2nk9ZjGePjlbXRjIALvhmZ2UQ
	 3GgDcqmWTqE2O35vzsVpohqwaqBaKVv7xypeZsOjZep9ogjM5Copz2iEyYGUixLfWG
	 dRkRtM2xlZnwBZAGfOAcgaSXtR2019jMpCYiOkOZZ49awCnfHkAzuh1NI7J2+3E0Cb
	 Mr5pBd4ZdhJ4EyJM6ae0OiDDGim++qB6+SO3VSEyOCnB5EEMk04p5YokEZbURN+A/r
	 Oz01T3jazFdeg==
Date: Fri, 18 Apr 2025 22:18:43 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [GIT PULL] core/urgent fixes
Message-ID: <aAKzo5Bmkp3BSqsO@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest core/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core-urgent-2025-04-18

   # HEAD: 1013f5636fd808569c1f4c40a58a4efc70713a28 genksyms: Handle typeof_unqual keyword and __seg_{fs,gs} qualifiers

Fix a genksyms related bug, triggered by recent changes to the percpu
code, and update the .clang-format file to not include obsolete
function names.

 Thanks,

	Ingo

------------------>
Ingo Molnar (1):
      clang-format: Update the ForEachMacros list for v6.15-rc1

Uros Bizjak (1):
      genksyms: Handle typeof_unqual keyword and __seg_{fs,gs} qualifiers


 .clang-format               | 41 +++++++++++++++++++++++++++++++++++++----
 scripts/genksyms/keywords.c |  7 +++++++
 scripts/genksyms/parse.y    |  5 ++++-
 3 files changed, 48 insertions(+), 5 deletions(-)
