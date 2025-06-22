Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE56B17A319;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750572171; cv=none; b=aVbTjNKsrEuk/aSQoLtj8bSbv8TUI3SXldeH2W01niFUjwF/RF4QHsdHeWrz5cY4jBEtdqBGWLJSSo/FRQeCGXzD2s4EEXOYC49aLnzTHXtRkGiaYD8PUyFZLdtJnFQGD7Z8Q5KegW08QWK7AoR02cvSJSMaXjN53EMdti8fqH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750572171; c=relaxed/simple;
	bh=XM0BRurxei07tGyc7KMfzzV3AHmUgy9wbspSPKa3nxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DO9ltz47JiU/w+yU1TZzuS/I+q4lnw6hB8I81Q8NvHN+C4ClgbVe8ZPbgfVJZg1//23+N0yR6wHUxgU4pB3iLk5FkwqGQ5/du6z8AChXiMCpcPN/fYR4xZU1sviKCzpY8NeTNlkrPmK0/7pC+Wyd2u2IsxPxTOViaXjTpUkY1wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsT33Zkc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsT33Zkc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E32BC4CEFB;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750572171;
	bh=XM0BRurxei07tGyc7KMfzzV3AHmUgy9wbspSPKa3nxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RsT33Zkc4H6wRI7CB6iSPcF9cwtnImpY4rDabkTXmrw6CGqjLHtd0Is63E07kk5tb
	 b065nL0H/0wypKOi2uDnRe7d46I6o68gtLIE4cEOLEKtuY4q8Nw1lzdiIn0U5h4gfj
	 nyoUDqchwXxdRfffBUgUtrBC+JFJHaM/0TZ3PfP6NbgeuT+juXC8IXXHp5xixvyIty
	 9TS0w6/jC0qQZqtz7r/Y1g06F0WM7kbfXhyf5x8DVHvZtXAq0eV0c8w64mXkxjXIBP
	 FOgOW/pPEIEIVYzXGW0eckb9j4qRHCbaLiyJAEFQfjl8sI0jY+GNnYtwgMQtqdvkt+
	 a80ZE/tR8Ir9A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uTDmz-00000000o2i-2OKT;
	Sun, 22 Jun 2025 08:02:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/15] scripts: sphinx-pre-install: fix release detection for Fedora
Date: Sun, 22 Jun 2025 08:02:40 +0200
Message-ID: <c2a34860bd986cc5f81fc25554ed91629736e995.1750571906.git.mchehab+huawei@kernel.org>
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

