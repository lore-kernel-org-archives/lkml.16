Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60468231845
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751562117; cv=none; b=mDmRAuPoff5g7R8CWzp6jh+ZU3gLMTkWm4ZLMeW4M4HiWcPeIc+xjWBfbCidzZu7kWNO1yUMa3+R1LK/UbyuXeMKVorbFxDlvB3nYRYRQ4x0UFdHfrjW9ncZ57BhOy7NA8YzkcxdYqN+Cb1TtReIC+xIOlxZ1T+ffdsn/DnK1C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751562117; c=relaxed/simple;
	bh=kM7rWDRXYZslPAwvUjI0S1vtqE3V3/5uSDlQQKhDaA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYZbj4B7LmgWRKrBNw5dsHa+jYpRwsKJWGwMWKF6LWxGE/sLtQj7X/LR/lZycy+lA+xVS7YOe7Od4D+AudJSQBcYjIuYEmRvsiWS6LC6fhaoLQxthYHDmRi9vzlJt3ZPP3cFqk3riJRWmwBo2Q1TESuxpF45OjEANLfDHr2BTJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SqepL67E; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SqepL67E"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso342005e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 10:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751562114; x=1752166914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tvgXEYfYW5xzDI3GjDygpJ4QKWQyuJxRS6wokAGcsB8=;
        b=SqepL67E69vWyKWmWbFrFHh1ySRSZVxuyKYRxk8Gqdt2l5s6iEy85xJ017ceHT2N4d
         3k39kFBy3p93yxFXmjnHul9Y5nTZT47peEcmO+5uGAz3ow7XV44YdMaXagr0cXmsY01/
         Cq1ssDCrt2sLeZrm/AqnHqOpj0fOfrczwdJYz3Veq88qG6v+iUgt63j0RKO9qF0R8nH9
         lUb4X0WYM+yF7b2fHexgNvwAF+rO6dIVUc/uRgX8jmuuyfwIbFMRcf8pKR6s4e5PoiUI
         7N7wDqwGwV0TRmOD6Q9qV/0APHWO1QSQbYNdjDFfcFNNV3Y3/npGd7RhOSe6acUts1yu
         u4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751562114; x=1752166914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvgXEYfYW5xzDI3GjDygpJ4QKWQyuJxRS6wokAGcsB8=;
        b=j53lfwDgoHk7H6uHybmTWF4WMqMxZo/LUXtw8ovnp06LxvA3fpmH+tBOk/FZw+oTg/
         xDEMb2vxWfmwxNkQt2S/uQ2EQgOZd2k5SZgHJXgw7FEO4oDkuy1CnuedwwyPyd55YlGL
         g2G+01UgDHRWZsfadPHHXGecHNiVD6z4ojzvvZ+5DVdwdyJpNJ4BnQ8bgE0aOIvQjXqw
         5YWDzklC92HF9H0ZjnPTnCn84hfurOuo54y+K/cqQDyBTN0MKnhEb/ySKr0FD1k9ALJU
         V+9XfXe4806YvKM/n5XxgxyYhQ0Lj4xtnzSyrn4JRpyFPibWl6Yhco1uPy3XICsCtUxi
         kjZg==
X-Forwarded-Encrypted: i=1; AJvYcCUWJCoaQTSTWGWpARX3ztwmU5GRBT1B4LRbC3b4x6mSEfme88s6MxLE3/GEBc+l6AvG53bOanvSRb79c9U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/i4cmnJchteOD6W1LGLo1N+4qSH+3LruSemg2bwmSEFcPkkhL
	r8Axnua7TSov3Z8G9GZpONBCSHltYWgTqd0umqJXcCDN9DT5qlED5LlLxROsPJnTzug=
X-Gm-Gg: ASbGnctsDFWtl2jMTT/xjTsP1lG/IqqIaBxeAxT49t5fHzoNazpUa2LCWPCZgaOleXQ
	QfzkNC8hJxbkRhvsEd/CkR/tVUfifV9omJA/rryV++q1cs7j+/9yP+nD+lc6jLURoJwxWWorEz1
	KxwqlLnfp50n7ozh+hYWlyRLZEUtAzj/qV89AIo7rl0bY3VNjsfxOYpU96H0DP00+cGzyybOuFI
	QuXpV4JNg6SYVmkqKgGf51MMxmw3LNMBu+yaTt6Jxp9zc/vwoq1Kb7hQzRvc6eM/jI7Rt/kfaDm
	uMWmZbwtk3mmpLaWgdyDpOME4+96BfXbAaaYIZeni+Y7FbEjlcOK+FHM+tPIY+5n
X-Google-Smtp-Source: AGHT+IFNvWkN9/aq49nSwsZIeBAVziMrqd9QiExz2sWR+Q9F9wTW5KtDczlzUQmKWE4QnsQoUtU9Ig==
X-Received: by 2002:a05:6000:38a:b0:3a4:f2ed:217e with SMTP id ffacd0b85a97d-3b200f20826mr5442466f8f.42.1751562113092;
        Thu, 03 Jul 2025 10:01:53 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b470caa1b3sm265358f8f.43.2025.07.03.10.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 10:01:52 -0700 (PDT)
Date: Thu, 3 Jul 2025 19:01:49 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: peterz@infradead.org, rafael@kernel.org, pavel@kernel.org, 
	timvp@google.com, tj@kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lujialin4@huawei.com, chenridong@huawei.com
Subject: Re: [PATCH next] sched,freezer: prevent tasks from escaping being
 frozen
Message-ID: <n23vsu6y6cjf2vwdbfcjl2mj7venvpzpblncoa7adn3q5r4lph@qsfa3deqtamc>
References: <20250703133427.3301899-1-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xxkdtvnm4vyog2mi"
Content-Disposition: inline
In-Reply-To: <20250703133427.3301899-1-chenridong@huaweicloud.com>


--xxkdtvnm4vyog2mi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH next] sched,freezer: prevent tasks from escaping being
 frozen
MIME-Version: 1.0

Hello Ridong.

On Thu, Jul 03, 2025 at 01:34:27PM +0000, Chen Ridong <chenridong@huaweiclo=
ud.com> wrote:
> 2. The cgroup freezer state changes to FROZEN (Can be triggered by reading
>    freezer.state).
/o\

> 3. freezing() is called and returns false.

I can see how this can happen because freezer_lock !=3D freezer_mutex.

> As a result, the task may escape being frozen when it should be.
>=20
> To fix this, move the setting of the FROZEN flag to occur just before
> schedule(). This ensures the flag is only set when we're certain the
> task must be switched out.

Is it sufficient? (If the task is spuriously woken up, the next
iteration in that refrigerator loop would be subject to same race, no?)

Thanks,
Michal

--xxkdtvnm4vyog2mi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaGa3ewAKCRB+PQLnlNv4
CCUFAQD3hbnHt6PHs2Vbx/lZ/VZFBWrkd+p+gXvj0bzi1u0q8gEAjE60O9uuwUNi
/Pu7OAzzoXpYzXZHU7/xtTnmlkzJcAU=
=cMjT
-----END PGP SIGNATURE-----

--xxkdtvnm4vyog2mi--
