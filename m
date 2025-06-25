Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF512207A26;
	Wed, 25 Jun 2025 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836666; cv=none; b=HpblwgloKEVlN+dPlop1CjpRpd50cQbX8NhbU5wY+ljfehOiopsxXXtfPBboPxTs9JbLFyi/LdrfVUy0cICMGpJosokRAw7GaA6ACdJ1M0Dqe58PZleNaHJGT9KJ5c08U8riHvvpSi+EVU2h2owxZA6DQ3BnoEXI0808R/9WQ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836666; c=relaxed/simple;
	bh=I5YjVaDyYJlwhUGwIJgfS+e9ZtPvKsfTy/o54t8xkR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ofjF8azYDM/3y8KWSDTEZgXr7g3JDwhl6iKn3l9Z3Yyz64pzj3DablHmXpZIqNOhleuBeqqKs8FTPBlQh/2Iy6IInb2VV/CSxvnkJr0E9nr1Js9T4Qk6sF1oMK7VCTdwWLYUMAI65aEEdtuKUPAafgMRXbQ6tf++QWDPXIfA+XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3WkfBPhe; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3WkfBPhe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=kvywP13RjHkv0zHBdKsF6aW9tz6A7tmRfS2gvQhbDh8=; b=3WkfBPhep6GzMhhzV+9YrONYUv
	Vl6EfUQVLaQmzAjPH3gv9Anoi2ZhGAd+RMo1pA287S2jZGUGUHvwgv75Db5jncc+r8xOIi8Wo9nGB
	4K4dezRLXgei7MZuy2AAQFmYwUgVWVM//3zg4JC8RdDPF6vr3bpqpgpsorG17YmkOF5YmNBmZsEfk
	qSPIVmJPKnNGY541hsu8r+99rBMU77QV3Aw0uMHqDpZsiwzHRiYsMV+kSweNDG1CwQApq9jVoWE9E
	x8kzAHxVAxVVEokdNR03sv0B/qzlNjwN+ocP29Tv7zTdym4x1ET+meT0RWQcO+/vk/+ZtXVl1ec1l
	2GW9qilQ==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKb1-00000007on9-262e;
	Wed, 25 Jun 2025 07:31:03 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Makefile: fix a typo in palo.conf
Date: Wed, 25 Jun 2025 00:31:02 -0700
Message-ID: <20250625073102.804075-1-rdunlap@infradead.org>
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
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
