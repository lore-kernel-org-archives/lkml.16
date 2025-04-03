Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C62D207E04
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707809; cv=none; b=IhRdI66xUULVMEqDjJuuMjhpXjJ9OioWJYplBFb/1cnnDWL4b4k0GixygUsp6NAErvcSJcYqef/2kFWjREhtN++zdrY+Ua3taff6pUez9BfiKVF3yUOV/wR8ZLDCYlXvD/5JFi/WihtGjFO8qbSIeIjeznkqykmJD/Qtec3Sm7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707809; c=relaxed/simple;
	bh=kfq19xkFo44X3w51oEUVctdeLAAF+6ExI0fvKFalsKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiAQX7zEhoeWhOU+2yM4aTiqGeEo5Rz2VsZRSB5VoRg9Qk8HCNaW/z8UYD3sKGs3+x0g0qBE46fJmIutkpCi9KMS4Bp6D4NT78D2m9Q0wyQQe3oRfwekiZ5MgXVOnWahJ2STCAnbgW94uhodasx/amDndPlrofn1tvDCc1345Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2QqCsL1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2QqCsL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743707807; x=1775243807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kfq19xkFo44X3w51oEUVctdeLAAF+6ExI0fvKFalsKM=;
  b=P2QqCsL1zJ0TMD3vAQ5V5GaGT1KmhqyZX3qNUpZNkP7TtvM+O0uiC3lZ
   WxJ0rcqtezWDm3GRMWa36BTY9nRMsbQLuwMKLTPesvBVYsAD5fRfkuWbx
   7zACWLlyrbeau5kzNKBWZiR+rCNLg1dl33Rm6WfltzEgstprs+jPAvdC3
   mKVVglxBTqfS9JqJqzG4h27iEbVrqP9v2q38MWKJU+mkNLtdaAj+bj60L
   EvXHDQbFSVRAPYhJCA1DQCu+44106a/z7oKRrpNHw4pWgDL9vJ7zO8q3X
   JlZRAE/wzNeG84PDGGD1/UB/ufxNLR/OyGeFc99z9IER98Ob2v0Tao0im
   w==;
X-CSE-ConnectionGUID: Sno45aYAS0OXF0+v8I+1IQ==
X-CSE-MsgGUID: TvVqC3mhR4qz0POUYXSnoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="48929651"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="48929651"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 12:16:46 -0700
X-CSE-ConnectionGUID: NAk3enbYSUG3x2w/DnkXkg==
X-CSE-MsgGUID: 5jaFhJvgSreRkVUpFrgjzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="127382576"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.70])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 12:16:46 -0700
Date: Thu, 3 Apr 2025 12:16:44 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
Subject: Re: [PATCH v7 37/49] x86/resctrl: Expand the width of dom_id by
 replacing mon_data_bits
Message-ID: <Z-7enNN7bxHmf8T6@agluck-desk3>
References: <20250228195913.24895-1-james.morse@arm.com>
 <20250228195913.24895-38-james.morse@arm.com>
 <e1816cbf-e2a7-44cf-92f9-bbd24d9e264b@intel.com>
 <a54fe3e7-19cb-4f84-9189-f0e3853e98fe@arm.com>
 <9e47d037-a47c-4869-8ac1-2ab151608b08@intel.com>
 <Z-H-VesKknnUMmpb@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-H-VesKknnUMmpb@agluck-desk3>

