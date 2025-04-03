Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF8A1624E0;
	Thu,  3 Apr 2025 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677742; cv=none; b=QG0JUIzDYsa9dcGS9wwzjmKoFaNTEGVuLRIu8qbokWUM9l3sb0oAnPVLZtIiuSCDoaFixxio+uRfcF27ldliS7D1JVNyyADk2RLx3OCQjMBJWn4i2ZBkeLhPfPXSHNu8W618RQ6NJoHub2mqmiVOIBGU2wUFRwW4k7fbAlh8cfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677742; c=relaxed/simple;
	bh=+Txho1X6kxtQ7ArayeLB/i6A0cBPRmvC3mL3UWxb1f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqYH/+nvH19JuDwj79mK7lnmHlOxg4nB66kl8bvtJpUb7JvA7v0CXOqaBHx+GT60N2PBpJg3203xCRuqC3Wd45A47LILC7hm7MVBfdwcFLmqY1ps9BUaxEHiZreNdNp9+4uWm2nf44cul+XRUVby+C6e9rEnifECHmcAzCP/QWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAY4vGly; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAY4vGly"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22403cbb47fso8108955ad.0;
        Thu, 03 Apr 2025 03:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743677740; x=1744282540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sNlLWGdRtItnGdc2sw0oNRPSrhRzRsHpESstF1l2f68=;
        b=TAY4vGlysrbPtQjr8H4zRF/trgoHcPGlsEO8AVh5Qm8MYfmR+yrH3FQtwM1sA6RJqr
         Uja3dEz34voLGlMTv3Iem6PvPqUr2fFVfX68xL+BNSThY1YU3OyjHWtQ3hj3IOM3NdZ/
         IOXemxBs7cYLHJGtoVlYbVBTO9F0WCFE3v74o1z3PrmNMqf7cA7IefSP90L9eXI8zCat
         SHOMeTUQzRqtpbvFD/GIV55RrQc5L6DetlcR5OUDUGFZfiOnRxww2I1Ne8CDPepdnj3j
         K14FKrOgO+j/7TJDKX2QVeYj9l+ctZo+aAJLXovy7g5nD8pUF22E2Pcokd51/33hZn64
         Xmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743677740; x=1744282540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNlLWGdRtItnGdc2sw0oNRPSrhRzRsHpESstF1l2f68=;
        b=WApbvSwSmSB6s4IHzUMM40Pc49oPAdMYheq4yn9o+iwoTiUS8qK5Nkluv0FYTiQdkl
         y/24S4XaHB9RkYUyv2PLlRVPuA7CqxldOYKzoIkGIUcUXAoEP92KW+icHAeqtgroSc8r
         7OagFnatpuahQ49PDgXetMsRFaCzzeLmpXmhv13HXue4TW5iKTIc6SCQ6Ac+qgcgzef5
         PSoa2SSGUGDK+V7tEYOX2f51OBSMgyoelp3kWIHE+poKk0GGwhj2WQviZRNl960JiB59
         Ourtgz+n5nVEqkxByqLpfff/sz2IA0/8y5jdCUgkr1UBOtq5elsDpH+VuwWYHYIA51Ph
         NkUg==
X-Forwarded-Encrypted: i=1; AJvYcCWHktD73tqkvcnr4kv4QYd4aCUDO8gddNGgb15thZI2TjM1oF1Y912i8XRYPoS9aoI/8vWTLnvfKBXrMB1p@vger.kernel.org, AJvYcCWcyauqcBpOPGY1/MrSZiTyd3XXrZBhne97GqNE/3AriT2NoOSCFFi9MSsZ74kVBf9tiBsDGC8Ryq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIiYOu3tfBQOvkA6A5f12Fy7t/bq4KELC2lxGB7A0qplrf5YLj
	kMxqTOzFbHo6dLvyZK2bYk3AhUVGEfES0r/3qa30HvxCqjFRKJ6b
X-Gm-Gg: ASbGncu22yro4iutw2+EJ50F1Ndjz0jCMTRwXGje+rxVMi4Nj4R/qE5S5AWIPDaU5mN
	GQtofzLUxDmSfLmw/GHSqbt7w9j5Sf7YLdZBIqukXSO2fjodyk7y/ouA1WukpXVSqjYmzrfvxX8
	GJ+IyUaex55VWPyFssk/JLmI2zeD7hjBKa1XwSoyuWk/sofD6st7t5Jrb9EhBGkJSEcF6Myrs6b
	+0bRnWIj4oPIcj5q6dXEKDxY1XCw/NvPuKg7u3u8X0EmoVwWeVCKEynimGaRu+zQHz+kOpTxI1j
	WMDmkmdb+Q+vyx6N6TbxBry+ofURVqAff/58NeBptJ+0
X-Google-Smtp-Source: AGHT+IE+gQXleRkvfL/4cfdA5b6Dbr2fmsHTRHz18hvqGG9oy+QNiixivlKQms0BXRWQfa03q8a36w==
X-Received: by 2002:a17:902:f54a:b0:220:d79f:60f1 with SMTP id d9443c01a7336-2292f9f2bdcmr292546445ad.42.1743677739427;
        Thu, 03 Apr 2025 03:55:39 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e04bsm11402235ad.114.2025.04.03.03.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:55:38 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id EFE744208F7B; Thu, 03 Apr 2025 17:55:35 +0700 (WIB)
Date: Thu, 3 Apr 2025 17:55:35 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Naveen N Rao (AMD)" <naveen@kernel.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org
Subject: Re: [PATCH] Documentation/x86: Clarify naming of CPU features for
 /proc/cpuinfo
Message-ID: <Z-5pJ6iat-uptEh9@archie.me>
References: <20250403094308.2297617-1-naveen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RhAAMdodC1OlX4rj"
Content-Disposition: inline
In-Reply-To: <20250403094308.2297617-1-naveen@kernel.org>


--RhAAMdodC1OlX4rj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2025 at 03:13:08PM +0530, Naveen N Rao (AMD) wrote:
>  If the comment on the line for the #define X86_FEATURE_* starts with a
> -double-quote character (""), the string inside the double-quote characte=
rs
> -will be the name of the flags. For example, the flag "sse4_1" comes from
> -the comment "sse4_1" following the X86_FEATURE_XMM4_1 definition.
> +double-quote character (""), the string inside the double-quote characte=
rs will
                           "... the quoted string ..."
> +be the name of the flag. For example, the flag "sse4_1" comes from the c=
omment
> +"sse4_1" following the X86_FEATURE_XMM4_1 definition. /proc/cpuinfo is a
> +userspace interface and must remain constant. If, for some reason, the n=
aming
> +of X86_FEATURE_<name> changes, one shall retain the name already used in
> +/proc/cpuinfo.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--RhAAMdodC1OlX4rj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ+5pJwAKCRD2uYlJVVFO
o4VoAP9Dd/u1PorFRyEC/XHLuijWLg32I7km53KfdYi9N6GsvAEAl+P9pwvFptaG
Se86hcc9DINWnPrw3KXrBBvZx2L9tQU=
=F0td
-----END PGP SIGNATURE-----

--RhAAMdodC1OlX4rj--
