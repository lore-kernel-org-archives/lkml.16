Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B83618B0F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641307; cv=none; b=Idkor375P3mwMc83R8n8WsA792GbeTJnAM86vCzEfP4+jPUSBhz4W1+GbDxOD4ZUmhnoJoM/4GUFyjVdHc7dARu8sTID9Qd7ViYC+HbxUXjFJW02LprDHOAQMN3ao7bCjZsPeHkGyjMxsM/feAbZjsTAnrrSEbhQiDmz7bdmxwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641307; c=relaxed/simple;
	bh=mtt7HDRpby65bqoRBPibrO4mmze86yBVk5Z2jyAKtXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U2yWAXOOJPlMNXti1AQ/2tyGCc2+Er6V0QdDX94qX/uDqnULYuCo92jMV++nOU5hz8y2woEq/+GEdCrh1P8sBjo+ZwbSU0rz00oS9qi+/+JGAaNy8E5kr9FCCyE0uI+RdciMAeXixRz647RZYw6cNr7F7JQyrb7fJtL6sq3rKkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9c5e:8f46:94c1:ac1b])
	by xavier.telenet-ops.be with cmsmtp
	id d2b12E00P2Uip6W012b1Q6; Mon, 14 Apr 2025 16:35:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u4Ktm-00000000ZaQ-27lO;
	Mon, 14 Apr 2025 16:35:01 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u4Ktp-0000000HV6z-124Y;
	Mon, 14 Apr 2025 16:35:01 +0200
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
Subject: [PATCH v2] lib: PRIME_NUMBERS_KUNIT_TEST should not select PRIME_NUMBERS
Date: Mon, 14 Apr 2025 16:35:00 +0200
Message-ID: <40f8a40eef4930d3ac9febd205bc171eb04e171c.1744641237.git.geert@linux-m68k.org>
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
is not enabled by default.  Resurrect CONFIG_PRIME_NUMBERS=m in
tools/testing/selftests/lib/config for the latter use case.

Fixes: 313b38a6ecb46db4 ("lib/prime_numbers: convert self-test to KUnit")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Tamir Duberstein <tamird@gmail.com>
---
v2:
  - Add Acked-by,
  - Resurrect CONFIG_PRIME_NUMBERS=m in
    tools/testing/selftests/lib/config.
---
 lib/Kconfig.debug                  | 2 +-
 tools/testing/selftests/lib/config | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

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
diff --git a/tools/testing/selftests/lib/config b/tools/testing/selftests/lib/config
index 81a1f64a22e860a6..377b3699ff312933 100644
--- a/tools/testing/selftests/lib/config
+++ b/tools/testing/selftests/lib/config
@@ -1,2 +1,3 @@
 CONFIG_TEST_BITMAP=m
+CONFIG_PRIME_NUMBERS=m
 CONFIG_TEST_BITOPS=m
-- 
2.43.0

