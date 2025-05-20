Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF1CB67A;
	Tue, 20 May 2025 00:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747702236; cv=none; b=t8KvOYldSV0zRPN6Oduvw64gOpEqPnpZG7kDUC95RpzzgwXkzv9vxBWHlO9LVo9hlmxBOp009Vuxj03tOgOUBoB3lRu+4MXwM8+2U05ZezruLJ6cWVRVYu8XYs5i0N90yimfgSFFbNSUO0e6+fUWchjabpUyDqcEpORn3MJ1K1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747702236; c=relaxed/simple;
	bh=OP9H2joOrNS/Hdg17j97kjK06LN8zzs/0F6DTB6Do4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIC7wVwcPzQhjLn7Sb7nMnKaxEjUBWMzYthFpg6kkHuQnSmb0qM236sqVUrKKVXnco65FotM7K3QGsDpYADncw8AOtxCrFYTspaj3XYxT6Y1xh8tl8F/vGi6G86WIFg26Q+/PMM2U45y0U6H6CeJPtv04hxN82hA3/JAbB/Xhbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Ppe3EBB4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P1IuLnDQ; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Ppe3EBB4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P1IuLnDQ"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C2057114010C;
	Mon, 19 May 2025 20:50:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 19 May 2025 20:50:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1747702230; x=
	1747788630; bh=UKZodHiwEus1e7bjwlXRAPs9FOZDkCnD2oY0olQNycQ=; b=P
	pe3EBB4apTLgZ19M9CMaREhowvbawI/3+3iPMKN6uzfiXvkPoWcfUJ1StciC2TOL
	z3UVz+UCXQ8RPGclqROVvCN2pGS4kHy9ZDjyFgvKHf5luC4EptXR/T1RBAsDGDAx
	jdHyBr+oJYNnI0woJOoUV2vN/JmQ0uE0bpMVNwM4J0JjIo7S7bU8Yne9WdJAo5h+
	Ld90XElzO8GJdmXaxgwTmYEfqFkkMghdiBL8KLhzrqz9Hx2gFxUruwstrUpL2kjZ
	NRYMcINL3aVb2bmNUFpItmdGLEC7pgs0LBk8zuXTi4gv2LntmCQ76pf4MbAlrFlk
	3qeI9AOX3MDoS5C5dT5Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1747702230; x=1747788630; bh=U
	KZodHiwEus1e7bjwlXRAPs9FOZDkCnD2oY0olQNycQ=; b=P1IuLnDQUjOtKHwl1
	vXYGSBta9QM5qPPiv3SZObZQXky2EV1YoXNKBGcDeHYokekSJOJWGc5YxtE2VlEY
	qoaD2kjFv99GIvPU97jL6WgZW1LhE/b+LgDD1kejpLi/rpijAbrx5O+RMJAPtreu
	kxD8xEUxe1yefM8lqoCYNWhEEm01wxHCD+4Dzh2A0WttKu2xywmc+N0VYVBsFmlY
	N5jWlt8wCRvOUDtP9faotJJpTw8jiqDr4QQ4Aw0A6mDXCahd3RX0E+HA9twnIb3n
	MdpY2z5+Url51sLQy03ZcIsUxf87ddnWvtbE86PTO1daAer6asaQHVti0l6Jktft
	wx7jg==
X-ME-Sender: <xms:1tEraKBretMAanTuixq1IqkAvluwf-s6q-ppINpjSxytxdg1iv66vw>
    <xme:1tEraEivR0ekrlQa5cqFLblNlliESRLqp9X9L_A_IG5S8iaT_i95Q-dgFQZoqUQ_i
    vgOSndXSPR8UkBD8IM>
