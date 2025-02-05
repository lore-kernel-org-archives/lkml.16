Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D62200A3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 02:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738723166; cv=none; b=NbQyjb+bVRQE7qWf9HbR0S+fyGanxRmRimKGOReWp09nL5a6bhimP4bfVV26TW5+vU8yETgkbyXFj3819YprF1EqyeulfrKQqaud9NqnnhR4sITD5oOv43D8xZv2dxYIlE3iCciDtEXH9UOsBU2B3x698psGiZ8oxh9904EW7Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738723166; c=relaxed/simple;
	bh=38AKHaCQvoVVI/T5VaJW6F/e9VZ10bpm5wvEEx0HMi0=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=rO6vdINipbKBPJ/FlRmf+KnOJAhgSI4HyowXChokWFvtuvMXlN64iBc222s3Vs5RvkBzUJhxhwtb/wjLDZk471x+WuavihcRrSUbmpqBTJKSMP9Ehtil813sjAOCOH6X1GDf/tCeOaMd4tk2HECYEPoNJHqCN2RwwL3Gy0+p+5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Ynkrh6fS8z22mPq;
	Wed,  5 Feb 2025 10:36:36 +0800 (CST)
Received: from kwepemd200019.china.huawei.com (unknown [7.221.188.193])
	by mail.maildlp.com (Postfix) with ESMTPS id D23C21A016C;
	Wed,  5 Feb 2025 10:39:21 +0800 (CST)
Received: from [10.173.127.72] (10.173.127.72) by
 kwepemd200019.china.huawei.com (7.221.188.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 5 Feb 2025 10:39:21 +0800
Subject: Re: kismet: WARNING: unmet direct dependencies detected for HUGETLBFS
 when selected by PPC_8xx
To: kernel test robot <lkp@intel.com>
CC: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran
	<fazilyildiran@gmail.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
References: <202501240611.LDmD2nkj-lkp@intel.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <29cf621d-db67-6c5c-0dc5-ebe79edc6cc6@huawei.com>
Date: Wed, 5 Feb 2025 10:39:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <202501240611.LDmD2nkj-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200019.china.huawei.com (7.221.188.193)

On 2025/1/24 6:24, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   d0d106a2bd21499901299160744e5fe9f4c83ddb
> commit: f8142cf94d4737ea0c3baffb3b9bad8addcb9b6b hugetlb: make hugetlb depends on SYSFS or SYSCTL
> date:   2 years, 4 months ago
> config: powerpc-kismet-CONFIG_HUGETLBFS-CONFIG_PPC_8xx-0-0 (https://download.01.org/0day-ci/archive/20250124/202501240611.LDmD2nkj-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240611.LDmD2nkj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501240611.LDmD2nkj-lkp@intel.com/

Thanks for report. Sorry for late respond. I was on my Spring Festival vacation.

> 
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for HUGETLBFS when selected by PPC_8xx
>    WARNING: unmet direct dependencies detected for HUGETLBFS
>      Depends on [n]: (X86 || IA64 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
>      Selected by [y]:
>      - PPC_8xx [=y] && <choice>

I am a bit confused. HUGETLBFS depends on SYSFS or SYSCTL. How can it be selected while SYSFS [=n] || SYSCTL [=n]?
Or am I miss something?

Thanks.
.

