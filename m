Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4BD204F80
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296559; cv=none; b=dP0G3QIBr+HSQkEEG+We9LYOTrk0ED+mjjSJch6VasvUmBRwCjO+sVGJOfTURma3mOkI/79Y94Hg8Pn9r4uOEM07IWFzht5LSm8XMpGxkaXIIRUbh3lKfB5SP9QM/fHgG6QlpeKmlYteNrz+XFZcaMDy4fGmQayNyvsuB+8OOGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296559; c=relaxed/simple;
	bh=QHgcNq1BAdaiPXt3c2NWRhrToijng7heaO7zmeZwCr4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A37pe37mUvzyOkhyg8QnWc0UJ485rBRkBmRaoShHdpejwKLSwogFO/EkD4MBse5J7dVbYwL/Ru4Wq4/ffy7wV0CLUwduDGM77DeetLjhy83a2a6611DuIODv963QLSNy7pGZpAaWK8vRNRzdcvfb9WlgUnu03f8LoPwTKey1kKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D5oaoJIP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D5oaoJIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744296554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BOSK96PtW8ypDtlZSq59Nu6App2mX8/352zPoe4BXAo=;
	b=D5oaoJIPp5uhVe74+H4WS2sXZKBmiiCDg0Q8QW+7br94JH7V41QGZTi+TV+l3m/ZidGiy2
	c2PT13V1ax6aNRPa7NrePBnfu+ktX1ifs626E7RKiwNO7/0+QpjWx2Jby30GYidf7js8KT
	zer4jNnHqt0ZjEZOFalpaI4QmRxC73A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-qWje76x8Nmq3uapBEoV9dg-1; Thu, 10 Apr 2025 10:49:12 -0400
X-MC-Unique: qWje76x8Nmq3uapBEoV9dg-1
X-Mimecast-MFC-AGG-ID: qWje76x8Nmq3uapBEoV9dg_1744296552
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so5422175e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744296551; x=1744901351;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BOSK96PtW8ypDtlZSq59Nu6App2mX8/352zPoe4BXAo=;
        b=MnWBrz4sx1P8x0qiMn3F0yk29YxEacT/qV/B6PkoBLhsnx1rngHAeJJhnxPS470BzA
         ZSsEKJCChim2B4pReh6q9HPP3xa+YWhGE8GZhzCHf14ANseeE4Baj3GaKooJRhQKx5sj
         jrxU7gsLHEEfVAUFfoYy4Mz0GkIEP98VEFDijbXmnx17KPqFB1iburyS6z8WLPGs527H
         tMYfLoeQGz2FHLE34A2WZVFQ9ipzwdAqk5ZwT2o/KdoyrOJNJNpzmV1O4AMMJ/ZzGToN
         jjgSOzPwFqzf7NxazN/MrwjNxkODO0fzKyo8cLx09C3b+poqN2Al5lBVp8iteEpIotI0
         NyEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGo6xl8fGfh9Dj+cAfHIpUzwKDcvIkmdiSgEa6iJA6831eXaA+5glyWMgy4g2R65baY4NcYq5wmjMT1mQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyotoJFsbkh4pf9lXgafj02KUnBtPJXekGX5F+5Ny9oLOlbEnjG
	PLXMV3jvPAwUwCITc8tksl7O8NiSEsmZaaBqDxT2xttXWuXeGpWPxs8kUeQCgS2WXhSVPnTI2q1
	oyOOkMAO4GdyoPlXWbHBMUdHt8g6Y/SDlpYOLmhTPkYNa8iAlOZpWiR3tcNasrg==
X-Gm-Gg: ASbGncvRiri9Ry5bRqqjmv/M4kgJMto2bIchvSPaF9n5+5BhTW6FqTmprDuBLxxvE2r
	PRFOK4Lv3vjtnR1qfF1aSNtrtIU1ll3wTGRjBME3u2bKCUYfk7IHT7tGqlckTbaFAaTUI9mfrAm
	Z/sEgJ93BwRixi3ayoCLpbhpRADSVdbykkoa0hKp+WX8pmIRrjuV5Lr4ejjT9lABJzOvTiyMuZz
	D6hDHQCOIgs8eWyRMQPUp1D9Te99fLdEJDdyUV5rUCHfvOGwsR38koi00YB37gCurD46R0ivc4b
	IiNnJ0B2wayt0XKTZbm7CW+DzwJM78PGMCZA4g==
X-Received: by 2002:a05:600c:1e02:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-43f2d688ca9mr39685845e9.0.1744296551639;
        Thu, 10 Apr 2025 07:49:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1Es1yXV9jGw7aSz+cHJUTqQISYOc7sxn5Z7hKD1GkHoCPRoSDNtiAfZIA4oU+uy/BcdlhWw==
X-Received: by 2002:a05:600c:1e02:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-43f2d688ca9mr39685585e9.0.1744296551259;
        Thu, 10 Apr 2025 07:49:11 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89362fcbsm4928570f8f.5.2025.04.10.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:49:10 -0700 (PDT)
Message-ID: <2b8a231a7eea592797bbbd853d85ef443d1e58d4.camel@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>, Waiman Long <llong@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Date: Thu, 10 Apr 2025 16:49:09 +0200
In-Reply-To: <Z_fZJfgwzpz_ccny@localhost.localdomain>
References: <20250410065446.57304-2-gmonaco@redhat.com>
	 <87ecy0tob1.ffs@tglx>
	 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
	 <Z_fBq2AQjzyg8m5w@localhost.localdomain>
	 <77988036-7550-4ee2-a738-9f9bd4417001@redhat.com>
	 <Z_fZJfgwzpz_ccny@localhost.localdomain>
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



On Thu, 2025-04-10 at 16:43 +0200, Frederic Weisbecker wrote:
> Le Thu, Apr 10, 2025 at 10:35:55AM -0400, Waiman Long a =C3=A9crit :
> > On 4/10/25 9:03 AM, Frederic Weisbecker wrote:
> > > Le Thu, Apr 10, 2025 at 12:38:25PM +0200, Gabriele Monaco a =C3=A9cri=
t
> > > :
> > > > On Thu, 2025-04-10 at 10:26 +0200, Thomas Gleixner wrote:
> > > > > How can that happen? There is always at least _ONE_
> > > > > housekeeping,
> > > > > non-isolated, CPU online, no?
> > > > >=20
> > > > In my understanding it shouldn't, but I'm not sure there's
> > > > anything
> > > > preventing the user from isolating everything via cpuset.
> > > > Anyway that's something no one in their mind should do, so I
> > > > guess I'd
> > > > just opt for the cpumask_first (or actually cpumask_any, like
> > > > before
> > > > the change).
> > > With "nohz_full=3D..." or "isolcpus=3Dnohz,..." there is always at
> > > least one
> > > housekeeping CPU. But with isolcpus=3D[domain] or cpusets
> > > equivalents
> > > (v1 cpuset.sched_load_balance, v2 isolated partion) there is
> > > nothing that
> > > prevents all CPUs from being isolated.
> >=20
> > Actually v2 won't allow users to isolate all the CPUs. Users can
> > probably do
> > that with v1's cpuset.sched_load_balance.
>=20
> Perhaps, and I think isolcpus=3D can too.
>=20
  # vng -a isolcpus=3D0-15 cat /sys/devices/system/cpu/isolated
  1-15

Seems not..

