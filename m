Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4919545945
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859169; cv=none; b=DFQ+E4l64Zs2N9qFbyMp99Xcgxb87RIHnrh+UNQLOe9xQM9OSLLYxCiN6/3YscH1p5prb26ZLayeR0QMdcF7m99dd/wn0VDo89dIohWpCe6m3jIUOCOcW2jq4WDQgiLO044pR8WOZZGzbmEaCJdcQlYqtiTo/WwMRsTGt1mOemM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859169; c=relaxed/simple;
	bh=DkhdF/kf2wSgUD1yNjOPQFXn+z2HOfvLnAWBk1XCoSM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AOM6ZM8Y1AJmtgARxHbNxRsjMP3YInq8TT4slZc4PImu/FGsN6v2v0HG0waqZJCHSMcBQXPiyhDohaG5OPwAZyVqMZoDkfQa0nDpl4bcnhrg+mxyExPvw6+VfZ+eQuZyeirRIfsoaKs02CutM48tLqeHdDozvY2OLGCcx0boeWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D8T7lO7C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D8T7lO7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750859167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DkhdF/kf2wSgUD1yNjOPQFXn+z2HOfvLnAWBk1XCoSM=;
	b=D8T7lO7CQ/jxYY+5LepYYt5ycebwnRnbQVJlwR4+anjdUzDV6ExYjB30PAvCq+YJNtDCCH
	8Caa90RaspNuUKAru3Evnuttdvq8OW3eSxuMLCBX+1WZGfvlejP22PTXtTDOlOU9Br49Ms
	k8oVJqKIXPvYUMqahZcR4ue32JSRjoc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-lOcs2_GqMbandKPqy2slHg-1; Wed, 25 Jun 2025 09:46:05 -0400
X-MC-Unique: lOcs2_GqMbandKPqy2slHg-1
X-Mimecast-MFC-AGG-ID: lOcs2_GqMbandKPqy2slHg_1750859164
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so835264f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859164; x=1751463964;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkhdF/kf2wSgUD1yNjOPQFXn+z2HOfvLnAWBk1XCoSM=;
        b=tuZ/si+gjnNIAD3pT/CJgqcI0rgxPLtYnJHHOMh2o1rz/6Q9TP520EkPjJFCRutuaB
         i2j/bVKiw6dWslNVr992B914KA5jrfN98ABMG/TxqgNkaRZrgtuYHaKurx/PPtntLxMs
         MHhIA/PfRadoaAhoSDjuA/yWcLxsXwEiSiGb+hG4zLDcH4T/Jym157oYM54SF1PmSr+x
         6W3kN8C4buf9siAJzIZvxILURD6hJ5o2VGkvY4OwYkbjbYI4k3IEnPbJcNogXj2Go+3J
         WdYxt9daoxZR/hx1r+VtVo7P7VnLpoylGHM1in8qO/duh+5BKzTYfO2ZnWI24Qt/FE4u
         mU/Q==
X-Gm-Message-State: AOJu0YwuTxDzCQ3vvLDOrlnM+K4ZCDooT4SjNb2ncL9s9nd+5XQzvSkE
	FnoxytMxNepoLZHS8hoNNU3Bq6y4TyvRiq3aceIez5V9Dv5VWCNgBt0tdUvdMBdk9S4Q0XAXNt/
	t30XxK0Kf/nuwkbHWp/RaKI+dhe9cTAO0WoA9h3/OrlmTpwWqtp9FRymheM6m120nCw==
X-Gm-Gg: ASbGncvnQZvcDwIbHccXn/LbKK5otfyD+EQ+GYZKMt79G9Dq3SNHmhX7JnDkLy3549u
	KgCXvc1VRMMBkLloVuvOdRZx0MuVOzeTBldLTZrnG3Z5yXFOmHSLgN89vdCqrShjACKoo2JdH21
	wNAiIdHRHclPs6nxH9o2R5/80QTCHMqU4yaK3H4UxR/qHhKLwG95Lpt59xXsWtGHH0TYdlSAIaR
	r2Jje3DAZYkI0Ma2IbBYQCREek4lEBzLqrO7ahwBAjyxNBYlADUfx3gUJ4/E2YtdQIOPZWzCtnp
	QA+0UOUiSMNrdp7JQnYMQenfhIJWqKTQzGs/cVZXNSoGNNsG
