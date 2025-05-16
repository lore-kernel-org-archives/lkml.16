Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885091632DD
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747410336; cv=none; b=dVVOjHqoiw1EHh+Fs7CA+dm4Wd3hE/os/NTaMI2FiRdK3ndxlaKnWXhXqQ85csdNXpElqrjmXsprqlylvfyv3pCTFP8eiJfF9vXJzSf/bIutIzVHT0TVjH16hLvHsliFxm5sYU09hR0G4RqlXrhj3pDmh7GibYnk52pujHSvzxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747410336; c=relaxed/simple;
	bh=VLSaAp2cEdZtkCPkySdj1B1gZODBG9/TQhVek2PzZa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQ8Bs5xAQ7ODeZHQ/ix2lTa4CUG58rawydQ+NtKi90tc8tiilLjBPUaKRq+1TQFJI+1/+dMnDYPqOD3wc4UtHmrBOLtP2Rgx3TMKS18S1QDq3BKZtPgFwzvSWbyPAQsm7K+UDew+LtIVKAmNRUJZ6OvPP0IjaOdvUdPtOvYM/Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OhX7PZB8; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OhX7PZB8"
Message-ID: <3b09f8b7-579b-441b-8c0e-2dbab7ac1740@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747410332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=01TO1hddfJPcitRqhi+ghi8hkuR8ZSGG5p+QOMEQr8I=;
	b=OhX7PZB8Es6AnN3GIJM3lmeuYOzbuMzzlU204wa6SoQjvTq24f2f6fOZmQJ3DgXW/zfdwp
	L9a+zEC6yD0jfwskVHtqMKKHkfxQXZJb7IeAx0d1BNKCxDLQsVN2WR9ZH0iKVVnsyxrkdt
	HQQOJdvqgU1EViErEeOaX3WfixQPAI4=
Date: Fri, 16 May 2025 23:45:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts: headers_install: fix a false positive
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250513160056.7576-1-wen.yang@linux.dev>
 <20250515-magpie-of-ideal-pluck-c6e323@bergen>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Wen Yang <wen.yang@linux.dev>
In-Reply-To: <20250515-magpie-of-ideal-pluck-c6e323@bergen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 5/15/25 19:32, Nicolas Schier wrote:
> On Wed, May 14, 2025 at 12:00:56AM +0800, Wen Yang wrote:
>> The current implementation only handles C89 style comments (/*... */) in
>> the code, and there are false positives for C99 style comments (//...).
>>
>> This patch fixes this issue.
>>
>> Signed-off-by: Wen Yang <wen.yang@linux.dev>
>> ---
>>   scripts/headers_install.sh | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
>> index 6bbccb43f7e7..41722bcc8668 100755
>> --- a/scripts/headers_install.sh
>> +++ b/scripts/headers_install.sh
>> @@ -44,6 +44,7 @@ scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
>>   # Remove /* ... */ style comments, and find CONFIG_ references in code
>>   configs=$(sed -e '
>>   :comment
>> +	s://.*::
>>   	s:/\*[^*][^*]*:/*:
>>   	s:/\*\*\**\([^/]\):/*\1:
>>   	t comment
>> -- 
>> 2.25.1
> 
> thanks.  The patch looks good to me, but I cannot find any false
> positives.  Have you found any concrete?
> 

Thanks. We have enhanced dmabuf on our SoC platform and modified the 
include/uapi/linux/dma-buf.h file, and then found this issue.

--
Best wishes,
Wen
