Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3841D88D0
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750502626; cv=none; b=B9VWI/MMvytG57eYY/WThIYhhfWgLCAyQcZdcNzP+Rvlq5GHuXc0J57ZRhck95/qr3+B1AtygFprQqTOm3Cb+hYugM/lvWaW+DATwBpb58u3C2Jwx8kHH98DrbdMP0OBzUxLLo98hGQAE4m+naixCkOc9Nev9qTL/ehDOX9Y1TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750502626; c=relaxed/simple;
	bh=sN9g8anDqB/hfRISr+88Pl51E8jeOfwy3U9zxCrkx3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aaWqvq4y/jZMXWndlREq04hO/wCUPCMFtxv+BN0+WsyTwELZe9P5dXRB9NDiZUK9Pb94HhltSDAw9XLFuktmFx+qPwP2YsvHGk2fqSJMEJBns1awAFaXuOVEJWphO9fH6h5974ArdEZeTEEHWVtVQoGVDofSmaG3cxjSz154jgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55LAhcgM039936;
	Sat, 21 Jun 2025 19:43:38 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55LAhc4O039931
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 21 Jun 2025 19:43:38 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <486a378a-3d0c-44a0-aee2-d73951130339@I-love.SAKURA.ne.jp>
Date: Sat, 21 Jun 2025 19:43:38 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [cgroups?] possible deadlock in try_to_wake_up (8)
To: syzbot <syzbot+b4529efee5bf3751bc06@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org
References: <684d16c0.050a0220.be214.02ad.GAE@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <684d16c0.050a0220.be214.02ad.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav103.rs.sakura.ne.jp
X-Virus-Status: clean

#syz dup: WARNING in rhashtable_init_noprof

