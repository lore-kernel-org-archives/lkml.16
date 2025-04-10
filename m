Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C8928CF6B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296378; cv=none; b=njoWPM4xTX/YJmP45vUNz4SeeHZcxNrO9LWda+q6RId7amuj6qQG97pw8CjK4WHD1FWnb/cDroFr3cIW/pPrmqKC3LzDse245f0F24U1Qed0qkQAWFWxT+fxWdolt3rK6Dif8c7jr/qkN3WqpAY9GRX1giE+Jjr8aQl2Hkd/llM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296378; c=relaxed/simple;
	bh=oU8SJX5WyyNKWUP9RF4rOJ5aADSUgHCD5ZAwRyJh8Y0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WjalfJ8Z588LdMojEk55Arumdh5UV1lkbP17UosK/tuYGnMEteh+kVrsbRHg+1ecJ2Dhy8RPSyxv4EnK5g7bnVuLCUC0obtno5YEUX0h3L/s8vLDGVTZlWiCXKfO4kyA9JDhmqdTdzh+fJswkJHkzX6tZQL8nH7Hvflxr9UcmOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gZGrTci4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gZGrTci4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744296375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oU8SJX5WyyNKWUP9RF4rOJ5aADSUgHCD5ZAwRyJh8Y0=;
	b=gZGrTci4/AHmKSZFJiHowALIR5O4SVef80Vo8XH0Sel7l/duMa05rEVvGJMySdua8Ex0iT
	Skv6gyZ/DY6BoxrQmB59KfmDGgLKvjQkcIVHwQlBLCzXDHpuGm2nVeR1zkrLUh3lESpN2C
	Cc76b74rB/f/bc0qt2uUWJzR3BRNrXw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-CSwPCGahO8env6Jkai7hRw-1; Thu, 10 Apr 2025 10:46:14 -0400
X-MC-Unique: CSwPCGahO8env6Jkai7hRw-1
X-Mimecast-MFC-AGG-ID: CSwPCGahO8env6Jkai7hRw_1744296373
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-391345e3aa3so524438f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744296373; x=1744901173;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oU8SJX5WyyNKWUP9RF4rOJ5aADSUgHCD5ZAwRyJh8Y0=;
        b=ItNp2QK4EvAeEZI8YhHFNZVmIJYZtRNMxM1NyIz/R2DeUl+N9MFfaOUD7lT+VLkMXN
         X1pm9/wRbWQsIrWkZOR0jnK5F2JW+sOqYbVGYSqrxjo/2JscGFX+i4x4j3Dzrn62kM02
         gbnwTLSu3g4TdCTDMZUMgDN5EswPBeX93gkPuWaC8B0gccOIIf7Hm60rIsAZklUe85rt
         LXfMSYI1ulo7VwD0hifpp0H78ZbXKXm2PMJtrQnOG8k/lFUEge2HLkcTMnhieNncdfVt
         EgsOUX+9pTcOvF3ARD9SKx2CLDs1ckzKDA9gEv9OlXAoctbiNFmbWHEf2ag/bF8/fUL8
         a7rw==
X-Forwarded-Encrypted: i=1; AJvYcCVY4SjF83AYcUTEint9nPuneNfSeB37+zEoEb4fE6RtgtT4aj/2R5J9zc1lzixQr4KScJI1PGmRhLgThO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXUh280E4OBWUIPFAC4QBoxBikrmuaboJmh+J+SuskA1JdFu1y
	Pjbi0/niAb2Hbl7VN/V9d1f3dAxL412D0YrJZ04pgwdPx+m+PPzMSyn3y9JH2p/UVasSOHQC+KB
	CSaDFI+9XYDBu0+YwVENja4O+Iwb4dKH0BlbwbT4DmpFcLjGH2zGIeO+9aqTQXQ==
