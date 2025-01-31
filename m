Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049A113A3ED
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738313575; cv=none; b=f+IjRY0W0tVXFoEvpXevUq3gSmo/aCme6rKvrG6bX4b+NvjnICexiAZdDGzqyDcTNn3XHsUeen8KXkK5YER0MCeAc91Ye8KHtyLotYBccoQbi9pYzUB8/NYUVWN/Wra2lbst/YK8lY24zpyPs5TQlIUGqu+B9PGMFAI0wii6QxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738313575; c=relaxed/simple;
	bh=vpmSDx46TO6i4J+NUBpfArqU26FaAW0U8OYqGK/1HO0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Cb7v5kdgHvIbR/c54F8+GcWWbQ5F1lhDiiCvdu0zS0W5pwcrNnOvi1dYZfVlex7YGj37CfXdf8o77DIjUHylNeABptMsTz6Ju+1JLLkNgN/CubSsyBjWJzcChcypNF5aW4H5p6EMpj3SKcCqIdFX2sIikOp1bbnn37qj/5nhNSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EXOQMQXa; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EXOQMQXa"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C52DF4418E;
	Fri, 31 Jan 2025 08:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738313571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpmSDx46TO6i4J+NUBpfArqU26FaAW0U8OYqGK/1HO0=;
	b=EXOQMQXae6ICAEwyb/yK+nmSUWhnq5mQddMqTblPgTT4pxe2FqWBPJl5JpOXPcMePGYJyD
	UyTmHHyNuRTCpRsl2VRpX178AjbmVsDiPXwl/p6QBj55g7rfYlge7aSuh1hOwRCWuEavHo
	S7zi7mnD7RjS7qo2J39VSw6RNmiBzH+pm0uQt2sl4ZdVTo3Ipgx9f+1UVFUWAk1ds7rk+b
	ooDHVG1l77Qj/fzpwUc7plPsjrqyYHBEUbDvheEeMj1RBWX3P07vTR/RsLA4zQ3voN9Owa
	C40S5Pt8nIaaFYYTUMhuFFCRs5aPDVOAJoKehmBrYZCmXyxe6A0SPuKuj+TbYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  linux-i3c@lists.infradead.org (moderated
 list:SILVACO I3C DUAL-ROLE MASTER),  linux-kernel@vger.kernel.org (open
 list),  imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Flush FIFO before sending Dynamic
 Address Assignment(DAA)
In-Reply-To: <20250129162250.3629189-1-Frank.Li@nxp.com> (Frank Li's message
	of "Wed, 29 Jan 2025 11:22:50 -0500")
References: <20250129162250.3629189-1-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 31 Jan 2025 09:52:48 +0100
Message-ID: <87bjvnz7of.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrdduuddtrdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddutddrfeefpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheptghonhhorhdrtghulhhhrghnvgesshhilhhvrggtohdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesv
 hhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: miquel.raynal@bootlin.com

On 29/01/2025 at 11:22:50 -05, Frank Li <Frank.Li@nxp.com> wrote:

> Ensure the FIFO is empty before issuing the DAA command to prevent
> incorrect command data from being sent. Align with other data transfers,
> such as svc_i3c_master_start_xfer_locked(), which flushes the FIFO before
> sending a command.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Hotplug stress test find a wrong byte send out, this patch can resolve
> this issue although have not identify which operation cause a byte left in
> FIFO.

That's exactly what I understood from your commit log, I have mixed
feelings about the patch because it probably hides something bigger. Not
that I want to break users, but there is likely something else to do to
avoid it. Is there any chance you can check the content of the FIFO and
warn before flushing (at least while debugging)?

Anyway,

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
