Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509201EBA0D
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274627; cv=none; b=m9dm2ACl/2LDXI16dwOFrl4juQd8YDlJ/OUncAzxdUnUT1b/MbuKXyumpCOWSEFb7O+Q/SD7pA/61wFDJlWgINY0wwBzX4Jsbutw8GAjM1a29IkcI44m9dw2ZDSjNoA73bMDpddAFo30x/NDiG0NXocBUOsUCJkku1V+aAZgXoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274627; c=relaxed/simple;
	bh=MpYoV935gHCdfwmOkYgd2Ig/wcyVybBMA8FMdECu/nI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WXUNALnKaQJsAeOPDBS5d10QgILQAa69p9mGTffwTfkbn5xdH+rT5OeaUYaloaPeYBDjLW1JFvR6ZoxwQFRQAW6IohSIpac6SHT4T4Bw+CuIvBArVwH6cFRL6WZAv9ZAcox3k6aWOz+O3Z2cmuuwcuLcpZZs6qKVFISVooBeoGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxvnJ8OatnTiJyAA--.2118S3;
	Tue, 11 Feb 2025 19:50:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx3MR6OatnNPMLAA--.43600S2;
	Tue, 11 Feb 2025 19:50:18 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/7] Add jump table support for objtool on LoongArch
Date: Tue, 11 Feb 2025 19:50:09 +0800
Message-ID: <20250211115016.26913-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBx3MR6OatnNPMLAA--.43600S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jw4kKFWruFy8Kr1rGr4UGFX_yoWkuFg_uF
	1xWa4kGr1rXa1jqa4Dtr1rury0yF4rJFs5CFyUXw17uF15Xr1UGFWav34DZrn8KrZ5uFsx
	JrWFyry8CwsF9osvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU

This version is based on tip/tip.git master branch [1], the patch
"objtool: Handle unreachable entry of rodata" is dropped, tested
with the latest mainline Binutils, GCC and Clang (2025-02-11).

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=master

Tiezhu Yang (7):
  objtool: Handle various symbol types of rodata
  objtool: Handle different entry size of rodata
  objtool: Handle PC relative relocation type
  objtool/LoongArch: Add support for switch table
  objtool/LoongArch: Add support for goto table
  LoongArch: Enable jump table for objtool
  LoongArch: Convert unreachable() to BUG()

 arch/loongarch/Kconfig                        |   3 +
 arch/loongarch/Makefile                       |   6 +-
 arch/loongarch/kernel/machine_kexec.c         |   4 +-
 tools/objtool/arch/loongarch/decode.c         |  28 ++-
 .../objtool/arch/loongarch/include/arch/elf.h |   7 +
 tools/objtool/arch/loongarch/special.c        | 159 +++++++++++++++++-
 tools/objtool/arch/powerpc/decode.c           |  15 ++
 tools/objtool/arch/x86/decode.c               |  13 ++
 tools/objtool/check.c                         |  23 ++-
 tools/objtool/include/objtool/arch.h          |   3 +
 10 files changed, 247 insertions(+), 14 deletions(-)

-- 
2.42.0

