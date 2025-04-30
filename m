Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FF917E0;
	Wed, 30 Apr 2025 06:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996316; cv=none; b=Htb5y6H5OKa8IFOCLmMNadbYSgz+frkJ4GOMxgPEZSKRbEJkzpFSZH6TTu9iqvWOaeFD/X2awpRayUs6RdZcqEDASIoVMk7AkTiWmHusvz4cJd7QpwM4xW6jdNKr/cB3bg1l0NPIQ9Zy/PkDMXCvDTtnoqTHKAqhA5DEwB0eXPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996316; c=relaxed/simple;
	bh=7CUhpQ9+zIhyv0GvZjAoVHD9ajVOAIWKqnDgeOZSAdA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N77b7B/MEHkXupArjD94LmRy3q0IxvMZOMg8cCRT3L5kCodwseV9/pDwiruWqzxSjRdUoXvFpBPTjgmWAc3pz4GVWUl9yeK+OSSUCocmK0vWo/0+KmE8XwGBqI259c2vFiqEbOVOCVEDdI+5KYcDVM+y+snssd6tqz0zaLpnCbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WQPZ9YhE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xh7ZqCgV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WQPZ9YhE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xh7ZqCgV"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745996313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UBgDD27NsLa3RNSfaO8xNkStzEbW1eu3yXOUdjUkJfA=;
	b=WQPZ9YhEzgOWDJ04IOSVvahwwt2m/mtd68TP/cYb8lUMTtj1sbLgxpdrhcnuRjHlCxlajZ
	RQPpyaMjbNzZExn/43jyVw0MAV60M5VCE+4Wla824MHBvGRA026q/DqGtVI6aguWauKgU6
	Jb9CjTM3USxThLTeIGWmw8Ti+15vSum/QX5iGVHQ59R0y8AcF98uiae783qs37yUXMsm8v
	h4ze8g5PfcEVaBW2LGi1d3e+z5xHowbj8Fu8Dj4PJX+EQJYphGea/2bYykvksBDjpc80sE
	b5IPR9TLPaxz8OGCfzNsVbnU21G2R2tG8uexUhKwTF/O6gcDj6MteWd/X3mJaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745996313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UBgDD27NsLa3RNSfaO8xNkStzEbW1eu3yXOUdjUkJfA=;
	b=xh7ZqCgVTbQ7h+QZGKcm2N9MxrIQp+fmQ2rvlcWtJlgeoQD09XcMYs1UPk7bBOsKVRtB/O
	ucKcWBDz5gBIW+Bw==
To: John Stultz <jstultz@google.com>, Su Hui <suhui@nfschina.com>
Cc: sboyd@kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 3/3] alarmtimer: switch spin_{lock,unlock}_irqsave() to
 guard()
In-Reply-To: <CANDhNCq0yOXRF+6_JaMYo98o5uKP_af+UXJcJmzuFvX63RdTaA@mail.gmail.com>
References: <20250424144819.24884-1-suhui@nfschina.com>
 <20250424144819.24884-4-suhui@nfschina.com>
 <CANDhNCq0yOXRF+6_JaMYo98o5uKP_af+UXJcJmzuFvX63RdTaA@mail.gmail.com>
Date: Wed, 30 Apr 2025 08:58:27 +0200
Message-ID: <87y0vip23w.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24 2025 at 16:59, John Stultz wrote:
> On Thu, Apr 24, 2025 at 7:48=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>> -       spin_unlock_irqrestore(&freezer_delta_lock, flags);
>> +       scoped_guard(spinlock_irqsave, &freezer_delta_lock) {
>> +               min =3D freezer_delta;
>> +               expires =3D freezer_expires;
>> +               type =3D freezer_alarmtype;
>> +               freezer_delta =3D 0;
>> +       }
>
> I'm not necessarily opposed, but I'm not sure we're gaining much here.

>> @@ -352,13 +347,13 @@ EXPORT_SYMBOL_GPL(alarm_init);
>>  void alarm_start(struct alarm *alarm, ktime_t start)
>>  {
>>         struct alarm_base *base =3D &alarm_bases[alarm->type];
>> -       unsigned long flags;
>>
>> -       spin_lock_irqsave(&base->lock, flags);
>> -       alarm->node.expires =3D start;
>> -       alarmtimer_enqueue(base, alarm);
>> -       hrtimer_start(&alarm->timer, alarm->node.expires, HRTIMER_MODE_A=
BS);
>> -       spin_unlock_irqrestore(&base->lock, flags);
>> +       scoped_guard(spinlock_irqsave, &base->lock) {
>> +               alarm->node.expires =3D start;
>> +               alarmtimer_enqueue(base, alarm);
>> +               hrtimer_start(&alarm->timer, alarm->node.expires,
>> +                             HRTIMER_MODE_ABS);
>> +       }
>
> Similarly, this just seems more like churn, than making the code
> particularly more clear.

I disagree. scoped_guard() is actually superior as it makes it
visually entirely clear what the actual scope of the spin lock protected
code is. That's the whole point.

Especially in alarm_suspend() this would end up with a mix of scoped
guards and open coded spinlock regions. That's obstructing the reading
flow.

I'll bring them back for consistency when applying the series.

Thanks,

        tglx

