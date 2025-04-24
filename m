Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1946D28E5E1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513448; cv=none; b=MfbEiDTrBnV+L90qI5lX5SwiQI7TdGlsw/cLuiXKJ+FkpLyQ6/92VbHNI8JAttEUyE+ShfEXKa9K45VcAIHgfMimVBBLEgcBUo7Z8LFI9INJP7TLVqUA6B4liAfLbtJNBWMuhKm2oFAtU6sdh1CnogWRF+PggwAluAkQpNr7URc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513448; c=relaxed/simple;
	bh=P8Og3yDaHtBMAvU7xzL0ojvaWgPHw3G/Imui6NRoVls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifIyjI0VVcmBujdVAsl+NuqLOmYa8jh8jjKR5II5e+GYaqXLIg38cWBAMiY7Zmv7lZHbIncOqEvs3N7SoGPknKjq+kZVUQryfEG8CF7kHsecWSBCUfzBM/owsNgzr+mHJnaPJJliBtSVGlkBxr/Dni0FDFPCPcMP6s6sVsG1wuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=KzyHH4c4; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="KzyHH4c4"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2c77a5747e0so638156fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513443; x=1746118243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+VtVBPln1Y837qXh0eU3XxWMEbeRih+vkZIm1udch0=;
        b=KzyHH4c4NUL4Cd7t1DaeRxJTquAxXfuNtwqjmDP+axc/bqkaXIQ+FN0y0zSuxIKgDC
         j5WETHRZeBUMMHu1oNcY5Txau5VWgq4Ss0TNBqIgyOtNe9LjHTlBtXsZzebFV+TcEJzp
         ihXl3oKCf9Y+6ZUpBrLRi7xzuaGwJpLzeAOhWO132Q+XX37SP9+A2QfUw1uACSzy83E3
         QI+PfqjasIMnQhn/nr+sT1Umvk8YjFaQ0DFE3hELrrzd9GRawwlmx/LL+3C0H0zYZTW9
         6Ddy5J793jofwNlWJFvAcmYKqIq2I1JMQ9plFmLAfO3Gx5H5Xw+p9Sf2j/wTebRMTOc6
         0DaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513443; x=1746118243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+VtVBPln1Y837qXh0eU3XxWMEbeRih+vkZIm1udch0=;
        b=mnj8qhmGL3+09n6FSls4jcFXTTLfkc8eqYFp7VvYrF+TEi9iK4HBPTk75VVqkLDqMi
         IkkjRyPFYb4ZyXiRqsi07HHqJSiq1oUI/vC4FeY6DfyhxV7q1BwWj3xU6SMt/5PbuXYz
         zmHMG5MTAUKgZUii7xLYl2KK04Px42hyL7L2qwSHVKFSSKdR9bmKeFnnhqcpsQCYqcac
         W/XNcdodmMMoplcE/+gc4z7+CGu3PM21KRUHnWpVjPxOBO7tLjpLzsO3UcMXpxh6oE5r
         8dxHd5hLc3Q+UPSGjMUpth5pRl1EWVPfRz3dmBpRfEy9hsUqZVfqQAM6BXpyDofU1Z84
         xKQw==
X-Gm-Message-State: AOJu0Yxh9Ibuz+ad0aesKGBf237Y8jT1BqqEQbRKbQ1jjXBWwgHtGs5U
	wawzcJ+ehTuXIeFbMMuD0lt111gCLpuq5rDAsiPBM4ELxoWTCEDNGWi7PQObR7O0lW0auoA+tO+
	g
X-Gm-Gg: ASbGncs4KTOKy5G9W9m/qg1g/sWeImJxhRULI5PVBsVbC5eA7e2eBKPqXj0r2BvRehs
	v4o3s0AiJQfExuMyK3Bmee1mBdXgzPLigLy/Jh6GfAXBTzeMg0uvlz5bMId2hwY2d2885MjbRCO
	sSNCsiFG8c+oda3D+nCB+KC9nczqDl13MFJEsm+JKqAUT+TpFukcnxjgjM72OwWSLBt10PwVXtG
	rXsBcADFYfg2zoYs9E8+q0M+bAv36YnZoiIaMlagLOATRuW88Jgfg6cTrxflxYLVSXcKWnXJt4j
	Dsv39lYOCH0EmZQ3Rc2ZLlt8zCUh6vNCo6U=
