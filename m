Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC698221DB2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853740; cv=none; b=C1gOIKz2+1oHVl4IQWI7Olo1i78zhlJVjXj0fVE3WRotHXADklI34Kr1o+SE59vcygGtdVjpmUK6ukdNEW3qTp8gitlKfMNtolzgIHFr1Rs1nmE0pCTEVCQ6qjExKirDZSCrF2LWc+Rmvy4elpwEQe2EDT0iTORWaf7r6dco2S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853740; c=relaxed/simple;
	bh=l65IO5kfib+wsypa1op17l/qM9MqAEQiB63dTJ1Kahg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FLWf9Ka8NKm/Z/HXZWb2WTMg8vmFb9tE4BBJghxjkDBKi9Ctq0UbwkTxTlJrvP0srzhzFY+SCCV+RgfKrTd96jwpwL0111rLPReujsu09DMuafqo2JJkVoPFB8L9QAwLMFGIxEmV+JoZEZwnVXD+ecLcEn2mAsaQo8oc440fAS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=JGZZd96m; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="JGZZd96m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=/vBL7C4EXHe/g4EvFuPaZIotbyPumXb6WtXEmPrqPvw=; t=1750853738; x=1752063338; 
	b=JGZZd96mDAsPR00qmOu5zCL6wNbqP8yg1NqswvB1WXiuqS+PztWhdx6dlJUIvRXPVyC8i0qHOat
	eRMf5vCs9galLpjzARUyRBXMxR+ohA+G7Yd4xzpBmO+WYjn356/Skl/Kf7dlGi9i49lQs74xpb5Pd
	88xCcYrI1CYPcmr56WO5N+T2kNts4Bs8Y860v7ZA13Owyj2y3mAIbTk7oebHZVwHiWO2vQV0vl+gm
	MlbWtmQJpTz1nsQvkMQlpUhmI5ubQ32CWvMOgDSd3ABLoRkIw0XVFvqZyt2FbkWU5RN5pjOQZNCdC
	SoyUpdf07rXswVxbbUmvZgztE5QY6xCzdrZA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uUP2K-00000009xSo-48of;
	Wed, 25 Jun 2025 14:15:33 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: [GIT PULL] uml-for-6.16-rc4
Date: Wed, 25 Jun 2025 14:14:19 +0200
Message-ID: <20250625121529.42911-3-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

For UML we have a few fixes, all from Tiwei and mostly for
recently added code (though one is just a compiler version
thing.)

Please pull and let us know if there's any problem.

Thanks,
johannes



The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-6.16-rc4

for you to fetch changes up to 2d65fc13be85c336c56af7077f08ccd3a3a15a4a:

  um: vector: Reduce stack usage in vector_eth_configure() (2025-06-25 09:28:17 +0200)

----------------------------------------------------------------
Just a few fixes:
 - fix FP registers in seccomp mode
 - prevent duplicate devices in VFIO support
 - don't ignore errors in UBD thread start
 - reduce stack use with clang 19

----------------------------------------------------------------
Tiwei Bie (4):
      um: ubd: Add missing error check in start_io_thread()
      um: vfio: Prevent duplicate device assignments
      um: Use correct data source in fpregs_legacy_set()
      um: vector: Reduce stack usage in vector_eth_configure()

 arch/um/drivers/ubd_user.c    |  2 +-
 arch/um/drivers/vector_kern.c | 42 +++++++++++++-----------------------------
 arch/um/drivers/vfio_kern.c   | 14 ++++++++++++++
 arch/x86/um/ptrace.c          |  2 +-
 4 files changed, 29 insertions(+), 31 deletions(-)
