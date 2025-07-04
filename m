Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577951FC8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 03:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751598884; cv=none; b=fK1VncTxhHrDNaXe2+KTrgdTl1UREhwuxcwxPUOlcz6Jjgyo/xLkC73BNz5Y18U3sfWpx1lfAovvMN9L9iar1CBo5+cmRfTYkCPYOr/W/KHiiOJcyv9Z8rhoB0VoLkFb9NqZzi50o6lHy+EBntsB+HwxJSg/903c6GNQ3wxg3n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751598884; c=relaxed/simple;
	bh=HtV0PZn+EU4iqH17KxN8XV1Ydog/aZwOP4+VbaRDQt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QYvgmuwiTSwMHme3feSF+Z7q0RBGPEXA1q+YNN5XDxNCdD5/qlsmvDtIsWg8EqjT4ZXmGHlMn3T2ql6Qkl5S8GDiIB2AwWV8lokv8yQGbyS42leiEi5gpm+NsdwiBBcByoq8B87Ylp4rNerhqwxH7Y2QnA3K/jnav1fFbdKnMYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CmwsRs49; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CmwsRs49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=ws2N6ILMZE4JuLfuUO56NKs/Ry8ltGQHSySCSEHKjto=;
	b=CmwsRs49/PFls3rVZA+fmabR2bgJy1r5murQbjchMAxBSlY/5d9Pj13Py1eziZ
	yfhshdjXpzsQXaOMbQr1J9Y/Vu5FMLMVEDnPoOZt1L90plMZ3/4CngUxdxnuokVp
	lfDuQvyAxraCE1LS/ud9cA4v46TFocaUNXxVxWd6g+koE=
Received: from [192.168.26.18] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBHfpAER2dooesOAA--.2124S2;
	Fri, 04 Jul 2025 11:14:13 +0800 (CST)
Message-ID: <e2b183cd-dfd7-4eb2-b454-8966e695a9b4@163.com>
Date: Fri, 4 Jul 2025 11:14:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
Subject: Re: [PATCH v1] mm/vmscan: Account hwpoisoned folios in reclaim
 statistics
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: zhengqi.arch@bytedance.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, wangxuewen <wangxuewen@kylinos.cn>
References: <20250702093440.146967-1-18810879172@163.com>
 <32a0cfdd-3f6e-47af-86f6-248149ae51ae@redhat.com>
From: wangxuewen <18810879172@163.com>
In-Reply-To: <32a0cfdd-3f6e-47af-86f6-248149ae51ae@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgBHfpAER2dooesOAA--.2124S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF43Zry3WF1fJryfJrWrZrb_yoWfWFX_Ca
	yvg397KrWjqa9F93Z8Awn3XF42g397W3yUZFyUJ3ZrAa45X3sxAFs3Krs8AFyFgrs8tasx
	GFnYvrsIyw429jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjFAp7UUUUU==
X-CM-SenderInfo: rprymiyqyxmiixs6il2tof0z/1tbiYhSA9WhnRrELqgAAsa

> Hi David,
>  
> Thank you for your insightful feedback. You make an excellent point - 
> hwpoisoned pages are indeed not truly "reclaimed" as they don't contribute 
> to available memory but represent permanently lost capacity.
>  
> I will drop this patch.
>  
> Best regards,
> wangxuewen



在 2025/7/2 17:44, David Hildenbrand 写道:
> On 02.07.25 11:34, 18810879172@163.com wrote:
>> From: wangxuewen <wangxuewen@kylinos.cn>
>>
>> When encountering a hardware-poisoned folio in shrink_folio_list(),
>> we unmap and release the folio but fail to account it in the reclaim
>> statistics (sc->nr_reclaimed). This leads to an undercount of
>> actually reclaimed pages, potentially causing unnecessary additional
>> reclaim pressure.
> 
> I'll just note that this kind-of makes sense: the memory is not actually 
> reclaimed -- we don't get free memory back. The hwpoisoned page is lost.
> 