X-ME-Received: <xmr:1tEraNmpwL4We25OcIHe9jv4u8lMErY8aV-UX_XGb166aGVWfWo188t6SiQxj9v6OEOLGwQrRX8iy1TROw1yvfDi8V_Ti66yZ5hObZ1WCAbYsF8Ffg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddvkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucgoteeftdduqddtud
    culdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhho
    mhepofgrrhhkucfrvggrrhhsohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquh
    gvsggsrdgtrgeqnecuggftrfgrthhtvghrnhepfedtvdejfeelffevhffgjeejheduteet
    ieeguefgkefhhfegjeduueethefgvdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggs
    rdgtrgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdprhgtphhtthhopehh
    uggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvh
    hinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehplhgrthhfohhr
    mhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1tEraIyzkFfRW2K15dNRDF5yuLvkA1SfBn48ZAlHnevw8Fy_1voU7Q>
    <xmx:1tEraPT-P3MjLDo2dVym_Mp8AVZ1GJlFzy-r-8sIsrFt5GizGp81xw>
    <xmx:1tEraDZiJbN1-vhKBom7zNa3bb-0W-xqRRAAKS6SKH6Bx8Xw-SlTRQ>
    <xmx:1tEraITmjK33oPkPOat0PY1ysrpiDojU5Sc013JubgC8zz6U_KUR-w>
    <xmx:1tEraG-sS5VgyhLOdc6SqJV38iB3ZqfAEDwVtOow9YfvribeuRgKgzyz>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 May 2025 20:50:29 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: think-lmi: Fix attribute name usage for non-compliant items
Date: Mon, 19 May 2025 20:50:18 -0400
Message-ID: <20250520005027.3840705-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few, quite rare, WMI attributes have names that are not compatible with
filenames, e.g. "Intel VT for Directed I/O (VT-d)".
For these cases the '/' gets replaced with '\' for display, but doesn't
get switched again when doing the WMI access.

Fix this by keeping the original attribute name and using that for sending
commands to the BIOS

Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v2:
 - Remove extra line added erroneously.
 - Add fixes tag.
 - Grammar tweak in commit message

 drivers/platform/x86/think-lmi.c | 26 ++++++++++++++------------
 drivers/platform/x86/think-lmi.h |  1 +
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 0fc275e461be..00b1e7c79a3d 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -1061,8 +1061,8 @@ static ssize_t current_value_store(struct kobject *kobj,
 			ret = -EINVAL;
 			goto out;
 		}
-		set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_name,
-					new_setting, tlmi_priv.pwd_admin->signature);
+		set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->name,
+				    new_setting, tlmi_priv.pwd_admin->signature);
 		if (!set_str) {
 			ret = -ENOMEM;
 			goto out;
@@ -1092,7 +1092,7 @@ static ssize_t current_value_store(struct kobject *kobj,
 				goto out;
 		}
 
-		set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
+		set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->name,
 				    new_setting);
 		if (!set_str) {
 			ret = -ENOMEM;
@@ -1120,11 +1120,11 @@ static ssize_t current_value_store(struct kobject *kobj,
 		}
 
 		if (auth_str)
-			set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_name,
-					new_setting, auth_str);
+			set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->name,
+					    new_setting, auth_str);
 		else
-			set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
-					new_setting);
+			set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->name,
+					    new_setting);
 		if (!set_str) {
 			ret = -ENOMEM;
 			goto out;
@@ -1629,9 +1629,6 @@ static int tlmi_analyze(struct wmi_device *wdev)
 			continue;
 		}
 
-		/* It is not allowed to have '/' for file name. Convert it into '\'. */
-		strreplace(item, '/', '\\');
-
 		/* Remove the value part */
 		strreplace(item, ',', '\0');
 
@@ -1644,11 +1641,16 @@ static int tlmi_analyze(struct wmi_device *wdev)
 		}
 		setting->wdev = wdev;
 		setting->index = i;
+
+		strscpy(setting->name, item);
+		/* It is not allowed to have '/' for file name. Convert it into '\'. */
+		strreplace(item, '/', '\\');
 		strscpy(setting->display_name, item);
+
 		/* If BIOS selections supported, load those */
 		if (tlmi_priv.can_get_bios_selections) {
-			ret = tlmi_get_bios_selections(setting->display_name,
-					&setting->possible_values);
+			ret = tlmi_get_bios_selections(setting->name,
+						       &setting->possible_values);
 			if (ret || !setting->possible_values)
 				pr_info("Error retrieving possible values for %d : %s\n",
 						i, setting->display_name);
diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
index a80452482227..9b014644d316 100644
--- a/drivers/platform/x86/think-lmi.h
+++ b/drivers/platform/x86/think-lmi.h
@@ -90,6 +90,7 @@ struct tlmi_attr_setting {
 	struct kobject kobj;
 	struct wmi_device *wdev;
 	int index;
+	char name[TLMI_SETTINGS_MAXLEN];
 	char display_name[TLMI_SETTINGS_MAXLEN];
 	char *possible_values;
 };
-- 
2.43.0

