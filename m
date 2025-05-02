Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825F62580EA;
	Fri,  2 May 2025 16:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202388; cv=none; b=DBRwEk4fmvAoMP6zH+doRzvr3vGuqK3/syvSCFbeFvaEf0br1LVjmLlv8pxEQSVvaszEQIcYaat5UmT8hcf+GQJO3NZUO1z5cOK77jLkSb1qEVlxqxr98nNU1NvQ3pm1CLcrqnW+iKG2zVp8sykh18QFXfPZm8a5qJAnN7m1RG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202388; c=relaxed/simple;
	bh=O42FzXmVIrNxY2NIxyW0vI1kl2XusvAI3zplmRlwZ5U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sMPCYWZAkUGeABedxXuyC6Xavf/mnSb4DYtYbh+prmuEo/php5YLymQxGiEFvAgDathRejc/X2JmX7siF30AkOC2k45jfyuXf4OOGVaDIBmgzJltZTUa2kZiGZ8/a0m6C3pnh5mlwa8PMcBAdxc577ZUzZtXN3K1O0B4g19dl6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zpwp058kKz6M4Tp;
	Sat,  3 May 2025 00:08:40 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id EB3491402F8;
	Sat,  3 May 2025 00:13:03 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.77.180) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 18:13:03 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>
CC: <robh@kernel.org>, <jonathan.cameron@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v2 0/6] DT: Enable sharing resources for SMT threads
Date: Fri, 2 May 2025 17:12:54 +0100
Message-ID: <20250502161300.1411-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 frapeml500003.china.huawei.com (7.182.85.28)

This patchset allows for sharing resources between SMT threads in the
device tree (DT).

WHY? Given the current use of the DT, it is not possible to share L1
caches, as well as other resources such as clock among SMT threads.
However, DT spec in section Section 3.8.1 [1], describes how SMT threads
can be described in the reg array, this is how PowerPC describes SMT
threads in DT.

CHALLENGE: Given discussions with the community [2], it was apparent
that it is not straightforward to implement this, since cpu-maps must
point to a particular CPU node in DT [3], Section 2.1. However, it is
not only the cpu-map but also there other nodes that point to cpu nodes
which indeed need care and changes.

SOLUTION: This led to more discussions on what the solution should look
like and based on recent conversations we ended up with the following
approach [4].

core0 {
  thread0 {
    cpu = <&cpu0 0>;
  };
  thread1 {
    cpu = <&cpu0 1>;
  };
};

In this layout, first parameter is the phandle to cpu-node and second
index would be the local-thread index in the reg array available in the
cpu-node reg property.

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf
[2] https://lore.kernel.org/linux-arm-kernel/Z4FJZPRg75YIUR2l@J2N7QTR9R3/
[3] https://www.kernel.org/doc/Documentation/devicetree/bindings/cpu/cpu-topology.txt
[4] https://lore.kernel.org/devicetree-spec/CAL_JsqK1yqRLD9B+G7UUp=D8K++mXHq0Rmv=1i6DL_jXyZwXAw@mail.gmail.com/

PRIOR VERSIONs:
   [V1] https://lore.kernel.org/all/20250422084340.457-1-alireza.sanaee@huawei.com/

CHANGE LOG:
    V1 -> V2:
        * Address Rob's comments.
            ** Re-order patches.
            ** Fix bugs.
        * Remove #cpu-cells property

Alireza Sanaee (6):
  of: add infra for finding CPU id from phandle
  arch_topology: update CPU map to use the new API
  coresight: cti: Use of_cpu_phandle_to_id for grabbing CPU id
  coresight: Use of_cpu_phandle_to_id for grabbing CPU id
  arm64: of: handle multiple threads in ARM cpu node
  of: of_cpu_phandle_to_id to support SMT threads

 arch/arm64/kernel/smp.c                       | 74 ++++++++++---------
 drivers/base/arch_topology.c                  | 12 +--
 .../coresight/coresight-cti-platform.c        | 15 +---
 .../hwtracing/coresight/coresight-platform.c  | 14 +---
 drivers/of/cpu.c                              | 51 +++++++++++++
 include/linux/of.h                            |  8 ++
 6 files changed, 111 insertions(+), 63 deletions(-)

-- 
2.34.1

