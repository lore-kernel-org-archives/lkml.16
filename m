Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6A1284B31
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295783; cv=none; b=oAnHBgyCcpPxtrBfdw4zQSqkhGBSxA0ldAFUm8II23F5U29DqsIJxdLZb+tIRQOmjXq+UehYNyzgzYgxA8GMZbaOvDpu+HQrr9pu40TAbYA8Y2s4aw+nosqKCL46DpreQCs6nuvBfMMR33RLslLG/gfUhMMvkYq8ZbplKk1w+0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295783; c=relaxed/simple;
	bh=Qb7nfN/pl22R9WgXVdFBEJofjAQSxhCEweKUx0sQK+0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l1pfgrxedYvK36P0oCKJ1kytQ1tOc0PU8PbuZZEjLnuufpU2XjzfdyMqoIjgxk/88mT+CrLGpOIxy9sT5HBnove4CN5wDCQOJBB0FvojcXBeCQs79hka0IPiZLI3C1HmNzlH2dJ7kF2DtxI+3CAa7Vv7shJL6embTmwlNQOIG8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HYhKSjMZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HYhKSjMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744295780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=impxG+rtr5+xwnAKb7IYp+OHvXVcrzOLS0hW8AHHzXk=;
	b=HYhKSjMZFoO5lk+LVayc4It/LRN1qc65OxPQcLa60pkCdx+6unVdvEu/IMVxCoHkwn77yk
	wXaSFgF6Z+x0WoKDrOQKnDM2DcJgeQ5RALukkgF35IkZLEy32+ho5IxHAIqKLIc5fYgkO6
	ADo2FuAfDBATJPO76sGBiudK35W5b8I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-OlP_v4XhOdSMeN27pqvyWw-1; Thu, 10 Apr 2025 10:36:17 -0400
X-MC-Unique: OlP_v4XhOdSMeN27pqvyWw-1
X-Mimecast-MFC-AGG-ID: OlP_v4XhOdSMeN27pqvyWw_1744295776
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so5355645e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744295776; x=1744900576;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=impxG+rtr5+xwnAKb7IYp+OHvXVcrzOLS0hW8AHHzXk=;
        b=AhOkDKz5hMAsflECc46bFZi2BLbCXS6D87RtJHVT5W/HAjC+VE0umOOblQy3qXFiqx
         mpFxTNSahiqrBYXVTWArE5wUSCGyEHC++Ihq5h5oxi1v8CaiNbvn4U5BtFA7UUMgUw1q
         kIoxU3f7ujeHPkL+JqKYuTYNSurNiEUO51MVO0FjiwNa2p0+eouXwemPpzYJUZ56FSkC
         7w3OSOB8DqMrHSThcFJoCsPNSaLcx2jV6Cjs36hVc3AxyhDTvcp+a1hU22Ai8S0DoQRN
         a1mTsQB40T5zXMDC5RgaBvTl4yFokwiMxEDVhefmr/6HsM8Ep2UaVqp/qBnT4c6DDJvr
         Z8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPLNfqsZvJZevR86ZQ8nDwMOwEtuJl/uK488JE7jQyDJqUCW5yOiT+bgZBQU9ncAZ22Vt9yysga3DUo+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNXWMMf6RixodKGVyLzQ7cdaX8WDQC4/MCvgNWcyodY/Zr68+C
	yNL4zefAJwnsZieOVprZwJz4ut65dyS2irKboHyVbv0/fCxherzEWhiwmGDVjRGBj+PoHYQFK7c
	ilHzcSHNOM7q5C+CMBP//X3b2HzavwBjYfkd3afEgkKPhDk/ocCuE822MrBSsvFPOdL2vb9CW
X-Gm-Gg: ASbGnct4FBWqiaHhSv52qh/Fl6Mo2ziJOQ7FQ/q835cSE10h0QxUvK8DQQGOqiYKlv/
	iebf5PHoqcwSN1L0Gx2X2y8iHfJSazPTkWtdkbJirkJCGNhJMg8wL4FU2mpdAZqJMr9948ha+Rb
	T/gv4NRBTRtlmIYujYEw/mqqEZws5ZC+ggyrIIGK+q832JL8PCectDm1+uvDhYMa0YoujRkP0cP
	SwKvzPpofnXyTx4SSpPkSeCE0YCGX050eXj4iPVHFRdNbcSrUzFX3c6pQjF5D9sqQETdpsAV4S1
	ihqwg3GYEL1n+MtcIVJ3PRpYHwUYzkHI/CvgPw==
X-Received: by 2002:a05:6000:250d:b0:391:3f4f:a169 with SMTP id ffacd0b85a97d-39d8f498f95mr2584051f8f.32.1744295776061;
        Thu, 10 Apr 2025 07:36:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCJOPgecAC5fxqxZj6KPgi3BRYvP6lBrjMMlF2qGlsLctnElncQpvruKRwXSIG3Qp9ckLMpQ==
