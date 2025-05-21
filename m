Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0764B1854
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747792115; cv=none; b=sTLotxaRqVs+oUJP7YQnDl5AuiCvy0/FGjN4g7Gxzh8zIzjpPYG/WpH9GJXhoSdnVlMA71nizyurmWsd+m2/4O8H/pmpe6GzHkNeapcdzoEs7jVk9+ZBV5h7v2xQrVkBHKwA712WZZkJd2qKjRuDcDEisWZ1HI7kfbCUIXGRoro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747792115; c=relaxed/simple;
	bh=MbuindGVZT7o6dPEQ+JFFRipSM+B0FXrzF7208oXICM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pS2VTAFe7FsISHm/vyCkykzdUq4n9h/i/sehsSimhhmPoWfqMPjUTdxJW34k6TWYYlCCiMcecx9F1JSzPeZGFYAbsJDBMYxOoXybh6NOVZJw/jtCx9X103u1IatsuTKb4rmZKznJj1X5/oQwGPJnNGDBfi1RTz5+KPsvRiQt7jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4b2Dp40XMvz4f3lDq
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:47:56 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 8A1421A12CF
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:48:22 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP3 (Coremail) with SMTP id _Ch0CgAHp8HkMC1o7sJXMw--.49119S2;
	Wed, 21 May 2025 09:48:22 +0800 (CST)
Message-ID: <eacf9cf7-7c93-4e68-b6f3-cf6b252a802a@huaweicloud.com>
Date: Wed, 21 May 2025 09:48:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC next v2 0/2] ucounts: turn the atomic rlimit to
 percpu_counter
To: Jann Horn <jannh@google.com>, Alexey Gladkov <legion@kernel.org>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, pfalcato@suse.de,
 bigeasy@linutronix.de, paulmck@kernel.org, chenridong@huawei.com,
 roman.gushchin@linux.dev, brauner@kernel.org, pmladek@suse.com,
 geert@linux-m68k.org, mingo@kernel.org, rrangel@chromium.org,
 francesco@valla.it, kpsingh@kernel.org, guoweikang.kernel@gmail.com,
 link@vivo.com, viro@zeniv.linux.org.uk, neil@brown.name, nichen@iscas.ac.cn,
 tglx@linutronix.de, frederic@kernel.org, peterz@infradead.org,
 oleg@redhat.com, joel.granados@kernel.org, linux@weissschuh.net,
 avagin@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lujialin4@huawei.com, "Serge E. Hallyn" <serge@hallyn.com>,
 David Howells <dhowells@redhat.com>
References: <20250519131151.988900-1-chenridong@huaweicloud.com>
 <CAG48ez2bFhYYj2qkJk3j5t=3VwYUH4sSMuohyC=MfrRw-bv22g@mail.gmail.com>
 <aCucJ9731YzaZI5b@example.org>
 <CAG48ez01rRTsB0PcxsrzcbMeVnr2bPjigc15GpFCoKQmdzmGrg@mail.gmail.com>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <CAG48ez01rRTsB0PcxsrzcbMeVnr2bPjigc15GpFCoKQmdzmGrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgAHp8HkMC1o7sJXMw--.49119S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr4UGr18ur45JryUuF1Dtrb_yoW5Zw45pF
	W2y3Z8Kan5JFnxAwn2qw18Xa4rKr4fJryUX3W5G3yxA3Z0kFyS9F17t3yYkF9rGr4fK34j
	vF4jg347AFWDXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8
	Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUsPfHUUUUU
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/



On 2025/5/20 5:24, Jann Horn wrote:
> On Mon, May 19, 2025 at 11:01 PM Alexey Gladkov <legion@kernel.org> wrote:
>> On Mon, May 19, 2025 at 09:32:17PM +0200, Jann Horn wrote:
>>> On Mon, May 19, 2025 at 3:25 PM Chen Ridong <chenridong@huaweicloud.com> wrote:
>>>> From: Chen Ridong <chenridong@huawei.com>
>>>>
>>>> The will-it-scale test case signal1 [1] has been observed. and the test
>>>> results reveal that the signal sending system call lacks linearity.
>>>> To further investigate this issue, we initiated a series of tests by
>>>> launching varying numbers of dockers and closely monitored the throughput
>>>> of each individual docker. The detailed test outcomes are presented as
>>>> follows:
>>>>
>>>>         | Dockers     |1      |4      |8      |16     |32     |64     |
>>>>         | Throughput  |380068 |353204 |308948 |306453 |180659 |129152 |
>>>>
>>>> The data clearly demonstrates a discernible trend: as the quantity of
>>>> dockers increases, the throughput per container progressively declines.
>>>
>>> But is that actually a problem? Do you have real workloads that
>>> concurrently send so many signals, or create inotify watches so
>>> quickly, that this is has an actual performance impact?
>>>
>>>> In-depth analysis has identified the root cause of this performance
>>>> degradation. The ucouts module conducts statistics on rlimit, which
>>>> involves a significant number of atomic operations. These atomic
>>>> operations, when acting on the same variable, trigger a substantial number
>>>> of cache misses or remote accesses, ultimately resulting in a drop in
>>>> performance.
>>>
>>> You're probably running into the namespace-associated ucounts here? So
>>> the issue is probably that Docker creates all your containers with the
>>> same owner UID (EUID at namespace creation), causing them all to
>>> account towards a single ucount, while normally outside of containers,
>>> each RUID has its own ucount instance?
>>>
>>> Sharing of rlimits between containers is probably normally undesirable
>>> even without the cacheline bouncing, because it means that too much
>>> resource usage in one container can cause resource allocations in
>>> another container to fail... so I think the real problem here is at a
>>> higher level, in the namespace setup code. Maybe root should be able
>>> to create a namespace that doesn't inherit ucount limits of its owner
>>> UID, or something like that...
>>
>> If we allow rlimits not to be inherited in the userns being created, the
>> user will be able to bypass their rlimits by running a fork bomb inside
>> the new userns.
>>
>> Or I missed your point ?
> 
> You're right, I guess it would actually still be necessary to have one
> shared limit across the entire container, so rather than not having a
> namespace-level ucount, maybe it would make more sense to have a
> private ucount instance for a container...
> 

It sounds like the private ucounts were what I was trying to implement
in version 1? It applies batch counts from the parent for each user
namespace, but the approach is complex.

Best regards,
Ridong

> (But to be clear I'm not invested in this suggestion at all, I just
> looked at that patch and was wondering about alternatives if that is
> actually a real performance problem...)

