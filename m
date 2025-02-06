Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A96E225A4F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833606; cv=none; b=Qe2nDdhuyQbA6ZC71+mcr5v9I42uVEPJ4G6DJCRBtgpTWoeH0b1dAfqHcrpfbjlB1HLT+VrLGIURxsCRB6aCwrbkAbnwC7cPBCWWmrHKE0GArzDKwD3dmy1XMZswVr1xRr/TWlv0K1mm2tpFwf5znSrxZCdWT4hhg6+rhthHevc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833606; c=relaxed/simple;
	bh=QLBpb7Dh5FlSdfYTMWiGRZqWmT2NxG9TZMJ70mXobAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKmqYzolzVSZw2J/Y3+jmZNyGuQPVVeEH0ihcZMu/3NOMHP09cZbOyDI1kbhpHPc6xxB5ZbtzsuJifSzmv7tPdEHiZwAN5b29HPz5WQefc62wlH588MuUWxV44xOxIuLloHvc+g//O8wXHONkxOLM0qtpC7Vi0c5kCkTCMLMQgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YpW2113VQz9sPd;
	Thu,  6 Feb 2025 09:47:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id weBgdKPzt__3; Thu,  6 Feb 2025 09:47:21 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YpW210799z9rvV;
	Thu,  6 Feb 2025 09:47:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EB5948B774;
	Thu,  6 Feb 2025 09:47:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ZfJe-ItsVFtx; Thu,  6 Feb 2025 09:47:20 +0100 (CET)
