Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A221F227B8B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841949; cv=none; b=BpRVVdPmPimfHSbfZTODM5WEpFus1TabVoLl0EQrFeLGPSktiQ6GE5p51P4SOvYUBbtzYyDnXQ/SV6Z7/j5w+sLcaYN4xAmSETmz2xQneUik+rXqvEZTP3vbmjwSnw08aZF3HYW+YeeazSZO9p/t4P7TJNlDDGJEq7mp5PpwD7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841949; c=relaxed/simple;
	bh=YgOJD+kd2mC/GASdIn57a6LE/LeB1QV1j6FJAJ2yk94=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=CdvzG3IgKc2M4G7l//AQtJanHuqXK0pvkq785mbPoshFk6KYYNBKnJ+YAsuXCsxx6htMawyyuJrATCKbAuS+zsKBTBuaEPZ9nYoHq3slz990fqPOCpAgzZUWYPTWNzvDe280Y3boHScDDWp/w+JCTitvSdfTIUgIMoY493q2y+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4YpZlw722fz1V66D;
	Thu,  6 Feb 2025 19:35:24 +0800 (CST)
Received: from kwepemd200019.china.huawei.com (unknown [7.221.188.193])
	by mail.maildlp.com (Postfix) with ESMTPS id D2DF01A0188;
	Thu,  6 Feb 2025 19:39:03 +0800 (CST)
Received: from [10.173.127.72] (10.173.127.72) by
 kwepemd200019.china.huawei.com (7.221.188.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 6 Feb 2025 19:39:02 +0800
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
 <0c0c6af5-7766-6cc0-d141-d725b84bef09@huawei.com>
 <5528c76d-d8f1-41be-a742-8bafa74c24f9@csgroup.eu>
 <d6c06a9c-4d43-4528-c5d1-019f91087f30@huawei.com>
 <5c99458f-4a91-485f-8a35-3618a992e2e4@csgroup.eu>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <053701eb-b2da-b3e2-de16-50384805b69f@huawei.com>
Date: Thu, 6 Feb 2025 19:39:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <5c99458f-4a91-485f-8a35-3618a992e2e4@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200019.china.huawei.com (7.221.188.193)

On 2025/2/6 16:47, Christophe Leroy wrote:
> 
> 
> Le 06/02/2025 à 08:12, Miaohe Lin a écrit :
>> On 2025/2/6 14:30, Christophe Leroy wrote:
>>>
>>>
>>> Le 06/02/2025 à 03:08, Miaohe Lin a écrit :
>>>> On 2025/2/6 0:35, Christophe Leroy wrote:
>>>>>
>>>>>
>>>>> Le 05/02/2025 à 03:39, Miaohe Lin a écrit :
>>>>>> On 2025/1/24 6:24, kernel test robot wrote:
>>>>>>> tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4568427e535f47ba6e7108dd467da005%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744227571348001%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=rpToSy%2BI2rTH5db2ST62gNZF0efdupnNQRpYevV2CRY%3D&reserved=0 master
>>>>>>> head:   d0d106a2bd21499901299160744e5fe9f4c83ddb
>>>>>>> commit: f8142cf94d4737ea0c3baffb3b9bad8addcb9b6b hugetlb: make hugetlb depends on SYSFS or SYSCTL
>>>>>>> date:   2 years, 4 months ago
>>>>>>> config: powerpc-kismet-CONFIG_HUGETLBFS-CONFIG_PPC_8xx-0-0 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4568427e535f47ba6e7108dd467da005%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744227571371397%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=27pzb6aOPaarlX2fX%2B3%2FvCp8GWwysleJoVw9L6Yrytc%3D&reserved=0)
>>>>>>> reproduce: (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4568427e535f47ba6e7108dd467da005%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744227571381016%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=XEjM2tEaDz%2BINDJbCOD2ciJU24koPd9msdwNiP3lPLw%3D&reserved=0)
>>>>>>>
>>>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>>>>> the same patch/commit), kindly add following tags
>>>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>>>> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202501240611.LDmD2nkj-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4568427e535f47ba6e7108dd467da005%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744227571390239%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=W%2F8GHsXQwmaG22bsTyQes1zdMG7o2aHc%2Fly%2BHO57LwI%3D&reserved=0
>>>>>>
>>>>>> Thanks for report. Sorry for late respond. I was on my Spring Festival vacation.
>>>>>>
>>>>>>>
>>>>>>> kismet warnings: (new ones prefixed by >>)
>>>>>>>>> kismet: WARNING: unmet direct dependencies detected for HUGETLBFS when selected by PPC_8xx
>>>>>>>       WARNING: unmet direct dependencies detected for HUGETLBFS
>>>>>>>         Depends on [n]: (X86 || IA64 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
>>>>>>>         Selected by [y]:
>>>>>>>         - PPC_8xx [=y] && <choice>
>>>>>>
>>>>>> I am a bit confused. HUGETLBFS depends on SYSFS or SYSCTL. How can it be selected while SYSFS [=n] || SYSCTL [=n]?
>>>>>> Or am I miss something?
>>>>>
>>>>> CONFIG_HUGETLBFS is selected by CONFIG_PPC_8xx, see commit 34536d780683 ("powerpc/8xx: Add a function to early map kernel via huge pages")
>>>>
>>>> Thanks for your providing. But I'm saying that since HUGETLBFS depends on (SYSFS or SYSCTL), how CONFIG_PPC_8xx succeeds to select it while
>>>> SYSFS and SYSCTL are disabled? I'm not really familiar with Kconfig but I assume Kconfig will confirm that the dependencies are satisfied
>>>> before HUGETLBFS is enabled. Or am I miss something?
>>>
>>> I suggest you read https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.kernel.org%2Fkbuild%2Fkconfig-language.html&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4568427e535f47ba6e7108dd467da005%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744227571400924%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=UtQJlI0P7JV%2BQy0jlHFoGZ8ipnl5SzhuL1G%2Bbr0an9Y%3D&reserved=0
>>
>> Thanks.
>>
>>>
>>> Extract:
>>>
>>> Note:
>>>      select should be used with care. select will force a symbol to a value without visiting the dependencies. By abusing select you are able to select a symbol FOO even if FOO depends on BAR that is not set.
>>
>> IMHO, it seems it's the use of "select" breaks the dependencies and leads to the kismet warnings. So it might be better to fix the PPC_8xx side.
> 
> 
> The dependencies are wrong, I have a kernel without CONFIG_SYSFS and without CONFIG_SYSCTL and hugetlbfs works perfecly well.
> 
> I boot the kernel with following parameters:
> 
>     hugepagesz=512k hugepages=8 hugepagesz=8M hugepages=2

I think you are right. Hugetlb can still be used with boot parameter while CONFIG_SYSFS and CONFIG_SYSCTL are disabled.
So my commit should be reverted.

Thanks.
.
