Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9A3E545
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503446; cv=none; b=IPhrWKGRKuVNXueBtaZWl4HJqMFRPdzZFSYEBiLj5w774tacXg/4Bge+gRKx8plJSSWNBGOZ3ELfI/JorVc49B8DDW9N0iRdaboa3i5JPOZvZt+90syJeXjiR3urAaUXmaV4dBKb9Ix0zG7g5TN1J4FET8WkfPegKOr6/k14FL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503446; c=relaxed/simple;
	bh=DbkXLLMiBk0YrHxa0nSuY06ZZogYG6FMv64IFAM7UnQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K5cQEbfxGkDh5P78nPnK6aZJOpZJbW9gnUzRIMq3YCEJ56KnCtZYExUrmdPMrU1F6HjNtdKKwfX3VV0y5JilTF4VVzpd+xCc92D6RI0kxdLanv/AzHDfHf5WKCKdqNCA8bwMRgBWpYVM2JV3s1p/ALxBXVrsUD2aiJ/eEOgWv9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ZjyQP6592z27hWM;
	Thu, 24 Apr 2025 22:04:29 +0800 (CST)
Received: from kwepemg200012.china.huawei.com (unknown [7.202.181.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 638BB1402CD;
	Thu, 24 Apr 2025 22:03:46 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemg200012.china.huawei.com (7.202.181.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Apr 2025 22:03:45 +0800
From: xieyuanbin1 <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <liaohua4@huawei.com>, <lincheng8@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nixiaoming@huawei.com>, <sfr@canb.auug.org.au>, <wangbing6@huawei.com>,
	<wangfangpeng1@huawei.com>, <will@kernel.org>, <xieyuanbin1@huawei.com>
Subject: RE: [PATCH] ARM: spectre-v2: fix unstable cpu get
Date: Thu, 24 Apr 2025 22:03:30 +0800
Message-ID: <20250424140330.42007-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aApBpnDcq2KNkfAs@shell.armlinux.org.uk>
References: <aApBpnDcq2KNkfAs@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemg200012.china.huawei.com (7.202.181.63)

From: Xie Yuanbin <xieyuanbin1@huawei.com>

>Consider your test program running on CPU 1 which requires fixup. It
>takes a fault, and before we enter harden_branch_predictor(), we end
>up being migrated to CPU 0, but doesn't require a switch of the MM.
>Let's say we then disable preemption and then call
>harden_branch_predictor(), and then restore the preemption state.
>The thread then gets migrated back to CPU 1. Again, no switch of
>the MM.

Your assumption is correct, and I agree with it.

>I don't care if this disrupts test tooling. The trade off between
>test tooling having a problem and a silent data leak through this
>channel... the answer is pretty obvious that the test tooling
>failing is less important than having a silent data leak.

I have never mentioned a test tool, and I agree with you.
The problem I mentioned before is possible illegal instruction and panic.



If we want to fix this problem without affecting performance,
can we add a new hook functions (in fsr-3level.c)?

I don't know much about the details of the ARM manual,
Are all user-mode access to kernel-mode addresses are `permission fault`
and common page faults (hot code) are `access flag fault`?
If so, we can add a new hook function to deal with `permission fault`
and set it in fsr-3level.c.
This means we fix the problem without adding a branch,
that there is no performance loss.

Otherwise, we can only add condition judgment before enabling irq,
which means that performance loss occurs. This is so sad. :(
