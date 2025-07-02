Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE162F5E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 01:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751419800; cv=none; b=t8tysVgPDxWCsthTe/CsYv4tD1p702Y8fbWIfWDEOUzZjRuL4u7O3Gd/Ylv461RjKI6pOJTUMcnWGJcQiyYAugUePrs8qVfG5oeKitr+GTrzQ+iufbHUw48z9ZGrs9pEt/qt5Y/9EyOU6BTRRqNpDHfJ+5V9/KGDrzRB2PBpcHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751419800; c=relaxed/simple;
	bh=LDHM7jGxCnd+mr9Ygrzv5SVJP6Dmjk2nPKWQT0VRW/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRyRIeyqW040rEadLx7rIARFB1woUnUszk8gIboZPHaydXFcOQgj5lnSqrGouDdiD7XW+F/kxB0QLi+5WBPsm/5/La7A0GyKEwVxKYbO1btsC0KZ8dZgg3LWFCVPgfrgzlLv6VNiMr8XISR/c5mKetyVUngaNzrdm8lsaptl/+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nA9zp2rI; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nA9zp2rI"
Message-ID: <47333b7f-2eac-4f57-a9d2-2a7f24c8fa7d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751419786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPrS94lVOu7EmI9PYREdDlh0EO6H/zNHIWs+MvCReBI=;
	b=nA9zp2rIDXqL4jzjAR5plfd7uB0j/RUUL+bdMkXsWvyT5PSap3GreV6kZ7o8P0xqNqRSG3
	RzIcf1e9N92AKYdX/uvjqrwzkuME1+dZao9Qp0+McCpbkHZvDe0FWsQk4e5lfn4MPie2qm
	32F5oEnaKg4aRZTbjls//FK0VXFIMAc=
Date: Wed, 2 Jul 2025 09:29:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@redhat.com, 21cnbao@gmail.com, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com,
 mingzhe.yang@ly.com, stable@vger.kernel.org, Barry Song <baohua@kernel.org>,
 Lance Yang <ioworker0@gmail.com>
References: <20250701143100.6970-1-lance.yang@linux.dev>
 <20250701141705.ff1a446e6a25d7970b209c3e@linux-foundation.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250701141705.ff1a446e6a25d7970b209c3e@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/7/2 05:17, Andrew Morton wrote:
> On Tue,  1 Jul 2025 22:31:00 +0800 Lance Yang <ioworker0@gmail.com> wrote:
> 
>>   - Add Reported-by + Closes tags (per David)
>>   - Pick RB from Lorenzo - thanks!
>>   - Pick AB from David - thanks!
> 
> It generally isn't necessary to resend a patch to add these
> things - I update the changelog in place as they come in.
> 
> In this case I'll grab that Reported-by: and Closes:, thanks.

Ah, good to know that. Thanks for adding these tags!

