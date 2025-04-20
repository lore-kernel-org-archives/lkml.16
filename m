Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C78D515;
	Sun, 20 Apr 2025 02:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745116459; cv=none; b=gsyho8UdIik3W43YVk+SlOV4qVsngoRQgzi8SqjNYCeEkHrOdF9tLoJ6oLmSStw3a6dZ0ZxJXpK+Q057E9F0941NTpoMHdPxKGJ1ExWkv8hud+PPYmj9xRclk3RyCPUFEzf2td5UaX8ZrgSGtrL4nOkMJQQu1vBJwUwYuBYeJyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745116459; c=relaxed/simple;
	bh=zpRG+4ESqx8weMv/lLvyN70WbZRncAlm97xmEM8W+zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQ3B8vT/nH3X8ETdSkhRTgfmZt7I/P8oiO/gjOCXMgerQUempUY4/e2LsYkOx6j0sLuU4H7538R1KlShcvKNurZ5J4jVnEebw3x+7dAY0yrkh/ZiTBdVX6TOKOoLaEKpBdtVfz9+SFgusvGVb8kO0Gry81SUWbElkFWQQlBoXrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYs2DN2H; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYs2DN2H"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af51596da56so2363593a12.0;
        Sat, 19 Apr 2025 19:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745116457; x=1745721257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cer7pacIvzGQHZLSRkFuB7iMRA/qUESA+zB+RrPnUOs=;
        b=aYs2DN2HDv7zd4jqBfl/QQZJZJONrVY6DNuvOwY7G+tU3CsAWcLenY/BebTaERZMDm
         7W/1JzNbYSLnRJu2oAMmuEi/eMsnIjneRnGrSXLRoAzKPyCAa8vcBxhTAMLjnLA/YWY6
         cYyCwzSMvOIbQo71VUCkZBa7Qiezjijn4A78DnVHOXjPMyGYOQ+6mTYq0Bu+XsfG07uZ
         oLEieoEZm836Aa5SJUQxdWqmkP5RGR/lsvTrbEOKV+IjiLGbLxWRDryN2JVerrwI0wti
         NCUhby/rtrX/g5czDS/9wH6oj7qyiOHA6bqoF3yMbluUI1iLWFkE1bZ2aZ6rsd+JR92+
         Jz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745116457; x=1745721257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cer7pacIvzGQHZLSRkFuB7iMRA/qUESA+zB+RrPnUOs=;
        b=C7Cbe9UJ8XFxZBeHjtAFgIi+xWdNJ8eJuxkVqEZWQfdUOVAfJqe1DKhpZu6MaqVcVH
         YWJLNOiWDDq8frW6OnJrtrtgU09e8r4rXKyYIfEGCMs+0cg8JmQ3sAbKeYXGxkZs8eJL
         IrV7HcWGA8w/sw4O+HsvUFqaggobjDjHcRNaoLZt4MMZxUrG444QC7XhkoKr7vsMpfAL
         YhCPVweoXCwJYJ4M5TqwCBT/m03g0tbZJHNSjOK0H+O2KK0fMoBVBNxFqtb1rYr0pD4F
         C+nVL/YQSTICygKjihGnCTthUAOoJ6BAXDF4PyT8J6XdjXpqa9B94k0mScCovWEgzJo4
         9Nig==
X-Forwarded-Encrypted: i=1; AJvYcCUgYOpVZA8G9RAdkev5S7X0tX63G/zWpoKsnTkrkZ6yk7jFkWwcEAzYcuvMjeYPXYcjatqzP5HRFCU=@vger.kernel.org, AJvYcCWjtWT/INhDZU7wjM0nVRcN7eIjyBEouQ9aqqgI0rw8BQ5mGJ0pigobJgUYAeDstY8zIWxbWZjx4X+5P9Hf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8kqjp7vzJCmWZMTXmFJAdMoSdX52fLtpUGAt/1Ff0Grr1Yz35
	qJRXN4A+FChBGomRD1741j1cZP8Ac/7bOltW6pI1IUykG2VLU/DU
X-Gm-Gg: ASbGnct02TO0Zmfa2GnOp1oWETxuSp1RBoMveRThUB1WEM07i7wt/otab/snQuQZX8f
	1YJHSxl01+28vr8hxfLo7Uuie5AoB7RL9UIdBP0zEQZDZc7WO3ihYtZtjHsFH0PH5lS9+kvQI2J
	ghP+22qiYbqKoMNA0HY+zOAnBNHIQ3kPA3LSeZu2yWqjWj7miLdgwbIpVUg0EbcFTQ00E48EmXA
	u+pVA6Zbk8VmHfq40KE6Gc7CDOVN4KhgWGH7BtGRN7tH7ZEc45kUR66ih/nE8QhMQgx5qkYh1E7
	DJwicQ88ltlu95Y1v6pROUbf+3hUV39rmBNwBuGd
X-Google-Smtp-Source: AGHT+IEDZ1t1jMw2FiN3A0cP9gyJ3a09UAw7Kj90kwun9fTwMj5UtoOryCIOPgp/BHuqqhth5Rto+A==
X-Received: by 2002:a17:902:ce8c:b0:224:160d:3f54 with SMTP id d9443c01a7336-22c535ad0f8mr114306245ad.31.1745116457247;
        Sat, 19 Apr 2025 19:34:17 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c05dcsm3962485b3a.27.2025.04.19.19.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 19:34:16 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 7EE8F43F1C0F; Sun, 20 Apr 2025 09:34:10 +0700 (WIB)
Date: Sun, 20 Apr 2025 09:34:10 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Savitz <jsavitz@redhat.com>, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: namespace: Tweak and reword resource control doc
Message-ID: <aARdIqU6Y7baKrSk@archie.me>
References: <20250419150428.1129352-1-jsavitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="26tnTgdynCWnioaZ"
Content-Disposition: inline
In-Reply-To: <20250419150428.1129352-1-jsavitz@redhat.com>


--26tnTgdynCWnioaZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 11:04:28AM -0400, Joel Savitz wrote:
> -There are a lot of kinds of objects in the kernel that don't have
> -individual limits or that have limits that are ineffective when a set
> -of processes is allowed to switch user ids.  With user namespaces
> -enabled in a kernel for people who don't trust their users or their
> -users programs to play nice this problems becomes more acute.
> +The kernel contains many kinds of objects that either don't have
> +individual limits or that have limits which are ineffective when
> +a set of processes is allowed to switch their UID. On a system
> +where there admins don't trust their users or their users' programs,
> +user namespaces expose the system to potential misuse of resources.

Do you mean "when there are admins who don't trust ..." or "where admins do=
n't
trust ..."?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--26tnTgdynCWnioaZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaARdHAAKCRD2uYlJVVFO
ozKKAP4y74GboL6dwb9pcAYpiirdpARFK999Ta1CwtOXo0RM0QEA9jSOmOeXnBP4
DOBtXmaFFeijLoNfkB//yZnQQGGxAAg=
=OvWN
-----END PGP SIGNATURE-----

--26tnTgdynCWnioaZ--
