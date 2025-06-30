Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC49239E7F;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320364; cv=none; b=Erono8S/uzbWnrCzc8eiFO6JY1s8vojWsR0cOLNXUQBRzNm5eDyuh9Cy4NGuQXS/Z1NXa+CeJs5Xlq1vSf3FwlSJJ5Jh8fAe62nbzKC//ANkycz/ODW1du9lb+Q0z7fBQWSQ1HHIF9DWYQlkACME8eKxiT7vAJvBizBxA15iwg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320364; c=relaxed/simple;
	bh=tRHbxQ8xRhDpil6Zr05w8pog9obBdefehr/BAJUtAVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeK1QVeI9auIiLpbHVOnWjQgr1+DRAcNBigKKvn+3LqcQNbHtAUbDPgWPU2GxWryajHxyAasD9q5lQ2SR9WhD7Hji4KCus1PAQpsX5QizecX1zPozUck5NNkSEWFy90n7RysvNpFFVAP/uXhg8qapKMeQv4MpelvyMx+uNZgMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lxi7wC3n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lxi7wC3n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE9FC4CEEF;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751320364;
	bh=tRHbxQ8xRhDpil6Zr05w8pog9obBdefehr/BAJUtAVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lxi7wC3n9/1SvuETVUF8+kHukWb/9MSKM+xMagidHMoEAEyfwbajSmVvYY8qGt3I9
	 dBD5rBAO8OCQwomJcjX2XQwHkNHTBc9vosdJhUNZ9ATGjT7YaXeLGV3D3pbktby5Ms
	 5rTxEmf1A6NfD/zQpCfGT0d3p/48eVS8CS3c5Ht4NRe2A+MVj2v7Qd1idRAGhPKHHe
	 iyqGRBmGyLYPkx50NBmESQbqt2uhunM1uZ0L3kFHz3B9EK1/OKG1CZuhhi+WnAocGn
	 40YvJiGEB1R8IZox/N/5aHxCdmT5/+bb4SPq0ndNH3T5RVeHC8mXEvkwhXt669URxX
	 o+GKk0y++fojg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uWMQc-00000003QWJ-1aTO;
	Mon, 30 Jun 2025 23:52:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/15] scripts: sphinx-pre-install: fix version check for Fedora
Date: Mon, 30 Jun 2025 23:34:49 +0200
Message-ID: <05f9d16f8a4d95ad7a1d26447d6f600a99e0c92d.1751318230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1751318230.git.mchehab+huawei@kernel.org>
References: <cover.1751318230.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The script is now picking the wrong version. Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 3f8d6925e896..07234d482fa8 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -413,7 +413,7 @@ sub give_redhat_hints()
 	my $old = 0;
 	my $rel;
 	my $noto_sans_redhat = "google-noto-sans-cjk-ttc-fonts";
-	$rel = $1 if ($system_release =~ /(release|Linux)\s+(\d+)/);
+	$rel = $2 if ($system_release =~ /(release|Linux)\s+(\d+)/);
 
 	if (!($system_release =~ /Fedora/)) {
 		$map{"virtualenv"} = "python-virtualenv";
-- 
2.50.0

