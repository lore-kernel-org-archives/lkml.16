Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B6835972
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082565; cv=none; b=tQ8cbsuTjvkm25y0GzVURVEU2TZZ4pbk0aU2isqji2E2WiEU6KZonLNEzt+b4dw0ukVOQx03kr/1KHpXzD76KBrzPMuSVdLxzsyB2dVmpSlbzZOp6lR5d1C3Z2Px5hd/mM8vELdXyIPBRbLbiOtCLMd8dTPknIJnUzZel/6eIR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082565; c=relaxed/simple;
	bh=d0ARDgvB9SsiJbkPZbgooQRX1EUc9fd8sBsLDXLnLXk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dhWDo6IAJgYQ6TpST9KgMHSTv8gO5GwhvsgnWy0rKUVg4ikIFABXJ7lwqrA/9JA1iw1b18QZVtfsKHRfy1KRKwdhRGOh4PAzf7RxvG377BFWhMV8RxQcKZh7PJZb13jD4I8vitns8a+PK+OzaBKGeSzI6ZxPJSTmEZv+p3ssRu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pfi9SNo7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pfi9SNo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750082562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d0ARDgvB9SsiJbkPZbgooQRX1EUc9fd8sBsLDXLnLXk=;
	b=Pfi9SNo7Igw4OBRYPFIGJMRZ//5jNQjjYpSDiCnLDwzTpb8LFvcrHLq3Ku6i6mhlJ0ibnU
	9btEFdojKi5Q3ziE/iubNfAi79NHVxcRWZHFV5yGaeatzELzbh5jkp8Pj4oI01clhZAipb
	NQyMc1vXWp/t94mhytK5hiP44zzRNKg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-OH6_GDVSMK2sGtkCEzwqWw-1; Mon, 16 Jun 2025 10:02:41 -0400
X-MC-Unique: OH6_GDVSMK2sGtkCEzwqWw-1
X-Mimecast-MFC-AGG-ID: OH6_GDVSMK2sGtkCEzwqWw_1750082561
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fac4b26c69so40068376d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082561; x=1750687361;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0ARDgvB9SsiJbkPZbgooQRX1EUc9fd8sBsLDXLnLXk=;
        b=nmpBqEuhAunOBVbbQuhx74nYakMdh8yvkQLpBawDpBj00lMJaTs3c61k7sRhwosMEw
         WSs9z55WJbKAT82oBxE7zsYsuDONlAmOUAcO+FUvI2oN+P1vxKQp/Rm3xS0tkLkUdK0F
         1nCbe+aQUxmvX6wQ4aHDfInE/go3rIQb0pUu8Z8vCvQUOQitg01J+SzpHwaS152CtgHS
         95kimyozvqalspmTmhyaJdjcCXqh3E97EJ+PPYWmQzRJU2t7IZ7hT/w4+xRMKxQrNKMx
         UPnmV/TKQ20QXAYjrm9xRCuUHHC8VTiRIq7MZC3ye2ZaUVWzRfZJHaeRpHnuPc76s5me
         rk2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEX+ta6zBq50X98xmRaiXtUdh+knOrwWmVltIX50Qr2MJ+rUUQybBo94uU4wTab84bWaRokvIoLjKvmBU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/7fvwcKaCRbq2i19HRgckntUYQ8V1GuoIQKhCvAW2J3Mk2KYq
	Op47e560s8EyqvstCnTSRnCMTkCPQpmLFhcOTvCrNmgVOEM7MHyf6BcE6OG6Y/TnPJCAQ1OS9T9
	F1M51uCtSrScTtQzQ2r08WZRjwpPjR+9zj+So6LR232yxzrZVKeZ6qww68suwXNZrYA==