On Mon, Mar 24, 2025 at 05:52:37PM -0700, Luck, Tony wrote:
> On Thu, Mar 13, 2025 at 08:25:08AM -0700, Reinette Chatre wrote:
> > Hi James,
> > 
> > On 3/12/25 11:04 AM, James Morse wrote:
> > > On 07/03/2025 05:03, Reinette Chatre wrote:
> > >> On 2/28/25 11:59 AM, James Morse wrote:
> > 
> > ...
> > 
> > >> With all of the above I do not think this will work on an SNC enabled
> > >> system ... to confirm this I tried it out and it is not possible to mount
> > >> resctrl on an SNC enabled system and the WARN_ON_ONCE() this patch adds to
> > >> mon_add_all_files() is hit.
> > > 
> > > I hadn't realised the mon_sub directories for SNC weren't all directly under mon_data.
> > > Searching from mon_data will need the parent name too. What I've come up with is:
> > > -------%<-------
> > > 	snc_mode = r->mon_scope == RESCTRL_L3_NODE;
> > > 	if (!snc_mode) {
> > > 		sprintf(name, "mon_%s_%02d", r->name, d->hdr.id);
> > > 		kn_target_dir = kernfs_find_and_get(kn_mondata, name);
> > > 	} else {
> > > 		sprintf(name, "mon_%s_%02d", r->name, d->ci->id);
> > > 		kn_target_dir = kernfs_find_and_get(kn_mondata, name);
> > > 
> > > 		if (snc_mode && !do_sum) {
> > 
> > snc_mode should always be true here?
> > 
> > > 			sprintf(name, "mon_sub_%s_%02d", r->name, d->hdr.id);
> > > 			kernfs_put(kn_target_dir);
> > 
> > I think this needs some extra guardrails. If kn_target_dir is NULL here
> > it looks like that the kernfs_put() above will be fine, but from what I can tell
> > the kernfs_find_and_get() below will not be.
> > 
> > > 			kn_target_dir = kernfs_find_and_get(kn_target_dir, name);
> > > 		}
> > > 	}
> > > 	kernfs_put(kn_target_dir);
> > > 	if (!kn_target_dir)
> > > 		return NULL;
> > > -------%<-------
> > > 
> > 
> > This looks good to me. In original patch a NULL kn within mon_get_default_kn_priv()
> > was used as prompt to create the private data. It is thus not obvious to me from this
> > snippet what is being returned "to", but I do not think that was your point of sharing
> > this snippet. 
> 
> Is this all overly complex trying to re-use the "priv" fields from
> the default resctrl group?  Would it be easier to just keep a list
> of each combinations of region id, domain id, sum, and event id that have
> already been allocated and re-use existing ones, or add to the list
> for new ones. Scanning this list may be less overhead that all the
> sprintf() and kernfs_find_and_get() searches.

James,

I played around with the simplification some more and tested on both
normal and SNC systems. Below is a patch against:
 
git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v7

Note that this is *after* the move to fs/resctrl as I was too chicken
to try applying this before the move and then re-run the script to
move things. But if you take this suggestion, just mash it into your
"Expand the width of dom_id by replacing mon_data_bits" patch.
Maybe give me Co-developed-by credit, but that's not important.

Note that your expansion of mon_data is going to be very useful going
forward.  I want to add extra information to struct mon_data:

