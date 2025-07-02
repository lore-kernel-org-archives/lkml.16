Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C975D2DE70B;
	Wed,  2 Jul 2025 22:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751496361; cv=none; b=Pg1S1h9Nki/78zB8SMfN6z2Nrise9DZtVJWzzPBLbgtuDhUXaQLX76+0CqBoyu+plTD8PA9QLf0ms01vl+Srhz56GAtBFfviWbwucs/xiyT6dgxTglkVE88+rHP0OXp7DIjppnIHY0866Ga+8KocjhcgPYCdaxTCI3qDUSHGg70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751496361; c=relaxed/simple;
	bh=JwHGt5NjOsUwLGG64Ypk9cN9UAyii+3bU4VVI7xlzwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nr/7nMAlfBHgUaHJOvqOjxAFXy41+6G3qdJo1AqH6QTt2k1CnrZgoNs1gvqJ2POx0rre42JGhRegM2OesXm79s0MXWDQXkwNhuSIoUoANWhsArAhNzipWlqoI1Z80qLcjS3/X5Ymef7IwWaFRVC+BxF0mpeqn9Xkjdzoh6TvN7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=n7u1RWyX; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="n7u1RWyX"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B2FBA40ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751495760; bh=qNeEwa11KuFhFNNsoEtiOe6z2/kVZc4eBix7iuqUihE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n7u1RWyXTaCSyOxgnAqas3LW9kpNpPMI4kC1PXxQ3/lSyRw3S9s/FPhm7VgkmNJRO
	 OmfboYx07g28Tmt8lEmFuVzMJTyDVojnkKbBHSuFJkTS+z3spAzfm3uXK5/ToyxrA8
	 EvTWCZTj67+bEWaAvaHeZmz5DaXHwn9YlJUemtazjvioKTEQMGGkoE+6X2VNV/gSyc
	 yLGp8Q4g7FFgFa2l+jyeR0UmhVfYlm9cwSLiI7vzPA1dQZ3yHGA7qrgQ0AQCtegN7G
	 eGATw8RUIrXOj7dtTUmDdKDfcY/Ih5wxYcEOJNWfxWM0NZpHBJSKdFZQtP4XZ7NGSL
	 0jLKhRruL8Bug==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id B2FBA40ACD;
	Wed,  2 Jul 2025 22:35:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 02/12] docs: kdoc: simplify the output-item passing
Date: Wed,  2 Jul 2025 16:35:14 -0600
Message-ID: <20250702223524.231794-3-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702223524.231794-1-corbet@lwn.net>
References: <20250702223524.231794-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since our output items contain their name, we don't need to pass it
separately.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_files.py  | 4 ++--
 scripts/lib/kdoc/kdoc_parser.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
index 9be4a64df71d..9e09b45b02fa 100644
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -275,8 +275,8 @@ class KernelFiles():
                 self.config.log.warning("No kernel-doc for file %s", fname)
                 continue
 
-            for name, arg in self.results[fname]:
-                m = self.out_msg(fname, name, arg)
+            for arg in self.results[fname]:
+                m = self.out_msg(fname, arg.name, arg)
 
                 if m is None:
                     ln = arg.get("ln", 0)
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index a5a59b97a444..97380ff30a0d 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -284,7 +284,7 @@ class KernelDoc:
                 del sections[section]
                 sectionlist.remove(section)
 
-        self.entries.append((name, item))
+        self.entries.append(item)
 
         self.config.log.debug("Output: %s:%s = %s", dtype, name, pformat(args))
 
-- 
2.49.0

