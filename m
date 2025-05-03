Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C231FAA
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 23:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746313315; cv=none; b=NecHOkZAm1vmHCvyQis7GsFf6D7aks9w8cLW/qPQHolnUACGT66P81Z1N8gt9YYqkTevDTmxepPIoJXAYR0Rr/sY3/Jh4stX9lSOZ6o4URcvPtX6jkMGvipf5f4EFJdqW6EBahFkSYDAw+qCi4Gv5a4mOmH30VhTR8s97z3Zrbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746313315; c=relaxed/simple;
	bh=D04544YY5YKWIz+eOOancW9M0tIDtWJNvQo1W+YhcT8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TfYMddeyOWLfFuDciMZygGoa2ARdArh/P8d4qO5XbqV5nzCel3YZlcC9wiinVLIVHwsyM4DNs0JwJlArdeqjcr0qRV9wiPpWoHJYQNSt8JT2nWS1xppLFoLCYHVfRzzDLcbYMWlx1uttBoeVcVkMN7WmLlmLkNsJrB6QFpJ4K90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8H3Nx7f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8H3Nx7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7050FC4CEE3;
	Sat,  3 May 2025 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746313314;
	bh=D04544YY5YKWIz+eOOancW9M0tIDtWJNvQo1W+YhcT8=;
	h=From:To:Cc:Subject:Date:From;
	b=U8H3Nx7fg8O4Zbd2BdnB5FwH/GXIQDayV/jEpHLxSpWW/FoKlMzI+RULL9IG9z1aX
	 pPzavXXcQ5VrXBfCk7w9WiA1fF9Zk7zvcWlDJ0LbcBY1yBwuOuGPI+B8APhRgPgVzd
	 RHCuk9O1Hsq379RzC10htGKnATBuscJmGtUGjbVoXkccZu32gh1IP5nMVRfSyo/zxg
	 zVVHC8MfZT3tM2bDzccoHS7R7/ME6U107EZLHFDr8p22tUszWTEE7Hp0Q4IC0L9iQQ
	 f3MPvIDzgH3EEujJn35QCrufmEzAytCftplRVaaMqAOcpOFFdK1FxAtNhBZRfG2VT/
	 /MUBWitJD/Hng==
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.15-rc5
Date: Sun,  4 May 2025 00:01:51 +0100
Message-Id: <20250503230151.2578203-1-cmarinas@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull the arm64 fix below. Thanks.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to fee4d171451c1ad9e8aaf65fc0ab7d143a33bd72:

  arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays (2025-05-01 17:44:18 +0100)

----------------------------------------------------------------
Add missing sentinels to the arm64 Spectre-BHB MIDR arrays, otherwise
is_midr_in_range_list() reads beyond the end of these arrays.

----------------------------------------------------------------
Will Deacon (1):
      arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays

 arch/arm64/kernel/proton-pack.c | 2 ++
 1 file changed, 2 insertions(+)
