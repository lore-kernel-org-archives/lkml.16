Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3983267705;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=q+agoVV3aQr2iZGgwngIOEe9j8XZN/XWYXN8GQqEfcEVFBlA7PyrioMdoQpXbuJ2KSDT3pXUGiOx43tQu7PQIPpOvDzvg59yafhMCd91l3zHuZkxXMzpJguMS71PsU4A/tG3hI/HIftFDtOLgSiUtd5Eo4C3UvZyR2dnwxePSTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=qRmSVZIAGM1/RGxEsAh4Fq+fWp94UwK53McyfcPS6fE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2KeKNOdWNQIAfm+ef1bH94N8TE3fNzol2pcvK338d5JKWULsiGGnoZlWhAepy2qPp8yGAs5UiMwkXLcqnqRZXslq7Nyw8K38myFDC4vzIn+Bvh0yuM1YegAGIELkOR2AerqBmKcAIgNAKU8PfzptLJtLAtqZX3yu4VDKxpkk6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pOHaSnkx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pOHaSnkx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDBCC4AF0B;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=qRmSVZIAGM1/RGxEsAh4Fq+fWp94UwK53McyfcPS6fE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pOHaSnkxciH1EXpW2XiFYKBr4vj3uciw3tr3/6z80UYYvaLO6unq7zmlL11EWBPP5
	 P6mEbZ0pulR2BW+kR3mo9B27DWsh/8yL6XkqkzWsY8SwN0zmlIRDYsf4d+9Y92fRQ/
	 /LMpsiPcuoHX2ArXcushrwGCoQVoYh3PDyVXLc3CY/UwEzR0UEZBPe/gzTANDzTELd
	 F2uEgBpE19bc2yr3tE2l+vrU1dLQF4KF7ooLArVETNIXQh6R+gbcBafyARxRuDL6tg
	 NJE1fgpQ7b6drvj2lzEie0kEHURccbMpEtIm7q/uAd+zQBDxTGB26yvQBitgp8z6Bz
	 wE9E6gX6/oDzg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWY-2Pkg;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 27/33] scripts/lib/kdoc/kdoc_parser.py: remove a python 3.9 dependency
Date: Tue,  8 Apr 2025 18:09:30 +0800
Message-ID: <f64cc4adef107ada26da4bfb7e4b7002dd783173.1744106242.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744106241.git.mchehab+huawei@kernel.org>
References: <cover.1744106241.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

str.removesuffix() was added on Python 3.9, but rstrip()
actually does the same thing, as we just want to remove a single
character. It is also shorter.

So, use it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_parser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index f923600561f8..77e8bfeccc8e 100755
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1641,7 +1641,7 @@ class KernelDoc:
                     # Group continuation lines on prototypes
                     if self.state == self.STATE_PROTO:
                         if line.endswith("\\"):
-                            prev += line.removesuffix("\\")
+                            prev += line.rstrip("\\")
                             cont = True
 
                             if not prev_ln:
-- 
2.49.0

