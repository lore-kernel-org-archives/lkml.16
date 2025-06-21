Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EF2270EBF;
	Sat, 21 Jun 2025 19:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535761; cv=none; b=V5RVYktysQ0hv+bNChqpMVl9BMJg9EdTFWatbQSY474gfbWJ2f9H9lP5fkVO2NepDrqLXCeylTNyR5s8PMdpEO4gbPyrtAwg+wrMn6Ppad7Y2QmC+iHcQEneH3ve/jXpw94zLFE/JIxCkINwrdkmp5lhsyEFkCkpuR6KjBbr+UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535761; c=relaxed/simple;
	bh=3yI0hd++pTAVk6UlNj1uaAE4va43OAIfWkR3JnQPolk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4RGvrZHhrh0gx6XOpM91DW/8bNcSAOAvmoGHUgiHjLvd20vBRxCh/Jjec2kWGYaDJJUqFplNfo5vsf8JYpwzEgJHtkqoyO0+QTFS74Pq9ZSFz7orPHmShWQbmRk4FI680cgDpro178CCcqsdkOENSMnURjjsKLNsT+/JlKQ3fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBGPoQ6I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBGPoQ6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF44DC4AF0E;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750535760;
	bh=3yI0hd++pTAVk6UlNj1uaAE4va43OAIfWkR3JnQPolk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hBGPoQ6I5ihvFzE3BhClvLrR5MeGUfP3lE+/jI6+EoJgc2UJjsWi5OgY7YY5UenuJ
	 C9q8kL2ROLsMzi2MqK2fJwyN+ZxAeHmjjEItV4CPhrZnIBMZa2/UnZkj+8okOSP5D8
	 u8+YwfyyEC1i+NZQwY1Zff4WZopx+NzbmdEKRZIQR7oD+BokXvOgk6dIwkoC3MB/Q8
	 GiGTE+3l4csDVvqmnpJWkYYv4HzZZPeIfHDVZvT4jhFXrcrV+tveTuCtdAGGPilyds
	 cX8Vwxx6Ftyxl7peaDYNG6JssTJKb+WgGTxyNK1T9RnysaPW3x4x4aqv2VfDQIeoNd
	 LKZUgvrAzr21g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uT4Ji-00000000e4O-3hyM;
	Sat, 21 Jun 2025 21:55:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/15] docs: sphinx: add a file with the requirements for lowest version
Date: Sat, 21 Jun 2025 21:55:52 +0200
Message-ID: <3bfcb9d4ddb303e2f0dd678fc590bac52bb4c1dc.1750535171.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750535171.git.mchehab+huawei@kernel.org>
References: <cover.1750535171.git.mchehab+huawei@kernel.org>
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

