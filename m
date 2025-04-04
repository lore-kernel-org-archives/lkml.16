Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A83215060
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743788237; cv=none; b=iSnCgizmL+AlDg15XdRXwy8CjrX9jv+Prrjh8JLKaCjFYazA9XidsRXZRp5WcD5xO9dFw1y7gv7dge5bw2FcCwgCP+m7BkZTRjfFxHIfs7psxuSEv5hM9I1uKFWzY04Y7a4gyCDdLmd90WIoI/G2SRRInrF3vC+1/vyb7pf+aYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743788237; c=relaxed/simple;
	bh=GoRU3J53JuwVDzr03wzlvv/wwUkRT4f5ViqSj4Zk0eQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=uW6LbDAI1C+v+zO3fHZiHTiy/UAdBTCrYOLih1SE17xm2wPhZSNaafk7LHkLngQDHl5a0GUWLNtW1RbsDDdD6Nl55MNbmGfJiDin60dJktyPW/8AWtEgfq2tQ9fXZz5NGA8o4phyVx8o/2sHo6eDV8RIKtHKUVKhM+6O2tgkcX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=MJzu/Zgx; arc=none smtp.client-ip=203.205.221.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="MJzu/Zgx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1743787921;
	bh=ljJtJpl1s9Fs/ZYa8Z6r2Z94fOaloOQhxxNaslAU+24=;
	h=From:To:Cc:Subject:Date;
	b=MJzu/ZgxyMTre6eUP8+o5G4Ta8xIRPq2+/lmweS54GmdVWHWevC4zdsbTJb0x59zA
	 eKVx3YflQUGTxQFHs/3vIIPT8EfqXZhIsTCN884EPLelvHzKsRR/6ATboOx1S4GQNy
	 vWHZFZQ0R6U72/T9xXIPmB3q08cIBI1vlJi+R6FI=
Received: from localhost.localdomain ([116.148.99.229])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 7FBB3AFB; Sat, 05 Apr 2025 01:31:59 +0800
X-QQ-mid: xmsmtpt1743787919tyo5aplyn
Message-ID: <tencent_B971903B40AFCF5878B6532261672A5D6A0A@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+GbMQhxsLsX0N1Yfj0yioziLMpWEzHU5EDCagkrr50xUK8y3fzZ
	 4yPrPCdUfctjnqGhpqCeSd+romWWqoR34UH65cwDE+ihCOzll+JDkqdO610xdliDNQPpbL2qb5Sq
	 ttQFvIuoEhrRe7M14DOiquCaacaOUBDjeBblItOVR17VKJUnI61eytcuivsfCCitvvREO0NvT5WX
	 NR0mCbEJNu9QDpXDTX6WoqjGvrt2yeqz9WctMKrbFlhsGRITJwfj4ZrEnss21IhuiX4sCpNCpQf8
	 AxV4eSJib8qYmEuh8VcTmU3PynSfw+/YSWaCba2/0v2GHqJN+BP8tZF78Lz9oLn71VnmkTLehu2o
	 S/UvbJBm6Ho9XFkGXuJnuImky85nVshFVl3VUYUV4vsxONy+WLt3X5mUnKw41yXBK/jYiSrS4Ieq
	 520RR9SCVdRpDSLDEOcFxSo+dAXKTvEFNytESaMIbE1ArpIKGf9LNEzD8vDRVoEl1iwz7KDjCma+
	 ZRGrEU5vg3Zn657dxEFMqBG6VJHI4uZbxd8prly6pTdAteRm3o3iQUhHIE/Gcqr4Fh78/pPW3M9m
	 ruKUMfIwyfaW87yq9pygFkDymG3OnHIfSf/RtG/5XxaYQKm12N8iguv/7NQY59o4jziFNDForV+i
	 Q3J9BsUvHWBJujutsUTp+KSROisBcXxWUEVEuNk/ewx5YcZQcJu+mhDy/0WsTIVqZ09tQUAC+74e
	 ICbkhBrRZhp5SbJMcPtoBrBLq8rmr8o89tfndY/bBRPPszNUHWiCcy35PHzWaTvaSnBRPSqk9h4H
	 aBKoveYpQkz1Nj5s0HEzEazb8gaTn1MDxYbBEVkeNvtM7rP1eyS8LgRweJqqrarx0Y4wfpushA1z
	 EBxO/9vnbAR0OF+5xbhLVqjOuoz3++JWyawP0NJd2fsyiYnRRAS7ipr1hx8kyIf7mY3EgkcHqn5d
	 LlsncRcpvrgv99XShRYOnbG5daK8mUQys3ZCo4XnslpxT3DwHegHnoFW2ojLTM0ZLD6FQoCwVzVI
	 7qF3MgF2p46+MYrDEW7q+JB3ZVpIg=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: zhoumin <teczm@foxmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	zhoumin <teczm@foxmail.com>
Subject: [PATCH] kobject_uevent: add uevent_helper exist check
Date: Sat,  5 Apr 2025 01:31:02 +0800
X-OQ-MSGID: <20250404173102.252678-1-teczm@foxmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel creates uevent_helper process for every uevent sent,
even if the uevent_helper does not exist. Before the rootfs is
mounted, a large number of events are generated. This change
introduces uevent_helper existence check to prevent unnecessary
operations.

Logs a debug messase before call_usermodehelper_setup.
e.g.: pr_emerg("action:%s devpath:%s\n", action_string, devpath);
You will see a large number of uevent_helper processes
are attempted to be created before the rootfs is mounted.

Signed-off-by: zhoumin <teczm@foxmail.com>
---
 lib/kobject_uevent.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index b7f2fa08d9c8..f3d34ded141a 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -28,6 +28,7 @@
 #include <net/sock.h>
 #include <net/netlink.h>
 #include <net/net_namespace.h>
+#include <linux/namei.h>
 
 
 atomic64_t uevent_seqnum;
@@ -58,6 +59,23 @@ static const char *kobject_actions[] = {
 	[KOBJ_UNBIND] =		"unbind",
 };
 
+#ifdef CONFIG_UEVENT_HELPER
+static int uevent_helper_lookup(void)
+{
+	static int ret = -ENOENT;
+	struct path path;
+
+	if (!ret)
+		return ret;
+
+	ret = kern_path(uevent_helper, LOOKUP_FOLLOW, &path);
+	if (!ret)
+		path_put(&path);
+
+	return ret;
+}
+#endif
+
 static int kobject_action_type(const char *buf, size_t count,
 			       enum kobject_action *type,
 			       const char **args)
@@ -610,7 +628,7 @@ int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
 
 #ifdef CONFIG_UEVENT_HELPER
 	/* call uevent_helper, usually only enabled during early boot */
-	if (uevent_helper[0] && !kobj_usermode_filter(kobj)) {
+	if (uevent_helper[0] && !uevent_helper_lookup() && !kobj_usermode_filter(kobj)) {
 		struct subprocess_info *info;
 
 		retval = add_uevent_var(env, "HOME=/");
-- 
2.43.0

