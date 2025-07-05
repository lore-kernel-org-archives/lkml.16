Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4616517CA1B;
	Sat,  5 Jul 2025 21:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751751427; cv=none; b=cyiagrdgCkSKdQ+ryX+fV2i+4kXN1JbFTJnH6wFI1gbRheHkRFYwOHWxpbSzFmtSE8mNxev3C/FbFzFORM/hWQOLaXJY9oMvpUISyaxd51XrtQwrlOP8X9eTrIuTrPHrP+RLpW+phj38v2IUgstOEWdtV7x6LuFSDxcTEmNuMj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751751427; c=relaxed/simple;
	bh=jgQFX9bNY3P1g12MUq2xKHIiqs4Izm5wTAN3sIYIX74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tIArelBXza8imi473UAJ7Lc62Xbcn5PxFig0bYbgPWxZcgfig06MLumDldrqKIfN044RSNEB2BJMZigOi64DjSGRVkv9UGrJW5A49GMXsGlKEToakpMaCfofOi+uCnoYP43mdPsV+lzw9S1leafvAxU31fTBpQKvFxb0izQ2itQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XusdeN+7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XusdeN+7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=RaTOSkuia4wG8vX9CzW3qtonswhngZP8hLz+StM3ACY=; b=XusdeN+7iVBZamreoD4+W3BCQ+
	rZnShrYn/Aqo+c/E8pFz44dbS06VPHoYeSSYDe0YktlVghgog+iyKWaWCrzm0ynblYpbWm7jPqsta
	v6HwsO2fDjr4ggfdVHtGIs3iteuf9HM/9t9RUhBJctkQhGe9PgZhxqSkjZ3kKZNiqo1teNHm2Ef7n
	+3qUS4DzZRASkU+BTNqdqFYsHxn9rPY37qpo6LTVo2a5G8u+J140hagW1hRe8tqeyNdh5Mn22OReQ
	weOi5SjUrrARY5L1QVWc9RMbj2zNxV1pJGPnLOhfABHovzOE4SPhYh0+0ZnMVrtk3npbhTMOryRrn
	3QceRadg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYAYy-00000005XIt-3voA;
	Sat, 05 Jul 2025 21:36:49 +0000
Message-ID: <b56b9602-d715-4de8-903e-7c97423bf5bb@infradead.org>
Date: Sat, 5 Jul 2025 14:36:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Fix kernel-doc indentation errors in multiple
 drivers
To: Pavel Pisa <pisa@fel.cvut.cz>,
 Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: corbet@lwn.net, alexandre.belloni@bootlin.com, ondrej.ille@gmail.com,
 mkl@pengutronix.de, James.Bottomley@hansenpartnership.com,
 martin.petersen@oracle.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Martin_Je=C5=99=C3=A1bek?=
 <martin.jerabek01@gmail.com>, =?UTF-8?B?SmnFmcOtIE5vdsOhaw==?=
 <jnovak@fel.cvut.cz>
References: <20250703023511.82768-1-luis.hernandez093@gmail.com>
 <202507052123.55236.pisa@fel.cvut.cz>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202507052123.55236.pisa@fel.cvut.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,


On 7/5/25 12:23 PM, Pavel Pisa wrote:
> Dear Luis Felipe Hernandez,
> 
> I focus only on drivers/net/can/ctucanfd/ctucanfd_base.c
> 
> On Thursday 03 of July 2025 04:35:11 Luis Felipe Hernandez wrote:
>> Fix kernel-doc formatting issues causing "Unexpected indentation"
>> errors during documentation build in CAN, SCSI, and I3C drivers.
>>
>> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
>> ---
>>  drivers/i3c/device.c                     | 6 +++---
>>  drivers/net/can/ctucanfd/ctucanfd_base.c | 8 ++++----
>>  drivers/scsi/scsi.c                      | 4 ++--
>>  3 files changed, 9 insertions(+), 9 deletions(-)
>>
> ...
>> diff --git a/drivers/net/can/ctucanfd/ctucanfd_base.c
>> b/drivers/net/can/ctucanfd/ctucanfd_base.c index bf6398772960..bd6938f6e105
>> 100644
>> --- a/drivers/net/can/ctucanfd/ctucanfd_base.c
>> +++ b/drivers/net/can/ctucanfd/ctucanfd_base.c
>> @@ -507,10 +507,10 @@ static bool ctucan_is_txt_buf_writable(struct
>> ctucan_priv *priv, u8 buf) * @isfdf:	True - CAN FD Frame, False - CAN 2.0
>> Frame
>>   *
>>   * Return: True - Frame inserted successfully
>> - *	   False - Frame was not inserted due to one of:
>> - *			1. TXT Buffer is not writable (it is in wrong state)
>> - *			2. Invalid TXT buffer index
>> - *			3. Invalid frame length
>> + *         False - Frame was not inserted due to one of:
>> + *         1. TXT Buffer is not writable (it is in wrong state)
>> + *         2. Invalid TXT buffer index
>> + *         3. Invalid frame length
>>   */
>>  static bool ctucan_insert_frame(struct ctucan_priv *priv, const struct
>> canfd_frame *cf, u8 buf, bool isfdf)
> 
> I do not have strong opinion there but the numberred list {1., 2., 3.}
> is the sublevel of the top list {True, False} under the False option.
> 
> You have flattened the list which hides the connection of error
> reasons to the False return value.
> 
> But if the strict rules for indentation are more important
> than my feeling for easy navigation then I do not want to stand
> in way and go forward.
> 
> Aligning False under True has some reason, the original
> text used tabs for indentnation, which is I understand
> as generally preferred in kernel sources and the original
> comment with correct tab = 8 spaces renders well for me

I don't see any need for the tab->spaces conversion either.

It renders in .c (text) or html?  It looks fine in the .c source
file, but the current html rendering is like this:

Return

True - Frame inserted successfully False - Frame was not inserted due to one of:

	1. TXT Buffer is not writable (it is in wrong state)
	2. Invalid TXT buffer index
	3. Invalid frame length

It needs something to turn True and False into a bullet list
(non-numbered), as documented in Documentation/doc-guide/kernel-doc.rst:

     So, in order to produce the desired line breaks, you need to use a
     ReST list, e. g.::

      * Return:
      * * %0		- OK to runtime suspend the device
      * * %-EBUSY	- Device should not be runtime suspended



I don't see any of these kernel-doc warnings. I would guess that
either Pavel or I am using some older/newer version of whatever
software is causing this.

> 
>  * Return: True - Frame inserted successfully
>  *	   False - Frame was not inserted due to one of:
>  *			1. TXT Buffer is not writable (it is in wrong state)
>  *			2. Invalid TXT buffer index
>  *			3. Invalid frame length


-- 
~Randy

