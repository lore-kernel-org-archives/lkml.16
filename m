Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44B31E9B02;
	Tue, 11 Feb 2025 06:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254777; cv=none; b=XfIPpizTNREBcgWPV/JeQpEaGyFlycHXR0fDk5xfpoz4P63oVFBgu9o3YmhsRPx1Adt7Gd/C1DgafaJT9V79AdDcKt/L5AR4gRlCSkOKPbK+4QquzKjznpbexa7PWXCJu9o/2QNyh2KDeayoDay/Lwjp7/xYiNRlp8BAbD2FmsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254777; c=relaxed/simple;
	bh=SyM5UIEo4uAp+xqe9mn1VaTXcvRSgbtPGvMeBSM6HzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLH/i14W6qvzE2pRul6pGZSeHefVaZfktvbaBrdJqMkCGfW2ag9QWd0eAP/WpOpgtD9eGTFOaAnxyeqaK1YzCUeSdM7UZtODJ/fTf0TKBOzj7Wnqf/NmozHxfVX1MFiXJHqzYNdUmc7orhEa6CKN3usbWHcfALoghfECxq5QOK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzecbrUB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzecbrUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0F2C4CEDD;
	Tue, 11 Feb 2025 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739254777;
	bh=SyM5UIEo4uAp+xqe9mn1VaTXcvRSgbtPGvMeBSM6HzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tzecbrUBWZxWH06htlbP4f+1gzg1FJcpR9BFDkC2SkywUCW7gNWqwnMd3A6EzAADS
	 D2ZdoiujeXpuhzHa/yq6SPE7uZ4bHVBti7+kB925KuFhotBD2ZVebNyASxf9jsE0OF
	 X3I/St8u9IQRQNL680kOcN6xRdoACq0yKO3G7WGfQLqzhWU/PIy73A8mVjFeKfCdb7
	 /EN3Es1Z3T2nq5G6/NwDHILjLczdxD7ij2fYPf912wlk9vv/OQ1cTHQLStkzNWA0Ul
	 hJNONdddoVlgAl1C1FZSIxD8PawVUW2u3G5EvmNgM6CbknnFFS0/mltzNa+rGZUAka
	 ri1I8WU/qJ6dQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thjcN-00000008Y6X-15Jj;
	Tue, 11 Feb 2025 07:19:35 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH 1/4] docs: changes: update Sphinx minimal version to 3.4.3
Date: Tue, 11 Feb 2025 07:19:01 +0100
Message-ID: <d79e357468c20d86913e9e343d785398f728aabb.1739254187.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739254187.git.mchehab+huawei@kernel.org>
References: <cover.1739254187.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Doing that allows us to get rid of all backward-compatible code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py             | 2 +-
 Documentation/process/changes.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 0c2205d536b3..3dad1f90b098 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -47,7 +47,7 @@ from load_config import loadConfig
 # -- General configuration ------------------------------------------------
 
 # If your documentation needs a minimal Sphinx version, state it here.
-needs_sphinx = '2.4.4'
+needs_sphinx = '3.4.3'
 
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index a0beca805362..66015c768cfc 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -58,7 +58,7 @@ mcelog                 0.6              mcelog --version
 iptables               1.4.2            iptables -V
 openssl & libcrypto    1.0.0            openssl version
 bc                     1.06.95          bc --version
-Sphinx\ [#f1]_         2.4.4            sphinx-build --version
+Sphinx\ [#f1]_         3.4.3            sphinx-build --version
 GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
 mkimage (optional)     2017.01          mkimage --version
-- 
2.48.1

