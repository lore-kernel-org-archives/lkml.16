Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E641291C3E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751067779; cv=none; b=QDYt9y4NETnyW+x4HehHQXnaUX+gopkb1vKeDsf1lq0s34IQBJoskqMe4JAxk37F6znr9Uqxj7hqupfSfVSLHYFYB4a3Uu2EcJStfTnHDt+gNF69T9ZqbQ6ubGf5EZCKqdVyx9lPODD/Y3h0kIIJFdYM9O+SSwSn8bMwFvR9i5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751067779; c=relaxed/simple;
	bh=EXVZrWdeK08gDTT2gx0Qlq6xUB8FimH0zKu9T6MTZEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mBvvAgMKcd46IEAegAMBSbJLTd3Mtm15wVoiNhia7i2+N07D5PIkfwdnfNEhL8LCEaEpI+NlA2u2TAWzvvyvvqab0VpYoHjidaBPddNUKbL7fPy+xajO4pcQ84529oeVMJEkvOJiRL9ZV9I84UnYfwuNYKdp0NfRpIOvGKLJsl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=io6B7POp; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="io6B7POp"
Message-ID: <382ffa5e-41bc-4632-9ff0-789e7d47158c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751067765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CkjB4ZKuREl223wiqo2m7uxwq9VOLlBeeYY6Aq2JiDw=;
	b=io6B7POpBuozOF3YUj++6fivErAopYfkzh/0LGxiJA2C6lj2AV+0oZ0iREwRngI0DkWJS2
	KPounk2SQXdkfFeFKOBNY0QNaj0Y33lIPEjJevOXY1AV12Z0spBDb73Y/b7subHBfsXQOJ
	goBVqi7K69BsH4QwJvXjen6HaOKvEcA=
Date: Fri, 27 Jun 2025 16:42:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [syzbot] [rdma?] WARNING in rxe_skb_tx_dtor
To: syzbot <syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-rdma@vger.kernel.org
References: <685f29f2.a00a0220.274b5f.0003.GAE@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
In-Reply-To: <685f29f2.a00a0220.274b5f.0003.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Thanks a lot.

I will organize the code, add a commit log, and then send the commit to 
the RDMA mailing list for review.

Best Regards,

Yanjun.Zhu

On 6/27/25 4:32 PM, syzbot wrote:
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>
> Reported-by: syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com
> Tested-by: syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         fac5dcad RDMA/rxe: Fix rxe_skb_tx_dtor problem
> git tree:       https://github.com/zhuyj/linux.git v6.16_fix_rxe_skb_tx_dtor
> console output: https://syzkaller.appspot.com/x/log.txt?x=17db0982580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
> dashboard link: https://syzkaller.appspot.com/bug?extid=8425ccfb599521edb153
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
>
> Note: no patches were applied.
> Note: testing is done by a robot and is best-effort only.
