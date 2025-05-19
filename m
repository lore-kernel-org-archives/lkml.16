Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D539B27CCE3
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747650499; cv=none; b=Qbyi6v+Mzt6lYWhgkE3wFOGb/ZDsI70DAn6foZ30fpwFfy+3Q4uPuPhuCvQC5NIAhyHB4/Nuuh5s/7Cc5LkvLFtAIYwSUYxEQaPwAsoWxxSRasSwZvbcmYCbHIOpmHeeaF+xEc481dXmc+BZWcgRhUbFu8ubaInI4HuXXcCIb0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747650499; c=relaxed/simple;
	bh=Glz7ny8NQrojQyboF9JsjHRU80A8deyle6w4EYZ5zyM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FIRxMMqPhB7LOw45+TmuHQR+to9K84gm8D9QI5++atVitn9KQzqrf8d2l8Cxw6yxffwlyAEXf4kPFmbTR4ZIlC04L8iNd+O1cfeNshoGuGVR9pwq3hRZahpskxe2zcv/VZKQU1ZhSoEYVBxunAjgqV/oGUCfbKc1wsOWjTJKmF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ccvvlwY8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ccvvlwY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747650496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2XPurQ6z4VsgTQPK3kgi30mDqS6+qhr1GgY7wHAfY/c=;
	b=ccvvlwY8dl/jq14rUnbu6+5GNY9lkA/OHIrLhhPDXMJ8F/W4gyHuMFiEeTM/cOxfhUrVtp
	X2zThBfApRW247cjxgJsl0DqbZDe8ZM0zG6+ltIkj7PS9SAX9SnV/AusgLRYdZawgeqM/x
	/zl4YzhFdcwFffTgBMi/5/RVo0xT4ZM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-M6clf1G9NguYlPWDRJ04Aw-1; Mon, 19 May 2025 06:28:15 -0400
X-MC-Unique: M6clf1G9NguYlPWDRJ04Aw-1
X-Mimecast-MFC-AGG-ID: M6clf1G9NguYlPWDRJ04Aw_1747650494
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so33984795e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747650494; x=1748255294;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XPurQ6z4VsgTQPK3kgi30mDqS6+qhr1GgY7wHAfY/c=;
        b=IjIsl+cT+3LLmwaGrsaFEL304EdopbXdBibxO6xO42xI9nGYu1Erxkdj2V+44Wh6hF
         PGKXEbS8fYHH0YU7JqeOV60ymnd3YQUuhgw/gipA/zfXYDZW8R9SyXYRxEnlEe7lAx/8
         gpT01t684T8pXmbFd6u/wpmJgYsqIQqQl7PjFnsgozAAg21JFiN9NuMDGcprabfhkSBN
         USfV3RR5ffnukAk58xREHE6/5xq6LYSP2sb5XyFqRgzhtxnNF5CMqTJMA5Dahd0S5FBH
         NaY1fJfcS0CQIBlRyLw87CJ2g33a54TJtQYrTZM5KTpS3y51zAfLCm3TsOAF58t28sR1
         iyyA==
X-Gm-Message-State: AOJu0YwDxtpaWEp4zPTb35phMEGsLIl3WzOH4NBLvO39fjXEJqKASBvU
	aFWHkOc3IHAF5BdCMsAisJWtxNSG4H5I7H5AeH6OchsXguIpgJd1XgeBjJ66y256T653yIL1eCb
	/KP2yDEyrotLELLtEYxz51nVyZsYSKxCe5eYffGyW7VrUMzfiU+4asrAhuFAS892ymA==
X-Gm-Gg: ASbGncuujk4b5ic5ex2HXg/nhR4IVN7gDZchPhB2WqZmb0rScTQAKI6CpEifJD67HVc
	5nj1XC26zLsJbr/12NCFNf5uR4SzH0J5sHbqrvZEMI9bbEeXfjHxIEi1avzvlyoMluCybkDqmFU
	0iXZevZ8Nau3taoE8NujbSLqv1fgsffPjNUfstayV0SIRozDI6f5fiUAddE7/qllRlIg9P52EuX
	cs0X2Jd58SJ01qIxaYuzVbeGftV3acnbFmKWc7n3TCKWm5czVQsI70bhUHsh6ukLVeYMExmBjq4
	cBNXMRTpZylp1QhWaRDTm8o6gSQTEcBfOv+qjA==
X-Received: by 2002:a05:600c:a00b:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-442fd6313d2mr130831185e9.17.1747650494211;
        Mon, 19 May 2025 03:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmerFbIYeUlpq4trqMuAPoGFQ564+5/ovpfNjLErAG+OVI2RQw++iJWr2ZOv2hJcOHiNj30A==
