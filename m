Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45AA18C31
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 05:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077457; cv=none; b=EHd6dCygp1WXwnKGP/k3v039gLJI1Oq6/zYJP41/LpZ4UVj0Fz30wLfRafMTER8drpckZlPmlOaxqRLAk7LfmuFMyDadPyDFJf36xwemdzAiIXyPo86LVZSwR7QWMDqurY13+rFPOIofUZ2c638dN1G2fYbIQzWPi60zUrgl0VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077457; c=relaxed/simple;
	bh=fp3yNdV4dxXMRi80coUOwaKpOJz4Lwgnb74388pRDO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ui3jHmSbT627qAyLlMSRRxFqXGnPPGZHnwC7WRNLnCYmafjoQSjlapK5e46qFXWKy9RIZi9rghlEszf7ASQnpAy7IyzFLUg8p85wG97ekjS6yMaM9WEssVvRCUwr2Y7isEhXxb37kEouqXpUMKtvxRgj9ZfOdI6R1Oz81wvXGuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=NgXbqeVK; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="NgXbqeVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739077413;
	bh=3TrnJ9Z/xHsuAJRQWEc2Y4wHAx1RLl4jmH7juixi/sY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=NgXbqeVKCSKNabkSBGDOjg1aOhLSiUU/lCC2qUGStsGBtmKQNsTwWtygTRRH8Yqn0
	 4yo8PxECI/Pnxpgva0CSZdgh1e2sQ012IheyiR8pPyy7vUA9FRIPqaM3+FrRIPoa/d
	 AX2UMhMlUhmjL6dS0Ik2JGPj6TJPwl68borvMy1I=
X-QQ-mid: bizesmtpip2t1739077405tpwbo5w
X-QQ-Originating-IP: 4E62eagnmMU8WwOJCl/iSl2P4TurIE1+pZqudEXLAjc=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 09 Feb 2025 13:03:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16003967271420222493
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	guanwentao@uniontech.com,
	jiaxun.yang@flygoat.com,
	wangyuli@uniontech.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenlinxuan@uniontech.com
Subject: [PATCH v2 1/2] LoongArch: kernel: proc: Use str_yes_no() helper function
Date: Sun,  9 Feb 2025 13:02:57 +0800
Message-ID: <76342740A463AA92+20250209050258.2090416-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250209050258.2090416-1-wangyuli@uniontech.com>
References: <20250209050258.2090416-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NCzFExXfWn07vZBXSoPQbF8n0VW9HQHieRpB5/xjyoNTn76fkK8kD2Ja
	wyVfDmtDIe+r1IOO2zgmV8Q3GNGNr+iByLicQ8S/yGvIMcM0J+yygYoYHS4xM/5kZWuuUiO
	4fDdzGxgZ+5aMH/J82TNQqEfl570YLc2LjmcWljtN0v3STCfi/b3Xj4qhElXFqVePcGQ8Oq
	nZIEFMo8DB3/5BHGdfYvyW4bzzttRYDqcyqhRvksJVkHRz7ku+mAfiTqtnNDA7BXrtX0mJs
	LdkdMSLn2Kzmu5dpYtEOMvUMH8GyMOS+WRJx63ZDe+ocaQlCTSh0jVi0fp+WeyD55foBAMG
	AHpvsB/pvS16FuZtNEC92fIHNVy8Ur+le7kypeDyIMHZZFI5XjaxjQUJ7hVmM7N/tw6Ry5p
	N0g97JEh2jRBPSoBDd4878Azzua/r7U3Gr+eb1FvJgX0Wjdrm3zBJQQwHpTZeP2cEou+bd1
	2Que2eJBKoc/tUqLQn0sDXVl/ryf2Tr6pHMSKsu9+04gRIuGy3wafhldfkIqovNRXLVXq3C
	v9G+egXHAbf2Pwb6RroNsiYhWzh5sY7oCmto9sMepMRrHjlm5fwC5OUzBT7tIVWVvI99NGu
	zebCxO00VxjfHbaYphrzNr92m/3ZLpFT+Yie7XpxXIWdDkA/rOxQ5uc0oIrs+LzBQ83avn1
	BDzMvzE8ncdkLJ/GRgk2xgdMBExmk6yMu0G9ma3olZQfTLTGHL36618jbXN0NSF+EYiP6as
	uaKhbN9HfCf3ePuG7ZTYL5a1UP1l1o3wUdNkhZ0yyZhqKE7e1tultLi+/5hYv1wF2ugi4PE
	tcUjOzpgDQHm1Ik16lByPhHhdtf8z2NVX1vsGL/izbGWeltqQYZ8czn6YgF3D0UFLQtIPca
	P4y3YpIp6oCXQr1t2du1juj+1SrNqwrD4UxK2OBvgfTRtiUU09/Hl0paNnWbxabJPFzrrKY
	nmkNebFkZV3xqmO0I2c2lEEENXnF1r9afRn2qr48r58d5m0zatBg5D1hc82IVfxx9CorAse
	STVAQdQX2unu2gmDXDv6bJTXIM1o05Z4migdoDmMGikgIGpBlv
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

Remove hard-coded strings by using the str_yes_no() helper function.

Similar to commit c4a0a4a45a45 ("MIPS: kernel: proc: Use str_yes_no()
helper function").

Co-developed-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
 arch/loongarch/kernel/proc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index 6ce46d92f1f1..56a230238c9c 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -91,10 +91,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	if (cpu_has_lbt_mips)	seq_printf(m, " lbt_mips");
 	seq_printf(m, "\n");
 
-	seq_printf(m, "Hardware Watchpoint\t: %s",
-		      cpu_has_watch ? "yes, " : "no\n");
+	seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));
 	if (cpu_has_watch) {
-		seq_printf(m, "iwatch count: %d, dwatch count: %d\n",
+		seq_printf(m, ", iwatch count: %d, dwatch count: %d",
 		      cpu_data[n].watch_ireg_count, cpu_data[n].watch_dreg_count);
 	}
 
@@ -104,7 +103,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	raw_notifier_call_chain(&proc_cpuinfo_chain, 0,
 				&proc_cpuinfo_notifier_args);
 
-	seq_printf(m, "\n");
+	seq_printf(m, "\n\n");
 
 	return 0;
 }
-- 
2.47.2

