Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com [23.90.104.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C4D24467A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.90.104.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282719; cv=none; b=STfYU9OISxc7grzjPp1xG6MhGJN3NaKKndneRebaKZOK5xV1F9laXjRa5ULjtLH0NsvG3EeGnPOMtcQkcXWFm7baARgbEryDxG/Q1Rw1hm36rMsNVVVHGVnQ/oHomkPfKyqKTxKQW9T3E+yEbA5D1QHVyrwDeQEl94RBgf/53U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282719; c=relaxed/simple;
	bh=MiWhWsU6Nk+nyhYaGOjRyY5dkxoKOJRqdg6QZYyp45U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jo1f42kZRSVSrcYPyL2Gym1bHBC1Pi6L/y2RsyqCTNKi6Nc3CV5Os5sFwPUipYQkuDifcRIQXYGa4595jypsitlcCZbIxlww7Raskskmpn08s1rKQF9jbAvwV6GdxxJHLWLh4DbHDOZGG/0155cySvMHKIolqJLwrUj6SogccHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=TzFAC95G reason="key not found in DNS"; arc=none smtp.client-ip=23.90.104.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="TzFAC95G"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1751282714; x=1782818714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MiWhWsU6Nk+nyhYaGOjRyY5dkxoKOJRqdg6QZYyp45U=;
  b=TzFAC95GdwhczyOnc7ipf1EulLoZQJ3BAqIP09J0Ulok/7E4clWWKqks
   GnIqssqGNZxgM35bVa2pOd0Y1sFm7W+PQvT6I+FN/nrV2/I7FJ1X/gKaF
   +ZlqWJJ+Wy+Zc4mCiZUVp7bVVVCTd9XmLl7wNNAHIgRvsn7Tne3wBiNOB
   3nEFe2Vaw8KdnkusoJYm+IV8HGqF0fciUVsGeTPSVNeL9Dv/Xxjg+FOVg
   79LApPOGHohPeKs4DOmyIQrDp/bc/PlytTrjW3cj3uPAk9Kuy7RzYwOPv
   DF1RBZGNkMg4Ch2+uz99+Mh3B9RxJZnJZNnPLukQY7HIjA93+0mXLNLQ0
   A==;
X-CSE-ConnectionGUID: dXKz/3FrT5iT/UY0LAzDcw==
X-CSE-MsgGUID: 8G1CDNvHRm2FXTpq9y4XFw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 14:24:03 +0300
X-CSE-ConnectionGUID: pMAH1rCrQJa5kQD9iN+fzw==
X-CSE-MsgGUID: q/P7gEazQMSWGOq4CdiiSA==
Received: from unknown (HELO epgd034.me-corp.lan) ([10.154.54.1])
  by ces03_data.me-corp.lan with SMTP; 30 Jun 2025 14:24:00 +0300
Received: by epgd034.me-corp.lan (sSMTP sendmail emulation); Mon, 30 Jun 2025 14:24:01 +0300
From: Pnina Feder <pnina.feder@mobileye.com>
To: bjorn@kernel.org
Cc: alex@ghiti.fr,
	bjorn@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mick@ics.forth.gr,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Pnina Feder <pnina.feder@mobileye.com>
Subject: [PATCH 0/1] Fix for riscv vmcore issue
Date: Mon, 30 Jun 2025 14:21:28 +0300
Message-ID: <20250630112309.97162-2-pnina.feder@mobileye.com>
In-Reply-To: <20250409182129.634415-1-bjorn@kernel.org>
References: <20250409182129.634415-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are creating a vmcore using kexec on a Linux 6.15 RISC-V system and analyzing it with the crash tool on the host.
This workflow used to work on Linux 6.14 but is now broken in 6.15.

The issue is caused by a change in the kernel:
In Linux 6.15, certain memblock sections are now marked as Reserved in /proc/iomem.
The kexec tool excludes all Reserved regions when generating the vmcore, so these sections are missing from the dump.

However, the kernel still uses addresses in these regions—for example, for IRQ pointers.
Since the crash tool needs access to these memory areas to function correctly, their exclusion breaks the analysis.


Pnina Feder (1):
  riscv: Change memblock reserved name to be recognized on kexec

 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

