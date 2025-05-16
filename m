Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D2272601
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747403723; cv=none; b=CRcNA5bJH9JbZoVL0lauN78fqgYKXbdFzSjTBdvnRAfkkAFKu0pJeiarx5dE+FWS9TunUw5qF9b1ilpKA2aaNzd4l88byZSYx6kyHcDiWNQ/oqDMRc58sKy8ZnjEp52gzeXRlWZj+wAxxqsSp1z2Q3uZs6m9I6ajOLfUqUwgAow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747403723; c=relaxed/simple;
	bh=xz4KXyjxxqtJo8+UfJLQNE8G+31IXEyHgzP5kBGQ10M=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gqctd3XCf0zCjWofj+ONniOdcSjwstWdipWps6+v38UKU1br/3EO+XXwSpo2TMIqhMWwb3VEWBboIEtaxBtnmCoeZsh9heEahrkp/jkYsfPSbEtkXi8rDuWhayOZuC+zAvV1bdAZBacPg+EanG6SUIBI5ofea7IBy4iIp5Pcfb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30abb33d1d2so4043104a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747403720; x=1748008520;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2zy8RBHcYgjVtPGhPQMOjOPgSn15KXqetvy8zLm/jew=;
        b=Sv5b1V1htHgotYxbe7f39AmNERYP5bNsy48Q48rPzayNTLAlASvTJlZvWLz0TRVU+N
         F1sQ5v/VcWuc3bEv83wK92ACOSMHv9oSwUUN0AOhpoSXAX3XTQp1nIeLoO3h6iR0loMi
         SmMBpgXuJuGSekjXVTYYKhLjvMhyBcW745++OI0lxbG1ZyxsZK//hW7lyWUytnMiTy++
         IVWBdkwzJnGy6jgw7UxzXGIubB9jH29FXsLvvvV33YgeGCD5Ui8vgbaOa9gSaQ1GLWZg
         OSpa0Qh0vUH0UwH4yscE6EtEnKEBKcD01TD+v77dT/cxhuy6+mzrZnFYdNM4ohhv1RRn
         5wZw==
X-Gm-Message-State: AOJu0Yw9Ea25oFiDNsA5DNgn49ZdnLit2gB/Ah9ZZ3sz1tOOvIvHRG1H
	t+j3hs7yyri6Vs6AEQ8MyFKpQEmIdshkdyGqjpn5OZ2TzGiZnkMHY+NUkvVdoxMFUCelBNWcDM/
	HnYStFPzMpPzxe61pCV1a2OThTsbWy6/a8Wh8NwAxZMMgoZXoGvTsgAzRSpw=
X-Google-Smtp-Source: AGHT+IH3XUl9aompvJnJEAsKnM94Meosso6TmVx4alFS0b298QJJoQXXQvsFf5bFVRUeq+XnKuYRdjRFvTaleEV6gCvrSkDM7suc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:721b:b0:86a:1fce:f1a6 with SMTP id
 ca18e2360f4ac-86a24bdaac0mr415099839f.5.1747403710462; Fri, 16 May 2025
 06:55:10 -0700 (PDT)
Date: Fri, 16 May 2025 06:55:10 -0700
In-Reply-To: <000000000000ffc5d80616fea23d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682743be.a00a0220.398d88.020d.GAE@google.com>
Subject: Re: [syzbot] Re: possible deadlock in team_del_slave (3)
From: syzbot <syzbot+705c61d60b091ef42c04@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: possible deadlock in team_del_slave (3)
Author: penguin-kernel@i-love.sakura.ne.jp

#syz test

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index d8fc0c79745d..96bbe146b884 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -933,7 +933,7 @@ static bool team_port_find(const struct team *team,
  * Enable/disable port by adding to enabled port hashlist and setting
  * port->index (Might be racy so reader could see incorrect ifindex when
  * processing a flying packet, but that is not a problem). Write guarded
- * by team->lock.
+ * by RTNL.
  */
 static void team_port_enable(struct team *team,
 			     struct team_port *port)
@@ -1660,8 +1660,6 @@ static int team_init(struct net_device *dev)
 		goto err_options_register;
 	netif_carrier_off(dev);
 
-	lockdep_register_key(&team->team_lock_key);
-	__mutex_init(&team->lock, "team->team_lock_key", &team->team_lock_key);
 	netdev_lockdep_set_classes(dev);
 
 	return 0;
@@ -1682,7 +1680,7 @@ static void team_uninit(struct net_device *dev)
 	struct team_port *port;
 	struct team_port *tmp;
 
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	list_for_each_entry_safe(port, tmp, &team->port_list, list)
 		team_port_del(team, port->dev);
 
@@ -1691,9 +1689,8 @@ static void team_uninit(struct net_device *dev)
 	team_mcast_rejoin_fini(team);
 	team_notify_peers_fini(team);
 	team_queue_override_fini(team);
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 	netdev_change_features(dev);
-	lockdep_unregister_key(&team->team_lock_key);
 }
 
 static void team_destructor(struct net_device *dev)
