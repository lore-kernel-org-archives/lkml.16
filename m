Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29B8265CDA;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=L6uqUt3FhQSkrlHNpxf+2D426Of8I462GEjo/dutuxja7Oh0+V0SLfEYi++EdaS6SOTgWyppnM9l2SHHUts26GGQhg4Yh9cFrPoK/anc1wSVs0Nu9gNPCTyj8qLuS5meul5xLQZtUYGiBdZ0+xyTNn7SSs7z/wle3mNnwJwLbKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=baQs6T5V+0EX/ZOEtJqTKbtbHsBX/BZE6fQSRnnW5Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eUblle8drpjP7AABMD+3qJnidsW7K8YUFpAcRqyV6CPpL6gmeTcqOirTpCWH69KsOsmLiehJBOeRCM8UsGak4CxTxqhQexizDNGUDM+GmRrjmDJnm2+PRNcrwvBQwFB2FTKY9mJ9Y2nhgK4YGpy7Qn02tB9UyOrfaF7POSl+FLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1VTJSY9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1VTJSY9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0ECC4CEF3;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106995;
	bh=baQs6T5V+0EX/ZOEtJqTKbtbHsBX/BZE6fQSRnnW5Ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l1VTJSY9Nq7BRcVEWTJZYBqaQXMTl/mZeGB5CVFI/yoR3kWF4ErufeyUfnPt37gPG
	 ATNn/JrAYHiKYQw1oPenXILPwHWehAwZLxmBplVzaTCRdIUadBuTCB2ds6scUkRNF1
	 0rZmtuDMmMgYCDOWRNbbxrMKtcAZXSBWR97kFoo0ZXHd7F8lxPxsqkxSs+GZ5qjwBe
	 ULmLel6OtD9MuHjy4qAbIA8Ui4HDSlKjVbzmZQXW3IyEB5HCsFfF2eoFXB0W2i226T
	 DXnIgyAlKyruzYUmvqf2ZF8WvNBg6ESUrgeUxp2u8PAVFIJbC2FVz7Ap6mZqGC5mK/
	 cvUwmf4SWrm8Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RW7-1YBO;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 18/33] docs: add a .pylintrc file with sys path for docs scripts
Date: Tue,  8 Apr 2025 18:09:21 +0800
Message-ID: <7b3c8a932c50ae52ce4c848676602b46d1d4a8f9.1744106242.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744106241.git.mchehab+huawei@kernel.org>
References: <cover.1744106241.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

The docs scripts that are used by Documentation/sphinx are
using scripts/lib/* directories to place classes that will
be used by both extensions and scripts.

When pylint is used, it needs to identify the path where
such scripts are, otherwise it will bail out. Add a simple
RC file placing the location of such files.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .pylintrc | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 .pylintrc

diff --git a/.pylintrc b/.pylintrc
new file mode 100644
index 000000000000..30b8ae1659f8
--- /dev/null
+++ b/.pylintrc
@@ -0,0 +1,2 @@
+[MASTER]
+init-hook='import sys; sys.path += ["scripts/lib/kdoc", "scripts/lib/abi"]'
-- 
2.49.0

