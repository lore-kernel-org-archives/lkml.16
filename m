Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B4847B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663213; cv=none; b=jm5AGhMjxGsNGQdj3qyZ6BEfunPcy26pVNtqRQRlTAkN1DHDkV7K/h1d5NOl6SpWVzfk65RiIpNoWiMoOZEQZCScAnRqVUcSvPJON+f5ynnvr4Ag6JwjE/hxZbATwGFNt/nXLqh5MCJbA/TJmndBoQ5w6MylUJFM2SDYgTadDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663213; c=relaxed/simple;
	bh=qAdhFluoZT3ynzoP1+g3FBLYdxpROlDa9qxDWrIJOJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nRfXER/s6+2+tItWFfWOaEn5TcQ07aR4pjWRFBTb3jbNR8gELfX9DBBiQEapeS9BXX+Akv8VrVY0vta/1yik5KIoyLuA6NbuNNq3Zkp3hSsBw7hrdDfUfS/6Y6i39+9YdI5BWX1HHJk/HN/sLawVJiuVfHNXJMZdM3aYC7l1M5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=SBncP5yl; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="SBncP5yl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1750663194;
	bh=X856/40F6JF+uFLjjgxtDqjPtkUGLT16fSmZ3LISqLU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SBncP5ylv4tlwYosWA+QTfxSjYSKoqe3PCBvP7YfQgvFzlsAWD9BrblCCtJgNiVpV
	 RZOsjMhNSEekuyZJHZuS7EGOf9g6yO+0HojRKb3peerRnbmVnmJiGvIwY8kJ9l0duy
	 xLrOne/PX3T4RiuAJ2vz7mx9QscetvKnVel+o5BM=
X-QQ-mid: zesmtpip2t1750663181tfdabf863
X-QQ-Originating-IP: 4MRAjZ6hf/7lkFns6FLA6vh59Nu9QD4XTpRMbXcnt2E=
Received: from avenger-e500 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Jun 2025 15:19:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18185178444887829501
EX-QQ-RecipientCnt: 18
From: WangYuli <wangyuli@uniontech.com>
To: masahiroy@kernel.org,
	ojeda@kernel.org,
	nathan@kernel.org,
	alan.maguire@oracle.com,
	laurent.pinchart@ideasonboard.com,
	kris.van.hees@oracle.com,
	linux@weissschuh.net,
	tamird@gmail.com,
	vegard.nossum@oracle.com,
	ardb@kernel.org,
	mchehab+huawei@kernel.org,
	lizhijian@fujitsu.com
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] gitignore: allow .pylintrc to be tracked
Date: Mon, 23 Jun 2025 15:19:33 +0800
Message-ID: <1A357750FF71847E+20250623071933.311947-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MOfwHzgDpc8I3B7dVvsLVsqhdnDn4sZVpS9EdIp45ZZuqOX/Q//EX3Rh
	DPMru6sNdRLwHpqHadvQLtMJYIyICUHegP7f4KLKg3qyoNnPOuR7ybW5nLdOccCk/DBwXYJ
	kjAO2wNGepFMsXMEgAAz5+C0zWX2gqyLK+kIjy/sYwQDT++6ftzPddgoGKqIZbyG3IjipDN
	SDSft6SrpVnf/cXMmDLleIV/ZP8La5lBrL0ciRZX7NSioFQX9PfDj46C4MCH+15p9IBx9di
	3sTKkzLk4OeUuwKi3TuaUwoS/BmrZ0fIpXMXiMEHqe7CXPMF4ARcJcT+vdjDuEkyuuyWYjV
	UVph4lABXYIi9uOBLfBbGlM1NEQcdQpZD3DY73UeMXVuJjWTvWIFEsk4rTZWSfRZTwn/rjJ
	NF0L3U2QjSFXTNf65AcfIxin78HdSEkD1ys+XvotZLO3sUGO2Wa8D4ARtuhYSOSx0C88FCc
	Rx08z21tXAlYMpgz4c5RzSP5e2rGYmN1eLBTn0y4UKKH+tW9pz6g6mUdpf0jtFuXR5LyyW3
	NptMNXE1coSsSoRxUq8qLhT4VRlMZZ4OEse7Wt3501nQUr/30LDLPrtLDqaIzxljDwOwelE
	+12tQ3JgtzjJ77DTWGX5/S6A8I3HKnn7BMnxR6lwHqCv+H/Z6zonhz9ALgDvuT3kv0Y+M1F
	2Q5dMzIiFOjqULPxrPBOPWC1mVGWrsSObmUSQDTKqTtTEPub3yeuk/rWykeVVB0bBiMuDu2
	6etioq9isW+00ps06sD+XQjvKxpV5Jueg3sAU5VRZyMmduh4vD/TUDFa3DxtAJjYxs365ck
	H74XilNCr6hkQgy+PnCXjCVkPJx3eP2Fc5XUC4cqIHq4xqFnpsllPEUK2oD01Vsw+N2d4ZY
	KvMI0/UMCX7XtKADOSiFQBHI8A5rF3cdlHsZcHWeUVEttCSWk4BbDeTkwUz5jYf65j48zTq
	uRT+kQ7gde0TgdN5iOIFLHsfhgcgNb/swiaFkbUD2wcUqnZ456+l0zzL9ipqkpoGggZ8DXn
	Z3rSQAaT829ocSaFFpOm0Y9750FMOlC92Sx+KPoTHC2B5S1zhK
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

The .pylintrc file was introduced by commit 02df8e3b333c ("docs: add a
.pylintrc file with sys path for docs scripts") to provide Python path
configuration for documentation scripts. However, the generic ".*" rule
in .gitignore causes this tracked file to be ignored, leading to warnings
during kernel builds.

Add !.pylintrc to the exception list to explicitly allow this
configuration file to be tracked by git, consistent with other
development tool configuration files like .clang-format and .rustfmt.toml.

This resolves the build warning:
  .pylintrc: warning: ignored by one of the .gitignore files

Fixes: 02df8e3b333c ("docs: add a .pylintrc file with sys path for docs scripts")
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index bf5ee6e01cd4..929054df5212 100644
--- a/.gitignore
+++ b/.gitignore
@@ -114,6 +114,7 @@ modules.order
 !.gitignore
 !.kunitconfig
 !.mailmap
+!.pylintrc
 !.rustfmt.toml
 
 #
-- 
2.50.0

