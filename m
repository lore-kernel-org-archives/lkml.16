Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C05E233128;
	Fri, 20 Jun 2025 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407114; cv=none; b=amrOhu5Q3hgp+L++bEqWWnu0+jp6PrlzYyjHo9JxWOj3+NCAUvQHVVro5ozGdrqJiZH7SYOm49as/m7Rtl/LDdP5CkC7ztiTs8H1b5Fqfd6L8JD/wH2wxnEu4idANtK+GQCVWeL7DJOfX3/j7KkNfLl6Q3NmS3dw11OoeWNKstE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407114; c=relaxed/simple;
	bh=3yI0hd++pTAVk6UlNj1uaAE4va43OAIfWkR3JnQPolk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bs31cMlVAdCwVnQzI9tSRMJumH+pdG6VicXYBB19j11laoKGWXG1E1NBVtMHTYbhrlqoUGwIJYb1qlG6Ul3U1i/ZlCQT0kY++QIeERL2mAmRQfE8zZv4Ff8hQFRBSKm5lMrCLbAG2XYDEIZgi7uk0+Ia3ic5QbH6SH0YJHlUBc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhtEtjUs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhtEtjUs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51A1C4CEF6;
	Fri, 20 Jun 2025 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750407113;
	bh=3yI0hd++pTAVk6UlNj1uaAE4va43OAIfWkR3JnQPolk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GhtEtjUssPMeJCzgvWaJTcFljk/sjLv3sGESjb9Aol0m3SWcPlxcthRoivaXHSHp8
	 oWrFWbVyl/Ji57YmHHEv0aAUsz91X559+PH+7OUS5mfXnmqNM8N5A4DQNrZ7jTYAaU
	 im3oRk2caUP7Ryru+PXUVGQUKMuwF5hUVQ1+XePmMexg68nLIk61jbg3MfJSK4ruuE
	 s/pGR7tSyssqLxdTRP4EamOSwRVylOWpJUP82PY+MY87TWfgM9f1ICM2w3DNE6CJij
	 5iAWxucqcUSdBdz10I5wbs1v1Qd7JrBrmuJ+PZ2YBE+44//0EERjiDveP5vuNtA0QM
	 Q4wst4q63xbUQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uSWql-00000004TX7-3tjQ;
	Fri, 20 Jun 2025 10:11:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] docs: sphinx: add a file with the requirements for lowest version
Date: Fri, 20 Jun 2025 10:11:46 +0200
Message-ID: <d8f4d6979756e8ec07908a38d2d776cc4682ac27.1750406900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750406900.git.mchehab+huawei@kernel.org>
References: <cover.1750406900.git.mchehab+huawei@kernel.org>
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

