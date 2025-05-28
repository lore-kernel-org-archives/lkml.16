Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DEF2798E6
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748431658; cv=none; b=CboZbXTSk2RTebDKhUrw7qRGZt/VJXAblSj0TJLiGB5r6kw7ZfIf1IcCw8MRslGcQt+0rl1+8SugKrVQ/mzrCm2CJS1ckhm3+lp3C1oYM7SJCtY9va4HuYZ9h7T3c+/058M95Wp5nUnx8bT3j1pm8R23+4oZ5YwwjxRJ4W36ROw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748431658; c=relaxed/simple;
	bh=nTIue3Mvzn20Dd3HzdKn9bucnWMFMJhc/jukety0TF8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FeeAZZJiyfnB5Hqn8OmhIOAMo082zPOLZyYB7S7awt0DuEK+etGJbNDuzNH03cNQl5yEx3/hy20ApBNjFe/YYZFPWtKEZEC6QoKG2lkn3hXqfOLmWij12+JMS6PYPNjoo7ygPtpoLSnOsvXEYdpougFQdzZx/F7k9UesP9BV3Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HlXkGXUD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HlXkGXUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748431654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nTIue3Mvzn20Dd3HzdKn9bucnWMFMJhc/jukety0TF8=;
	b=HlXkGXUDRQI6zrRQUyNTqUWMmFBTLLFyTYGC0dQffBIgGazfZ+b06CDNISqkG/krVVhiai
	BY4pXRuHE7e+kJARqk/HYrurPt2JeIYPeNad0f5QVZVVGeOOAqeZFvh1DKQ9LDp+oS9Ea4
	EscwxtUYzsAGz/R+cPBF0EFcJQEngis=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-gzwblDV0M9eYVYGUETfDxA-1; Wed, 28 May 2025 07:27:33 -0400
X-MC-Unique: gzwblDV0M9eYVYGUETfDxA-1
X-Mimecast-MFC-AGG-ID: gzwblDV0M9eYVYGUETfDxA_1748431652
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6021b8b2ab1so4400983a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748431652; x=1749036452;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTIue3Mvzn20Dd3HzdKn9bucnWMFMJhc/jukety0TF8=;
        b=UYvYPu629r/jVgYdTPPxDBsjXJPYy3jArLUUW6+9pVhe+gOuB9q8xg+xrdNTv/Y/Q0
         JYJqACdBhkLr6SAZ9yQGASkhQe+QbOUjlM8J0+Sl+1MR6fYNL+7TVaC17PZn327Vvf0z
         Sx1jlLRcuMRV1hk6sabuSLVEBthOL42pwXFVeMTmx21C24N2Mqllsm4eSYcEUen2u598
         Pvh7lTzx2158PHT5chlQTerHea5e19K5z3sHnzNg4xhuRucIuMCMmBYOV3N5axcD93SN
         aGe0m1kAEy2gIfyrRwuE5bMtD8856EYMnvUkVSQqPXIt+QYG8PT5Tk8g4T8S0aaLgnge
         8qQQ==
X-Gm-Message-State: AOJu0YwBGpYJqQkl5BV2EaiAdlK4Mgdv9m7cPB2MUVD/+zIsXafi7NRJ
	jQ9k9COFQGeOt1MWA5J1kfgrObyvZpz07izg8Y3N5sAf7ZWmAUwSxtRzqCNKJmYqOCzoBVu6/Xm
	nBZORze/rOh3re42gMt6NHsVACRCKCxP+WjabW1h2KbNvxBiMqEphBU0WuFDOr07yWw==