1) Flag to note that an event counter can be read from any CPU, not
just the ones in the domain specified by the mon_data/mon_L3_XX/*
file.

2) Type field to specify how to display the value of each counter
(since I want floating point instead of integer for the energy
counters).

-Tony


From e2689c7439572608ce03a525c71c3fb88379057c Mon Sep 17 00:00:00 2001
From: Tony Luck <tony.luck@intel.com>
Date: Thu, 3 Apr 2025 10:53:55 -0700
Subject: [PATCH] fs/resctrl: Simplify allocation of mon_data structures

Instead of making a special case to allocate and attach these structures
to kernfs files in the default control group, simply allocate a structure
when a new combination of <rid, domain, mevt, do_sum> is needed and
re-use existing structures when possible.

Free all structures when resctrl filesystem is unmounted.

Partial revert of commit fa563b5171e9 ("x86/resctrl: Expand the width
of dom_id by replacing mon_data_bits")

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 fs/resctrl/internal.h |   2 +
 fs/resctrl/rdtgroup.c | 138 ++++++++++++------------------------------
 2 files changed, 40 insertions(+), 100 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index ec3863d18f68..e5976bd52a35 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -83,6 +83,7 @@ struct mon_evt {
 
 /**
  * struct mon_data - Monitoring details for each event file.
+ * @list:            List of all allocated structures.
  * @rid:             Resource id associated with the event file.
  * @evtid:           Event id associated with the event file.
  * @sum:             Set when event must be summed across multiple
@@ -96,6 +97,7 @@ struct mon_evt {
  * rdtgroup_mutex.
  */
 struct mon_data {
+	struct list_head list;
 	unsigned int rid;
 	enum resctrl_event_id evtid;
 	unsigned int sum;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 234ec9dbe5b3..4ec40850752a 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -69,6 +69,8 @@ static int rdtgroup_setup_root(struct rdt_fs_context *ctx);
 
 static void rdtgroup_destroy_root(void);
 
+static void mon_put_kn_priv(void);
+
 struct dentry *debugfs_resctrl;
 
 /*
@@ -2873,6 +2875,7 @@ static void rdt_kill_sb(struct super_block *sb)
 		resctrl_arch_reset_all_ctrls(r);
 
 	rmdir_all_sub();
+	mon_put_kn_priv();
 	rdt_pseudo_lock_release();
 	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
 	schemata_list_destroy();
@@ -2895,107 +2898,54 @@ static struct file_system_type rdt_fs_type = {
 	.kill_sb		= rdt_kill_sb,
 };
 
+static LIST_HEAD(kn_priv_list);
+
 /**
- * mon_get_default_kn_priv() - Get the mon_data priv data for this event from
- *                             the default control group.
+ * mon_get_kn_priv() - Get the mon_data priv data for this event
  * Called when monitor event files are created for a domain.
- * When called with the default control group, the structure will be allocated.
- * This happens at mount time, before other control or monitor groups are
- * created.
- * This simplifies the lifetime management for rmdir() versus domain-offline
- * as the default control group lives forever, and only one group needs to be
- * special cased.
+ * The same values are used in multiple directories. Keep a list
+ * of allocated structures and re-use an existing one with the same
+ * list of values for rid, domain, etc.
  *
- * @r:      The resource for the event type being created.
- * @d:	    The domain for the event type being created.
- * @mevt:   The event type being created.
- * @rdtgrp: The rdtgroup for which the monitor file is being created,
- *          used to determine if this is the default control group.
- * @do_sum: Whether the SNC sub-numa node monitors are being created.
+ * @rid:	The resource for the event type being created.
+ * @domid:	The domain for the event type being created.
+ * @mevt:	The event type being created.
+ * @do_sum:	Whether the SNC sub-numa node monitors are being created.
  */
-static struct mon_data *mon_get_default_kn_priv(struct rdt_resource *r,
-						struct rdt_mon_domain *d,
-						struct mon_evt *mevt,
-						struct rdtgroup *rdtgrp,
-						bool do_sum)
+static struct mon_data *mon_get_kn_priv(int rid, int domid, struct mon_evt *mevt, bool do_sum)
 {
-	struct kernfs_node *kn_dom, *kn_evt;
 	struct mon_data *priv;
-	bool snc_mode;
-	char name[32];
 
-	lockdep_assert_held(&rdtgroup_mutex);
-
-	snc_mode = r->mon_scope == RESCTRL_L3_NODE;
-	if (!do_sum)
-		sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci->id : d->hdr.id);
-	else
-		sprintf(name, "mon_sub_%s_%02d", r->name, d->hdr.id);
-
-	kn_dom = kernfs_find_and_get(kn_mondata, name);
-	if (!kn_dom)
-		return NULL;
-
-	kn_evt = kernfs_find_and_get(kn_dom, mevt->name);
-
-	/* Is this the creation of the default groups monitor files? */
-	if (!kn_evt && rdtgrp == &rdtgroup_default) {
-		priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-		if (!priv)
-			return NULL;
-		priv->rid = r->rid;
-		priv->domid = do_sum ? d->ci->id : d->hdr.id;
-		priv->sum = do_sum;
-		priv->evtid = mevt->evtid;
-		return priv;
+	list_for_each_entry(priv, &kn_priv_list, list) {
+		if (priv->rid == rid && priv->domid == domid &&
+		    priv->sum == do_sum && priv->evtid == mevt->evtid)
+			return priv;
 	}
 
-	if (!kn_evt)
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		return NULL;
 
-	return kn_evt->priv;
+	priv->rid = rid;
+	priv->domid = domid;
+	priv->sum = do_sum;
+	priv->evtid = mevt->evtid;
+	list_add_tail(&priv->list, &kn_priv_list);
+
+	return priv;
 }
 
 /**
- * mon_put_default_kn_priv_all() - Potentially free the mon_data priv data for
- *                                 all events from the default control group.
- * Put the mon_data priv data for all events for a particular domain.
- * When called with the default control group, the priv structure previously
- * allocated will be kfree()d. This should only be done as part of taking a
- * domain offline.
- * Only a domain offline will 'rmdir' monitor files in the default control
- * group. After domain offline releases rdtgrp_mutex, all references will
- * have been removed.
- *
- * @rdtgrp:  The rdtgroup for which the monitor files are being removed,
- *           used to determine if this is the default control group.
- * @name:    The name of the domain or SNC sub-numa domain which is being
- *           taken offline.
+ * mon_put_kn_priv() - Free all allocated mon_data structures
+ * Called when resctrl file system is unmounted.
  */
-static void mon_put_default_kn_priv_all(struct rdtgroup *rdtgrp, char *name)
+static void mon_put_kn_priv(void)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-	struct kernfs_node *kn_dom, *kn_evt;
-	struct mon_evt *mevt;
+	struct mon_data *priv, *tmp;
 
-	lockdep_assert_held(&rdtgroup_mutex);
-
-	if (rdtgrp != &rdtgroup_default)
-		return;
-
-	kn_dom = kernfs_find_and_get(kn_mondata, name);
-	if (!kn_dom)
-		return;
-
-	list_for_each_entry(mevt, &r->evt_list, list) {
-		kn_evt = kernfs_find_and_get(kn_dom, mevt->name);
-		if (!kn_evt)
-			continue;
-		if (!kn_evt->priv)
-			continue;
-
-		kfree(kn_evt->priv);
-		kn_evt->priv = NULL;
+	list_for_each_entry_safe(priv, tmp, &kn_priv_list, list) {
+		kfree(priv);
+		list_del(&priv->list);
 	}
 }
 
@@ -3029,16 +2979,12 @@ static void mon_rmdir_one_subdir(struct rdtgroup *rdtgrp, char *name, char *subn
 	if (!kn)
 		return;
 
-	mon_put_default_kn_priv_all(rdtgrp, name);
-
 	kernfs_put(kn);
 
-	if (kn->dir.subdirs <= 1) {
+	if (kn->dir.subdirs <= 1)
 		kernfs_remove(kn);
-	} else {
-		mon_put_default_kn_priv_all(rdtgrp, subname);
+	else
 		kernfs_remove_by_name(kn, subname);
-	}
 }
 
 /*
@@ -3081,7 +3027,7 @@ static int mon_add_all_files(struct kernfs_node *kn, struct rdt_mon_domain *d,
 		return -EPERM;
 
 	list_for_each_entry(mevt, &r->evt_list, list) {
-		priv = mon_get_default_kn_priv(r, d, mevt, prgrp, do_sum);
+		priv = mon_get_kn_priv(r->rid, do_sum ? d->ci->id : d->hdr.id, mevt, do_sum);
 		if (WARN_ON_ONCE(!priv))
 			return -EINVAL;
 
@@ -3165,17 +3111,9 @@ static void mkdir_mondata_subdir_allrdtgrp(struct rdt_resource *r,
 	struct rdtgroup *prgrp, *crgrp;
 	struct list_head *head;
 
-	/*
-	 * During domain-online create the default control group first
-	 * so that mon_get_default_kn_priv() can find the allocated structure
-	 * on subsequent calls.
-	 */
-	mkdir_mondata_subdir(kn_mondata, d, r, &rdtgroup_default);
-
 	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
 		parent_kn = prgrp->mon.mon_data_kn;
-		if (prgrp != &rdtgroup_default)
-			mkdir_mondata_subdir(parent_kn, d, r, prgrp);
+		mkdir_mondata_subdir(parent_kn, d, r, prgrp);
 
 		head = &prgrp->mon.crdtgrp_list;
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list) {
-- 
2.48.1

