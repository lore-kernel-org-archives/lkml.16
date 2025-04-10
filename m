Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE9421324E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293370; cv=none; b=M/7lC2UtA5u1AZVTYHGv1jHDEWwPfUJJ+vcNa53wdRJHR35TJZgtwyJ1MGP6s1V549MK+6NJPJRFN2bz0KcicWxB1si6G8TZaGG4tddUHcFAq89KSvNF9iieU5AQOdmr620xCrvTuphqliy4bAMbwx6NLTWGJXLSD/7IjvWN8xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293370; c=relaxed/simple;
	bh=buq4GocT9v50gY04pTIphqlX6CgAP6sdAyF9TXmLaCY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WlT478Ubegk5Mj2TuuQnd2EQS2qyuFgmxVsFeQpBKh4Xl/iPq7V/iKcgWkT02Lc9sy+s3tG4ERBDypifFPiv8Lpg40DUQBiR+nSBabNHFNyzNX4Th6Oj98uj/Dn0Ndxg+bckbBkPSASIswIR069BtexDEWw4RlR7MJRVIpXfmPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Clu9++ix; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Clu9++ix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744293367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Y6AsNBwkam7Rs89sYQFcRmB96tHIPh3DZfLWLS0l5g8=;
	b=Clu9++ix6PN7e9BMDWaObzT6j9angLARJQ9wVOYDh97dXF2d8oDXvGfQXCbGRWNdgVCeGu
	L7r9s5+2ImLSBDVda1FI2ZtLgWGl39TfXq7xF9NfGWwMZ/oxy/gS31Vi+5xDKIKje0+jVg
	uxK9R7UFwaL5Kyu7jeRQXblEGD0pSw0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-x04a3esbP9SCbCKel6TPgw-1; Thu, 10 Apr 2025 09:56:06 -0400
X-MC-Unique: x04a3esbP9SCbCKel6TPgw-1
X-Mimecast-MFC-AGG-ID: x04a3esbP9SCbCKel6TPgw_1744293365
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3912fe32a30so365759f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293365; x=1744898165;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6AsNBwkam7Rs89sYQFcRmB96tHIPh3DZfLWLS0l5g8=;
        b=ENsRGatXV+mAzMg43dOPCopUjEXbINRnfsz5WLbQXz7NJYc4yVwHVE/MMQBGX80g6M
         8qTjZMrvuMdQQRWgrzsT3gdeOd98nKXvEkqUPVI8fypDAXl5HuyCntoBhjYrsT41DRRC
         KdD3DjHm1VsWbpFVgcQSlrNAo4TC4KOKcFj3YR89zHRHyhrRd92yzLpXLpsajI/8hokq
         22h4PCb7VfFFKkdAz1Y+ahRNQ6L8DVCrE9yO/FyBWJL4omQM63X5R1lIhgL6c/JkkU+4
         twwqSlS278HCXs8o7Fbc8Ust3ctVXobD5JMEZ1GC/EEgkA+DHbnXC2LiVz5t4ERk95LO
         t+JQ==
X-Gm-Message-State: AOJu0Yza7b1ZthsTH17zejJhfPX3PZkS+ZqWxq/CbAGE0JJWMT0XHx3M
	nzzeQFbTb5mGWvl3QdlOr1qSUe79Pl3k5ekWDaMn6HzHLBNfGRbXRlqk549bqqrm/JbPbg7GwO7
	bkh6ZBPlWPcz516oQjBgUi1TpI94COwBo0wf0WoUPcrHdhLsd/MfPAAwOjP97rA==
X-Gm-Gg: ASbGncvj547gLkc5bITwSySENUI8RjnuqwPXwQnqQXFOJOBGG+bjz5Wck2rz0LF3y/i
	k6GtyzAe2fYuUpCOV2vGg63RtGkDbgB9wnJOyhow3R4O1xulWFyMKOL3QLE58ZvS+lalXXcDz6v
	L6HBziufMs1ZlJ4R1UYw5/+RAJJ1Ez5+mjTiQf0Jjab2CD0ZtJ1hAEpkV4ktzg5DGoFXuKuKeXR
	p87KdVZ4k3phdAfeqiZ5n0/iWxcVKy1BX8pV87eD6/nGvOJCjM5sNm12avPTzYdUrr9f/noEx28
	fLcsu4V4FInRKO/jzVlxtX5VjEptxF04C4TMSQ==
