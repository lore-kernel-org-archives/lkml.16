Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9431F1A5B9D
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739001840; cv=none; b=WCvJAlLI190pU0Nj9EYCs4VIVS6ZobfqaJaSPlWNrfQU2TtwtUFkCDHp9+dF/7DYL55io9vCe4xo/A46Zju/kdwxSE3Uxv6gLi6RWQIlUZOCbnjtD8TC2NWA6wlvL8mW6y5DDBpNwAEkoAsd/bqQLWpUVRm6iY+YPnNY+4dCNg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739001840; c=relaxed/simple;
	bh=vErhzen53LQVsAER+155p4tfGJmiHTxAiQ6rIxSZcyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGZBjUlMhnpbdAwiWpYUDs7nZokkVtreRpNm7Oy9ow5xPMazppMqOapRCqv/mQKu0V7dimxEOor64cWyLburRzekrxpA3sE/F0xgcVQG2fnuvxHkioIS2EzUTwPSRfZkt1G6wqxxJ/v4R/g6EFSpaURbVy2iX+DTBrsL5XsbsCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=jFzVbxnt; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="jFzVbxnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739001792;
	bh=Vw0gqOT0TARhlMMLll0zkTYFFrFpLOZxn46s3l5UJQ8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=jFzVbxntOKIXosADGugvfKozMl4ANWKU4b05ejMe4kLMw8k0hLd2H1XmOY6isqyR2
	 Xegw0iqDapBRReNyrtnr7XfrDxCrCmAX2n9/DYBHWAAFYPuukQZ/fuT0vRqAlxl2t6
	 6qgYZmDG/rlTobNId2gQpQgwMSwFNHBzHStAqS0c=
X-QQ-mid: bizesmtpip2t1739001759t5h1p0z
X-QQ-Originating-IP: pgK/RlRxVg739TmC5twaInYt1DbCOjIgoWls5fCaIvw=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 08 Feb 2025 16:02:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2408769451416927814
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	guanwentao@uniontech.com,
	jiaxun.yang@flygoat.com,
	wangyuli@uniontech.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanjun@unionetch.com,
	chenlinxuan@uniontech.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Liupu Wang <wangliupu@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>
Subject: [PATCH 3/3] LoongArch: Relocate the seq_file declaration to the correct place
Date: Sat,  8 Feb 2025 16:02:21 +0800
Message-ID: <9EF27D49B23CCF72+20250208080221.1083810-4-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250208080221.1083810-1-wangyuli@uniontech.com>
References: <20250208080221.1083810-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: McoPngcDBvM5t8vgbnfYie9bFJv4xNijJbEaz45cPj9FBMEvrdyYU0kR
	oyazXbCmSzZ06tpnX+4fVHAfcTeXTdc8mbOsRhooJdoFqm4BWECFyo99Dm1faJtzGgbVFT1
	SVOYrjEOsA5Izv/JJsAY2I2MDWElCYsCEibXPUIhipOmqvjHltj4aHlm9bMicX/ugrzem84
	MUEc4AhpBRlnsTeWvMOFETUoNA+Jd5kkpLtJ9VW2d9NUHHIubZ3VoU/EF4VOVNq4tY8dt2n
	XgA69YY2HY6QdMaqNf6liOUKQhwu4dL+G5RMucqnv8pyCCfJr3SSFu2Keb5KGsBDkZVvyaZ
	A9twd47wGayyetlXhcWGLXRTi3xZutjKM0nfL7yc9TnVDnyMOBW7x15IFu0HGLWy79xLsQB
	ZsaQhngyoVfK/XJkyF+jlCK7uXm9XOnWjLYYEl4P4w//hgD4BeF5hlp6vPgTaW2/q2zJUEh
	Xnv0Y4/ITCzIrpjzDaQPc1sUfrdP7GVEBtqgbMwVl3L8bTTDVoXnguEnCeqO2bbUrklFNBX
	RaAkbNAsalJPRwi5tUPQ5ICh1oicBverv1olI/7LncPSljTBJZvAGoMkg8vs4bLlhjhD0Cc
	k/NyV6+iVwnu7YmIObpL6Q3tolOxz5Hq8k4TuurQRsijdGUtqvv7dkP4ezGdNccxiuKS57a
	FH9W0utSun2BbjuhgrO8VpMNH9NqzP3GrICO/BbBdqKfCeo3SVuUNwtjYAkgjxEpIT1dLJd
	l+vkiM4InN2TkVGokgXodq9oDny1+BebxNfOZOFH4dHV5v6hYN3mn7npIUX6qmJzTFJKopc
	c3/qFf9OwENuUTo0QbEm3X3+0+mV7lfIJe0FcFCNE5c2pBJFk02xxvUj9oGam0HxqlAURCc
	VkD2DaddWEsui9v8mmxGtc+C7aLMJU1MbvXxFYXyJw8Hc7/zjcd2rWXLWShgis0m5nkHKoA
	BdTuJ+BglzABh3CRe2BILwBvG7viMHsP3B+h8J1Xh/DRBNSswOvQDwD5/Aq4DzI6bGzIfKM
	byjVZjzj4PDvpizoJa7J9WYoyuvHg=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

The seq_file structure only needs to be declared in a header file
when CONFIG_SMP is enabled. Therefore, it clearly belongs in smp.h,
which, however, does not declare it. Instead, cpuinfo.h inappropriately
declares this structure, fortuitously allowing the code to function.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: Liupu Wang <wangliupu@loongson.cn>
Cc: Bibo Mao <maobibo@loongson.cn>
Co-developed-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
 arch/loongarch/include/asm/cpu-info.h | 2 --
 arch/loongarch/include/asm/smp.h      | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/cpu-info.h b/arch/loongarch/include/asm/cpu-info.h
index 48217f07d37e..7f5bc0ad9d50 100644
--- a/arch/loongarch/include/asm/cpu-info.h
+++ b/arch/loongarch/include/asm/cpu-info.h
@@ -76,8 +76,6 @@ extern const char *__cpu_full_name[];
 #define cpu_family_string()	__cpu_family[raw_smp_processor_id()]
 #define cpu_full_name_string()	__cpu_full_name[raw_smp_processor_id()]
 
-struct seq_file;
-
 static inline bool cpus_are_siblings(int cpua, int cpub)
 {
 	struct cpuinfo_loongarch *infoa = &cpu_data[cpua];
diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index 3383c9d24e94..8555e478d42f 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -14,6 +14,8 @@
 #include <linux/threads.h>
 #include <linux/cpumask.h>
 
+struct seq_file;
+
 struct smp_ops {
 	void (*init_ipi)(void);
 	void (*send_ipi_single)(int cpu, unsigned int action);
-- 
2.47.2

