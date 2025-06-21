Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7891D43AA8
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750505151; cv=none; b=usdN/1KjgTHy/UUZsHMETugv9+XbRmMEG9q9ZfCFQlpX2xNOv+1DrR7AXJ/vMRhBzlV7nNJ/zQc3YCtX0Jm4CbKWdfeaM8XZOAr47XQ6IpOZrKpA0XONVv/8wwoc2Mea8Za01mEiMvcK3gJuGvRU3jkHdzoJ8V7abcDuo23rGE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750505151; c=relaxed/simple;
	bh=sN9g8anDqB/hfRISr+88Pl51E8jeOfwy3U9zxCrkx3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Hk6p4LKjrNduiEWegs64qoItCp0tib0Ho2N/3ZqMMlPAYhxsOphfS/7hxzaxqYaFvX+J5ztlsPyGZihVfWo0fMO51DBCj3ja/kLN8gR6dA0NB96Roa4fHWIECmN+H92B3D3C3EvZq5UjurfOWZooVvSE+IbViRHAGlcWwGA/a/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55LAfnwE039467;
	Sat, 21 Jun 2025 19:41:49 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55LAfno7039464
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 21 Jun 2025 19:41:49 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <ced3af37-9b56-471b-b053-f4ee8c9d8196@I-love.SAKURA.ne.jp>
Date: Sat, 21 Jun 2025 19:41:50 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [cgroups?] WARNING in NUM (2)
To: syzbot <syzbot+ee0ddd3c79cac08cd4f6@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org
References: <684f296b.a00a0220.279073.0033.GAE@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <684f296b.a00a0220.279073.0033.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav201.rs.sakura.ne.jp
X-Virus-Status: clean

#syz dup: WARNING in rhashtable_init_noprof
