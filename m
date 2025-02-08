Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA9A29D0E;
	Sat,  8 Feb 2025 04:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738988392; cv=none; b=fXRjEN8v9prglzx8dsKSFp9//83scAc8p1UIoDftCexWB5nrwC0ZuVrSuXaAdkLSruQTbznyFVaMTp8FvfM70PxShJfzLm69kz4O4ibOdkEWaETMXPFrTHKtPwdzB1sBewYPzB8TMpaOLc3DrF69QqpfsO/BjdW9StS8IyDLZuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738988392; c=relaxed/simple;
	bh=WFRv7U2gZI1ZGCZiOVLgFgrkw2O48cae/n1kraAk1WU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxA9mViaDNYeshMYoKAR/gw7k70qRiHdekqMCBVjcpE5HtW2+ISwsKevWI5g37zByQxy69tYrjr1oWgDs+bbQXGmMANY3oL9alEcMd3j3VIn8QNwRsw74oxeyxvetxsXNn8bJLA1EgJwww58cjhRk1EONY4p4H+hR3vzn2HO0CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHer3K41; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHer3K41"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f5660c2fdso24478315ad.2;
        Fri, 07 Feb 2025 20:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738988391; x=1739593191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Lpwub1T4gG8vpZv4DwF+p8Cg+KAncaMQIkWBOS5Q+w=;
        b=FHer3K41bQYumelvBSd+18b3xJk12oBltwWKxgd8+z79nNeQe7PUssXTUYNKcTplBG
         sT2G63cYti5ZS1122tk3Nk5zkc/ADC+NOjxcDwXH1l+kRH5LohBkxiymchMbfBu+hqtL
         ycdgtIlqjrH9+jGtZ5VWmTLJ8BD0RQQopxcn2Kx0zi3A/TsAQ8a26zsHiqfrefdhZ0UT
         vXEk+4Gpi1hyw8CiD7Pvsk80GAr9hoF3AFxMTKcnthm+NgxL7tnVCkWFNquyIFGR+S6O
         fl6uCNqimNH0HiEY+AIKz+Qh/efU40bWKeHbHcyDuqU0rj9A0L0ARs9Bin8F8Hrhxn3o
         2NIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738988391; x=1739593191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Lpwub1T4gG8vpZv4DwF+p8Cg+KAncaMQIkWBOS5Q+w=;
        b=DFOa4BxPMehFXxNConuseENWmAE9UR8JdjFBjLUV84RkBefYUbKgWbYkbCk0ueWTXc
         OfeUfwdzvehipr3Yg1HryomvvfvK1sa5mRopgGNiVaFikz0LL+VGo5SLeiG28hSNuMhx
         bLy762AWehzjvnlkaWv5cfbveOgw+EivCMLCE1bc2VUW9Wb9RLtcKAWs94w1auvkOSl6
         ADK4GYQKiKmuOm7DHdfTJ5jK7oBZSmp/jDDF/XpT9pxBsPh2Efya1TGZjWDMRQ5DqvoU
         fr5N6Uzcv/0pIDmazbdqBXUzTQ5rxRTdfiXQusyKIqARpdX2j2ZxBM5SounsDF8rtw+h
         YaSw==
X-Forwarded-Encrypted: i=1; AJvYcCU8M7s2LhDGUwxfq1XPiwPItVBJ1iT1P2+cjSo6P/XxDVPb2u8fmb61gIEDQ8eOa8e3lvMMI/PmjtA=@vger.kernel.org, AJvYcCUVnePCBsFnCrb2PD1xv7izVOlBShaikvYVEXVNA+E94ylpk5ugyh51otbviZW7jyv9kJlXigs8MQnaPLYH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2RJ1BzWq0E2UiWR11AQ3O/xlOtuhaoxaF1PqSnU/j4+7hc2pr
	OH77W7Mne3s0hnx1tjTtgzKlMq+nnlrfLSVdVRR6V9xS/CMBn84/
