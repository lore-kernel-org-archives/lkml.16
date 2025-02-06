Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AA1237175
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859544; cv=none; b=TYVHVJ70c9OXDCnZDg3mauQN3VgaHLhSwr5mhmeapwzQWymeS76Q5QYBP1y9DITagVv6oDhGpeLutnBS3IEB8s+xmTrJHJsSZB42ABc4pTUMgukUdKDd5dPsNZPjQzW2nXiE/rvvraGbY1n4VUK6pTcK+OHDjhVqai7f8Smrjdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859544; c=relaxed/simple;
	bh=g3ZOYUXUmHrWdfJc6qzBihT+JpS7Xrr076CEZUDGYEw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lD31crwN6hwTZBpqnvmQdG3Js0r4xhpYaOStwjSqPLate3F/vuGzjx2EHBwgS309SGPsPaTM3N462k2uRqXFj/fbyRdsnfxsGgIg6kDCnjiReBSQWzMpZPYh7SKkxGWOmfv+6TK3WAoZ4KE1mtcO+ccc2cnJqDMHWwZxNuOdY3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=A1vWhDuG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R8A8KVJN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="A1vWhDuG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R8A8KVJN"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738859540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JlWQoMNpF9umnuqPuXzmf3G9EJj3qcG1KUOcch4+dHE=;
	b=A1vWhDuGYplCfdcHYo8vagppvKW8eSLLP6AtrY+Qr8qv7lx5tNrgSHLEuIMbZwbw6N6iqs
	2kH+W2vIDZfVvaO3sNquz51d4YBuk0oNga/s4s+B5eSItpAXW4ivAXYg+HTWpLjtv3J+Jx
	uImhbA0I8tIzKJOx1tEjr2XtavcOZZcQpk4i3Wr9yZ+bCAM6rd41S/0Oi+1eAjXjDNFunl
	YflKR5/k13yevMQ+uman0c1hy0ljUA3CbsYGVgjqbJMLgMwRRa6Ffuu8knAsHToNUxWzNe
	eJB2hHMeOlP8LvIUUmaUTdK1zyhFtHjbuzEM5P87Q6oEHuQY0pU5msOnKWckFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738859540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JlWQoMNpF9umnuqPuXzmf3G9EJj3qcG1KUOcch4+dHE=;
	b=R8A8KVJNk7qxeRY72pd64mTG+CGJClVVVJuu7H0w9f4FOtf9PQy2cgtVFNNexj3gSZKFWi
	UFUZGC9tNn9JK/BA==
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Nam Cao
 <namcao@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel
 <sre@kernel.org>, Will Deacon <will@kernel.org>, Jon Mason
 <jdmason@kudzu.us>, Jaehoon Chung <jh80.chung@samsung.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jassi Brar <jassisinghbrar@gmail.com>, Pavel
 Machek <pavel@ucw.cz>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rob Clark <robdclark@gmail.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Zack Rusin <zack.rusin@broadcom.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Takashi Iwai
 <tiwai@suse.com>,
 alexander.shishkin@linux.intel.com
Subject: Re: [PATCH v2 00/45] Consolidate hrtimer initialization - Part 4
In-Reply-To: <87ldujz9a7.fsf@ubik.fi.intel.com>
References: <cover.1738746904.git.namcao@linutronix.de>
 <87ldujz9a7.fsf@ubik.fi.intel.com>
Date: Thu, 06 Feb 2025 17:32:20 +0100
Message-ID: <87tt97m3u3.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Feb 06 2025 at 11:56, Alexander Shishkin wrote:
> Nam Cao <namcao@linutronix.de> writes:
>
>> hrtimers is initialized with hrtimer_init(), and after that the timer's
>> callback function is setup separately. This separate initialization is
>> error prone and awkward to use.
>>
>> hrtimer_setup() combines the initialization and is simpler to use.
>>
>> Switch to use the new setup function. Most conversions were done with
>> Coccinelle, see the sematic patch below.
>>
>> This series is intended to be applied to the tip tree
>>
>> v1 -> v2 https://lore.kernel.org/lkml/cover.1729865485.git.namcao@linutronix.de
>>   - rebase onto v6.14-rc1
>
> Link to v2 of part 1 is missing. It's also somehow not in my notmuch
> datadase (looked for "hrtimers: Switch to new hrtimer interface
> functions" -- took a guess based on v1) and is not googleable. It's kind
> of important for reviewing this one. v1 did have the links to the other
> parts, at least.

It's archived and searchable on lore:

  https://lore.kernel.org/all/?q=hrtimers%3A+Consolidate+hrtimer+initialization+-+Part+1

and the third google result points to:

https://patchwork.kernel.org/project/linux-wireless/patch/20241031-hrtimer_setup_p1_v2-v2-0-23400656575a@linutronix.de/

That part 1 series has been applied and is in mainline already.

Thanks,

        tglx