X-Google-Smtp-Source: AGHT+IEwAKHdD34qLl478yNOL4fFhBx737j3ZgvMAG9V5/X/oUUpBawdVdeaMdjAo4rZ6D/aAODV9Q==
X-Received: by 2002:a05:6870:46ac:b0:2c2:519e:d9a9 with SMTP id 586e51a60fabf-2d96e660ce6mr1996464fac.24.1745513443471;
        Thu, 24 Apr 2025 09:50:43 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2d972f3a068sm365498fac.0.2025.04.24.09.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:42 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 08/23] ipmi:msghandler: Remove srcu for the ipmi_interfaces list
Date: Thu, 24 Apr 2025 11:49:45 -0500
Message-ID: <20250424165020.627193-9-corey@minyard.net>
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

With reworks srcu is no longer necessary, this simplifies locking a lot.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 194 +++++++++++++++-------------
 1 file changed, 102 insertions(+), 92 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 7dd264e40957..3e88ac6831d8 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -628,7 +628,6 @@ static DEFINE_MUTEX(ipmidriver_mutex);
 
 static LIST_HEAD(ipmi_interfaces);
 static DEFINE_MUTEX(ipmi_interfaces_mutex);
-static struct srcu_struct ipmi_interfaces_srcu;
 
 /*
  * List of watchers that want to know when smi's are added and deleted.
@@ -694,28 +693,20 @@ static void free_smi_msg_list(struct list_head *q)
 	}
 }
 
-static void clean_up_interface_data(struct ipmi_smi *intf)
+static void intf_free(struct kref *ref)
 {
+	struct ipmi_smi *intf = container_of(ref, struct ipmi_smi, refcount);
 	int              i;
 	struct cmd_rcvr  *rcvr, *rcvr2;
-	struct list_head list;
-
-	cancel_work_sync(&intf->smi_work);
-	/* smi_work() can no longer be in progress after this. */
 
 	free_smi_msg_list(&intf->waiting_rcv_msgs);
 	free_recv_msg_list(&intf->waiting_events);
 
 	/*
 	 * Wholesale remove all the entries from the list in the
-	 * interface.
+	 * interface.  No need for locks, this is single-threaded.
 	 */
-	mutex_lock(&intf->cmd_rcvrs_mutex);
-	INIT_LIST_HEAD(&list);
-	list_splice_init_rcu(&intf->cmd_rcvrs, &list, synchronize_rcu);
-	mutex_unlock(&intf->cmd_rcvrs_mutex);
-
-	list_for_each_entry_safe(rcvr, rcvr2, &list, link)
+	list_for_each_entry_safe(rcvr, rcvr2, &intf->cmd_rcvrs, link)
 		kfree(rcvr);
 
 	for (i = 0; i < IPMI_IPMB_NUM_SEQ; i++) {
@@ -723,20 +714,17 @@ static void clean_up_interface_data(struct ipmi_smi *intf)
 					&& (intf->seq_table[i].recv_msg))
 			ipmi_free_recv_msg(intf->seq_table[i].recv_msg);
 	}
-}
 
-static void intf_free(struct kref *ref)
-{
-	struct ipmi_smi *intf = container_of(ref, struct ipmi_smi, refcount);
-
-	clean_up_interface_data(intf);
 	kfree(intf);
 }
 
 int ipmi_smi_watcher_register(struct ipmi_smi_watcher *watcher)
 {
 	struct ipmi_smi *intf;
-	int index, rv;
+	unsigned int count = 0, i;
+	int *interfaces = NULL;
+	struct device **devices = NULL;
+	int rv = 0;
 
 	/*
 	 * Make sure the driver is actually initialized, this handles
@@ -750,20 +738,53 @@ int ipmi_smi_watcher_register(struct ipmi_smi_watcher *watcher)
 
 	list_add(&watcher->link, &smi_watchers);
 
-	index = srcu_read_lock(&ipmi_interfaces_srcu);
-	list_for_each_entry_rcu(intf, &ipmi_interfaces, link,
-				lockdep_is_held(&smi_watchers_mutex)) {
-		int intf_num = READ_ONCE(intf->intf_num);
+	/*
+	 * Build an array of ipmi interfaces and fill it in, and
+	 * another array of the devices.  We can't call the callback
+	 * with ipmi_interfaces_mutex held.  smi_watchers_mutex will
+	 * keep things in order for the user.
+	 */
+	mutex_lock(&ipmi_interfaces_mutex);
+	list_for_each_entry(intf, &ipmi_interfaces, link)
+		count++;
+	if (count > 0) {
+		interfaces = kmalloc_array(count, sizeof(*interfaces),
+					   GFP_KERNEL);
+		if (!interfaces) {
+			rv = -ENOMEM;
+		} else {
+			devices = kmalloc_array(count, sizeof(*devices),
+						GFP_KERNEL);
+			if (!devices) {
+				kfree(interfaces);
+				interfaces = NULL;
+				rv = -ENOMEM;
+			}
+		}
+		count = 0;
+	}
+	if (interfaces) {
+		list_for_each_entry(intf, &ipmi_interfaces, link) {
+			int intf_num = READ_ONCE(intf->intf_num);
 
-		if (intf_num == -1)
-			continue;
-		watcher->new_smi(intf_num, intf->si_dev);
+			if (intf_num == -1)
+				continue;
+			devices[count] = intf->si_dev;
+			interfaces[count++] = intf_num;
+		}
+	}
+	mutex_unlock(&ipmi_interfaces_mutex);
+
+	if (interfaces) {
+		for (i = 0; i < count; i++)
+			watcher->new_smi(interfaces[i], devices[i]);
+		kfree(interfaces);
+		kfree(devices);
 	}
-	srcu_read_unlock(&ipmi_interfaces_srcu, index);
 
 	mutex_unlock(&smi_watchers_mutex);
 
-	return 0;
+	return rv;
 }
 EXPORT_SYMBOL(ipmi_smi_watcher_register);
 