X-Gm-Gg: ASbGncs4a2xk+WEudDNJLcXvbsoPngsNi1k5MHKeQ4XFMaN0dVAzQdkVzEJghqbRiII
	rAooYIVe1snNMw5urACmNs6v08NRiMpM85iRyn13cWvkzmGGzHMGo2EtZmZNsm1HzJnu46pxgbz
	g6xT/iDM5SvSdRw4BYl4UznwV7Ht00tgnkh/fcQ3p1y4JNclzroguYgcdM8T0wtZIautGJIeYkZ
	DeF0MdmLObGSaB/CzuzIpyc/KYyrWw4CR1XkliEYlpaBSM2+ZgAqDz4qEA2I21z91oToMSD/lHF
	YSKDumJBD+35Frak
X-Received: by 2002:a05:6214:5707:b0:6fa:c46c:6fa6 with SMTP id 6a1803df08f44-6fb47725e9emr140484896d6.12.1750082560765;
        Mon, 16 Jun 2025 07:02:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBcR/KFEr6tqTnCHltQ+VrJiT6moThRhF0UozL35I/ow0X/uSWOEQ9XgxjQtT6GjShaQTWUA==
X-Received: by 2002:a05:6214:5707:b0:6fa:c46c:6fa6 with SMTP id 6a1803df08f44-6fb47725e9emr140484276d6.12.1750082560204;
        Mon, 16 Jun 2025 07:02:40 -0700 (PDT)
Received: from m8.users.ipa.redhat.com ([2603:7000:9400:fe80::baf])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb525553c3sm16042316d6.104.2025.06.16.07.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:02:39 -0700 (PDT)
Message-ID: <7ad6d5f61d6cd602241966476252599800c6a304.camel@redhat.com>
Subject: Re: Module signing and post-quantum crypto public key algorithms
From: Simo Sorce <simo@redhat.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Ignat Korchagin
	 <ignat@cloudflare.com>, David Howells <dhowells@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Stephan Mueller
	 <smueller@chronox.de>, torvalds@linux-foundation.org, Paul Moore
	 <paul@paul-moore.com>, Lukas Wunner <lukas@wunner.de>, Clemens Lang
	 <cllang@redhat.com>, David Bohannon <dbohanno@redhat.com>, Roberto Sassu
	 <roberto.sassu@huawei.com>, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 16 Jun 2025 10:02:38 -0400
In-Reply-To: <3081793dc1d846dccef07984520fc544f709ca84.camel@HansenPartnership.com>
References: <501216.1749826470@warthog.procyon.org.uk>
		 <CALrw=nGkM9V12y7dB8y84UHKnroregUwiLBrtn5Xyf3k4pREsg@mail.gmail.com>
		 <de070353cc7ef2cd6ad68f899f3244917030c39b.camel@redhat.com>
	 <3081793dc1d846dccef07984520fc544f709ca84.camel@HansenPartnership.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-06-13 at 13:50 -0400, James Bottomley wrote:
> I agree it's coming, but there's currently no date for post quantum
> requirement in FIPS, which is the main driver for this.

The driver is the CNSA 2.0 document which has precise deadlines, not
FIPS. That said ML-KEM and ML-DSA can already be validated, so FIPS is
also covered.

> Current estimates say Shor's algorithm in "reasonable[1]" time requires
> around a million qubits to break RSA2048, so we're still several orders
> of magnitude off that.

Note that you are citing sources that identify needed physical qbits
for error correction, but what IBM publishes is a roadmap for *error
corrected* logical qbits. If they can pull that off that computer will
already be way too uncomfortably close (you need 2n+3 error corrected
logical qbits to break RSA).

> Grover's only requires just over 2,000 (which
> is why NIST is worried about that first).

Grover can at most half the search space, so it is not really a
concern, even with the smallest key sizes the search space is still
2^64 ... so it makes little sense to spend a lot of engineering time to
find all places where doubling key size break things and then do a
micro-migration to that. It is better to focus the scarce resources on
the long term.

>=20
> Regards,
>=20
> James
>=20
> [1] you can change this by a couple of orders of magnitude depending on
> how long you're willing to wait

--=20
Simo Sorce
Distinguished Engineer
RHEL Crypto Team
Red Hat, Inc

