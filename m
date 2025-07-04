Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FA82F50AA;
	Fri,  4 Jul 2025 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615709; cv=none; b=RPvdlPCG3TbAKecjc1hX6tdx9WZfeXb1+xzPLy2/7FX4XUKesydXwwLXNkIs2ZNfmC9N3u/G6pIzKgO+PQc8nbWPN2x+nSSCtocRgO/9RuP3jAzByYmxpr4vD2mFETVy8l2Vg8KdCh8BLwz0PGLRnZx5JZ/SBz5EMH/YCnAdcPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615709; c=relaxed/simple;
	bh=GXkooPLiz/m8KPmhM4Nz4SvBdNI/9KVoc1B8Wa4Texo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SnJqqTqHix4Jyxfq6PJ3ZTiiq4RmoBEl5K5kWDs2f/P9HW5uIOqd9cZxiRuNJK9FWZHehX2GsJGptksQeTCTNvAtAnoDbQUN3Alf/BOvWptszR0S5IFtgfFZNzOGqkZcSCig80Y69IXp7FNGJfKGjXPDWhlQvcr/CCnIkH5AnR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zn8ItewI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zn8ItewI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615707; x=1783151707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GXkooPLiz/m8KPmhM4Nz4SvBdNI/9KVoc1B8Wa4Texo=;
  b=Zn8ItewIOFumehIrp7s36eOg5md61iO0MLcO64Uu+mrVSY6HCkpfY3SZ
   +FLeN8vVxPQkdMOGyHw3ibLpAS8eK3vkDPOoYLBMyQ6FiclhgNeY4JA+H
   i6QpsHVpOVIUtUVDTqKFW3MHT0F/2I/SasWUvncH2wtDjqs3XiZxakKsl
   J8b5fZNIZw5RYnTKPEWSRUvoDu3/Q3wqy+scy6iQDnTJpEUAnxkbyFl+u
   HpyTvj+/5bhqpLz6obZeZsgxWMCucsK3hMzzqX21BjJKmFvlzqg32G/Aw
   zi3kZdN8PFj9rmiPg4z/Fs9Xl3z2XhzuM+Er4hjVi8EmT2Bh+jlhqHetQ
   Q==;
X-CSE-ConnectionGUID: bAcstHPfRSqiGZ0qZ/j6Uw==
X-CSE-MsgGUID: YBmeH1HLR3WPkMpJTzOX9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194271"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194271"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:59 -0700
X-CSE-ConnectionGUID: qhmrTYIdQFWKLuP1ilA8CA==
X-CSE-MsgGUID: yWHR0cUbSLSjcfGLmob/+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616684"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:55 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id DF2F04445A;
	Fri,  4 Jul 2025 10:54:51 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 65/80] thunderbolt: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:51 +0300
