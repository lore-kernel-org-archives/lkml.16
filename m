Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBEC1C9EAA;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182704; cv=none; b=U7gfJsu9A+uQ9duiZ8cM5Rjm+cfNCDMIcEWceG5hhTZEXGnl84trxkRQvz5K3x5UHoH/RpA6TDPzoJ+RHLpU0ik3oET+k8tjnK39yAgkG0PAVTWqLrOMRjaVakz9vcLEr6YEEgZXVEkBpunGaDE3Hkv8MlNcxDl3nUu5mfrIOjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182704; c=relaxed/simple;
	bh=0f7tLKTuX4jKgrpwqlZrJAjeosOKAdyvIyBElssJbRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TH0KdMLjuG287DZ83q8iiu35qPSfJ1sIs+tHevNiOC/NnEamv7gPeHKvbaRx5LPkYSM9+k1l/2qNi9ClM5WtqfdY0pA8fzZA+VZHWTV88hQqFa+/m/g/owwZRQvrqzkM4J5ro285uRjoPLBZjbkYn0p1ianGyFU+LxP3d/sYxs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFpCRKsh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFpCRKsh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DFFC4CEEC;
	Mon, 10 Feb 2025 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=0f7tLKTuX4jKgrpwqlZrJAjeosOKAdyvIyBElssJbRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gFpCRKshyXHPkW8Pa5qqFE3RBtolfl3uSLLR2Hk5loLvpXm8nj4A8eACN+usbv/bv
	 uWP7YJPfufIbhDBoiqvZJujd+XO3SW1eH7m2l1jYB/Lh1ly7aPr+XuUHBFBergkTTI
	 7nLoBbs8vK0dru3uRub8c2Nah/aIisbdDaPcS0Y415idsCFFHBK94C0HNVD40FpZ0V
	 eq3OleQfskY91HFwxKnaiyjNp8I4sYmGz5UYgjfBSgBhWqpiJyN7tMfhiC154noBmh
	 DRZ6cXPJ0qAyCa+Yuro/r95eu0DyaJhgI4oS0HKWB3TZDyX5N2c/1ukFej3JNqULNO
	 tGEu5KGABbmsQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006Cii-0PuR;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/27] scripts/documentation-file-ref-check: don't check perl/python scripts
Date: Mon, 10 Feb 2025 11:17:58 +0100
Message-ID: <712bfc8412ee5ad8ab43dd21a8c30fc858eff5a6.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Such scripts may have regular expressions, which would make the
parser confusing. Also, they shouldn't hardcode filenames there,
so skipping them is OK.

While here, also don't check references on extensions used for file
backup and patch rej/orig.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/documentation-file-ref-check | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/documentation-file-ref-check b/scripts/documentation-file-ref-check
index 68083f2f1122..408b1dbe7884 100755
--- a/scripts/documentation-file-ref-check
+++ b/scripts/documentation-file-ref-check
@@ -92,7 +92,7 @@ while (<IN>) {
 	next if ($f =~ m,^Next/,);
 
 	# Makefiles and scripts contain nasty expressions to parse docs
-	next if ($f =~ m/Makefile/ || $f =~ m/\.sh$/);
+	next if ($f =~ m/Makefile/ || $f =~ m/\.(sh|py|pl|~|rej|org|orig)$/);
 
 	# It doesn't make sense to parse hidden files
 	next if ($f =~ m#/\.#);
-- 
2.48.1

