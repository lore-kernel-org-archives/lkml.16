Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDF41428E7
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797749; cv=none; b=nYWDOFFMfpP0nDFQ/1CsrdYwgKriIgiubCm6l9A4LeoG5Y0NQWBR3nxZ6synoilF4nIqLtjzRj6Yq+zTXjNcKIjTIUP3FV1ROWkZHtVjqJw9uVmI1/DqrWk+oM5/dp36iWI8gZcA4hTJ345Mi3iJIVgAAAj8rca6aOAxs27gAyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797749; c=relaxed/simple;
	bh=Dx+DkEzhbxvytOQXjorEQqxJ6zeAnsoM4QWfOqiHclo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pk3iInc4K69rsVE0l3j+xRbdeNv0IvMimF7dUHb3SO31qOhE0BKwCCLWMPZHHPZp3bdY+3U7vFieHjKgJTKIEEJs+2WD6eHyiPb4upTVF8mvbdquGdX0x2W2jD9tjmy3AnyfxTqD0Tl3VlifjMbD44cYeqJ44/GuZ+c9XJJVUJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gstMkIx9; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gstMkIx9"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5fbf52aad74so5043895a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746797745; x=1747402545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjxNnSRsyTmUOjnyHt3URsc7lY8Eum3urENUO1QtEX8=;
        b=gstMkIx9ACSlXcuNxvTuVvVo1zG1k3w/rFVWKTxJ2FrNM3oKg8eyfB1WmQZlv9FJD/
         bo7Ium2xOI8Wlter6mNOOJpxfSHZAwFVedfV1NRvHJAOPk08uJ2lMGR8gJ/9h2KtVb1f
         ek1jzdWVHatzCWlNQ1aHOTnblunExrZvhQCi2VOQsnIed7EmRGdhGxobGL0dre6MyI5p
         g9MYDC3dkp7Wtyv7i5DIEZmsGtrWEtb9oRdHx3T4FgiXGBBUvQXgk9oS1czBuYn0YzWb
         PuGVqpy/FyHkqevQ0ZxWas7+umIj4+mETSRBmInuHLscuac2dbQTERnFUa0gP8N+f128
         aFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746797745; x=1747402545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjxNnSRsyTmUOjnyHt3URsc7lY8Eum3urENUO1QtEX8=;
        b=kr6vfiLAI2HiLcFlM2B2O6hbvWZ5BRL0FXqLfHrcgMkfOajfC7mO7SwjVGOsiUeDHe
         fR6sRyuoscmcdlSGWH8tjdo77t733Eb60zKvKuBwUJ2h/XvVgVyapbJyEe3OjWFkCu90
         XpNMLJE1RTJiLJiSygODE/aGuizSTTTpBzeAURbslH82HfC7h2Yc3V/CXposSGrRahbS
         wJdtzuF8RYsHUfNPmwU05kFVi6Slb+7d2qlWPKp0AQoKB2qgPjMSexZO4z20OVAG+814
         UmRY7ITANKeEByItLK1cIwk36JNz3NL50vQclE4b3NOk6v0qQ5kGRdWMPCwsuGflxZJE
         VnwA==
X-Gm-Message-State: AOJu0Yy3SimmWh4PfCSY7O1n16kFKDBbzrL/lv33wFLLTYpqJRSi1Qs5
	zZGOStTJ6a3XrexqjvMewuAMtXlpsRi/L+UO9E9FNNCxjcs29qOuHd9725BwIOk=
X-Gm-Gg: ASbGnct2T1k9atTsKw+JvbxFivxtIGwOtwN94+wTrIK7PpBBIAxt+UwmaeelRBhMw5m
	m6pLzf87Yaa4d+jiDvpj+utHooEHaedRhKIwdmQw8tIby3zbgVAkouwrwOVzJVHPeDAgZCCHq87
	Nh1gmlnMdjBgYTJux1eebMjC1aNVE3caFoyDo9+01j94zdsDM7a0mZXVaKEdff1ifB+Kyz1eesK
	tYVsxf9K7nxpBtaJWlkBq+2eE4hnHqs8vd2RwDhKZZqmwFBef1sIi5BOVujjdqe3Xwq8WQwREc0
	8I9WTcNIZf3MKi25Em7Qhu6nsIeOylTGS5Riv4Sx03lYQzJbS3gDPw==
X-Google-Smtp-Source: AGHT+IEC92HkUWApzjxSiVUUdHJiD7B2GP+/NDWqDaw0SPDYKaXpVgjz3afQ5uNreNHfpLDNqtzMrQ==
X-Received: by 2002:a17:907:94d5:b0:acb:3acd:2845 with SMTP id a640c23a62f3a-ad1fccfced9mr670506766b.25.1746797745416;
        Fri, 09 May 2025 06:35:45 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21933be9esm150415666b.46.2025.05.09.06.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 06:35:44 -0700 (PDT)
Date: Fri, 9 May 2025 15:35:43 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Joel Savitz <jsavitz@redhat.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, cgroups@vger.kernel.org
Subject: Re: [PATCH v2 2/2] include/cgroup: separate {get,put}_cgroup_ns
 no-op case
Message-ID: <mknmd2234xviy6lv632hruk2sgc4senbrodlkt4xju6w7lo6zr@l5ky5h4uxddz>
References: <20250508184930.183040-1-jsavitz@redhat.com>
 <20250508184930.183040-3-jsavitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oljps4cr2ouzgs4l"
Content-Disposition: inline
In-Reply-To: <20250508184930.183040-3-jsavitz@redhat.com>


--oljps4cr2ouzgs4l
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] include/cgroup: separate {get,put}_cgroup_ns
 no-op case
MIME-Version: 1.0

On Thu, May 08, 2025 at 02:49:30PM -0400, Joel Savitz <jsavitz@redhat.com> =
wrote:
> When CONFIG_CGROUPS is not selected, {get,put}_cgroup_ns become no-ops
> and therefore it is not necessary to compile in the code for changing
> the reference count.
>=20
> When CONFIG_CGROUP is selected, there is no valid case where
> either of {get,put}_cgroup_ns() will be called with a NULL argument.
>=20
> Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> ---
>  include/linux/cgroup.h | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--oljps4cr2ouzgs4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaB4ErQAKCRAt3Wney77B
SQsrAP0VTZn7auE6/HrbxVoNF7Vv8NJvFJ1/IdLWOsVS78MmbgEA0yEfBtfcjj5h
rZ2Rv7wf/M+OODWfIF2BQm05c/pI7A4=
=LhpG
-----END PGP SIGNATURE-----

--oljps4cr2ouzgs4l--