Message-Id: <20250704075451.3222060-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/thunderbolt/debugfs.c   | 11 -----------
 drivers/thunderbolt/domain.c    |  2 --
 drivers/thunderbolt/icm.c       |  7 -------
 drivers/thunderbolt/retimer.c   |  2 --
 drivers/thunderbolt/switch.c    |  4 ----
 drivers/thunderbolt/tb.c        |  9 ---------
 drivers/thunderbolt/usb4_port.c |  2 --
 7 files changed, 37 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index f8328ca7e22e..d0e91c93916d 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -262,7 +262,6 @@ static ssize_t regs_write(struct tb_switch *sw, struct tb_port *port,
 	mutex_unlock(&tb->lock);
 
 out:
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 	free_page((unsigned long)buf);
 
@@ -403,7 +402,6 @@ static ssize_t port_sb_regs_write(struct file *file, const char __user *user_buf
 
 	mutex_unlock(&tb->lock);
 out:
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 	free_page((unsigned long)buf);
 
@@ -436,7 +434,6 @@ static ssize_t retimer_sb_regs_write(struct file *file,
 
 	mutex_unlock(&tb->lock);
 out:
-	pm_runtime_mark_last_busy(&rt->dev);
 	pm_runtime_put_autosuspend(&rt->dev);
 	free_page((unsigned long)buf);
 
@@ -1304,7 +1301,6 @@ static int margining_run_write(void *data, u64 val)
 out_unlock:
 	mutex_unlock(&tb->lock);
 out_rpm_put:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -1923,7 +1919,6 @@ static ssize_t counters_write(struct file *file, const char __user *user_buf,
 	mutex_unlock(&tb->lock);
 
 out:
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 	free_page((unsigned long)buf);
 
@@ -2118,7 +2113,6 @@ static int port_regs_show(struct seq_file *s, void *not_used)
 out_unlock:
 	mutex_unlock(&tb->lock);
 out_rpm_put:
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
@@ -2222,7 +2216,6 @@ static int switch_regs_show(struct seq_file *s, void *not_used)
 out_unlock:
 	mutex_unlock(&tb->lock);
 out_rpm_put:
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
@@ -2283,7 +2276,6 @@ static int path_show(struct seq_file *s, void *not_used)
 out_unlock:
 	mutex_unlock(&tb->lock);
 out_rpm_put:
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
@@ -2337,7 +2329,6 @@ static int counters_show(struct seq_file *s, void *not_used)
 	mutex_unlock(&tb->lock);
 
 out:
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
@@ -2391,7 +2382,6 @@ static int port_sb_regs_show(struct seq_file *s, void *not_used)
 
 	mutex_unlock(&tb->lock);
 out_rpm_put:
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
@@ -2506,7 +2496,6 @@ static int retimer_sb_regs_show(struct seq_file *s, void *not_used)
 
 	mutex_unlock(&tb->lock);
 out_rpm_put:
-	pm_runtime_mark_last_busy(&rt->dev);
 	pm_runtime_put_autosuspend(&rt->dev);
 
 	return ret;
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index a3a7c8059eee..15d7c8881be1 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -150,7 +150,6 @@ static ssize_t boot_acl_show(struct device *dev, struct device_attribute *attr,
 	}
 
 out:
-	pm_runtime_mark_last_busy(&tb->dev);
 	pm_runtime_put_autosuspend(&tb->dev);
 	kfree(uuids);
 
@@ -222,7 +221,6 @@ static ssize_t boot_acl_store(struct device *dev, struct device_attribute *attr,
 	mutex_unlock(&tb->lock);
 
 err_rpm_put:
-	pm_runtime_mark_last_busy(&tb->dev);
 	pm_runtime_put_autosuspend(&tb->dev);
 err_free_acl:
 	kfree(acl);
diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index f213d9174dc5..ed8c9d8b1e36 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -367,7 +367,6 @@ static void icm_veto_end(struct tb *tb)
 	if (icm->veto) {
 		icm->veto = false;
 		/* Allow the domain suspend now */
-		pm_runtime_mark_last_busy(&tb->dev);
 		pm_runtime_put_autosuspend(&tb->dev);
 	}
 }
@@ -721,7 +720,6 @@ static void add_xdomain(struct tb_switch *sw, u64 route,
 	tb_xdomain_add(xd);
 
 out:
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 }
 
@@ -883,7 +881,6 @@ icm_fr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr)
 			tb_switch_put(sw);
 	}
 
-	pm_runtime_mark_last_busy(&parent_sw->dev);
 	pm_runtime_put_autosuspend(&parent_sw->dev);
 
 	tb_switch_put(parent_sw);
@@ -917,7 +914,6 @@ icm_fr_device_disconnected(struct tb *tb, const struct icm_pkg_header *hdr)
 
 	remove_switch(sw);
 
-	pm_runtime_mark_last_busy(sw->dev.parent);
 	pm_runtime_put_autosuspend(sw->dev.parent);
 
 	tb_switch_put(sw);
@@ -1315,7 +1311,6 @@ __icm_tr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr,
 			tb_switch_put(sw);
 	}
 
-	pm_runtime_mark_last_busy(&parent_sw->dev);
 	pm_runtime_put_autosuspend(&parent_sw->dev);
 
 	tb_switch_put(parent_sw);
@@ -1346,7 +1341,6 @@ icm_tr_device_disconnected(struct tb *tb, const struct icm_pkg_header *hdr)
 
 	remove_switch(sw);
 
-	pm_runtime_mark_last_busy(sw->dev.parent);
 	pm_runtime_put_autosuspend(sw->dev.parent);
 
 	tb_switch_put(sw);
@@ -2078,7 +2072,6 @@ static void remove_unplugged_switch(struct tb_switch *sw)
 	bus_for_each_dev(&tb_bus_type, &sw->dev, NULL, complete_rpm);
 	tb_switch_remove(sw);
 
-	pm_runtime_mark_last_busy(parent);
 	pm_runtime_put_autosuspend(parent);
 
 	put_device(parent);
diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 361fece3d818..fa861567d246 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -53,7 +53,6 @@ static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 	mutex_unlock(&rt->tb->lock);
 
 out:
-	pm_runtime_mark_last_busy(&rt->dev);
 	pm_runtime_put_autosuspend(&rt->dev);
 
 	return ret;
@@ -304,7 +303,6 @@ static ssize_t nvm_authenticate_store(struct device *dev,
 		tb_retimer_unset_inbound_sbtx(rt->port);
 	mutex_unlock(&rt->tb->lock);
 exit_rpm:
-	pm_runtime_mark_last_busy(&rt->dev);
 	pm_runtime_put_autosuspend(&rt->dev);
 
 	if (ret)
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index e9f4186f20f4..44e821444412 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -318,7 +318,6 @@ static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 	mutex_unlock(&sw->tb->lock);
 
 out:
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
@@ -1846,7 +1845,6 @@ static ssize_t authorized_store(struct device *dev,
 
 	pm_runtime_get_sync(&sw->dev);
 	ret = tb_switch_set_authorized(sw, val);
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret ? ret : count;
@@ -2078,7 +2076,6 @@ static ssize_t nvm_authenticate_sysfs(struct device *dev, const char *buf,
 exit_unlock:
 	mutex_unlock(&sw->tb->lock);
 exit_rpm:
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
@@ -3351,7 +3348,6 @@ int tb_switch_add(struct tb_switch *sw)
 	if (sw->rpm) {
 		pm_runtime_set_autosuspend_delay(&sw->dev, TB_AUTOSUSPEND_DELAY);
 		pm_runtime_use_autosuspend(&sw->dev);
-		pm_runtime_mark_last_busy(&sw->dev);
 		pm_runtime_enable(&sw->dev);
 		pm_request_autosuspend(&sw->dev);
 	}
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c14ab1fbeeaf..bd8bfd774345 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1271,7 +1271,6 @@ static void tb_scan_switch(struct tb_switch *sw)
 	tb_switch_for_each_port(sw, port)
 		tb_scan_port(port);
 
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 }
 
@@ -1415,7 +1414,6 @@ static void tb_scan_port(struct tb_port *port)
 
 out_rpm_put:
 	if (port->usb4) {
-		pm_runtime_mark_last_busy(&port->usb4->dev);
 		pm_runtime_put_autosuspend(&port->usb4->dev);
 	}
 }
@@ -1740,9 +1738,7 @@ static void tb_deactivate_and_free_tunnel(struct tb_tunnel *tunnel)
 		 */
 		tb_configure_sym(tb, src_port, dst_port, true);
 		/* Now we can allow the domain to runtime suspend again */
-		pm_runtime_mark_last_busy(&dst_port->sw->dev);
 		pm_runtime_put_autosuspend(&dst_port->sw->dev);
-		pm_runtime_mark_last_busy(&src_port->sw->dev);
 		pm_runtime_put_autosuspend(&src_port->sw->dev);
 		fallthrough;
 
@@ -2046,9 +2042,7 @@ static void tb_tunnel_one_dp(struct tb *tb, struct tb_port *in,
 err_dealloc_dp:
 	tb_switch_dealloc_dp_resource(in->sw, in);
 err_rpm_put:
-	pm_runtime_mark_last_busy(&out->sw->dev);
 	pm_runtime_put_autosuspend(&out->sw->dev);
-	pm_runtime_mark_last_busy(&in->sw->dev);
 	pm_runtime_put_autosuspend(&in->sw->dev);
 }
 
@@ -2508,7 +2502,6 @@ static void tb_handle_hotplug(struct work_struct *work)
 		}
 	}
 
