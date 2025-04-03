Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AD618CC08
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675786; cv=none; b=RkJmsWDEZcel4lAVgBG4oIB4y6imABJ1lQ4qLxck+JV0AcEr5QHD5690lBnJpXwCx1k5zIUMrM/k47RCUagMz797tlf9olX/XdyAP9Y4IlAC+GFtz3pYfUSduqAva3nhBanuP53QPT0CNgkIBfIh3M8fA10q6MLzuzKhcEFKDA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675786; c=relaxed/simple;
	bh=jkTC/wMDHWhCK4CIfSQkC51fMhB9HSzsUwcqjd4iOGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dbiuEsKlTbhl1+h3UsB4T7c3o1n73lukVZJCBaAhUL5BqQkj61aC3HZfEJvhilOZWMAE+oivNrD5zQfuvJczfSZ84Pxv+4SF96hSAdT/ek7/tL90VeuUB2oIYdx38ZQ6hfwnc3Nw/GI6UabKt3nw7A4CMXGiRIGKpFnms9JUYKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jadAHXUO; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jadAHXUO"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F6FE4327B;
	Thu,  3 Apr 2025 10:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743675782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t5/K9HJKSTAwWcOGKvkV7Il6F2anBbyFZIJpq4YyIMM=;
	b=jadAHXUOk0brAQoHqnG0ixpvW8VoN0Ho9IEDCHiOFKz9Ek2oHttCU+IDtOKG4iUIYN+nxH
	ydjFmk5yx6QQv/1s29yBKMEqbwR3trwkCfTHTTiRsgrmgsAv7c/64d4PE1SQaXF4LQ7yHq
	6i67blakCppBUDiiGU03aMz0s2EgPWP7SixsOQuG72q/ZI3mRiZkgGc6qiQ9FppHw7OhP0
	uwea1nVsVBm1byRyo7CiWF1/tinsEWbHlaeJR6dOMOh+Y9U261BKZkKI87PmV6aDdAdaiv
	7K2MB3wIIo85ATJrq5M+gddxfkDHiF+83GobeRAA/K33Z2mlzjAPvJGdCrsMig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/19] mtd: spinand: Use more specific naming for the
 (quad) program load op
In-Reply-To: <e1d8108f-50c1-4924-bb68-53436728e701@linaro.org> (Tudor
	Ambarus's message of "Thu, 3 Apr 2025 11:00:46 +0100")
References: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
	<20250403-winbond-6-14-rc1-octal-v2-14-7846bd88fe83@bootlin.com>
	<e1d8108f-50c1-4924-bb68-53436728e701@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 03 Apr 2025 12:23:00 +0200
Message-ID: <87h63535ob.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeelvddrudekgedruddutddrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddutddrudelledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehsqdhkieesthhirdgtohhmpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdpr
 hgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

On 03/04/2025 at 11:00:46 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> On 4/3/25 10:19 AM, Miquel Raynal wrote:
>> SPI operations have been initially described through macros implicitly
>> implying the use of a single SPI SDR bus. Macros for supporting dual and
>> quad I/O transfers have been added on top, generally inspired by vendor
>> naming, followed by DTR operations. Soon we might see octal
>> and even octal DTR operations as well (including the opcode byte).
>> 
>> Let's clarify what the macro really means by describing the expected bus
>> topology in the (quad) program load macro name.
>> 
>> While at modifying it, better add the missing_ OP suffix to align with
>> all the other macros of the same kind.
>> 
>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>
> I don't remember giving R-b on this, not seeing it on ml as well, so
> please drop it when applying.
>
> I used Acked-by and not R-b because I wanted to signify that I'm OK with
> the general idea of the patches and that I'm OK with them landing, but I
> may not have reviewed it as thoroughly as if a Reviewed-by: was
> provided. Please use only the tags that I sent. And if by mistake I sent
> both A-b and R-b, use just the latter. Thanks!

I use b4 for collecting tags, but yeah that's strange.

I will use your Acked-by here.
