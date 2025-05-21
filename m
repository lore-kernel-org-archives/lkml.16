Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22FE8633F
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747864676; cv=none; b=YTGoAo4Z/aAzJ6z9BMiG+cyl5eEzddyXZT6SUzQ4xzqVz0cIAWrpHvJIOCHwrjHVfEREEjg8+N292B4JiYp3qPNJkD3YCw/LObKYCMntX82DDlj0RPCZ2ReeWl5DsyboIlOhuRlC5BPoHnlN8zSO5tvJk8OwnriTatd7ys+vc80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747864676; c=relaxed/simple;
	bh=ezJsTZIOHLnsSfo92RZFN7R3lM5cMwfNZI8X86PkOHo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BYZ0rj72ovem9HzmmKIj65uQlvr1nY9Bd94TK9ICIi5GDJNfBiiikrUtGAzTuu3NPSD5KPyD2WifIbRSPYDV6V9tjVmUa/+/OIWEgdeCa8/htjZx1lvx0cNjCv3Rw4iiYmxDurmNAnNSflZlM9OAtoTyACJ/u/ZfDBauufyoKQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86a5def8869so353850039f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747864674; x=1748469474;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+FiU59m1NdRUOrncNUFof24Wvl4zcyKpxxi8IJX8MoI=;
        b=Zo9Cft0gW/3zC17vQ0o6PFYQta7flyu7yZlUaK3aQyCxEtFpxQyVJQf7NIQJNow454
         oSyBMyT+g5ZkyBzXXNTfcUuYE/NA6LA+ZpZI77IbHd7Er4yZvS7Nuo47zfYBRUTwRL0t
         1wrvjN3jNa97V56Fsm1+bkv5n+mEC4ZDpxaFq9UE90woJo8a1WJSYdtiLKnxgLzb3RCl
         mxvXR4HZ2JVFbxNQ4KkGzfUM7gc2DYsSlxbjS7z5nH3uDVvoK/abv3Zg3oaC7S84Abvp
         eASXb/hHSk0sz6TgjXgki1SpVitYWnCk9nHDIDuiuBlGRBg4bca9b6IoGUHT29HywBst
         jToQ==
X-Gm-Message-State: AOJu0Yyt8ICyLki887qY8v1iGJy75aeEWWNYOu9XFwtQxUU2Xgrf/OWz
	VUyvTsqjyjgojSbwtWUtbJ/ylNSruf9N8Pmd1Dbmwk5f63lYrvxZkwyMZBAqUvwb9LiQkYAH4N4
	TqBYzRWIPEzvfk5A5hWKfwfehr06aHbBZ7EtHcxzKWDjcCOxKp1vSq1YSCVM=
X-Google-Smtp-Source: AGHT+IFUzZ6O+7nM95gS0dcss4UwSqC/W5SLKReTFm/W82MUcnGwUZgRme9ExGdWb0FOb5om/Mmjt8t9mxMe+2piLV9KMIqSEZMe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3a01:b0:3d6:cbad:235c with SMTP id
 e9e14a558f8ab-3db8573b700mr221390045ab.6.1747864673982; Wed, 21 May 2025
 14:57:53 -0700 (PDT)
Date: Wed, 21 May 2025 14:57:53 -0700
In-Reply-To: <682c7f0d.a00a0220.29bc26.027d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682e4c61.a00a0220.2a3337.0006.GAE@google.com>
Subject: Re: [syzbot] Re: BUG: sleeping function called from invalid context
 in team_change_rx_flags
From: syzbot <syzbot+b191b5ccad8d7a986286@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: BUG: sleeping function called from invalid context in team_change_rx_flags
Author: penguin-kernel@i-love.sakura.ne.jp

#syz test

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index b75ceb90359f..e4e49f8e566f 100644
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
 
@@ -1691,9 +1689,7 @@ static void team_uninit(struct net_device *dev)
 	team_mcast_rejoin_fini(team);
 	team_notify_peers_fini(team);
 	team_queue_override_fini(team);
-	mutex_unlock(&team->lock);
 	netdev_change_features(dev);
-	lockdep_unregister_key(&team->team_lock_key);
 }
 
 static void team_destructor(struct net_device *dev)
@@ -1778,7 +1774,7 @@ static void team_change_rx_flags(struct net_device *dev, int change)
 	struct team_port *port;
 	int inc;
 
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	list_for_each_entry(port, &team->port_list, list) {
 		if (change & IFF_PROMISC) {
 			inc = dev->flags & IFF_PROMISC ? 1 : -1;
@@ -1789,7 +1785,6 @@ static void team_change_rx_flags(struct net_device *dev, int change)
 			dev_set_allmulti(port->dev, inc);
 		}
 	}
-	mutex_unlock(&team->lock);
 }
 
 static void team_set_rx_mode(struct net_device *dev)
@@ -1811,14 +1806,13 @@ static int team_set_mac_address(struct net_device *dev, void *p)
 	struct team *team = netdev_priv(dev);
 	struct team_port *port;
 
+	ASSERT_RTNL();
 	if (dev->type == ARPHRD_ETHER && !is_valid_ether_addr(addr->sa_data))
 		return -EADDRNOTAVAIL;
 	dev_addr_set(dev, addr->sa_data);
-	mutex_lock(&team->lock);
 	list_for_each_entry(port, &team->port_list, list)
 		if (team->ops.port_change_dev_addr)
 			team->ops.port_change_dev_addr(team, port);
-	mutex_unlock(&team->lock);
 	return 0;
 }
 
