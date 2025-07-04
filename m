Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5186143AA9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638647; cv=none; b=s6eWT9xmM0ShCI4yum9ShefsvhztSX/TesNTcIMJC9upm//Wg2NVb6rwH5gY1K0RkK41l2RNchXaFTEOK/dFI3voERDMsDMBY4pEqgjbFKBKwHZR4/GM80gmUHoQzk5K2bW5MJG+jak3OZQ8p5xwHHLksd1Tmwzb5UD+hmKJhI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638647; c=relaxed/simple;
	bh=ZN9Y99ApPAVJkx9XjEESek78Og50GNRE8ao8/1widIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kern348NKnWSYiTtgBubTex8zI5t6Ml5E5ftdXMkfxxw75do8CtFtQecLiTlLRU23V+txCK9LoI92AYQI/PMmTJA6LuY3F2FWUTNwveSfDANm5dgiZ1N+f7AXc7Vw6bSH2MT4WBTgWx0LeEWAqlJdDVmR6Qiqukecv7iwKu1FDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 564EHInK086399;
	Fri, 4 Jul 2025 23:17:18 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 564EHIUF086391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 4 Jul 2025 23:17:18 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <b222ac79-7eb6-4d92-9cf4-f5b937bda3a8@I-love.SAKURA.ne.jp>
Date: Fri, 4 Jul 2025 23:17:17 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [ext4?] WARNING in inode_set_cached_link
To: syzbot <syzbot+2cca5ef7e5ed862c0799@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <67a4eae3.050a0220.65602.0000.GAE@google.com>
 <67a79eb3.050a0220.3d72c.002b.GAE@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <67a79eb3.050a0220.3d72c.002b.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav204.rs.sakura.ne.jp

#syz fix: ext4: verify fast symlink length

