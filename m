Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196D3B666
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 02:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743647824; cv=none; b=tlUU5atg/Z3cK8c2p2NJbsf589mAja4HHVwc5OAALx9Pbt+1T9TW9peaNDWCLgysKS27zcZvywe0Ugit489M/AmBgCr70WxTEMQtntJ6EWTizI9R2Rqd61gdAjlnLMTYePn6S9lIz4aaSzold/3khNuGXFSDXeSIXXeFK1YHQG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743647824; c=relaxed/simple;
	bh=kV73lSE2Bm8P3pDxd8cxT5COqevlMaeWbeyFigHjDNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t8lmHWSJ9ueMyU1naZ4M+OUBjYKYLD06mD7vRTlM8BH5YZz7HppaK1ogo72+mtMdzyptV9ntYhdd+OI2eICJtygUGM5iutDHCJG8JwXNB3Chhb8/Weuym5QUOvSfGIS0dicW2u3N7UBZ2LaptQpgP4HwoGDBnL/hhbndHAUrMFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZSm842dzTz1d0rb;
	Thu,  3 Apr 2025 10:36:20 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D73ED140383;
	Thu,  3 Apr 2025 10:36:52 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 3 Apr 2025 10:36:50 +0800
Message-ID: <78f82bf6-ec47-6b10-7c05-2189cc262f13@huawei.com>
Date: Thu, 3 Apr 2025 10:36:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v13 2/5] arm64: add support for ARCH_HAS_COPY_MC
To: Yeoreum Yun <yeoreum.yun@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland
	<mark.rutland@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<kasan-dev@googlegroups.com>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-3-tongtiangen@huawei.com> <Z6zKfvxKnRlyNzkX@arm.com>
 <df40840d-e860-397d-60bd-02f4b2d0b433@huawei.com>
 <Z+bXE7UNWFLEfhQC@e129823.arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Z+bXE7UNWFLEfhQC@e129823.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)



在 2025/3/29 1:06, Yeoreum Yun 写道:
> Hi,
> 
>>
>>
>> 在 2025/2/13 0:21, Catalin Marinas 写道:
>>> (catching up with old threads)
>>>
>>> On Mon, Dec 09, 2024 at 10:42:54AM +0800, Tong Tiangen wrote:
>>>> For the arm64 kernel, when it processes hardware memory errors for
>>>> synchronize notifications(do_sea()), if the errors is consumed within the
>>>> kernel, the current processing is panic. However, it is not optimal.
>>>>
>>>> Take copy_from/to_user for example, If ld* triggers a memory error, even in
>>>> kernel mode, only the associated process is affected. Killing the user
>>>> process and isolating the corrupt page is a better choice.
>>>
>>> I agree that killing the user process and isolating the page is a better
>>> choice but I don't see how the latter happens after this patch. Which
>>> page would be isolated?
>>
>> The SEA is triggered when the page with hardware error is read. After
>> that, the page is isolated in memory_failure() (mf). The processing of
>> mf is mentioned in the comments of do_sea().
>>
>> /*
>>   * APEI claimed this as a firmware-first notification.
>>   * Some processing deferred to task_work before ret_to_user().
>>   */
>>
>> Some processing include mf.
>>
>>>
>>>> Add new fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR to identify insn
>>>> that can recover from memory errors triggered by access to kernel memory,
>>>> and this fixup type is used in __arch_copy_to_user(), This make the regular
>>>> copy_to_user() will handle kernel memory errors.
>>>
>>> Is the assumption that the error on accessing kernel memory is
>>> transient? There's no way to isolate the kernel page and also no point
>>> in isolating the destination page either.
>>
>> Yes, it's transient, the kernel page in mf can't be isolated, the
>> transient access (ld) of this kernel page is currently expected to kill
>> the user-mode process to avoid error spread.
> 
> I'm not sure about how this works.
> IIUC, the memory_failure() wouldn't kill any process if page which
> raises sea is kernel page (because this wasn't mapped).

right.

> 
> But, to mark the kernel page as posision, I think it also need to call
> apei_claim_sea() in !user_mode().
> What about calling the apei_claim_sea() when fix_exception_me()
> successed only in !user_mode() case?

This was discussed with Mark in V12:
https://lore.kernel.org/lkml/20240528085915.1955987-3-tongtiangen@huawei.com/

Sorry for didn't catch your reply in time:)

Thanks,
Tong.

> 
> Thanks.
>>
>> The SEA processes synchronization errors. Only hardware errors on the
>> source page can be detected (Through synchronous ld insn) and processed.
>> The destination page cannot be processed.
>>
>>>
>>
> .
