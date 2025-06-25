Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A2D1DB958;
	Wed, 25 Jun 2025 07:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836659; cv=none; b=kvmg5m7EC1LicGpK96AuKw1MbOoiQhqWZ6C15E0+QPYlMHIt1Cdeiz9VOncn0es6OEEHj9kWQcdaRVI+M24FdxX6n103opDS4mnqTnphf7p7GkdILVnFgoKpw5UP1ywOZY2an/QqhnUFxoOQdvLCnotPNf4mbW8UDvQvCIdoQSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836659; c=relaxed/simple;
	bh=hFIPoFQTI28beysZgW+h6si22+17Zi0rpBS3e/XJg9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PIFBIw/6axNwRwWgzI7LEsZ+WAeI2SONwwt8UZBq0L6UMYk9ep5vvRKSDPPR1YFyS8dEE3pDMM7vI4GZZFdCrb9Hggj2nIwYoRtwHQ8BZ+MyDJBd3VEfAZwo01HN0V/EFcWShj7X7XJivxT5V/UsmeZT2yTzCGfN2KMX7beKjmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=delWNXz9; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="delWNXz9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ZMtcUGoXxkzCJ2uEnnxxlBvqXNs4t6MJkz6Ioc+X3X0=; b=delWNXz9Eefk3jAK0iWcv0p3fW
	8b1NjHcTj3S9uL91ksYIioUj0Bre38IchSX+ECiyFdVSVcgJ1r7u3Jrv0hPWFZEjiP3SzGSXvDMCH
	PpyZ7OrTQpZ0+NrARYBrGACILq7ah6ztB3ce6xllIPiSXhPrP7Hmywg3TalXGH8TVEUMUfvXYg5jP
	Y1/Z9otKQroKVemBYerWwqX4Xji5z9ZNVBdzY2J6WbngOdrNHUPDLKgtI8F0TR9Lq4ZKLHoAOW1Qw
	eoRtKBZou9Z+BnHNtGyYkGyXvjrlIwasewRfFlhgWfNVHsVrnBiLwtpRHOp9IFlagcg5Z696/za1t
	JeEM19Ag==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKau-00000007omW-0QtG;
	Wed, 25 Jun 2025 07:30:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Makefile: explain that 64BIT requires both 32-bit and 64-bit compilers
Date: Wed, 25 Jun 2025 00:30:54 -0700
Message-ID: <20250625073054.802365-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For building a 64-bit kernel, both 32-bit and 64-bit VDSO binaries
are built, so both 32-bit and 64-bit compilers (and tools) should be
in the PATH environment variable.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
This wasn't obvious to me; I was seeing lots of Assembler errors
when only the 64-bit tools were in $PATH.
I didn't find a better place to document this.

 arch/parisc/Makefile |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- lnx-616-rc3.orig/arch/parisc/Makefile
+++ lnx-616-rc3/arch/parisc/Makefile
@@ -39,7 +39,9 @@ endif
 
 export LD_BFD
 
-# Set default 32 bits cross compilers for vdso
+# Set default 32 bits cross compilers for vdso.
+# This means that for 64BIT, both the 64-bit tools and the 32-bit tools
+# need to be in the path.
 CC_ARCHES_32 = hppa hppa2.0 hppa1.1
 CC_SUFFIXES  = linux linux-gnu unknown-linux-gnu suse-linux
 CROSS32_COMPILE := $(call cc-cross-prefix, \