X-Gm-Gg: ASbGnct2iVYltofTM/bf/tm6xEqLHrTxHVUzNe0nXIs4vuZyL7vJKn1niGHpjfPAm9C
	m/IpPF3FNnvVXQHf3cJT4+6Baz5fFy0pX1Hekytx9hDI3Sfh7/mp6oo80/TaClzitzcKbS4UDkT
	PVxZNCKatr09ZKX2/lycXT9Dli9z2R5tmc06JXcHagkXGzhh4rNjhx/wPNZ84mYUGCSsmayIncX
	hOdgIj0XZCjxNFV5kABG5nbAPAjkfQcGNqSXzrBT2BPZ7g3GvBKyqruIreFS4OLAbOoj8a89/0F
	sJNvOPFsM6Yi84c=
X-Google-Smtp-Source: AGHT+IEFL2kkPyBeTJVgIF2v5+mJ78s2mc00+cplvBR476AQZO4tXYUfkU7LPeV6YMjWiLGNewn+JA==
X-Received: by 2002:a17:902:d50c:b0:21f:46b:a25 with SMTP id d9443c01a7336-21f4e6bea28mr94310825ad.16.1738988390367;
        Fri, 07 Feb 2025 20:19:50 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653ad8fsm38873685ad.61.2025.02.07.20.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 20:19:49 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 779294208F47; Sat, 08 Feb 2025 11:19:47 +0700 (WIB)
Date: Sat, 8 Feb 2025 11:19:47 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jiayuan Chen <mrpre@163.com>, linux-doc@vger.kernel.org,
	rdunlap@infradead.org, corbet@lwn.net
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs/arch: remove deprecated function name
Message-ID: <Z6bbY1wsLlGvJ7Lw@archie.me>
References: <20250207125504.728688-1-mrpre@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RvghZE1MoCnXZXxg"
Content-Disposition: inline
In-Reply-To: <20250207125504.728688-1-mrpre@163.com>


--RvghZE1MoCnXZXxg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 08:55:04PM +0800, Jiayuan Chen wrote:
> The dumpstack.c file has undergone many modifications, and the
> print_context_stack() function was removed or rewritten a long time ago,
> so it's better to remove the incorrect guidance.

"print_context_stack() was removed in 2016 by commit c8fe4609827ae
("x86/dumpstack: Remove dump_trace() and related callbacks"). Remove
the now-inaccurate guide."

>=20
> I also want to preserve the original contributor info by keeping email
> address and name.
>=20

"While at it, also link to Ingo's explanatory message."

>  The question about the '?' preceding function names in an x86 stacktrace

> -keeps popping up, here's an indepth explanation. It helps if the reader
> -stares at print_context_stack() and the whole machinery in and around
> -arch/x86/kernel/dumpstack.c.
> +keeps popping up. This provides guidance about it. It helps if the reader
> +stares at printk_stack_addressk() and its callers and pays special
"... Here's the explanation, that helps when the reader ..."
> +attention to the 'reliable' parameter ('?' basically means that the
> +address is unreliable).
> =20
> -Adapted from Ingo's mail, Message-ID: <20150521101614.GA10889@gmail.com>:
> +The detail about '?' can be found in the comments within dumpstack.c:
> +::
"The answer can be found in the comments within show_trace_log_lvl() body
in arch/x86/kernel/dumpstack.c::"
><snipped>...
> -If the address does not fit into our expected frame pointer chain we
> -still print it, but we print a '?'. It can mean two things:
> +You can also get more info from Ingo's original emal. [1]_
"For more information, see also Ingo's email. [1]_"
><snipped>...
> +.. [1] https://lore.kernel.org/lkml/20150521101614.GA10889@gmail.com/

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--RvghZE1MoCnXZXxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ6bbXwAKCRD2uYlJVVFO
o30fAPwKLj7nIXgZ/AIew6zs8lq/2DfxrCF7T8l0w7FhDAF+JQEA+cZ1+auwwU+Q
eyAVW5EeK8WfAKJ07vC5E383fIL7hgM=
=pwkY
-----END PGP SIGNATURE-----

--RvghZE1MoCnXZXxg--
