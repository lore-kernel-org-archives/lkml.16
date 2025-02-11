Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ED01E98FF
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739281314; cv=none; b=alBds4J5Fg6mrSIVEVKl+Zx9dzA/F+X1M1n0C7wIGpWGk+7RKLOP/UyPeDKcpxVDWga6pNi71gvyOSPJMhnSMHOlf5DDoqNuL9uO9Htuwu58zVGM7FckbDPKIv1oAyhFh9w+hE3tYOagy/070+0zmyd5Yp6KN4xPcoBnaC5Xock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739281314; c=relaxed/simple;
	bh=ghBuBHrXPApwqD4Vr/OOoK8WX+YbnKsw/dcOz/k6VFs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=APBoXgBXISqS88VeBrTfxWlW2OX/obznDsLxSGeUATK1PdaFEaxB3Ci6eZU/1VM9cl1eH/UhPu9dKVB218QKv1vD26qj1hCrTAYnmWE0pxJhb5J5djz+aZrx7ccE0BA3BAQg+SNZqLOpSz0bKcRUrnOnOhEC/UtTo6puvnxShVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 51BD1Tu7013069;
	Tue, 11 Feb 2025 22:01:29 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 51BD1SiA013060
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 11 Feb 2025 22:01:28 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <48a5c8af-c447-496c-a4cd-85a5698e5a1a@I-love.SAKURA.ne.jp>
Date: Tue, 11 Feb 2025 22:01:28 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [GIT PULL] tomoyo update for v6.14-rc3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav403.rs.sakura.ne.jp
X-Virus-Status: clean

The following changes since commit bdc35f164b0f60480b2f5e098bb8f3c0cea05cd2:

  tomoyo: use better patterns for procfs in learning mode (2025-01-31 00:27:44 +0900)

are available in the Git repository at:

  git://git.code.sf.net/p/tomoyo/tomoyo.git tags/tomoyo-pr-20250211

for you to fetch changes up to bdc35f164b0f60480b2f5e098bb8f3c0cea05cd2:

  tomoyo: use better patterns for procfs in learning mode (2025-01-31 00:27:44 +0900)

----------------------------------------------------------------
Redo of pathname patternization and fix spelling errors.

Tetsuo Handa (3):
  tomoyo: use better patterns for procfs in learning mode
  tomoyo: fix spelling errors

Tanya Agarwal (1):
  tomoyo: fix spelling error

 security/tomoyo/common.c        |  145 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------
 security/tomoyo/domain.c        |    2 -
 security/tomoyo/securityfs_if.c |    6 +--
 security/tomoyo/tomoyo.c        |    5 --
 4 files changed, 117 insertions(+), 41 deletions(-)
