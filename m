Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450F62512D6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744191943; cv=none; b=YK5fkOpeTC8kp85JVRUigR5W1AlZHiN2Hug9DgIsbxa7ydezlgvJIAyf5EWvTFEQYTMlV6VctNJkFWlhcDecfI0Nef5Vw8iSZ0Jpj+i9yD7b6V7MVJX0yoE2R8sbOcIKYLYWWSNqWwFcSFi0x1Xr2dXnV0TkGdyBjB13fQ/IE/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744191943; c=relaxed/simple;
	bh=mxlPo90HtB4sfM6i7FrlD+5M/txT/bjN9IXalakFByQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PUyl/7cOUqXNwxsKrFJEipUjAYBxTDcT9gcBTVi/4NS0OojKS00O39ZDyWP9LaUHfTGDKNA+1Jgtf791SHGwY81nrSTzufLLkihbar+xqiY+J7Pqwb7Rw7gCy7Xt0YFlY5LpZyWKblHUv720sCibWPwO5yPKw96WnPLOH0wLxd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EijrNYNw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EijrNYNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744191941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mxlPo90HtB4sfM6i7FrlD+5M/txT/bjN9IXalakFByQ=;
	b=EijrNYNw8K7IRAy5F//GAO7ZB/xT0ZaxlVViD0YzB0cmPk7Y4c36fmImnlSDSXq+nxhKnw
	bND+/v++VGOCxaAvU5832WCFCFwirTP9RDSGbm523mvocYvRcNVDWKseidcS3BTUaVx4qk
	K7paBUykgyUxAWPPfEhUBk83YC7MwL4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-z8-qwL-sPAevxcnBcL-gow-1; Wed, 09 Apr 2025 05:45:39 -0400
X-MC-Unique: z8-qwL-sPAevxcnBcL-gow-1
X-Mimecast-MFC-AGG-ID: z8-qwL-sPAevxcnBcL-gow_1744191938
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cec217977so41938245e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744191938; x=1744796738;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mxlPo90HtB4sfM6i7FrlD+5M/txT/bjN9IXalakFByQ=;
        b=sKviWxf5SmRBUYoW6ybcxqvvsbn2VuHhzLjGMtKYku1AY8mFMJypIyCbi5hARhkg9x
         4qSZrCpof+CAK0bQ3WuzUQxESoFr0h903EDhg8RrDN9QkBjWfM160r1l1I7ZMcXndSC3
         4CC96Rd7LCn+URf+Idpyr/T6y7bZCkjlISRBwYSZRYLvhxsKHHpP7XQ8B3Kh23SZ+axR
         me/1hIQ1iCNMlVXXisojmNo1gcZgpLNpAD8LibrG0eApJY+wn0ih/Bzvn+HAS3h0wl3s
         1gqtoHcLf42gY0dSOR6sWVX6G4PAtK2YIWXBYNN1lK92Rdqn3k5Ckpy0AKcbfz01mJPF
         s23g==
X-Gm-Message-State: AOJu0Yz67yqqD2zAZh0l6KZ+9MQ0xnXz3kEBXOw1hZOBmQkRj8ZUklkE
	KyGQKGIeG6MzwdSIIKqz/rtufOgDNKyjFj+R+YN2+oERbtwTaRA2rG1cLBVytJJYgysYlg4z3Qf
	ihFzawh0WwpiJOWlXPAIUtkBW+dZ12DC0UWmpCTdulEKhsPS3dHHs/o1mNCNiP+rmk1qdtSnqJe
	hUfD8RfAhSlV0mh6b8PWoxq4XCfntG7QJs+rXD4icd4w6zKPU=
X-Gm-Gg: ASbGnctNgwuJyfCAUhdYm/7tCXdqwkUHwelI0MLrsf5R1WSroQ8Vw4Vo6yRmeK1YqVm
	JmA+N1IoVIGfyQHf8SaNg36uRAIbkDbpccCKHuJkCyOcYaiICddyJS2lMbdCJlxZwT4THUrR2LD
	mCrOqZTn2XfWFLllMrW9V3bYcR4LJXEoOwQZAXEO/DiYqVIUiCcpHWwCxGJ/n3y8KE2PjyzRyVz
	YmdtXiC/K6NCTWHi9zvVM+pxJH7pQkyjwQEJLQhkw0ywHUDssqH3B5w6HMRAbREVY0pZAY/lOG5
	3/xrRI+Jhkiyrv6qkglEzdoZF24zBGPWMjehaJo=
X-Received: by 2002:a05:600c:5009:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-43f1fe16c8amr17501115e9.12.1744191938496;
        Wed, 09 Apr 2025 02:45:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXy3ExrtM+5HnBTv45Hio9rD/j2j1oGBy3iKDcc31KCzK7Iv6sdOUTHWX2rGlRX6KCFkiNAw==
X-Received: by 2002:a05:600c:5009:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-43f1fe16c8amr17500885e9.12.1744191938099;
        Wed, 09 Apr 2025 02:45:38 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c914csm14151605e9.39.2025.04.09.02.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:45:37 -0700 (PDT)
Message-ID: <fde0a08192f4e0d51d2e9e234d3612de6311cb79.camel@redhat.com>
Subject: Re: [PATCH v12 0/3] sched: Restructure task_mm_cid_work for
 predictability
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "Paul E. McKenney"
	 <paulmck@kernel.org>, Shuah Khan <shuah@kernel.org>
Date: Wed, 09 Apr 2025 11:45:35 +0200
In-Reply-To: <89bc1d11-c2bc-43d7-9a22-e159175706cc@efficios.com>
References: <20250311062849.72083-1-gmonaco@redhat.com>
	 <b0b6e10b8651ed59051e426c187ed64b785c4b8c.camel@redhat.com>
	 <89bc1d11-c2bc-43d7-9a22-e159175706cc@efficios.com>
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

On Wed, 2025-03-26 at 10:33 -0400, Mathieu Desnoyers wrote:
> On 2025-03-26 03:31, Gabriele Monaco wrote:
> > On Tue, 2025-03-11 at 07:28 +0100, Gabriele Monaco wrote:
> > > This patchset moves the task_mm_cid_work to a preemptible and
> > > migratable
> > > context. This reduces the impact of this work to the scheduling
> > > latency
> > > of real time tasks.
> > > The change makes the recurrence of the task a bit more
> > > predictable.
> > >=20
> >=20
> > The series was review and, in my opinion, is ready for inclusion.
> > Peter, Ingo, can we merge it?
>=20
> I agree. I've reviewed the entire series a few weeks ago and it
> looks good to me.
>=20

Gentle reminder. Peter, Ingo can we merge this?

Thanks,
Gabriele

