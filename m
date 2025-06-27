Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CDC26281
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750992610; cv=none; b=cdmslCfDq1u5Z78suSpm3Vn1LrSbImNeQ6DJXh87xem1a0es7z+PlXw3JebuyMDyAjYRZWPtUa6bJU5gKdG+8EU8CrRHGhXv7IPD7Ri/KajMcLPnOg6yOUEFne8B3c2vupVbg4GPsFC0Oc4MDPpLaVnppL30mPfN5QaaXBgjBGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750992610; c=relaxed/simple;
	bh=p1HW6zv8mlHJrlMRWQzDXxmWMCYCO0Q4SFXTfOBRo0k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=sCDBZA+OgxvDdFlc4eUfJoUizRsJBd9mDvfRmVKMJpIX84fByVx4CFjmkZg/VMu/gTytAwjlhk9kNauaGzQlKteGGo3CwAnrqa0wCZGFmJn55WZ9I9wVK25VAp9eRVsoB8zQxgjmFgn9g9BIvSpV1tmk3kq5nrC0gYrEkFzgQW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MkewNYvj; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MkewNYvj"
Message-ID: <850c0f71-ae74-4a06-bf40-fc44c6ceede7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750992605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KX8z8Y7YX8y7KbEgdhFOB6RdeuuZTaBG2L/6FgdDGsc=;
	b=MkewNYvj+gjKySw0n6q59iY+d590vYvOLdKEUZ69gnJ7QHolf8+3aSTCBCmOVQFTj39Lda
	kwCPdPqA+DXFu6jhNXLAKQKdboNCbOCRNLiqS2Rp837OkgM/qzYaqS4o4GoWbjgDOFihlV
	k++czY+e4kUxTR1ILVQQ/jVzyoLHZrM=
Date: Thu, 26 Jun 2025 19:49:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [syzbot] [rdma?] WARNING in rxe_skb_tx_dtor
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
To: syzbot <syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com>,
 jgg@ziepe.ca, leon@kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 zyjzyj2000@gmail.com
References: <685dc8bd.a00a0220.2e5631.0382.GAE@google.com>
 <f59b4048-a4e3-4d7d-8aa9-5a3ad42db8b7@linux.dev>
In-Reply-To: <f59b4048-a4e3-4d7d-8aa9-5a3ad42db8b7@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

#syz test: https://github.com/zhuyj/linux.git v6.16_fix_rxe_skb_tx_dtor

在 2025/6/26 15:38, Yanjun.Zhu 写道:
> #syz test: https://github.com/zhuyj/linux.git 
> linux-6.15-rc4-fix-rxe_skb_tx_dtor
>
> On 6/26/25 3:25 PM, syzbot wrote:
>> Hello,
>>
>> syzbot tried to test the proposed patch but the build/boot failed:
>>
>> failed to checkout kernel repo 
>> git@github.com:zhuyj/linux.git/linux-6.15-rc4-fix-rxe_skb_tx_dtor: 
>> failed to run ["git" "fetch" "--force" 
>> "9a778a5fe5e4b8c26d97f27ad3305a963b60aef0" 
>> "linux-6.15-rc4-fix-rxe_skb_tx_dtor"]: exit status 128
>> Host key verification failed.
>> fatal: Could not read from remote repository.
>>
>> Please make sure you have the correct access rights
>> and the repository exists.
>>
>>
>>
>> Tested on:
>>
>> commit:         [unknown
>> git tree:       git@github.com:zhuyj/linux.git 
>> linux-6.15-rc4-fix-rxe_skb_tx_dtor
>> kernel config: 
>> https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
>> dashboard link: 
>> https://syzkaller.appspot.com/bug?extid=8425ccfb599521edb153
>> compiler:
>>
>> Note: no patches were applied.

-- 
Best Regards,
Yanjun.Zhu

