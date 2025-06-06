Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952461448E3;
	Fri,  6 Jun 2025 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227703; cv=none; b=CsWAvvHruv71FPj0dnstYm2J28csIMycf1wEGHuxBO0xrY2nSyQOHqxRXaU5OYKPIFUntORacPzqydxIPsfa4y/HLZnawM/lrW69CVXWnv90n4o+bkV7MmrXXruLNf4hFpQKjK/I5U4bbNJeGFeWrpeA9ikhEnrKBouIryuNyN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227703; c=relaxed/simple;
	bh=YN4KqU0e50p84B4u196IKm0jcSkgrg9KPVRZ/VdCLFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tKdHhW/uPPSyGgraoW1+bU33cPWRElVuQBSk6s8ABlcVuKrCMWxwLtwqF36OZgZw0SRKqoWLMYFqGUPir3vMfJXz8+KYgpm6qu/ItNwN1eUrw6TbYHWJJoEsQWjapTAYAVthmrhB/10BACg42Imf7vx8yTI5lNxvfLXB9rIpTis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rTJvNkA7; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rTJvNkA7"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 098B041A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749227695; bh=JWdIgjDsVFNB2rjRpKVi2IGxc1Z64+6wA+loR5RmU20=;
	h=From:To:Cc:Subject:Date:From;
	b=rTJvNkA79f8//pZO9ofVQFonfqbAFbGBuQQ43vQkLIgFk/jaB34Ejz+5sF1Rvb76G
	 Q/X4oEPfJO6yYdy1zhIrHeV/RqkDemLHPx139AYgKqREEpqBoB3mMsxQQFVj/Nad98
	 /ulSTGn+p4nIcBXs/vrvpY++eVXgvNrWvfTgFhn6FU/v1DuhZUp/aq3xvVFSG9AqoH
	 tdpQzAlVm9AqqqjksPv+RjluSA1Lwp7ZKFGAM44Qjz8dPmST3GexgNrf+S5KcpaDCW
	 tCaGRQs22W5y6higHk38/BXG2+pLjocc7Yrs+RfeiasjO7aUfl5XYrjO+PTdjwSKn/
	 q1assyYRD9IoQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 098B041A90;
	Fri,  6 Jun 2025 16:34:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/9] A series of kernel-doc tweaks
Date: Fri,  6 Jun 2025 10:34:29 -0600
Message-ID: <20250606163438.229916-1-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I will freely confess that I merged the kernel-doc Python rewrite without
fully understanding the code; at the time, the fact that it worked as
advertised sufficed.  I *do* feel the need to understand this code, though,
going forward, so I've dedicated some time to digging through it.

In the process, I've been making some adjustments to the code that, IMO,
make it a bit more approachable - for myself and, hopefully, for others.
The goal is to try to get functions to the point where people of limited
mind (like me) can soak them up, make the code slightly more Pythonic, and
removing redundant code.

Here is the first set of tweaks.  The output from "make htmldocs" remains
entirely unchanged throughout the series.  The docs build is slightly
faster afterward - but that's not the point.

Mauro, the more I dig into this the happier I am that you pushed this
change through - it was far overdue.  Hopefully you don't mind me sweeping
up a bit around the edges...

Jonathan Corbet (9):
  docs: kdoc: simplify the PROTO continuation logic
  docs: kdoc: move the core dispatch into a state table
  docs: kdoc: remove the section_intro variable
  docs: kdoc: simplify the kerneldoc recognition code
  docs: kdoc: remove the KernelEntry::is_kernel_comment member
  docs: kdoc: remove the KernelEntry::descr pseudo member
  docs: kdoc: remove some ineffective code
  docs: kdoc: move the declaration regexes out of process_name()
  docs: kdoc: some final touches for process_name()

 scripts/lib/kdoc/kdoc_parser.py | 152 ++++++++++++++++----------------
 1 file changed, 75 insertions(+), 77 deletions(-)

-- 
2.49.0

