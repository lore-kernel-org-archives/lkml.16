Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CBD2E3716;
	Fri,  4 Jul 2025 20:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751662421; cv=none; b=V1YvbTyTgA1CiHLesXFNLBebzn96a9vTc/1bVieIvzsrCqy8Et1pzh5FaADrYQ2Rr/hLSnSVJDq0UW8qaFT3Rt/1EXTIMrYOhI8+ZQua2xRtS7qGX0GcJUdfhPraDnj5pnUh3FUXuztT30/GYduZ6dLU3LV6yqAFgmRzk8vFAe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751662421; c=relaxed/simple;
	bh=BTNkjQ5GbfyHC7QPGVC3V8tMQFcMhMmddt0oFWDYRKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J056kTRcFh5SC6/K4AqjaiCIZxrSbcaL2/RVZVN3yrRKS3EK2TIWk3Gy+W9htUv+ba29DkKhn4C/gdOUVGPbsnp0Mm6WEbP0+R5JJdGm25kD5nq9EU2xdD5b104bGb00clatXXXDRcekaPLUdwQRiahrcqx9S81cTmNwno759YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=t5q+s07T; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="t5q+s07T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=A7X24UXs2YPGFdhXYlpKpMX/c1mmkiA+2yfvylAh7Ug=; b=t5q+s07TttMKG4/+zCs78kw6W6
	95jiK1P9G126YD/XBJI/V2sQsiJJKz4Gog3URjjf3Ink0zkv5BNsvdH0IdWVr+sIWHoZW6yQn7Olo
	BPDHptBKidGui7njgNcrhZ9sS1eDz6AmtEBR8LBLKnbTjGV+VGS6NB1VmyLAh5NsOaSl92klfrxiE
	APKdDfLyQNNF5zw4rbTV5GK5yFev1qdcIXxaXS3UeQ6kFp7l/9lfkql/hWslxSrfVQMK7QC0HGaP3
	Yw8JLf7xA9B+oTdjPmcZfHFH8C4FaIikKV08TZMEOKH1QK6CYZWiUvlJc7ybk7nRXr2wyifEGsAD7
	57YDPA4Q==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXnPa-00000000iWy-0uIj;
	Fri, 04 Jul 2025 20:53:34 +0000
Message-ID: <ef6e81fd-e609-41fd-b8b1-df629aa61b0f@infradead.org>
Date: Fri, 4 Jul 2025 13:53:30 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: document linked lists
To: Jonathan Corbet <corbet@lwn.net>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
 <874ivtmkk2.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <874ivtmkk2.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Just a few comments while I am still reviewing:


On 7/3/25 7:10 AM, Jonathan Corbet wrote:
> Thanks for doing this!
> 
> I have a few comments, most of which are just nits.  I think we should
> be able to get this in for 6.17.
> 
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com> writes:
> 


>> diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..b0586056abb04d2bcc4518f7238ff9a94d3dd774
>> --- /dev/null
>> +++ b/Documentation/core-api/list.rst
>> @@ -0,0 +1,847 @@
>> +.. SPDX-License-Identifier: GPL-2.0+
>> +
>> +=====================
>> +Linked Lists in Linux
>> +=====================
>> +
>> +:Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

> 
> I do wonder if you should start by showing the list_head structure
> itself?  It is simple enough and not a secret that needs to be kept.

+1

>> +Declaring and initializing a list
>> +---------------------------------
>> +
>> +A doubly-linked list can then be declared as just another ``struct list_head``,
>> +and initialised with the LIST_HEAD_INIT() macro during initial assignment, or
>> +with the INIT_LIST_HEAD() function later:
>> +
>> +.. code-block:: c
>> +
>> +  struct clown_car {
>> +          int tyre_pressure[4];
>> +          struct list_head clowns;        /* Looks like a node! */
>> +  };
>> +
>> +  /* ... Somewhere later in our driver ... */
>> +
>> +  static int circus_init(struct circus_priv *circus)
>> +  {
>> +          struct clown_car other_car = {
>> +                .tyre_pressure = {10, 12, 11, 9},
>> +                .clowns = LIST_HEAD_INIT(other_car.clowns)
>> +          };
>> +
>> +          circus->car.clowns = INIT_LIST_HEAD(&circus->car.clowns);

linked_lists.c: In function ‘circus_init’:
linked_lists.c:35:30: error: invalid use of void expression
   35 |           circus->car.clowns = INIT_LIST_HEAD(&circus->car.clowns);

due to
static inline void INIT_LIST_HEAD(struct list_head *list);

Should it just be:
		INIT_LIST_HEAD(&circus->car.clowns);
?

>> +
>> +          return 0;
>> +  }
>> +
>> +A further point of confusion to some may be that the list itself doesn't really
>> +have its own type. The concept of the entire linked list and a
>> +``struct list_head`` member that points to other entries in the list are one and
>> +the same.

> [...]
> 
> 
>> +Further reading
>> +---------------
>> +
>> +* `How does the kernel implements Linked Lists? - KernelNewbies <https://kernelnewbies.org/FAQ/LinkedLists>`_
> 
> I do still think you should move the kerneldoc for lists over from
> kernel-api.rst; just tack it onto the end here.

Ack.

-- 
~Randy