X-Received: by 2002:a5d:59c9:0:b0:3a5:5270:a52c with SMTP id ffacd0b85a97d-3a6ed5884a6mr2591902f8f.0.1750859164285;
        Wed, 25 Jun 2025 06:46:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBpSKcL2CNkEJu9dy31rxgn+Zouj+0ycQOZEN2aH8b7Rgllo20a5EXnfzkB7LVEskLeLnkqw==
X-Received: by 2002:a5d:59c9:0:b0:3a5:5270:a52c with SMTP id ffacd0b85a97d-3a6ed5884a6mr2591874f8f.0.1750859163836;
        Wed, 25 Jun 2025 06:46:03 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234db3bsm20580275e9.16.2025.06.25.06.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:46:03 -0700 (PDT)
Message-ID: <7955e52177e1ad9c309df9e6f788103ae46541cf.camel@redhat.com>
Subject: Re: [PATCH v6 6/6] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner
	 <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Anna-Maria Behnsen
 <anna-maria@linutronix.de>,  Waiman Long <longman@redhat.com>
Date: Wed, 25 Jun 2025 15:46:02 +0200
In-Reply-To: <aFv2mLdH3lNHdKtp@localhost.localdomain>
References: <20250530142031.215594-1-gmonaco@redhat.com>
	 <20250530142031.215594-7-gmonaco@redhat.com> <875xgqqrel.ffs@tglx>
	 <b33dcafca895da1d9c64a7d6ab771952a932e579.camel@redhat.com>
	 <878qlhnunz.ffs@tglx>
	 <1bc41a7a5bd46860318b0417fa27121758f28448.camel@redhat.com>
	 <aFq7rqbHugtiWF6Z@localhost.localdomain> <87a55waylv.ffs@tglx>
	 <aFv2mLdH3lNHdKtp@localhost.localdomain>
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



On Wed, 2025-06-25 at 15:16 +0200, Frederic Weisbecker wrote:
> Le Wed, Jun 25, 2025 at 12:45:32PM +0200, Thomas Gleixner a =C3=A9crit :
> > On Tue, Jun 24 2025 at 16:52, Frederic Weisbecker wrote:
> > > Right I think you need to keep those checks because if CPU 0 is
> > > isolcpus
> > > and CPU 5 is nohz_full, CPU 0 will become later the timekeeper
> > > and must stay
> > > in the tmigr hierarchy.
> > >=20
> > > OTOH if CPU 0 is isolcpus and there is no nohz_full CPUs, then
> > > CPU 0 doesn't
> > > want to go to the hierarchy.
> > >=20
> > > cpuset isolated partitions are different because they issue SMP
> > > calls whereas
> > > isolcpus is defined on boot.
> > >=20
> > > An alternative for isolcpus could be to make a late initcall and
> > > do the smp
> > > calls from there just like is done for cpusets.
> >=20
> > There is zero reason for isolcpus and nohz full muck to be
> > active/evaluated during early boot. That's all irrelevant and just
> > complicates things further.
> >=20
> > Can we please clean this up and make it a sensible design instead
> > of
> > duct taping new functionality into it in completely
> > incomprehensible
> > ways?
> >=20
> > Especially under the aspect that all this should become run-time
> > modifyable. That requires a run-time switch mechanism anyway, so
> > the
> > obvious design choice is to utilize that run-time switch late in
> > the
> > boot sequence to set this stuff up before user space starts and
> > leave
> > the boot process alone and simple.
> >=20
> > The KISS principle applies here fully.
>=20
> Ok so the late initcall should work.
>=20

Thanks both for the reviews.
I'm a bit puzzled by what is expected now, though.

The late initcall would work just fine to replace the call to
tick_nohz_cpu_hotpluggable(), indeed superfluous for hotplug calls,
however the checks for housekeeping CPUs is required to prevent
isolated CPUs getting online from becoming available and so will run on
early boot too (without any practical reason, only because the hotplug
handlers run there).

I might avoid it by playing with cpuhp_setup_state_nocalls perhaps, but
that feels even more hacky.

Otherwise, I can refactor the code to maintain a separate field
(isolated), restore the 'online' field and keep the functions for
online/offline and isolation as separate as possible, while considering
available =3D !isolated && online

This would make reading housekeeping masks superfluous on hotplug (and
boot) code, but again, it doesn't look simpler to me.

Am I missing some obviously elegant solution here?

Thanks,
Gabriele

