Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4E42046BA;
	Wed, 25 Jun 2025 07:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837180; cv=none; b=V/aRFupqCfowV8koEhJabHvZ2mdVfFraFZ02cHpi7mOSKuhNMxlta5BTjv/utkzFvDlTJ42a6BbYEi/03hHBVh7y1CEJaE+Ego8OMP74tBiqwIshKIUYUBOhV+NgRm8CkdgEg3Rh/2kAE9zNO/xUznSL3A2IEpG5Ns/8k+7xKUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837180; c=relaxed/simple;
	bh=ibFHFaye7nhoDwU6DP8XetT/PKnKtVB/YjYxCGffUno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KJnr7pYZcCCNTp/F1RY9GHl+eQVgpij/hIhREo7VDr7e9c6hC/uQXHO+BruVpyNpQYhwk6zsuGTzHPKErSefMZxd6uNbFV9iQAwzzrh7oDrlZrj/Z21KAAnENTI3k0xdk/iY8uN8ZOSpjgXKsa1Q0ZFtjeYwbPtI1Wb/lHNzEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ShpEMViR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ShpEMViR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=PqmkPiGf4iioMMmMVZgEGlkc7ISVXOpoJlsEOh58hH8=; b=ShpEMViR1QklzQ5FltYZykoVCz
	55KoryGuwmqbb6wrerPsRph1OntIqKghs+Q7clpWfvMQP+i5uIs3WgMH6Hd8lt8EzRiiWJapEwwSV
	zHjf6Sy9WazGNHvqLDctZ8xHDPkqn34cH/OiRa78xPgmc70Jy1EUYjKsSS/ir400N/72TJ5aZrBO8
	4L6cEFTjMrPBHtiwGuoaRnxZvHZBeCov8h/enmKdOir5BweDltEbYJoZOIWtagg2ZmSJF98a9azAd
	tp9hwYYPkpZAKg0ORzXJfaE8Tmc+pn0GxUFpsTENQ5L094kn0q9w1+tVP2t2CjXDCVqMWjcQ1TOS1
	8FTupctw==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKjL-00000007qZN-0KzS;
	Wed, 25 Jun 2025 07:39:39 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
Subject: [PATCH v2] parisc: Makefile: fix a typo in palo.conf
Date: Wed, 25 Jun 2025 00:39:33 -0700
Message-ID: <20250625073933.910299-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "objree" to "objtree". "objree" is not defined.

Fixes: 75dd47472b92 ("kbuild: remove src and obj from the top Makefile")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
v2: correct email address for Masahiro

 arch/parisc/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx-616-rc3.orig/arch/parisc/Makefile
+++ lnx-616-rc3/arch/parisc/Makefile
@@ -139,7 +139,7 @@ palo lifimage: vmlinuz
 	fi
 	@if test ! -f "$(PALOCONF)"; then \
 		cp $(srctree)/arch/parisc/defpalo.conf $(objtree)/palo.conf; \
-		echo 'A generic palo config file ($(objree)/palo.conf) has been created for you.'; \
+		echo 'A generic palo config file ($(objtree)/palo.conf) has been created for you.'; \
 		echo 'You should check it and re-run "make palo".'; \
 		echo 'WARNING: the "lifimage" file is now placed in this directory by default!'; \
 		false; \
