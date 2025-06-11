Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325D72253EE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749614426; cv=none; b=bpyEYu8M9uYJXNEVcd2CI3ycy1brNLEQ6baUto8KV7LJhYJC6wpUXnF1LHqwphLpxK1nJYKsv2clG1Qxa3SvJPYZ99ciFIdYX104T4NJY0JcpEX62Mqc5zU7H5ZsWA/UnaJ+Za3OfLHwBi3buvS2KwhInHLtAg9h+Zgd+vhR+oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749614426; c=relaxed/simple;
	bh=/HowC9kFKFSbycgjpOeF3oDREZHhIxzYt6lJ4cBZjNI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RUDHCl1114pgfxmt3kJ4DnCh2YyvzGCSqwpuSpiisWhZJfwYS44zBivby924hz/zkPjecsdwE0JFVCx6J9bsA0fyaTcNr+T2NCTp51ZxzzqKu6YtnrI/p78ZNOuqCi2PBFzNz19eWNvPkaJ3qq6QrRmMrmcrCxwYln5e9mdb7gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 96e4ef2a467811f0b29709d653e92f7d-20250611
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
X-CID-O-INFO: VERSION:1.1.45,REQID:33854a81-e0e4-4f90-a9e9-a258f50d48e8,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.1.45,REQID:33854a81-e0e4-4f90-a9e9-a258f50d48e8,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:6493067,CLOUDID:502fac82758c66774678d6832cbcfb5d,BulkI
	D:2506101714513QWD9JI0,BulkQuantity:3,Recheck:0,SF:17|19|25|38|45|66|78|81
	|82|102,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: 96e4ef2a467811f0b29709d653e92f7d-20250611
X-User: duanchenghao@kylinos.cn
Received: from localhost.localdomain [(223.104.40.103)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 394699583; Wed, 11 Jun 2025 12:00:19 +0800
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
Subject: [PATCH v1 5/5] LoongArch: BPF: Update the code to rename validate_code to validate_ctx.
Date: Wed, 11 Jun 2025 11:59:52 +0800
Message-Id: <20250611035952.111182-6-duanchenghao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611035952.111182-1-duanchenghao@kylinos.cn>
References: <20250611035952.111182-1-duanchenghao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the code to rename validate_code to validate_ctx.
validate_code is used to check the validity of code.
validate_ctx is used to check both code validity and table entry
correctness.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
---
 arch/loongarch/net/bpf_jit.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index cdcb73f93..ee38a9824 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1177,6 +1177,14 @@ static int validate_code(struct jit_ctx *ctx)
 			return -1;
 	}
 
+	return 0;
+}
+
+static int validate_ctx(struct jit_ctx *ctx)
+{
+	if (validate_code(ctx))
+		return -1;
+
 	if (WARN_ON_ONCE(ctx->num_exentries != ctx->prog->aux->num_exentries))
 		return -1;
 
@@ -1285,7 +1293,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	build_epilogue(&ctx);
 
 	/* 3. Extra pass to validate JITed code */
-	if (validate_code(&ctx)) {
+	if (validate_ctx(&ctx)) {
 		bpf_jit_binary_free(header);
 		prog = orig_prog;
 		goto out_offset;
-- 
2.25.1

