Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94611F5827
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744383389; cv=none; b=FOjKyHXbQN3ZiRQkD0O4rpZPspGe5g0f28RMeqYVUNWXHSusXAcDk0877duLi48AOVXXfRNeXDV4MkSAEFxkprPHpxLnGd+3XMv9dyFXpMaxpCtD1Uhu00ttBVXrsgervS3O8hHmLQwkbU5DXHXvD2uEL9YneL7d4rGbyibI/eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744383389; c=relaxed/simple;
	bh=JIC46/CCVoXoAUAHZo9VZ5Him4zhxKWI3ZakBGYpG3o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pgf6wsenP2GD9kTrGYTbU8UThGRDCdwzpL1/0zAE6sjx+dq6bv3TE0mJAQ9oeH0ssKLpMpXrhHNp+1wnbmkyzEfoFaJMBjGUWYW7tyJbDMHtE42ApfqimTp1WBvdKpRd7l28jfZLuFtQ46P+HvJ4+fe8c8l8GPTS+CNGjVF019M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AwGU72Sk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AwGU72Sk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744383386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JIC46/CCVoXoAUAHZo9VZ5Him4zhxKWI3ZakBGYpG3o=;
	b=AwGU72Sk7h2GcRmMCAEdnhcOCYMgXgMyyOtOUP5brfXDJdFq1lgvyt88DIBuAVJDnGe4Te
	Ijfm5eoxC8ZPNajXIOs9+yq6IU+MLbFEoC1B1QuJ+B/j1VW/+QLI7sBuVllwgz8WwHz9C0
	tPmRXtZoyVLH7RN0f6lIvL+Hu1HC0Qg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-Se7t1h60OUC4mClIZbKzMA-1; Fri, 11 Apr 2025 10:56:25 -0400
X-MC-Unique: Se7t1h60OUC4mClIZbKzMA-1
X-Mimecast-MFC-AGG-ID: Se7t1h60OUC4mClIZbKzMA_1744383384
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3912e4e2033so1003944f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744383384; x=1744988184;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIC46/CCVoXoAUAHZo9VZ5Him4zhxKWI3ZakBGYpG3o=;
        b=rd+J9CPBgtQm1oHt8zJzC1UQ/qMFjQxgnzMS8Do6lUho8GHqV2Dlv/QM2hyiHMMsFa
         nuDeQNsRiuSZ+oyAoHnIhq6vPyfyvxg2OTslcD6h5HgUVlTPVFIPsGDe+WCA5oHHkuDd
         6AU+UO//6hCvw1jAAIIBZO3lAa104cBWxPNoGIGOKDxOQxA8tHJyvv50zpE9NoSq4teb
         cLW705RyeKzKzR9QwaVCmHIqEpd7JugokbiTEjsjPP9sOCr+hNSFDj1RUTBEoZhmeWbX
         BhPH296M/K+0qlt4SGjsSA5ZoviOswx86YHXZC1p1WkVsPlB79pqxI168kbV4QlBVurg
         rrZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJC7mR+kU1Yl9a0CD8pESu+QFwBGv5WCGu8bHY0tobXbgH/plREF3tiytTfRjO8jAGzsZbkmbFXYHi5/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwfKjNDZU5jkutU+q0NVnVMXb7MAV3qX+cjNPuzkTc2GqDztH7
	wbA9Kjs57IQU6oKPiKM+c95oskMUXswrFZZkJPapni4nLMD9ZF8nIg7mPzf+3oLicbuXln1DxQg
	q/zeiPsyxSduRqFLQSXroJ4X+IdeAKtsryZxwTiC1fpQixnlUVf2cxnYpIGF+mg==
X-Gm-Gg: ASbGncv2qmlCSt0/uNv88c4+q0hYRpcObQerPTZCPk92ftwLJEorxHoRh6D9EHFyVkf
	M+xrMJ/6lbrr8vi2gSY7n765DfrsRlswtziocS7Oev+SVtM69DOh0rHNovfR5TXD3PuS7SGn21h
	Q0Jdc/eLqrjeNWd6rAYzmbDCpzRs68mNnyIuwXMWpDqoEyHw5GTuv0EYrGo+m0r8TOQZiPYKvxB
	Rccl0f33x9jwE7zzzh0z5yJhJuFydltvX/Y9OU2b5O8QaWNP9GWciLmEWzpsg30KTabBsKT9Fkg
	z4pclcPpv1rZAL7ROesQCjy4EXHUh74eprsKOw==
