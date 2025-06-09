Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E2F144304
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 02:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749437181; cv=none; b=raOOGBFSSd3Fx6WkJW3rW50d7kmF0RYzfLPc717Ekf9TSoVIXZ3/LPwyjQj2pElO/4cqgjmdlRlNM10LRFAFu2bj2Rzy+RmUy9bLU+r2mmCu9rGWWAUPuTlZTNpMpesfqwXmiLlFvEductMDTS2boSDI4O0JYXbTCw6VS6+1dpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749437181; c=relaxed/simple;
	bh=4OnMzJOtM5pU1oWgHTKYNUPFKsLktwixoiO0Wzf9d1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2m76Jb4Ck41B+w9zaAKpTWwZQPKuna9u2I20J0QWzqZEY51iAKsz/9CSWIaQX5v0z7g3papMzyOp/cy0PG3/BKmx1Bz330WlgQsCL9i3Jff40XVekjKYp5zMI46opU5duxM6fV1D5j81b7mdT8TvuQ//5AZRTwT3ofcG4UeTG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWxSwPDY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWxSwPDY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85B52C4CEF3;
	Mon,  9 Jun 2025 02:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749437180;
	bh=4OnMzJOtM5pU1oWgHTKYNUPFKsLktwixoiO0Wzf9d1Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iWxSwPDYh/HygwisJlO1XmTIOAtuJVN+wZPNYnMmsU6NEtHE1lbX2Z08lQznoPsZj
	 hnhYHWzFgcBO95RzsirWY4jCdvYfq0Sbqaag1142BJ2b2ekwc/fI3VHBdTGBYM1o1d
	 tXaLiCjJoP1G0DCfG6dodP7B0FwLUKxwrSsedrpA/40NUe3h+UbEYjta1RZ72IL848
	 w+W3u4qPqeOaloOmj0pOp7D6E0ApkpL81n3gq1At8dazVsNBVVSuCSbzMpboAm30Rv
	 XdeszjMK6S//HFcbq+dN2gxlDEbHc9CDvU3T/mtveSLedDCr3qTHAuvjQnsKkuQeY6
	 HasJxt1Bm1Okg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1A5C5AD49;
	Mon,  9 Jun 2025 02:46:20 +0000 (UTC)
From: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Mon, 09 Jun 2025 11:45:47 +0900
Subject: [PATCH v2 3/3] test_bits: add tests for __GENMASK() and
 __GENMASK_ULL()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-consolidate-genmask-v2-3-b8cce8107e49@wanadoo.fr>
References: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
In-Reply-To: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
To: Yury Norov <yury.norov@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 David Laight <David.Laight@ACULAB.COM>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2912;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=3zlQdv4EFCMg/HesmXq1vpsLUuJL8L+7u7ycJRCz2oM=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDBluXj+OROcksv85HMKzRf9qy/3Vp7btD5RqkRfo7bDiD
 szL6TjUUcLCIMbFICumyLKsnJNboaPQO+zQX0uYOaxMIEMYuDgFYCJCPxh+HMpYoMy2mZO9Yxm3
 9XG1VF3Zs6rm7K+jJ+g+Vjn6NVeV4Z+OmdwBZZfycL89YZtEf153lHjC8Sqvdv0+M2GXC7a3Kvg
 B
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Reply-To: mailhol.vincent@wanadoo.fr

From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

The definitions of GENMASK() and GENMASK_ULL() do not depend any more
on __GENMASK() and __GENMASK_ULL(). Duplicate the existing unit tests
so that __GENMASK{,ULL}() are still covered.

Because __GENMASK() and __GENMASK_ULL() do use GENMASK_INPUT_CHECK(),
drop the TEST_GENMASK_FAILURES negative tests.

It would be good to have a small assembly test case for GENMASK*() in
case somebody decides to unify both in the future. However, I lack
expertise in assembly to do so. Instead add a FIXME message to
highlight the absence of the asm unit test.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changelog:

  v1 -> v2:

    - No changes

This patch previously belonged to this series:

  bits: Fixed-type GENMASK_U*() and BIT_U*()
  Link: https://lore.kernel.org/r/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr

Below changelog contains the history from the previous series.

Changelog:

  v6 (previous series) -> v1 (new series):

    - Add a message in the commit description to explain why the
      negative tests are dropped.

    - Add Lucas's Reviewed-by tag.

  v5 -> v6:

    - Add a FIXME message to highlight the absence of the asm
      GENMASK*() unit tests.

  v4 -> v5:

    - No changes.

  v3 -> v4:

    - New patch.
---
 lib/tests/test_bits.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/lib/tests/test_bits.c b/lib/tests/test_bits.c
index 47325b41515fde2c3ed434ed6f4094925c98886b..ab88e50d2edfa2b011f07d50460ac8ea6ff99923 100644
--- a/lib/tests/test_bits.c
+++ b/lib/tests/test_bits.c
@@ -26,6 +26,23 @@ static_assert(assert_type(u16, GENMASK_U16(15, 0)) == U16_MAX);
 static_assert(assert_type(u32, GENMASK_U32(31, 0)) == U32_MAX);
 static_assert(assert_type(u64, GENMASK_U64(63, 0)) == U64_MAX);
 
+/* FIXME: add a test case written in asm for GENMASK() and GENMASK_ULL() */
+
+static void __genmask_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 1ul, __GENMASK(0, 0));
+	KUNIT_EXPECT_EQ(test, 3ul, __GENMASK(1, 0));
+	KUNIT_EXPECT_EQ(test, 6ul, __GENMASK(2, 1));
+	KUNIT_EXPECT_EQ(test, 0xFFFFFFFFul, __GENMASK(31, 0));
+}
+
+static void __genmask_ull_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 1ull, __GENMASK_ULL(0, 0));
+	KUNIT_EXPECT_EQ(test, 3ull, __GENMASK_ULL(1, 0));
+	KUNIT_EXPECT_EQ(test, 0x000000ffffe00000ull, __GENMASK_ULL(39, 21));
+	KUNIT_EXPECT_EQ(test, 0xffffffffffffffffull, __GENMASK_ULL(63, 0));
+}
 
 static void genmask_test(struct kunit *test)
 {
@@ -123,6 +140,8 @@ static void genmask_input_check_test(struct kunit *test)
 
 
 static struct kunit_case bits_test_cases[] = {
+	KUNIT_CASE(__genmask_test),
+	KUNIT_CASE(__genmask_ull_test),
 	KUNIT_CASE(genmask_test),
 	KUNIT_CASE(genmask_ull_test),
 	KUNIT_CASE(genmask_u128_test),

-- 
2.49.0


