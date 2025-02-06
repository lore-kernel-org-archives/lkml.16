Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A9B59B71
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 02:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738807725; cv=none; b=q3OrGDiWcvYc6HRQbmA+aeu3cOR5M/0CILnAeaYw1tJYFSpJhZNZ5BUyd4WFAZNzGIsR5avO7oDn3ThqgCGCjuQFxoLcahv9IxvM3FKThbCznPIJRO790VerwTtGs2YY3oQT0b0R2mzvSud+V0/Dr2zuqiEo9UbBCphQgWPEY5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738807725; c=relaxed/simple;
	bh=9c7C1CqHgHBAKCGd3jALYWsIRNhtErJ+Nt/N67wkbvk=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=r3kaXjH7a9ZnGosnxby6sRX5WSXxTgTAxvRjrcUpbxINpRyoh0jjAioJQqaCVYTpPiv4OpuWOiECiXosPozt5V1tsc/TegxEOn9hykSsxId3xvYzsTEjV5SftcSxcU5WmaXSJaIzep6J1inqdBt1YIvJu5d6s8VOCgqidwN48FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YpL5g0xQhz2FcvK;
	Thu,  6 Feb 2025 10:04:55 +0800 (CST)
Received: from kwepemd200019.china.huawei.com (unknown [7.221.188.193])
	by mail.maildlp.com (Postfix) with ESMTPS id E036D140118;
	Thu,  6 Feb 2025 10:08:32 +0800 (CST)
Received: from [10.173.127.72] (10.173.127.72) by
 kwepemd200019.china.huawei.com (7.221.188.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 6 Feb 2025 10:08:32 +0800
Subject: Re: kismet: WARNING: unmet direct dependencies detected for HUGETLBFS
 when selected by PPC_8xx
To: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran
	<fazilyildiran@gmail.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, kernel test
 robot <lkp@intel.com>
References: <202501240611.LDmD2nkj-lkp@intel.com>
 <29cf621d-db67-6c5c-0dc5-ebe79edc6cc6@huawei.com>
 <08a51873-7510-4552-9bb1-3ea7ef9fbc2d@csgroup.eu>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <0c0c6af5-7766-6cc0-d141-d725b84bef09@huawei.com>
Date: Thu, 6 Feb 2025 10:08:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <08a51873-7510-4552-9bb1-3ea7ef9fbc2d@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200019.china.huawei.com (7.221.188.193)

On 2025/2/6 0:35, Christophe Leroy wrote:
> 
> 
> Le 05/02/2025 à 03:39, Miaohe Lin a écrit :
>> On 2025/1/24 6:24, kernel test robot wrote:
>>> tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9284805dd2a148bd1d7e08dd458e511f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638743199757464439%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=LU9lidWjjJE3vf0TPBp1wIvUFpjnpPKq2zQVxu4Ru%2F0%3D&reserved=0 master
>>> head:   d0d106a2bd21499901299160744e5fe9f4c83ddb
>>> commit: f8142cf94d4737ea0c3baffb3b9bad8addcb9b6b hugetlb: make hugetlb depends on SYSFS or SYSCTL
>>> date:   2 years, 4 months ago
>>> config: powerpc-kismet-CONFIG_HUGETLBFS-CONFIG_PPC_8xx-0-0 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9284805dd2a148bd1d7e08dd458e511f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638743199757478112%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=9%2B4B2T41tw4xvlAkYIeOEhK9PrH17GM7KrhEOyKDxMM%3D&reserved=0)
>>> reproduce: (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9284805dd2a148bd1d7e08dd458e511f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638743199757485680%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=SDjSwdEccwtqN8L4VzuYnAhq3nchpJdBi%2FaJGloeZ40%3D&reserved=0)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202501240611.LDmD2nkj-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9284805dd2a148bd1d7e08dd458e511f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638743199757493154%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=DdGGMh1x6g6a%2F7hcgqmSBASk14QpA4%2F%2FmI2ztozklts%3D&reserved=0
>>
>> Thanks for report. Sorry for late respond. I was on my Spring Festival vacation.
>>
>>>
>>> kismet warnings: (new ones prefixed by >>)
>>>>> kismet: WARNING: unmet direct dependencies detected for HUGETLBFS when selected by PPC_8xx
>>>     WARNING: unmet direct dependencies detected for HUGETLBFS
>>>       Depends on [n]: (X86 || IA64 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
>>>       Selected by [y]:
>>>       - PPC_8xx [=y] && <choice>
>>
>> I am a bit confused. HUGETLBFS depends on SYSFS or SYSCTL. How can it be selected while SYSFS [=n] || SYSCTL [=n]?
>> Or am I miss something?
> 
> CONFIG_HUGETLBFS is selected by CONFIG_PPC_8xx, see commit 34536d780683 ("powerpc/8xx: Add a function to early map kernel via huge pages")

Thanks for your providing. But I'm saying that since HUGETLBFS depends on (SYSFS or SYSCTL), how CONFIG_PPC_8xx succeeds to select it while
SYSFS and SYSCTL are disabled? I'm not really familiar with Kconfig but I assume Kconfig will confirm that the dependencies are satisfied
before HUGETLBFS is enabled. Or am I miss something?

Thank.
.
