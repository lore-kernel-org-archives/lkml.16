Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D075628E567
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451913; cv=none; b=TVobLcUqaWX5KkPeGr3Kn7IUpfV9+EGxhOvicfu6sw6Z2hKBbu3CgHDarkRk0V44+BNLERPysQD+1RSHKfczClEjtdJ0chVZPDzY9imqcCg1+jzMtWewQx0+/f1FjzkWfAFazaamKLsYbvqdSL7W0kUZMLfE34T+IlUKqVXx54U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451913; c=relaxed/simple;
	bh=6QPXsF522lgAxGDMLzu85PkLdcBq5bWzb2eRzcztNo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoRqRB/ratVhymGnEv/a4fZ3ZIFP9Sb4YjMVJK8IrjO7cBoeKGf9re+YhxDOUPezr+qgh0EN/JSQSkfiLMnj4CORwdA0B1B+3gbxwL5j9iWuHoux6rEw6jtbwBYX/tyWKNR2I7SNgE7Y9B12qUFqPxs0+5ZgFbtBiRZGB+PzrQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HtFP108E; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HtFP108E"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so633635e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748451909; x=1749056709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6QPXsF522lgAxGDMLzu85PkLdcBq5bWzb2eRzcztNo4=;
        b=HtFP108Eku7ykVISiHo24iy4v79x1Nmkzdi5HTD9J07Yxk4OqphVkCZF1FChWPP4SC
         U4rGBOURSgKfSf3wDTY1oBptVuLttbkF45XP9XNBqjV2k6js4fmvVN1so4QWk6shIZdq
         1onVisdMD1qU4YanSqlgs8MgW6nHQAwmh3hVhElInr6Eunt5VmzwOoYY1cziQjCS7ewZ
         hkm4pdwpIEl1iLd8DbXnvepK88bVSuHRzM6l6b05i/UcdNnNNkoybOVJUImLHYfZEq1E
         YYTU6c0bkNoI3MCRxcphmYoU752jJ9I+yEBdUip86YCYiK23a5FG/bpqCoROXpFh/AMq
         n0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451909; x=1749056709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QPXsF522lgAxGDMLzu85PkLdcBq5bWzb2eRzcztNo4=;
        b=BHI93OEToPjhOcX18kGeU5VyFx86iNK6djIkT0NfMmF/Vm57/ffdUzkmUodqRTqNjq
         8ioJY4xm1a3hd60jRKcL78E/0Ycc94oqj0Apebz1tN3Y6gD9aQBNO6NfN49YG23SEwI7
         KCED7h30lBtRAClFx8EDo05YOVMK33bT36C2dZaeghjKx+kraIAedv1x/hMDqT0MT5C0
         mdYVl0+0b12OLtJ14ceSH5NBRzcojd/yb/lRUbfwep9J6jroMbPW6VF+E5PuxEZXj6Hc
         dZtdycbV0y5bH13YwyvJLnHEnrtlCMd5VaEB3s9FJg/FcA/luuYIWy9RGNB7nlgb2YdP
         36kg==
X-Forwarded-Encrypted: i=1; AJvYcCWW8gAZCcKdPkC/DUL4qIhnxujA64tjLPKxsuaGo7R5CA5u0lXGwA0zSyiUiGnrMbhhPnYTI2lP3B0dl3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTfSYXVRBP00yHFWZVpHx6EPWduVvpVb5XyxshVRnlcPjR/Q2Q
	t58+LtF8UVULjHQ2M6NFYcQcxulR0CVh9WVnKqhFX85lzjGWYyIXIfz5RZSW0N3HBSckPbuOrQq
	jYSJIMH2tXA==
X-Gm-Gg: ASbGnctUKj9l0UguWhZ+zL1ojoRmNHolsjBDDppHD5fa0tyensM6PQbB6EhumBOehUo
	uMbfpN9Qz1o8bdBzvwxTnUTbmtEoUIiN5DT0TasByRNQchB5yYq6/Fj9VKRPsYUDnfhsTPci9sJ
	qWpzhxXkHEfLzIhFlQZvvvc/xYRhRjBWnKqDxECtW20zurLU7+f5ReU/u0j0uww7WNEgE9WOTH8
	sAK0roQtNDgALxpEpwaY60PiQvWy5IFd5SLiIg2yzYs1xqHhx488p7PvNjce4t7OydF5YKaSCLk
	4hQqX7dJ0GXJaPU9Dfeu73QCNzOa+LJDC4uuMq5xjV6fkWpudnB0lg==
X-Google-Smtp-Source: AGHT+IGTf3pKK/IgQTggD4z8Aqvs1zWP1VXkcJHKOx61SlzPEwmvUNnUqlL2LM+xk+/b5ozR0cqjyQ==
X-Received: by 2002:a05:600c:64c6:b0:442:ffa6:d07e with SMTP id 5b1f17b1804b1-44c9141d996mr138953735e9.1.1748451909006;
        Wed, 28 May 2025 10:05:09 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4509a0452f4sm22875565e9.28.2025.05.28.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:05:08 -0700 (PDT)
Date: Wed, 28 May 2025 19:05:06 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: cgroup: clarify controller enabling
 semantics
Message-ID: <bdstku24kbgj2oalpbzw62uohq7centgaz7fbeatnuymjr2qct@gp2vah7mumk3>
References: <20250527085335.256045-2-vishalc@linux.ibm.com>
 <vzdrzqphpjnvrfynx7ajdrgfraavebig4edipde3kulxp2euqh@7p32zx7ql6k6>
 <aDcNLTA2JfoLXdIM@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="34l27iq75neltcmg"
Content-Disposition: inline
In-Reply-To: <aDcNLTA2JfoLXdIM@linux.ibm.com>


--34l27iq75neltcmg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Documentation: cgroup: clarify controller enabling
 semantics
MIME-Version: 1.0

On Wed, May 28, 2025 at 06:48:37PM +0530, Vishal Chourasia <vishalc@linux.i=
bm.com> wrote:
> The part that was confused me, was the meaning behind controller being
> available vs. enabled in a cgroup.
>=20
> Though, the documentation does mention what it means for a controller to
> be enabled in a cgroup later in the text. But at the point of the
> change it is unclear.

There's a picture [1] that may be more descriptive than the docs (on
which it is based).

HTH,
Michal

[1] https://paste.opensuse.org/pastes/987b665209bb

--34l27iq75neltcmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaDdCQAAKCRAt3Wney77B
SYoAAQDnwGxoiky6TLy1ry5zramOQWjqDHvRW6KNvKnoq64TugEAoDpAv+172mcu
qb6EoX3kd+ZHuNpYgTAgOV5HOv1WbA4=
=NwFj
-----END PGP SIGNATURE-----

--34l27iq75neltcmg--