@@ -1829,10 +1823,10 @@ static int team_change_mtu(struct net_device *dev, int new_mtu)
 	int err;
 
 	/*
-	 * Alhough this is reader, it's guarded by team lock. It's not possible
+	 * Alhough this is reader, it's guarded by RTNL. It's not possible
 	 * to traverse list in reverse under rcu_read_lock
 	 */
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	team->port_mtu_change_allowed = true;
 	list_for_each_entry(port, &team->port_list, list) {
 		err = dev_set_mtu(port->dev, new_mtu);
@@ -1843,7 +1837,6 @@ static int team_change_mtu(struct net_device *dev, int new_mtu)
 		}
 	}
 	team->port_mtu_change_allowed = false;
-	mutex_unlock(&team->lock);
 
 	WRITE_ONCE(dev->mtu, new_mtu);
 
@@ -1853,7 +1846,6 @@ static int team_change_mtu(struct net_device *dev, int new_mtu)
 	list_for_each_entry_continue_reverse(port, &team->port_list, list)
 		dev_set_mtu(port->dev, dev->mtu);
 	team->port_mtu_change_allowed = false;
-	mutex_unlock(&team->lock);
 
 	return err;
 }
@@ -1904,23 +1896,21 @@ static int team_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
 	int err;
 
 	/*
-	 * Alhough this is reader, it's guarded by team lock. It's not possible
+	 * Alhough this is reader, it's guarded by RTNL. It's not possible
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
 
 	return 0;
 
 unwind:
 	list_for_each_entry_continue_reverse(port, &team->port_list, list)
 		vlan_vid_del(port->dev, proto, vid);
-	mutex_unlock(&team->lock);
 
 	return err;
 }
@@ -1930,10 +1920,9 @@ static int team_vlan_rx_kill_vid(struct net_device *dev, __be16 proto, u16 vid)
 	struct team *team = netdev_priv(dev);
 	struct team_port *port;
 
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	list_for_each_entry(port, &team->port_list, list)
 		vlan_vid_del(port->dev, proto, vid);
-	mutex_unlock(&team->lock);
 
 	return 0;
 }
@@ -1955,9 +1944,8 @@ static void team_netpoll_cleanup(struct net_device *dev)
 {
 	struct team *team = netdev_priv(dev);
 
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	__team_netpoll_cleanup(team);
-	mutex_unlock(&team->lock);
 }
 
 static int team_netpoll_setup(struct net_device *dev)
@@ -1966,7 +1954,7 @@ static int team_netpoll_setup(struct net_device *dev)
 	struct team_port *port;
 	int err = 0;
 
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	list_for_each_entry(port, &team->port_list, list) {
 		err = __team_port_enable_netpoll(port);
 		if (err) {
@@ -1974,7 +1962,6 @@ static int team_netpoll_setup(struct net_device *dev)
 			break;
 		}
 	}
-	mutex_unlock(&team->lock);
 	return err;
 }
 #endif
@@ -1985,9 +1972,8 @@ static int team_add_slave(struct net_device *dev, struct net_device *port_dev,
 	struct team *team = netdev_priv(dev);
 	int err;
 
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	err = team_port_add(team, port_dev, extack);
-	mutex_unlock(&team->lock);
 
 	if (!err)
 		netdev_change_features(dev);
@@ -2000,18 +1986,12 @@ static int team_del_slave(struct net_device *dev, struct net_device *port_dev)
 	struct team *team = netdev_priv(dev);
 	int err;
 
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	err = team_port_del(team, port_dev);
-	mutex_unlock(&team->lock);
 
 	if (err)
 		return err;
 
-	if (netif_is_team_master(port_dev)) {
-		lockdep_unregister_key(&team->team_lock_key);
-		lockdep_register_key(&team->team_lock_key);
-		lockdep_set_class(&team->lock, &team->team_lock_key);
-	}
 	netdev_change_features(dev);
 
 	return err;
@@ -2308,6 +2288,7 @@ static struct team *team_nl_team_get(struct genl_info *info)
 	struct net_device *dev;
 	struct team *team;
 
+	ASSERT_RTNL();
 	if (!info->attrs[TEAM_ATTR_TEAM_IFINDEX])
 		return NULL;
 
@@ -2319,13 +2300,12 @@ static struct team *team_nl_team_get(struct genl_info *info)
 	}
 
 	team = netdev_priv(dev);
-	mutex_lock(&team->lock);
 	return team;
 }
 
 static void team_nl_team_put(struct team *team)
 {
-	mutex_unlock(&team->lock);
+	ASSERT_RTNL();
 	dev_put(team->dev);
 }
 
@@ -2961,11 +2941,8 @@ static void __team_port_change_port_removed(struct team_port *port)
 
 static void team_port_change_check(struct team_port *port, bool linkup)
 {
-	struct team *team = port->team;
-
-	mutex_lock(&team->lock);
+	ASSERT_RTNL();
 	__team_port_change_check(port, linkup);
-	mutex_unlock(&team->lock);
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
index 00f8989c29c0..6f9944108f5a 100644
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
@@ -478,7 +478,8 @@ static void lb_stats_refresh(struct work_struct *work)
 	team = lb_priv_ex->team;
 	lb_priv = get_lb_priv(team);
 
-	if (!mutex_trylock(&team->lock)) {
+	/* This rtnl_trylock() might be easy to compete... */
+	if (!rtnl_trylock()) {
 		schedule_delayed_work(&lb_priv_ex->stats.refresh_dw, 0);
 		return;
 	}
@@ -515,7 +516,7 @@ static void lb_stats_refresh(struct work_struct *work)
 	schedule_delayed_work(&lb_priv_ex->stats.refresh_dw,
 			      (lb_priv_ex->stats.refresh_interval * HZ) / 10);
 
-	mutex_unlock(&team->lock);
+	rtnl_unlock();
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
 
-- 
2.43.5


