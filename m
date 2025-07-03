Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F38914658D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751550009; cv=none; b=DIa/nNAX1Up2TZsVSS02zLwaxbc2IPicCM8DB7trwgEwZlrBJkpDEHHYtcXb+Lx9T64kRYLP73pCu7dYQAj0IKutaL/e5/MTaqtxylQqRQjAHAk1kjVCA/XvBZ7GqLckUXnp519LQM8qFzEbdLNSfobWmw7ErnJseUowadD1c7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751550009; c=relaxed/simple;
	bh=lQPP5bbdy4fOxz958sUsUWZEZso2n2FgQmaygGcfeUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCa+gnJ8/bVXl4mG8os3fvG37MTCdRhkIf9Rls8p/Mc4aMa9UAo1MdriicR0Po7yKcezdIoUMeXFKzAjutaLvH+78haOq3VrbxzHwmVogNw2eUEPCcYJd9QuyWVfGKq6BmqBTpw1U2r6qzHuXAqqgOgeDIaVbzfoKcq7SHncFnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YUjY1HrW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YUjY1HrW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751550005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0M94JvzlfnqHgvP4oUjipDVMaUNVTxdJuO6NwZ94V1c=;
	b=YUjY1HrWFtqn+RHHhKizyYjjj/jywzEl38PtWsVv3AR8bBiMCJ/7wFIKKu1bSEkI2Jc62L
	OIx0tk/Nx6Vw6S7Dn9mRLhoqCVN3U6UtUcqSgRI2EFIgLWINSqZkD0ipG8Dn3tULSwOErh
	SzSk0h9w8zQygEXgJ032kOrJ5WpTjQo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-i4i2TPJzMVeFdAgOLtgrxw-1; Thu, 03 Jul 2025 09:40:04 -0400
X-MC-Unique: i4i2TPJzMVeFdAgOLtgrxw-1
X-Mimecast-MFC-AGG-ID: i4i2TPJzMVeFdAgOLtgrxw_1751550003
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so3709259f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 06:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751550003; x=1752154803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0M94JvzlfnqHgvP4oUjipDVMaUNVTxdJuO6NwZ94V1c=;
        b=VcAv5wHZxvso0anoUiz9226iJdYA4WNlf2okGAMaHg5opEZTxFT2LsXwbnbZfyrdOD
         3nlNoUfptRncnWLhgZxFpvxEdT+v1AJtLJXGiEWRGHtGFfi7nK27qTC6yuWz2ibiYa97
         MEelda2RTYn4IS0V/sIOTZy/GvfS8ijVciaKd0oPfgI5Q53AqNL8TTKy6dcozE+9BV5H
         LKPgBM84AuA0MFhGtU3Il2948z0zduJZyIEsm4unasqo+RznFOop4BNCNdikja79NONQ
         9FWz/s9Bs85ajPLucjb4y37py3yHv3U7Dp1Ufvo8sdDDDTcTzwbvXEodsPpkj9wzZOAN
         qPNw==
X-Forwarded-Encrypted: i=1; AJvYcCUYHA80SFfVayrJgJpgKErdHuyJT0wqtT4X0ti/uMci+bg4blsfHgAFZ5DDwyY0LZv81xMX8cjXPoTNa+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzknon+uZfJ1ejYpHvuyhNmvJ1VUMWEn+bEKihBCpyILcvNhRT9
	WR1akpG1jBg4Blt5m5NHFRaVZg1PNwtTL5hiVyu1MSs0KqWv+376EGcg+i5S+vHbqC5zoIVF/8R
	JsZ46MK8izrOBBx2RpA0PdIHmnK6PI/dOZFpDfMJ9JuJ1h6YY+m4mmUv9v8ehtq79Xw==
X-Gm-Gg: ASbGncvCDnm9A+q/ZN7kYarL6UwSKZLFfTsjiYYTRlk7vlECiajr7Kk1+x5Ee6BvV5l
	gkNzgEdwlzGtZHIImNnMYUj5oUojz9IDaflFr8hUW4+CKvop9NwEDcvhOQfOiPNxK/KhWIkLaq2
	9MJfaM/5fGWsjokh0WMItVx7rFRzbfjYBL8lFsxakIY7ySngzurN/XiAYQ50Mr3M09YesHR6FLw
	Vi9IBslovt3FitlZH4nP8T2MdYE+X3Dc18EYGjKXhW7FyOnGycb51LKBHNpsYpUFqj78Q3utA==
X-Received: by 2002:a05:6000:4809:b0:3a5:1cc5:aa6f with SMTP id ffacd0b85a97d-3b1ff9f59bbmr5774372f8f.34.1751550002991;
        Thu, 03 Jul 2025 06:40:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0YWNy8JIvd0atXSh8bS1oVex1G4TPSFoYUkRdK/csYzwMJJYM5YbJDqU6slyIGkpSGWwDQA==
X-Received: by 2002:a05:6000:4809:b0:3a5:1cc5:aa6f with SMTP id ffacd0b85a97d-3b1ff9f59bbmr5774342f8f.34.1751550002515;
        Thu, 03 Jul 2025 06:40:02 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99b1c2esm26859725e9.30.2025.07.03.06.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:40:02 -0700 (PDT)
Date: Thu, 3 Jul 2025 15:40:01 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org, 
	acarmina@redhat.com, jpoimboe@kernel.org, mark.rutland@arm.com, 
	torvalds@linuxfoundation.org
Subject: Re: [PATCH 00/11] x86: WARN() hackery
Message-ID: <20250703-spotted-panther-of-blizzard-a887ad@houat>
References: <20250607094224.104791182@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rxppsgpskvdbbq2j"
Content-Disposition: inline
In-Reply-To: <20250607094224.104791182@infradead.org>


--rxppsgpskvdbbq2j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/11] x86: WARN() hackery
MIME-Version: 1.0

Hi,

On Sat, Jun 07, 2025 at 11:42:24AM +0200, Peter Zijlstra wrote:
> Slightly less mad this time :-)
>=20
> The primary purpose of all this is to get the WARN() printk() and
> __warn() calls into the same context. Notably the current state is that
> WARN() ends up doing printk() in-place, then takes an exception and has
> the exception do the __warn().
>=20
> The problem with all this is the ONCE logic. Normal WARN_ON_ONCE()
> (without the printk) has the ONCE logic in the exception
> (__report_bug()). But because WARN() essentially results in two distinct
> actions (printk + trap) this cannot work.  With the result that
> additional ONCE logic is sprinkled around for each such site.
>=20
> Current proposals look to make this worse by adding KUnit checks for all
> this, including regular WARN. Making the per-instance code overhead even
> worse.
>=20
> As such, by moving the printk() into the exception, and having the
> exception (__report_bug() in fact) do everything, we get rid of the
> external ONCE logic and provide a cental place for additional conditions
> without need to litter all the instances.

Thanks a lot for working on that. What is the status of this patch? It
looks like Linus was happy with it, and I understood that you felt it
was a blocker for the kunit warning work we'd really like to get merged
at some point.

Thanks again,
Maxime

--rxppsgpskvdbbq2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGaILQAKCRAnX84Zoj2+
dgFMAYC13qWmvAPGgDoZd+6evKAC5eOwSyaxcVMPGHjtfoCGtNDd++h/6CRr3qgt
1yvQBxMBgJu7dw0rb6ZcyiSjEvuxPzbtDtS43VK3mHwlz8e29fcRjLikuVTrD0He
bWmNR/zryA==
=pvsX
-----END PGP SIGNATURE-----

--rxppsgpskvdbbq2j--

