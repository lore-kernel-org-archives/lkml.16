Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4311514E4;
	Wed, 21 May 2025 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818143; cv=none; b=tKLR9mJgxKfPZAqJdacJ3QjPszBCnheznzw+ium46aivoL2e8MB+YWUUsivU+5rtx85cs+4cufvdSuLMTDcIte+wx9Vd/Tv4uPBV5XDx5b2+7wXnfC556GBLsXR0V/NUNRsevq/xhOiVmIJOJ7F4fxAdDbqGW5ubd5IjLWxRXO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818143; c=relaxed/simple;
	bh=6CevvtaHDPmGnEcdPU4+gHZ1doSko2nSV+sN6EtrHpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4PPZdv4kaJKnJPSUAADLhSyXU4mbEfLI5JmI8FsIkvTRqodHN92Hd/HE/34Y/brfwX9YM59jW6AG4ULKc1NDJYW/S1grpr/lRamIZK/3vF0CGOLzpjinLRZ3zMswxcQUHH4BRGadqVfPzZPO8InO8wf9vVbugb289/Bz6S7Ab8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyQ94wLP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyQ94wLP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38E7C4CEE4;
	Wed, 21 May 2025 09:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818142;
	bh=6CevvtaHDPmGnEcdPU4+gHZ1doSko2nSV+sN6EtrHpQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dyQ94wLP607BU8O7Jm1w2hX1m+3gVqtyPucDjS0RV0Vt9ZLOC0/bmVFIDv+tVyXvL
	 Bn1fXGXR6rmVF/UDccdX7c8uTzy4I7IQrE0NAjnd2tzOTJIdVr8T2XJMCFncKDrruw
	 RVJ5uT7SVhxgfGhHVJOfZ8UfLAaDowoOFv5OKia797MroGUICEev7r79JtxY0PFtAi
	 lTqHTSRHqHNaJUcIHEBGYiM2xk59W/jlK2HDKi9gmhqeTJ9aI2smPYl7iPUCeDhAJp
	 JQd9K6qsXqlBL969TQUbUxEWZ427GbokjQAirq9I0zWBA1ShaP/A/qatldblREwtFr
	 r0XqdEg9iYq6w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHfLA-00000006L9a-3X2q;
	Wed, 21 May 2025 11:02:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Masahiro Yamada" <mchehab+huawei@kernel.org>,
	"Nathan Chancellor" <mchehab+huawei@kernel.org>,
	"Nicolas Schier" <nicolas.schier@linux.dev>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Stephen Rothwell" <sfr@canb.auug.org.au>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] MAINTAINERS: update linux-doc entry to cover new Python scripts
Date: Wed, 21 May 2025 11:02:13 +0200
Message-ID: <eb9690301ed71a778d6947f458db3c66c0ba5415.1747817887.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747817887.git.mchehab+huawei@kernel.org>
References: <cover.1747817887.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Changes to ABI and kernel-doc need to be c/c linux-doc. Update
the maintainer's entry to cover those files.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Akira Yokosawa <akiyks@gmail.com>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20e07e61a148..63218280e802 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7173,7 +7173,10 @@ T:	git git://git.lwn.net/linux.git docs-next
 F:	Documentation/
 F:	scripts/check-variable-fonts.sh
 F:	scripts/documentation-file-ref-check
-F:	scripts/kernel-doc
+F:	scripts/get_abi.py
+F:	scripts/kernel-doc*
+F:	scripts/lib/abi/*
+F:	scripts/lib/kdoc/*
 F:	scripts/sphinx-pre-install
 X:	Documentation/ABI/
 X:	Documentation/admin-guide/media/
-- 
2.49.0

