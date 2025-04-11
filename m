Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262312980A7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363414; cv=none; b=kYo/KfzhBkspQfklizm99NHxXXh5y4EFda+9t/aXz7l6r3HsdbzYDjMoHYkmIkAm7zeUemZRbSUEMf2KEU8cCzIiUzya1GpYLC74YINw+KQfTBtzuqTiNs9YvbCJpLYNXFDQuJmcLrL1yFJ9i9I28TTYhXiFZWzh57FI8qTgQ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363414; c=relaxed/simple;
	bh=oY/1YxDDdX/rcw8i7LSqnhGYad6Z/VO6tlPl57guoJU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HuP078J1bxHIllN72xHQVQvyq4QCkncm1uPNezWL+GTzzuIPJrdzoQqeB2ZwxjYD/RIdgRBfFYkd43KiPf4GjERzWpIgyVH/OqOjW5uCwoyzGuSAST/UurJZdlZ1nDhuevT0MBl08Vdd9mppFOPc4I2aG+WP8YxWvt1L7+jt8Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gkl0uNd/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gkl0uNd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744363411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=teC0q40Smb9/sHs5ms88/N+VZamOe+tf/CzSvYEeiXA=;
	b=Gkl0uNd//G2y+CgcyEcLXF9h2zxgBRz6KjKbzUa1gHBC1lAQ/4uSC/fT5mVk8nHqnlDV6d
	XBPoTdu+FPrlp7vLWnsmqJoEF3+7F7OAsU50x/AMdhAZh1F+ecVnGsAM4qS2eyz4gctn7d
	bLO0f6RkKHDpUpxHi7tpjmIt4oHNvsA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-7-2WJt3kM3KZsu9t9I97sQ-1; Fri, 11 Apr 2025 05:23:29 -0400
X-MC-Unique: 7-2WJt3kM3KZsu9t9I97sQ-1
X-Mimecast-MFC-AGG-ID: 7-2WJt3kM3KZsu9t9I97sQ_1744363408
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39131851046so694466f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744363408; x=1744968208;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=teC0q40Smb9/sHs5ms88/N+VZamOe+tf/CzSvYEeiXA=;
        b=emW2GuusV5+F5Ci55D2YWsSOE74Nj85AZqjYotf/9roDOs96Ft53yJaMT/uROO4Wp5
         9/j6hscBFvlhPdWIXVywVn7Pm0HP6K08GUGig6kING4Nmeq0tItcyZTLZGnmkXpADcYj
         f3DW1X9qSRa/jZe0WrhItD1EOfz7mWkpkkQrcLhg2PISzfDoSGdjw5/SnW1e1wIQOXZN
         OnVUgayMpdRX1Ytxa479xiwppIDn34IydUkFJHJFrYJwA3D1+EcWlPFhW+f730kpQURY
         kVcxFoKQnpBwNteoC0ZLPzetvAG7Sbrs/krUDy1A8iydZcq9blC8y/jUouIFi7/zbLIj
         Ddsw==
X-Forwarded-Encrypted: i=1; AJvYcCUy2l0D0y/WsYTLmpko0JfRvvoFTuPuTJVldTHHhQ40MfUTBW5SzjeIPoDnOfUqiDlL0lwZ5oz21CyPd/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS2xuebgFrgxWW3txHLa0rY/deHhVJLlMby76so5E1+aZ+TAs/
	QrSRXUwfBS/InaQqLuxQLtNkd0abIatq/doWmMsr2Nf5dAdSF623SQMnBF7P58yOUB0QjUvAuLA
	8FqOdZZiw9WoRZHZwjB5SmiQu5/gwZCs5inFWWSn/p8uum1lSz8PtWbusfOrbCQ==
X-Gm-Gg: ASbGncu3IcKFil7P67wECQyCpCw6pU24c8h+mPYyzzwqyyKf6fWXzQFGrbQfEszweS9
	Whp6a/N8FljIhiYucoRacBJ44OQoNHLQwvHQIMhvBUvvHLg42cau3ESB2XEwHF4rrqJ6jFSpkKY
	3IjUrccCh5YEUihCfpT8idr12DWA1e3wCx+MYJFy+XEmKeSf5f6RWPf4Nqial9KDH9d+DPFFrlB
	mm+h0MBpJQJ6HPoO8wEnVSgAHvezCSGADC0poDiOnXOhoD02jonaoz7mn+Tjrhr+5BIcYVjedVu
	iWdGsxvbvmcG85uWbEY4H87kmMz2o4Ya82WxlA==
X-Received: by 2002:a5d:64c2:0:b0:39c:1257:dbaa with SMTP id ffacd0b85a97d-39eaaed2bf4mr1448088f8f.58.1744363408062;
        Fri, 11 Apr 2025 02:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFneGmB5fJfuY1chs3kxwXYmp6QcLLE3ridOAtRmVdVv1WXcFqESDfHiQrxjkVyOXYb9zOWLw==
X-Received: by 2002:a5d:64c2:0:b0:39c:1257:dbaa with SMTP id ffacd0b85a97d-39eaaed2bf4mr1448068f8f.58.1744363407737;
        Fri, 11 Apr 2025 02:23:27 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cceesm1422858f8f.73.2025.04.11.02.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 02:23:27 -0700 (PDT)
