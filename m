Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373B31D61A3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749614415; cv=none; b=JHIGUzZq+jSKqYp5OX25FuD4I5ip9I8ZsyMetrR3mLuEggD3jxOSWD/iN5mhkqvHiaPKGmowzin7GbJmdPQCnhDadTx2aVuMMNe8fNL9Y1Az6WmSO7XSx//gUWEuoe6jA1gI6AXXIV3KhKN/8+K8Ozg+3NygEjIZnyWkpCWr714=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749614415; c=relaxed/simple;
	bh=rhu5cC4ghVBpa9vn/6ZN4Nc/bR6KUWlM03H+8o/sF60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U1KNqjIPiqCng82WGOCfeWHzzAamDO+WDp/aNAQZHeZ1oVT97tRar2XOq9D9sBSp5/ZP4xzAJOKQyttZ8hiaSLmtNbhrS7UtICPAP4GJUQKdspo4ZneYBa5V88pIlPwjCEWSPzc1uLvWUPfInth+5De9XKU2oUs6WbypmP9YZSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8fd1bd76467811f0b29709d653e92f7d-20250611
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_DIGIT_LEN
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP, DN_TRUSTED
	SRC_TRUSTED, SA_EXISTED, SN_UNTRUSTED, SN_UNFAMILIAR, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD
	AMN_C_TI, AMN_C_BU, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:1cfe3516-2fb8-4f97-81b5-b482af2bb543,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.1.45,REQID:1cfe3516-2fb8-4f97-81b5-b482af2bb543,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:6493067,CLOUDID:58c2d1ee552dfe9c43982710503f523b,BulkI
	D:250610171445IFDGA2P6,BulkQuantity:4,Recheck:0,SF:17|19|25|38|45|66|78|10
	2,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 8fd1bd76467811f0b29709d653e92f7d-20250611
X-User: duanchenghao@kylinos.cn
Received: from localhost.localdomain [(223.104.40.103)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 684370023; Wed, 11 Jun 2025 12:00:07 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	yangtiezhu@loongson.cn,
	hengqi.chen@gmail.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org
Cc: guodongtai@kylinos.cn,
	duanchenghao@kylinos.cn,
	youling.tang@linux.dev,
	jianghaoran@kylinos.cn
Subject: [PATCH v1 0/5] Support trampoline for LoongArch
Date: Wed, 11 Jun 2025 11:59:47 +0800
Message-Id: <20250611035952.111182-1-duanchenghao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1: Support trampoline for LoongArch. The following feature tests
have been completed:
1. fentry
2. fexit
3. fmod_ret

TODO: The support for the struct_ops feature will be provided in
subsequent patches.

Chenghao Duan (4):
  LoongArch: BPF: The operation commands needed to add a trampoline
  LoongArch: BPF: Add bpf_arch_text_poke support for Loongarch
  LoongArch: BPF: Add bpf trampoline support for Loongarch
  LoongArch: BPF: Update the code to rename validate_code to
    validate_ctx.

George Guo (1):
  LoongArch: Support fixmap

 arch/loongarch/include/asm/fixmap.h |   2 +
 arch/loongarch/include/asm/inst.h   |  19 ++
 arch/loongarch/kernel/inst.c        |  85 +++++
 arch/loongarch/kernel/setup.c       |   1 +
 arch/loongarch/mm/init.c            | 111 ++++++-
 arch/loongarch/net/bpf_jit.c        | 497 +++++++++++++++++++++++++++-
 arch/loongarch/net/bpf_jit.h        |   6 +
 7 files changed, 714 insertions(+), 7 deletions(-)

Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>

-- 
2.25.1

