Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D27423AE83;
	Tue, 10 Jun 2025 19:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583722; cv=none; b=QfLS3igE8KmjMru1RlvA2o/ULbEeaob1VdwxOYTtqRc2dJiiZMSxYgoT3n3mdgBQsC8ec9UiJXxmG0V6doYK9ayTcuMEkHDYCu2Koh5J9SugJQvqTgsaXrDvdBXIIBzHQY/jWEQ6kOfxAOP3g8sC6jafsWiKt7tad+lVUFonxrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583722; c=relaxed/simple;
	bh=XwlS22OvjxQGChjQoHKIHNOxFW1CO7FSvjHuvA8OnVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4gQZEkJ94R5P6BBQzYE3aMZseDp72ctB9ge3457Ih9/1z5qkUmWLa4cXh4Wr2Uh06fn79oJBID9eJJ3Z+kn/xy2o0rG473NVksdEQFfcVt/KFWYNOA+ZSwPEUX+UZ6Tpei2BqAditu3N3kb6FzrlDODnSLqC626xJISpFSkWOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=qL+D7tYc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dVGzBQqS; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="qL+D7tYc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dVGzBQqS"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 3BE8F11400EA;
	Tue, 10 Jun 2025 15:28:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 10 Jun 2025 15:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1749583718; x=
	1749670118; bh=sgPJbsLxBu0TMu9PG5pgy2qt41CUvg+KpMXqP7UQJcw=; b=q
	L+D7tYcVxXDqlnYCq6hILUn8eRPFAiIPhZt5cKpy8TU85FG0bMzo13oflSrZNhg4
	u+SEuOcq5UJz2izcQ0YQD3ksgPRMCVCr3HP3cg/ui4yLAeWi7fYXz2ypvYsEv5R+
	RNukDngxkXf7J9F5zSyerkUAWcHI7TPqizUqxeQ59Q0XY0feEdipVodB40rr644b
	j++AVSKmNYk8md9PmoIgp3NyfIcO3zGenAZs6RBdl/kcx9f7Sv0BgR1+DoAW79SB
	cUUzSWR3SzPYVRq8bkSv6YC081Ldd+GsA3VVKFBG65jRfVadfMcoZ2wb8l0+D10D
	xkUZlbMlB0UAO3bZvL5Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1749583718; x=1749670118; bh=s
	gPJbsLxBu0TMu9PG5pgy2qt41CUvg+KpMXqP7UQJcw=; b=dVGzBQqSxZ8/MSESH
	qYcWRC/vYTaNDnYakgtyuosUa57QdH66IqwKzNPLAZrpki33htBKI/qQ9D57TvQU
	fVSP5BXoF32JI6ZUrr2ohtz8ng+giyjZ3a5V+DJKROo4J5i58dGLo3nDej2qlmVO
	2sX6IoaqNI+TLOHViVdxKPi7MJPbO8ZKqyV+/h3SpKnBcYkYAuP54aYN65dneBwY
	SIVpUKCbAQemzX1+6ycRADpyp5WZEEQf6nyxI+nCPJCyOP1KQh2V37nYWNGgezQH
	DylVMjTqeP92OFZMzEr/btRd6wIkFxY+c/90wVPLkPpNZvrVJK/y+73f5OFLn4bd
	iciRA==
X-ME-Sender: <xms:ZIdIaLiPEo7AyHEmHg3vrTSwWYsJT-lFATZPXQMeSebGXV1PGKAO8w>
    <xme:ZIdIaICdnIADhcKYr2bwZjvnYIOnu1KNlEBjBzeTbGVBT9pqCuXu1lVwZ4_0prqhO
    498_GhrUWIyroVCWto>
X-ME-Received: <xmr:ZIdIaLFnkKHzNPoNWKtWRGw-5HEtjfgvj24qh8VbhDBNYzUedGCQCacWI04oSDgjvi8-Pr19b6ild3eB4iQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecuogetfedtuddqtdduuc
    dludehmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhm
    peforghrkhcurfgvrghrshhonhcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvg
    gssgdrtggrqeenucggtffrrghtthgvrhhnpeevtdelgfeggfejtedtvdfgkefhuefguedt
    keeffeduueduvdeiuedtleejvdfhvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggr
    rhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepuddupd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehmphgvrghrshhonhdqlhgvnhhovhho
    sehsqhhuvggssgdrtggrpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinh
    hugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrght
    rdgtohhmpdhrtghpthhtohepihhkvghprghnhhgtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohephhhmhheshhhmhhdrvghnghdrsghrpdhrtghpthhtohepfigprghrmhhinhesghhm
    gidruggvpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugi
    drihhnthgvlhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdig
    keeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihgsmhdqrggtphhiqd
    guvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvght
X-ME-Proxy: <xmx:ZIdIaISYtOHQZTm3m8xdHY84DUubazkFAjG1Yy70x4y2DLqn3iwYxQ>
    <xmx:ZYdIaIxM36gIGrqB87ht-vzc1Ap3Iw9AoafDUtvIfIaubsTGZa60Ug>
    <xmx:ZYdIaO77z_8TRZfDP6TCi_t1X_6avYNUCBc86VHXkKZ5RtWiX--P2Q>
    <xmx:ZYdIaNyp691fMo7sYadnkuOzCz6aSuIQ9SaO407yDeZ16S_yf1mrIA>
    <xmx:ZodIaNtPIYq4-lL-vQO3oFj2oVpCm9EIkndLUvX-nmGWOnBi03gXZejy>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jun 2025 15:28:36 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	ikepanhc@gmail.com,
	hmh@hmh.eng.br,
	W_Armin@gmx.de,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v4 1/2] platform/x86: thinklmi: improved DMI handling
Date: Tue, 10 Jun 2025 15:28:24 -0400
Message-ID: <20250610192830.1731454-1-mpearson-lenovo@squebb.ca>
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

Fix issues reported by kernel test robot.
 - Require DMI for think-lmi.
 - Check return from getting serial string

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506062319.F0IpDxF6-lkp@intel.com/
Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v4:
 - Return -ENODEV instead of -EINVAL
 - Make patch first in series
 - Clean up commit message (empty line)
Changes in v3:
 - New patch added to series.

 drivers/platform/x86/Kconfig     | 1 +
 drivers/platform/x86/think-lmi.c | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index e5cbd58a99f3..9f39547d98f6 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -659,6 +659,7 @@ config THINKPAD_ACPI_HOTKEY_POLL
 config THINKPAD_LMI
 	tristate "Lenovo WMI-based systems management driver"
 	depends on ACPI_WMI
+	depends on DMI
 	select FW_ATTR_CLASS
 	help
 	  This driver allows changing BIOS settings on Lenovo machines whose
diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 00b1e7c79a3d..02ede1ec99e9 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -772,6 +772,7 @@ static ssize_t certificate_store(struct kobject *kobj,
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	enum cert_install_mode install_mode = TLMI_CERT_INSTALL;
 	char *auth_str, *new_cert;
+	const char *serial;
 	char *signature;
 	char *guid;
 	int ret;
@@ -789,9 +790,10 @@ static ssize_t certificate_store(struct kobject *kobj,
 			return -EACCES;
 
 		/* Format: 'serial#, signature' */
-		auth_str = cert_command(setting,
-					dmi_get_system_info(DMI_PRODUCT_SERIAL),
-					setting->signature);
+		serial = dmi_get_system_info(DMI_PRODUCT_SERIAL);
+		if (!serial)
+			return -ENODEV;
+		auth_str = cert_command(setting, serial, setting->signature);
 		if (!auth_str)
 			return -ENOMEM;
 
-- 
2.43.0

