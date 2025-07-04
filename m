Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1059A2F5470
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615710; cv=none; b=sYuKIxjVqZ5IZxuM0rWQ9lHaY1a4p8armoM267ZPyrs51lO7Uby91+YuUsh30mm+wUn+ImBE06f5RwCnrvYb8OnuCaE7btI4hlcbOWVRWlMbbrG67v9XOXDLGpBbxyFinUNh+XxSlfFwhn1pZ63CXVk8tGNwcOE82GDB9DHoVa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615710; c=relaxed/simple;
	bh=OzSsz6xVEE9TXDJejGYjMqpw4PBQB0JITmdRwE01wEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O0LfC6K11o4bCj0lDRL4wGKBTtsTRVRhP+svXd+ELwVd5JB6mOjuSTiL7gu51aXdbFZlAGHHXIkz5ygiYi9WZVRkkM09FdxyEHm25QpKj8tz2vmSPUQvhGc+6Gcgw7tpJKegPPNQ9V0cj+KWkoprZ22A2hH0dZRSNgqMi0/z7DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggCs8naf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggCs8naf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615708; x=1783151708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OzSsz6xVEE9TXDJejGYjMqpw4PBQB0JITmdRwE01wEY=;
  b=ggCs8naffoG91oBSzgumFCY9BZE1E6jhUkrWnr+lRJBjwzDDzmGHoG36
   ROmELFUJKW+e4f+pzw0frG1VUfLlq7/GOaTBywuAAYt2qg5cduT80HCBT
   /nKoE1pR2oDSG8U1XTacuql63u2fbPSJQ+aRnS6nVKp/cdF4wJdOkIbNQ
   FqRYXEtgP2hpViR9kRQv8CZcVShj5nFnOXRxdwHjtSJ/4g46K6tAi3tAv
   wTPRsRVhq0VqOsfOHiWp2Niw9dmUxZMPccBrVTpAhhsDcJwRupZJoUwhJ
   TahL8W/tT494snXjR+FxTjkalbY/3Neq/yUd7cLNygyP7S8ZJ3NhgJsF1
   w==;
X-CSE-ConnectionGUID: uEec2AwWRLyjtHZYOGPXWQ==
X-CSE-MsgGUID: 5XGxR5dxQZmirseYtpqpQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53080627"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="53080627"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:07 -0700
X-CSE-ConnectionGUID: pppj2q5kQwqDK8vpbtRjVA==
X-CSE-MsgGUID: acWbReNfSvOicECSSl+KSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154223146"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:05 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 47D6344433;
	Fri,  4 Jul 2025 10:55:03 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 79/80] mei: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:55:03 +0300
Message-Id: <20250704075503.3223168-1-sakari.ailus@linux.intel.com>
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

 drivers/misc/mei/interrupt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/mei/interrupt.c b/drivers/misc/mei/interrupt.c
index c484f416fae4..d74159811f75 100644
--- a/drivers/misc/mei/interrupt.c
+++ b/drivers/misc/mei/interrupt.c
@@ -229,7 +229,6 @@ static int mei_cl_irq_read_msg(struct mei_cl *cl,
 		cl_dbg(dev, cl, "completed read length = %zu\n", cb->buf_idx);
 		list_move_tail(&cb->list, cmpl_list);
 	} else {
-		pm_runtime_mark_last_busy(dev->dev);
 		pm_request_autosuspend(dev->dev);
 	}
 
@@ -310,7 +309,6 @@ static int mei_cl_irq_read(struct mei_cl *cl, struct mei_cl_cb *cb,
 		return ret;
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_request_autosuspend(dev->dev);
 
 	list_move_tail(&cb->list, &cl->rd_pending);
-- 
2.39.5

