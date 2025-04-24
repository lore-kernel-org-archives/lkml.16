Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF5328F50D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513452; cv=none; b=rHw+KEkURxcvuNFNmCp/5P5DDoXYLKjSS1syx8c8PwN4gXVj+u//TcDNE+tkltij9uoqICGWIzU6gnCxlzmGBtHZ9rX47Pf99rMzNimo20w/Z724ZM2F8QY57iDptifx89d8xLs+ETB/d8Z/byNQxErXN0Bp7tMc6jwZy4N6CFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513452; c=relaxed/simple;
	bh=I8y6Dm7syHuvh9BYvzLeEhnMOxZLHQ+TtWC6xRhAQAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SvKGdM2vnNsN+ooBsiaNa9xGivHIorwUET1S5Uay1QPlY8NjDta92rQ/ULDKm0+yUDaDS5+ggkStEmZyQDv3NFLiQMPhcODEcuRHYIA515+apUjtDHhrKWS6sGGELAWyG7rLcc4bqxzInD+j2cUI2F/4B/NX7bAWhmhJasVXeHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=ltTkvHGY; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="ltTkvHGY"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f8ae3ed8adso887067b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513449; x=1746118249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8oGDdvRnI5EoipFzFv4+4XYwTfEEBtpDViBBf5EBeQ=;
        b=ltTkvHGYm7EuFCtetLc3IG/SGlslP6Opch8Lt6fstZ+p6N1tI1+0D7kXywLqAEp3Tm
         PHfvfgtOqD8CE2gPB6pTwK0f9r9VCB25WxzlGg9xF8YMgaqL+Amdssv/UAdj1lgekNLd
         ZEW/J6C3IZNrC+vwFJFhgwCvlaHyPcvl08uyDf4uHW3wASxAiw6ZWgFrIRo8qc1wnCaK
         1Nw+kCAEHjBUEJY70sYfLiOorm8521OdO6HCyxHAJpesqMijW6/08+eanQg9pxt/7+w6
         EY6clNvoVAGORze3P7wvV7Z1IPlIMHw7cqq7pXAt6J6nzk48tNEc+L4vzut8oFw8Qs9U
         HA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513449; x=1746118249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8oGDdvRnI5EoipFzFv4+4XYwTfEEBtpDViBBf5EBeQ=;
        b=V/dbUEJGZpV8hxv/8hx6ss0PW2mXwa9U75x5jp0ek5/VBs3a/TNfYjnB8F1O/R8Ixo
         yo6VdW5pcMrNN5mIVDLhkTkyhMC/F6/gSJs6CJb0ss+XwqVXTNH3SXGMIZjJvC6WKZXU
         Rqtr+YMbSjNnPC5puHH7PeFwh3pvBakdgkB+JHTTfF/PlaxG0JgSFpeHELBt3JVvw0ou
         DppiH3lXyPVqkWYQKzHlonIaWdiYsjIXK3iTNU103uF+9gLn1o2HTmm1AUHFaOmCm1cN
         5iQd15jeQHv6uHUNy/UTRlRC7Ltmi6m7ktwFeJQkWBR96kBC4IQ9vgV8D7mJZsEoqtBX
         nj/w==
X-Gm-Message-State: AOJu0Yynkr1dzdxS8iPzBTfKGLld5YYbFYvEqR2KI0a2+UgtpAyA0PXe
	2uFfgUCNaGguT1kMmpRdX9FNniygIj37MiQp7IMUc9WDQOUiRH57G0R/4KAP25jHjPWTQARwmq6
	G
X-Gm-Gg: ASbGncveHPsFWOwNeJGro0VMQqJfnprUPysvsVtMyT5g/+1jTM9/GSNIsIpPJiFE5xF
	7Bldg8ypmOeTm89oWlSVaK76+HtEzQCTeAkmcXvz9eXim23kALtjbNjtQAGu/KG/MSt2RoKAd4u
	eb1JSa9z/crhkA86FCRSA+N0Kr1aSCPNVwV2x8tdzdhxJAMIgCcrdUaUQavRWqNsUuMlwEowHKb
	dCdcQSGL6oNC/AgrqfO+GaijmZaqaHyrJLJD7qxylhrKvvLK3ZEn/nHl5EXJ+2r1VG3ROrC0SUN
	STs7UTnm7D+fE/reAzAPtY4zbgYDmtcVctdEKayv7OAnLw==