@@ -781,14 +802,12 @@ call_smi_watchers(int i, struct device *dev)
 {
 	struct ipmi_smi_watcher *w;
 
-	mutex_lock(&smi_watchers_mutex);
 	list_for_each_entry(w, &smi_watchers, link) {
 		if (try_module_get(w->owner)) {
 			w->new_smi(i, dev);
 			module_put(w->owner);
 		}
 	}
-	mutex_unlock(&smi_watchers_mutex);
 }
 
 static int
@@ -1195,7 +1214,7 @@ int ipmi_create_user(unsigned int          if_num,
 {
 	unsigned long flags;
 	struct ipmi_user *new_user = NULL;
-	int           rv, index;
+	int           rv = 0;
 	struct ipmi_smi *intf;
 
 	/*
@@ -1217,8 +1236,8 @@ int ipmi_create_user(unsigned int          if_num,
 	if (rv)
 		return rv;
 
-	index = srcu_read_lock(&ipmi_interfaces_srcu);
-	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
+	mutex_lock(&ipmi_interfaces_mutex);
+	list_for_each_entry(intf, &ipmi_interfaces, link) {
 		if (intf->intf_num == if_num)
 			goto found;
 	}
@@ -1260,45 +1279,44 @@ int ipmi_create_user(unsigned int          if_num,
 	new_user->intf = intf;
 	new_user->gets_events = false;
 
+	mutex_lock(&intf->users_mutex);
 	spin_lock_irqsave(&intf->seq_lock, flags);
 	list_add(&new_user->link, &intf->users);
 	spin_unlock_irqrestore(&intf->seq_lock, flags);
+	mutex_unlock(&intf->users_mutex);
+
 	if (handler->ipmi_watchdog_pretimeout)
 		/* User wants pretimeouts, so make sure to watch for them. */
 		smi_add_watch(intf, IPMI_WATCH_MASK_CHECK_WATCHDOG);
-	srcu_read_unlock(&ipmi_interfaces_srcu, index);
-	*user = new_user;
-	return 0;
 
 out_kfree:
-	atomic_dec(&intf->nr_users);
-	srcu_read_unlock(&ipmi_interfaces_srcu, index);
-	vfree(new_user);
+	if (rv) {
+		atomic_dec(&intf->nr_users);
+		vfree(new_user);
+	} else {
+		*user = new_user;
+	}
+	mutex_unlock(&ipmi_interfaces_mutex);
 	return rv;
 }
 EXPORT_SYMBOL(ipmi_create_user);
 
 int ipmi_get_smi_info(int if_num, struct ipmi_smi_info *data)
 {
-	int rv, index;
+	int rv = -EINVAL;
 	struct ipmi_smi *intf;
 
-	index = srcu_read_lock(&ipmi_interfaces_srcu);
-	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
-		if (intf->intf_num == if_num)
-			goto found;
+	mutex_lock(&ipmi_interfaces_mutex);
+	list_for_each_entry(intf, &ipmi_interfaces, link) {
+		if (intf->intf_num == if_num) {
+			if (!intf->handlers->get_smi_info)
+				rv = -ENOTTY;
+			else
+				rv = intf->handlers->get_smi_info(intf->send_info, data);
+			break;
+		}
 	}
-	srcu_read_unlock(&ipmi_interfaces_srcu, index);
-
-	/* Not found, return an error */
-	return -EINVAL;
-
-found:
-	if (!intf->handlers->get_smi_info)
-		rv = -ENOTTY;
-	else
-		rv = intf->handlers->get_smi_info(intf->send_info, data);
-	srcu_read_unlock(&ipmi_interfaces_srcu, index);
+	mutex_unlock(&ipmi_interfaces_mutex);
 
 	return rv;
 }
@@ -1345,7 +1363,7 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
 	 * Remove the user from the command receiver's table.  First
 	 * we build a list of everything (not using the standard link,
 	 * since other things may be using it till we do
-	 * synchronize_srcu()) then free everything in that list.
+	 * synchronize_rcu()) then free everything in that list.
 	 */
 	mutex_lock(&intf->cmd_rcvrs_mutex);
 	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
