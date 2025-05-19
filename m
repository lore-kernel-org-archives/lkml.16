Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160485234
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641299; cv=none; b=m1tfsXQwGBEGbE2extJ3GjbvjUVSFnFHoonZt17YSnRcbXGGz8q6LP/rkxMgDgGBcX2tVtZqjn2zN9ydW4gdocMibLhOs521cynf/V8Wu1XfcOtNPR8lFFRCWoHPhzeaNNWFyLQ388YSfqIwWvQhDPlzY0uoBT4cWnrRziw5POc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641299; c=relaxed/simple;
	bh=zRaXWFsLCZTdy869yY7WHCAjDVTKxWy9kgXr0+7zWGk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FyBsu+9CJLD09jYQaWDRh3Vb5P3N2mYP0269NJrzERDf86OtsZXgLzT3y2P/+Jwa73GSxx1oehnMJZ3qjloJVlmKUQ55BKp+518nRFbV3byJburfsZMcieBsFFR7hn8kActKa9uuCcZSceK2HZ99eYw0fxrxS5XfCdAjBIVgmLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e6n31rBQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e6n31rBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747641297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zRaXWFsLCZTdy869yY7WHCAjDVTKxWy9kgXr0+7zWGk=;
	b=e6n31rBQkITtlBOPtivGb7Kl59z29fsHYe8a3yJXtJKRiIDLNm7wAQ0Vt08/3zQJaum3Lc
	pKDBTnoRp4oPl0EXpGWcZbZlkoWG6aZi8w79ITr8s76+t7XbOtY0g97pJKURV5Sia8N+ge
	mrWkVcMeVc8RgS/01cx4od0i22ypdwE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-Yi_sc9JmPM-MniPjNjedFg-1; Mon, 19 May 2025 03:54:55 -0400
X-MC-Unique: Yi_sc9JmPM-MniPjNjedFg-1
X-Mimecast-MFC-AGG-ID: Yi_sc9JmPM-MniPjNjedFg_1747641294
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a362939f61so1192847f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747641294; x=1748246094;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zRaXWFsLCZTdy869yY7WHCAjDVTKxWy9kgXr0+7zWGk=;
        b=lZKgW5Y0Ci8ABHcwOk/ybpgcYcPg+07/a9uWWaESFTGBujiU6gPn43BWoAjOoLo5iK
         q6fxsQvqt1Ed+anRU5+AqxBRi1wwY+UxeYdtk+zcA2RSDOvmk9LMIpWf9fG8rv2VERi/
         SBA8zHuHopwMQWLIJAB0on4WLyAgt48/T1Is5vxW7Okw393IiPop/EJbNkQsVTuRaYyM
         PasFgJvqGCm96vuyB7KXlzVL5VY0zsVPZN7d00ynoRmzX07A9cs/NtQ9UzHQNz9YDU5s
         EmGUZss3rx5Ua8/+BE042gIF+c9dW0Rra8VFw1bhlU7d+tSVc9ElxjrU6rIbIhrBe8AB
         tOpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdhyjUmCyBOtRi7pF8OwBXlJmP6CyNpYG4/w07Lu3YFdk3NPhjnyVA68jpTQh0nHhjgNdnQzQUcu1wnl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYuURWme9BmyP+1aBrIBDXz6lA6pC3n24pYpLB+yFTzC3iWjw8
	mxJ4+qLjxdpXyJSO4bmBaaL9E1eWZGJo/V1mdFki1E9CjJdTiaxHW90Iryc/qn+cyuNThHxy2JD
	iLI238znjpIXixzNdZ6zL/DqQFuSLAAs462IMyydOuqa6T53taufP2SyzS3fDkh8Yqg==
X-Gm-Gg: ASbGncvdGUuTvdG6YbqeAmcAbRqGUaY0bqzhL9Ftcm9T9LfePQUK0GvatJmQ7FbDOyK
	5K/iGkqi+NKdYylkQkYXaWCVBTDvE1s9rLarhsLCDT8l348PA5WecJ6pLHBNzHwzk1wv0TtZOSl
	ClHNIhRE5W0DFcsWoWktyMJgzda599mZDD9jA4EjImS0ajuJxOgPkY6dKLjsfF7nRVbQ59wYjDa
	RIvoWPFRJYSFTmCtZORrw/+dwZtpOjFbKVkz92VHs+OhfplxqxXukI13zjGP1q4m5mvlcJ6tlt4
	iv1J3IuD1227+0k/Lluq62f4ITG28fthHh2EQw==
