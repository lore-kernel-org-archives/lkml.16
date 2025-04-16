Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3111519B4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809686; cv=none; b=rE+7kLK4/fPpv+MZzgvwjlgfEQnmMwXYVmI2KA31VfV/mCRH+XGWUInfhXADFU3rNZQX1lSQc0Ed6+hBUdC82ObD8noAySkvFicxo1bdcgWVOpA6+VtNeYxPAxfJz33zeMcwuqxqaG6W7n/CG00m2HBNQccf+9JJtV1BbWNgcc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809686; c=relaxed/simple;
	bh=KTRGDbhABQSHgHM++m4dyXpA/B0TTe/La7E8db89DVM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p13OWWKboy3z5XHVOmbCcwFMGWJARTN1r540/3FS4enFHgRWl2sayUymQVSyu/412i4KM5UhMGZQCF+ZEdtFyWCftNbrM1UVv0LfwcCVICfqUaPb579LPrAZ1evFzTb6Gr4hG9PzCXQjtd+ocqMfWzpChT/ulSOxONIwivi+EkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IoeIyay7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IoeIyay7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744809682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iLcmeEHhQu4t5/fOTfsl0eEoFzLCIFF8jRXHmES78Sc=;
	b=IoeIyay7fNZqh03W+ZFt0HcqC2QysXVwrrLj6+iPcZuBGZK7ejirLcQg0LR26504zqGAk+
	4MzTMi0IkFvZz3AGDKmUfc1uVjsXBZ0Gs0I20QP7LDAdFgH6VnNcLQ6W7tRzu7b99zCKkA
	j9FHiWvhNjwWkZHdnW27XH78xAkyXG0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-NoG5T_JMNnq19BVZ1rVYEA-1; Wed, 16 Apr 2025 09:21:21 -0400
X-MC-Unique: NoG5T_JMNnq19BVZ1rVYEA-1
X-Mimecast-MFC-AGG-ID: NoG5T_JMNnq19BVZ1rVYEA_1744809680
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so48081705e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744809680; x=1745414480;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iLcmeEHhQu4t5/fOTfsl0eEoFzLCIFF8jRXHmES78Sc=;
        b=ckT3B8ezMoceaDpmo8vAE1Kb6oDoLDrtQXjg2VMrq3UzqFGO8SKOYDflWelW+GVFqU
         p0JGYoJX4QDbfCQuf4RPY3YHYxNBTs+tFx+O13M9QDWcFzI9L3JFg1GpAXm3GVYngbSK
         JEJvPa+2ctZpzylvKUYjApSsC0doNm4lS3w6l/Ny6vnA3JeHqRIFBLcgXZWmB0lkxzvV
         e6Zys2z921HKyWe4g+oZOdS8HznoAj7oQmFa84M+2pdEpwtBU3opsaHWysaPvwW3OCGw
         8NrZhqAouyeYnCNDedrdmsmHsGnQhE1Fb+aAlvqmoiycfxqvVfuK+htNWedZyky4IXsb
         kp+A==
X-Forwarded-Encrypted: i=1; AJvYcCXs4bQ/hNR08NX8gv8V8e21wmdxvpF6mXFTdL5fTA0pDZl0xA2nKBKiaJpYDBVBG7cb//5Brumah1gpXJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLtvdqB5P6ASP0i/R4b39XYh/zxBWhB+84orj4Wmy3Kgss6/A/
	ULu68XuERbeblGCvUD62Du89MY6E+iYY06XW7w3ZOyjrVBAIoGpTWC4aCOltNcmpRBgUJwDPbRL
	LAzg0m+zsESJwAqAeNLPfTEvogPVDcT6ovXSTdjXN1hWbPwLg+2PTsEhbZWyYh9hF5QH+N4jG
X-Gm-Gg: ASbGncvtUzj51tARJ6y1U9knFw8VLoMHBSEPHNLkWKSBwJvG+TvvSZO4cvrF2X6L64J
	iPn1CMkC5sIReDkl3iDoZMOm4uqcFyAzdT4DPW//zfW3wNa/dNVBgiIVikTOtKDTvOsIINyUVYj
	oVLnmhDKxhXSOylR4HU/qcbyoiGNAiLzPRZlZLvzQIFnXuagUB8EYoJ18afnSle3QGZgNK6B4sU
	4hTyS4DLgPF7WrzAznamWa6UTKCck7B+yC15O7bvYujjd6b6b152nVxc/eTsnQvFQXxE6Wz5K4I
	SklUuwOuiFtY6sOjeqAin1bWzNHSGACzzVSRxY4=