@@ -1814,11 +1811,11 @@ static int team_set_mac_address(struct net_device *dev, void *p)
 	if (dev->type == ARPHRD_ETHER && !is_valid_ether_addr(addr->sa_data))
 		return -EADDRNOTAVAIL;
 	dev_addr_set(dev, addr->sa_data);
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	list_for_each_entry(port, &team->port_list, list)
 		if (team->ops.port_change_dev_addr)
 			team->ops.port_change_dev_addr(team, port);
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 	return 0;
 }
 
@@ -1832,7 +1829,7 @@ static int team_change_mtu(struct net_device *dev, int new_mtu)
 	 * Alhough this is reader, it's guarded by team lock. It's not possible
 	 * to traverse list in reverse under rcu_read_lock
 	 */
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	team->port_mtu_change_allowed = true;
 	list_for_each_entry(port, &team->port_list, list) {
 		err = dev_set_mtu(port->dev, new_mtu);
@@ -1843,7 +1840,7 @@ static int team_change_mtu(struct net_device *dev, int new_mtu)
 		}
 	}
 	team->port_mtu_change_allowed = false;
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 
 	WRITE_ONCE(dev->mtu, new_mtu);
 
@@ -1853,7 +1850,7 @@ static int team_change_mtu(struct net_device *dev, int new_mtu)
 	list_for_each_entry_continue_reverse(port, &team->port_list, list)
 		dev_set_mtu(port->dev, dev->mtu);
 	team->port_mtu_change_allowed = false;
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 
 	return err;
 }
@@ -1907,20 +1904,20 @@ static int team_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
 	 * Alhough this is reader, it's guarded by team lock. It's not possible
 	 * to traverse list in reverse under rcu_read_lock
 	 */
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	list_for_each_entry(port, &team->port_list, list) {
 		err = vlan_vid_add(port->dev, proto, vid);
 		if (err)
 			goto unwind;
 	}
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 
 	return 0;
 
 unwind:
 	list_for_each_entry_continue_reverse(port, &team->port_list, list)
 		vlan_vid_del(port->dev, proto, vid);
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 
 	return err;
 }
@@ -1930,10 +1927,10 @@ static int team_vlan_rx_kill_vid(struct net_device *dev, __be16 proto, u16 vid)
 	struct team *team = netdev_priv(dev);
 	struct team_port *port;
 
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	list_for_each_entry(port, &team->port_list, list)
 		vlan_vid_del(port->dev, proto, vid);
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 
 	return 0;
 }
@@ -1955,9 +1952,9 @@ static void team_netpoll_cleanup(struct net_device *dev)
 {
 	struct team *team = netdev_priv(dev);
 
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	__team_netpoll_cleanup(team);
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 }
 
 static int team_netpoll_setup(struct net_device *dev)
@@ -1966,7 +1963,7 @@ static int team_netpoll_setup(struct net_device *dev)
 	struct team_port *port;
 	int err = 0;
 
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	list_for_each_entry(port, &team->port_list, list) {
 		err = __team_port_enable_netpoll(port);
 		if (err) {
@@ -1974,7 +1971,7 @@ static int team_netpoll_setup(struct net_device *dev)
 			break;
 		}
 	}
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 	return err;
 }
 #endif
@@ -1985,9 +1982,9 @@ static int team_add_slave(struct net_device *dev, struct net_device *port_dev,
 	struct team *team = netdev_priv(dev);
 	int err;
 
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	err = team_port_add(team, port_dev, extack);
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 
 	if (!err)
 		netdev_change_features(dev);
@@ -2000,18 +1997,13 @@ static int team_del_slave(struct net_device *dev, struct net_device *port_dev)
 	struct team *team = netdev_priv(dev);
 	int err;
 
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	err = team_port_del(team, port_dev);
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 
 	if (err)
 		return err;
 
-	if (netif_is_team_master(port_dev)) {
-		lockdep_unregister_key(&team->team_lock_key);
-		lockdep_register_key(&team->team_lock_key);
-		lockdep_set_class(&team->lock, &team->team_lock_key);
-	}
 	netdev_change_features(dev);
 
 	return err;
@@ -2319,13 +2311,13 @@ static struct team *team_nl_team_get(struct genl_info *info)
 	}
 
 	team = netdev_priv(dev);
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	return team;
 }
 
 static void team_nl_team_put(struct team *team)
 {
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 	dev_put(team->dev);
 }
 
