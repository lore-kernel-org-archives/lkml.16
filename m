Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1F13A418;
	Mon, 21 Apr 2025 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245113; cv=none; b=OJoVvEpKtWZfHkXUN/tdZ2QL+itaZf6sEM5VQnL6ajCwi0vPcpgVL04dfkf5eKjg6f42aTTYp95LDUrnFhIGK3k1pxINp2IIckfb9xjoVHnmu3yusaFZAPkFtDXqiz8vX3ueNu61ZdXzAX6CPOw21K1iZ98tYygnMS+h85yPfPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245113; c=relaxed/simple;
	bh=hVkZBfs5Z+uRfS8N9TKs0Et878ZYWO+BgKsgiFt3bEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OPyJABFa5NsK41ES4F5xLblZ3qQhjNKETd0A626SpxR3x1BnTuaHbKPYBZQBklCaoWOckkmUhpEfOtucJ8tRVvlpOHJ+YyXBv78wiHtIxvb8Y7uksglsUIS+VZdiVeMZndKbZnIqzYwkZ9BTXoxbPptlJjBP3dU9oVqfFlAYKWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Zh6ns6S7Wz2CdT6;
	Mon, 21 Apr 2025 22:14:57 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 753C01A0188;
	Mon, 21 Apr 2025 22:18:26 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 kwepemg500010.china.huawei.com (7.202.181.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 21 Apr 2025 22:18:25 +0800
Message-ID: <b7822cca-5ef5-4e09-bca1-2857aada4741@huawei.com>
Date: Mon, 21 Apr 2025 22:18:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2025-22077: smb: client: Fix netns refcount imbalance causing
 leaks and use-after-free
To: Greg KH <gregkh@linuxfoundation.org>
CC: <cve@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-cve-announce@vger.kernel.org>
References: <2025041612-CVE-2025-22077-d534@gregkh>
 <fa7af63c-899e-4eb5-89d2-27013f4d2618@huawei.com>
 <bf2e5c68-e20c-437e-9aa8-1b5326f4fd14@huawei.com>
 <2025042111-provable-activism-ec0e@gregkh>
From: Wang Zhaolong <wangzhaolong1@huawei.com>
In-Reply-To: <2025042111-provable-activism-ec0e@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemg500010.china.huawei.com (7.202.181.71)



Hi Greg,

I apologize for the confusion. Let me clarify the situation more directly:

>>>
>>> 1. Commit 4e7f1644f2ac is currently associated with CVE-2025-22077. However, this
>>> patch was merely attempting to fix issues introduced by commit e9f2517a3e18 ("smb:
>>> client: fix TCP timers deadlock after rmmod").
> 
> Did it not fix those issues?  If not, we can reject that CVE, please let
> us know.

Yes, commit 4e7f1644f2ac did attempt to fix the issues introduced by
e9f2517a3e18, but it only fixed part of the issues introduced by e9f2517a3e18.

> 
>>> 2. As I've previously discussed with Greg Kroah-Hartman on the kernel mailing list[1],
>>>      commit e9f2517a3e18 (which was intended to address CVE-2024-54680):
>>>      - Failed to address the actual null pointer dereference in lockdep
>>>      - Introduced multiple serious issues:
>>>        - Socket leak vulnerability (bugzilla #219972)
>>>        - Network namespace refcount imbalance (bugzilla #219792)
> 
> So this commit did not actually do anything?  If so, we can reject this
> CVE.
> 

e9f2517a3e18 did not fix any issues and instead introduced a series of problems.

Here's the actual sequence:

1. CVE-2024-53095 vulnerability: Use-after-free of network namespace in
    SMB client and it's correct fix: ef7134c7fc48 by Kuniyuki Iwashima
3. Problematic patch: e9f2517a3e18 (intended for CVE-2024-54680) fixed
    nothing and introduced new issues while trying to "fix" a non-existent
    deadlock. ** CVE-2024-54680 has been rejected **
4. Attempted fix for some reference count issues: My patch 4e7f1644f2ac
    (assigned CVE-2025-22077)
5. Final resolution: Revert the problematic patch e9f2517a3e18 via commit
    95d2b9f693ff ("Revert "smb: client: fix TCP timers deadlock after rmmod"").

What I'm requesting:
- CVE-2025-22077 should be associated with commit 95d2b9f693ff, which is the actual
   final fix.

Best regards,
Wang Zhaolong