X-Received: by 2002:a05:600c:a00b:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-442fd6313d2mr130830905e9.17.1747650493866;
        Mon, 19 May 2025 03:28:13 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef8c7sm202303115e9.38.2025.05.19.03.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:28:13 -0700 (PDT)
Message-ID: <5f1365f2cd84597fd3547544fcceab5c79682624.camel@redhat.com>
Subject: Re: [RFC PATCH v2 10/12] rv: Retry when da monitor detects race
 conditions
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Tomas Glozar <tglozar@redhat.com>, Juri
 Lelli <jlelli@redhat.com>
Date: Mon, 19 May 2025 12:28:12 +0200
In-Reply-To: <20250519090626.zjiYgUGW@linutronix.de>
References: <20250514084314.57976-1-gmonaco@redhat.com>
	 <20250514084314.57976-11-gmonaco@redhat.com>
	 <20250519090626.zjiYgUGW@linutronix.de>
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



On Mon, 2025-05-19 at 11:06 +0200, Nam Cao wrote:
> On Wed, May 14, 2025 at 10:43:12AM +0200, Gabriele Monaco wrote:
> > -static inline
> > void										\
> > -da_monitor_set_state_##name(struct da_monitor *da_mon, enum
> > states_##name state)		\
> > +static inline
> > bool										\
> > +da_monitor_set_state_##name(struct da_monitor *da_mon, enum
> > states_##name prev_state,		\
> > +			=C2=A0=C2=A0=C2=A0 enum states_##name
> > state)						\
> > =C2=A0{							=09
> > 				\
> > -	da_mon->curr_state =3D
> > state;								\
> > +	return try_cmpxchg(&da_mon->curr_state, &prev_state,
> > state);				\
> > =C2=A0}							=09
> > 				\
>=20
> This is a very thin wrapper. Should we just call try_cmpxchg()
> directly?

Mmh, right, at this point the wrapper does nothing but making the code
more obscure, will do.

>=20
> > =C2=A0static inline
> > bool										\
> > =C2=A0da_event_##name(struct da_monitor *da_mon, enum events_##name
> > event)				\
> > =C2=A0{							=09
> > 				\
> > -	type curr_state =3D
> > da_monitor_curr_state_##name(da_mon);					\
> > -	type next_state =3D model_get_next_state_##name(curr_state,
> > event);			\
> > +	bool
> > changed;										\
> > +	type curr_state,
> > next_state;								\
> > =C2=A0							=09
> > 				\
> > -	if (next_state !=3D INVALID_STATE)
> > {							\
> > -		da_monitor_set_state_##name(da_mon,
> > next_state);				\
> > +	for (int i =3D 0; i < MAX_DA_RETRY_RACING_EVENTS; i++)
> > {					\
> > +		curr_state =3D
> > da_monitor_curr_state_##name(da_mon);				\
>=20
> For the follow-up iterations (i > 0), it is not necessary to read
> curr_state again here, we already have its value from try_cmpxchg()
> below.

Yeah good point.

>=20
> Also, thinking about memory barrier hurts my main, but I'm not
> entirely
> sure if reading curr_state without memory barrier here is okay.
>=20

I guess we are on the same boat here. I couldn't really understand how
much of a barrier is the try_cmpxchg imposing (if any), but didn't see
any noticeable difference adding an explicit smp write barrier to pair
with the READ_ONCE in da_monitor_curr_state, so straight assumed we can
do without it.
But I definitely appreciate opinions on this.

> How about something like below?
>=20
> curr_state =3D da_monitor_curr_state_##name(da_mon);
> for (int i =3D 0; i < MAX_DA_RETRY_RACING_EVENTS; i++) {
> 	next_state =3D model_get_next_state_##name(curr_state, event);
> 	if (next_state =3D=3D INVALID_STATE)
> 		break;
> 	if (try_cmpxchg(&da_mon->curr_state, &curr_state,
> next_state))
> 		break;
> }
>=20

Yeah, that's neater.

> Furthermore, it is possible to replace for(...) with while (1)? I
> don't
> think we can have a live lock, because if we fail to do
> try_cmpxchg(),
> the "other guy" surely succeed.
>=20

Mmh, although definitely unlikely, I'm thinking of a case in which the
event starts on one CPU and at the same time we see events in IRQ and=20
on another CPU, let's say continuously. Nothing forbids that between
any two consecutive try_cmpxchg another CPU/context changes the next
state (making the local try_cmpxchg fail).
In practice I've never seen it going on the second iteration, as the
critical section is really tiny, but I'm not sure we can guarantee this
never happens.
Or am I missing something?

Thanks,
Gabriele

