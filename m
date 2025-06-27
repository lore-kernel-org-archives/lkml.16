Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062D98460
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032029; cv=none; b=EIPX/LUKUAwRW+FU1RgjbnLO4NR6odegm19WJzlI/VHlQkIYFF3EueHn+/7z4Nyl0WxxSOlXTn4jN9+5EaSRPwXprDc7MY6De1JUO53Q/O/zXnzkJ/a1sM3QOAPXpcwNnUohm59XX1DZ8DMTU9yCo3bV5nyhL57ZPlJ84gqj1NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032029; c=relaxed/simple;
	bh=ImQxyS0IaLYue1GE3pv+fXyhPHBvYq8/o6fR8ZbY4Tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PsKho7x2TWYxg1Xk3JvSLs1KeCPAKSNU8CYZpU1+YNN1rbkCLYxPDjDGowav7R1tUPdy6APjk7OyurxuO4JkxXBXdvJueVvnOZ2+P4b7OzwhW4Cct+NQMgauHf0+aiRi92SM95GheU/H/9rQj2dGVsKJI8dytTlD9UXGIqLjcJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55RDl1YG016275;
	Fri, 27 Jun 2025 22:47:01 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55RDl19r016272
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 27 Jun 2025 22:47:01 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <6c87fb5e-7474-4c9b-9bf9-917280d7ce02@I-love.SAKURA.ne.jp>
Date: Fri, 27 Jun 2025 22:47:00 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [net?] possible deadlock in team_device_event (3)
To: syzbot <syzbot+b668da2bc4cb9670bf58@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org
References: <685e9fe6.a00a0220.129264.0006.GAE@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <685e9fe6.a00a0220.129264.0006.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav101.rs.sakura.ne.jp
X-Virus-Status: clean

#syz fix: team: replace team lock with rtnl lock

