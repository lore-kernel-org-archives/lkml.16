Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF801392
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 05:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077448; cv=none; b=IO0gdTVkDAtMdZZpnHzi+aYQD2O4ujjndiDmvRbnjdpTHI7p5kF5NthDtFcfz5mkTpBUG0bE4jCxD8yGjbe9bN3RS8oBuIZhfcStU9BvK23o3dGm3nP5Smjyqx3IFahuNtGKueXQF+nghGjbuZy9wlbkB1NOi/hYg78PZgt/a5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077448; c=relaxed/simple;
	bh=f2mqnqm/M9Z/1UVAux62SY+6TOr4Uuw+j6d+DvjhfuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L2bQxLsGdywQ0C6BwBjLbOFAw/3ALmx5KCzZv+6+f1y5G7vD3DTLGqMpi2Ep0vmroAa7IIyZGT33KI3Qek+oFSz5VQ3ruc6bqkFNlffA+5rsI5HhESyPmbBYEZbWcPPeny+iZjaMurMvkk63UrKrzTTU2WmXmH/AfcvTVgXr8xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=pF0Dbcyx; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="pF0Dbcyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739077396;
	bh=OUrRTQBvlTfgvbsLRw20ywMQlxrcD64Dnka1lNsixuk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=pF0DbcyxbfeR8MiKfTp3VJF8QgwsSHEY2nbdYmfyghMyQd6j0tEdVVRyuF3ww4Grn
	 w2N1a7TZWYm8FtEUmVOeTHfLoMGAMH3qJNlRB+e8dgMWcdi7RgfQXYbpoG8rzULjnd
	 4GgEo/lBUV23/ViFQazgbe/+/JCW/qXmZAnVfoyQ=
X-QQ-mid: bizesmtpip2t1739077388tfq6mnz
X-QQ-Originating-IP: Latvet5i7acspL6hF8EOiW/8QjIyq487679ALXKOzpM=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 09 Feb 2025 13:03:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16889474710978946328
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	guanwentao@uniontech.com,
	jiaxun.yang@flygoat.com,
	wangyuli@uniontech.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenlinxuan@uniontech.com
Subject: [PATCH v2 0/2] LoongArch: Remove the deprecated notifier hook mechanism
Date: Sun,  9 Feb 2025 13:02:56 +0800
Message-ID: <9C6990139B46AE19+20250209050258.2090416-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MIEbEOayU4LoKLOpmQ/P2XXTRExS4kNI48SH94HlrA5/tvyUaeYz64j/
	YfYLeseJAtN52T1C43lDsuHV73icvYPXPE2rDCnD+ZlrgedqDZoL21FNeDJ6I4XRai2ffql
	cTJb5QNJCu+87EALNP79s5jit4zonOgb0ki9T6Wp6adNEgB165OqLUDLXekSdWhTEmf5CEB
	L3lXw5bjbr6tgx9FgTtXV3/IJ518UiID8j/gw5CtFWMxtfxakpv5LNbQJ1FL676afpZIDnA
	P9cYXDXJeH4bGdXM9cZCnTz7A9NqupR+ApGRQp4TbEQOhoFaaWFHGKaZHKz5raoXi89BACs
	v6DPhJahEYILxJ6ekHS5+sDszf5cSYyALVUCOLI2SdeHhhR3aAwx/CHQu8HED+3ds7ctc9p
	Vp0yYMYpaLODAD9cNGa0RMFVT2SOOOs1oh8DJrkKG6YDaCKi/4b952MBiVTosd3Sqb/K+fb
	a0B4lrwJ1XXVzte2S1BMupa4mP/uNN0L0JMHpga9YW0JQcZGJfHg5fjRuvnf/4elF/vcsSD
	pVxkgB8jZxUMx+EUsEHkeoozpZ6WuAtV+Uyrr6Suzxaw2DC8EirnmHkMUr6WIfr9Yax1H4Q
	F0pastYqRHPjGosCqJCfoPBPz2g024E+Nap54QGqdmAKB/adI68jk+n1cqloKMFlI8jX3a/
	Kt6/rbAm7RY3XfHezgfJz2f6P9saVXdGiopAWy7QPAjJU4Vy4MnNmnX9nyRXqNhC3eb8DXv
	2S2YSa7wjbCc3/c23+SzcPKMHvjRfCQ4gqIy7RlYyS5u0NqWV5P0gJyRNiJEjXXe2UAsTtw
	nofLnMhtk8yuea15WaCy6i0W1OuADhDsysubN7LNhEO5Ll3NlzSqDEWStMJEt0WTvK76NKL
	M8kGSiTpTTP2h+TMdHRlH85joRmIUs12dK+QSgnAR4NNSDHEX/KWSgBsdr3iW9kjZYltEui
	QLG6b2b4rqzx2tLp/4ib2jivld9zT5BShaFt9rhz/srl577WTwJqIZK2abtVY+R2tYHptW/
	+bySuHf8Qufhz8ZG8r
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

The notifier hook mechanism in proc and cpuinfo is actually unnecessary
for LoongArch because it's not used anywhere.
    
It was originally added to the MIPS code in commit d6d3c9afaab4 ("MIPS:
MT: proc: Add support for printing VPE and TC ids"), and LoongArch
then inherited it.
    
But as the kernel code stands now, this notifier hook mechanism doesn't
really make sense for either LoongArch or MIPS.

In the process, we identified one instance where a hardcoded print message
could be changed to utilize the str_yes_no() helper function.

Furthermore, the declaration of seq_file in cpuinfo.h should also be
removed along with the deprecated notifier hook mechanism.

However, it needs to be added back in a different location to ensure
the code compiles and functions correctly.

WangYuli (2):
  LoongArch: kernel: proc: Use str_yes_no() helper function
  LoongArch: Remove the deprecated notifier hook mechanism

 arch/loongarch/include/asm/cpu-info.h | 21 -------------------
 arch/loongarch/include/asm/smp.h      |  1 +
 arch/loongarch/kernel/proc.c          | 29 +++------------------------
 3 files changed, 4 insertions(+), 47 deletions(-)
---
Changelog:
 *v1->v2: Combine the patch2 and patch3 from v1.         

-- 
2.47.2

