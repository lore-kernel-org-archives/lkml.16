Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7771EE03D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433088; cv=none; b=uc/6yYczKT/MVzVG1Qitj/YCm4hCdTn7LHDtH7TcFSYG6dlwIFJrUdphNyAALMJVxyVIkrVJrNAsfBwwauJ66aUgNSUp/uNb/H0LhKaxY5zS/LfnwP9RYdVADPUZgGBwYO/2iVJStU4n+DOdUDnznijBBygPgkPbrpvxMaIrfis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433088; c=relaxed/simple;
	bh=YHKk9rU1/enVF4zlikIbjl4EE3E1d0Cmb92TgGqDlH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oa/355MT/jObZjG4kXy0fguL4mhrVFLH2n/4tp5d76AA+q8wMH90I7SZNwrhOiay31qJ5iX2l04mG+Seip284WofqJFaT/uExuac8rPAlUQnbHYw9Qfh8lf1zO/h6EE7k4JCpK5/Y01cdwLUv3o33MgNA9eJ+iINuQuhZbGVLno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=rlGnLSJl; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="rlGnLSJl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=yqYrW0kL68U4pB/ROcFLjIt0w7CoMEKnknDWg+6P7ZY=; t=1746433086; x=1747642686; 
	b=rlGnLSJlHtN19DnAUwV5X1BH1wltt1u7B2lof0pxPEvbfcJLa57SPJHhGPFkqW5yjTfkNWAryyR
	La/Wf7haaKvzpDuOLYtbJL0KgIicvXgrobzY5O0scZIJrI9NPdYdveWzaQ+DwC9lhOGh2N/GmeDjD
	uVReXLO87AfdEf3NFUWKBEE4jgjsv4UrUjLUTocU1zIu+iJiE5z1QtIkVwZJzgSaBxiYuTfbq5i5J
	9mN55xRbuY/BzUlZDecNrInIQAgtkDIxevCSYBjfnEGBKAnXa1dweu9IvOuwZwLHVuJo1I1Kf+hAS
	o9+iX0HqNq2GsDVR3Hmpw4GzfC4RPaTO/vVA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uBr1X-000000043hu-2IA3;
	Mon, 05 May 2025 10:18:03 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: [GIT PULL] uml 6.15-rc6
Date: Mon,  5 May 2025 10:15:32 +0200
Message-ID: <20250505081753.12266-3-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

We really should've sent this much earlier, apologies.
There's just a single fix here for the _nofault changes
that were causing issues with clang, and then when we
looked at it some other issues seemed to exist.

Please pull and let us know if there's any problem.

Thanks,
johannes



The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-linux-6.15-rc6

for you to fetch changes up to 68025adfc13e6cd15eebe2293f77659f47daf13b:

  um: fix _nofault accesses (2025-05-05 10:06:51 +0200)

----------------------------------------------------------------
A single fix for _nofault infrastructure.

----------------------------------------------------------------
Johannes Berg (1):
      um: fix _nofault accesses

 arch/um/include/asm/uaccess.h            |  2 ++
 arch/um/kernel/trap.c                    | 26 +++++++++++++-------------
 arch/x86/um/shared/sysdep/faultinfo_32.h |  2 +-
 arch/x86/um/shared/sysdep/faultinfo_64.h |  2 +-
 4 files changed, 17 insertions(+), 15 deletions(-)