X-Received: by 2002:a05:6000:250d:b0:391:3f4f:a169 with SMTP id ffacd0b85a97d-39d8f498f95mr2584028f8f.32.1744295775709;
        Thu, 10 Apr 2025 07:36:15 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206269c8sm59613665e9.16.2025.04.10.07.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:36:15 -0700 (PDT)
Message-ID: <2ecb20a38644c853d4f008e6e7f2215f9391e6e4.camel@redhat.com>
Subject: Re: [PATCH] fixup: [PATCH v12 2/3] sched: Move task_mm_cid_work to
 mm work_struct
From: Gabriele Monaco <gmonaco@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 peterz@infradead.org,  Ingo Molnar <mingo@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, paulmck@kernel.org, 
	shuah@kernel.org
Date: Thu, 10 Apr 2025 16:36:13 +0200
In-Reply-To: <82c5e8c3-09a5-499a-bae2-7f5c70725a29@efficios.com>
References: <e916f393-b18c-4641-ace7-cf23b7508e09@efficios.com>
	 <20250410125030.215239-1-gmonaco@redhat.com>
	 <82c5e8c3-09a5-499a-bae2-7f5c70725a29@efficios.com>
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



On Thu, 2025-04-10 at 10:04 -0400, Mathieu Desnoyers wrote:
> On 2025-04-10 08:50, Gabriele Monaco wrote:
> > Thanks both for the comments, I tried to implement what Mathieu
> > suggested. This patch applies directly on 2/3 but I'm sending it
> > here
> > first to get feedback.
> >=20
> > Essentially, I refactored a bit to avoid the need to add more
> > dependencies to rseq, the rseq_tick is now called task_tick_mm_cid
> > (as
> > before the series) and it does the two things you mentioned:
> > =C2=A0 * A) trigger the mm_cid recompaction
> > =C2=A0 * B) trigger an update of the task's rseq->mm_cid field at some
> > point
> > =C2=A0=C2=A0=C2=A0 after recompaction, so it can get a mm_cid value clo=
ser to 0.
> >=20
> > Now, A occurs only after the scan time elapsed, which means it
> > could
> > potentially run multiple times in case the work is not scheduled
> > before
> > the next tick, I'm not sure adding more checks to make sure it
> > happens once and only once really makes sense here.
>=20
> The scan is gated by two checks now:
>=20
> > +	if (t->mm && rtime > RSEQ_UNPREEMPTED_THRESHOLD) {
> > +		if (mm_cid_needs_scan(t->mm))
>=20
> And likewise for the periodic check for preemption:
>=20

Alright, I could add another flag here to prevent re-scheduling,

> > +	if (t->mm && rtime > RSEQ_UNPREEMPTED_THRESHOLD) {
> [...]
> > +		else if (time_after(jiffies, t->last_rseq_preempt
> > +
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > msecs_to_jiffies(MM_CID_SCAN_DELAY))) {
>=20
> Those second levels of time checks would prevent adding significant
> overhead on every tick after the threshold is reached.
>=20

But I'm not sure what to do here: in my understanding, this second
branch can only run once for task t and may run despite the previous
path was skipped (let's assume two long running threads share the mm,
the first thread schedules the work and it completes before the second
threads meets a qualifying tick).

> >=20
> > B is occurring after the work updates the last scan time, so we are
> > in a
> > condition where the runtime is above threshold but the (next) scan
> > time
> > did not expire yet.
> > I tried to account for multiple threads updating the mm_cid (not
> > necessarily the long running one, or in case more are long
> > running), for
> > this I'm tracking the last time we updated the mm_cid, if that
> > occurred
> > before the last mm_cid scan, we need to update (and preempt).
> >=20
> > Does this make sense to you?
>=20
> It makes sense. Note that it adds overhead to rseq_preempt() (a store
> to t->last_rseq_preempt), which is a fast path. I don't know if we
> should care.

Well, I'm trying to track the last time a reset occurred, that happens
rather in mm_cid_get, which doesn't look like a fast path to me.
I could then rename it to last_rseq_reset since it won't be related to
preemption.

>=20
> Also part of task_tick_mm_cid could be moved to a helper, e.g.:
>=20
> static
> void task_reset_mm_cid(struct rq *rq, struct task_struct *t)
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int old_cid =3D t->mm_ci=
d;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!t->mm_cid_active)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm_cid_snapshot_time(rq,=
 t->mm);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm_cid_put_lazy(t);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t->last_mm_cid =3D t->mm=
_cid =3D mm_cid_get(rq, t, t->mm);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (old_cid =3D=3D t->mm=
_cid)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rseq_preempt(t);
> }

Yeah good point

Thanks,
Gabriele

