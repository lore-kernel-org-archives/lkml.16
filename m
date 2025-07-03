Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD052DE6FC;
	Thu,  3 Jul 2025 06:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751522811; cv=none; b=fs98lCUS29TMsMv1s75W24QyOjGVBY79iNxotU1G8Gb9x+aryTzwlsCVr6g58v5A6nRwLuBNiyB2VakICYGs/V1krl0sgeFv1A56VU7DTWL8nG3bY9sHgV77yNomPqtqeYQpn1iUHPenUB5i5mt6nOjRBcZCniBRBrkr/IIhUAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751522811; c=relaxed/simple;
	bh=ZWevuLWSVkn7zLvbrsg0RjkiqNUHWiRxWj0YkUftYgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kn2IfkVnEdW00C55EYtLBZL39yjadBNfIU/B0wualLy2TRAUUVCYz4DbnRbiaYR0kaYakTfGEiZAYIq/cXYgp2/WgloXKQyZbDWBaSwlRsJ+Lin6tVZEGs+Pooc8KLbK8ROTOnsJVq84sOAvkuaWMjeEG6M+jqszqkRgfgfbE0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Caut9X/f; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Caut9X/f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Eq8Y+1V8pSfxkXgAiYTfXGDFT7NGn0VC8yVA5xBBUcg=; b=Caut9X/fhXkPrD5BaBbuS+nYa+
	0+f1u6XTd2CVxemF2eYW6Cz3Eixh1qfUZSjbZwD2qs5XE9iM5k5NFzj2iPPEmLk0SIOoZk4qwrBaM
	FDP43dda2nObGQOU7fr9HJq2GpuNs5Mig7xt7tk8M1T0aJc9FWudqTSKAjP9bA9bCxTBlpbT555ig
	NQmP49ZHwX4CDsAxxoyvC15tKG91iLnf3CWkiHMPhJ4/351P6mQXm937SLOkVvIoyI2Mgn+ixIhmB
	HpctLG+cHWmWSqecrmKBs/VnW+1ObDpffr9bLHd+2YBhLgrepmSLhPmUQByKV/5ANMQj6ZocZE1wb
	NixVyA6g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXD5p-00000007d5o-49rZ;
	Thu, 03 Jul 2025 06:06:46 +0000
Message-ID: <e4bea8cb-1367-45ab-aae8-e29efbdbd082@infradead.org>
Date: Wed, 2 Jul 2025 23:06:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: document linked lists
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
 <aGX30ATQaD2EjWwW@archie.me>
 <194f16f5-4e26-460f-ae4c-8a5f93088fae@infradead.org>
 <70ef2227-55ac-482b-9bcc-df1fd847abd9@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <70ef2227-55ac-482b-9bcc-df1fd847abd9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/2/25 10:48 PM, Bagas Sanjaya wrote:
> On 7/3/25 11:16, Randy Dunlap wrote:
>>
>>
>> On 7/2/25 8:24 PM, Bagas Sanjaya wrote:
>>> On Wed, Jul 02, 2025 at 10:24:47PM +0200, Nicolas Frattaroli wrote:
>>>> diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..b0586056abb04d2bcc4518f7238ff9a94d3dd774
>>>> --- /dev/null
>>>> +++ b/Documentation/core-api/list.rst
>>>> @@ -0,0 +1,847 @@
>>
>> [snip]
>>
>>>
>>> The text LGTM, thanks!
>>>
>>> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>>>
>>
>> Please see https://people.kernel.org/tglx/notes-about-netiquette,
>> especially "Trim replies".
>>
> 
> I did quote the whole diff to provide review context...
> 

If you had commented on any specific lines in the patch, then that would
be necessary. Even if you were commenting on only a few lines of the patch,
most of the patch lines could be snipped out.

The Subject: gives us the review context. It's pointless & annoying to other readers
to have to scroll down thru an 847-line patch to see any kind of Tagged-by: reply.

thanks.
-- 
~Randy

