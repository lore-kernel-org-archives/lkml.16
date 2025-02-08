Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C93243946
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739046847; cv=none; b=gXUIu1EPm8GJldCDBE1WDGxLKhLbtJL7kHEQj+JA1FgqQXSZORpXv0vgLN/NVnijv2iwtanvWJLykU6sFeavcI3krCz20eUgDv1FSRXBv7ygXQgWW3fYx5q/630tmpqlS5dYmcxWrtOU1D2CgWY81vdt1T0I+Xk/Oc5DRnftBN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739046847; c=relaxed/simple;
	bh=vnKHeHcFEi/dXgCxijbXcD8I5CY8A0Y6hC5FG1ZC76o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EhfSHMg6gEmq7dEjzS9gKic/TW7+J1qTOzZ3yXqbWEfW44Krb/sk3mTqrTVfkpwVgppRijGRjps//OIslkxmXuFPpy1kuGECJ74g6hrYPciQhGT4P+bU4Nqdax57GzABjJxKvu09sqtPa224LQ3FNMPn3NG1qC/QeEHMxDB51tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMIGqAjM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMIGqAjM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DF3C4CED6;
	Sat,  8 Feb 2025 20:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739046847;
	bh=vnKHeHcFEi/dXgCxijbXcD8I5CY8A0Y6hC5FG1ZC76o=;
	h=Date:From:To:Cc:Subject:From;
	b=aMIGqAjMIfahCS5cjAEIf970jkQ6HkVCAfBaJW9YEbDaGSzCNycHy4cSPeSAdd7NY
	 IzueweNK1AxXOdUfvfyXvzs3fmRgQkgg7buuEuenStRNL2LGDDfXw7M8kKA0nxiAql
	 4StJXR7vUr6QNQD0O8i7dhXSvA5xq41/j78OWkHLLmx/CLfpr7wppE1HE3dyiTHdoq
	 nSSNbHWVI5dX0EF3N0wB/1KtjbrKbLh12yzB1J15r2tkXJU/SwofhMz3bXfmv3Cn7c
	 UgfBcXGSGd+jmdIAB7H0uul945HSo1BugJlvO8d0prXLwLM2L7gkzcvpvzIUUt3cC+
	 SQ/d8igQsi4PA==
Date: Sat, 8 Feb 2025 12:34:06 -0800
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Eyal Birger <eyal.birger@gmail.com>,
	Kees Cook <kees@kernel.org>, Rafael Buchbinder <rafi@rbk.io>
Subject: [GIT PULL] seccomp fix for v6.14-rc2
Message-ID: <202502081231.AC11AB4@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this seccomp fix for v6.14-rc2. This is really a work-around
for x86_64 having grown a syscall to implement uretprobe, which has
caused problems since v6.11. This may change in the future, but for now,
this fixes the unintended seccomp filtering when uretprobe switched away
from traps, and does so with something that should be easy to backport.

Thanks!

-Kees

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/seccomp-v6.14-rc2

for you to fetch changes up to c2debdb8544f415eaf9292a866d4073912eeb561:

  selftests/seccomp: validate uretprobe syscall passes through seccomp (2025-02-06 13:19:14 -0800)

----------------------------------------------------------------
seccomp fix for v6.14-rc2

- Allow uretprobe on x86_64 to avoid behavioral complications (Eyal Birger)

----------------------------------------------------------------
Eyal Birger (2):
      seccomp: passthrough uretprobe systemcall without filtering
      selftests/seccomp: validate uretprobe syscall passes through seccomp

 kernel/seccomp.c                              |  12 ++
 tools/testing/selftests/seccomp/seccomp_bpf.c | 199 ++++++++++++++++++++++++++
 2 files changed, 211 insertions(+)

-- 
Kees Cook
