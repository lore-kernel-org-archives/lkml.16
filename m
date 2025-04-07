Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBB6221F1A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009925; cv=none; b=iZfPyCfi4Fxlox6nmmo4WeVfF6an1zwsS1NGF7UlBKH3CUp04rQTYTrgIY2Uy2uk5dMXbupC8r9rW2hNjwJZAX7V87tVq/NVacWlxWHIUv5z3nTuxLKY6TWF7aVtcb854KvvIJWf27WumP3tHqjxeeqky0g8HNlI3sa58XJbyEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009925; c=relaxed/simple;
	bh=i77a18b8DHyXJfu0GSCELdfxc3KxO2HbjqVar89BgXk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KyG2nr+dg7ywM4i5AsgI3xzHYHqKu1eqNihvCLPl3v5jkGhmE7MN53OAzuOZBfeOBL+aH10LlfCDXQI4ywvNSJEQbSFh1QQ1C6gGMf8Sr8rrwqtrLbxTgL/wXyCvkLbwhmTSmTL0KsIHc56ChZrPbv51s71/rqM6aeT5t0oEBw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aG1AmnqN; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aG1AmnqN"
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 7000E5817AD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:59:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D76F443DA;
	Mon,  7 Apr 2025 06:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744009166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i77a18b8DHyXJfu0GSCELdfxc3KxO2HbjqVar89BgXk=;
	b=aG1AmnqNQwZeR9+mRpbOuKXsFtckCy6zp6uZf1lsIJSQxh+owa4t1tRSPH1veoL41dGMxH
	77YW8xWg5TYGmEHr6bC2gZQTb1k4J8mASCchVNKYPYf5uuTQu38IMuvXeZnk1fx0AFoKo5
	U+q2FNjROUzpgMqWS87BLSZVkSlTlHGvI9PcqmZkLDgqWi2p5JHOYr7heU90Evo5dhAJ0c
	3x5SW68AdOFY0XqPibm3YCBi0zZkPg4hrz/kmssZkAMiHJFbN3rhkUpnp3KT0E51Gu5NTG
	ooLsRZPxSShbKkkVLlxD908H6pQF1GlfEeagbKPHoUm28n8CCm6YJ8euSyxE3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Add error log for marvell_nfc_end_cmd()
In-Reply-To: <20250407020917.1242-1-vulab@iscas.ac.cn> (Wentao Liang's message
	of "Mon, 7 Apr 2025 10:09:16 +0800")
References: <20250407020917.1242-1-vulab@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 07 Apr 2025 08:59:23 +0200
Message-ID: <87tt70h2yc.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleelhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedruddtkedrfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehvuhhlrggssehishgtrghsrdgrtgdrtghnpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Liang,

On 07/04/2025 at 10:09:16 +08, Wentao Liang <vulab@iscas.ac.cn> wrote:

> The function marvell_nfc_hw_ecc_bch_read_chunk() calls the function
> marvell_nfc_end_cmd(), but dose not check its return value. Since it
> is incorrect to bail from the loop if the marvell_nfc_end_cmd() fails,
> an error log is necessary to prevent silent failure.

The failure will not be silent, *_read_chunk() is called in
marvell_nfc_hw_ecc_bch_read_page() only, where the validity of the data
will be checked. If you really want to make it visible *there* I believe
the correct approach is to change the caller prototype and forward the
error instead.

Thanks,
Miqu=C3=A8l
