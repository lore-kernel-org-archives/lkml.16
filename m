Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7EA35949
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743613602; cv=none; b=ea39MWNxXcUb+KMFRADrn7K1v3TNIjkQL/FcFpNMFyj/4GHqJPjh4JcndM3KmAQCRuUkqYsLuFzieScJngpbpmlVZ5N4hPQVUvoUtgs/9Uzcrcl4iLp5O5pjdOnZpaK9sjdeEOiYwY/gLGx/eK6PFJD2pNRvNH/vF+AGSkZNhls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743613602; c=relaxed/simple;
	bh=izdVsaAoFW/PsnZjaQHd20LtqYy5ijDBJhNC7aqeBgk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jTwXs/WAzOqJNRJGFkslVtLf9Az2W6Tcmx4Q3hwqajwQLn26xqS96B9sbVZdVg4lQvlzOp68nUufXSvMGAGaFbiJ0WvTOH+LRErVZIN7n+lAzA2NbV77l6PZuQosT/RMotXzvH6cZGxIhcFnQ1skSjjzmtEsYTUwmG4XTnGAs5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kBY0Dbo6; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kBY0Dbo6"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0054442AB;
	Wed,  2 Apr 2025 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743613592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X33ULJkNEeFrm6fvuw+896JvktkT2V4WZKxemmZPflg=;
	b=kBY0Dbo683L1ijljTpbIlXZ3KD0c3DAGbCnvmx5LXHf9yPsikrDdE62hnu+/atDU770P5q
	Yr/2IObNNw3Y9VOLRCBWnFcLrYhJNNH0RiY3NjVhvNgbUtARG/tnIB3fnR7ngfeAWUSAmg
	l3UCF4TSlCEal2jXaAX6JHPG6bLr/wDGjeOt9O6vKuZseTs293i4861eHQsKnwf2VPwI2o
	s7kay1IWlQB7xiazqoyPh8n7VNEfm8zPRJHWVhzRTB/Zk+6cNxlYl6A11oi1+qD/XcZuJR
	OgHk6AivUYGjyhtDu2v7QvyzVYY0vfXJuiawKhIsE0GMxm+hL01oTeMwQ/h3/w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/21] mtd: spinand: winbond: Add support for W35N01JW
 in single mode
In-Reply-To: <94ed8cf8-1e0d-412d-9f8f-959fe4b5b505@linaro.org> (Tudor
	Ambarus's message of "Wed, 2 Apr 2025 16:22:41 +0100")
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
	<20250307-winbond-6-14-rc1-octal-v1-16-45c1e074ad74@bootlin.com>
	<94ed8cf8-1e0d-412d-9f8f-959fe4b5b505@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 02 Apr 2025 19:06:29 +0200
Message-ID: <87semqpk6i.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeivdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehsqdhkieesthhirdgtohhmpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtp
 hhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

On 02/04/2025 at 16:22:41 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> On 3/7/25 3:08 PM, Miquel Raynal wrote:
>> Add support for the W35N series by describing the smaller (single die)
>> chip. It has 1b/512B ECC support and its own OOB layout.
>> 
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  drivers/mtd/nand/spi/winbond.c | 54 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
>> 
>> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
>> index 99b9f333eb3142999d8f73d43537f1ed9789c975..9b0369a077efadac8bd6be632f15b822d42a7227 100644
>> --- a/drivers/mtd/nand/spi/winbond.c
>> +++ b/drivers/mtd/nand/spi/winbond.c
>> @@ -23,6 +23,16 @@
>>   * "X4" in the core is equivalent to "quad output" in the datasheets.
>>   */
>>  
>> +static SPINAND_OP_VARIANTS(read_cache_octal_variants,
>> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>
> strange to see octal variants name, but just single SPI ops defined. I
> see you define octal in the next two patches.

Octal is what supports the chip, even though at this stage it is not
pictured. I could rename the variant somewhere later, but I don't like
that as it makes git-blames more difficult and the result is the same
anyway.

> How about squashing all 3?

I prefer to keep core changes separated from manufacturer driver changes
when possible. And for the introduction of the features, it felt correct
to introduce a first level of feature, show the performance, and then a
second level, show again the performance improvement. Maybe I can
re-shuffle the patches to sort core vs. manufacturer changes and squash
patches 17-19 and 18-20 though.
