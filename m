Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A797346F;
	Mon,  7 Jul 2025 00:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751849267; cv=none; b=Tk9gofajWkDP7Z1MNS6mT2vDWyRwkT17rcCrhE/GBFTzH0VIwVZiHAxnf3OYVIDQrR34H77CQE+jUM0X5FW13N5iYsTY/rQ1K5BBSfLdbrfLJ7q7hM+IkhOwXSQfyc1KEh++Udz4MPyhArPkb73ouis0DbS8eMrLgwolIlaauq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751849267; c=relaxed/simple;
	bh=A2QupyAHSSH6nc2ZMvAhqEhigN3kFk05D3rMbi6MQ0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hig5M7mjdjI9bdTvN5pYmnTUQQafCwrtJY9RUHN0XmZmD+4fndDsxz+TYc9EnmR9wjOLuKMifJi98nw34hshX2eNp75K4kd3iFxJx7nouLmNDnCbClEliG2NhvjxPfA6oaxJsHOxKl3MI+gikr110Qetd0q2I4SkEH41iYb0O8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Mnl8ac7p; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Mnl8ac7p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=MXVS1aDzrYojssvr0JlSotN/JXSHumghyg+/aTPIH6c=; b=Mnl8ac7pwSyEBjL8c/7iKsDlYV
	ErySn+ORFJ0nsb7ajvxTwFSzgG6mjMGq4Olf797u2WCEwGsc/GEIuaoRDfngC6rfi6ZQNURcCl1U8
	LYdqhoyUQOGn9lCWFrOEm94tW90FGNaoCW6LO52MxHzvFmTXu6W6B51q5bUqi/Sr0jMYCCJ6mAwOR
	Z7bOB+YLncZiri5VDmYEXN+c3F5zf4epFhfWHOEz4MMOqtY5SpSbMw6iXeLOya25cPyWmic63EBXw
	sZvrEfr8ZExIhxxiaVe59PPCK8ge6ofGfai/ZPzt6C90Be0BEm+4v6K+JCFPSP7BX1u37p9PZe3UD
	Xr9P3E2Q==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYa14-0000000AmJZ-3yej;
	Mon, 07 Jul 2025 00:47:31 +0000
Message-ID: <ebc84c4b-4238-4e56-a23c-2d5de535b3b0@infradead.org>
Date: Sun, 6 Jul 2025 17:47:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Fix kernel-doc indentation errors in multiple
 drivers
To: Bagas Sanjaya <bagasdotme@gmail.com>, Pavel Pisa <pisa@fel.cvut.cz>,
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
 <aGsW36iFMyp4ojdf@archie.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aGsW36iFMyp4ojdf@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/6/25 5:37 PM, Bagas Sanjaya wrote:
> On Sat, Jul 05, 2025 at 02:36:45PM -0700, Randy Dunlap wrote:
>> It needs something to turn True and False into a bullet list
>> (non-numbered), as documented in Documentation/doc-guide/kernel-doc.rst:
>>
>>      So, in order to produce the desired line breaks, you need to use a
>>      ReST list, e. g.::
>>
>>       * Return:
>>       * * %0		- OK to runtime suspend the device
>>       * * %-EBUSY	- Device should not be runtime suspended
>>
>>
>>
>> I don't see any of these kernel-doc warnings. I would guess that
>> either Pavel or I am using some older/newer version of whatever
>> software is causing this.
>>
>  
> I think Sphinx reported these warnings on docs-next tree.
> 
> Thanks.
> 

I would hope and think that the docs-next tree is in linux-next and I
tested on linux-next.

But I probably don't know what is going on...

-- 
~Randy

