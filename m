Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C354A18
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006711; cv=none; b=Nr1L3IZgm9DoHxKfdIcDxjCDh4S4E5abHOVKtCto1N0HNZWEX7ySOOLt5HCGD65ODBSRJwungeerJZAtCenvK86E8Fu+5tQDQ8MFMy8mbzXw2nPAX/HMygdF8hUQ/ef4CxtmgHHrNX1/mlxCSHjXVZxv4UCgmx3AkuiuqhCFcN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006711; c=relaxed/simple;
	bh=PdcO831v19eoH/2emF1AWfCp+0HXUy3DW4KYQQR2PxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rXX1fQC3f3R5QeRV+cA5m9BbIJUztQOZQLAqZSoGzz/5//YXgP67wtq7C7Uoa/bDisac120xncN0E7lux+HN6CnT4kZL6oGFS7qDSK3Gx6qQrQnp+zphsoZAkRPYjaT1uXLzgGr9P/KzlxnGuaDcn2UZZbQ3tyY9R25JZfmDLDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=toueoxjv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="toueoxjv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04748C4CEE2;
	Fri, 18 Apr 2025 20:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745006711;
	bh=PdcO831v19eoH/2emF1AWfCp+0HXUy3DW4KYQQR2PxU=;
	h=Date:From:To:Cc:Subject:From;
	b=toueoxjvQ0g90b9sREzgS3uZDeIzAemwum8/DtpY+zmNBe10vf6WmNFdublpqSEYa
	 jzQIzArQxmYxXQ3sTAHvnrPemAQFDgbyocWPTAUJlBtz59x9jzCH/+rZGUp9Wy2GkU
	 EQcPm1dcq+4Uaz8uH12tnFFLHTWWG7mBOYDhOL+Ytxf9FJVhab+Hn5MaNyjMzDrB9y
	 J3NL7fLJCBYjBlPJYzI6sMN60M7c3Tkjd6EA8pTGsBlOBlDffVA0Ygs7QwoknNvAWX
	 OIrUaW/rnVgMOiF8eaI4ff0yZuCl386+Bv8HoY4jn0UIaCjXkIxCAHDjmQpYyWlqlH
	 sV2KlTHpvWe1w==
Date: Fri, 18 Apr 2025 13:05:07 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Andrey Konovalov <andreyknvl@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Collingbourne <pcc@google.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [GIT PULL] hardening fixes for v6.15-rc3
Message-ID: <202504181303.EBF4F5594@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this collection of various hardening fixes for v6.15-rc3.
The one "out of place" patch here is for the prime numbers self test,
but I took that since I had carried the lib/ -> lib/tests/ move tree
this cycle.

Thanks!

-Kees

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.15-rc3

for you to fetch changes up to 3f2925174f8bd811f9399cb4049f6b75fd2fba91:

  lib/prime_numbers: KUnit test should not select PRIME_NUMBERS (2025-04-15 13:50:43 -0700)

----------------------------------------------------------------
hardening fixes for v6.15-rc3

- lib/prime_numbers: KUnit test should not select PRIME_NUMBERS
  (Geert Uytterhoeven)

- ubsan: Fix panic from test_ubsan_out_of_bounds (Mostafa Saleh)

- ubsan: Remove 'default UBSAN' from UBSAN_INTEGER_WRAP (Nathan Chancellor)

- string: Add load_unaligned_zeropad() code path to sized_strscpy()
  (Peter Collingbourne)

- kasan: Add strscpy() test to trigger tag fault on arm64 (Vincenzo
  Frascino)

- Disable GCC randstruct for COMPILE_TEST

----------------------------------------------------------------
Geert Uytterhoeven (1):
      lib/prime_numbers: KUnit test should not select PRIME_NUMBERS

Kees Cook (1):
      hardening: Disable GCC randstruct for COMPILE_TEST

Mostafa Saleh (1):
      ubsan: Fix panic from test_ubsan_out_of_bounds

Nathan Chancellor (1):
      lib/Kconfig.ubsan: Remove 'default UBSAN' from UBSAN_INTEGER_WRAP

Peter Collingbourne (1):
      string: Add load_unaligned_zeropad() code path to sized_strscpy()

Vincenzo Frascino (1):
      kasan: Add strscpy() test to trigger tag fault on arm64

 lib/Kconfig.debug                  |  2 +-
 lib/Kconfig.ubsan                  |  1 -
 lib/string.c                       | 13 ++++++++++---
 lib/test_ubsan.c                   | 18 +++++++++++-------
 mm/kasan/kasan_test_c.c            | 20 ++++++++++++++++++++
 security/Kconfig.hardening         |  2 +-
 tools/testing/selftests/lib/config |  1 +
 7 files changed, 44 insertions(+), 13 deletions(-)

-- 
Kees Cook
