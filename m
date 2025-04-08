Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F40F266590;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=n9kVSAWYf4bhooi4w4XqLyUgkEPDDXj/s+f3S/BsyFq26G8LAAANHC34kgigorVW69LNAB/83rrKIO+OqEYLaiVLFYmOIfVWsamdR57GGOi4BliduvT9KIM4m/0eNBVKynO6mA0FHQuG9/SYiWN5caFahIGZefERWSbr247Oc/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=cI1iCiRg3MPksW4t2Wew3d0GBmSUuTKJXieNw32ATT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpiCwp+hUEB0I3SpNSgustZ/lyv22c+GXOCKAMq4tJyZg0g0nydAeMR0o/VhBGVbLhUrXIWDDsUZbZtflWZG3bqao5ZleKm6Pk0YDJ2or/GdRExym1Qu3TGpNvsByUO1pbQ7MHB6SdCh6DkrglmHq4YIhqiIBReZHoo71j5L3Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5glxogZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5glxogZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC9CC4CEF6;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106995;
	bh=cI1iCiRg3MPksW4t2Wew3d0GBmSUuTKJXieNw32ATT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o5glxogZIRtpzR+o7+qTzO1Zw6Cw9Yp1qHXOMFuYdFJ6Q6NXr4qcQakuCfnyv/odt
	 OixqZ5GsL0vkWMzYeMVDeXUWNa82bt4gnUiLc2LaKVgqh8tZfCNrGdrkm04i7SKO1E
	 pScw7Hje5rfDrg8/XSOwGcnYAWrSzVhWzq6mw0g55FIfNsnwB9BFSFo+LIMgxXOjTl
	 MPo52p9mBoW5DnEDkxThlfeCvTIneuaxA6mAx3nHpA2EeAvgKBsxRtd9aD4IEPD05f
	 fP75tG2REPtHlcTnMlcgtuBL81Fbbl6IVG5p8Xqxy+wDKC9oGko2xkvlH03jdfIMcu
	 pzJcW2sxAvz8A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RW1-1NGw;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/33] scripts/kernel-doc.py: properly handle out_section for ReST
Date: Tue,  8 Apr 2025 18:09:19 +0800
Message-ID: <935d00c6a7c45b25a8be72fad6183fe5a8476cd2.1744106242.git.mchehab+huawei@kernel.org>
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

There is a difference at the way DOC sections are output with
the include mode. Handle such difference properly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_output.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index 7a945dd80c9b..d0c8cedb0ea5 100755
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -315,12 +315,12 @@ class RestFormat(OutputFormat):
             if section in self.nosymbol:
                 continue
 
-            if not self.out_mode == self.OUTPUT_INCLUDE:
-                if out_docblock:
+            if out_docblock:
+                if not self.out_mode == self.OUTPUT_INCLUDE:
                     self.data += f".. _{section}:\n\n"
-
-                if not self.symbol:
                     self.data += f'{self.lineprefix}**{section}**\n\n'
+            else:
+                self.data += f'{self.lineprefix}**{section}**\n\n'
 
             self.print_lineno(section_start_lines.get(section, 0))
             self.output_highlight(sections[section])
-- 
2.49.0

