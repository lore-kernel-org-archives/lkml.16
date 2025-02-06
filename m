Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2950D214209
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842342; cv=none; b=LVsQkJIfVkkXSIuUdg5aMf2RhxuTsGmE1GAmdaKEC4gUNioF0QpA8Bqfr4aK+GgOPpT+xD7jUU1zvgcvDfY3Q3OXW5k5PKPg32FgA4GqpQUdDMi+MPGj5MJYwKOyTdAsFo+U0qbNREeAYdZtYYqAqVqGYlT39/WyWVRCeVjgtEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842342; c=relaxed/simple;
	bh=Kaf8kan9AlxnRljWgN9wZamZU07o7cp63pUtAE87Hsk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eoVvEj2LsXe04m1DqjlM924aMkJslaqLF5qqwUS4gtSiZLOWW3BIa8+B+ReJb4JkXoYoh6RYNKcONWXfCVPQgtFbxxIEmBad/HL7rRpn3Jl8fliKRcU/vEDMGJ2nnAAiOk34NbQk5WujGskrb3GOwQo+1kIUaXSYLgV+J37lw2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E4CC4CEE0;
	Thu,  6 Feb 2025 11:45:39 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/2] mm: kmemleak: Usability improvements
Date: Thu,  6 Feb 2025 11:45:35 +0000
Message-Id: <20250206114537.2597764-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following a recent false positive tracking that led to commit
488b5b9eca68 ("mm: kmemleak: fix upper boundary check for physical
address objects"), I needed kmemleak to give me more debug information
about the objects it is tracking. This lead to the first patch of this
series. The second patch changes the kmemleak-test module to show the
raw pointers for debugging purposes.

Thanks.

Catalin Marinas (2):
  mm: kmemleak: Add support for dumping physical and __percpu object
    info
  samples: kmemleak: Print the raw pointers for debugging purposes

 mm/kmemleak.c                    | 54 +++++++++++++++++++++++---------
 samples/kmemleak/kmemleak-test.c | 36 ++++++++++-----------
 2 files changed, 58 insertions(+), 32 deletions(-)

