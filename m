Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6514CE08;
	Sat, 21 Jun 2025 20:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750538129; cv=none; b=LmQ5/kx3Plaus5f9hf5yFKy7WReNRYFzymlb4bDvqa2iKED1m5nakgI8H5cLzd4fQh3lWNmAkbdcnE78IwcyhzvcVmnqPeUFWWcEadxgZfBbksFBFLtHYKgKn5Vykn3sm1/5hBDC9DsEMvfQ3bUKkpxKZYDY1esogeEQEq7n0a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750538129; c=relaxed/simple;
	bh=hB8C7L1PxFJv/CZptLAzrkXYJacSm/2OYegNuolirxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rqwn8yMJU2RMT6YtwmmSnkJzMk6nS0vo7tuJykJvo9rgxHzWSH6un+WGkvN5qXsQ0MUiA4/Bb9pnVkT3VSjghv6lXb8aUucVBy7z0SnqDjPoCbHdPZta7AabxKTKp9qH2c87wK01d3oaYJj1oyLnKaNqDAkMES7S1NBm6eoAUIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=HuPcuoG2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="HuPcuoG2"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3373341AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750538127; bh=6N/xqxEEBR9LSu1nywynu4PPNaFbqIPkg71mxrWCLes=;
	h=From:To:Cc:Subject:Date:From;
	b=HuPcuoG2dVfHfFh2pB7BD4VStyJXdbpjkx3x+EkLjyXkgjd33Vt06d04SeudOqp99
	 06ggcFSlgSgGWKZ1+L2REsD6mY3KEtkmmifM/O2sJ2QO+X3ZHemvWFLHI79QA1rDFz
	 IzG7p4EOmPDMxEt0+Zk7shTXdnbRiWmMwGTDVpULppB3EtRM3da/e+lUYduT2KGWoV
	 jVad6matOroMrNW+W3JGR76NU0ty/j2KOy7c9ejnvmtAiaIMnoMHoOS/bCDYVrJQqG
	 A4s0yg90Ng6gfOezzqmyucqh/XaJH3CpDCAea+xnxj9SiJELpD1C9Woz++bmlbL1w9
	 vE/475G0YwWFw==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	by ms.lwn.net (Postfix) with ESMTPA id 3373341AD8;
	Sat, 21 Jun 2025 20:35:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/9] docs: kdoc: rework the BODY* processing states
Date: Sat, 21 Jun 2025 14:35:03 -0600
Message-ID: <20250621203512.223189-1-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a continuation of my effort to better understand the new kernel-doc
script and to clean up some of the legacy cruft brought over from the perl
version.

There were three states associated with the processing of the body of a
kerneldoc comment: BODY_MAYBE, BODY_WITH_BLANK_LINE, and BODY.
Unfortunately, these states did not actually match the state of the parser,
leading to a lot of deeply nested if-then-else code and special cases.
I've renamed the states to better reflect their meaning, and changed how
SPECIAL_SECTION, in particular, is managed.

  BODY_MAYBE becomes DECLARATION - we have seen the first line of the
  declaration that starts a kerneldoc comment, and don't know if we have
  hit the end of it or not.

  BODY_WITH_BLANK_LINE becomes SPECIAL_SECTION.  This state was used to
  recognize the sections within a comment with special rules -
  specifically, that the section ends with a blank line or the beginning of
  a new special section.  The declaration of parameters and sections like
  "Context" fit that description.  The old code recognized these sections
  at the *end*, with a lot of twisty logic; going into the proper state at
  the beginning simplifies things.  There are a few output changes, but I
  think they are all more correct.

  BODY remains BODY - a documentation section that does *not* end at a
  blank line.

To facilitate these changes, I have also begun the task of pulling more of
KernelEntry state management into the class itself; there is more to be
done on that front.

Jonathan Corbet (9):
  docs: kdoc: Make body_with_blank_line parsing more flexible
  docs: kdoc: consolidate the "begin section" logic
  docs: kdoc: separate out the handling of the declaration phase
  docs: kdoc: split out the special-section state
  docs: kdoc: coalesce the new-section handling
  docs: kdoc: rework the handling of SPECIAL_SECTION
  docs: kdoc: coalesce the end-of-comment processing
  docs: kdoc: Add some comments to process_decl()
  docs: kdoc: finish disentangling the BODY and SPECIAL_SECTION states

 scripts/lib/kdoc/kdoc_parser.py | 232 +++++++++++++++++++-------------
 1 file changed, 138 insertions(+), 94 deletions(-)

-- 
2.49.0

