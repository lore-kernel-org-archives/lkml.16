Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ADC25C838;
	Thu, 26 Jun 2025 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925412; cv=none; b=g4bMOvm+F43egCmrnDyJJM026x+gTY22KSJ77/bpendQrcgddlNCBNe2q6GhayQfuXkiMtebw08IrxyWpItwI4aWaMBzspliUKEZ6yk4gmWMP3n20De24ey3G8r3UgSSQ5wwB+poU3x3yfRgfInlCl2JRDji1TjGf9CkQLtExoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925412; c=relaxed/simple;
	bh=uqL7Npn6nD9bQK26qpQdsjFctfUmYoahBmjchL/UNkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TDxAJLS5beEEuKIpu1eQY3CaH+0zfZtStEVF/rsxcvJcg01V/RgpwD59mk3V81O4Dnb9SeT5Pm+g5FqCodekp3NXA2fwvj/k6bP54Jqw0ra5MfppxW5KgcSPRBBlbcykNZTpkefZ0FXiVd2n1klq25tN6G8T+oR+6hqpAMAMbtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KczPKHv2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KczPKHv2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9688AC4CEEB;
	Thu, 26 Jun 2025 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750925411;
	bh=uqL7Npn6nD9bQK26qpQdsjFctfUmYoahBmjchL/UNkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KczPKHv2OqtlVt9g9SlienJuF7N2hL85CliDbCjck70g51kzw+6vUY8ZAZaH6M6fh
	 P7yg+wbAn5bfKbPG1zUyhleSkkWYk7ylZQi/AdOIn6eIqVAMfoLuN1EBAVQzafDAUX
	 8ZoCw7bffZtYSbDUlen4PXtbGU/0RYwJgt6kXzlF7yJ3bmel28k/S2GjSrLBrweV4g
	 dPiQedgew8djLpWBQgxM6jJxIhw+07zU2uePVhOxuV5RPRQEU8vupjEfeIy17GJBrU
	 KAlwzO4cujlDfYOlahEZkjuQLJ6fnngA4ymdOAkS6Qu9ufpEAkt1Lle4agnFigCXVU
	 a2FaZPLJM8BbQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uUhcz-00000004slI-2z0U;
	Thu, 26 Jun 2025 10:06:37 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] scripts: sphinx-pre-install: fix version check for Fedora
Date: Thu, 26 Jun 2025 10:06:29 +0200
Message-ID: <35fde8948e478e02a10143d4b905405c97cc9cc6.1750924501.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750924501.git.mchehab+huawei@kernel.org>
References: <cover.1750924501.git.mchehab+huawei@kernel.org>
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
2.49.0

