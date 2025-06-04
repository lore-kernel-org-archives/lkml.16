Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404B02918EA;
	Wed,  4 Jun 2025 14:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047841; cv=none; b=cYI7yhERDGgua829TcvkY6BFHYlS0FeaeaqYf+udXP98JsxPJEzrQbmf/wQluUleASnjmjJX/FVDRnYTO7SPwtXq4QtHMSw8Kczefncp+zNhUL4gey6wThFil2vGiN1PXrxDgkw0sL6NnSDNQObWn/2r7Eljqkes5SQWHdzXnps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047841; c=relaxed/simple;
	bh=n3BGNRF566cDDtcBKyLEimgg5xUVaSyHoq2hq+IcLis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gw34rn+rvcz6xvHzTzm0MPBDBlXtToLrWek+CUqnjFwG18phsRJGP6GhwvXjNK6KCG3cvyMvQfxQ+jec2ETf2tmiXwhCP/iBptU8yGda0D2PaMZXaASP/zEkKYCL9oIr10UwZmD+7y0Ejm3B4zDdgqPqK3ToNELDD3+LZ9SVJB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IoSaMw3J; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IoSaMw3J"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3CD6F41F2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749047839; bh=tvFya/pb+S/tzuJ3dPBYB53ab6U3mH5GgVpq+XIb2Xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IoSaMw3J6td/EUscFMxtpKj5c4L75mCm4yXHrPDIapZbjHa78djnFsPezt1Wkowa1
	 6VyBX8st74kWI0au9OaGmZ7Cffd9ke4fqcXYe/gIvPndy/HXECmXwAvidrokXvYqU3
	 7o1803cKHsTaBc7Fb1gdDQ5tkDKZgKwim5A/lllO1Tr6feil1MLBaJjPS4rA8CI8Wp
	 xO0XQc4SFmFcqqNANhUkoy8FnnMMezrv9XSDeJ9AZx0wpWrt4KMDckBd92TCoEs8tj
	 zlSCdPCFwGTbnKkhrIqy0/KaCnG11T8CPYnMixrkjZ8HVO0MbBImLrM5tqRyinFvU+
	 8XWkzsusX2r6w==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 3CD6F41F2B;
	Wed,  4 Jun 2025 14:37:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 3/3] docs: CSS: make cross-reference links more evident
Date: Wed,  4 Jun 2025 08:36:45 -0600
Message-ID: <20250604143645.78367-4-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604143645.78367-1-corbet@lwn.net>
References: <20250604143645.78367-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Sphinx Alabaster theme uses border-bottom to mark reference links; the
result does not render correctly (the underline is missing) in some browser
configurations.  Switch to using the standard text-underline property, and
use text-underline-offset to place that underline below any underscores in
the underlined text.

Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/sphinx-static/custom.css | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index f4285417c71a..c9991566f914 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -136,3 +136,10 @@ div.language-selection:hover ul {
 div.language-selection ul li:hover {
     background: #dddddd;
 }
+
+/* Make xrefs more universally visible */
+a.reference, a.reference:hover {
+    border-bottom: none;
+    text-decoration: underline;
+    text-underline-offset: 0.3em;
+}
-- 
2.49.0

