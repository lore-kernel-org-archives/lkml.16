Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B12C7485
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747765591; cv=none; b=JanNWt5SzJeSpPkqh0ZbaWXumcntVztTi+FGZm8UNTy0RGkBUnxTwLmg1DyV2yIpuEaD9sjAu0OekO96p3pl+AyG2dJDQGrBW/hcrRdo9RHD/seQX0e5kEh1BLBE9rGjRrekIW3WBqzUhAc5c+rhN+IAQQ+8kxrS1Tel2pTEekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747765591; c=relaxed/simple;
	bh=bXCaQrTI2i+zn9W34y3m9O2P4sfdV4wreHAf43KPX7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaX5NvmQ4gISUJ4iXQBdTNc+mkEqQKFR+zgqyMzh1vIUJvBpBaULCrt4HHDhPYMb+7R6Avs8nPZLjJawRWum+yYCA/FbEk+fPTXXGs2aUfjt5WDx6/qJKJPRayvh0cfyMTUu25VpZYJgnK5SW4Gkf+xlGtHDAqAk9X8ytVfpDRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qFA8lg0I; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qFA8lg0I"
Message-ID: <b932c4b8-a45d-4da3-8ef9-f45055830609@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747765577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SSGVVvj/o1r+R0aA03QBvXfE7OdysBvf0GHLfuZbsiY=;
	b=qFA8lg0Is+yWtccFjqKbLszDszKgr/oTFUFbImylAMRe3MzsB8Z5i+3c3xpAKQ9uVU+rMk
	Y8jfhVnqm0l87zJGVccerDPG8R0rY0CsVjJFZWtDUZA0O3sWLTDzfcg4A82hiMms4kcwdZ
	1zllIkgzmz/36zOlPYu2KSJUmdAzEDU=
Date: Tue, 20 May 2025 11:26:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] dcache: Define DNAME_INLINE_LEN as a number directly
Content-Language: en-GB
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20250520064707.31135-1-yangtiezhu@loongson.cn>
 <20250520082258.GC2023217@ZenIV>
 <CAADnVQJW+qyq9wPD6RdoaZ8nLYX8N2+4Bhxyd19h6pdqNRMc3A@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <CAADnVQJW+qyq9wPD6RdoaZ8nLYX8N2+4Bhxyd19h6pdqNRMc3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 5/20/25 1:04 AM, Alexei Starovoitov wrote:
> On Tue, May 20, 2025 at 1:23 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>> On Tue, May 20, 2025 at 02:47:07PM +0800, Tiezhu Yang wrote:
>>> When executing the bcc script, there exists the following error
>>> on LoongArch and x86_64:
>> NOTABUG.  You can't require array sizes to contain no arithmetics,
>> including sizeof().  Well, you can, but don't expect your requests
>> to be satisfied.
>>
>>> How to reproduce:
>>>
>>> git clone https://github.com/iovisor/bcc.git
>>> mkdir bcc/build; cd bcc/build
>>> cmake ..
>>> make
>>> sudo make install
>>> sudo /usr/share/bcc/tools/filetop
>> So fix the script.  Or report it to whoever wrote it, if it's
>> not yours.
> +1
>
>> I'm sorry, but we are NOT going to accomodate random parsers
>> poking inside the kernel-internal headers and failing to
>> actually parse the language they are written in.
>>
>> If you want to exfiltrate a constant, do what e.g. asm-offsets is
>> doing.  Take a look at e.g.  arch/loongarch/kernel/asm-offsets.c
>> and check what ends up in include/generated/asm-offsets.h - the
>> latter is entirely produced out of the former.
>>
>> The trick is to have inline asm that would spew a recognizable
>> line when compiled into assembler, with the value(s) you want
>> substituted into it.  See include/linux/kbuild.h for the macros.
>>
>> Then you pick these lines out of generated your_file.s - no need
>> to use python, sed(1) will do just fine.  See filechk_offsets in
>> scripts/Makefile.lib for that part.
> None of it is necessary.
>
> Tiezhu,
>
> bcc's tools/filetop.py is really old and obsolete.
> It's not worth fixing. I'd delete it.
> Use bcc's libbpf-tools/filetop instead.

Tiezhu, please check whether libbpf-tools/filetop satisfied your need or 
not. Thanks!