X-Received: by 2002:a05:600c:5027:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-4405d63755emr21863045e9.17.1744809679901;
        Wed, 16 Apr 2025 06:21:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7Djq9SWrrpiO8bXOqEu/XPy2I2jw2h75iPK6dKs1f1vXPaVg8R8MiEtrFZ22y0ex9c50Mbg==
X-Received: by 2002:a05:600c:5027:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-4405d63755emr21862775e9.17.1744809679510;
        Wed, 16 Apr 2025 06:21:19 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b5adb6fsm21254595e9.40.2025.04.16.06.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:21:19 -0700 (PDT)
Message-ID: <e766f1fa039da6bc560ce5290ec0d5ce5ba24fc5.camel@redhat.com>
Subject: Re: [PATCH v3 09/22] verification/dot2k: Prepare the frontend for
 LTL inclusion
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de
Date: Wed, 16 Apr 2025 15:21:17 +0200
In-Reply-To: <af31461eae544f9aea6fb3e1c16a0bd24574ef56.1744785335.git.namcao@linutronix.de>
References: <cover.1744785335.git.namcao@linutronix.de>
	 <af31461eae544f9aea6fb3e1c16a0bd24574ef56.1744785335.git.namcao@linutronix.de>
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



On Wed, 2025-04-16 at 08:51 +0200, Nam Cao wrote:
> The dot2k tool has some code that can be reused for linear temporal
> logic
> monitor. Prepare its frontend for LTL inclusion:
>=20
> =C2=A0 1. Rename to be generic: rvgen
>=20
> =C2=A0 2. Replace the parameter --dot with 2 parameters:
> =C2=A0=C2=A0=C2=A0=C2=A0 --class: to specific the monitor class, can be '=
da' or 'ltl'
> =C2=A0=C2=A0=C2=A0=C2=A0 --spec: the monitor specification file, .dot fil=
e for DA, and
> .ltl
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
file for LTL
>=20
> The old command:
>=20
> =C2=A0 python3 dot2/dot2k monitor -d wip.dot -t per_cpu
>=20
> is equivalent to the new commands:
>=20
> =C2=A0 python3 dot2/dot2k monitor -c da -s wip.dot -t per_cpu

Some more things changed here:

  python3 rvgen monitor -c da -s wip.dot -t per_cpu

For the rest, all changes in the scripts (11-12/22) look good to me.

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

Thanks,
Gabriele

