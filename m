Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0B017E473
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609992; cv=none; b=GWGbotdxP2khl1R20SNqlgXyBG4CsAdhXXXL67O2IDX1Lpa3Jq8VbMyy0OknecTeOXA1t/4fdNzsPNptbSQW6UuKfiodgQ/Incx2MbIdJ3NnB4dI1B+gStpqInExtzmoaOOzrAvZXyrgqO8D+Ikkm3NIK2WqaEvH2E3nEp3gzy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609992; c=relaxed/simple;
	bh=Je/IsMmBNaOoQ0naVaiKRf0I4qNwygzgp9cFVZaBUvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cb1bfxzmDDlol1V7V/l5goDg5hdrE4gF0lQKM5RC4TYxicdi6Nihsm3HEJE9pvap2Z6+8fWjD73Fbsx+Vz1D5Zdns0EZhXiXu7LBJn2byVv2Fgxb9md2JojatEnT9lKYT3nA2i8vrgaWEvR6YKOV23OaLaCJTIFk+n7ryvpuCVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=geTaA2Fy; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="geTaA2Fy"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso11160627a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743609988; x=1744214788; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=025ywTe8X2oiiTY/KI73kld6gosblZKwh9c0eIC7QAo=;
        b=geTaA2Fy8Q9HgVWyYO03cGWHGvFIA9MifcRHyWgzFKEJvDTFKQ0nQPeT2EnQGMEvv+
         AKCJO5VW4Lh+PHSFHD0hgYM4WQ4zNtBIrx6fWwbVGUu4CdWA/hIa9zC4qVINEhA233fw
         XuA8E0zOSSnEHEKagdQb3CrBixYorzfwdqx9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609988; x=1744214788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=025ywTe8X2oiiTY/KI73kld6gosblZKwh9c0eIC7QAo=;
        b=DMIY2Sv94HD0Ibh25Nk84G0r1D2fpsNTjCvqYWFBqVNylAP1Wn5l4MAyNnEyMLGsda
         Y05NGHEoBYQBwUVoiUdCYiNT0eWzyPR3/uZLxvsdwEA40Gq54fcHQEyzxkgWg2A+LJzE
         5DGMz+GXWZdar41Jfqnkje2ABahpSEE+4+awlleLCi82GnAkzprObCQM9DlG83pnNPtX
         XF4W+tKyMMcz4agxhkWtZTn4vooXOv2V5hrh8oOtGXFBQT8XnaNLrDpbH4c1+rAV5S0x
         Q92XCxIsk11p+GrfW0v9cK31D5uHUyMJkHpmgOG3pQSDdIqMdzSM6ZRiqxbFg6lynDYK
         GkDA==
X-Gm-Message-State: AOJu0Yx7Q4XHaX1ypw6z3Q8UjNngBTYH244QEhCaodh87nnfTsu3wfAE
	V0rpa429dmCsOExqRUZmfr4CARZH4jiYp7on7FQOOg4ckBYKqobfYfFMULS/XNOTKhBoPBAZq4G
	oGfY=
X-Gm-Gg: ASbGncu7ZUrhCJhOJVyTzaSaThLWyWFVxYvu0NoQhmwYQKUzBWVQgSj7RWc9nBMb9a7
	2ViwCnlHPyTqbXaWhNGeRxZ9zfFbBGLESra1j2KHbCSNGbVUKo6Z0ISOaMvyyRZQyWSTLohTgYv
	XCa+OdztmQytUZj4McRr1NOMtbYXGDYnpwuXUwi9ubmVKA0+0TK8ebXLmJQr46mcZD7BKwsSU5k
	lHJ+92DMJTY1zcMSWMNArVdbUvHvqp/EbjF7q2ovKYK/YzgApun2phOM1DB3/7mTgdA5Gpib7aZ
	XMNPcrrjtUbcitQTFJv2EYn7wTT3w9tpRPojLj8xnnPcE7VMNVe5Ur8G+Hzr8mVh1qxpLCd66j0
	/ZIfANwFF7kVTpRFfrv8=
X-Google-Smtp-Source: AGHT+IHu+jQLs2JM3EpGlnrJ1iiKNbsHGgC53TI7GZhNNgKu7AkyKE4UmEAtxJiMplu5qgZvPDCg4g==
X-Received: by 2002:a17:907:84a:b0:ac2:49b1:166f with SMTP id a640c23a62f3a-ac738bfee57mr1607647366b.52.1743609987939;
        Wed, 02 Apr 2025 09:06:27 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f8f0sm935049066b.95.2025.04.02.09.06.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 09:06:27 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac339f53df9so1204211066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:06:27 -0700 (PDT)
X-Received: by 2002:a17:906:dc95:b0:ac7:36c2:aed5 with SMTP id
 a640c23a62f3a-ac738a5aa5amr1649611366b.28.1743609986968; Wed, 02 Apr 2025
 09:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402124656.629226-1-jani.nikula@intel.com>
In-Reply-To: <20250402124656.629226-1-jani.nikula@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 09:06:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whkpFR93_rX2Wi5bQErH1-bzFXkWZP2wgBGCRgsFQuOhg@mail.gmail.com>
X-Gm-Features: AQ5f1Jqd6jCqv34VGPiVcJowK6E-xTG9BBy-7Ow_2MxO0m2aPE5XhfB34p0FnyE
Message-ID: <CAHk-=whkpFR93_rX2Wi5bQErH1-bzFXkWZP2wgBGCRgsFQuOhg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 05:47, Jani Nikula <jani.nikula@intel.com> wrote:
>
> Another go at hiding the turds.

The patches look sane to me.

I didn't _test_ them - because that's not how I roll - but they look
like they would do the right thing and not interfere with my odd TAB
lifestyle (I say "odd", because apparently I'm the only one who lives
and dies by auto-complete, but obviously my way is never really odd.
By definition).

         Linus
