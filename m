Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FBD1FC0ED
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738824606; cv=none; b=SsqEOyLZ/BbyqfcuPhMpM1FEbUMeQOWGdyhyJRVn+GZ8T0bBwYxw4D+pPLT4DnfXTVdHtPUnQS4QDu/H+fAANCrbW95zrli0SKX3Jis5/a2AGi4D3bzRQRHAscnwFL+um/iKKkqGOkumXBUutF+lIm0tsSRWK9lOwMWh0InNNAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738824606; c=relaxed/simple;
	bh=ObfomC6Phg4kpnX6Ey+Q346fHAt3C/XuNCXC8xfv3QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoC8ADthhSZYmXAQLMsoNvxvS3fDpkp7hNaMgB7TtfZWpEvSX7DPaosmgbrLGBOQavJrX0DSOG3fD4CyqX0+4u6NgIHpqlyT2qorwVP9cCcOb7/XcvGTuJAlNT16GWnz2fx2cQdBVtIZWmouZMxfme3tAmgKbXotUJJH5Ep2NqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YpRzj6B4wz9sPd;
	Thu,  6 Feb 2025 07:30:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id neUGsg27D0lw; Thu,  6 Feb 2025 07:30:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YpRzj5CFcz9rvV;
	Thu,  6 Feb 2025 07:30:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A716A8B76E;
	Thu,  6 Feb 2025 07:30:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rWUP8yv4uFvM; Thu,  6 Feb 2025 07:30:09 +0100 (CET)
Received: from [192.168.202.221] (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E10648B763;
	Thu,  6 Feb 2025 07:30:08 +0100 (CET)
Message-ID: <5528c76d-d8f1-41be-a742-8bafa74c24f9@csgroup.eu>
Date: Thu, 6 Feb 2025 07:30:06 +0100
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
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <0c0c6af5-7766-6cc0-d141-d725b84bef09@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 06/02/2025 à 03:08, Miaohe Lin a écrit :
> On 2025/2/6 0:35, Christophe Leroy wrote:
>>
>>
>> Le 05/02/2025 à 03:39, Miaohe Lin a écrit :
>>> On 2025/1/24 6:24, kernel test robot wrote:
>>>> tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C97f4bcfeef7147c5a46408dd465329e6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744045189449604%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=x37VZjFG%2BB1zYyoDGgz4jIyUbSWx%2FCklH%2FgsDLGCW%2F4%3D&reserved=0 master
>>>> head:   d0d106a2bd21499901299160744e5fe9f4c83ddb
>>>> commit: f8142cf94d4737ea0c3baffb3b9bad8addcb9b6b hugetlb: make hugetlb depends on SYSFS or SYSCTL
>>>> date:   2 years, 4 months ago
>>>> config: powerpc-kismet-CONFIG_HUGETLBFS-CONFIG_PPC_8xx-0-0 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C97f4bcfeef7147c5a46408dd465329e6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744045189465052%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=QSCbgVZFsu%2BQN1b7xDiPsikJR93kWobuPsa%2BtqG3dZA%3D&reserved=0)
>>>> reproduce: (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250124%2F202501240611.LDmD2nkj-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C97f4bcfeef7147c5a46408dd465329e6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744045189472672%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=nT4smogT5pTgqIh7%2FCPD%2FpQsCqaBrxfN%2BtEER7l%2FyLY%3D&reserved=0)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202501240611.LDmD2nkj-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C97f4bcfeef7147c5a46408dd465329e6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638744045189480482%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=7yBcNLgmgW6BUZ55nHh%2F8fZqHGShaqGDKdotvIQ2Tl8%3D&reserved=0
>>>
>>> Thanks for report. Sorry for late respond. I was on my Spring Festival vacation.
>>>
>>>>
>>>> kismet warnings: (new ones prefixed by >>)
>>>>>> kismet: WARNING: unmet direct dependencies detected for HUGETLBFS when selected by PPC_8xx
>>>>      WARNING: unmet direct dependencies detected for HUGETLBFS
>>>>        Depends on [n]: (X86 || IA64 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
>>>>        Selected by [y]:
>>>>        - PPC_8xx [=y] && <choice>
>>>
>>> I am a bit confused. HUGETLBFS depends on SYSFS or SYSCTL. How can it be selected while SYSFS [=n] || SYSCTL [=n]?
>>> Or am I miss something?
>>
>> CONFIG_HUGETLBFS is selected by CONFIG_PPC_8xx, see commit 34536d780683 ("powerpc/8xx: Add a function to early map kernel via huge pages")
> 
> Thanks for your providing. But I'm saying that since HUGETLBFS depends on (SYSFS or SYSCTL), how CONFIG_PPC_8xx succeeds to select it while
> SYSFS and SYSCTL are disabled? I'm not really familiar with Kconfig but I assume Kconfig will confirm that the dependencies are satisfied
> before HUGETLBFS is enabled. Or am I miss something?

I suggest you read https://docs.kernel.org/kbuild/kconfig-language.html

Extract:

Note:
     select should be used with care. select will force a symbol to a 
value without visiting the dependencies. By abusing select you are able 
to select a symbol FOO even if FOO depends on BAR that is not set.

Christophe
