Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446132571C2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 02:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745203524; cv=none; b=iyneAgfDrFxoggf1S1PRCKxdDrSFJMKN2p42PcdQlUNAJXvXdqzgaKRjvx0TLL8JsjTxBNZV0CXMfw+hfmDxlndvyoxs03pJsRIM5ua4OLnyxeExFDtEr0c35N9lBWlcccTlJL+u1ZX/iRqaHAsu2Tnu/sdjMVog0VOUNM2mOfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745203524; c=relaxed/simple;
	bh=5Lfdw020RvW8ZqZJ+w5NGkPHNmwYs6jOXtSJ4CBaPv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=un71p8ORPW/0kjqXLf6OXhXbUwD3Swwrho54KSfQWFMYMY8cyA91Ofu8r9ysRc1eAKgQCa5KWCInxzhAHCm4JqzfC7oHUV+Ug7e5ugKyUvYeBH6iit+Nqe52tB2+YdNLBru36OuTYv3d4mbrFBa5eGZTeL+HIJ4gf6GmJJapdOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NinYDjvb; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NinYDjvb"
Message-ID: <d4df6a61-f70b-4b79-9494-ddc571382674@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745203519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Lfdw020RvW8ZqZJ+w5NGkPHNmwYs6jOXtSJ4CBaPv8=;
	b=NinYDjvb8vYHaVWb3pHXCNAZXWrE4VxdXQVvHho++DzZVDK5OmSRbTrREbR3yjKaLLjAyf
	ddJwzXEQsJtkCqaCqISQZN7j9jTUszIw4tvKR3PL3t1smY+yYOrOSqRjsFQmIXBYkeI60l
	yoXpROa+bxx+tT9xPvbe0Sbp2BcJSGU=
Date: Mon, 21 Apr 2025 10:44:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] delayacct: use macro to simplify delayacct_end calls
To: yang.yang29@zte.com.cn
Cc: bsingharora@gmail.com, linux-kernel@vger.kernel.org, liuye@kylinos.cn,
 linux-mm@kvack.org, akpm@linux-foundation.org
References: <20250420115848388DXE4HgOnwCNl4IjrMloB6@zte.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <20250420115848388DXE4HgOnwCNl4IjrMloB6@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/4/20 11:58, yang.yang29@zte.com.cn 写道:
> Hi Ye Liu
>
>> Replace repetitive calls to delayacct_end() with a new macro
>> DELAYACCT_END to reduce code duplication.
>> No functional changes.
> Please CC akpm@linux-foundation.org and linux-mm@kvack.org
> next time.
>
> I think it's a good idea to use macros to reduce code duplication in
> functions. So what about also use macros to define
> void __delayacct_##type##_end().

Most functions can be replaced with macros, but considering that the
parameters of __delayacct_thrashing_end in this batch of functions are
inconsistent, is it worth using macro definitions only for other
functions? Or do you have any good ideas?

void __delayacct_blkio_end(struct task_struct *p)
void __delayacct_freepages_end(void)
void __delayacct_thrashing_end(bool *in_thrashing)
void __delayacct_swapin_end(void)                                     
void __delayacct_compact_end(void)
void __delayacct_wpcopy_end(void)

Thanks,
Ye Liu

> Thanks!
