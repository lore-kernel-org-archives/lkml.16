Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9172E242D83;
	Tue,  1 Jul 2025 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403478; cv=none; b=UL6XnnEkF315dOKX3SUKV9J/LS0w/NGdIHBjv6Mw5/lNmtOJJTskv54EDWXyJ09noYGqzPZbEzBDfqBQzDcBaOkUAfOdd5JsSswCOcYkX/V0rBV29vM1BWcequnk4Wy6BLI5+dLsxav1FAvIWTc0MvnAeM9KV6/mJfa9cdbcxyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403478; c=relaxed/simple;
	bh=5hzYtLSSSaFYHh4phpP2u8byDigv57gJJu8Qk7yBx3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y8cNcyTPKIvIu9WeHJGREvKOTc+nDm0S6IvMBtAY1qjK1Bn+sKPPwIB5sk1DSInMWxh4WvVlVh3I193bmo3di+rF9p5krA1hlh6e4B6Y3amTqE/dpoafDwFbiGy6WqHd7wKwLHpsoedbx+FVGVa+oqnoIox+ZFlxxm/iPuNhlo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GzM+NnSZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GzM+NnSZ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8C416406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751403471; bh=3pcVEKKLH4eV7AthU+PkKmbBhjFw7okgROPRYAJ3Kuo=;
	h=From:To:Cc:Subject:Date:From;
	b=GzM+NnSZuGdKwE6C0TGlrysLB4+bhsvWHx/m54LnnxCyHQ0WbmC8u0WNtd04/qZ3K
	 EmIpTNrQFNLLVXNBTBliZdxBADxPdEDeynxiniqXXeT38vvf4yTEGqY6T2z2JsDYST
	 FuE0FmE3t+iwD5a31meLVqCd6WOtx08g0K2kQTp6fMpByUYGv00WdS197YRNjnth7o
	 bX3AlklMGcNZ94x6wrsHWVGywai4JodI6LnT6zCtb+362/t75QnzehTh+WUBzIC+i7
	 6A0P8C6a2A5VrTezGzSNpKB9M9YfYXTVdSQp3tPO2VaWR8QAadNoyb+24L/kttCZFn
	 4wdknbjVAlIFQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 8C416406FC;
	Tue,  1 Jul 2025 20:57:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/7] Further kernel-doc tweakery
Date: Tue,  1 Jul 2025 14:57:23 -0600
Message-ID: <20250701205730.146687-1-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a set of miscellaneous improvements, finishing my pass over the
first parsing pass and getting into the second ("dump_*") pass.

Jonathan Corbet (7):
  docs: kdoc: don't reinvent string.strip()
  docs: kdoc: micro-optimize KernRe
  docs: kdoc: remove the brcount floor in process_proto_type()
  docs: kdoc: rework type prototype parsing
  docs: kdoc: some tweaks to process_proto_function()
  docs: kdoc: Remove a Python 2 comment
  docs: kdoc: pretty up dump_enum()

 Documentation/sphinx/kerneldoc.py |   2 -
 scripts/lib/kdoc/kdoc_parser.py   | 150 +++++++++++++++---------------
 scripts/lib/kdoc/kdoc_re.py       |   6 +-
 3 files changed, 79 insertions(+), 79 deletions(-)

-- 
2.49.0

