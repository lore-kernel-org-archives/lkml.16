Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C69D19F40A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639226; cv=none; b=c9E228pzSKk8SC/djAEXOgvL1Zh2ehvJJgw0ReTTjxMb331waMEZtWggPrBhKYl1NmJzel9pDnZttXoamA0oTvF/wfJG26I5BuJbXjaHb/fGgziPcXEpBNN7dduOO05xPorr7Ie79+mAQxeJqtfaKKqptgHrSGfO+JkTxFhvMOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639226; c=relaxed/simple;
	bh=hLlilnrj9P9HxyY5s7BBc1AwQfE6VeyWw16K/UEChwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r2e8ijnktq8Vw+ss725PkAdwIWn/xpBjRgIzoNW22LLHNBM7m60m1sgNjx1QeSY9Rm1uHF2vMWdWVPmlT+0EC/EG+goAooxmP4IBF0nt3Co+TaAubrh67GEguwGq6heq8JM5H8p+Gh2ZsRdAc0Gn5T/w/eGoeg5bgr2NIK2agfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 564EQwC5089384;
	Fri, 4 Jul 2025 23:26:58 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 564EQw9J089376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 4 Jul 2025 23:26:58 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <6392234d-d983-4697-9fa0-92d6d1221adc@I-love.SAKURA.ne.jp>
Date: Fri, 4 Jul 2025 23:26:57 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [net?] [s390?] possible deadlock in
 smc_switch_to_fallback (2)
To: syzbot <syzbot+bef85a6996d1737c1a2f@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <000000000000ec1f6b061ba43f7d@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <000000000000ec1f6b061ba43f7d@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav102.rs.sakura.ne.jp
X-Virus-Status: clean

#syz fix: smc: Fix lockdep false-positive for IPPROTO_SMC.

