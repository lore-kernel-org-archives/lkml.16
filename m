Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CF626659F;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=bVxvGIrEH++vb0oTe1RmUhtzJrr7eZ+4zcJZhwVZB1OFbCHA2SzMdT1zpotPXJFtsjcRvndweC2qPwqNo6D08Yzjfz9Qq7UJD62oBsEBGQDYV7EtCvvYIgUiuYD7FoUe6sWqmk3xN0IbyVcfY+EkHrWDzihn5F4e9YEm3dR7v6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=wYGITVSD3W1nJ6cH/x1z0CW1HgVp+nvFB/0wOau6qSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q86KNJVwSrsdgnHBE8xvQ0uDKFVayNWY1GlKhwZS0bjB1BP4l5DWZLx/X4P4hEjtuTTlre4fRN+MmepXnmDwGCtnLD0QEHRdByndsX5elbeOb6dIbwGCz2Iowcgr3eiJkQk/rnK7y1zeBzXvzTs381aSvp8pzi1HBGe17HxpDBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qc1rV2j/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qc1rV2j/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B6DC4CEF4;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106995;
	bh=wYGITVSD3W1nJ6cH/x1z0CW1HgVp+nvFB/0wOau6qSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qc1rV2j/Y8IU6+tjvkXSoLq3yPpo4PGn4CdgLFOnGpm3mjNZTt1TOhbSTOPOt4hmn
	 U4+JWDtBFxzUVslkf16YLWvXepBp984AgNOsLiRX2q5gRtGWh/kBIWKG1wXWLAK6T4
	 ENG2wa/34Q3ShpBKFkbN2S+bSXvaoPtqagrLn/Kl1b7Gq48+cktLurVm6wITug/1J7
	 /hpYJjdrlkO25NxTxeuyw3WvCvKF18FnniA99F+kEn2QzvbxDFRAGpjmDE/2MeuKih
	 Bsdg6MY3mJV+gNqtBjXMUs93BZXCTBDmK9lb6h2dOpb9WhoW0TAeR3fp+g+6XZmuEU
	 KgO85f/kQmUrQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWJ-1vxW;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 22/33] scripts/kernel-doc.py: Set an output format for --none
Date: Tue,  8 Apr 2025 18:09:25 +0800
Message-ID: <caa1089e16f4609f792ff26731ad9e9c3a6f6b1d.1744106242.git.mchehab+huawei@kernel.org>
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

Now that warnings output is deferred to the output plugin, we
need to have an output style for none as well.

So, use the OutputFormat base class on such cases.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_files.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
index 4c04546a74fe..dd3dbe87520b 100755
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -20,6 +20,7 @@ from datetime import datetime
 from dateutil import tz
 
 from kdoc_parser import KernelDoc
+from kdoc_output import OutputFormat
 
 
 class GlobSourceFiles:
@@ -138,6 +139,9 @@ class KernelFiles():
         if not modulename:
             modulename = "Kernel API"
 
+        if out_style is None:
+            out_style = OutputFormat()
+
         dt = datetime.now()
         if os.environ.get("KBUILD_BUILD_TIMESTAMP", None):
             # use UTC TZ
-- 
2.49.0

