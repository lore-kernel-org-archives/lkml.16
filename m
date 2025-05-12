Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773771DC9BB
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058367; cv=none; b=e54iicXukYLxsgFZ0uyEuytPOYk8C6RlF5zFvggwI6yqDLaJBAunTB0RBgcthT6BxA00zcbkuo3ydzdagJLlI+Q5+sUJo7Dpnx8lJavXMco++jKVMv1b25HdlEVxXItMwh+cdTT03ZuCo99i2LuSUT7V1vHdL36crm/qKybfJds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058367; c=relaxed/simple;
	bh=HUmofXhvscOsV22HCTbEBE6mTbH7lup2/FhvFaKJTT0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YvFeUaNb/4XdEVnUsyxOSaWxpCD80ddUXXXygf0Nfds34ooM8IjaGj7YU8X0HsqTL2JPnXnZXKxBzYk4dzUVB1ILYVeqQKx4WQOwoxNE1AWqRKSjKGvAwd6CMQlgsck5wJDJjqUHKhifmO+MuneCParmgcSVXezucSGq5G0K3DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IGtGo5mr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IGtGo5mr"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EF1E439F3;
	Mon, 12 May 2025 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747058363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HUmofXhvscOsV22HCTbEBE6mTbH7lup2/FhvFaKJTT0=;
	b=IGtGo5mrnhcTIR6KHAVd0KcciOdvRmlKgssw6BUtwGWEyYyrGWJijuB7/mfyqfmPhbRjfz
	kNDgM6HCeU+M1QN0Tt6LK4DICFM9fOAXOTAQL+MPgeQuCANZYN3UP9PJ9ELqZBbdlmay4A
	2dic1WtPjBbZNiN625v3i0s9okNaBwkM3BtPIcvc83YuyM3DIkIS6pCnyjGHgqEmhKK36i
	n7T7zyII7NXZ6iCtre00RJYWswSFVYTyxgctszti/Y6asCVrR0GuqNZRHmExXt8UiCgeI8
	2zHoUxmXGgMocFO34860z5VBRddPVLhkO/qW5ldsUrg0BmXicwoKEp9POBc7Ag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>
Cc: Richard Weinberger <richard@nod.at>,  linux-mtd
 <linux-mtd@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
In-Reply-To: <4ebe2146-ee1c-4325-8259-be3803475f1f@prolan.hu>
 (=?utf-8?B?IkNzw7Nrw6Fz?=
	Bence"'s message of "Mon, 12 May 2025 15:13:20 +0200")
References: <20250512084033.69718-1-csokas.bence@prolan.hu>
	<87frhambri.fsf@bootlin.com>
	<d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu>
	<1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at>
	<4ebe2146-ee1c-4325-8259-be3803475f1f@prolan.hu>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 15:59:22 +0200
Message-ID: <87r00ugcat.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddugeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheptghsohhkrghsrdgsvghntggvsehprhholhgrnhdrhhhupdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

On 12/05/2025 at 15:13:20 +02, Cs=C3=B3k=C3=A1s Bence <csokas.bence@prolan.=
hu> wrote:

> Hi,
>
> On 2025. 05. 12. 14:47, Richard Weinberger wrote:
>> ----- Urspr=C3=BCngliche Mail -----
>>> Von: "Cs=C3=B3k=C3=A1s Bence" <csokas.bence@prolan.hu>
>>> Well, yes, in our case. But the point is, we have a strict requirement
>>> for data integrity, which is not unique to us I believe. I would think
>>> there are other industrial control applications like ours, which dictate
>>> a high data integrity.
>> In your last patch set you said your hardware has an issue that every
>> now and that data is not properly written.
>> Now you talk about data integrity requirements. I'm confused.
>
> The two problems are not too dissimilar: in one case you have a random,
> and _very_ low chance of data corruption, e.g. because of noise, aging
> hardware, power supply ripple etc. But you still need to make sure that
> the written data is absolutely correct; or if it is not, the system will
> immediately enter some fail-safe mode. This is the problem we want to
> solve, for everybody using Linux in high reliability environments.
>
> The problem we _have_ though happens to be a bit different: here we are
> blursed with a system that corrupts data at a noticeable
> probability. But the model is the same: a stochastic process introducing
> bit errors on write. But I sincerely hope no one else has this problem,
> and this is *not* the primary aim of this patch; it just happens to
> solve our issue as well. But I intend it to be useful for the larger
> Linux community, thus the primary goal is to solve the first issue.

I don't have a strong opinion there but I don't dislike this idea
because it might also help troubleshooting errors sometimes. It is very
hard to understand issues which happen to be discovered way after they
have been generated (typically during a read, way later than a "faulty"
write). Having this paranoid option would give a more synchronous
approach which is easier to work with sometimes.

Cheers,
Miqu=C3=A8l