X-Received: by 2002:a5d:5c84:0:b0:39c:cc7:3db5 with SMTP id ffacd0b85a97d-39eaaebdaa4mr2555921f8f.40.1744383384272;
        Fri, 11 Apr 2025 07:56:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYsA68vH2hx6Ljcs9ir5v8cVte9RwOn04TKjeTjgdGhjTcXCciu0NfM5jpg0NgAy3C+m9NlA==
X-Received: by 2002:a5d:5c84:0:b0:39c:cc7:3db5 with SMTP id ffacd0b85a97d-39eaaebdaa4mr2555895f8f.40.1744383383885;
        Fri, 11 Apr 2025 07:56:23 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cc7esm2218630f8f.77.2025.04.11.07.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 07:56:23 -0700 (PDT)
Message-ID: <938c87acb9b4533f66e54b0ffc2f2fda6dde95a0.camel@redhat.com>
Subject: Re: [PATCH v2 04/22] verification/dot2k: Make it possible to invoke
 dot2k without installation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: john.ogness@linutronix.de, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 11 Apr 2025 16:56:21 +0200
In-Reply-To: <20250411140433.QiY-1pL2@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
	 <caa6a7668f958c68fc7b8a40256e3edf3f11ae99.1744355018.git.namcao@linutronix.de>
	 <4b4c9ac8411e6398b7d4487541d978f908785d27.camel@redhat.com>
	 <20250411140433.QiY-1pL2@linutronix.de>
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



On Fri, 2025-04-11 at 16:04 +0200, Nam Cao wrote:
> On Fri, Apr 11, 2025 at 11:23:25AM +0200, Gabriele Monaco wrote:
> > On Fri, 2025-04-11 at 09:37 +0200, Nam Cao wrote:
> > > Without installation, dot2k doesn't work:
> > >=20
> > > namcao@yellow:~/linux/tools/verification$ python3 ./dot2/dot2k
> > > Traceback (most recent call last):
> > > =C2=A0 File "/home/namcao/linux/tools/verification/./dot2/dot2k", lin=
e
> > > 12,
> > > in <module>
> > > =C2=A0=C2=A0=C2=A0 from dot2.dot2k import dot2k
> > > ModuleNotFoundError: No module named 'dot2'
> > >=20
> > > Installing dot2k to the system is not always desirable. Sometimes
> > > it
> > > is not
> > > even possible (e.g. no root permission).
> > >=20
> > > Restructure the files to make it work without installing.
> > >=20
> > > Signed-off-by: Nam Cao <namcao@linutronix.de>
> >=20
> > Mmh, the workflow
> >=20
> > pushd tools/verification
> > ...
> > popd
> >=20
> >=20
> > has always been working in my case, but probably that's because I
> > have
> > PYTHONPATH=3D"." , not sure how much of a good practice that is.
>=20
> Ahh, PYTHONPATH is the trick. But that shouldn't be required. The
> scripts
> should work out of the box without any environment setup.
>=20
> > Anyway, since you're already moving things around in 9/22
> > ("verification/dot2k: Prepare the frontend for LTL inclusion"),
> > does it
> > make sense to keep the commits separated? Or you could directly
> > move to
> > rvgen here and just add the ltl related changes in the later
> > commit.
>=20
> Yes, it makes sense to move them to rvgen here.
>=20
> > Also, after your changes on my system, I can run the script from
> > the
> > kernel directory too, which is much better than having to cd to
> > tools/verification .
> > If that's something portable, I'd change the default definition of
> > monitor_templates_dir and allow the user to run the script only
> > from
> > the kernel root.
> >=20
> > What do you think?
>=20
> I actually prefer running the script from tools/verification. We can
> allow
> user to run from anywhere, with something like:
>=20
> =C2=A0class dot2k(Monitor, Dot2c):
> -=C2=A0=C2=A0=C2=A0 monitor_templates_dir =3D "rvgen/templates/dot2k"
> +=C2=A0=C2=A0=C2=A0 monitor_templates_dir =3D os.path.join(os.path.dirnam=
e(__file__),
> "../../rvgen/templates/dot2k")

That looks like a good option!

Thanks,
Gabriele

