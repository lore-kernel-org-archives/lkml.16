Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AFC27466C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374366; cv=none; b=DIu+GfI5EtTUc1T16bnaRmGNfC/eVKwIUPH6pXAQmYf487YTiqLlpCRaatY+P5v4ABdxGtTDENQ8MsAp/U228WEDVr3IGonDmg1R2BlAUzUf6LrSJfeORFJdpEGkF+KzTpThw8HnqAcZVpbtpK87Z6zsYftcNs4qOGajbs2eqiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374366; c=relaxed/simple;
	bh=LPWusB319hqcjd//15Bc5xcoYqrH7jO6QhAyal/DX+o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a/AZj9tqc8jTvxy02WbrdOE9IA6JgRY/Q6R/Zc4pt+vqHtxIO2OsY7oQX4eo5pR4zCpCV5olGSRMWHXhVKoBsvrOS0o69wcpFXMuqVQ166jjeMdO7lpDbPvhuQpFOeDE6ebcwDJmzqcS99KlqiOkRaP4N1XZsH/FIO137VFdYWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SJ/lrnNP; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SJ/lrnNP"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15B5343A0C;
	Tue,  1 Jul 2025 12:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751374363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LPWusB319hqcjd//15Bc5xcoYqrH7jO6QhAyal/DX+o=;
	b=SJ/lrnNPdamf043ssGzRJW11GCZhIZalKvKQdBn0kqhMaPSGPG8XCuoj0zDpFpQj9RKgXd
	dBW8VS9x5psVADG7aeD5MPZCELoG+gH+TS9liybefNtGazRsTJqM7to87t2+5/RMpQv+5G
	vj3I0zLBLk46t8aRM6jGzt9HfqP+AuB6KQPMfY3oiM1qUyhC4M7F3d9sTR9kvaHAJXVkvL
	0MQhSVdNgDK+ofLR3QeiVHrUbOYKszKZNRSwHWL7ixMRTYWk6YKk/rHpWWo41B5nxp2JT8
	04k801X770tXhlokV2KLiHV/608wh5On92TbIYNAJ+8jm4t2eHqVCVGe7Ng9Hw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,
  David Woodhouse <David.Woodhouse@intel.com>,  Viresh Kumar
 <vireshk@kernel.org>,  Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>,  Vipin Kumar <vipin.kumar@st.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand/fsmc:  Add missing check after DMA map
In-Reply-To: <20250701115519.30772-2-fourier.thomas@gmail.com> (Thomas
	Fourier's message of "Tue, 1 Jul 2025 13:55:15 +0200")
References: <20250701115519.30772-2-fourier.thomas@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 01 Jul 2025 14:52:41 +0200
Message-ID: <87zfdooyxy.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepfhhouhhrihgvrhdrthhhohhmrghssehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopeffrghvihgurdghohhoughhohhushgvsehinhhtvghlrdgtohhmpdhrtghpt
 hhtohepvhhirhgvshhhkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrthgvmhdrsghithihuhhtshhkihihsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepvhhiphhinhdrkhhumhgrrhesshhtrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Thomas,

On 01/07/2025 at 13:55:15 +02, Thomas Fourier <fourier.thomas@gmail.com> wr=
ote:

> The DMA map functions can fail and should be tested for errors.

-The

Same comments as in the other thread, the title should be "mtd: rawnand:
fsmc:" and you miss Cc'ing stable@.

>
> Fixes: 4774fb0a48aa ("mtd: nand/fsmc: Add DMA support")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>

Thanks,
Miqu=C3=A8l
