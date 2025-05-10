Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A73221E0BD;
	Sat, 10 May 2025 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746869628; cv=none; b=BR83jvwf+CiOpHaw1mIHo3BqasHPPAbxp6Hchh3ZEV3ZB0Pjn73BKGrmXkP4R7BzHwk7nNZKh6YEkTtf7fcx7xCqGmJX3M1U+Op2eiplPxhgtuMAC7zQ3+gbdYtz/8XHe1jeAh32M88WAhQaL3jhBnNSbuRncvuFdT2062jiL5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746869628; c=relaxed/simple;
	bh=QDkX+YL1aX3YLw34wuaL/idxMcOuJkwTLhZRvryKTFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MfWDUhqr7pK+dXkM+Zp8ZCh4XSXQf0ugHR/FFKZrFqP+u3d9K4upjCzn99XFBq5QkhAqMKzAddS+A6tIp2m5GQRd/CxFyB2jVZc2lhehYsQXanFWvp18IrFS4oJDYmHX8eTObBSTU0vSBGaUdtyTWU+9fOUICKCidyKgbATumZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZvgYd2qgRzyTcT;
	Sat, 10 May 2025 17:29:25 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 26420140154;
	Sat, 10 May 2025 17:33:42 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 kwepemg500010.china.huawei.com (7.202.181.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 10 May 2025 17:33:41 +0800
Message-ID: <d2ab4035-d893-44b6-a511-656b5177ba74@huawei.com>
Date: Sat, 10 May 2025 17:33:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2025-37835: smb: client: Fix netns refcount imbalance causing
 leaks and use-after-free
To: <cve@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-cve-announce@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@kernel.org>
References: <2025050908-CVE-2025-37835-546f@gregkh>
From: Wang Zhaolong <wangzhaolong1@huawei.com>
In-Reply-To: <2025050908-CVE-2025-37835-546f@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemg500010.china.huawei.com (7.202.181.71)


> 
> Affected and fixed versions
> ===========================
> 
> 	Issue introduced in 6.6.62 with commit e8c71494181153a134c96da28766a57bd1eac8cb and fixed in 6.6.87 with commit c6b6b8dcef4adf8ee4e439bb97e74106096c71b8
> 	Issue introduced in 6.12 with commit ef7134c7fc48e1441b398e55a862232868a6f0a7 and fixed in 6.12.23 with commit 7d8dfc27d90d41627c0d6ada97ed0ab57b3dae25
> 	Issue introduced in 6.12 with commit ef7134c7fc48e1441b398e55a862232868a6f0a7 and fixed in 6.13.11 with commit 961755d0055e0e96d1849cc0425da966c8a64e53
> 	Issue introduced in 6.12 with commit ef7134c7fc48e1441b398e55a862232868a6f0a7 and fixed in 6.14.2 with commit 476617a4ca0123f0df677d547a82a110c27c8c74
> 	Issue introduced in 6.12 with commit ef7134c7fc48e1441b398e55a862232868a6f0a7 and fixed in 6.15-rc1 with commit 4e7f1644f2ac6d01dc584f6301c3b1d5aac4eaef
> 	Issue introduced in 6.11.9 with commit c7f9282fc27fc36dbaffc8527c723de264a132f8
> 
> Please see https://www.kernel.org for a full list of currently supported
> kernel versions by the kernel community.
> 
> Unaffected versions might change over time as fixes are backported to
> older supported kernel versions.  The official CVE entry at
> 	https://cve.org/CVERecord/?id=CVE-2025-37835
> will be updated if fixes are backported, please check that for the most
> up to date information about this issue.

Hello,

This CVE has already been submitted previously, under the identifier
CVE-2025-22077.

The relevant discussion can be found in the following link:

https://lore.kernel.org/all/b7822cca-5ef5-4e09-bca1-2857aada4741@huawei.com/

Is this a redundant submission?

Best regards,
Wang Zhaolong


