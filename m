Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901F57DA73
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747998953; cv=none; b=b73bjguAgAhaaJS1A98tvTl6ux5ovw5Jccsr7MNqln3VMUKymuBapxaOFV2ee0qt954Ukqrbr2wtI7zWuphHd3wC9F2EStAVrO8c5gX6MH0H1yI5rFsbyeER8M1boO05uEEkxdwIYHymwRGkNpI7eVxN4gH5pqOrSCHceRPlnL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747998953; c=relaxed/simple;
	bh=J6e1TgdBjaEx8XvZ6C8MNn1skWDBpxxnlWuZc/HxhNo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZwQohgVgXaE9NXrp317m7YpNzgyqjvdWI8W3RQOXYpRGhsyVwzsL1ODXna0sSPuQSESRYOP4YeY2PDFxilE2xi442P65sfy+dfrSDqqn/DaeE7c+8qpR/Tj/qY0ABHnYGREJ3I9FE5HbGi3Lg4d+CMonf4x3Y2+ULy5U9mblLnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UuDwRN6U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UuDwRN6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747998949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=J6e1TgdBjaEx8XvZ6C8MNn1skWDBpxxnlWuZc/HxhNo=;
	b=UuDwRN6U4SGh86TvUXacTTug4fm+xUu8/+fqTW6Cc9SpN08XnJjEe0La3LF4Gf127AWFYz
	7ngml/95GXHMvOiRul7AjO4IzydziVy086rU82X1tUECwo2kT3RY0W9BOSBkwhZew0w/fz
	xe0cha3p1jyPfcwX+HcNqvLkmKI8wSY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-7udrvziqNS2TbeEAtrU18Q-1; Fri, 23 May 2025 07:15:47 -0400
X-MC-Unique: 7udrvziqNS2TbeEAtrU18Q-1
X-Mimecast-MFC-AGG-ID: 7udrvziqNS2TbeEAtrU18Q_1747998947
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a364d2d0efso3531463f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 04:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747998947; x=1748603747;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6e1TgdBjaEx8XvZ6C8MNn1skWDBpxxnlWuZc/HxhNo=;
        b=MXq2FoyS2xcVtPOtbrJ8PNuJP3Y9F9+DYPDBZ3z4fP6i6Wu2Mag0AXTuoHUOcIPxuX
         eLn9PSKMwuqLp3SAPjcvAKsF4O4xVyMSND2QcWM6p7FZ7jrihgfBQdvd6d1ojXwdGILP
         l67P+BAt+CUYmxQeZ4hgPSlPu8ILTVrjMrjkcbBVx8sSQcufJsQbdR9rLJjcxmqKsoVZ
         9WIuV8ZLIClKRRReFYoiKRTS6isHof7rRJfTOFIHGxTJtvS7yRO0a9t8OxCz0wr9TFwZ
         YFzhHrsNMbWp7e9iGr0FTAq6jfBSWa5mCCInKm64khJ/PnBWsTzXIYPQ39LCv4g/3R4a
         zjzQ==
X-Gm-Message-State: AOJu0YwGL24OMUyiBptImz/mxMZBw+X93i5s5W33PfP3Dj4NQcoR8EkK
	/K5sHIxopUOyJow2udw1Y/DkodGgwuqbRYbLFKtA2Cdy3C4OIbqGrqsUsl+OHIsOy2JeCHeDBvQ
	Mk3KR64Ub66UbZEbBWf+Qw8R8TN256OK1XWb5g+fACkZeoPGZeBT2Lm3QGFLLV88JDA==