>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> =C2=A0tools/verification/{dot2 =3D> rvgen}/Makefile=C2=A0=C2=A0=C2=A0 | 1=
0 +++++-----
> =C2=A0.../{dot2/dot2k =3D> rvgen/__main__.py}=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++++++++++---
> --
> =C2=A0tools/verification/{dot2 =3D> rvgen}/dot2c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0.../{dot2 =3D> rvgen}/dot2k_templates/Kconfig=C2=A0=C2=A0=C2=A0 |=
=C2=A0 0
> =C2=A0.../dot2k_templates/Kconfig_container=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 0
> =C2=A0.../{dot2 =3D> rvgen}/dot2k_templates/main.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 0
> =C2=A0.../dot2k_templates/main_container.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 0
> =C2=A0.../dot2k_templates/main_container.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 0
> =C2=A0.../{dot2 =3D> rvgen}/dot2k_templates/trace.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 0
> =C2=A0.../{dot2 =3D> rvgen/rvgen}/automata.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 0
> =C2=A0.../{dot2 =3D> rvgen/rvgen}/dot2c.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0.../{dot2 =3D> rvgen/rvgen}/dot2k.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +++++-----
> =C2=A012 files changed, 25 insertions(+), 17 deletions(-)
> =C2=A0rename tools/verification/{dot2 =3D> rvgen}/Makefile (55%)
> =C2=A0rename tools/verification/{dot2/dot2k =3D> rvgen/__main__.py} (72%)
> =C2=A0rename tools/verification/{dot2 =3D> rvgen}/dot2c (97%)
> =C2=A0rename tools/verification/{dot2 =3D> rvgen}/dot2k_templates/Kconfig
> (100%)
> =C2=A0rename tools/verification/{dot2 =3D>
> rvgen}/dot2k_templates/Kconfig_container (100%)
> =C2=A0rename tools/verification/{dot2 =3D> rvgen}/dot2k_templates/main.c
> (100%)
> =C2=A0rename tools/verification/{dot2 =3D>
> rvgen}/dot2k_templates/main_container.c (100%)
> =C2=A0rename tools/verification/{dot2 =3D>
> rvgen}/dot2k_templates/main_container.h (100%)
> =C2=A0rename tools/verification/{dot2 =3D> rvgen}/dot2k_templates/trace.h
> (100%)
> =C2=A0rename tools/verification/{dot2 =3D> rvgen/rvgen}/automata.py (100%=
)
> =C2=A0rename tools/verification/{dot2 =3D> rvgen/rvgen}/dot2c.py (99%)
> =C2=A0rename tools/verification/{dot2 =3D> rvgen/rvgen}/dot2k.py (98%)
>=20
> diff --git a/tools/verification/dot2/Makefile
> b/tools/verification/rvgen/Makefile
> similarity index 55%
> rename from tools/verification/dot2/Makefile
> rename to tools/verification/rvgen/Makefile
> index 021beb07a521..cea9c21c3bce 100644
> --- a/tools/verification/dot2/Makefile
> +++ b/tools/verification/rvgen/Makefile
> @@ -3,7 +3,7 @@ INSTALL=3Dinstall
> =C2=A0prefix=C2=A0 ?=3D /usr
> =C2=A0bindir=C2=A0 ?=3D $(prefix)/bin
> =C2=A0mandir=C2=A0 ?=3D $(prefix)/share/man
> -miscdir ?=3D $(prefix)/share/dot2
> +miscdir ?=3D $(prefix)/share/rvgen
> =C2=A0srcdir=C2=A0 ?=3D $(prefix)/src
> =C2=A0
> =C2=A0PYLIB=C2=A0 ?=3D $(shell python3 -c 'import sysconfig;=C2=A0 print
> (sysconfig.get_path("purelib"))')
> @@ -16,11 +16,11 @@ clean:
> =C2=A0
> =C2=A0.PHONY: install
> =C2=A0install:
> -	$(INSTALL) automata.py -D -m 644
> $(DESTDIR)$(PYLIB)/dot2/automata.py
> -	$(INSTALL) dot2c.py -D -m 644
> $(DESTDIR)$(PYLIB)/dot2/dot2c.py
> +	$(INSTALL) rvgen/automata.py -D -m 644
> $(DESTDIR)$(PYLIB)/rvgen/automata.py
> +	$(INSTALL) rvgen/dot2c.py -D -m 644
> $(DESTDIR)$(PYLIB)/rvgen/dot2c.py
> =C2=A0	$(INSTALL) dot2c -D -m 755 $(DESTDIR)$(bindir)/
> -	$(INSTALL) dot2k.py -D -m 644
> $(DESTDIR)$(PYLIB)/dot2/dot2k.py
> -	$(INSTALL) dot2k -D -m 755 $(DESTDIR)$(bindir)/
> +	$(INSTALL) rvgen/dot2k.py -D -m 644
> $(DESTDIR)$(PYLIB)/rvgen/dot2k.py
> +	$(INSTALL) __main__.py -D -m 755 $(DESTDIR)$(bindir)/rvgen
> =C2=A0
> =C2=A0	mkdir -p ${miscdir}/
> =C2=A0	cp -rp dot2k_templates $(DESTDIR)$(miscdir)/
> diff --git a/tools/verification/dot2/dot2k
> b/tools/verification/rvgen/__main__.py
> similarity index 72%
> rename from tools/verification/dot2/dot2k
> rename to tools/verification/rvgen/__main__.py
> index 133fb17d9d47..994d320ad2d1 100644
> --- a/tools/verification/dot2/dot2k
> +++ b/tools/verification/rvgen/__main__.py
> @@ -9,11 +9,11 @@
> =C2=A0#=C2=A0=C2=A0 Documentation/trace/rv/da_monitor_synthesis.rst
> =C2=A0
> =C2=A0if __name__ =3D=3D '__main__':
> -=C2=A0=C2=A0=C2=A0 from dot2.dot2k import dot2k
> +=C2=A0=C2=A0=C2=A0 from rvgen.dot2k import dot2k
> =C2=A0=C2=A0=C2=A0=C2=A0 import argparse
> =C2=A0=C2=A0=C2=A0=C2=A0 import sys
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 parser =3D argparse.ArgumentParser(description=3D'tra=
nsform .dot
> file into kernel rv monitor')
> +=C2=A0=C2=A0=C2=A0 parser =3D argparse.ArgumentParser(description=3D'Gen=
erate kernel rv
> monitor')
> =C2=A0=C2=A0=C2=A0=C2=A0 parser.add_argument("-D", "--description", dest=
=3D"description",
> required=3DFalse)
> =C2=A0=C2=A0=C2=A0=C2=A0 parser.add_argument("-a", "--auto_patch", dest=
=3D"auto_patch",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ac=
tion=3D"store_true", required=3DFalse,
> @@ -25,7 +25,9 @@ if __name__ =3D=3D '__main__':
> =C2=A0=C2=A0=C2=A0=C2=A0 monitor_parser.add_argument('-n', "--model_name"=
,
> dest=3D"model_name")
> =C2=A0=C2=A0=C2=A0=C2=A0 monitor_parser.add_argument("-p", "--parent", de=
st=3D"parent",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required=3DFalse, help=3D"Cre=
ate a
> monitor nested to parent")
> -=C2=A0=C2=A0=C2=A0 monitor_parser.add_argument('-d', "--dot", dest=3D"do=
t_file")
> +=C2=A0=C2=A0=C2=A0 monitor_parser.add_argument('-c', "--class",
> dest=3D"monitor_class",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help=3D"Monitor class, either \"da\=
"
> or \"ltl\"")
> +=C2=A0=C2=A0=C2=A0 monitor_parser.add_argument('-s', "--spec", dest=3D"s=
pec",
> help=3D"Monitor specification file")
> =C2=A0=C2=A0=C2=A0=C2=A0 monitor_parser.add_argument('-t', "--monitor_typ=
e",
> dest=3D"monitor_type",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help=3Df"Available options: {=
',
> '.join(dot2k.monitor_types.keys())}")
> =C2=A0
> @@ -36,8 +38,14 @@ if __name__ =3D=3D '__main__':
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 try:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if params.subcmd =3D=3D =
"monitor":
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print=
("Opening and parsing the dot file %s" %
> params.dot_file)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 monit=
or =3D dot2k(params.dot_file, params.monitor_type,
> vars(params))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print=
("Opening and parsing the specification file %s" %
> params.spec)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if pa=
rams.monitor_class =3D=3D "da":
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 monitor =3D dot2k(params.spec, params.monitor_type,
> vars(params))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif =
params.monitor_class =3D=3D "ltl":
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 raise NotImplementedError
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 print("Unknown monitor class:",
> params.monitor_class)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 sys.exit(1)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
monitor =3D dot2k(None, None, vars(params))
> =C2=A0=C2=A0=C2=A0=C2=A0 except Exception as e:
> diff --git a/tools/verification/dot2/dot2c
> b/tools/verification/rvgen/dot2c
> similarity index 97%
> rename from tools/verification/dot2/dot2c
> rename to tools/verification/rvgen/dot2c
> index 3fe89ab88b65..bf0c67c5b66c 100644
> --- a/tools/verification/dot2/dot2c
> +++ b/tools/verification/rvgen/dot2c
> @@ -14,7 +14,7 @@
> =C2=A0#=C2=A0=C2=A0 Documentation/trace/rv/deterministic_automata.rst
> =C2=A0
> =C2=A0if __name__ =3D=3D '__main__':
> -=C2=A0=C2=A0=C2=A0 from dot2 import dot2c
> +=C2=A0=C2=A0=C2=A0 from rvgen import dot2c
> =C2=A0=C2=A0=C2=A0=C2=A0 import argparse
> =C2=A0=C2=A0=C2=A0=C2=A0 import sys
> =C2=A0
> diff --git a/tools/verification/dot2/dot2k_templates/Kconfig
> b/tools/verification/rvgen/dot2k_templates/Kconfig
> similarity index 100%
> rename from tools/verification/dot2/dot2k_templates/Kconfig
> rename to tools/verification/rvgen/dot2k_templates/Kconfig
> diff --git
> a/tools/verification/dot2/dot2k_templates/Kconfig_container
> b/tools/verification/rvgen/dot2k_templates/Kconfig_container
> similarity index 100%
> rename from tools/verification/dot2/dot2k_templates/Kconfig_container
> rename to tools/verification/rvgen/dot2k_templates/Kconfig_container
> diff --git a/tools/verification/dot2/dot2k_templates/main.c
> b/tools/verification/rvgen/dot2k_templates/main.c
> similarity index 100%
> rename from tools/verification/dot2/dot2k_templates/main.c
> rename to tools/verification/rvgen/dot2k_templates/main.c
> diff --git a/tools/verification/dot2/dot2k_templates/main_container.c
> b/tools/verification/rvgen/dot2k_templates/main_container.c
> similarity index 100%
> rename from tools/verification/dot2/dot2k_templates/main_container.c
> rename to tools/verification/rvgen/dot2k_templates/main_container.c
> diff --git a/tools/verification/dot2/dot2k_templates/main_container.h
> b/tools/verification/rvgen/dot2k_templates/main_container.h
> similarity index 100%
> rename from tools/verification/dot2/dot2k_templates/main_container.h
> rename to tools/verification/rvgen/dot2k_templates/main_container.h
> diff --git a/tools/verification/dot2/dot2k_templates/trace.h
> b/tools/verification/rvgen/dot2k_templates/trace.h
> similarity index 100%
> rename from tools/verification/dot2/dot2k_templates/trace.h
> rename to tools/verification/rvgen/dot2k_templates/trace.h
> diff --git a/tools/verification/dot2/automata.py
> b/tools/verification/rvgen/rvgen/automata.py
> similarity index 100%
> rename from tools/verification/dot2/automata.py
> rename to tools/verification/rvgen/rvgen/automata.py
> diff --git a/tools/verification/dot2/dot2c.py
> b/tools/verification/rvgen/rvgen/dot2c.py
> similarity index 99%
> rename from tools/verification/dot2/dot2c.py
> rename to tools/verification/rvgen/rvgen/dot2c.py
> index fa2816ac7b61..6009caf568d9 100644
> --- a/tools/verification/dot2/dot2c.py
> +++ b/tools/verification/rvgen/rvgen/dot2c.py
> @@ -13,7 +13,7 @@
> =C2=A0# For further information, see:
> =C2=A0#=C2=A0=C2=A0 Documentation/trace/rv/deterministic_automata.rst
> =C2=A0
> -from dot2.automata import Automata
> +from .automata import Automata
> =C2=A0
> =C2=A0class Dot2c(Automata):
> =C2=A0=C2=A0=C2=A0=C2=A0 enum_suffix =3D ""
> diff --git a/tools/verification/dot2/dot2k.py
> b/tools/verification/rvgen/rvgen/dot2k.py
> similarity index 98%
> rename from tools/verification/dot2/dot2k.py
> rename to tools/verification/rvgen/rvgen/dot2k.py
> index 9ec99e297012..e29462413194 100644
> --- a/tools/verification/dot2/dot2k.py
> +++ b/tools/verification/rvgen/rvgen/dot2k.py
> @@ -8,13 +8,13 @@
> =C2=A0# For further information, see:
> =C2=A0#=C2=A0=C2=A0 Documentation/trace/rv/da_monitor_synthesis.rst
> =C2=A0
> -from dot2.dot2c import Dot2c
> +from .dot2c import Dot2c
> =C2=A0import platform
> =C2=A0import os
> =C2=A0
> =C2=A0class dot2k(Dot2c):
> =C2=A0=C2=A0=C2=A0=C2=A0 monitor_types =3D { "global" : 1, "per_cpu" : 2,=
 "per_task" : 3 }
> -=C2=A0=C2=A0=C2=A0 monitor_templates_dir =3D "dot2/dot2k_templates/"
> +=C2=A0=C2=A0=C2=A0 monitor_templates_dir =3D "rvgen/dot2k_templates/"
> =C2=A0=C2=A0=C2=A0=C2=A0 rv_dir =3D "kernel/trace/rv"
> =C2=A0=C2=A0=C2=A0=C2=A0 monitor_type =3D "per_cpu"
> =C2=A0
> @@ -60,14 +60,14 @@ class dot2k(Dot2c):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if platform.system() !=
=3D "Linux":
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
raise OSError("I can only run on Linux.")
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel_path =3D
> "/lib/modules/%s/build/tools/verification/dot2/dot2k_templates/" %
> (platform.release())
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel_path =3D
> "/lib/modules/%s/build/tools/verification/rvgen/dot2k_templates/" %
> (platform.release())
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if os.path.exists(kernel=
_path):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.monitor_templates_dir =3D kernel_path
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if os.path.exists("/usr/share=
/dot2/dot2k_templates/"):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.=
monitor_templates_dir =3D
> "/usr/share/dot2/dot2k_templates/"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if os.path.exists("/usr/share=
/rvgen/dot2k_templates/"):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.=
monitor_templates_dir =3D
> "/usr/share/rvgen/dot2k_templates/"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise FileNotFoundError(=
"Could not find the template
> directory, do you have the kernel source installed?")

