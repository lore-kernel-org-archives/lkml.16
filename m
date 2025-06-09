Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B571CD3F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 02:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749437180; cv=none; b=Igy8RUc+bbSiUazauVrqgZK5M071TaLCB9BLltjmqXSAV8+RmNQEQF+sybOrUYJqiQ+shZJdjjq81kXuwop3VymGYPNuS5Qw/6udU5usX6teMEwIxN90HVXB34WUkp/SbG0x6z0OSV3cWI7aWq38dyzcxXEF8TlAkqNg8i8DPLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749437180; c=relaxed/simple;
	bh=2SxArbrB8je/tYYEyDh9yj/6QRX2ZLFw71MwMjhKfvw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uAIokXbN6s10HG+GWcyBtfYXDjJlLiU9WvXUXebTRSmx6GdJTgo47WLlD4A9kvZsSk3nbtfY0I5STcFhB9H+LoQ1XNgPRRgKyNVm5LaFjmQFuCKPwKH23tYkRSxioxW2kKOkIIq1TfIEwuLQM5OuJqY5Kxl0FicPE+fiitfyrqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahwv+vtK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahwv+vtK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DA05C4CEF0;
	Mon,  9 Jun 2025 02:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749437180;
	bh=2SxArbrB8je/tYYEyDh9yj/6QRX2ZLFw71MwMjhKfvw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ahwv+vtK4Ihm45UZOq+vmdsLJcbuBV6hncY9msf8ryJ+KwR06oABzXnJmuvCNHnQZ
	 NXbdOVMFpusP3NzciYwiqBeJH2kDL/CfDQpa+0EDZjr/AW2KiymwuO0Y89kGtW4Dht
	 KHqANuQPdrABEiRPY4SLR5qhX9T2iUnelAeeGLFK/h0tjwZVPlCabqCC1vAEezr7hZ
	 ADuZ1Xo/AHj8hKkUzZ7zfeRDN0AqYdlYQScShafW9AtUBxKAtGLdo1U2wov+zV/9hR
	 Lys9vlEJOLAqL0PH/K187ASr0ReE2PTEaOMuu7If4ARVuXx6qQ/Z8HlOys+4ZUdH5Z
	 NIznqyYfsL5FQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F84C5AD49;
	Mon,  9 Jun 2025 02:46:20 +0000 (UTC)
From: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Subject: [PATCH v2 0/3] bits: Split asm and non-asm GENMASK*() and unify
 definitions
Date: Mon, 09 Jun 2025 11:45:44 +0900
Message-Id: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANhKRmgC/22OQQ7CIBBFr9LMWhpKW2K68h6mCwpDS7SggKhpe
 nexdenyTf5/fxYI6A0G6IoFPCYTjLMZ2KEAOQk7IjEqMzDKWlozSqSzwV2NEhHJiHYW4UK4VJS
 JQSh9ZJCbN4/avDbrud/Z4/2R5XE/wiACZtU8m9gViZcVJ15W8A1PJkTn39tHqdrSv3H2dzxVh
 JK2GbSquWx5U5+ewgrlXKk99Ou6fgADHuF75AAAAA==
X-Change-ID: 20250320-consolidate-genmask-6cd02abadf82
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3731;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=2SxArbrB8je/tYYEyDh9yj/6QRX2ZLFw71MwMjhKfvw=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDBluXu9+nQ2fvOh/0NVzq17dnPvg85z81NTufTMrTQ6nT
 2E89zTLo6OUhUGMi0FWTJFlWTknt0JHoXfYob+WMHNYmUCGMHBxCsBECpMZ/op4/TwxxcP54eKo
 /J2/zab9Lsx0flllaigg5aTgdf61uQXDP6PZl37vX9mYVG5yfi6r6DetPxkV0w6oa2T/n1R6acG
 cLWwA
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Reply-To: mailhol.vincent@wanadoo.fr

This is a subset of below series:

  bits: Fixed-type GENMASK_U*() and BIT_U*()
  Link: https://lore.kernel.org/r/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr

Yury suggested to split the above series in two steps:

  #1 Introduce the new fixed type GENMASK_U*() (already merged upstream)
  #2 Consolidate the existing GENMASK*()

This new series is the resulting step #2 following the split.

And thus, this series consolidate all the non-asm GENMASK*() so that
they now all depend on GENMASK_TYPE() which was introduced in step #1.

To do so, I had to split the definition of the asm and non-asm
GENMASK(). I think this is controversial. So I initially implemented a
first draft in which both the asm and non-asm version would rely on
the same helper macro, i.e. adding this:

  #define __GENMASK_TYPE(t, w, h, l)		\
  	(((t)~_ULL(0) << (l)) &			\
  	 ((t)~_ULL(0) >> (w - 1 - (h))))

to uapi/bits.h. And then, the different GENMASK()s would look like
this:

  #define __GENMASK(h, l) __GENMASK_TYPE(unsigned long, __BITS_PER_LONG, h, l)

and so on.

I implemented it, and the final result looked quite ugly. Not only do
we need to manually provide the width each time, the biggest concern
is that adding this to the uapi is asking for trouble. Who knows how
people are going to use this? And once it is in the uapi, there is
virtually no way back.

Adding to this, that macro can not even be generalised to u128
integers, whereas after the split, it can.

And so, after implementing both, the asm seems way cleaner than the
non-asm split and is, I think, the best compromise.

Aside from the split, the asm's GENMASK() and GENMASK_ULL() are left
untouched. While there are some strong incentives to also simplify
these as pointed by David Laight in this thread:

  https://lore.kernel.org/all/20250309102312.4ff08576@pumpkin/

this series deliberately limit its scope to the non-asm variants.

Here are the bloat-o-meter stats:

  $ ./scripts/bloat-o-meter vmlinux_before.o vmlinux_after.o
  add/remove: 0/0 grow/shrink: 4/2 up/down: 5/-9 (-4)
  Function                                     old     new   delta
  intel_psr_invalidate                         352     354      +2
  mst_stream_compute_config                   1589    1590      +1
  intel_psr_flush                              707     708      +1
  intel_dp_compute_link_config                1338    1339      +1
  intel_drrs_activate                          398     395      -3
  cfg80211_inform_bss_data                    5137    5131      -6
  Total: Before=23333846, After=23333842, chg -0.00%

(done with GCC 12.4.1 on an x86_64 defconfig)

--
2.43.0

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
Changes from v1:

  - Meanwhile, in commit db6fe4d61ece ("lib: Move KUnit tests into
    tests/ subdirectory"), lib/test_bits.c was moved to
    lib/tests/test_bits.c.
    Rebase onto: 6.16-rc1

  - Minor editorial changes to the cover letter.

  - Aside from the above, this is just a resend.

  - Link to v1: https://lore.kernel.org/r/20250322-consolidate-genmask-v1-0-54bfd36c5643@wanadoo.fr

---
Vincent Mailhol (3):
      bits: split the definition of the asm and non-asm GENMASK*()
      bits: unify the non-asm GENMASK*()
      test_bits: add tests for __GENMASK() and __GENMASK_ULL()

 include/linux/bits.h  | 29 ++++++-----------------------
 lib/tests/test_bits.c | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+), 23 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250320-consolidate-genmask-6cd02abadf82

Best regards,
-- 
Vincent Mailhol <mailhol.vincent@wanadoo.fr>


