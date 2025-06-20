Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6712F2836A6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750418407; cv=none; b=SP4C2lvd9qjZ3xLfHs867CjRwB/R40FvqCeIF3v8d67s5FD2RfrX3P8NPmB8m3UqqXnZlTFoEjyOb+w6KKhv0UaBuARuSKrZIveOr1SqzYBC/JWazb27h4ghqH3Yftdm8rEC95KMhBDdDzn9aVzms3m0ugvBd4I/+nYzaSStAVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750418407; c=relaxed/simple;
	bh=lrY3AgKwDr2QnUYeMAu9baBFC0TNe1uwbz5QnFOlaB0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NIHDBomp1kvN588GuJ9PDgFIvWg4IXqu2/71e7ncrMtPIJ4p4xGQwqsb1SEliZq1xbosaKK+sHz5FuY2092miUb+sdLbJob/rAbB2OTp+ip+yMhKp+B3Unn9qWDMhLzvlmtadYMu3fo6C33aIoGv1dszDNAfe+gVUmyzXbpUcCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzzisRUr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzzisRUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18E4C4CEED;
	Fri, 20 Jun 2025 11:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750418407;
	bh=lrY3AgKwDr2QnUYeMAu9baBFC0TNe1uwbz5QnFOlaB0=;
	h=From:To:Cc:Subject:Date:From;
	b=fzzisRUrhgjv2O7fszTxjloAcgWtEadSboNSrZUxsnMMtS5TfbkONQ7BpGsCQlgeD
	 XQ8Xaovvm1yBLdqF6cFvfx3g3aPsGs8PWoXmUviSnyHMa9auI58Bu5y9ZvCXoYp6aS
	 ObkifRnkI4QTjwAMUCmH0KO7FK9yKqNZUhDG7kNx2ju/+i6BD51AWghA3gsc4nMPkd
	 Vv9NIHmmRV9TciY1hcxwutHSGFTj0c/7uwNRSEPs7RRwMfZiDYsnv7i0CAZvnseKEl
	 MBEU8ZVCPlBSZLQ26w0GKBeeZWAolm7w+Invto+8QoOwCanXVHzDb/T4S9JJUpWT7Q
	 io6AaZSeIPnVw==
From: Arnd Bergmann <arnd@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	SeongJae Park <sj@kernel.org>,
	David Gow <davidgow@google.com>,
	Christian Brauner <brauner@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] binfmt_elf: reduce stackusage in kunit test
Date: Fri, 20 Jun 2025 13:19:58 +0200
Message-Id: <20250620112003.3395792-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Constructing arrays on the stack in the test case triggers a warning
in some configurations:

fs/tests/binfmt_elf_kunit.c: In function 'total_mapping_size_test':
fs/tests/binfmt_elf_kunit.c:52:1: error: the frame size of 1448 bytes is larger than 1408 bytes [-Werror=frame-larger-than=]

Change the arrays to 'static const' to not use any stack space at all.
This is possible since the contents are never modified.

Fixes: 9e1a3ce0a952 ("binfmt_elf: Introduce KUnit test")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/tests/binfmt_elf_kunit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/tests/binfmt_elf_kunit.c b/fs/tests/binfmt_elf_kunit.c
index 11d734fec366..023042f6aeee 100644
--- a/fs/tests/binfmt_elf_kunit.c
+++ b/fs/tests/binfmt_elf_kunit.c
@@ -3,7 +3,7 @@
 
 static void total_mapping_size_test(struct kunit *test)
 {
-	struct elf_phdr empty[] = {
+	static const struct elf_phdr empty[] = {
 		{ .p_type = PT_LOAD, .p_vaddr = 0, .p_memsz = 0, },
 		{ .p_type = PT_INTERP, .p_vaddr = 10, .p_memsz = 999999, },
 	};
@@ -11,7 +11,7 @@ static void total_mapping_size_test(struct kunit *test)
 	 * readelf -lW /bin/mount | grep '^  .*0x0' | awk '{print "\t\t{ .p_type = PT_" \
 	 *				$1 ", .p_vaddr = " $3 ", .p_memsz = " $6 ", },"}'
 	 */
-	struct elf_phdr mount[] = {
+	static const struct elf_phdr mount[] = {
 		{ .p_type = PT_PHDR, .p_vaddr = 0x00000040, .p_memsz = 0x0002d8, },
 		{ .p_type = PT_INTERP, .p_vaddr = 0x00000318, .p_memsz = 0x00001c, },
 		{ .p_type = PT_LOAD, .p_vaddr = 0x00000000, .p_memsz = 0x0033a8, },
@@ -28,7 +28,7 @@ static void total_mapping_size_test(struct kunit *test)
 	};
 	size_t mount_size = 0xE070;
 	/* https://lore.kernel.org/linux-fsdevel/YfF18Dy85mCntXrx@fractal.localdomain */
-	struct elf_phdr unordered[] = {
+	static const struct elf_phdr unordered[] = {
 		{ .p_type = PT_LOAD, .p_vaddr = 0x00000000, .p_memsz = 0x0033a8, },
 		{ .p_type = PT_LOAD, .p_vaddr = 0x0000d330, .p_memsz = 0x000d40, },
 		{ .p_type = PT_LOAD, .p_vaddr = 0x00004000, .p_memsz = 0x005c91, },
-- 
2.39.5