@@ -2961,11 +2953,9 @@ static void __team_port_change_port_removed(struct team_port *port)
 
 static void team_port_change_check(struct team_port *port, bool linkup)
 {
-	struct team *team = port->team;
-
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	__team_port_change_check(port, linkup);
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 }
 
 
diff --git a/drivers/net/team/team_mode_activebackup.c b/drivers/net/team/team_mode_activebackup.c
index e0f599e2a51d..4e133451f4d6 100644
--- a/drivers/net/team/team_mode_activebackup.c
+++ b/drivers/net/team/team_mode_activebackup.c
@@ -68,7 +68,7 @@ static void ab_active_port_get(struct team *team, struct team_gsetter_ctx *ctx)
 	struct team_port *active_port;
 
 	active_port = rcu_dereference_protected(ab_priv(team)->active_port,
-						lockdep_is_held(&team->lock));
+						rtnl_is_locked());
 	if (active_port)
 		ctx->data.u32_val = active_port->dev->ifindex;
 	else
diff --git a/drivers/net/team/team_mode_loadbalance.c b/drivers/net/team/team_mode_loadbalance.c
index 00f8989c29c0..79ac52d086e0 100644
--- a/drivers/net/team/team_mode_loadbalance.c
+++ b/drivers/net/team/team_mode_loadbalance.c
@@ -302,7 +302,7 @@ static int lb_bpf_func_set(struct team *team, struct team_gsetter_ctx *ctx)
 		/* Clear old filter data */
 		__fprog_destroy(lb_priv->ex->orig_fprog);
 		orig_fp = rcu_dereference_protected(lb_priv->fp,
-						lockdep_is_held(&team->lock));
+						    rtnl_is_locked());
 	}
 
 	rcu_assign_pointer(lb_priv->fp, fp);
@@ -325,7 +325,7 @@ static void lb_bpf_func_free(struct team *team)
 
 	__fprog_destroy(lb_priv->ex->orig_fprog);
 	fp = rcu_dereference_protected(lb_priv->fp,
-				       lockdep_is_held(&team->lock));
+				       rtnl_is_locked());
 	bpf_prog_destroy(fp);
 }
 
@@ -336,7 +336,7 @@ static void lb_tx_method_get(struct team *team, struct team_gsetter_ctx *ctx)
 	char *name;
 
 	func = rcu_dereference_protected(lb_priv->select_tx_port_func,
-					 lockdep_is_held(&team->lock));
+					 rtnl_is_locked());
 	name = lb_select_tx_port_get_name(func);
 	BUG_ON(!name);
 	ctx->data.str_val = name;
@@ -471,6 +471,7 @@ static void lb_stats_refresh(struct work_struct *work)
 	bool changed = false;
 	int i;
 	int j;
+	bool locked;
 
 	lb_priv_ex = container_of(work, struct lb_priv_ex,
 				  stats.refresh_dw.work);
@@ -478,7 +479,8 @@ static void lb_stats_refresh(struct work_struct *work)
 	team = lb_priv_ex->team;
 	lb_priv = get_lb_priv(team);
 
-	if (!mutex_trylock(&team->lock)) {
+	locked = rtnl_is_locked();
+	if (!locked && !rtnl_trylock()) {
 		schedule_delayed_work(&lb_priv_ex->stats.refresh_dw, 0);
 		return;
 	}
@@ -515,7 +517,8 @@ static void lb_stats_refresh(struct work_struct *work)
 	schedule_delayed_work(&lb_priv_ex->stats.refresh_dw,
 			      (lb_priv_ex->stats.refresh_interval * HZ) / 10);
 
-	mutex_unlock(&team->lock);
+	if (!locked)
+		rtnl_unlock();
 }
 
 static void lb_stats_refresh_interval_get(struct team *team,
diff --git a/include/linux/if_team.h b/include/linux/if_team.h
index cdc684e04a2f..ce97d891cf72 100644
--- a/include/linux/if_team.h
+++ b/include/linux/if_team.h
@@ -191,8 +191,6 @@ struct team {
 
 	const struct header_ops *header_ops_cache;
 
-	struct mutex lock; /* used for overall locking, e.g. port lists write */
-
 	/*
 	 * List of enabled ports and their count
 	 */
@@ -223,7 +221,6 @@ struct team {
 		atomic_t count_pending;
 		struct delayed_work dw;
 	} mcast_rejoin;
-	struct lock_class_key team_lock_key;
 	long mode_priv[TEAM_MODE_PRIV_LONGS];
 };
 

