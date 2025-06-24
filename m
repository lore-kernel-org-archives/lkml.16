Received: from mail.postale.io (mail.postale.io [3.139.204.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C3528540E;
	Tue, 24 Jun 2025 10:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.139.204.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760836; cv=none; b=VWh8wtcP2wda6kgQPDWVISStuxOMdwcV9cDWte0Wqx7tAVWQKeT6BpRPVsqU0fJiTUQQcWQ6joHmStTzIncunS/qAYd89o2FEYiFNeoTercHI82RbaljlY02W+9ona/DYNpcTyEizGd/kOwt1782BiUYturIZAIf+InXDmGoQX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760836; c=relaxed/simple;
	bh=O9zlFX91oenyG4CVaS60rfnjqCpK1mYsOXbULDWIf5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oWiHnH7DEHzrVqfahnCpzt4zZG6zCA4YoMwaIDfJn8ly1vvGa5GLBmflkTzhteWUok3WAnOkSaRat9N5jXgBDsDHxv4/dsseMWLktOIRyHF/uuEBM9LVRSlmfcHb+XZbrHnqMdvfkHDvpydPY72kUhRjguQIouuWxJGJvAC2SpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glxys.nl; spf=pass smtp.mailfrom=glxys.nl; dkim=pass (1024-bit key) header.d=glxys.nl header.i=@glxys.nl header.b=j8mEjhpn; arc=none smtp.client-ip=3.139.204.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glxys.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glxys.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=glxys.nl header.i=@glxys.nl header.b="j8mEjhpn"
Authentication-Results: mail.postale.io;
	auth=pass (plain)
From: GalaxySnail <me@glxys.nl>
To: simont@opensource.cirrus.com
Cc: david.rhodes@cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	lkp@intel.com,
	me@glxys.nl,
	oe-kbuild-all@lists.linux.dev,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	rf@opensource.cirrus.com,
	tiwai@suse.com
Subject: [PATCH v3] ALSA: hda: add MODULE_FIRMWARE for cs35l41/cs35l56
Date: Tue, 24 Jun 2025 18:17:17 +0800
Message-ID: <20250624101716.2365302-2-me@glxys.nl>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <002901dbe4ef$57d0cce0$077266a0$@opensource.cirrus.com>
References: <002901dbe4ef$57d0cce0$077266a0$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received: from localhost (Unknown [127.0.0.1])
	by mail.postale.io  with ESMTPSA id 16D3340E-BF98-4835-A7E2-9319636AC841.1
	envelope-from <me@glxys.nl>
	tls TLS_AES_256_GCM_SHA384 (authenticated bits=0);
	Tue, 24 Jun 2025 10:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=glxys.nl; s=s20221125375;
	h=from:subject:date:message-id:to:cc:mime-version;
	bh=O9zlFX91oenyG4CVaS60rfnjqCpK1mYsOXbULDWIf5A=;
	b=j8mEjhpnM+a8LzHzap7NERcwSu9MmiziuKrKLBL/vHOjRN6vxg3Zl9M+WIdYAlCLGuyIxFVcp8
	/swJnL4OC3GLGoZ5P8KfFviP5+v+vuLxrUPg5tgG9jwl3xJQPmo4FMCO+AByQlCjociXJgyDYTSt
	DLTq3qE5MjoNF+llTSpB4=

add firmware information in the .modinfo section, so that userspace
tools can find out firmware required by cs35l41/cs35l56 kernel module

Signed-off-by: GalaxySnail <me@glxys.nl>
---
Thanks for your review!

v2 -> v3: fixed typo
v1 -> v2: fixed missing ';' in the previous patch

 sound/pci/hda/cs35l41_hda.c | 2 ++
 sound/pci/hda/cs35l56_hda.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index d5bc81099d0d..17cdce91fdbf 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -2085,3 +2085,5 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("FW_CS_DSP");
+MODULE_FIRMWARE("cirrus/cs35l41-*.wmfw");
+MODULE_FIRMWARE("cirrus/cs35l41-*.bin");
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 3f2fd32f4ad9..eedd8fdd3b8b 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -1122,3 +1122,7 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
+MODULE_FIRMWARE("cirrus/cs35l54-*.wmfw");
+MODULE_FIRMWARE("cirrus/cs35l54-*.bin");
+MODULE_FIRMWARE("cirrus/cs35l56-*.wmfw");
+MODULE_FIRMWARE("cirrus/cs35l56-*.bin");
-- 
2.50.0