X-Gm-Gg: ASbGnctNA6QSqkv5vvCcfn5+kJGGk6xP6hVxVt/Q2mraAvH1Hf9mrrfacHbd9hfuQAH
	LvXS1md5wtlXQa6vYEuuKQpI6/h0MO2x41MVNsfLsZrSRfC/mEpUPHACXu2odZv7uvqMWsZK+92
	p6dPE8gqu9AlLa1MqK3p7w8EkKhgLy1MWR7EvWGTvZLpIUQo99/fBgslq8nriEHBI3BcMWcXH34
	jRWWDh1NMWDm4gFYVeNPuAbynsQfgIfzRGSpC1ySyJiHJwnqj6bsGWXxqx7nZDJ2xkn9Vigqcs5
	SVaXZR+JnZEvh7oMUxpCvZvRnU0agSHxL73aGg==
X-Received: by 2002:a05:6000:1a8e:b0:390:ff25:79c8 with SMTP id ffacd0b85a97d-39d8f46d972mr2632513f8f.20.1744296373284;
        Thu, 10 Apr 2025 07:46:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6PYZq0Smtq9sPI7tEv6ZVbSkAkP4wcWJMBYxtJ2TYTOz9az/4zgBgL8IPBd3nnGyOF+gHbA==
X-Received: by 2002:a05:6000:1a8e:b0:390:ff25:79c8 with SMTP id ffacd0b85a97d-39d8f46d972mr2632488f8f.20.1744296372921;
        Thu, 10 Apr 2025 07:46:12 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89363066sm5012785f8f.7.2025.04.10.07.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:46:12 -0700 (PDT)
Message-ID: <56eae8396c5531b7a92a8e9e329ad68628e53729.camel@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
 Waiman Long <longman@redhat.com>
Date: Thu, 10 Apr 2025 16:46:10 +0200
In-Reply-To: <Z_fTmzdvLEmrAth6@localhost.localdomain>
References: <20250410065446.57304-2-gmonaco@redhat.com>
	 <87ecy0tob1.ffs@tglx>
	 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
	 <Z_fBq2AQjzyg8m5w@localhost.localdomain> <87wmbsrwca.ffs@tglx>
	 <Z_fHLM4nWP5XVGBU@localhost.localdomain>
	 <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>
	 <Z_fTmzdvLEmrAth6@localhost.localdomain>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Thu, 2025-04-10 at 16:20 +0200, Frederic Weisbecker wrote:
> Le Thu, Apr 10, 2025 at 03:56:02PM +0200, Gabriele Monaco a =C3=A9crit :
> > On Thu, 2025-04-10 at 15:27 +0200, Frederic Weisbecker wrote:
> > > But how do we handle global timers that have been initialized and
> > > queued from
> > > isolated CPUs?
> >=20
> > I need to sketch a bit more the solution but the rough idea is:
> > 1. isolated CPUs don't pull remote timers
>=20
> That's the "easy" part.
>=20
> > 2. isolated CPUs ignore their global timers and let others pull
> > them
> > =C2=A0 perhaps with some more logic to avoid it expiring
>=20
> This will always involve added overhead because you may need to wake
> up
> a CPU upon enqueueing a global timer to make sure it will be handled.
> At least when all other CPUs are idle.
>=20
> > Wouldn't that be sufficient?
> >=20
> > Also, I would definitely do 1. for any kind of isolation, but I'm
> > not
> > sure about 2.
> > Strictly speaking domain isolated cores don't claim to be free of
> > kernel noise, even if they initiate it (but nohz_full ones do).
> > What would be the expectation there?
>=20
> I don't know, I haven't heard complains about isolcpus handling
> global
> timers so far...
>=20
> I wouldn't pay much attention to 2) until anybody complains. Does 1)
> even
> matter to anybody outside nohz_full ?
>=20

Makes sense..
In our case, 2. is not a big issue because it can usually be solved by
other configurations, but 1. is an issue.
Most people indeed use nohz_full in that scenario, but some users may
not want its overhead.

I find it misleading at best for global timers to migrate from
housekeeping to isolcpus cores and since it's "easy", I'd definitely
change that.

Does it make sense?

Thanks,
Gabriele

