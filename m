Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECC524BD02
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201184; cv=none; b=iz8PsAgDsS324Wi+4yYRlLlbATJ+3f+cHXq+dUGEUP8Ju99IQbs8/tlpxEf7gS7iiZXINwwKLoH0zojWY/MOpRZQ138H+0FSwx27QSvS/oJC4OfN9M51dVVI/+T92t3d7CYR6oHsR1gd/M20cn9xEzcAX4BbvycX+1QHXxo9mHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201184; c=relaxed/simple;
	bh=cqCf4NDqz6PP8XjbskK0JUt0MZIFFfNj+ukOYMRG8+4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bh1IsxHXn18tpSgIE85ke1C1sstJDnOzuOKNSDQs8VvgAeHaunj50a560PoQaEJ5eUW7LZ3IVY6uDfDQt5MQPcZ1zcEruNLdeL7aUy9+TOhBC6CR851lmW49dBWVtWTAsYt2F3cFXV/Ws1uPom3TY5GfZ7pfzOjYLIROXov3O9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OH+vN7dk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OH+vN7dk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739201181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DyU0PD8obl5r6J7r3/RI/9K2JsBJV1aeauj24rGL0J4=;
	b=OH+vN7dksxsrP8pBfwV1qSYlNYxrHg6ioccHGfItGDR5dM6foXqSwa3No26VM+6WNPsQcW
	i7J/RD5t7iYzMinrzem4cDDUSU+cg0DYRIJQpu116W69mv8XlYYtF6muamPZuZOAnOPrZH
	fnwhqh0mHro6XgYGBQ4uqXd8COnr3e8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-i7qaML7aM5etQ-2hFaZ89g-1; Mon, 10 Feb 2025 10:26:19 -0500
X-MC-Unique: i7qaML7aM5etQ-2hFaZ89g-1
X-Mimecast-MFC-AGG-ID: i7qaML7aM5etQ-2hFaZ89g
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43626224274so26815195e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739201178; x=1739805978;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DyU0PD8obl5r6J7r3/RI/9K2JsBJV1aeauj24rGL0J4=;
        b=kgKrTwsosOo6F9AlibTC4ONhy1rBrpuI5JIR4/JDN4z96t9pG9HJyyjPlnybsJKWHO
         rfLlGkhlDsJ9wDIO6TQxcYFcFA1HWt3F7S31tvlPG2fXDd70cv+T8YKNJRDU2t6AUf39
         N9lqKXZtqDH2UA0lOzmwlg2Ttp8c9EkT3Vx85cLIACOKgEa8lm4ZM0ZeKOcbcB96Sn/6
         IAKchxHm6fEUUGtdNMFu/lnZv18DpQNn306mPZYCunkgd3m9YJQxg1WJGaTZngJ23FtO
         xCI6wuSyOBayAuLeUOHJ0y8dHPE6HIW+amdz8Y/HbgfNEAFbkijQBiUfA6+J7eEiy35S
         s82Q==
X-Forwarded-Encrypted: i=1; AJvYcCXR7Go16zJvcmm/rCLN0kJLlb2rrNeJvYgGri+RqBKbRShbhvuXmt+v+mqFi4evKW59lULl4MjNcdkJe10=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4m8XPkWYh9EEwrBsth35yaoo+oIYivLE6OZ3dL9MY66fkaexU
	xEjH8evludUKsgMUQrtvoSyUYtDEck79f/NSaGZpF9sApkw5yElp4RTSKAZL/cS0TJMn0bjeKA3
	uKSwV98b3V7mDNn7E3tkaaCdj1maiSI2iVEtdi10a5OFvl6IHSBBwKr4/HwRaVw==
X-Gm-Gg: ASbGncsb0dnMP3NFjzW2Pk+PxbfXQPXiTL0K+6xfN+eTSXjmVo8q9jUfPLWexUeQyjX
	DsT++tFg8nrQevs7y368hBDiKewcqivkrdRbrKwYfZxRMynxkrXV8Lc/nX/CvGeVu3YjV7alz40
	Z2THEF9aTAsU/oU/JVqFCQDaK0GiEwpe/VFbB1i8dbN7OS5LQ/Q0vDUEu67VOE83ay8IHgrodPW
	EzIdbcgepnco8YLMVtA2gM5ifcrDvZ80oy/yKLo8J5dxkPC7h0q8U7BdH/PBsCWLJnGv9okfGI0
	DXUY+CDioHStx6uO26PBn/LoEe630bQ=
X-Received: by 2002:a05:600c:4e93:b0:439:4036:e925 with SMTP id 5b1f17b1804b1-4394036eb16mr63685385e9.11.1739201178637;
        Mon, 10 Feb 2025 07:26:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENw/oXxAGB+H0r+IgDEAwCWcxHZDYtwcMjowLVmO3YEF3rnAieF6nRyMgKVMNUn35trPu9UQ==
X-Received: by 2002:a05:600c:4e93:b0:439:4036:e925 with SMTP id 5b1f17b1804b1-4394036eb16mr63685105e9.11.1739201178195;
        Mon, 10 Feb 2025 07:26:18 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd8448sm150058285e9.38.2025.02.10.07.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:26:17 -0800 (PST)
Message-ID: <2c2ee65283893a433ac4488f3d048b0f7454be24.camel@redhat.com>
Subject: Re: [PATCH v5 3/3] rseq/selftests: Add test for mm_cid compaction
From: Gabriele Monaco <gmonaco@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney"
	 <paulmck@kernel.org>, Shuah Khan <shuah@kernel.org>, Ingo Molnar
	 <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Date: Mon, 10 Feb 2025 16:25:59 +0100
In-Reply-To: <da68dc94-9aa8-4ee1-b0f9-e28eb5c7da56@efficios.com>
References: <20250210075703.79125-1-gmonaco@redhat.com>
	 <20250210075703.79125-4-gmonaco@redhat.com>
	 <da68dc94-9aa8-4ee1-b0f9-e28eb5c7da56@efficios.com>
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



On Mon, 2025-02-10 at 15:53 +0100, Mathieu Desnoyers wrote:
> On 2025-02-10 08:57, Gabriele Monaco wrote:
> > A task in the kernel (task_mm_cid_work) runs somewhat periodically
> > to
> > compact the mm_cid for each process. Add a test to validate that it
> > runs
> > correctly and timely.
> >=20
> > The test spawns 1 thread pinned to each CPU, then each thread,
> > including
> > the main one, runs in short bursts for some time. During this
> > period, the
> > mm_cids should be spanning all numbers between 0 and nproc.
> >=20
> > At the end of this phase, a thread with high enough mm_cid (>=3D
> > nproc/2)
> > is selected to be the new leader, all other threads terminate.
> >=20
> > After some time, the only running thread should see 0 as mm_cid, if
> > that
> > doesn't happen, the compaction mechanism didn't work and the test
> > fails.
> >=20
> > The test never fails if only 1 core is available, in which case, we
> > cannot test anything as the only available mm_cid is 0.
> >=20
> > To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>=20
> Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>=20
> tiny nit below:
>=20
> > +		usleep(RUNNER_PERIOD);
> > +	curr_mm_cid =3D rseq_current_mm_cid();
> > +	/*
> > +	 * We select one thread with high enough mm_cid to be the
> > new leader
>=20
> Missing punctuation here (...new leader.=C2=A0 All other...)

I guess I'm allergic to those ;) Thanks for finding it!
I wonder if checkpatch should be able to catch this kind of problem,
but that's for another day.

Do I need to send a v6 for this or just reply here with the fixed
patch?

Thanks,
Gabriele

