Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D7420A5DD
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748264147; cv=none; b=OvwSTaPICtqEbVBk/Tl00puEPY0iY/DZalYYWCpFXYSkjwXJ76P5mc5i7UWs0r8lEEApWGcPxSjRsi7GQYmfJsYvSYGJV1//iFf2IOZ3+bImOQObxfXNkqNB2fmfS+7MoF3yUCn8wnMYIAw4HYlvPqVEVprD5eqDdiCih66vbDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748264147; c=relaxed/simple;
	bh=KkQwgXHw8yl2iRNVVytw7enFpOc2PlsBaF7EKHxMBZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GtdsTVUG0qie29xl1q4kTWhgJqdC7OUeoeYoFZRYu7YTtrDFIf6T3ol3OVFzZsgku7F2gYgBCqyeUOTs1qfMJOUfuNfcqwy1O6vtGhK0rbVO4Mg/PMIQPUB9RTwLrIszQSeLZMFW3cc7570yPE73mlmgmeHBOmnvuSgjPA+98KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4b5b9r3YZYz4x1b5
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 14:46:40 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9962:836e:244b:c4d7])
	by xavier.telenet-ops.be with cmsmtp
	id tomY2E00e0Y7Yez01omYtE; Mon, 26 May 2025 14:46:33 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uJXDc-00000003Rpo-2huh;
	Mon, 26 May 2025 14:46:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uJXDs-0000000Beit-2cTP;
	Mon, 26 May 2025 14:46:32 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] m68k updates for v6.16
Date: Mon, 26 May 2025 14:46:24 +0200
Message-ID: <20250526124624.2778122-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v6.16-tag1

for you to fetch changes up to f440518f379d22c95329e9e0e0fb6caaafa0f8b0:

  m68k: defconfig: Update defconfigs for v6.15-rc1 (2025-05-19 13:37:36 +0200)

----------------------------------------------------------------
m68k updates for v6.16

  - One more strscpy() conversion,
  - Fix detection of real Mac II,
  - Defconfig updates.

Thanks for pulling!

----------------------------------------------------------------
Finn Thain (1):
      m68k: mac: Fix macintosh_config for Mac II

Geert Uytterhoeven (1):
      m68k: defconfig: Update defconfigs for v6.15-rc1

Thorsten Blum (1):
      m68k: Replace strcpy() with strscpy() in hardware_proc_show()

 arch/m68k/configs/amiga_defconfig    | 4 ----
 arch/m68k/configs/apollo_defconfig   | 4 ----
 arch/m68k/configs/atari_defconfig    | 4 ----
 arch/m68k/configs/bvme6000_defconfig | 4 ----
 arch/m68k/configs/hp300_defconfig    | 4 ----
 arch/m68k/configs/mac_defconfig      | 4 ----
 arch/m68k/configs/multi_defconfig    | 4 ----
 arch/m68k/configs/mvme147_defconfig  | 4 ----
 arch/m68k/configs/mvme16x_defconfig  | 4 ----
 arch/m68k/configs/q40_defconfig      | 4 ----
 arch/m68k/configs/sun3_defconfig     | 4 ----
 arch/m68k/configs/sun3x_defconfig    | 4 ----
 arch/m68k/kernel/setup_mm.c          | 2 +-
 arch/m68k/mac/config.c               | 2 +-
 14 files changed, 2 insertions(+), 50 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
