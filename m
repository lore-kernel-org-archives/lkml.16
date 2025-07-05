Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEC12CA9
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751732367; cv=none; b=n2Qsit8JEG0pEHTpXCUMQX81Zwml/9nVXf91n1Ove7xQi7AV2Bf0hVVKRcfwkdzJCScqeuIAJOsaA6x3m+0pl1/TFBk8v9I5F0VcmpVDtmw8D10EF7e+chpeiTu78Q+uYiv64/G3OrpC2arrhLrM053mR9Ll145JT+tKqd8SxzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751732367; c=relaxed/simple;
	bh=Jo1iOm9+2CKm6xu77w3gefkF1rGoJReCN+BO3WISLHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ImbiMSa1Sy7f9SZz35slF3ACesqyh0Cj9easa9+Ukor5hEw7BZcbwkLqNZUNpgVXq2VzEZF8x6o2CRh9td9WOcBeHNs76fyo9+n2mgunRHlBitcGES2GfrQpdHeDnIiH4rGr8ZzrLKuO2SxgR7/2MShumnCcqOWj+go7fvLudx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 565GJMgM085862;
	Sun, 6 Jul 2025 01:19:22 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 565GJLf7085859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 6 Jul 2025 01:19:22 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <21e56549-22ab-46f1-9079-12e4c181b95b@I-love.SAKURA.ne.jp>
Date: Sun, 6 Jul 2025 01:19:21 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [fs?] KASAN: use-after-free Read in sysv_new_inode (2)
To: syzbot <syzbot+8d075c0e52baab2345e2@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org
References: <00000000000096c7e30618006f15@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <00000000000096c7e30618006f15@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav104.rs.sakura.ne.jp
X-Virus-Status: clean

#syz fix: sysv: Remove the filesystem

