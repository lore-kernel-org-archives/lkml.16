Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA57217B506
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739001826; cv=none; b=UI7vUt9tSRch5B7r0SKJPsn4UsSyznSwPO/vKRUDtLS2gvEotq9N4yamNctzG4wR0oD4XhhVGklq2VaU3jj++mZb6t0QWPzADDnYIefQNvNq8zkEp1u0lOJJTopb92GGhP0ryzwM++77A68xJGJhlnopmeiHlgDXZqYjY/kkCCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739001826; c=relaxed/simple;
	bh=PgBXquzMXsWz33obIrTjPNP9P9NVROXr0WVTFk+Dcyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kTUxz5b+WIHSIYHPdW7w+VapqcJt0/HomBViBAZ5WNtQW7migoZY17UsvgZTaWlmFFxKzNGoavZ36t4VAEyB96lyJKZksLIqXG/hvlc4AM+KmadtaFN8g8Pp+yWH1d5WBFAUZfXyQI6qJiMTQ7A0UlYlpzitPbdUb4r7tfsmw/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=QsExfEq8; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="QsExfEq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739001778;
	bh=mqNXdmfFmSts2fzJNetk66tefp2cUiUagyr97qls4QY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=QsExfEq8nQwGMY6brwiMZCSWa/M8uDrnEbDMbOdir0VcBo6iJk0zqLnm9v5pVQmuG
	 G4r6Rs3Rqr0oK4WLC+y+3om9pjR0pVKIOujZDQHxDrJKdrVi4VlN+AJRScJ0pnylu2
	 QPuIOge6lusch1PzOvDSy5xwAHSb7gv1ev4PcM5M=
X-QQ-mid: bizesmtpip2t1739001746twdky9c
X-QQ-Originating-IP: S7iRy4XwFzNGRLwdx7fwf+8443jaoePP5iscOfUyiOQ=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 08 Feb 2025 16:02:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15013984985188102476
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	guanwentao@uniontech.com,
	jiaxun.yang@flygoat.com,
	wangyuli@uniontech.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanjun@unionetch.com,
	chenlinxuan@uniontech.com
Subject: [PATCH 0/3] LoongArch: Remove the deprecated notifier hook mechanism
Date: Sat,  8 Feb 2025 16:02:18 +0800
Message-ID: <78D4077EFBEB1663+20250208080221.1083810-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: OST2d686M2k2zm5CVzItbAc8JUq809ro4nz7kIDTj9uy3TGxSozop46m
	pVpOKj+ElmAUsOCHytWnaYgnQh5K4BM/3NauN607qtUMvN8WPb+j+SGzxT3BwmqAzMwXimy
	aSbnBjYW7Oes+y//SiIvfVSDfKEnRVb2/YnMMqEmYN4oReECTqrUBVflhnHhnso/XssaMoO
	XsIAKJCJWXeHLHDJzVD8afqrib4y6TYheQ99+Ic9q6OAgeeopiyc5lQ+wzi6iqBfOoSgpZg
	Qfa6wZHYGmjh+JQve+tQSGyAC4Xz9yYZyR0DUoASQzpZ4qT8je4b/J3Zk2HzQ8vxfTUD1AB
	+BDgkz7kWbH/+jbZtHD3ItZSo7ACIIpMOB3u7X5/HTYcZn/Fsl05NBu8yXod+Ppxun/Qhoz
	9epp6pYXEZWgyC41ZBZlUSwRU7Hr66L5Y8CmDO7N0X5J+wOaCBJ9rgXn+Fts73sggWr35BA
	OlYz1+7idzGB3Nam2ZFZHXwJlBKC5iYQoRlIAHC7pg8JG+hHwEb99NGi3NjRmcp9nd0pOU5
	hmrt+DWazOxOEvAoirkZs4DPRdlojFwOmCoX0aXoABrD9FyqiS8rF87H8Rq5v/MtDmJJiB6
	NKWQYjxV/G0zQZCIXy8dwvICUKCf8DPqpK3Dv2tAnSPHHim1fCR2iinJo78cCwepC7D1nuC
	nr8OR2soYp2naxo2BlRm8GBYISvrANGo3O8R5H1kZ5HMozLEFtFZvqAQBaTWXLE//r060L+
	d9SeFZALtmeWsK+ITZNuWPcbh6sxTpog5vMTmRP8B8bEX+YXpM9bZGW6KTBdFjDCTyth3xT
	CU7uu2Z4vx3qAu8kSaiui/eEXTnL1XnloVN2v3u65BMXbL4X/9+DRVP3BiqXhrRVNTzSix4
	Qn1fWZXH0/k8/alDSTGsiPS8uj8n+GK0V3oJeT/KQC4YZMNh91ybX0XumGEDKSHt+o+XtZ2
	lQDllwlxUV+JKK9jIqAncxvIiApLNhsHsrg1OaRX1jLvolF7g9E5fhl16TU8fAHES+s/9Qn
	64nhNfOH7j0Prhn1YL
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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

WangYuli (3):
  LoongArch: kernel: proc: Use str_yes_no() helper function
  LoongArch: Remove the deprecated notifier hook mechanism
  LoongArch: Relocate the seq_file declaration to the correct place

 arch/loongarch/include/asm/cpu-info.h | 21 -------------------
 arch/loongarch/include/asm/smp.h      |  2 ++
 arch/loongarch/kernel/proc.c          | 29 +++------------------------
 3 files changed, 5 insertions(+), 47 deletions(-)

-- 
2.47.2