Received: from [192.168.202.221] (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2788C8B763;
	Thu,  6 Feb 2025 09:47:20 +0100 (CET)
Message-ID: <5c99458f-4a91-485f-8a35-3618a992e2e4@csgroup.eu>
Date: Thu, 6 Feb 2025 09:47:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kismet: WARNING: unmet direct dependencies detected for HUGETLBFS
 when selected by PPC_8xx
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 kernel test robot <lkp@intel.com>
References: <202501240611.LDmD2nkj-lkp@intel.com>
 <29cf621d-db67-6c5c-0dc5-ebe79edc6cc6@huawei.com>
 <08a51873-7510-4552-9bb1-3ea7ef9fbc2d@csgroup.eu>
 <0c0c6af5-7766-6cc0-d141-d725b84bef09@huawei.com>
 <5528c76d-d8f1-41be-a742-8bafa74c24f9@csgroup.eu>
 <d6c06a9c-4d43-4528-c5d1-019f91087f30@huawei.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <d6c06a9c-4d43-4528-c5d1-019f91087f30@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 06/02/2025 à 08:12, Miaohe Lin a écrit :
> On 2025/2/6 14:30, Christophe Leroy wrote:
>>
>>
>> Le 06/02/2025 à 03:08, Miaohe Lin a écrit :
>>> On 2025/2/6 0:35, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 05/02/2025 à 03:39, Miaohe Lin a écrit :
>>>>> On 2025/1/24 6:24, kernel test robot wrote:
>>>>>> tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4568427e535f47ba6e7108dd467da005%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744227571348001%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=rpToSy%2BI2rTH5db2ST62gNZF0efdupnNQRpYevV2CRY%3D&reserved=0 master
>>>>>> head:   d0d106a2bd21499901299160744e5fe9f4c83ddb
>>>>>> commit: f8142cf94d4737ea0c3baffb3b9bad8addcb9b6b hugetlb: make hugetlb depends on SYSFS or SYSCTL
>>>>>> date:   2 years, 4 months ago
>>>>>> config: powerpc-kismet-CONFIG_HUGETLBFS-CONFIG_PPC_8xx-0-0 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4568427e535f47ba6e7108dd467da005%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744227571371397%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=27pzb6aOPaarlX2fX%2B3%2FvCp8GWwysleJoVw9L6Yrytc%3D&reserved=0)
>>>>>> reproduce: (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4568427e535f47ba6e7108dd467da005%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744227571381016%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=XEjM2tEaDz%2BINDJbCOD2ciJU24koPd9msdwNiP3lPLw%3D&reserved=0)
>>>>>>
>>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>>>> the same patch/commit), kindly add following tags
>>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>>> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202501240611.LDmD2nkj-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4568427e535f47ba6e7108dd467da005%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744227571390239%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=W%2F8GHsXQwmaG22bsTyQes1zdMG7o2aHc%2Fly%2BHO57LwI%3D&reserved=0
>>>>>
>>>>> Thanks for report. Sorry for late respond. I was on my Spring Festival vacation.
>>>>>
>>>>>>
>>>>>> kismet warnings: (new ones prefixed by >>)
>>>>>>>> kismet: WARNING: unmet direct dependencies detected for HUGETLBFS when selected by PPC_8xx
>>>>>>       WARNING: unmet direct dependencies detected for HUGETLBFS
>>>>>>         Depends on [n]: (X86 || IA64 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
>>>>>>         Selected by [y]:
>>>>>>         - PPC_8xx [=y] && <choice>
>>>>>
>>>>> I am a bit confused. HUGETLBFS depends on SYSFS or SYSCTL. How can it be selected while SYSFS [=n] || SYSCTL [=n]?
>>>>> Or am I miss something?
>>>>
>>>> CONFIG_HUGETLBFS is selected by CONFIG_PPC_8xx, see commit 34536d780683 ("powerpc/8xx: Add a function to early map kernel via huge pages")
>>>
>>> Thanks for your providing. But I'm saying that since HUGETLBFS depends on (SYSFS or SYSCTL), how CONFIG_PPC_8xx succeeds to select it while
>>> SYSFS and SYSCTL are disabled? I'm not really familiar with Kconfig but I assume Kconfig will confirm that the dependencies are satisfied
>>> before HUGETLBFS is enabled. Or am I miss something?
>>
>> I suggest you read https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.kernel.org%2Fkbuild%2Fkconfig-language.html&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4568427e535f47ba6e7108dd467da005%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744227571400924%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=UtQJlI0P7JV%2BQy0jlHFoGZ8ipnl5SzhuL1G%2Bbr0an9Y%3D&reserved=0
> 
> Thanks.
> 
>>
>> Extract:
>>
>> Note:
>>      select should be used with care. select will force a symbol to a value without visiting the dependencies. By abusing select you are able to select a symbol FOO even if FOO depends on BAR that is not set.
> 
> IMHO, it seems it's the use of "select" breaks the dependencies and leads to the kismet warnings. So it might be better to fix the PPC_8xx side.


The dependencies are wrong, I have a kernel without CONFIG_SYSFS and 
without CONFIG_SYSCTL and hugetlbfs works perfecly well.

I boot the kernel with following parameters:

	hugepagesz=512k hugepages=8 hugepagesz=8M hugepages=2

dmesg shows:

[    0.560754] HugeTLB: registered 512 KiB page size, pre-allocated 8 pages
[    0.567293] HugeTLB: 0 KiB vmemmap can be freed for a 512 KiB page
[    0.593912] HugeTLB: registered 8.00 MiB page size, pre-allocated 2 pages
[    0.600543] HugeTLB: 0 KiB vmemmap can be freed for a 8.00 MiB page


hugetlb selftest works well:

:~# ./map_hugetlb 4 19
TAP version 13
1..1
# 512 kB hugepages
# Mapping 4 Mbytes
# Returned address is 0x77800000
# First hex is 0
# First hex is 10203
ok 1 Read correct data
# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

~# ./map_hugetlb 16 23
TAP version 13
1..1
# 8192 kB hugepages
# Mapping 16 Mbytes
# Returned address is 0x76800000
# First hex is 0
# First hex is 10203
ok 1 Read correct data
# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

So I think your commit f8142cf94d47 ("hugetlb: make hugetlb depends on 
SYSFS or SYSCTL") is just wrong and has to be reverted.

Christophe