X-Gm-Gg: ASbGncu1wUt+x7VMkSAV4jTFQ0PiL6J5sms8monmZpem7bNEGJ5ufe3d3JkghMxOYFo
	yKCTfbh62kvCO6RBGcsQ5Rt0OGWl6fgkEI3E2Guc8o12sEgsfrHUhmcZUM26+TXg3b25hTVGI8s
	stq3TcPJ+ZCQ+XMdR254MnTsQHKx0/xyPdgIFtKvy+FgXZkLSnkaRMlDMC3eOG+v1JmmH27/eEV
	QDk1p67x6HxzKBiK8nEBUenyE+Z1Dp7Vz/7DvnZJcmSQUPtiFNNksm8ke1aNPyq06TwZ9DcwYJI
	XedyiU1c6pZ6YP51dtFKPsj7nHPat0gPNE6viA==
X-Received: by 2002:a05:6000:2387:b0:3a0:7d27:f076 with SMTP id ffacd0b85a97d-3a35c808dafmr28627765f8f.2.1747998946747;
        Fri, 23 May 2025 04:15:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuPwiNwmmzA9AIp0wWmLST5V+HF4P7xwvKIOizJ7kcxEm1aHBtXZgLtzxEGmJXrPuRjZck0Q==
X-Received: by 2002:a05:6000:2387:b0:3a0:7d27:f076 with SMTP id ffacd0b85a97d-3a35c808dafmr28627734f8f.2.1747998946278;
        Fri, 23 May 2025 04:15:46 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5aba3sm25724068f8f.40.2025.05.23.04.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 04:15:45 -0700 (PDT)
Message-ID: <3acad4a1a07ccbde615ea19eb13a96f37d4a3a2f.camel@redhat.com>
Subject: Re: [PATCH v5 5/6] cgroup/cpuset: Fail if isolated and nohz_full
 don't leave any housekeeping
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
 Waiman Long <longman@redhat.com>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>
Date: Fri, 23 May 2025 13:15:44 +0200
In-Reply-To: <aCyRhAeGwLSVf2LZ@localhost.localdomain>
References: <20250508145319.97794-8-gmonaco@redhat.com>
	 <20250508145319.97794-13-gmonaco@redhat.com>
	 <aCyRhAeGwLSVf2LZ@localhost.localdomain>
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

On Tue, 2025-05-20 at 16:28 +0200, Frederic Weisbecker wrote:
>=20
> Apparently you can't trigger the same with isolcpus=3D0-6, for some
> reason.
>=20
> One last thing, nohz_full makes sure that we never offline the
> timekeeper
> (see tick_nohz_cpu_down()). The timekeeper also never shuts down its
> tick
> and therefore never go idle, from tmigr perspective, this way when a
> nohz_full
> CPU shuts down its tick, it makes sure that its global timers are
> handled by
> the timekeeper in last resort, because it's the last global migrator,
> always
> alive.
>=20
> But if the timekeeper is HK_TYPE_DOMAIN, or isolated by cpuset, it
> will go out
> of the tmigr hierarchy, breaking the guarantee to have a live global
> migrator
> for nohz_full.
>=20
> That one is a bit more tricky to solve. The easiest is to forbid the
> timekeeper
> from ever being made unavailable. It is also possible to migrate the
> timekeeping duty
> to another common housekeeper.
>=20
> We probably need to do the latter...

I'm thinking about this again, is it really worth the extra complexity?

The tick CPU is already set as the boot CPU and if the user requests it
as nohz_full, that's not accepted.
In my understanding, this typically happens on CPU0 and this CPU is
kinda special and is advised to stay as housekeeping. As far as I
understand, when nohz_full is enabled, the tick CPU cannot change.

Said that, I'd reconsider force keeping the tick CPU in the hierarchy
no matter if we isolate it or not when nohz_full is active (e.g. what
you mentioned as the /easy/ way).
We'd not prevent domain isolation (as the user requested), but allow a
bit more noise just on that CPU for the sake of keeping things simple
while not falling into dangerous corner cases.
If that's still a problem for the user, they are probably better off
either selecting a different mask or setting nohz_full consistently
(I'm still wondering how common a scenario this is).

Am I missing something here?

Thanks,
Gabriele