X-Received: by 2002:a5d:64e6:0:b0:39c:cc7:3c5f with SMTP id ffacd0b85a97d-39d8f4dd012mr2438306f8f.45.1744293365437;
        Thu, 10 Apr 2025 06:56:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa9U9YbrHYbtZLOuihXbzRt3CqB8r0uJ7jXJmmJ975NQnZFvT+hClpDLESHtrysiCs+B2i+g==
X-Received: by 2002:a5d:64e6:0:b0:39c:cc7:3c5f with SMTP id ffacd0b85a97d-39d8f4dd012mr2438287f8f.45.1744293365089;
        Thu, 10 Apr 2025 06:56:05 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89362cecsm4916297f8f.11.2025.04.10.06.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:56:04 -0700 (PDT)
Message-ID: <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner
	 <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Waiman Long <longman@redhat.com>
Date: Thu, 10 Apr 2025 15:56:02 +0200
In-Reply-To: <Z_fHLM4nWP5XVGBU@localhost.localdomain>
References: <20250410065446.57304-2-gmonaco@redhat.com>
	 <87ecy0tob1.ffs@tglx>
	 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
	 <Z_fBq2AQjzyg8m5w@localhost.localdomain> <87wmbsrwca.ffs@tglx>
	 <Z_fHLM4nWP5XVGBU@localhost.localdomain>
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



On Thu, 2025-04-10 at 15:27 +0200, Frederic Weisbecker wrote:
> Le Thu, Apr 10, 2025 at 03:15:49PM +0200, Thomas Gleixner a =C3=A9crit :
> > On Thu, Apr 10 2025 at 15:03, Frederic Weisbecker wrote:
> > > Le Thu, Apr 10, 2025 at 12:38:25PM +0200, Gabriele Monaco a =C3=A9cri=
t
> > > :
> > > Speaking of, those are two different issues here:
> > >=20
> > > * nohz_full CPUs are handled just like idle CPUs. Once the tick
> > > is stopped,
> > > =C2=A0 the global timers are handled by other CPUs (housekeeping).
> > > There is always
> > > =C2=A0 one housekeeping CPU that never goes idle.
> > > =C2=A0 One subtle thing though: if the nohz_full CPU fires a tick,
> > > because there
> > > =C2=A0 is a local timer to be handled for example, it will also
> > > possibly handle
> > > =C2=A0 some global timers along the way. If it happens to be a
> > > problem, it should
> > > =C2=A0 be easy to resolve.
> > >=20
> > > * Domain isolated CPUs are treated just like other CPUs. But
> > > there is not
> > > =C2=A0 always a housekeeping CPU around. And no guarantee that there
> > > is always
> > > =C2=A0 a non-idle CPU to take care of global timers.
> >=20
> > That's an insianity.
>=20
> It works, but it doesn't make much sense arguably.

I wonder if we should really worry about this scenario though.

>=20
> >=20
> > > > Thinking about it now, since global timers /can/ start on
> > > > isolated
> > > > cores, that makes them quite different from offline ones and
> > > > probably
> > > > considering them the same is just not the right thing to do..
> > > >=20
> > > > I'm going to have a deeper thought about this whole approach,
> > > > perhaps
> > > > something simpler just preventing migration in that one
> > > > direction would
> > > > suffice.
> > >=20
> > > I think we can use your solution, which involves isolating the
> > > CPU from tmigr
> > > hierarchy. And also always queue global timers to non-isolated
> > > targets.
> >=20
> > Why do we have to inflict extra complexity into the timer enqueue
> > path
> > instead of preventing the migration to, but not the migration from
> > isolated CPUs?
>=20
> But how do we handle global timers that have been initialized and
> queued from
> isolated CPUs?

I need to sketch a bit more the solution but the rough idea is:
1. isolated CPUs don't pull remote timers
2. isolated CPUs ignore their global timers and let others pull them
  perhaps with some more logic to avoid it expiring


Wouldn't that be sufficient?

Also, I would definitely do 1. for any kind of isolation, but I'm not
sure about 2.
Strictly speaking domain isolated cores don't claim to be free of
kernel noise, even if they initiate it (but nohz_full ones do).
What would be the expectation there?

Thanks,
Gabriele

