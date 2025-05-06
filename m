Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE6A28641C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551418; cv=none; b=FNcXvyVumcGumBwIpnRCamhIjLKnQ7nEoFrTf4uqPzdV16q03KbhtWGBa8UYz727xmSM46miFW9LKWxQI62ZLOYx6JT04rFT/Znd3DdnLNeq4O7YPNmN9ODYJoRK7RsdYWOusEm6AgtJRManMmKVJNTP+D77reE9iXy35apwFJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551418; c=relaxed/simple;
	bh=CwVzLJQgC4n4sn+p8/6aXra8RaSqc2LyyQbB8Gcenz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2KJ6L7CFHTxZP1ofJKxZt/5RhA/gJcwaH6uol3piYvrVSuFBgZ0S/M+6XSno591WDllyWitMmp8nvyeco9v5CXrIylBoajKQRBhgcYYSHknN7xbRhvkMKDsaa2q0e7wRWuje/v9bNMuHFCxD5PBpxftly+CbqyxpCnnILOEN9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdwXzkmc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdwXzkmc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0928C4CEE4;
	Tue,  6 May 2025 17:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551417;
	bh=CwVzLJQgC4n4sn+p8/6aXra8RaSqc2LyyQbB8Gcenz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BdwXzkmcsYZDQfouSmtSJquhnixt9brF+BZVSvBhI6y3vcglGeV3YCe5ltgfE1MRi
	 CqOonYHzSydem0l7LoV6kQeiZ9lWlNKxWE47dzhf6xCfOK65uo3q0gx06MxWgGdgeb
	 OfthvJJyrPJqNsvtaYzdE8dGZnzHpQBJnHlaS7uOA5EM0+phiQmEVX+jYMCOfj/bfG
	 ntCWVIe3iTBec+UCKh8t/4gXxsZEQopRtiPcBWK3ZDR6wix9ZTxpEWZrBuxGa6HSrD
	 XCHKhUyuFkBXKw5Sn6qJqDJPBAIvUkWgvRkwo9LqlzkXmuK5vOhWyEz6T9lryFJFSc
	 AMQrI+f6NcOcw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ingo Molnar <mingo@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 14/15] x86/kconfig/64: Enable popular generic kernel options in the defconfig
Date: Tue,  6 May 2025 19:09:23 +0200
Message-ID: <20250506170924.3513161-15-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506170924.3513161-1-mingo@kernel.org>
References: <20250506170924.3513161-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the last set of options picked up from major Linux distributions:

 - CONFIG_UAPI_HEADER_TEST=y

    x86 developers frequently modify UAPI headers during development,
    make sure they get tested.

 - CONFIG_WATCH_QUEUE=y

    All major distros have general notification queue support enabled.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 arch/x86/configs/defconfig.x86_64 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/configs/defconfig.x86_64 b/arch/x86/configs/defconfig.x86_64
index 225aed921e21..11095e7569a8 100644
--- a/arch/x86/configs/defconfig.x86_64
+++ b/arch/x86/configs/defconfig.x86_64
@@ -1,6 +1,8 @@
 CONFIG_WERROR=y
+CONFIG_UAPI_HEADER_TEST=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
+CONFIG_WATCH_QUEUE=y
 CONFIG_AUDIT=y
 # CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
 CONFIG_NO_HZ=y
-- 
2.45.2

