Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4263828B4E3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705922; cv=none; b=R/Hd/X+04BgQLR751z7sAmusLhrRxa7XIQlahSPg0sdsU/5IRMgGD1zRGo7C+shEZC2zpVa0RRRtfEDV+R/zb41WAO/0QdLzn84FfInKWwgiZUPxb7qoewK6zq6pcNfVA+PMSoUs0DLqaQYihedSEXTGypMZD51UwAs0tClnxxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705922; c=relaxed/simple;
	bh=YWfW3FYvsinyZo8+xxKCht1/8ozss0wy3FiQ1B0hlSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KexSnA3rfQ9xZfWMnBrTFVgb5cdhLTQZNd3esdaWNHlaYyStMypA2KHuFqYv2Q19lSWGz/MjGBfZhKVYOHx4v+/p0wtdRV0mGd3YaDxQX8S4l2rhtJUOdbOVCDhRS6XbCC+kOMqos74zulYgcRbZKHCTgPBiJoJL64BHUoe+QJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlH7/bUt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlH7/bUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744705921; x=1776241921;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YWfW3FYvsinyZo8+xxKCht1/8ozss0wy3FiQ1B0hlSc=;
  b=WlH7/bUt4ohVKt+Wec6TBZuGUzaySE3fpj3GiZQMqO5dDJaKelQp+B5q
   2zSyqx1jiJs39lLF4Q5QmdN1uZwiuaW0hpLQa/XNxtRewOnQ7dhxh2m2C
   9zfh2KfwmMxYfsMFpEWb9u9iOFUJCGPCSvXdgcciju5/VYQh3t+YeXEsX
   0F9HVxkhgkH058MQJAu3TTiDb5/FoHDVIOMf1mwcnhUswrml+j0wTne4e
   Jwd48yARonnIkiU0t9oWzraKm0G4bTtdUV+M0caV+QpU8RSnB76CTDchQ
   NyGIe8lIAfQw4wRUQE6P2Z2ofAVPqXl4SUj5dB2B4gPpM5WpYonSyRSdt
   A==;
X-CSE-ConnectionGUID: rD/YcbE4RMeM5AwkBNi0Dg==
X-CSE-MsgGUID: wJLdHZGsT9ajkc2GtDow7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49855675"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="49855675"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:32:01 -0700
X-CSE-ConnectionGUID: rflFz9mGTpCt3K091fjNzQ==
X-CSE-MsgGUID: jv9/Ph5iQjC2IlC91jVIzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="167224153"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 15 Apr 2025 01:31:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 21D7017B; Tue, 15 Apr 2025 11:31:57 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/2] bitmap-str: A couple of cleanups
Date: Tue, 15 Apr 2025 11:31:18 +0300
Message-ID: <20250415083156.303914-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of simple cleanups to the bitmap-str.h.

Andy Shevchenko (2):
  bitmap-str: Get rid of extern
  bitmap-str: Add missing header(s)

 include/linux/bitmap-str.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.47.2

