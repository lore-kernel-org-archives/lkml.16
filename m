Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62602EBDC8;
	Fri, 27 Jun 2025 18:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049616; cv=none; b=Kq7vMXyVok2GwEwCtKoUzfw5TYZPQ/FdLmlk8V79xFnFug8BnX4bCbj9+jbxV393KeeMN2GA2ZlC1QyaHNx6mONBlqNxaM4VMch68SahIpg9FBvgC8xAKTpN025YAdOZWjrwIy7uqcpe60o1bT8KnkoQVeLJdX8ZF8FIrHhmiso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049616; c=relaxed/simple;
	bh=NsGYge56g1ZidY7SvFXuRa/coqeC04voIHFav5V5OAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GPQrjoPmwT8CuH3OaO46BplPaKdm1NyS7X+q6O8c9YmdCbXxQrHWac/xceXo3tJ250K0NG4ZtlVUh31h5wdr0mfuy5KxZjsKhFu5QOJ2RFPh9qzppKbQVJMD76wY+jMPhjMPhdaIK1bkU/bpoEQ99kTW9uKGd25TUczZVjdX8zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Zb8b4xSP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Zb8b4xSP"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8435440AC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751049613; bh=h9fYsV5Ci/idC1vaYWONBG1fnQm7n/1BS7A/GnlWKH0=;
	h=From:To:Cc:Subject:Date:From;
	b=Zb8b4xSP1bClBWcaisiLMBxYqOmm3heqT4CmQKFdjz8huwkz5nLySwsNBrnZdtfpk
	 e4qGE7zxu6+8jY/LHSIFGsI4j8KMECc87R2eaPXV3UGveMVN96yC8mpND4TC2brzYK
	 z6Zsx/Cx5K00BKBqQvRLW5PCNOCD/uylu53BojbVUwgMYBUZtIdLvo6LPzHUPeJoqZ
	 QmR8E5uI4N4yFT4r3uHZOuPCk0ZQ1cdbD1VXfq+wcorUw4SdIQCfrl67alcBTmkHoW
	 Srm0c5Hno+gd9FV7KRMdv287SPFUbunuJvfaBnF8xZ0m+MSajyyGker23EsVA9VtrD
	 IirRoKu3DxdHg==
Received: from trenco.lwn.net (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	by ms.lwn.net (Postfix) with ESMTPA id 8435440AC7;
	Fri, 27 Jun 2025 18:40:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/8] Yet another set of kerneldoc simplifications
Date: Fri, 27 Jun 2025 12:39:52 -0600
Message-ID: <20250627184000.132291-1-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As I continue to work through our shiny new kerneldoc, I keep finding ways
to make it (IMO) shinier.  This set covers these basic areas:

- Remove some unused fields from the KernelEntry class, and encapsulate the
  handling of the section contentions therein.

- Clean up and optimize the EXPORT_SYMBOL processing slightly.

- Rework the handling of inline comments by getting rid of the substate
  design and separating out the processing of the states that remain.

The series results in no changes in the generated output.

Jonathan Corbet (8):
  docs: kdoc: remove KernelEntry::in_doc_sect
  docs: kdoc: Move content handling into KernelEntry
  docs: kdoc: remove a bit of dead code
  docs: kdoc: remove KernelEntry::function
  docs: kdoc: rework process_export() slightly
  docs: kdoc: remove the INLINE_END state
  docs: kdoc: remove the inline states-within-a-state
  docs: kdoc: split the processing of the two remaining inline states

 scripts/lib/kdoc/kdoc_parser.py | 170 +++++++++++++-------------------
 1 file changed, 67 insertions(+), 103 deletions(-)

-- 
2.49.0

