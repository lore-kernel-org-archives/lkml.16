Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0DD18A93F;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750572172; cv=none; b=cedPW3n2utj/96sgP6OE872iVhbD26K1IwXei8yIygRwNayu8EelTnU03sssOw+q5oWlxucWlWR00eEUkoNLI0n9976FLrBayVCii+EyXn1LWPTEegWtIR7pDnVLpaICNH4zS6xRKNcY8h0jY995ezwucxk520O3iuQyQc8SHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750572172; c=relaxed/simple;
	bh=3yI0hd++pTAVk6UlNj1uaAE4va43OAIfWkR3JnQPolk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Se7VumUIjlYA6grzVYCE5U00+Ln6yD74noRdxpr9SuB067RkmpxVwRWEl9azdoE4FsSPzWsSWAmUIb2wAf88W6qTmK67sNcidxY2GZaHbS4U1rbMcKfWdXkvbRx70CTU6ZNa1WXcde573aaLvyY51JmSSAqEPTNKB3ejsG4kd4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtnFKHB/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtnFKHB/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66186C4AF0C;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750572171;
	bh=3yI0hd++pTAVk6UlNj1uaAE4va43OAIfWkR3JnQPolk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PtnFKHB/W7NTw9PGTMng2N4qb+pAy0jragCYcBjAxyJ3iJPPwIMFC7BHvCZYor37c
	 +RLdABfzQp/FoBARjDcPsGicErpKR0BwKgvaPSUD6xOw/PijG2gjDcwHSvJcPYE92s
	 e9nQ5MW+6ijxI4tKDyfBuqXc70WdEn5KNsvodRLMg3K7tdfDsgEvAIa5cBA9R6FIQG
	 0J0G96OqC5I8gBnuYog4t1EacK70NF+0wtvKQSjgDAFuc9AIX039A8AUia4V0H0EZe
	 UEJojV1Cn2wr+RyUrIMoqsccwoNurGOf4bZkoXE1duZiLy7jL8wNx6rtUoPobN3ZwQ
	 sY0UqdOqmX9EQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uTDmz-00000000o2q-2cbr;
	Sun, 22 Jun 2025 08:02:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/15] docs: sphinx: add a file with the requirements for lowest version
Date: Sun, 22 Jun 2025 08:02:42 +0200
Message-ID: <e38a44ee64ebfa37eac5f64e47af51c7ac051d5a.1750571906.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750571906.git.mchehab+huawei@kernel.org>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Those days, it is hard to install a virtual env that would
build docs with Sphinx 3.4.3, as even python 3.13 is not
compatible anymore with it.

	/usr/bin/python3.9 -m venv sphinx_3.4.3
	. sphinx_3.4.3/bin/activate
	pip install -r Documentation/sphinx/min_requirements.txt

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/doc-guide/sphinx.rst        | 23 +++++++++++++++++++++++
 Documentation/sphinx/min_requirements.txt | 10 ++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 Documentation/sphinx/min_requirements.txt

diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
index 5a91df105141..607589592bfb 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -131,6 +131,29 @@ It supports two optional parameters:
 ``--no-virtualenv``
 	Use OS packaging for Sphinx instead of Python virtual environment.
 
+Installing Sphinx Minimal Version
+---------------------------------
+
+When changing Sphinx build system, it is important to ensure that
+the minimal version will still be supported. Nowadays, it is
+becoming harder to do that on modern distributions, as it is not
+possible to install with Python 3.13 and above.
+
+Testing with the lowest supported Python version as defined at
+Documentation/process/changes.rst can be done by creating
+a venv with it with, and install minimal requirements with::
+
+	/usr/bin/python3.9 -m venv sphinx_min
+	. sphinx_min/bin/activate
+	pip install -r Documentation/sphinx/min_requirements.txt
+
+A more comprehensive test can be done by using:
+
+	scripts/test_doc_build.py
+
+Such script create one Python venv per supported version,
+optionally building documentation for a range of Sphinx versions.
+
 
 Sphinx Build
 ============
diff --git a/Documentation/sphinx/min_requirements.txt b/Documentation/sphinx/min_requirements.txt
new file mode 100644
index 000000000000..52d9f27010e8
--- /dev/null
+++ b/Documentation/sphinx/min_requirements.txt
@@ -0,0 +1,10 @@
+alabaster >=0.7,<0.8
+docutils>=0.15,<0.18
+jinja2>=2.3,<3.1
+PyYAML>=5.1,<6.1
+Sphinx==3.4.3
+sphinxcontrib-applehelp==1.0.2
+sphinxcontrib-devhelp==1.0.1
+sphinxcontrib-htmlhelp==1.0.3
+sphinxcontrib-qthelp==1.0.2
+sphinxcontrib-serializinghtml==1.1.4
-- 
2.49.0

