Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931DE29ACC0;
	Thu,  3 Jul 2025 07:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529267; cv=none; b=pFfqaEsjU0bE/P5T5WhXfZRl8seotJk/EobcCjH0AslBk/toKZxy3afOejtCMuCN5uwjbse43P4G83TXYgRYgQctSR1XSAD8pg65pz89H/QMjc1RPJpD2TkemuPbnbPmB9SYUJ3BKKI8S0mPewzEcWn3eOrqv4hD2lb1EBu5CeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529267; c=relaxed/simple;
	bh=wB248XFhoruLv2hXsqFHt0KOVmGl+I8VLzhwYy1ej+0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eKEzSdovK6vUG2TWDDmYqPvuU9yIT1mPuzZUk2DsCDiOUbkLJZ9/illnweKVtjuGeRbcuheovlE0p2Zl9UfQoEF1V7XNWUtaRz8WyF0iiTdRj8oW/+hIwM2fP1RyYMfMq49iHFJBPaWwlrOtBkOLN6SbQ+2QNnoYCeuTOSFmbrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bXppN3nZJz1GCFM;
	Thu,  3 Jul 2025 15:50:20 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id DD27F1400D1;
	Thu,  3 Jul 2025 15:54:21 +0800 (CST)
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 3 Jul 2025 15:54:21 +0800
Received: from localhost.localdomain (10.175.104.82) by
 kwepemq200002.china.huawei.com (7.202.195.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 3 Jul 2025 15:54:20 +0800
From: Dong Chenchen <dongchenchen2@huawei.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <jiri@resnulli.us>,
	<oscmaes92@gmail.com>, <linux@treblig.org>, <pedro.netdev@dondevamos.com>,
	<idosch@idosch.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<zhangchangzhong@huawei.com>
Subject: [PATCH net v2 0/2] net: vlan: fix VLAN 0 refcount imbalance of toggling filtering during runtime
Date: Thu, 3 Jul 2025 15:57:00 +0800
Message-ID: <20250703075702.1063149-1-dongchenchen2@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200002.china.huawei.com (7.202.195.90)

Fix VLAN 0 refcount imbalance of toggling filtering during runtime.

v2:
	Add auto_vid0 flag to track the refcount of vlan0 
	Add selftest case for vlan_filter

Dong Chenchen (2):
  net: vlan: fix VLAN 0 refcount imbalance of toggling filtering during
    runtime
  selftests: Add test cases for vlan_filter modification during runtime

 net/8021q/vlan.c                              | 42 ++++++--
 net/8021q/vlan.h                              |  1 +
 tools/testing/selftests/net/vlan_hw_filter.sh | 98 ++++++++++++++++---
 3 files changed, 120 insertions(+), 21 deletions(-)

-- 
2.25.1

