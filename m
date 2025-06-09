Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F751E9B31;
	Mon,  9 Jun 2025 23:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512273; cv=none; b=G6p6lQKWdKhkh8CELG34dkDB/8QFIpBzknFt1+00O1eY5ru1K0mYYqrFbTkLUkIQKSw45s+9nNh0JLYfyrzVHmmmom8dx/gvNKFoSIL1gvsOR0Yt2ASB+7fCWNH0LakQ5U/iRZZhp2Hk/MOSkiVUT4dfLWzabL20i4Ik76qnSV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512273; c=relaxed/simple;
	bh=iYdPXbBfs0hWf5hFWSgk+TtoM4uOR6tLUwht/xnkfIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i2E7EheIHydJcihBY/RKpuoo3UYIrQE8Wkx8ZQjub0/CVm20TQO4cVJSba6RIJOvcREnv+bVIhrb/oZgTgjQG8cyhFE3fVUJyfSt21O3+8NlHaivffdwqv77Om52Z7IulgZfypOtoQurlV94X0VCh57baDQV6mXDiFJV3HnaKsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G48M2sLK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G48M2sLK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0FA9C4CEEB;
	Mon,  9 Jun 2025 23:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749512272;
	bh=iYdPXbBfs0hWf5hFWSgk+TtoM4uOR6tLUwht/xnkfIQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=G48M2sLKyGRvdihwcbHyCkFXuhYm/N3cDWTk/Zhk8YP9Cjh5jtHnUs91yYvC5hb/R
	 DxaGaciIEjj8REh3uRq5Ur3+Ize4ZA8+lPF2cyiAQ171jaAbO72Y8vSicVhS6PF9Gs
	 akbG1ZRPmywcMmsVVi/wk6xindAcF0gsAFIdnbAnHGKVS2rKEQcqDsR7b9FxPJKKOn
	 z3OhnptJySO27ECr+o50wfvwg6xV1Ar6aWgY9/732t7RfHZ4cGcQl/4fLAA2T4T5rd
	 Smml/7LXlhAbm/r01Od8E3xGWBJ/B1g7hVcfBgAJsoXgCAGpujV2v0H6trnBNjDSq8
	 E3rO+IM3snQ3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E501C5B552;
	Mon,  9 Jun 2025 23:37:52 +0000 (UTC)
From: Daniel Palmer via B4 Relay <devnull+daniel.palmer.sony.com@kernel.org>
Date: Tue, 10 Jun 2025 08:37:38 +0900
Subject: [PATCH] doc: Remove misleading reference to brd in dax.rst
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-fixdasrstbrd20250610-v1-1-4abe3b7f381a@sony.com>
X-B4-Tracking: v=1; b=H4sIAEFwR2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0MD3bTMipTE4qLikqSiFLiggblJikVqiqmZkXGKElBrQVEqUB3Y2Oj
 Y2loAn/ifM2YAAAA=
To: Jonathan Corbet <corbet@lwn.net>, 
 Dan Williams <dan.j.williams@intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749512271; l=1013;
 i=daniel.palmer@sony.com; s=20250610; h=from:subject:message-id;
 bh=bneb9TzHhD7XIfcboMGGWopLiATbX15rmlqAcruoZnw=;
 b=LmEVIPJtVyUCpQuvYeq1sHgZr+XqcOro4z/qlbTF3O5uDLfJPq2SbLBt4AoXhKgV3OOt8qI2N
 5NMPTIdcnuXBPOlk9JMHouKtL5vWPg8623aHGOV9ETf0yTI/N042nIo
X-Developer-Key: i=daniel.palmer@sony.com; a=ed25519;
 pk=dbwvNAF3zvjUZOTEPBh6uYWrBnOi7OPuXkoDcmmS8aY=
X-Endpoint-Received: by B4 Relay for daniel.palmer@sony.com/20250610 with
 auth_id=430
X-Original-From: Daniel Palmer <daniel.palmer@sony.com>
Reply-To: daniel.palmer@sony.com

From: Daniel Palmer <daniel.palmer@sony.com>

brd hasn't supported DAX for a long time but dax.rst
still suggests it as an example of how to write a DAX
supporting block driver.

Remove the reference, confuse less people.

Fixes: 7a862fbbdec6 ("brd: remove dax support")
Signed-off-by: Daniel Palmer <daniel.palmer@sony.com>
---
 Documentation/filesystems/dax.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/filesystems/dax.rst b/Documentation/filesystems/dax.rst
index 08dd5e254cc5..5b283f3d1eb1 100644
--- a/Documentation/filesystems/dax.rst
+++ b/Documentation/filesystems/dax.rst
@@ -206,7 +206,6 @@ stall the CPU for an extended period, you should also not attempt to
 implement direct_access.
 
 These block devices may be used for inspiration:
-- brd: RAM backed block device driver
 - pmem: NVDIMM persistent memory driver
 
 

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250610-fixdasrstbrd20250610-074d8ed5623d

Best regards,
-- 
Daniel Palmer <daniel.palmer@sony.com>


