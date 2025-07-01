Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DBB302051;
	Tue,  1 Jul 2025 20:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403480; cv=none; b=BLADO9GI7SzLpcKjoMkLYzmZrSI8w4YqQOorfjWqxd2zywo/mkeRkOxi5ix2In8dE3oy+eYmqSASKO/DdgAqUUfGv/cFI2PxtnoRLwUjH51SB2hP9DxIvMWGCpVhpuXcKzTtPQ/0Scx9WxgIi+gGsfoQySMdUf9KGXzWiNXHqso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403480; c=relaxed/simple;
	bh=2uNWUnFz6VFj3YbuiVsJTLsLGYdeiVzhjNfgs8ldzqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7IvCbN+dYX+0k0271NHNcecNx+eWyZYJvrH5A4UnJdDTiFe+b/DXIL6p3kT87aue7F1MQHgu130vkfjF97ClKUDSh5nwgAhHRL0IUHuHzcvnD4kXmkJOKOCsOGbNV+NTkQJP7M5gdLLnU0Wwu2E71DmA1jbN+4I/9UfF+aNbUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ilk0K6r7; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ilk0K6r7"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 023AB40AD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751403474; bh=YaUJIiz2jpRN3BaARWqJEEaOxa+M9/8H2AtGoGu2KV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ilk0K6r7pd9RnvOO11jgE8rhVhtW4W4tHloJFxkBitcoeiWMNrocD4oK0IPPF8iZo
	 s4n2PfhvzrPDc/RvMZE6G7n0c9A/0+LHCYXUHiiFwj8OTNzUAnYykW+ZZuKaU6gSwD
	 QjhH90hyAIkERwHFu5zDEf0cKy6NQj+iLm7yKcnNxwBc5JS6JGRxE03SWJUJ8ZZ1QW
	 ZOzdlRMPN8uXCG0TjvT2xMhYdtoJQT6DGLfOCpxdG8knV3PWrVoX3bBOxu1ZLBX6lb
	 UJr9u+nKazIM6pwb2Kb+6xdxsOOd3b8EP4Zz6AvEM76oQ5GMX0E+Dogq/PnquqEscM
	 +2wGOD20UuMKw==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 023AB40AD6;
	Tue,  1 Jul 2025 20:57:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 6/7] docs: kdoc: Remove a Python 2 comment
Date: Tue,  1 Jul 2025 14:57:29 -0600
Message-ID: <20250701205730.146687-7-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701205730.146687-1-corbet@lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We no longer support Python 2 in the docs build chain at all, so we
certainly do not need to admonish folks to keep this file working with it.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/sphinx/kerneldoc.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index 51a2793dc8e2..2586b4d4e494 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -25,8 +25,6 @@
 # Authors:
 #    Jani Nikula <jani.nikula@intel.com>
 #
-# Please make sure this works on both python2 and python3.
-#
 
 import codecs
 import os
-- 
2.49.0

