Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F814270EB2;
	Sat, 21 Jun 2025 19:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535761; cv=none; b=khZGijMlvm/oPG4ScUlOfeyx3ZyMJxTYxnJpDm+4oY30BBujEJn7t6Vw7vuC1yWLMwmvivO/EiE5SFozBQo1ZUBZGZ2qcq1FsRnR2sUT956noD6DKcXQljWKZtMFFty918fko2SlPZBUm17uJ2f/JyBwuUSO6aHqNkqSSa9dhmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535761; c=relaxed/simple;
	bh=XM0BRurxei07tGyc7KMfzzV3AHmUgy9wbspSPKa3nxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tKRwoMKjU7IgK0+NdwWnW5m7o2ZWHaPFW/EVZykezYISy5y+Sj0mQPuHeMc/iBVP1zpsG9XyMihkK0Ivh9l47EfLFV/o/rpPx8+wgk70n2J6RARXnW4Oakp7X45xEYpCmWcKyTnlHJkyJOBZC5OocoDdYigKff5vz4EJteS25A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFW02x2I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFW02x2I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FEAC4CEF1;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750535760;
	bh=XM0BRurxei07tGyc7KMfzzV3AHmUgy9wbspSPKa3nxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aFW02x2IBj6uZQecVNFsqvwymcOnVg/oNIksMbgO/HW7OQcTwuM8KFcEZVZFo5Q7h
	 k2H+EcpdAEJcOLwXmpsnl6nmpw8oarV9LwXmA/kWSS7CVCc5nZg5AQdOcm570M4adu
	 5xb6XtF6o5tE0ZefzcOEq28Jl/WGMeMtIECSXfB5QXfOSxINzELlxWV5eg/zv/kGn/
	 Ck0YFiOTzYW0DW9cm178F5Nj3wHKBR+wCZc/wjAv+VYgxIwve3NmKG93XPr3n/eu4a
	 d7l3c+h0l3xoCpklUvSNPIhysBPyuejuNd1rpBtclSZ6rWX+7HO0dKg70Hv/2xODsj
	 copTtxkj9nZQw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uT4Ji-00000000e4G-3UKF;
	Sat, 21 Jun 2025 21:55:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/15] scripts: sphinx-pre-install: fix release detection for Fedora
Date: Sat, 21 Jun 2025 21:55:50 +0200
Message-ID: <febe60569002300ad688d41815e316442c93b2c6.1750535171.git.mchehab+huawei@kernel.org>
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

Fedora distros are now identified as:

	Fedora Linux 42

Fix the way script detects it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 2a311ed00179..3f8d6925e896 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -413,7 +413,7 @@ sub give_redhat_hints()
 	my $old = 0;
 	my $rel;
 	my $noto_sans_redhat = "google-noto-sans-cjk-ttc-fonts";
-	$rel = $1 if ($system_release =~ /release\s+(\d+)/);
+	$rel = $1 if ($system_release =~ /(release|Linux)\s+(\d+)/);
 
 	if (!($system_release =~ /Fedora/)) {
 		$map{"virtualenv"} = "python-virtualenv";
-- 
2.49.0

