Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778DD190472
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743613036; cv=none; b=TJOvmWcw3vdXSAxmiFr6GPuIYiNRRriNDs8oW+y4q8b9rvc5ciKZ6bW+9VZCEgN8gqfURNEqJqfwX+4OEexSCN0lYkHvJub3Pf01atpeSnSpo/qZqoe28DMZ2Jbc8yautRjVZGjDxcyjBtecTZEf8XFTmMRXm1j1aRfwXCJX4gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743613036; c=relaxed/simple;
	bh=wB1i3sD4pnit/PHMVxIDiTRb8TvQzmn7UQgxvFG5ANg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i1d9FLYzTNENy+yx2z/9boSKjO+k3b57Rgqys97iubtERhTC3eVuSTfF60fIuORARbpjuiiO/px1TMh1yqgY16Je1FwmpnVn9j3RdQ+IlQjhDPTxYoS40C3zeNGOBDbss6vB4FB/2+JPBT/6bwOzRA7NaQQIVsA93h/0Q1q+MpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cWlY62as; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cWlY62as"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A8474436E;
	Wed,  2 Apr 2025 16:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743613027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wB1i3sD4pnit/PHMVxIDiTRb8TvQzmn7UQgxvFG5ANg=;
	b=cWlY62ast0I2fh+PueJmZkKZaSmc5C7M4SP4eIzVdKU6u8MF9wOOdd6e1bkspZqxrHCDKo
	1NVmEfh0AX2zqoJhLgKh3NB7CGo4JhMGfO2wd82/sx5lL+MjnhzebUiThTFbwfoi7oggbC
	uUbz69mw32XG2O6WG/PRHg7dZH1rt5f81bSpZHNUwhgB4yFm6mNDXN+tbGlHaxIvWocZfW
	+fOFjN6uHXQr3djCKqsDCbEl+k+Mk7olKHPxGZOOTBxIPHZ6fQnyzOgqNSnEbAXyJ92Q/u
	PS6iAtA+yY7AErhTeP76IGMD/hxP8oou5a7KsBUgvrv5MydQDk2nV77P6PXY5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/21] mtd: spinand: winbond: Rename DTR variants
In-Reply-To: <3ebd53ef-c7fd-4c8c-96f3-32e97b355b6b@linaro.org> (Tudor
	Ambarus's message of "Wed, 2 Apr 2025 16:19:00 +0100")
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
	<20250307-winbond-6-14-rc1-octal-v1-15-45c1e074ad74@bootlin.com>
	<3ebd53ef-c7fd-4c8c-96f3-32e97b355b6b@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 02 Apr 2025 18:57:05 +0200
Message-ID: <871puaqz6m.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeivddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehsqdhkieesthhirdgtohhmpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtp
 hhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Tudor,

First, thanks a lot for the time spent reviewing, much appreciated.

On 02/04/2025 at 16:19:00 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> Hi, Miquel,
>
> On 3/7/25 3:08 PM, Miquel Raynal wrote:
>> -static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
>> +static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,
>
> why not read_cache_single_dual_quad_dtr_variants? I see single dtr too
> in the supported ops.

That's true, but single modes are literally always supported, so it is
not very discriminant, and here my goal is to differentiate the variants
supported by the dual/quad chips vs. the variants supported by the octal
chips (which are not capable of dual/quad transfers). What do you think?