@@ -1357,7 +1375,6 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
 		}
 	}
 	mutex_unlock(&intf->cmd_rcvrs_mutex);
-	synchronize_rcu();
 	while (rcvrs) {
 		rcvr = rcvrs;
 		rcvrs = rcvr->next;
@@ -2298,7 +2315,7 @@ static int i_ipmi_request(struct ipmi_user     *user,
 		}
 	}
 
-	rcu_read_lock();
+	mutex_lock(&ipmi_interfaces_mutex);
 	if (intf->in_shutdown) {
 		rv = -ENODEV;
 		goto out_err;
@@ -2344,7 +2361,7 @@ static int i_ipmi_request(struct ipmi_user     *user,
 
 		smi_send(intf, intf->handlers, smi_msg, priority);
 	}
-	rcu_read_unlock();
+	mutex_unlock(&ipmi_interfaces_mutex);
 
 out:
 	if (rv && user)
@@ -3578,12 +3595,16 @@ int ipmi_add_smi(struct module         *owner,
 	for (i = 0; i < IPMI_NUM_STATS; i++)
 		atomic_set(&intf->stats[i], 0);
 
+	/*
+	 * Grab the watchers mutex so we can deliver the new interface
+	 * without races.
+	 */
+	mutex_lock(&smi_watchers_mutex);
 	mutex_lock(&ipmi_interfaces_mutex);
 	/* Look for a hole in the numbers. */
 	i = 0;
 	link = &ipmi_interfaces;
-	list_for_each_entry_rcu(tintf, &ipmi_interfaces, link,
-				ipmi_interfaces_mutex_held()) {
+	list_for_each_entry(tintf, &ipmi_interfaces, link) {
 		if (tintf->intf_num != i) {
 			link = &tintf->link;
 			break;
@@ -3592,9 +3613,9 @@ int ipmi_add_smi(struct module         *owner,
 	}
 	/* Add the new interface in numeric order. */
 	if (i == 0)
-		list_add_rcu(&intf->link, &ipmi_interfaces);
+		list_add(&intf->link, &ipmi_interfaces);
 	else
-		list_add_tail_rcu(&intf->link, link);
+		list_add_tail(&intf->link, link);
 
 	rv = handlers->start_processing(send_info, intf);
 	if (rv)
@@ -3626,18 +3647,14 @@ int ipmi_add_smi(struct module         *owner,
 		goto out_err_bmc_reg;
 	}
 
-	/*
-	 * Keep memory order straight for RCU readers.  Make
-	 * sure everything else is committed to memory before
-	 * setting intf_num to mark the interface valid.
-	 */
-	smp_wmb();
 	intf->intf_num = i;
 	mutex_unlock(&ipmi_interfaces_mutex);
 
 	/* After this point the interface is legal to use. */
 	call_smi_watchers(i, intf->si_dev);
 
+	mutex_unlock(&smi_watchers_mutex);
+
 	return 0;
 
  out_err_bmc_reg:
@@ -3646,9 +3663,9 @@ int ipmi_add_smi(struct module         *owner,
 	if (intf->handlers->shutdown)
 		intf->handlers->shutdown(intf->send_info);
  out_err:
-	list_del_rcu(&intf->link);
+	list_del(&intf->link);
 	mutex_unlock(&ipmi_interfaces_mutex);
-	synchronize_srcu(&ipmi_interfaces_srcu);
+	mutex_unlock(&smi_watchers_mutex);
 	kref_put(&intf->refcount, intf_free);
 
 	return rv;
@@ -3718,13 +3735,16 @@ void ipmi_unregister_smi(struct ipmi_smi *intf)
 
 	if (!intf)
 		return;
+
 	intf_num = intf->intf_num;
 	mutex_lock(&ipmi_interfaces_mutex);
+	cancel_work_sync(&intf->smi_work);
+	/* smi_work() can no longer be in progress after this. */
+
 	intf->intf_num = -1;
 	intf->in_shutdown = true;
-	list_del_rcu(&intf->link);
+	list_del(&intf->link);
 	mutex_unlock(&ipmi_interfaces_mutex);
-	synchronize_srcu(&ipmi_interfaces_srcu);
 
 	/* At this point no users can be added to the interface. */
 
@@ -3880,7 +3900,7 @@ static int handle_ipmb_get_msg_cmd(struct ipmi_smi *intf,
 		dev_dbg(intf->si_dev, "Invalid command: %*ph\n",
 			msg->data_size, msg->data);
 
-		rcu_read_lock();
+		mutex_lock(&ipmi_interfaces_mutex);
 		if (!intf->in_shutdown) {
 			smi_send(intf, intf->handlers, msg, 0);
 			/*
@@ -3890,7 +3910,7 @@ static int handle_ipmb_get_msg_cmd(struct ipmi_smi *intf,
 			 */
 			rv = -1;
 		}
-		rcu_read_unlock();
+		mutex_unlock(&ipmi_interfaces_mutex);
 	} else {
 		recv_msg = ipmi_alloc_recv_msg();
 		if (!recv_msg) {
@@ -3971,7 +3991,7 @@ static int handle_ipmb_direct_rcv_cmd(struct ipmi_smi *intf,
 		msg->data[4] = IPMI_INVALID_CMD_COMPLETION_CODE;
 		msg->data_size = 5;
 
-		rcu_read_lock();
+		mutex_lock(&ipmi_interfaces_mutex);
 		if (!intf->in_shutdown) {
 			smi_send(intf, intf->handlers, msg, 0);
 			/*
@@ -3981,7 +4001,7 @@ static int handle_ipmb_direct_rcv_cmd(struct ipmi_smi *intf,
 			 */
 			rv = -1;
 		}
-		rcu_read_unlock();
+		mutex_unlock(&ipmi_interfaces_mutex);
 	} else {
 		recv_msg = ipmi_alloc_recv_msg();
 		if (!recv_msg) {
@@ -5053,13 +5073,12 @@ static void ipmi_timeout_work(struct work_struct *work)
 
 	struct ipmi_smi *intf;
 	bool need_timer = false;
-	int index;
 
 	if (atomic_read(&stop_operation))
 		return;
 
-	index = srcu_read_lock(&ipmi_interfaces_srcu);
-	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
+	mutex_lock(&ipmi_interfaces_mutex);
+	list_for_each_entry(intf, &ipmi_interfaces, link) {
 		if (atomic_read(&intf->event_waiters)) {
 			intf->ticks_to_req_ev--;
 			if (intf->ticks_to_req_ev == 0) {
@@ -5071,7 +5090,7 @@ static void ipmi_timeout_work(struct work_struct *work)
 
 		need_timer |= ipmi_timeout_handler(intf, IPMI_TIMEOUT_TIME);
 	}
-	srcu_read_unlock(&ipmi_interfaces_srcu, index);
+	mutex_unlock(&ipmi_interfaces_mutex);
 
 	if (need_timer)
 		mod_timer(&ipmi_timer, jiffies + IPMI_TIMEOUT_JIFFIES);
@@ -5453,15 +5472,11 @@ static int ipmi_init_msghandler(void)
 	if (initialized)
 		goto out;
 
-	rv = init_srcu_struct(&ipmi_interfaces_srcu);
-	if (rv)
-		goto out;
-
 	bmc_remove_work_wq = create_singlethread_workqueue("ipmi-msghandler-remove-wq");
 	if (!bmc_remove_work_wq) {
 		pr_err("unable to create ipmi-msghandler-remove-wq workqueue");
 		rv = -ENOMEM;
-		goto out_wq;
+		goto out;
 	}
 
 	timer_setup(&ipmi_timer, ipmi_timeout, 0);
@@ -5471,9 +5486,6 @@ static int ipmi_init_msghandler(void)
 
 	initialized = true;
 
-out_wq:
-	if (rv)
-		cleanup_srcu_struct(&ipmi_interfaces_srcu);
 out:
 	mutex_unlock(&ipmi_interfaces_mutex);
 	return rv;
@@ -5525,8 +5537,6 @@ static void __exit cleanup_ipmi(void)
 		count = atomic_read(&recv_msg_inuse_count);
 		if (count != 0)
 			pr_warn("recv message count %d at exit\n", count);
-
-		cleanup_srcu_struct(&ipmi_interfaces_srcu);
 	}
 	if (drvregistered)
 		driver_unregister(&ipmidriver.driver);
-- 
2.43.0

