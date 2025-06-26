Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8152F1FC9
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750977499; cv=none; b=tBxGUrWDuLjh/pA4ewspwmiwQBiWL5L2gKaWEoy0Rl7WWxoFd+9CuM3PsZkIWUb0gpVLUO4zez7shnWWlUlKwsANQETTXJsTRq890oeWXlXSWSVo4z1NAfje4oU3HmXTwmfDr0KMpc3AG4tf4cGv5+PoJPJ0amaXYHeGp9hwgHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750977499; c=relaxed/simple;
	bh=ZaPhd5R/35Ok79wR6z6dwIrWWaac9MBdzbGO1yUtDN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WYUsNHic+k6KV7NECI9BmW1/2aMqCPs0O6g41iuC6fmWRHrAAhfwdIovsxhoh7Jbfi2M3p/lXjeBFzcDxZXt3UuVdUp4IGypDqNqqsgdM/SaWTC7ijrZF1aYVo4eXs+kGpFNGqVh1Tqi0JMwSU6kRwIk50GrH1AzYkyU9nBKiHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=E6i+VmYz; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="E6i+VmYz"
Message-ID: <f59b4048-a4e3-4d7d-8aa9-5a3ad42db8b7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750977492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vRU6L+EDkJ388DaA+4C4JTDMjH6f4x8nZAQ5aHFXNA=;
	b=E6i+VmYz2HbQ+3ufVwD/vCJYGvx+p+PJbnHCSRZP1vPFIET5zTpbxfI+cyspX3Di39obbM
	GKSmAVrfaaBKbwKRZJ6/MiKDVN8PNd1AtVcWLLBqoI3wc6vWDtdkqq6GjYAwjCjtKSThDm
	SktAuoLRATglUlkEs/BhzHstMhI1mn4=
Date: Thu, 26 Jun 2025 15:38:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [syzbot] [rdma?] WARNING in rxe_skb_tx_dtor
To: syzbot <syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com>,
 jgg@ziepe.ca, leon@kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 zyjzyj2000@gmail.com
References: <685dc8bd.a00a0220.2e5631.0382.GAE@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
In-Reply-To: <685dc8bd.a00a0220.2e5631.0382.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

#syz test: https://github.com/zhuyj/linux.git 
linux-6.15-rc4-fix-rxe_skb_tx_dtor

On 6/26/25 3:25 PM, syzbot wrote:
> Hello,
>
> syzbot tried to test the proposed patch but the build/boot failed:
>
> failed to checkout kernel repo git@github.com:zhuyj/linux.git/linux-6.15-rc4-fix-rxe_skb_tx_dtor: failed to run ["git" "fetch" "--force" "9a778a5fe5e4b8c26d97f27ad3305a963b60aef0" "linux-6.15-rc4-fix-rxe_skb_tx_dtor"]: exit status 128
> Host key verification failed.
> fatal: Could not read from remote repository.
>
> Please make sure you have the correct access rights
> and the repository exists.
>
>
>
> Tested on:
>
> commit:         [unknown
> git tree:       git@github.com:zhuyj/linux.git linux-6.15-rc4-fix-rxe_skb_tx_dtor
> kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
> dashboard link: https://syzkaller.appspot.com/bug?extid=8425ccfb599521edb153
> compiler:
>
> Note: no patches were applied.
