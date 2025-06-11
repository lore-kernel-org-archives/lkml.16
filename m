Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054EEEAF9
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749614295; cv=none; b=oNVr3HO/E25+owHICsUbPXKkO4nhkABFX9okj40n591chxLVK+VBjYyqzW2JdYqVNEvPFAVMrPvId6kVuzA//Cf590UWnQdqS+A2rns1QHGoBA3jxMFqQKCzN60Ys35osDOsbkh6lzhXzLaYzcO8uFHV5a1GS5+Azje+Q0oPaHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749614295; c=relaxed/simple;
	bh=rhu5cC4ghVBpa9vn/6ZN4Nc/bR6KUWlM03H+8o/sF60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aejBpI08eLW8yMsx92sAePmKuTwAQbj5HqbYHHIGJPK8i6K7eCqZtoifJ8pXRV4KGDOQSzwglQQ6aCaK5+uEEQY+WtHdxbjFxts3aAINl4rM5KOpm8wBL4ih8ZoEofDqmgMK77StYGYdhzHR/VbuKq8X0XpFHZuNVcV9Z1u6zBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 44b975b8467811f0b29709d653e92f7d-20250611
X-CTIC-Tags:
	HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP
	DN_TRUSTED, SRC_TRUSTED, SA_EXISTED, SN_UNTRUSTED, SN_UNFAMILIAR
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_T1
	AMN_GOOD, AMN_C_TI, AMN_C_BU, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:84eba28e-0853-4b65-8d08-6309ca01b988,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.1.45,REQID:84eba28e-0853-4b65-8d08-6309ca01b988,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:6493067,CLOUDID:c3055b5b53bd2229661cf11d8646a8db,BulkI
	D:250610171445IFDGA2P6,BulkQuantity:3,Recheck:0,SF:17|19|25|45|66|78|102,T
	C:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 44b975b8467811f0b29709d653e92f7d-20250611
X-User: duanchenghao@kylinos.cn
Received: from localhost.localdomain [(223.104.40.103)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 663439612; Wed, 11 Jun 2025 11:58:01 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: linux-kernel@vger.kernel.org
Cc: Chenghao Duan <duanchenghao@kylinos.cn>
Subject: [PATCH v1 0/5] Support trampoline for LoongArch
Date: Wed, 11 Jun 2025 11:57:57 +0800
Message-Id: <20250611035757.106636-1-duanchenghao@kylinos.cn>
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

