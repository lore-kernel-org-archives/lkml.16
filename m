Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347151DEFFC;
	Tue, 11 Feb 2025 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739257285; cv=none; b=oz5eEKDxOEm+KgBVO9LsEdMKPdlu+5ptFATx2oMUWOSPdh1WUJZAsslEQT1lWZK/skJLzNOZY9FN3HZnQWzLVS3MmfrQZPukmyg5fyzKQL5S298mloy3qTBFXOOu5PrvDvRneu1gBPmfOIorFFrwk2U3Syl4X2NMl/6B3shQpCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739257285; c=relaxed/simple;
	bh=Bf+Ggk8s+xK2k5MzAXCalrt+2SfIZ618nd+Uv3woYI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MkrmUDlJVY+k2QLExyaYN03iRjJGiGDKyNX0kLr30xVnhHabpg9kHNf3AQIJOCO2lxACLJAgb90oIarTdropQ+cqgYSk3S59ViTlQdc/84ecsEBcWiP2VxvUwXY53lc9/sa7sNM1Y8B4nefwa+aZDeuIYRUyFgM/PWU+t3qyoOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHq6IM2s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHq6IM2s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9694CC4CEDD;
	Tue, 11 Feb 2025 07:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739257284;
	bh=Bf+Ggk8s+xK2k5MzAXCalrt+2SfIZ618nd+Uv3woYI4=;
	h=From:To:Cc:Subject:Date:From;
	b=qHq6IM2sMEYUrGjEvaYZrsbhTSlCyCXkfwY0y5a34Vh6x22lsC5A8M0KxFsXWFl4D
	 HqQdKXtA7jAlZE13SkkVxYHRdhGXE6/IApK6IO5ppgtFBG7YImZ4R2pT3vjmYyT6Yt
	 G4iiA7vrsN5mYhrdSVyEdP9lqtEIt43X9NOCljD63NbcNQUow8n2gKcRk5Cbe5II4M
	 M2w6zC8WiFJVaq3OXvtEEr1puwy88x/uzi7Uoeg0QEdDWV/yOYz62MXnZ6nTfNmfK+
	 IryFhHTMpfKguc6OzFR4mRa34XJ/VLX9kWw1sTmLBBwq3FZ23TyIBomnsDCwwLuxl6
	 UY3eCIhxPMQHg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thkGo-00000008ZWj-2np2;
	Tue, 11 Feb 2025 08:01:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Ian Abbott <abbotti@mev.co.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] comedi: convert_csv_to_c.py: use r-string for a regex expression
Date: Tue, 11 Feb 2025 08:01:19 +0100
Message-ID: <2a7a069c0954dff72270da256843130c09e1f391.1739257278.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Modern Python versions complain about usage of "\" inside normal
strings, as they should use r-string notation.

Change the annotations there to avoid such warnings:

	drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py:47: SyntaxWarning: invalid escape sequence '\('

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py b/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
index 90378fb50580..d19101fc2a94 100755
--- a/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
+++ b/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
@@ -44,7 +44,7 @@ def routedict_to_structinit_single(name, D, return_name=False):
 
     lines.append('\t\t[B({})] = {{'.format(D0_sig))
     for D1_sig, value in D1:
-      if not re.match('[VIU]\([^)]*\)', value):
+      if not re.match(r'[VIU]\([^)]*\)', value):
         sys.stderr.write('Invalid register format: {}\n'.format(repr(value)))
         sys.stderr.write(
           'Register values should be formatted with V(),I(),or U()\n')
-- 
2.48.1

