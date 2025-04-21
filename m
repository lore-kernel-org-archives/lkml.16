Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF4B256C97;
	Mon, 21 Apr 2025 02:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745204393; cv=none; b=tLOK/ATl/2HnQ9NHYwpuzrqRo6DsXN0aDvuSXAzcqBFh27WXDsIpllsuoXDDSN0z32rCx2ltRxK8xEOyxNojOaKhW0zDHTc9Zve0Z2LWljzMpjRwC4WUAMC+B7kQOe4+uxxZdSKTIl60qZ0oxmUeDnATCNH7vJa7ahcOub1nUo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745204393; c=relaxed/simple;
	bh=b3utdDm0Z6t9OefgFnK0cFUvw67lcxsX8bFrpK6UQHA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=awXreRopvOfhi4NKz94oKZYB8Y/BbKt/caFV/fK7gFGnj5hGc/g36Ux7m3NBAc1FD+XXs5aZfiuz3BQUEf/rYjJuxg7K+YTZJZ7fY3+KbXPBtuD63feUM/6GOEUKa+IVEfoMCdH94xWF34Br5rKblnY9YAwxqp57A1IUR0qi6Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Zgqk40xgBzvWpP;
	Mon, 21 Apr 2025 10:55:40 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 4700D180080;
	Mon, 21 Apr 2025 10:59:48 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 kwepemg500010.china.huawei.com (7.202.181.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 21 Apr 2025 10:59:47 +0800
Message-ID: <bf2e5c68-e20c-437e-9aa8-1b5326f4fd14@huawei.com>
Date: Mon, 21 Apr 2025 10:59:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2025-22077: smb: client: Fix netns refcount imbalance causing
 leaks and use-after-free
From: Wang Zhaolong <wangzhaolong1@huawei.com>
To: <cve@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-cve-announce@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <2025041612-CVE-2025-22077-d534@gregkh>
 <fa7af63c-899e-4eb5-89d2-27013f4d2618@huawei.com>
In-Reply-To: <fa7af63c-899e-4eb5-89d2-27013f4d2618@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemg500010.china.huawei.com (7.202.181.71)


Given these findings, I recommend updating CVE-2025-22077 to reflect that the true fix
is the reversion of e9f2517a3e18 (via commit 95d2b9f693ff).

Best regards,
Wang Zhaolong

> Dear CVE Community,
> 
> As the author of commit 4e7f1644f2ac ("smb: client: Fix netns refcount imbalance
> causing leaks and use-after-free"), I want to clarify some confusion around the
> proper fixes for these issues:
> 
> 1. Commit 4e7f1644f2ac is currently associated with CVE-2025-22077. However, this
> patch was merely attempting to fix issues introduced by commit e9f2517a3e18 ("smb:
> client: fix TCP timers deadlock after rmmod").
> 
> 2. As I've previously discussed with Greg Kroah-Hartman on the kernel mailing list[1],
>     commit e9f2517a3e18 (which was intended to address CVE-2024-54680):
>     - Failed to address the actual null pointer dereference in lockdep
>     - Introduced multiple serious issues:
>       - Socket leak vulnerability (bugzilla #219972)
>       - Network namespace refcount imbalance (bugzilla #219792)
> 
> 3. Our testing and analysis confirms that the original fix by Kuniyuki Iwashima,
> commit ef7134c7fc48 ("smb: client: Fix use-after-free of network namespace."), is
> actually the correct approach. This patch properly handles network namespace
> reference counting without introducing the problems that e9f2517a3e18 did.
> 
> 4. The proper resolution for these issues was ultimately commit 95d2b9f693ff
> ("Revert 'smb: client: fix TCP timers deadlock after rmmod'"), which reverted
> the problematic patch. In the latest Linux mainline code, the problematic patch and
> my subsequent fix patch have been reverted.[2][3]
> 
> Thank you for your attention to this matter. I'm happy to provide additional details if needed.
> 
> [1] https://lore.kernel.org/all/2025040248-tummy-smilingly-4240@gregkh/
> [2] https://github.com/torvalds/linux/commit/c707193a17128fae2802d10cbad7239cc57f0c95
> [3] https://github.com/torvalds/linux/commit/4e7f1644f2ac6d01dc584f6301c3b1d5aac4eaef
> 
> Best regards,
> Wang Zhaolong
> 
