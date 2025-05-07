Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678328C2B3;
	Wed,  7 May 2025 19:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746644715; cv=none; b=REFhWlFlFia1dw3kr9FFpgxKnQEfRnOpweuSOnWnAaOtQqzxl2ulTNul+wQjtZZaxi5yjcQhkuWRrtavjcWfXXPD47OUaebtlPETWVw847dCfUlbr+4mMM1pCzUbYaNcPw/QyKYfs+3stBcyqC+8sdi8auUyypJX6LCHfrev0lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746644715; c=relaxed/simple;
	bh=tGf22uvqp6ljOu2Ir9+zGkRohUqqKIu4eR/TQZCOymE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTWuc7P0WrraHvDFws/pzl/oWVdi1MqaZM7HUaqRkOJ7pLnwPu0G/3c7E2u+NQXD+mCyAIPBuLnV2dReBB8XXf7dG9qB4Ef6GwszHLatwNYVkios3x4mnN9Yo7ijnY8FDyM04flG0TnCUkJ3/pbh1EiIGR4pCazW5s4bytC+R0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=rEoZTyaA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NBfcRxKV; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="rEoZTyaA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NBfcRxKV"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6F5FC2540145;
	Wed,  7 May 2025 15:05:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 07 May 2025 15:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1746644711; x=
	1746731111; bh=miF3+daArrTuj3CSFXguEC8BCvV5j/gzZMv3X2O2gSo=; b=r
	EoZTyaAG5g9g0N8QP4X7Lxj4sMczAEsl5LK5mSGEkqJXj++lGB+70eRJlAMR4AJZ
	Anb80apWUypeVz08rzEZBdi7siyjHIaD7KIuu8NELh7X8FBQGLe9TZGleXYDC4e2
	H1npFsVGzT4/q+lkQ3VcxfvFfxM4nAa5TijjaqpqnSPrp9OiK5oQOyv+ZvrQ9h1X
	qbQuiaaqBySCF7EQ/GosSnah5oFQHAVtw+sp7KP616Zw5rlHojgKIFYjK7qY92Qi
	Xmo7PLOjd/wFy2upZ4/VRsMAMV3LbT6KweiUOOWeFQBh3/pK88MNuEG+Ma3tXnqj
	wDMoSw4U61rtpkSF9z34g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1746644711; x=1746731111; bh=m
	iF3+daArrTuj3CSFXguEC8BCvV5j/gzZMv3X2O2gSo=; b=NBfcRxKVCAZ4IRCq0
	BP3uqt6XF1mTBasavpK6waX2NE2QKQ0WUBJ6e6YSZW7I1bt35BpZAHFOHfNJfapY
	KBs4HvqrAxR9t9kzPXUOslJ6yTmIFBrq+ZHYxaSvr8wE4pzsCptefXkpRyGc/OQF
	E3w2kgXoIIsga774pq+xvt626dj7OiVyunkxWQrYfv1uBftOLOtD7Jf2Gw4A5PZD
	8YURdCjlY76VQFvLG7ILt6Wbx4Zps4+CxZLvjKAzh97AJ3NypUnnOlKlDrCrziW/
	ehYZtrS+J0TTWiL9+iuEJhSczsEo9Mu3shcBHuLVW7E0TWPFIGdxxCH8njSmXMZc
	iCfKQ==
X-ME-Sender: <xms:564baO9cXRsKgWL88ATIBMpz63y5_0FiK5u80HH50XskxQQAZQ7Rjw>
    <xme:564baOtnib5nZsBkdK_d3c3-i-UqEQkpWTAzUz87jydQGZB5QCjCV0j_q7YAE_-S5
    PSVEZ7bSDFW0sKie4k>
X-ME-Received: <xmr:564baEC54iEAu5suGkMYfiKym08J9JzIoLe9hWPPJMu-_CgddQmr1ppTqhyiESsl27F8m08g53awjjxZYaJm8bwm_fxTJyXGCZAX54E6qPOjrdgGQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucgoteeftdduqddtud
    culdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhho
    mhepofgrrhhkucfrvggrrhhsohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquh
    gvsggsrdgtrgeqnecuggftrfgrthhtvghrnhepfedtvdejfeelffevhffgjeejheduteet
    ieeguefgkefhhfegjeduueethefgvdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggs
    rdgtrgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdprhgtphhtthhopehh
    uggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvh
    hinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehikhgvphgrnhhh
    tgesghhmrghilhdrtghomhdprhgtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprh
    gtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghl
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehisghmqdgrtghpihdquggvvhgvlh
    eslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvth
X-ME-Proxy: <xmx:564baGfM26v3VGdV5DtHMRY_lX2VN2TICP5_m3KWjHlnk5ojYnERhQ>
    <xmx:564baDNWcqMmCUPnmZG1JSGM1HJGGEVhKhaLJDnLrYjQaeRDjIiPxA>
    <xmx:564baAkiC4O8907VSsvQuYRfKnN_Hu6WzPECR6rFZcARipQ03p0VOg>
    <xmx:564baFslO23bv4OBr7TYARf-8HPtVno7aIX09wLBnVGZo4DfjAsaow>
    <xmx:564baDidLfvG1hNa2nTaix-moD3KMn_pP9gYnF6H8m_70HWaKvv3GiQ8>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 15:05:10 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	ikepanhc@gmail.com,
	W_Armin@gmx.de,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net
Subject: [PATCH 2/2] platform/x86: export thinkpad_acpi handles
Date: Wed,  7 May 2025 15:04:35 -0400
Message-ID: <20250507190456.3004367-2-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507190456.3004367-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add API to be able to get the thinkpad_acpi various handles.

Will use this to start pulling some of the thinkpad_acpi functionality
into separate modules in the future.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 18 ++++++++++++++++++
 include/linux/thinkpad_acpi.h               | 17 +++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 include/linux/thinkpad_acpi.h

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 7dd4abf47f61..0eb33b4c99cf 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -67,6 +67,7 @@
 #include <linux/string.h>
 #include <linux/string_helpers.h>
 #include <linux/sysfs.h>
+#include <linux/thinkpad_acpi.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
 #include <linux/units.h>
@@ -606,6 +607,23 @@ TPACPI_HANDLE(hkey, ec, "\\_SB.HKEY",	/* 600e/x, 770e, 770x */
  * ACPI helpers
  */
 
+int tp_acpi_get_handle(enum tp_acpi_handle_id handle_id, acpi_handle *handle)
+{
+	switch (handle_id) {
+	case TP_ROOT_HANDLE:
+		*handle = root_handle;
+		return 0;
+	case TP_EC_HANDLE:
+		*handle = ec_handle;
+		return 0;
+	case TP_HKEY_HANDLE:
+		*handle = hkey_handle;
+		return 0;
+	}
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(tp_acpi_get_handle);
+
 static int acpi_evalf(acpi_handle handle,
 		      int *res, char *method, char *fmt, ...)
 {
diff --git a/include/linux/thinkpad_acpi.h b/include/linux/thinkpad_acpi.h
new file mode 100644
index 000000000000..eb5273464658
--- /dev/null
+++ b/include/linux/thinkpad_acpi.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Thinkpad ACPI driver API
+ */
+
+#ifndef _TP_ACPI_H_
+#define _TP_ACPI_H_
+
+enum tp_acpi_handle_id {
+	TP_ROOT_HANDLE,
+	TP_EC_HANDLE,
+	TP_HKEY_HANDLE,
+};
+
+int tp_acpi_get_handle(enum tp_acpi_handle_id handle_id, acpi_handle *handle);
+
+#endif /* _TP_ACPI_H */
-- 
2.43.0

