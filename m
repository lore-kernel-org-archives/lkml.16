Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06FA1F5828
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751730675; cv=none; b=Tpz8D/tyC+/i34K0bot4Fe8fFK2PcPWO+Snpy9HoV0AMIQiBV51YEoiLmAoWBOf4FLJIgV8Wfi37Ewp6SM0KR9BjRoxfl+uYn+ocjNvytu4JhDIGwEoWmwkiejjXXENcOwxEwxno6IipTBZJDOLY7ll/9PDAPAD136fOpHKu3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751730675; c=relaxed/simple;
	bh=a3YyyanOIL/P9VUXuQL3UiTb+ctTaPmDedOeJc9yCHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=efGIr51eWuqDwbJNcDE+VToKWCyaj2m4H7yCfye/iNyZp5bxC595POKwhFuxZfrmGXZcbLHN56Dw56Hb5GOn2X53scxCPPdVvgsNzWacLo/p7pyYHmIB0lFHP7y7I1qe8NU2faK2A+LLKhYjq8QXsgBcSILjGNVnqZBbkHXRnQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 565Fp7fU079268;
	Sun, 6 Jul 2025 00:51:07 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 565Fp7Fq079263
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 6 Jul 2025 00:51:07 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <c85822d4-b2c7-4e99-bf3a-5287beedea02@I-love.SAKURA.ne.jp>
Date: Sun, 6 Jul 2025 00:51:06 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [block?] possible deadlock in loop_set_status
To: syzbot <syzbot+9b145229d11aa73e4571@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>
References: <6741e9d0.050a0220.1cc393.0014.GAE@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <6741e9d0.050a0220.1cc393.0014.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav402.rs.sakura.ne.jp
X-Virus-Status: clean

#syz fix: loop: move lo_set_size() out of queue freeze