X-Received: by 2002:a05:6000:1848:b0:3a3:64d5:5b5b with SMTP id ffacd0b85a97d-3a364d55c21mr5704841f8f.5.1747641294274;
        Mon, 19 May 2025 00:54:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvHz58uwM2+x7HZV40etQPbkDCTTwdHiDnNcbgIzq1H8F23HoVmQ7z0cS3LG9HdyPrrz6HRA==
X-Received: by 2002:a05:6000:1848:b0:3a3:64d5:5b5b with SMTP id ffacd0b85a97d-3a364d55c21mr5704824f8f.5.1747641293891;
        Mon, 19 May 2025 00:54:53 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm194669155e9.35.2025.05.19.00.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:54:53 -0700 (PDT)
Message-ID: <bd35a5165cb01450e799f025e8faaaa8a36ad51a.camel@redhat.com>
Subject: Re: [PATCH v8 20/22] rv: Add rtapp_sleep monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de
Date: Mon, 19 May 2025 09:54:52 +0200
In-Reply-To: <20250519070425.xDEPNyBe@linutronix.de>
References: <cover.1747046848.git.namcao@linutronix.de>
	 <3199656a35cc8a7acc2e30d320defa778acf8532.1747046848.git.namcao@linutronix.de>
	 <06d48208-686a-4d33-95ca-4e4d5991a42f@redhat.com>
	 <20250519070425.xDEPNyBe@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Mon, 2025-05-19 at 09:04 +0200, Nam Cao wrote:
> On Fri, May 16, 2025 at 04:31:03PM +0000, Gabriele Monaco wrote:
> > 2025-05-12T10:56:30Z Nam Cao <namcao@linutronix.de>:
> > > diff --git a/kernel/trace/rv/monitors/sleep/Kconfig
> > > b/kernel/trace/rv/monitors/sleep/Kconfig
> > > new file mode 100644
> > > index 000000000000..d00aa1aae069
> > > --- /dev/null
> > > +++ b/kernel/trace/rv/monitors/sleep/Kconfig
> > > @@ -0,0 +1,13 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +#
> > > +config RV_MON_SLEEP
> > > +=C2=A0=C2=A0 depends on RV
> > > +=C2=A0=C2=A0 select RV_LTL_MONITOR
> > > +=C2=A0=C2=A0 depends on HAVE_SYSCALL_TRACEPOINTS
> > > +=C2=A0=C2=A0 depends on RV_MON_RTAPP
> > > +=C2=A0=C2=A0 select TRACE_IRQFLAGS
> >=20
> > I had a different approach towards those (the preemptirq
> > tracepoints)
> > under the assumption adding them introduces latency. Besides me
> > picking
> > the wrong config (I used IRQSOFF, I'll fix that) I considered the
> > monitor
> > should /depend/ on the tracepoint instead of select it.
> >=20
> > This way it looks easier to me to avoid making a change that
> > introduces
> > latency slip in when distribution maintainers enable the monitor
> > (e.g.
> > TRACE_IRQFLAGS may be enabled on debug kernels and using depends
> > would
> > automatically prevent the monitor on non-debug kernels).
> >=20
> > Now is this concern justified? Is it only a performance issue for
> > the
> > preempt tracepoint or not even there?=C2=A0 I'd like to keep consistenc=
y
> > but I
> > really can't decide on which approach is better.
>=20
> Both approach is fine, I don't have a strong preference.
>=20
> I doubt that the distribution people would carelessly enable anything
> new,
> and these monitors are disabled by default. So I wouldn't worry too
> much.
>=20

Yeah that's true, I still see dependency makes their life mildly
easier, but as long as it's clear this type of monitor can affect
performance, both solutions work.

> I will do some measurements on the runtime impact of having these
> monitors
> built, so that there will be a recommendation whether to enable them
> in
> distribution kernel. But for now, just like any other debug configs,
> people
> should expect some performance hit.
>=20

Fair enough. We did some tests internally showing noticeable latency
increases with /both/ preempt and irq tracepoints enabled but didn't
perform tests with the irq one alone.
Nevertheless, I'd say a note saying enabling compilation of the monitor
may affect performance even when the monitor is off would do the job
(or anything along the line as you see fit).
Currently RV should not really affect the system when compiled in but
disabled, so I'd make it clear when that happens.

> > Also curiosity on my side (I didn't try), you require
> > TRACE_IRQFLAGS to
> > use hardirq_context but how different is it from in_hardirq() in
> > your
> > case?
>=20
> There is a wake_timersd() in __irq_exit_rcu(). This is a wakeup
> performed
> within interrupt handling, but in_hardirq() doesn't say that.
>=20

Alright, got it.

Thanks,
Gabriele

