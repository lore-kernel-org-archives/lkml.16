Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8BF20C026;
	Sat,  5 Jul 2025 21:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751751956; cv=none; b=LIbVQEJhxlqtpwtiFKN+OwkOXjun+k/+SWCRQI66GKhflobjlt5kysvR9ZZMYlWc7oFMztSXmML9knEXjDnNVT9CwkpdrtduY4Mn3B44OALqQT2zG0swQAH2rVcPAGP7EJpRShzPSLj1X/dCRr2nIHfZ8vVQURPfVs5P4e+2R78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751751956; c=relaxed/simple;
	bh=YgfSoARMOIpFZMRiMQay/0QoiWOQKr0sVPEE3bCkgTo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gWs+JsnexQYkowjY15RsLA66R59ZFYbvOkU76hGSKl9F9Cc4maDVBucOeKKE+SANgEf6+w3bjKhYS6DvizUbIb5yvWx6izR+H+I5AORbkzt4veSNvdRFoVa4wqxpkiNxbukolxXxS+thVqYw+TXDJsnsOVmlt2GEDW5PnjpvL5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UFdY8pW/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UFdY8pW/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ggIQqQkW/gC1E1TGdm5TL4oON7HvDvoQdGCNolyxxfw=; b=UFdY8pW/+v7xUwnGsiM08H9Y98
	OEwIGeaeQXA0lSwB6y1DeOLYf/6iCoc4/55zmgTTAOMxUCbOjeFu7ljZzfbeMYQG9/LT2L11YxZnP
	TzweNqU9yInhovEUosT0HOmzK90Qe9uwDhKaiT4sCZL7W4+2jRkI4Vjd7sISM89oIyle8JrjGuHOk
	GOH2Ay4GzkYSEER0fkGIneKbJIP5bC7SQFtJIb3LcbO8yJBId/aS1i+YHMmsm8oZB3cz6J414CVtZ
	/VQhaPq8+4HvqZNldCDXJDmOSYDj6ZIsuPqYOP21pHhkGwbmKEyXFMDLZlhUX1v3W9r9qI/oKKsrT
	vRZVz1yg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYAhi-00000005Zhf-1kjk;
	Sat, 05 Jul 2025 21:45:50 +0000
Message-ID: <de23c688-bbe3-4059-a342-bd692c25cf08@infradead.org>
Date: Sat, 5 Jul 2025 14:45:47 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Fix kernel-doc indentation errors in multiple
 drivers
From: Randy Dunlap <rdunlap@infradead.org>
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
 <b56b9602-d715-4de8-903e-7c97423bf5bb@infradead.org>
