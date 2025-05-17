Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6625920B22;
	Sat, 17 May 2025 02:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747449512; cv=none; b=f0bn9Qm860bJyueObnm9y5cuvQCKH4C3zz3N3LApmjU7UIxgcF+zwP1mq4E1htvxMSVI8923zxxvCUj/IZqIXxKz45N9oawrETX9+pGezZRbHUc66hIZse/kddzwBi2yGVMuNwL4Yhb0eAbL2WAigo5St1qX8UgaOITh/ZTYbBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747449512; c=relaxed/simple;
	bh=XVLikuOHBgniuAIgben3g2xSnI+M3D+gzJRALg3wDcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVBKWLBn5cDjSumOEo3zrKaWAznQ9zdupZFe9Et9EcZrUi7J7acotXdFCkFeOdne+e8T2/lGW5/ioEfhXs5A8gwxTXZgjHW3oHPxM9kh0UhOeGL5TC6Z8hKIAk/oPHITkFOPKjXcS/TKIJ+d0aBZyeY8T61a3zjE3qz1Pqj03Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=DvyEEEQf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DLaeuIER; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="DvyEEEQf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DLaeuIER"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 7577D13803E6;
	Fri, 16 May 2025 22:38:28 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 16 May 2025 22:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1747449508; x=
	1747535908; bh=AgEyzZZD4TQsrQKkkfCOwgsJO/M29EFDy74V/hED+yM=; b=D
	vyEEEQfMj8urieiBDkzSVts/vmbEadsOjMB8z7bhPkfpPcs9ZT5/rYSujkzWUPNX
	J2EExmjVRWUWkcviV3cShk8SgpeW4JqqTZv3LAtqdHbvBlkEvwpQ73PC6RrVZXZg
	zF7w1QjZhmHs+R20z4b3THqXLATTui4JIVodGfOS5S8+lYV7FLKHBVMiORDxY+Dd
	s7XmcnM8IkSCYIDCM1CQKH46NiP5S/MY0/oum+XTUmiOxJT2KXs13CdZHKhy8D5o
	PltCnv8Z0lExn7G1E9rcRH8gnfz3rePo5CgMijYtnd/+TH03SBJLvde2++BTR2Fr
	/2wxD3doX7viYliQa3MrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1747449508; x=1747535908; bh=A
	gEyzZZD4TQsrQKkkfCOwgsJO/M29EFDy74V/hED+yM=; b=DLaeuIERk2/9xTq+O
	h/L6UJhqSlflMmdmkJNTcnftOc45jbdM0DhTe63yd4+trtQfuPiXvo5PfNtijx2K
	EB0jYfA9w+N3RV0ifR5hCXtDNlzywThC0xzotX3wrnxblr9wqmqPH1OSC8l4qlyi
	gEgTzzlwUCjdn6Ys397FLhBZAGkritwOYIad+hS3yhz3oZGew64hvVLEo23aOTTn
	+9ggzqjEONRhGJt8kwNkPUhZivy2Li2XiFZm4Q1buK0MJFewJv1xHyIL/RRfUasg
	Q5lHsYN/VcoXTAw+wS6bfavUxTbEhE2DVidOYTXu8V+xm/5ns7AUHcurHXvRqbyh
	1CbXg==
X-ME-Sender: <xms:pPYnaDgSE55UH113MzQSeQ--_POqqyGu09dKJUVBHl6C4ltiZiTQwg>
    <xme:pPYnaAAuExSP5NYx43RrCGx-NO4RWKNJ9lDoSKbQjhyrz3NnR8Pn1ijq6VF9q927n
    b4UMTuLgxIxZBXsGpc>
X-ME-Received: <xmr:pPYnaDHu3iZGiRlHR6rHFAOS6BkeicEI2JlSh3Sg49UEiJchFutCmUu3I0HmcP9ozQic4dEn9wNXv-n2OLazb5N9Copp73Ppr2hRkQsdfaLFoB7cog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeggeegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:pPYnaATd-i6x-ZZLITI-l_NK-aYOtLzj1n5kh0u58lGyWF-1ZTrsEA>
    <xmx:pPYnaAx3VddLUxJjfLJBbTOLlWEZfJ7I02o_6pU7glpBofMZoX4nHQ>
    <xmx:pPYnaG4UTyDqP4pNgvQ7---VxXjKlSBIjSbxowy2EZhPnfYPIohKPg>
    <xmx:pPYnaFwYDHqJV5Hj39Bpgb_yEr0A-nrGTOy2rJE5NInnIKjqolKxdQ>
    <xmx:pPYnaKfYmvj5EnWaooeBTBc39A8qa_vY7StETnZPWeP9J7GS3vkxpKwn>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 May 2025 22:38:27 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: think-lmi: Fix attribute name usage for non-compliant items
Date: Fri, 16 May 2025 22:38:16 -0400
Message-ID: <20250517023825.2968200-1-mpearson-lenovo@squebb.ca>
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
filenames. e.g. "Intel VT for Directed I/O (VT-d)".
For these cases the '/' gets replaced with '\' for display, but doesn't
get switched again when doing the WMI access.

Fix this by keeping the original attribute name and using that for sending
commands to the BIOS

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/think-lmi.c | 27 +++++++++++++++------------
 drivers/platform/x86/think-lmi.h |  1 +
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 0fc275e461be..be01085055a1 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -137,6 +137,7 @@ MODULE_PARM_DESC(debug_support, "Enable debug command support");
  * You must reboot the computer before the changes will take effect.
  */
 #define LENOVO_CLEAR_BIOS_CERT_GUID  "B2BC39A7-78DD-4D71-B059-A510DEC44890"
+
 /*
  * Name: CertToPassword
  * Description: Switch from certificate to password authentication.
@@ -1061,8 +1062,8 @@ static ssize_t current_value_store(struct kobject *kobj,
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
@@ -1092,7 +1093,7 @@ static ssize_t current_value_store(struct kobject *kobj,
 				goto out;
 		}
 
-		set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
+		set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->name,
 				    new_setting);
 		if (!set_str) {
 			ret = -ENOMEM;
@@ -1120,11 +1121,11 @@ static ssize_t current_value_store(struct kobject *kobj,
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
@@ -1629,9 +1630,6 @@ static int tlmi_analyze(struct wmi_device *wdev)
 			continue;
 		}
 
-		/* It is not allowed to have '/' for file name. Convert it into '\'. */
-		strreplace(item, '/', '\\');
-
 		/* Remove the value part */
 		strreplace(item, ',', '\0');
 
@@ -1644,11 +1642,16 @@ static int tlmi_analyze(struct wmi_device *wdev)
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

