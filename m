Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D96288A8
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305202; cv=none; b=sp5BqEUYadmRPPMs7b7cunkn6GkwkNFSA9TXVETYNhbJmNDmY7vl350HejsXUCc242hcZbMkt506wKmLweNJM5w87aMfVEY8wnQ5yc8EVoqf3Gmq0TBj/2ItkWrTnQ/AcUYJ7p0G2bvYL28ioTMFfKII7JExYBgD/nOH1IPyzbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305202; c=relaxed/simple;
	bh=ydOvMSYGLBPG/Sw3HqmtS98YZtsA/FvEeL+izFPO4Ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fM/tDd2/SHkRkQ6qjJ8EwLjQ06uFt5I85Kozjl9x3V3Cy3lVn7Oav1uepnShWhZdWcTk1Lzuk0rIYfPUBMrOgPJxJ9XCAR5CS3xHA3Z8F/HZ+KP9Y484aR4UrmfBBl/mdW1JZHpdyy7VkqRZMilHVl5pRbZ54iWbEk28pJsNYvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=pszkHKRS; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="pszkHKRS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750305196; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ydOvMSYGLBPG/Sw3HqmtS98YZtsA/FvEeL+izFPO4Ak=;
	b=pszkHKRSw0r0aenTDbmBO4ypwOXQBHmOhiUUCdjTDWCGVtLtZ4JNt8crH8WTTqquo4ZmCjfbmFbpYDLYZGJmZTACFN+cwIZOzyPa0QwMCtw/awxC0X1z7M5peX1RECiDz0XYtHNp+ccFJLS1dDS9OugnewZb1jQR4NFgdJlR/24=
Received: from 30.221.131.54(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WeFmZ87_1750305195 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 19 Jun 2025 11:53:15 +0800
Message-ID: <5a513fca-b8cd-40b9-9b28-9793cf80e293@linux.alibaba.com>
Date: Thu, 19 Jun 2025 11:53:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [iomap?] [erofs?] WARNING in iomap_iter (5)
To: syzbot <syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com>,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <684d44da.050a0220.be214.02b2.GAE@google.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <684d44da.050a0220.be214.02b2.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
