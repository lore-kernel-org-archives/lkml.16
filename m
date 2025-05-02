Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DB1251782
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189115; cv=none; b=XvWLSKTXGPFqo4kivDOHQJwV7VjBj5DxiQs51IOqTOZLtTP/XXHg60EKbyGnubIQD1h+6dIZB56VhO0ASyvTBYx48rE5SVtVsCIEZEuuX2ZPdxwui1T1Ryv0WM2iHhjwuUTO3SoH2++MtneItISt2Dt+6PRBexDDg+4npzcIodI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189115; c=relaxed/simple;
	bh=SfEf/D6DeVLe4pFODRIksQjIcj8tNq2k+CUGb0pzMjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rpp8Z3e1NKD+EY+Q4cNpX7TRcaUTlo3kBPoBav2WpQY3BMFvS3OoCMa2K0fSBjbHziX9OEPwGEf83z9AsTDYIG9RIwo/TxScvuw9dMzHgMYD8Z+FAR7gotc2i90ipdMzWQq3Y0cON7P3kF6AF94pK+cJ0KFSBPy2TeoVonYKxng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNcRrK9s; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNcRrK9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746189114; x=1777725114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SfEf/D6DeVLe4pFODRIksQjIcj8tNq2k+CUGb0pzMjA=;
  b=QNcRrK9sae56bk4yR8Xqwa0g0kxuvkyoNUTPi6ez99XLPqdv6aUzL3hG
   4n1r5Djy/0YumwqPBCEH4o4UA908XFO3zLh6u8aP0nimk9xcr+rNI13TZ
   WCKIhxBJEMyWabiefb55XjryNtUMq8b/M2bevamI4FGdiFlr3DomfGp+n
   uq4ovk8VG/mWk9IjTDkAzp4Exoggi0OHBYvhT/4y91jm+Ht4a+DGWxhHg
   c9hQC8Zqqie+uSNKaen00vjYBNUdPWcTDQ8ADB6S7/Mh6nUDTmayU80vf
   1KV5MyIs7JakEa933+g5fYrvrKm2v8pPLAkVDV1jwTWJR5rXMiIAMM9ZN
   g==;
X-CSE-ConnectionGUID: mFMrQUzzTtCDBSr73GsrJQ==
X-CSE-MsgGUID: CAjU2obhS7Ozv0O1BRM3yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58078085"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58078085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 05:31:53 -0700
X-CSE-ConnectionGUID: YsU9gudVTGWtTVlfidaB4g==
X-CSE-MsgGUID: GXFQTWjySWGPXxxcpw7myQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135613029"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 02 May 2025 05:31:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 237E6224; Fri, 02 May 2025 15:31:48 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 4/6] x86/boot: Allow longer parameter list for earlyprintk
Date: Fri,  2 May 2025 15:29:40 +0300
Message-ID: <20250502123145.4066635-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250502123145.4066635-1-andriy.shevchenko@linux.intel.com>
References: <20250502123145.4066635-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow longer parameter list, up to 64 characters, for earlyprintk
to support new coming parameters.

If the parsed string is longer than this buffer it will be cut up by
the buffer size.

No functional change intended.

Note, that 'console' case is already covered.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/boot/early_serial_console.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/early_serial_console.c b/arch/x86/boot/early_serial_console.c
index fa6520719a1e..6841f14346c2 100644
--- a/arch/x86/boot/early_serial_console.c
+++ b/arch/x86/boot/early_serial_console.c
@@ -84,7 +84,7 @@ static void parse_earlyprintk(void)
 {
 	int baud = DEFAULT_BAUD;
 	unsigned long port = 0;
-	char arg[32];
+	char arg[64];
 	int pos = 0;
 
 	if (cmdline_find_option("earlyprintk", arg, sizeof(arg)) > 0) {
-- 
2.47.2

