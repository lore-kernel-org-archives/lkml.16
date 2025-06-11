Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D966933E7
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749608299; cv=none; b=IJaBDIbK6nJD5yGok6kxEjvikBspsAMksQBjybCuazVehyBTi1RGDrZKIEKzxPho+gEBB0CRn8w6Zk+L1/iHiwP7AT/N7eEplJi13JvohVx/6Jaenhh8Gl8eGBkv1+z74e86UhOP4jehVgVns/H6fJZQWjKVZE84LXLC3dDi4jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749608299; c=relaxed/simple;
	bh=OJo6yXbg6d0/SdHePUMl0loF5P3GXQTQMLRfUX99cQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fKvMFhXHHRssBBRoIibxATJHkCqSOo+gYExJABdHI4mpkvScTDiW+Npdi/4eCqs799cNdwShiQ2VY+Rtaw9mD30Q1fk6safcoWzTi2EQ65thZ7cBDNq+fv7ZPV5TTsVcu/4bOLXbPTSuBMuEkTsaRb9ri7nm5iCcmmrsbB/NHY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com; spf=pass smtp.mailfrom=jp.fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=JfxCWsCy; arc=none smtp.client-ip=207.54.90.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="JfxCWsCy"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749608297; x=1781144297;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OJo6yXbg6d0/SdHePUMl0loF5P3GXQTQMLRfUX99cQo=;
  b=JfxCWsCy5Tp2ERjvPs1hTKG4hm2f0QbTsP+ps+efNHkObzwYK+ntLG51
   EZTe1+y5nyuI1VVGQBzg0mcCbiopeHbNbqOBdlIVAwnN0h5r0QKDePe2K
   Ft7adqGnNppf+xtIrvguvEP2IBpF2pKlmKTaKwXMrozWbomgpx3IHdnb+
   eiS+JQb+TUOLGIi56kdL6lLsqsnWvFU/CMA5zCDFnRoYuv5yu/AuYLQ4E
   vD19GLZUbHSztne6z0dlB982/PrhDyfRa8iAI06cR8Vbh6sB+88+JZvmL
   9WoR8PcqSnEo4a1j2Zhz1Xc50M8DwQFQqpOm6cf/jWw288VL0VcgiktDp
   Q==;
X-CSE-ConnectionGUID: d7parjerRb+tqAJgXjta3g==
X-CSE-MsgGUID: BHxgfoXzQrWl1vRoll39GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="202305754"
X-IronPort-AV: E=Sophos;i="6.16,226,1744038000"; 
   d="scan'208";a="202305754"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 11:17:06 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1521ED8E64
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:17:03 +0900 (JST)
Received: from oym-om1.fujitsu.com (oym-om1.o.css.fujitsu.com [10.85.58.161])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CB97DD7749
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:17:02 +0900 (JST)
Received: from sm-x86-amd03.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om1.fujitsu.com (Postfix) with ESMTP id 3A5D44007A498;
	Wed, 11 Jun 2025 11:17:00 +0900 (JST)
From: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	James Morse <james.morse@arm.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Martin <dave.martin@arm.com>,
	fenghuay@nvidia.com,
	peternewman@google.com,
	Babu Moger <Babu.Moger@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	shameerali.kolothum.thodi@huawei.com,
	bobo.shaobowang@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	baolin.wang@linux.alibaba.com,
	lcherian@marvell.com,
	amitsinght@marvell.com,
	Ingo Molnar <mingo@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	H Peter Anvin <hpa@zytor.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	dfustini@baylibre.com,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 0/2] x86/resctrl: Optimize some resctrl code
Date: Wed, 11 Jun 2025 11:15:37 +0900
Message-ID: <20250611021547.2766889-1-tan.shaopeng@jp.fujitsu.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Reinette, James, and Yury,

These two patches are just optimizations for the following patches
by James. The behavior has not changed.

https://lore.kernel.org/lkml/aB4jHPsWVNqrSG6W@yury/
https://lore.kernel.org/all/a86e72d1-1a1d-4348-9e2d-34b799571518@arm.com/

Shaopeng Tan (2):
  x86/resctrl: Remove unnecessary cpumask_nth_andnot()
  x86/resctrl: Optimize code in rdt_get_tree()

 fs/resctrl/rdtgroup.c   |  6 ++----
 include/linux/cpumask.h | 16 ----------------
 2 files changed, 2 insertions(+), 20 deletions(-)

-- 
2.43.5

