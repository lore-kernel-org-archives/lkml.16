Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C392F3642;
	Thu,  3 Jul 2025 18:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568260; cv=none; b=Ccve6kaZloZHFkloN0Sr11ZD5mAuq2tKqEfs22Y+A6NWU+cllRotyU90dB7eGr4ug3iqpiKVr3zsMzIgJd90mEcJjC4+h0QfP6O2uLJP8lFO0iwgWLMS87sxBKal/uOKobZcsTESnoSwVJ+4VMI5xnIKlwb77xvGg+blOKgniHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568260; c=relaxed/simple;
	bh=vAhak2IPVfCNWHFr7tDiv6SQZKJcEm/j+I4FBRxrSlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cm2lvyYBnu9saLASIjTcFR6g6XnDjoQNr90S94EC0KzMt4ImoqN2ES9NX62HkHChBVcgCyZrIY1qrjfd4LxaZYMHUJdO7e1BEhbLQI4v9jNjq3HmtLMuiGUnaL7XPzCZfvCVA4iDr5cwn02ZLwzVIZImOgoBpwVZ/YbkhkZAprU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VKAE+sGw; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VKAE+sGw"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C38B340AC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751568258; bh=ddQFEymZ7aJoiSJ4Gc/pO4J4dh7GQJZLeL2BT7iTNl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VKAE+sGwU26/X8OFND9LHSYnnksvqaJU7dy70Jcgs4UYijD60zsEFUPAwzwMwJer5
	 l2TJWWXXhFYa5cTdW9DCaE0Sap/9hYQAJkiaHIpGbt2k1yNSANilNgNoz3xiuP5Wek
	 KSL9DQ+fvjjjOqvzJkXULtzgzah9ApJb9zhX7+LaGUZtBkhAW1yophVDAJPODB3cq3
	 FBaS3nLXxSA7RsrGHCUj3QK3xaJQCmyX32CyToALKKp95nEC4l4Dsr0YDlkEaA7a/q
	 FcI8aVmz5pI8YbbmMamxGOul0XfKnaZQ3mUNFxDXpI5CU9JsuQNiuiQ72pbUeLb3o0
	 uEgZZL7SQMqdA==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id C38B340AC9;
	Thu,  3 Jul 2025 18:44:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 6/7] docs: kdoc: Remove a Python 2 comment
Date: Thu,  3 Jul 2025 12:44:02 -0600
Message-ID: <20250703184403.274408-7-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703184403.274408-1-corbet@lwn.net>
References: <20250703184403.274408-1-corbet@lwn.net>
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
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Jani Nikula <jani.nikula@intel.com>
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

