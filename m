Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672F7268FC9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396323; cv=none; b=Me5bktoKF6aCaJ0e067PCBTpP+z1kZbQQjkI/U02E5yWyBHr3JCib5xDGz4pIO5lzC86QJbnkrJPb7bT9X9Sb7B6/9Sv3YKh+BBd+lxxIbiEKwS4iPqj04FfRy+57gFJAc4XTg5+wjAccqEHFBlHaliqCEu8itasWb43c+Zn/X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396323; c=relaxed/simple;
	bh=cXmDa/smw3SFfJ5+0v25YOs7nGxAYzIsbMas66vAH5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IW5d5HST+Sn8NbFraciFSgchsKHZkHC6hbY6YvyBW0rzWyOJ6pyQzvxShpa3v0awWpmiL2vGs7iLAzEG6wusNKgR3bRuDJk2ePvcLY5qp5PQ1ATSVcHQIpgmREBNMQTkF+qnKKocm1xRWJBWackuvkpI+w927ABD/yTj/bA7Nw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KWGOaFJX; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KWGOaFJX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=SAQbWjWGGmEWV/yrGcgLnMo50LiJ5Xc9HvWor5bjKpE=; b=KWGOaFJXU2Zhudn7trVxYUEU0g
	7QQaPkpOyTCf67dYB0FTPxHraBznEqfyf3CWdnhygxC8xk5dbP9BsRCymIsPTF4wAwP6KqFkr2FA6
	FmzLrm8fgn5FNEGSPdZIG7zgut0D0wdH/1mn1S9JEK5UNaDsTXfnf9Rrdsasucwbo6CRYk20ltlub
	zqk/SOxkESDY8NKrxvp7RlTzavj/40AZ/QicG71H0mgMDCefzRigaplRoo9o5ZJdYGcaUnGaaogvj
	80uEUTHcGn5ocHFj4LephL03r6fmWs2hRgpoez0yWwQeFioSX2KC8ThpS1JtfEfE0maumlFjzlgHM
	BdNg+AgA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VJQ-000000081P3-0EV6;
	Wed, 23 Apr 2025 08:18:32 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJO-00000002YNz-1z0F;
	Wed, 23 Apr 2025 09:18:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: [PATCH v3 5/7] mm, x86: Use for_each_valid_pfn() from __ioremap_check_ram()
Date: Wed, 23 Apr 2025 08:52:47 +0100
Message-ID: <20250423081828.608422-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423081828.608422-1-dwmw2@infradead.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Instead of calling pfn_valid() separately for every single PFN in the
range, use for_each_valid_pfn() and only look at the ones which are.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/mm/ioremap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 331e101bf801..12c8180ca1ba 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -71,7 +71,7 @@ int ioremap_change_attr(unsigned long vaddr, unsigned long size,
 static unsigned int __ioremap_check_ram(struct resource *res)
 {
 	unsigned long start_pfn, stop_pfn;
-	unsigned long i;
+	unsigned long pfn;
 
 	if ((res->flags & IORESOURCE_SYSTEM_RAM) != IORESOURCE_SYSTEM_RAM)
 		return 0;
@@ -79,9 +79,8 @@ static unsigned int __ioremap_check_ram(struct resource *res)
 	start_pfn = (res->start + PAGE_SIZE - 1) >> PAGE_SHIFT;
 	stop_pfn = (res->end + 1) >> PAGE_SHIFT;
 	if (stop_pfn > start_pfn) {
-		for (i = 0; i < (stop_pfn - start_pfn); ++i)
-			if (pfn_valid(start_pfn + i) &&
-			    !PageReserved(pfn_to_page(start_pfn + i)))
+		for_each_valid_pfn(pfn, start_pfn, stop_pfn)
+			if (!PageReserved(pfn_to_page(pfn)))
 				return IORES_MAP_SYSTEM_RAM;
 	}
 
-- 
2.49.0

