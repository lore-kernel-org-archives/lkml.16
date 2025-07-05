Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5BF1FC0F0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731498; cv=none; b=WDTtmKDwZR1G6dsGNAvlVj3aGCqrPh6VfMBS8q7/JX7bFwh7FDJNARzosVeofdLeZH8qXDqAk7/q17sab6EdzhxI5vFtAHKwPSPd8qcYhhaw9ha9W4Wh/CsebxbRyjFEYUjdopxyEeDXduXZeMN96/r9nX7KY5jmS1/jxzcxL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731498; c=relaxed/simple;
	bh=8v5Q8qQyvzoJlgjXN9uU8XlR9vEpjl3LJXhlKU2JcMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=np1yaCW603zHO/RKAbSEHTTUnloP9aCN6S+yQfnON8JPOANAtBQ/y1KS+YbZUE5DEk3/qqNfqaxN6S1VjaxlSWJnzw1LthWgjE3S+kh+xjokJLx/VfCShLNrvnbjzhavgsJj6OVmWin/r+qvK7ddmPvu6B6k6MxrN42xgDc5MFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 565G4pah082514;
	Sun, 6 Jul 2025 01:04:51 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 565G4pL2082508
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 6 Jul 2025 01:04:51 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <3ea5195a-88e5-4549-8d09-dcec6ed0b694@I-love.SAKURA.ne.jp>
Date: Sun, 6 Jul 2025 01:04:50 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [ntfs3?] kernel BUG in zero_user_segments
To: syzbot <syzbot+78eeb671facb19832e95@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org
References: <000000000000e8fba6061fc7494a@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <000000000000e8fba6061fc7494a@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav303.rs.sakura.ne.jp

#syz fix: fs/ntfs3: Equivalent transition from page to folio

