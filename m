Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0812066CE
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210863; cv=none; b=SreMUCJDH120QXCELOgWDzrr9YnKKwQmRY9oxKGob6Zp6IlB7yNj+zeMhYBvAFY6UuAC/4hZmD/Nd4xj7p6CoEOYMZPzqtmBfotrGbkQpfbYviOsQ6NvOZCKstg0y61zMt4jG+vkCNAoUqc27689DkAKoeNDY7UTRMRjIbeCU+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210863; c=relaxed/simple;
	bh=ChtDO3u8d8l/AZ1USO96CeBoGpsIpmVf0sP47OUi4xw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=LSQLGCz4kfEYe3SvyaWl+ug9C/5Ge7m55b9xYahv/JL7vn+zwJseuutP4FA4JUmNkRkDRenVXk2jMR1qNUKxz2k6qu8XlfPj/DtNRuY5myB0Lf+ZeNUTwZRAbVtmctasVHzAqP4nN5tg22OypbKqlH1G42PfRIm3AIFfQfJAIDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 556AwOM2029303;
	Fri, 6 Jun 2025 19:58:24 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 556AwNja029300
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 6 Jun 2025 19:58:24 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <5eb6db5b-a133-4084-9f67-cc971911ca01@I-love.SAKURA.ne.jp>
Date: Fri, 6 Jun 2025 19:58:21 +0900
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
Subject: [GIT PULL] tomoyo update for v6.16-rc1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav301.rs.sakura.ne.jp
X-Virus-Status: clean

The following changes since commit e9ddb37834eb93b9840ac9aa93a36d70f27c3e32:

  tomoyo: update mailing lists (2025-05-05 22:55:53 +0900)

are available in the Git repository at:

  git://git.code.sf.net/p/tomoyo/tomoyo.git tags/tomoyo-pr-20250606

for you to fetch changes up to e9ddb37834eb93b9840ac9aa93a36d70f27c3e32:

  tomoyo: update mailing lists (2025-05-05 22:55:53 +0900)

----------------------------------------------------------------
Update mailing list address.

Tetsuo Handa (1):
  tomoyo: update mailing lists

 MAINTAINERS |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