X-Gm-Gg: ASbGncvHlHf7KEIrxyuoLCSOvH7XsqsHdeGonJWi6+UnEAazjVczT9K25qBcBIudIas
	it33uvLg2g05yI+G0cgfldLe51kLWaNn6gDqHGlU3DFIBkiW/DfvDj5qqNld23i20UQJ89HxWyd
	GMrdGrxEcYdyNNHwtwS6grfuN+uTsNwkzAk19LKdK0Ac4ezs7M/vKpPQTOD72m81htGqAfcIDB3
	TgBkfKyaLNKumL0yV+vQzcyTVhcYqjLxsIWuZmlr4DKONlzZYdqVYgtRrPgwlGxKEbzFDyTaFoI
	1fHk7r62jWVh/69vE08H9AAxVQK4yQqcyMHS26kt
X-Received: by 2002:aa7:d644:0:b0:5fb:f4a5:7871 with SMTP id 4fb4d7f45d1cf-602da2f841emr10797119a12.16.1748431652412;
        Wed, 28 May 2025 04:27:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwQUWEH2pCZ5bxs+CgNRhJt6TOY/L9pdb25KbPomHATF7eVp8pLEQnjG8aLofLp7Gk157YcA==
X-Received: by 2002:aa7:d644:0:b0:5fb:f4a5:7871 with SMTP id 4fb4d7f45d1cf-602da2f841emr10797098a12.16.1748431652041;
        Wed, 28 May 2025 04:27:32 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5d9936sm649141a12.7.2025.05.28.04.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:27:31 -0700 (PDT)
Message-ID: <5fa6744332000be5e914e32d205b634e22bc4f4f.camel@redhat.com>
Subject: Re: [RFC PATCH v2 12/12] rv: Add opid per-cpu monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Ingo Molnar
	 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Tomas Glozar
	 <tglozar@redhat.com>, Juri Lelli <jlelli@redhat.com>
Date: Wed, 28 May 2025 13:27:29 +0200
In-Reply-To: <20250527145032.fIN-37M_@linutronix.de>
References: <20250514084314.57976-1-gmonaco@redhat.com>
	 <20250514084314.57976-13-gmonaco@redhat.com>
	 <20250527133712.CFW5AcNE@linutronix.de>
	 <6f33e6b7ad296f4fd0e9c089ac92e53c08cfd850.camel@redhat.com>
	 <20250527145032.fIN-37M_@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-05-27 at 16:50 +0200, Nam Cao wrote:
> On Tue, May 27, 2025 at 04:35:04PM +0200, Gabriele Monaco wrote:
> > Thanks for trying it out, and good to know about this stressor.
> > Unfortunately it's a bit hard to understand from this stack trace,
> > but
> > that's very likely a problem in the model.=C2=A0 I have a few ideas
> > where that
> > could be but I believe it's something visible only on a physical
> > machine
> > (haven't tested much on x86 bare metal, only VM).
> >=20
> > You're running on bare metal right?
>=20
> No, it's QEMU:
>=20
> qemu-system-x86_64 -enable-kvm -m 2048 -smp 4 \
> =C2=A0=C2=A0=C2=A0 -nographic \
> =C2=A0=C2=A0=C2=A0 -drive if=3Dvirtio,format=3Draw,file=3Dbookworm.img \
> =C2=A0=C2=A0=C2=A0 -kernel /srv/work/namcao/linux/arch/x86/boot/bzImage \
> =C2=A0=C2=A0=C2=A0 -append "console=3DttyS0 root=3D/dev/vda rw" \
>=20
> The kernel is just x86 defconfig + the monitors.
>=20

Apparently the error is visible on non-PREEMPT_RT only, the models are
designed for preempt-rt and I didn't really test them elsewhere.
Not sure if it's worth tailoring them for non RT kernels, but for now I
can just mark those monitors as RT-only via Kconfig.
Especially this type of monitors is describing very accurately the
preemptiveness of some events, I wouldn't be too surprised if some
rules don't hold in all preempt configurations.
The idea is that, as long as the models stand true, some assumptions
about latency can be made, on the long run this type of assumptions is
likely different across preemption models.

That said, it might be a stupid mistake as well, so I'd look into that
more closely ;)

Thanks again,
Gabriele

