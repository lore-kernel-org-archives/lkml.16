Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6372C033B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747156640; cv=none; b=L/SKaVM6g7xIPZIE+zOTBsa/6hlr3y8z0ccZESHi/vAQDeIyDIzCE0XYfshDsiSeCrJkVkMuMLHsJLd6PYRXTfSjtnK8UnDuX3F1Uq4OlXnDiBqGkdVHmGcjeiYRkqrdkKD5ScNOiCJ/Umz1S3jTO+f/uQSwQDNKbCLeKtw6VYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747156640; c=relaxed/simple;
	bh=kCfjAWwOcjkww2BzhBLdV4nKQV1zocz1R4YNppI587c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vp+GVQeukfPOL75YxnfD9QraQ+VlKm6BOavNFNrLN4XDCavkOHVyMih4bHFXX+UVrr7ET8cf+sidI8v0iHbS2n244Dud0OfuZTSA3KwcrdrCAjLjuoKmvt61c2Cf4Xp020djN35z0PgD9wjbefAtJ/nMwKB0SJJOcua+GY6K00M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED51C2A68;
	Tue, 13 May 2025 10:17:06 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C1C63F63F;
	Tue, 13 May 2025 10:17:14 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>,
	Babu Moger <Babu.Moger@amd.com>,
	James Morse <james.morse@arm.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	Babu Moger <babu.moger@amd.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v11 14/30] x86/resctrl: Add 'resctrl' to the title of the resctrl documentation
Date: Tue, 13 May 2025 17:15:31 +0000
Message-Id: <20250513171547.15194-15-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250513171547.15194-1-james.morse@arm.com>
References: <20250513171547.15194-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The resctrl documentation is titled "User Interface for Resource Control
feature".

Once the documentation follows the code in a move to the filesystem, this
appears in the list of filesystems, but doesn't contain the name of the
filesystem, making it hard to find.

Add 'resctrl' to the title.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Babu Moger <babu.moger@amd.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
---
Changes since v9:
 * Fixed typs in tags.

Changes since v8:
 * This patch is new.
---
 Documentation/arch/x86/resctrl.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 6768fc1fad16..c7949dd44f2f 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -1,9 +1,9 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: <isonum.txt>
 
-===========================================
-User Interface for Resource Control feature
-===========================================
+=====================================================
+User Interface for Resource Control feature (resctrl)
+=====================================================
 
 :Copyright: |copy| 2016 Intel Corporation
 :Authors: - Fenghua Yu <fenghua.yu@intel.com>
-- 
2.39.5

