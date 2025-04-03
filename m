Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DD324EF66
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687251; cv=none; b=JGbXQr4IDV+fGcawqSYuvn9FUKEY9NkjrIXsDx1oFRuvZDt1wzfE+34XPIf6m7LqplDwodyuY04XPsfHx2UWz/5n8093P+oO9qFe8d4zWnJ67A4jQPXGvekPrSbScNF1pwstTNf9Tm8BhAdfeOhLQLy0g/+37Q3CQL+j9Px+P14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687251; c=relaxed/simple;
	bh=xiOlszo95RrZ3LIb1/U+HCnGNexFRuJJsuvLKrx+d6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwlNc/TQv3a9BITW3IK/3I+IvcEYLDCuRlZqb2/0hjVBsxwWYJEkTkjMy/U+KMY88Dmcuw+lfrNqsDDqBQiCtqEFS07ffwtt63wZMNHuwGtdS3ielbjZojE2u4k4HJYD5VDW/x+oyo+wBOwyGzGLUBA6zxObwIyLxIMPQ0DZ5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Me140abe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Me140abe"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0618746bso6250795e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743687247; x=1744292047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xiOlszo95RrZ3LIb1/U+HCnGNexFRuJJsuvLKrx+d6w=;
        b=Me140abeGqz+krODLLr2VPPxSqzreDTcOK6fbCInh9C9gS1jrylRb1GKX/TzI1kguq
         P7o1bEIRm8l95dmdr/VzopwtIA+dFnWG3gRABWKeHfNboEq3+Gtbz5hfe3o5LkHUbVa2
         LCiVUpUtNJFqfyTUX18/MC1wM84x43w0LCMCVBFr+vEnUWspAhGmCpmFf69SfMPjApCN
         VUSKe06cGX94zv3Vkg9vdtfIpAVqea7yD4OXYLjkg6ak3EKkbT9CbRh4R/nl4sIUUU90
         PsPmO1++sHH57//E+SkXMcN4u0Wh9TOpWSXRoolphHoIqtUTYT6sGeHdAT77S71Ss9Eu
         EINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743687247; x=1744292047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiOlszo95RrZ3LIb1/U+HCnGNexFRuJJsuvLKrx+d6w=;
        b=q9vo888Knxf+LEpRvhDIT5tb2q6Xhngm4JPyVxtwip5dwNeR8XT+nHKmKALK3tqedN
         lcv82q4n0wldiZGQh8q+qsO4t1dKw7mGWmJKSpfKfqq3azUZlxBvq33z80Rn9fovFdNK
         J7cCa+G4svvHpqlhd5WxN/6mvZb1sL4eQqkjfl1XP4SOhYI5GCtDO0y3+mKuI/NZsj4O
         VJ3wvYgJonhjfw2jqbBneYtv0mUES7TC2xIFn89az1S1hlhkuUSFmmiOpYDUp5CrGXmx
         G1AklqZ/nMlqUjfa+KGgn4LHXvBWAhWRqXNHGAO4lge5fxBQjZoKPdwmiy5UGcUW0JvY
         GQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCwLetfbpZYrUusL4bE7v2i8h/teZTgt/kGck0o4RxTKo52Y1jygNn4NctitZNFMBX6Fed61PzLPQkXn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpSPQk9nTtJDFwHY+X4GuoL1O0R6egJydXVxdHvs1ICTXG7cRx
	jKoMUizmuviH0k8RRg8vdxFAHZGxhRTkwsx4a6pdOOxYNu+DA7TRJgauZmiddzc=
X-Gm-Gg: ASbGnctF9PuZflJbBXwc1HxEgBL9dFeii+lCHSxeLY4aNnDl9si45/oAX0cfwkQTDnL
	K9F+CTLkkgMe5WskKwQ328BNR6b/hqKLtsOgFN4/epKfpVRwF2yT0AKp4M+SCWVZRle7qi0CuqV
	Irxws+02n6fS410BDc22AcA164hulgpRsH0nIGvXtAUgj+w8kSQYAXXFRlxMzMIKb4pxU1P8CZ9
	hnBQlY6RpbAw6yEr2XK9qoc6sHqYrMn+V67wkzbXHfp7XLrdcfeB3B82nGCeIhxxbgjejA9/X/t
	9RiA/Gl+tc9a4CpJMw3+PNJyo33Wpy31Uy9jnIJr+Nkvd68=
X-Google-Smtp-Source: AGHT+IGP0oRY34V+cSf6iFZovfs1LwN6DYRliDiIlWREW6dwmZHpdy7zI1duz9gTK1+/IwIvLvwRsQ==
X-Received: by 2002:a05:600c:b89:b0:43d:fa5d:9314 with SMTP id 5b1f17b1804b1-43ec153677cmr30397905e9.32.1743687247482;
        Thu, 03 Apr 2025 06:34:07 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364a0c7sm18497875e9.29.2025.04.03.06.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:34:07 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:34:05 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tejun Heo <tj@kernel.org>
Cc: Waiman Long <longman@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 01/10] cgroup/cpuset: Fix race between newly created
 partition and dying one
Message-ID: <hsbn4pcb6gpipjfacn7tbutheolot6rfia2j6nyit3bpf4adys@mpaop37aps55>
References: <20250330215248.3620801-1-longman@redhat.com>
 <20250330215248.3620801-2-longman@redhat.com>
 <Z-zsGazxeHK9uaA6@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t4fu4hgrvs64iwmt"
Content-Disposition: inline
In-Reply-To: <Z-zsGazxeHK9uaA6@slm.duckdns.org>


--t4fu4hgrvs64iwmt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 01/10] cgroup/cpuset: Fix race between newly created
 partition and dying one
MIME-Version: 1.0

On Tue, Apr 01, 2025 at 09:49:45PM -1000, Tejun Heo <tj@kernel.org> wrote:
> On Sun, Mar 30, 2025 at 05:52:39PM -0400, Waiman Long wrote:
=2E..
> > Add a new cpuset_css_killed() function to reset the partition state of
> > a valid partition root if it is being killed.
=2E..
>=20
> Applied to cgroup/for-6.15-fixes.

To be on the same page -- Tejun, this is a mistaken message, right?
css_killed callback is unoptimal way to go.

Michal

--t4fu4hgrvs64iwmt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ+6OSwAKCRAt3Wney77B
SSclAP4gqtAuLackFi5Nlj57z7Muu5PrIFLfK4zkKKF/gZ5yYQEA/gVGnVQa8Dcq
dIb6mJ6FOINsexbxmLhptB0vDt+lFAQ=
=eHQo
-----END PGP SIGNATURE-----

--t4fu4hgrvs64iwmt--
