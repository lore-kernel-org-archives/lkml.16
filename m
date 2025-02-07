Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EE81B0406
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952467; cv=none; b=EQkF3E8+j4qNAVZI0y38WsLhyfvOfaXIA1/ClUpMtAkPQU+jdSHWJWUoUxzYUa5hiSqFq1QDyu74NYXRprf2CAK+f/aJQvFvEF9V7tCjdvs4xzUOmogN5WctQ6EkNRGeeBAeoQU4wiOSAycNV6j89c73tUeJPLmWd1xF90vUjes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952467; c=relaxed/simple;
	bh=bSZe2tYIuGD8/wvdm2g+bqwvqyMzjm15qeM8dYVqIbk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sw/0h+LraTYrPX3KXVs2zBxWeFfqoF9AgyS2KoWE3SdCM6lJBqQrwYTK9S6DPPX/EjLyLIz8kdCw0HOR1pKZEMF7dJDBM/2ddVDj7imdpic4OuHYtSH2NxEqEUbPH13hgvtULEm+mZVDRXWpIgUXUsR8Nfpu2KMTeJ68IFwa90w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEB001F60;
	Fri,  7 Feb 2025 10:21:19 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0D573F63F;
	Fri,  7 Feb 2025 10:20:53 -0800 (PST)
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
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v6 38/42] x86/resctrl: Remove a newline to avoid confusing the code move script
Date: Fri,  7 Feb 2025 18:18:19 +0000
Message-Id: <20250207181823.6378-39-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250207181823.6378-1-james.morse@arm.com>
References: <20250207181823.6378-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The resctrl filesystem code will shortly be moved to /fs/. This involves
splitting all the existing files, with some functions remaining under
arch/x86, and others moving to fs/resctrl.

To make this reproducible, a python script does the heavy lif^W
copy-and-paste. This involves some clunky parsing of C code.

The parser gets confused by the newline after this #ifdef.
Just remove it.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index abebe01447ba..ebf17bcbd095 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -892,7 +892,6 @@ static int rdtgroup_rmid_show(struct kernfs_open_file *of,
 }
 
 #ifdef CONFIG_PROC_CPU_RESCTRL
-
 /*
  * A task can only be part of one resctrl control group and of one monitor
  * group which is associated to that control group.
-- 
2.39.2

