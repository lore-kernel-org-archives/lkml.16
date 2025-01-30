Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ABE1EE013
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254669; cv=none; b=bm6wXuI5lVlNzV3LcWK6wrsERrSK/nS7jicwxnLP4NKnkgQBbxIjb5HIB6GIScqGVNOM7gUcaFGDJCDmvOm+/DHnEQIp/dBYSZIb4s5CFFEzAXDTv+PCYOfFv0Qe2M+kkTZQM90E0eSD5AYZHgaUIeFDTQkbjfucYxPMehZCjec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254669; c=relaxed/simple;
	bh=dDuW79P6TvXTiJtrMJmjEbRtjkaulOyRifvppRlvQcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSXP9IOsyGmoYB2owVGX/Dx+SdHxfwKb42F9OSqoZQ3Ekrh8IZFc9+84MPSVRVHxm/hBXGYyzlrC5btaDZAWDUA/VILIUT06nqQSfwUFza5FvqNjF+iUsLtPTq0QQ4fpQeGI06Jk+8qxCBGvCtJ0RMI9ELFm/MY93FTPCD+7Ah8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sVcLMpo9; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sVcLMpo9"
Message-ID: <14c56104-074e-4449-abd6-1290ec506390@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738254659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yw0vH+PXX2N45xBxpE0jU8nEEywldIKbAb24dgPY3MA=;
	b=sVcLMpo9nyc6QsYwH4GISNxfpiuY0rGPnsBFDGsK+YjaiXEzKO3UwN2eDT3LwGHMeobNTJ
	cvHkPoryNeCvAPSmRcJovfnCWgzBme8FQooWGxZtFPHnWs6FavWFx9GnhqUN0iUnP93c5i
	t1X/BWTb7+Kq6LdJA8LPzOPq8f4b3Ro=
Date: Thu, 30 Jan 2025 08:30:52 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: objtool failure caused some kernel functionality not working
Content-Language: en-GB
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Song Liu <song@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Kernel Team <kernel-team@fb.com>
References: <0bf90fc0-2287-4ce0-b810-6e383e695981@linux.dev>
 <20250130082532.mvfz5v2ikqixtesc@jpoimboe>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20250130082532.mvfz5v2ikqixtesc@jpoimboe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT




On 1/30/25 12:25 AM, Josh Poimboeuf wrote:
> On Wed, Jan 29, 2025 at 11:10:14PM -0800, Yonghong Song wrote:
>> The llvm18 does not have issues. I tried to bisect what changed in llvm19 and
>> found the following llvm patch is responsible:
>>
>> https://github.com/llvm/llvm-project/pull/96089
>>
>> Basically, the compiler might be able to create a jump target which actually
>> not possible at runtime. For example, in one of examples in the above llvm patch, something
>> like
>>     if i >= 3 goto out;  /* i unsigned */
>>     switch i, label default_unreachable:
>>       case 0:  goto label1;
>>       case 1:  goto label2;
>>       case 2:  goto label3;
>>     label1: ...; return;
>>     label2: ...; return;
>>     label3: ...; return;
>>     default_unreachable:
>>
>> I think that this should be a valid code from compiler perspective.
>>
>> Can we fix objtool to handle jump target which is immediately after the func body?Thanks, Yonghong
> I actually have a fix for that, can you try this?
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?h=objtool/core&id=fbb454b7bb39955c324693e73a5cf7e448632553

I applied the above fix and now the kernel works fine and /sys/kernel/debug/tracing/available_filter_functions
can display tracable functions properly.

The fix is in your personal branch. Any plan to send it to upstream repo?

The fix also makes sense to me. So

Tested-by: Yonghong Song <yonghong.song@linux.dev>
Acked-by: Yonghong Song <yonghong.song@linux.dev>

