Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30E81EF382;
	Mon, 19 May 2025 22:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694178; cv=none; b=aN6MIVCLy//z/JM9T7yb0AVRpvqK36gnD5jtCoxlDqHQfr7NheSa0B7OL3KigWitpixtg1MDnq3g94r1hDLcK9jp+Kk0iZEOjT9XUdgyhxCoEQnyHyim6/+PSAtakQ9vk7RVpQrXrffiaQs4AthfM/Prl30AgbHdrgWYmpqsOz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694178; c=relaxed/simple;
	bh=DB47/nxqMBYEeYcV67RpOye4NV6ecYKBEBI6VK1SQ/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJroLmOPk0kJIzZCOEtCbBpjyYn4Hn3NlkNZnz0QBkeVKB4tROgnZjaE3WsfwhpW4EBO4jgcC/eqRFUvxT6UE2a5LXxb718SEFTRSAwilZxTa5UczODMlBw6NPXT64Lqq/sPulKxNcMXWrs6V7t2gtobdtKZ42V+7DnWQYvOi5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gsYZuJvx; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gsYZuJvx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=4slF05qOcUlAomJmfC7Ov5/IzS10Xw2bKa5c2MCpjqw=; b=gsYZuJvxQCo2WDv3Z0V1e8wP4j
	UzxIbKevPO9SxfiRu8LqKBK86fNdGOFWM+zUtWHegZndpmHVa9lw9u3ne9m8W+JeeHkkcVca6hwVo
	6HAwWgDUZXT83Km6YBcm97BdGPs5KbpVRbWy+lq+UFJC4E5MzZ45CP8Xb3JDtNwu/6Pqi7zFoFUUa
	/L6iVENjAb1r7jU4bq44d8bUC94miSztfLDxznVWg+9EPRWK/YwsvDKRZyxQDECTO5XP7oybMlgBt
	oQnVE+JW7CbNiD3ZraVR5ADyBaFGa7SwFynuU/IFlVjgeWwfFLA4ajaKWcgr5wElChRB57AFUeOng
	HZ9e/Jiw==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH95i-0000000Al1Y-18vr;
	Mon, 19 May 2025 22:36:14 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] docs: doc-guide: clarify latest theme usage
Date: Mon, 19 May 2025 15:36:13 -0700
Message-ID: <20250519223613.37277-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have been using the Alabaster theme as the default theme since
Sept. 2022.

Keep the information on the RTD theme around in case someone wants to
try it with the DOCS_THEME environment variable.

Fixes: 26d797ffc1c0 ("docs: update sphinx.rst to reflect the default theme change")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 Documentation/doc-guide/sphinx.rst |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- linux-next-20250516.orig/Documentation/doc-guide/sphinx.rst
+++ linux-next-20250516/Documentation/doc-guide/sphinx.rst
@@ -42,12 +42,6 @@ with your distributions. In order to do
 Sphinx inside a virtual environment, using ``virtualenv-3``
 or ``virtualenv``, depending on how your distribution packaged Python 3.
 
-.. note::
-
-   #) It is recommended to use the RTD theme for html output. Depending
-      on the Sphinx version, it should be installed separately,
-      with ``pip install sphinx_rtd_theme``.
-
 In summary, if you want to install the latest version of Sphinx, you
 should do::
 
@@ -162,6 +156,12 @@ By default, the "Alabaster" theme is use
 this theme is bundled with Sphinx and need not be installed separately.
 The Sphinx theme can be overridden by using the ``DOCS_THEME`` make variable.
 
+.. note::
+
+   Some people might prefer to use the RTD theme for html output.
+   Depending on the Sphinx version, it should be installed separately,
+   with ``pip install sphinx_rtd_theme``.
+
 There is another make variable ``SPHINXDIRS``, which is useful when test
 building a subset of documentation.  For example, you can build documents
 under ``Documentation/doc-guide`` by running
