Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBD9481C4;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750572171; cv=none; b=lYvtcgXC6v8WOv5X2gNxnQwcWReH5juF1vUffRSO9yN5ZzI9NQrqJIpj/YhxhIfEGXXJT+AtYQzhu6cZqcc9vk/I5xXrMEv/nwP6z/MnYw9Cbz9B+20qf7g7+UNxmEFPwFR1127/dgrJXU2pgP+j8kglznsuz8okPqU8g9SBMhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750572171; c=relaxed/simple;
	bh=9sv3o8O8M0IyOR5wJkoSEusaPecRlQcEL5SoMo0iJ7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VvoEAZ0eSQNLEbdLj8BRlGRysfyOr+Xga4JwAjR1ViGlBXD3/ng5TMrY0oi2TlobGPOdRcn2Dsusrvupp4jyRJ+wwG5kW2/COfBlPsfyJcT0mWrmizEVyEN+XW1FgzIoqn5gWtCDaGI9Dz23GPhxzm5TpdjVTdcWHuQbli9PKOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWYycLpX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWYycLpX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342C6C4CEF4;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750572171;
	bh=9sv3o8O8M0IyOR5wJkoSEusaPecRlQcEL5SoMo0iJ7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWYycLpXYVVCTDduwZsyo6x2f0ct9XJvpZPJuxOXnz5mHcdFh2qg7Mtx8ciW2BL8Y
	 A+zQomcwmCJ/PFwyq1sKxvIacIC+HOYuPCySm8s9qwtvyZ7UG0aHt2XcItUv8XK8DE
	 XOzdHBsukwyEpulHUWobmn85v4mj74CUDvqtKJUHoknAvzX/CybAh/gpHIGqzA5Et5
	 blkjoW0L84a8AZXVh27FY/H25wqaAL+qiYFprcWT5opgNGDAtuawvXS0Ghi/zFgIN2
	 zmXQ2p2SgRb5cHykuYIyywTGMlzmKihGzWDCb5GYnueWfU9ZkHzDt9nqTPf4DnJ8bd
	 0FDKZyFH216kw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uTDmz-00000000o28-1LnW;
	Sun, 22 Jun 2025 08:02:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Breno Leitao <leitao@debian.org>,
	Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH v3 02/15] docs: Makefile: disable check rules on make cleandocs
Date: Sun, 22 Jun 2025 08:02:31 +0200
Message-ID: <8386afcee494c9e81d051c83235150104e3a2949.1750571906.git.mchehab+huawei@kernel.org>
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

It doesn't make sense to check for missing ABI and documents
when cleaning the tree.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
---
 Documentation/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index d30d66ddf1ad..b98477df5ddf 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -5,6 +5,7 @@
 # for cleaning
 subdir- := devicetree/bindings
 
+ifneq ($(MAKECMDGOALS),cleandocs)
 # Check for broken documentation file references
 ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
 $(shell $(srctree)/scripts/documentation-file-ref-check --warn)
@@ -14,6 +15,7 @@ endif
 ifeq ($(CONFIG_WARN_ABI_ERRORS),y)
 $(shell $(srctree)/scripts/get_abi.py --dir $(srctree)/Documentation/ABI validate)
 endif
+endif
 
 # You can set these variables from the command line.
 SPHINXBUILD   = sphinx-build
-- 
2.49.0