Message-ID: <4b4c9ac8411e6398b7d4487541d978f908785d27.camel@redhat.com>
Subject: Re: [PATCH v2 04/22] verification/dot2k: Make it possible to invoke
 dot2k without installation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: john.ogness@linutronix.de, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 11 Apr 2025 11:23:25 +0200
In-Reply-To: <caa6a7668f958c68fc7b8a40256e3edf3f11ae99.1744355018.git.namcao@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
	 <caa6a7668f958c68fc7b8a40256e3edf3f11ae99.1744355018.git.namcao@linutronix.de>
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



On Fri, 2025-04-11 at 09:37 +0200, Nam Cao wrote:
> Without installation, dot2k doesn't work:
>=20
> namcao@yellow:~/linux/tools/verification$ python3 ./dot2/dot2k
> Traceback (most recent call last):
> =C2=A0 File "/home/namcao/linux/tools/verification/./dot2/dot2k", line 12=
,
> in <module>
> =C2=A0=C2=A0=C2=A0 from dot2.dot2k import dot2k
> ModuleNotFoundError: No module named 'dot2'
>=20
> Installing dot2k to the system is not always desirable. Sometimes it
> is not
> even possible (e.g. no root permission).
>=20
> Restructure the files to make it work without installing.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Mmh, the workflow

pushd tools/verification
...
popd

has always been working in my case, but probably that's because I have
PYTHONPATH=3D"." , not sure how much of a good practice that is.

Anyway, since you're already moving things around in 9/22
("verification/dot2k: Prepare the frontend for LTL inclusion"), does it
make sense to keep the commits separated? Or you could directly move to
rvgen here and just add the ltl related changes in the later commit.

Also, after your changes on my system, I can run the script from the
kernel directory too, which is much better than having to cd to
tools/verification .
If that's something portable, I'd change the default definition of
monitor_templates_dir and allow the user to run the script only from
the kernel root.

What do you think?

Thanks,
Gabriele

> ---
> =C2=A0tools/verification/dot2/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +++---
> =C2=A0tools/verification/dot2/{ =3D> dot2}/automata.py | 0
> =C2=A0tools/verification/dot2/{ =3D> dot2}/dot2c.py=C2=A0=C2=A0=C2=A0 | 0
> =C2=A0tools/verification/dot2/{ =3D> dot2}/dot2k.py=C2=A0=C2=A0=C2=A0 | 0
> =C2=A04 files changed, 3 insertions(+), 3 deletions(-)
> =C2=A0rename tools/verification/dot2/{ =3D> dot2}/automata.py (100%)
> =C2=A0rename tools/verification/dot2/{ =3D> dot2}/dot2c.py (100%)
> =C2=A0rename tools/verification/dot2/{ =3D> dot2}/dot2k.py (100%)
>=20
> diff --git a/tools/verification/dot2/Makefile
> b/tools/verification/dot2/Makefile
> index 021beb07a521..7a2ec30014b0 100644
> --- a/tools/verification/dot2/Makefile
> +++ b/tools/verification/dot2/Makefile
> @@ -16,10 +16,10 @@ clean:
> =C2=A0
> =C2=A0.PHONY: install
> =C2=A0install:
> -	$(INSTALL) automata.py -D -m 644
> $(DESTDIR)$(PYLIB)/dot2/automata.py
> -	$(INSTALL) dot2c.py -D -m 644
> $(DESTDIR)$(PYLIB)/dot2/dot2c.py
> +	$(INSTALL) dot2/automata.py -D -m 644
> $(DESTDIR)$(PYLIB)/dot2/automata.py
> +	$(INSTALL) dot2/dot2c.py -D -m 644
> $(DESTDIR)$(PYLIB)/dot2/dot2c.py
> =C2=A0	$(INSTALL) dot2c -D -m 755 $(DESTDIR)$(bindir)/
> -	$(INSTALL) dot2k.py -D -m 644
> $(DESTDIR)$(PYLIB)/dot2/dot2k.py
> +	$(INSTALL) dot2/dot2k.py -D -m 644
> $(DESTDIR)$(PYLIB)/dot2/dot2k.py
> =C2=A0	$(INSTALL) dot2k -D -m 755 $(DESTDIR)$(bindir)/
> =C2=A0
> =C2=A0	mkdir -p ${miscdir}/
> diff --git a/tools/verification/dot2/automata.py
> b/tools/verification/dot2/dot2/automata.py
> similarity index 100%
> rename from tools/verification/dot2/automata.py
> rename to tools/verification/dot2/dot2/automata.py
> diff --git a/tools/verification/dot2/dot2c.py
> b/tools/verification/dot2/dot2/dot2c.py
> similarity index 100%
> rename from tools/verification/dot2/dot2c.py
> rename to tools/verification/dot2/dot2/dot2c.py
> diff --git a/tools/verification/dot2/dot2k.py
> b/tools/verification/dot2/dot2/dot2k.py
> similarity index 100%
> rename from tools/verification/dot2/dot2k.py
> rename to tools/verification/dot2/dot2/dot2k.py

