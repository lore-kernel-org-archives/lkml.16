Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B957428DF47
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746643278; cv=none; b=bO4NDiuYqKW5/e/lYdDr2ejfzwDrDn5u6OoVpU+FP62FgEVfAsrtmAwBgBsYAnMWsFYYMHwKb7RzMPxK8Y37bfOjKPqvI+AEsrhpbe37ZXw/q/69GG7YNLpQLMlKLDAhoNzOocq+Oc0lGt6ojqe5H5kBzeqc+mhFk0PJVIUXMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746643278; c=relaxed/simple;
	bh=HZe78NtNOEeWzc6bIg2m6Fj5rRasr/I4okqe59f+dLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2gDLLuVSQ8gO/y7+aXYjYLCnRo9BG1qAD/Eg2KxvoCtnHejAHKOtDBz7UFowoHns9lShHlXvK+yerxYgstx2WXXQaNOKz94ap1c8L/1u4wFb+YpzX2OEROMbda/UAH8dvQUQm9HE0YMDChNH/bfSu5DUeAZyy/RqqaGLtQ/0qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UtDQLosk; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UtDQLosk"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso255381a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 11:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746643273; x=1747248073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQcufmYmGlYXbTUSfmkiThdQ5Pnfz5q4bUd1Pt0wtBw=;
        b=UtDQLosk4bfP8A6kbKZZK34Aah18zgBVYJPcoZeYH7j8upO6YjsHKoo38DQEqRN+zt
         yaad8BMX4ZJ2LdmSLcWfg83ZfNRN4aftlnxpPXPY7ghVvL7u3BNLImzw6vAbkl8dTA2/
         apjYPiaigq91LyQ9lpXQLGbU/Kw0rx6U1kmDSSX9dW+BpxRHHe6YMYVBTyqriIBve22c
         X4E4MyEAQ6AUBDiKIcABPN0n9TBcZuLeS/5Q7ssj84HC7KT14j9wVe8hEQfPOSr49dYs
         W8PrIT0u/MV8wrW3tgKG1lx7VSkxEJFEFdeKmKrQMvJHM0+yrCmvEzpZrmZ8rpGkW8ov
         0MSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746643273; x=1747248073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQcufmYmGlYXbTUSfmkiThdQ5Pnfz5q4bUd1Pt0wtBw=;
        b=enHYQQacExOG9gCVNNuOPlaWWxuG4Rq2AfjDoBFjmnV5a4GwMHSoQcw3XLWEKF2ZZB
         DDTaPmuXHrACeuTzVuTjQ9WrkX1G33EgorwENyIg9AkRAtWdA/7aAuBG8UzKxZd1oHew
         82GiKIZEIPbI1kP4+DktydEeQ53Wt/0AJe2twQjnygDaEx/bUEq80vQTbnvezBxwe6be
         3v/S4sw5BfckHQNNlXuv431LPzmG7JjpkKoLoILWjB8vlryaDrh76FqrTBAl9I0XxOhK
         HIoMoVxF+lFLoiOwRiz4lkUtHUFR2QIR4CWH9KZEiTwE+CCz+hl6nU7zZfdHTZWMmdrd
         TdjA==
X-Forwarded-Encrypted: i=1; AJvYcCWI0FMvqbkcTTXOfevo2dL3hJuPrSokRUR8Kf4KqP2F33IpvZDLXLn3lw+xvI8prmQ+fOAatLKPvql3o7g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+YCHYz6WBaK7AKCVoX28TT9NXSxqPhdrKEn4g9MYdsty5KGT2
	Y8Bxb3X28UCfARJAziyz0b6mricCE9AcA7ksEkI/W/Ogkx7E6ewFnck3FxUm10I=
X-Gm-Gg: ASbGnctFqpSvcN6Fk/JtRs59m9osl3y8/IOtmCU4SOrAm1waZosLIrOGLT2QY736i8T
	XDP0h1jPSFfXhtXjRI17xx9Xe9CaYXzn3l+v6IVK/jYwdgkvYFg2Hzhcdkg0cJloMi118YdZLmn
	xduBXzN71tuLy9Qv7GhLHuqIFg9CMUP6Do8bjT6JljujJjss3fyjXCXKzDbiY+DdyoSW+3I8WL8
	BWSofRpmIqaVXdBq+lnZYMRnXfCVjydhuKD73hFeoagocvrCjp7/rD353pz2c0Pl0P+qWLWFEvm
	7RTulvSE4I2j8rG1okKbo9/3MRKRVa4OcVtRt7BwZDM=
X-Google-Smtp-Source: AGHT+IH/PR+Zz06sUuayKqpZNJEokZEr3n/LHOx8nH3XGM8ECywA5vvQjzQ7Bc4R025bd9OEt8DW4w==
X-Received: by 2002:a17:907:944e:b0:acb:ae3b:b424 with SMTP id a640c23a62f3a-ad1e8cd77a4mr480650666b.38.1746643272908;
        Wed, 07 May 2025 11:41:12 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a24a4sm950681466b.41.2025.05.07.11.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 11:41:12 -0700 (PDT)
Date: Wed, 7 May 2025 20:41:11 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cgroup/cpuset: Extend kthread_is_per_cpu() check to all
 PF_NO_SETAFFINITY tasks
Message-ID: <yghzleu6pvqzmie77muujhc4ac3dmtjmies3pcwjikrbwp7vvq@qpxo4qmxzhcs>
References: <20250507183011.550307-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4yycbdszh5z422i5"
Content-Disposition: inline
In-Reply-To: <20250507183011.550307-1-longman@redhat.com>


--4yycbdszh5z422i5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] cgroup/cpuset: Extend kthread_is_per_cpu() check to all
 PF_NO_SETAFFINITY tasks
MIME-Version: 1.0

Hello.

On Wed, May 07, 2025 at 02:30:11PM -0400, Waiman Long <longman@redhat.com> =
wrote:
> Commit ec5fbdfb99d1 ("cgroup/cpuset: Enable update_tasks_cpumask()
> on top_cpuset") enabled us to pull CPUs dedicated to child partitions
> from tasks in top_cpuset by ignoring per cpu kthreads. However, there
> can be other kthreads that are not per cpu but have PF_NO_SETAFFINITY
> flag set to indicate that we shouldn't mess with their CPU affinity.
>=20
> As all the per cpu kthreads have PF_NO_SETAFFINITY set, fix this
> issue by dropping the kthread_is_per_cpu() check and checking the
> PF_NO_SETAFFINITY flag instead.

I think there's a reason for existence of kthread_is_per_cpu(), so I'd
stick with more robust

-			if (kthread_is_per_cpu(task))
+			if (kthread_is_per_cpu(task) || task->flags & PF_NO_SETAFFINITY)

Perhaps with a comment that illuminates the kthread_is_per_cpu vs
PF_NO_SETAFFINITY difference.

0.02=E2=82=AC,
Michal

--4yycbdszh5z422i5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaBupRAAKCRAt3Wney77B
ScbLAQCNzzhTKInQ/O6giMRTLySRKJbbtyc+gFqTTOJTan310wD9HdMX42se2kCU
+Nc3gA8HKYQXvOjy/bEz1By6fqPUQQc=
=Ng6m
-----END PGP SIGNATURE-----

--4yycbdszh5z422i5--