X-Google-Smtp-Source: AGHT+IFkIgExmDrBdSdQTioadtDd9kVguGf2ruitTrAnAmP6r1qHlEk08+wJKwFS7DjoDJUfJ1+Iwg==
X-Received: by 2002:a05:6808:6c8e:b0:3f3:e01e:f7eb with SMTP id 5614622812f47-401eb27e11cmr2026509b6e.7.1745513449589;
        Thu, 24 Apr 2025 09:50:49 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-401ec8b069fsm314865b6e.5.2025.04.24.09.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:49 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 12/23] ipmi:msghandler: Fix locking around users and interfaces
Date: Thu, 24 Apr 2025 11:49:49 -0500
Message-ID: <20250424165020.627193-13-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424165020.627193-1-corey@minyard.net>
References: <20250424165020.627193-1-corey@minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that SRCU is gone from IPMI, it can no longer be sloppy about
locking.  Use the users mutex now when sending a message, not the big
ipmi_interfaces mutex, because it can result in a recursive lock.  The
users mutex will work because the interface destroy code claims it after
setting the interface in shutdown mode.

Also, due to the same changes, rework the refcounting on users and
interfaces.  Remove the refcount to an interface when the user is
freed, not when it is destroyed.  If the interface is destroyed
while the user still exists, the user will still point to the
interface to test that it is valid if the user tries to do anything
but delete the user.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 51 ++++++++++++++---------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index e7bed764b4bb..d05032dc1f69 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -46,6 +46,7 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf);
 static void need_waiter(struct ipmi_smi *intf);
 static int handle_one_recv_msg(struct ipmi_smi *intf,
 			       struct ipmi_smi_msg *msg);
+static void intf_free(struct kref *ref);
 
 static bool initialized;
 static bool drvregistered;
@@ -196,25 +197,6 @@ struct ipmi_user {
 	atomic_t nr_msgs;
 };
 
-static void free_ipmi_user(struct kref *ref)
-{
-	struct ipmi_user *user = container_of(ref, struct ipmi_user, refcount);
-
-	vfree(user);
-}
-
-static void release_ipmi_user(struct ipmi_user *user)
-{
-	kref_put(&user->refcount, free_ipmi_user);
-}
-
-static struct ipmi_user *acquire_ipmi_user(struct ipmi_user *user)
-{
-	if (!kref_get_unless_zero(&user->refcount))
-		return NULL;
-	return user;
-}
-
 struct cmd_rcvr {
 	struct list_head link;
 
@@ -611,6 +593,28 @@ static int __ipmi_bmc_register(struct ipmi_smi *intf,
 			       bool guid_set, guid_t *guid, int intf_num);
 static int __scan_channels(struct ipmi_smi *intf, struct ipmi_device_id *id);
 
+static void free_ipmi_user(struct kref *ref)
+{
+	struct ipmi_user *user = container_of(ref, struct ipmi_user, refcount);
+	struct module *owner;
+
+	owner = user->intf->owner;
+	kref_put(&user->intf->refcount, intf_free);
+	module_put(owner);
+	vfree(user);
+}
+
+static void release_ipmi_user(struct ipmi_user *user)
+{
+	kref_put(&user->refcount, free_ipmi_user);
+}
+
+static struct ipmi_user *acquire_ipmi_user(struct ipmi_user *user)
+{
+	if (!kref_get_unless_zero(&user->refcount))
+		return NULL;
+	return user;
+}
 
 /*
  * The driver model view of the IPMI messaging driver.
@@ -1330,7 +1334,6 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
 	unsigned long    flags;
 	struct cmd_rcvr  *rcvr;
 	struct cmd_rcvr  *rcvrs = NULL;
-	struct module    *owner;
 
 	if (!refcount_dec_if_one(&user->destroyed))
 		return;
@@ -1382,10 +1385,6 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
 	}
 
 	release_ipmi_user(user);
-
-	owner = intf->owner;
-	kref_put(&intf->refcount, intf_free);
-	module_put(owner);
 }
 
 void ipmi_destroy_user(struct ipmi_user *user)
@@ -2315,7 +2314,7 @@ static int i_ipmi_request(struct ipmi_user     *user,
 		}
 	}
 
-	mutex_lock(&ipmi_interfaces_mutex);
+	mutex_lock(&intf->users_mutex);
 	if (intf->in_shutdown) {
 		rv = -ENODEV;
 		goto out_err;
@@ -2361,7 +2360,7 @@ static int i_ipmi_request(struct ipmi_user     *user,
 
 		smi_send(intf, intf->handlers, smi_msg, priority);
 	}
-	mutex_unlock(&ipmi_interfaces_mutex);
+	mutex_unlock(&intf->users_mutex);
 
 out:
 	if (rv && user)
-- 
2.43.0

