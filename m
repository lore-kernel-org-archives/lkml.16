Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746D925394A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747328450; cv=none; b=ORAvD9OwRCaOe9EL2X49ksbffh6GG1rUOP+7xo9gsLvKHWKE90+VhbZTnIpXMJiXRpBLxf71qeI1yt2sXH5WWIAqf8fmRINvgwsgF9kiTo+JgH+FhygbwxSBr/ZdFAYSXY21g/zJzFxRhDlZD2Z+T7J4wLqTiEMqkXV4wjpSyzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747328450; c=relaxed/simple;
	bh=TD9xugOi9VlLfIM7a8JmLsAf3d3clKh4YDmEMuT0zDI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B58RmilXPxPGkgPO/AUIv3b2QXWy1e8C8R+bJynLeq9FeoY/Rwg2e7u9hki1xAC88dHlTPuUloPkvbvtyqSeYGIybfpx3i8CAXrkmGPIbCH8zT1l+4Q2ay/pjJpVzwsIDb+bcwJp1Cb96Yk9eldtcAiFAEPMe7hDn42P6+QHOZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28C0A2BC2;
	Thu, 15 May 2025 10:00:35 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 834AB3F63F;
	Thu, 15 May 2025 10:00:43 -0700 (PDT)
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
	Tony Luck <tony.luck@intel.com>,
	Dave Martin <Dave.Martin@arm.com>
Subject: [PATCH v12 25/25] MAINTAINERS: Add reviewers for fs/resctrl
Date: Thu, 15 May 2025 16:58:55 +0000
Message-Id: <20250515165855.31452-26-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250515165855.31452-1-james.morse@arm.com>
References: <20250515165855.31452-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resctrl has existed for quite a while as a filesystem interface private to
arch/x86. To allow other architectures to support the same user interface
for similar hardware features, it has been moved to /fs/.

Add those with a vested interest in the common code as reviewers.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Tony Luck <tony.luck@intel.com>
Acked-by: Reinette Chatre <reinette.chatre@intel.com>
Acked-by: Dave Martin <Dave.Martin@arm.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e54b9019e942..9584c0d493a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20363,6 +20363,8 @@ F:	tools/testing/selftests/net/rds/
 RDT - RESOURCE ALLOCATION
 M:	Tony Luck <tony.luck@intel.com>
 M:	Reinette Chatre <reinette.chatre@intel.com>
+R:	Dave Martin <Dave.Martin@arm.com>
+R:	James Morse <james.morse@arm.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	Documentation/filesystems/resctrl.rst
-- 
2.39.5