Content-Language: en-US
In-Reply-To: <b56b9602-d715-4de8-903e-7c97423bf5bb@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/5/25 2:36 PM, Randy Dunlap wrote:
> Hi,
> 
> 
> On 7/5/25 12:23 PM, Pavel Pisa wrote:
>> Dear Luis Felipe Hernandez,
>>
>> I focus only on drivers/net/can/ctucanfd/ctucanfd_base.c
>>
>> On Thursday 03 of July 2025 04:35:11 Luis Felipe Hernandez wrote:
>>> Fix kernel-doc formatting issues causing "Unexpected indentation"
>>> errors during documentation build in CAN, SCSI, and I3C drivers.
>>>
>>> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
>>> ---
>>>  drivers/i3c/device.c                     | 6 +++---
>>>  drivers/net/can/ctucanfd/ctucanfd_base.c | 8 ++++----
>>>  drivers/scsi/scsi.c                      | 4 ++--
>>>  3 files changed, 9 insertions(+), 9 deletions(-)
>>>
>> ...
>>> diff --git a/drivers/net/can/ctucanfd/ctucanfd_base.c
>>> b/drivers/net/can/ctucanfd/ctucanfd_base.c index bf6398772960..bd6938f6e105
>>> 100644
>>> --- a/drivers/net/can/ctucanfd/ctucanfd_base.c
>>> +++ b/drivers/net/can/ctucanfd/ctucanfd_base.c
>>> @@ -507,10 +507,10 @@ static bool ctucan_is_txt_buf_writable(struct
>>> ctucan_priv *priv, u8 buf) * @isfdf:	True - CAN FD Frame, False - CAN 2.0
>>> Frame
>>>   *
>>>   * Return: True - Frame inserted successfully
>>> - *	   False - Frame was not inserted due to one of:
>>> - *			1. TXT Buffer is not writable (it is in wrong state)
>>> - *			2. Invalid TXT buffer index
>>> - *			3. Invalid frame length
>>> + *         False - Frame was not inserted due to one of:
>>> + *         1. TXT Buffer is not writable (it is in wrong state)
>>> + *         2. Invalid TXT buffer index
>>> + *         3. Invalid frame length
>>>   */
>>>  static bool ctucan_insert_frame(struct ctucan_priv *priv, const struct
>>> canfd_frame *cf, u8 buf, bool isfdf)
>>
>> I do not have strong opinion there but the numberred list {1., 2., 3.}
>> is the sublevel of the top list {True, False} under the False option.
>>
>> You have flattened the list which hides the connection of error
>> reasons to the False return value.
>>
>> But if the strict rules for indentation are more important
>> than my feeling for easy navigation then I do not want to stand
>> in way and go forward.
>>
>> Aligning False under True has some reason, the original
>> text used tabs for indentnation, which is I understand
>> as generally preferred in kernel sources and the original
>> comment with correct tab = 8 spaces renders well for me
> 
> I don't see any need for the tab->spaces conversion either.
> 
> It renders in .c (text) or html?  It looks fine in the .c source
> file, but the current html rendering is like this:
> 
> Return
> 
> True - Frame inserted successfully False - Frame was not inserted due to one of:
> 
> 	1. TXT Buffer is not writable (it is in wrong state)
> 	2. Invalid TXT buffer index
> 	3. Invalid frame length
> 
> It needs something to turn True and False into a bullet list
> (non-numbered), as documented in Documentation/doc-guide/kernel-doc.rst:
> 
>      So, in order to produce the desired line breaks, you need to use a
>      ReST list, e. g.::
> 
>       * Return:
>       * * %0		- OK to runtime suspend the device
>       * * %-EBUSY	- Device should not be runtime suspended
> 
> 
> 
> I don't see any of these kernel-doc warnings. I would guess that
> either Pavel or I am using some older/newer version of whatever
> software is causing this.
> 
>>
>>  * Return: True - Frame inserted successfully
>>  *	   False - Frame was not inserted due to one of:
>>  *			1. TXT Buffer is not writable (it is in wrong state)
>>  *			2. Invalid TXT buffer index
>>  *			3. Invalid frame length
> 
> 

The following patch works for me, both in .c (reading source file)
and the html rendering.

Pavel, feel free to use it.

---
 drivers/net/can/ctucanfd/ctucanfd_base.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

--- linux-next-20250704.orig/drivers/net/can/ctucanfd/ctucanfd_base.c
+++ linux-next-20250704/drivers/net/can/ctucanfd/ctucanfd_base.c
@@ -506,11 +506,12 @@ static bool ctucan_is_txt_buf_writable(s
  * @buf:	TXT Buffer index to which frame is inserted (0-based)
  * @isfdf:	True - CAN FD Frame, False - CAN 2.0 Frame
  *
- * Return: True - Frame inserted successfully
- *	   False - Frame was not inserted due to one of:
- *			1. TXT Buffer is not writable (it is in wrong state)
- *			2. Invalid TXT buffer index
- *			3. Invalid frame length
+ * Return:
+ * * True - Frame inserted successfully
+ * * False - Frame was not inserted due to one of:
+ *		1. TXT Buffer is not writable (it is in wrong state)
+ *		2. Invalid TXT buffer index
+ *		3. Invalid frame length
  */
 static bool ctucan_insert_frame(struct ctucan_priv *priv, const struct canfd_frame *cf, u8 buf,
 				bool isfdf)