-	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 
 put_sw:
@@ -2516,7 +2509,6 @@ static void tb_handle_hotplug(struct work_struct *work)
 out:
 	mutex_unlock(&tb->lock);
 
-	pm_runtime_mark_last_busy(&tb->dev);
 	pm_runtime_put_autosuspend(&tb->dev);
 
 	kfree(ev);
@@ -2843,7 +2835,6 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 unlock:
 	mutex_unlock(&tb->lock);
 
-	pm_runtime_mark_last_busy(&tb->dev);
 	pm_runtime_put_autosuspend(&tb->dev);
 
 	kfree(ev);
diff --git a/drivers/thunderbolt/usb4_port.c b/drivers/thunderbolt/usb4_port.c
index 852a45fcd19d..4739e92bb46f 100644
--- a/drivers/thunderbolt/usb4_port.c
+++ b/drivers/thunderbolt/usb4_port.c
@@ -200,7 +200,6 @@ static ssize_t offline_store(struct device *dev,
 out_unlock:
 	mutex_unlock(&tb->lock);
 out_rpm:
-	pm_runtime_mark_last_busy(&usb4->dev);
 	pm_runtime_put_autosuspend(&usb4->dev);
 
 	return ret ? ret : count;
@@ -242,7 +241,6 @@ static ssize_t rescan_store(struct device *dev,
 out_unlock:
 	mutex_unlock(&tb->lock);
 out_rpm:
-	pm_runtime_mark_last_busy(&usb4->dev);
 	pm_runtime_put_autosuspend(&usb4->dev);
 
 	return ret ? ret : count;
-- 
2.39.5

