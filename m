Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FC91E51E7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620616; cv=none; b=qct014jVuN/A6v8k6cz/1da96GK2A/lyleRnmeDLTc0pGJ5jXKR7+QCP3bbtyIZUdzc2R5dHFxFsfdoOqUm7YUycqrur2I7Tlvbls0lLMVPwpukqo4HutbL+pBVskuUi95fQH3dyeJe8BOpOBPlCTDOA9vFL3Ca7XHglyhiB+sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620616; c=relaxed/simple;
	bh=sC19hA9otRz1IOQFvwSujyUAGh64OV8POPH/BRYjNfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qrvTjuiFiQqq1FYMTyJRPv8ofF55CXqsKQab8UPgs82Rr7sUuCpz72m6wf/B5OacHsDZi8gMdfSfWWdniV8roeghvpQTVVfe/wVdHIr/FASm1RpCqIcOkzJdRqf3/rjSY52u2Espbtme5jYItCmDwwYq2JLHGgszIz2NGVVvvcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1dc6:8b60:8242:85de])
	by andre.telenet-ops.be with cmsmtp
	id cwq42E0094wS71s01wq4XE; Mon, 14 Apr 2025 10:50:04 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u4FVx-00000000YC1-1AwD;
	Mon, 14 Apr 2025 10:50:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u4E9W-0000000AoOz-0JR7;
	Mon, 14 Apr 2025 09:22:46 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Tamir Duberstein <tamird@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>
Cc: linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] lib: PRIME_NUMBERS_KUNIT_TEST should not select PRIME_NUMBERS
Date: Mon, 14 Apr 2025 09:22:44 +0200
Message-ID: <6c3889e81d7396886b91120ba7871b2bffd6d934.1744615218.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling a (modular) test should not silently enable additional kernel
functionality, as that may increase the attack vector of a product.

Fix this by making PRIME_NUMBERS_KUNIT_TEST depend on PRIME_NUMBERS
instead of selecting it.

After this, one can safely enable CONFIG_KUNIT_ALL_TESTS=m to build
modules for all appropriate tests for ones system, without pulling in
extra unwanted functionality, while still allowing a tester to manually
enable PRIME_NUMBERS and this test suite on a system where PRIME_NUMBERS
is not enabled by default.

Fixes: 313b38a6ecb46db4 ("lib/prime_numbers: convert self-test to KUnit")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 lib/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 4060a89866626c0a..51722f5d041970aa 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3326,7 +3326,7 @@ config GCD_KUNIT_TEST
 config PRIME_NUMBERS_KUNIT_TEST
 	tristate "Prime number generator test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
-	select PRIME_NUMBERS
+	depends on PRIME_NUMBERS
 	default KUNIT_ALL_TESTS
 	help
 	  This option enables the KUnit test suite for the {is,next}_prime_number
-- 
2.43.0

