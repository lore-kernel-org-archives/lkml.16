Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D5B2DE6F5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 00:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502971; cv=none; b=nLQArruEUoC6TdRYvAdoQg5/u6216lfCMTXYqtfDrE3ejq0eSS9thJM8lvKfdBa9FXe99osDFfrYoa3dLSAVLfXzvl7yh7GF+47fayATFX5/OIVTiWGGOpp9mvfFFD67URbdh3a1n53AmIEqnTsV9G8shtb/opVgoNVmNH7fI/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502971; c=relaxed/simple;
	bh=D5MN3WPH1A1Y5S65bqPub19oRChrNFC7MTekEE4s2YM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=PJfpqTVD6kdqc8nwZ0zAZu8Fjo/xcJyAJ30Eqc4NapE4ZvL1QbzcLLjBmMny2og7UwxdWxTPtpQe1MxDYlbfX7n8Ik5xBaRQdomd8E8mqYGr2GOFN3dtLLAn9esyNS6ZJh4BEV5+Bk691g2AQ142f5lotGbk2pz0z+aJLAxmKok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dcUc46tT; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dcUc46tT"
Message-ID: <ca69d915-5a8f-4396-b35e-319ed7f0b8ad@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751502965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wvRXOP4YlcYmWEOCCJQXOKEFhj3fz6ARzQFiS5FnhLc=;
	b=dcUc46tTBXXoEUoI2HNnlwTo8cGCrHilsHX4aJinpFaoPPJ7ip4iVd/+8DB4hL0QXERZzj
	EXfPnlKHKMhINiSDw72HoIrk5k7VSotYhdzn6GlbeXVcODk+hrf74CTDyqBlob8jmRdIE3
	sxamOZ33HpyaGD3L6Jd6MlcQIdL/xhU=
Date: Wed, 2 Jul 2025 17:36:01 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [syzbot] [rdma?] WARNING in rxe_skb_tx_dtor
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
To: syzbot <syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-rdma@vger.kernel.org
References: <685f29f2.a00a0220.274b5f.0003.GAE@google.com>
 <382ffa5e-41bc-4632-9ff0-789e7d47158c@linux.dev>
Content-Language: en-US
In-Reply-To: <382ffa5e-41bc-4632-9ff0-789e7d47158c@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

#syz test: https://github.com/zhuyj/linux.git v6.16_fix_rxe_skb_tx_dtor

On 6/27/25 4:42 PM, Yanjun.Zhu wrote:
> Thanks a lot.
>
> I will organize the code, add a commit log, and then send the commit 
> to the RDMA mailing list for review.
>
> Best Regards,
>
> Yanjun.Zhu
>
> On 6/27/25 4:32 PM, syzbot wrote:
>> Hello,
>>
>> syzbot has tested the proposed patch and the reproducer did not 
>> trigger any issue:
>>
>> Reported-by: syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com
>> Tested-by: syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com
>>
>> Tested on:
>>
>> commit:         fac5dcad RDMA/rxe: Fix rxe_skb_tx_dtor problem
>> git tree:       https://github.com/zhuyj/linux.git 
>> v6.16_fix_rxe_skb_tx_dtor
>> console output: https://syzkaller.appspot.com/x/log.txt?x=17db0982580000
>> kernel config: 
>> https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
>> dashboard link: 
>> https://syzkaller.appspot.com/bug?extid=8425ccfb599521edb153
>> compiler:       Debian clang version 20.1.6 
>> (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 
>> 20.1.6
>>
>> Note: no patches were applied.
>> Note: testing is done by a robot and is best-effort only.
