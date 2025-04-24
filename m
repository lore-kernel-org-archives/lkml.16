Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDB91BC3C;
	Thu, 24 Apr 2025 00:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745453838; cv=none; b=gcw4I1G187rIZBfgAFSsZnba9BxZ8raBQzajwfnZnLyDqCCN2Ll35p6s3iuPtqVnzMA0IT8eyDKwUN73wOWLgfxM11hH92s7exZXOdvbPbiMFxC1/pCZTbcSHgvc/iv20DB0fnZx0cQGFn4yp6/ouqtDU56WXmgrO10BmoPeNHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745453838; c=relaxed/simple;
	bh=1eKuPB985sA7XP0k/Jaz595uT7gavw91h7GkNlCQrZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oxhlPBFozyBGU4GX0+AOx4Wsxt3mkEvu3ySHeQOOt1tIwf3yKG3RKZjU17i7kmY7UK/92r0B9o5SqNuu68VXpxSBuGR5kPWrQBKUXlAsIX6Anp4Hfb+Z/2Ar2oQSXW88NGIYFi03X7ZR5NoyuLVHPmmAwWgWEX02RQgwHQDMTY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqlfk8lx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqlfk8lx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BBBC4CEEA;
	Thu, 24 Apr 2025 00:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745453838;
	bh=1eKuPB985sA7XP0k/Jaz595uT7gavw91h7GkNlCQrZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sqlfk8lxSpKOB3EAfi8c3iHzcjySZ81rIuKKP4FNJZ1nzQwaJMeSiTk16raQakhuP
	 AMgR+9DGpXI9RpY5aF5TmXZfp2/xlNDK1vGXH+evOngAmuToZb3C0Uct6t1dFkzqrB
	 yN5qUyzyXKrHQAoyG3R947PwdUhsiTWT3aMi1lie4yDVw4d5zOffEj2ZaBnT38aDJB
	 ThmUNx4xaX/mySbSU1fLUCpfDBVvbS4+GM2n5qckNbfwkDtYvaFYsh05cqefWiks6T
	 VljDz/l6zN6liFFOzlQ9QEtbfbuk+2ICjbeB8bNlMlFInBpKRZc9xqqY9+529CBYWV
	 8xC/kcfQluhWQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u7kH5-0000000049c-2FLv;
	Thu, 24 Apr 2025 08:17:07 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] .gitignore: ignore Python compiled bytecode
Date: Thu, 24 Apr 2025 08:16:24 +0800
Message-ID: <ae1c54ddacf6ded1f7154897b10798d4b3fdaf96.1745453655.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745453655.git.mchehab+huawei@kernel.org>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

While the building system doesn't create any Python JIT bytecode,
if one manually runs kernel-doc.py or get_abi.py, Python will,
by default, create a bytecode and store it under scripts/lib/*.

This is normal, and not controlled by the Kernel itself. So,
add *.pyc as an extension to be ignored.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index f2f63e47fb88..bf5ee6e01cd4 100644
--- a/.gitignore
+++ b/.gitignore
@@ -40,6 +40,7 @@
 *.o
 *.o.*
 *.patch
+*.pyc
 *.rmeta
 *.rpm
 *.rsi
-- 
2.49.0

