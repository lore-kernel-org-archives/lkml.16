Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D342B252914
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189117; cv=none; b=qeMlDb31JnExsWAMUXmnXNhOQFW7rlUFLIt792CkZyonfrK0dRtKt8zT0z+O2eQmxul6pVTNgKIAJ9Rkga8Ek3isP671vBJet5mhEsYG41+mqQcVUqqaCPxcr/LUvTGStYgKUK/Yjr7sTI4Lw5Cb+YI54gzN4FSNdXHuugM8dC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189117; c=relaxed/simple;
	bh=gJDDcQhLdlA9wODq4spQpu11pwSULHbO38hF1mKoibk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mp2yishtsoR662aINd7SCkrtW1ArgAEj7lzPvRLHBzsCqBkAhBBVmaWJdSpfru21RJhPBo9gvPyBLDAHnqmOGjrjIY3BK1tnueoH1yTEg0a/W1vKwjOKBSIWm/yUIXe5GHIe6HLILbTdcR4VJ5tbqner7OFg9W4WnfwRw4XaJZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuZE0Uk2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuZE0Uk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746189116; x=1777725116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gJDDcQhLdlA9wODq4spQpu11pwSULHbO38hF1mKoibk=;
  b=EuZE0Uk2YMdFezSHKUNc4sAaiK5DNZ2BceYpwjO2AqRliVEwwFCEKXkz
   X5bSeGkXtGrJLEkvT/BRPJNHuphAdczp/VzTyVw2YlGYKBtV5L189ig71
   OPQtY5h2NB2mBteJWrBS11dpUH+I4ZFhrOliwxKv6isx64/h1zI/rij9I
   d2lglrqvV5picAAt/ami+ongL8dvx+OS5z838HJmvC5WdElYZPlUbUS5o
   65O5zp6xL/e89j47Zup6IG++A25ryAuGJJ9XuSAnTbO5HUhNXc5YLvBVO
   Hb83Z/ORyXEjXxVLE/H8xH+suhtdq8oBlVlqMc5OhHpP//l61fGVvXDf1
   A==;
X-CSE-ConnectionGUID: AY1B7U5jRvujcmg7yRB1BA==
X-CSE-MsgGUID: Cp3vokbzTbOUwK6Rixfo/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47955284"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47955284"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 05:31:52 -0700
X-CSE-ConnectionGUID: HQduCer2RJWwUHI9pOXW7Q==
X-CSE-MsgGUID: /MMPGlF7SCi81hJ9otmGQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135592034"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 02 May 2025 05:31:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 17F771D2; Fri, 02 May 2025 15:31:48 +0300 (EEST)
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
Subject: [PATCH v1 3/6] x86/boot: Split out parse_serial_port() helper for earlyprintk
Date: Fri,  2 May 2025 15:29:39 +0300
Message-ID: <20250502123145.4066635-4-andriy.shevchenko@linux.intel.com>
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

The newly introduced helper will be used later on to parse serial port
in different type of earlyprintk command line arguments.

No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/boot/early_serial_console.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/x86/boot/early_serial_console.c b/arch/x86/boot/early_serial_console.c
index f52a14284854..fa6520719a1e 100644
--- a/arch/x86/boot/early_serial_console.c
+++ b/arch/x86/boot/early_serial_console.c
@@ -66,6 +66,20 @@ static void early_serial_init(unsigned long port, int baud)
 	early_serial_base = port;
 }
 
+static unsigned long parse_serial_port(const char *arg, int off, int *pos)
+{
+	unsigned long port;
+	char *e;
+
+	port = simple_strtoull(arg + off, &e, 16);
+	if (port == 0 || arg + off == e)
+		port = DEFAULT_SERIAL_PORT;
+	else
+		*pos = e - arg;
+
+	return port;
+}
+
 static void parse_earlyprintk(void)
 {
 	int baud = DEFAULT_BAUD;
@@ -91,11 +105,7 @@ static void parse_earlyprintk(void)
 		 *	"ttyS0,115200"
 		 */
 		if (pos == 7 && !strncmp(arg + pos, "0x", 2)) {
-			port = simple_strtoull(arg + pos, &e, 16);
-			if (port == 0 || arg + pos == e)
-				port = DEFAULT_SERIAL_PORT;
-			else
-				pos = e - arg;
+			port = parse_serial_port(arg, pos + 0, &pos);
 			early_serial_use_io_accessors();
 		} else if (!strncmp(arg + pos, "ttyS", 4)) {
 			static const int bases[] = { 0x3f8, 0x2f8 };
-- 
2.47.2

