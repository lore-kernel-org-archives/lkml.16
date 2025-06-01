Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78C01494D9
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 18:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748802296; cv=none; b=PkMhCIpyRPjHTz3flvBoQdld3JNj0pbsd7DTGSKKSGo7pky3RkchgwppZ4hxF3n+4HT9MVo+7yfWP+Ve7IoUTTA4aSJJ3ZkwpThxzgseKmWObuFWmucn5fl61dguE6fFOFf0uY3mLBrjRu2qqhxX4TrrlPtMwH/8N4KthrI7118=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748802296; c=relaxed/simple;
	bh=E7bwHh9p+dUTMO7XySu0qQWXdGU/h7KsM45BflHLm6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cS08++rRzI/HXwYJ54MjW1yNYWDIeiz6X0r3OIzogiAb/f1lwS1T9Xsd97miFewdSNn1Sq0z+9lHqbPZ4ldTMvZwfJ09hz9EcmoI2GTGy2IIFQ66ZVW1xI9wcLTz+RACYrXLAzJdxWlBaFyGRib8CKD4y22JVIgs0cXq/nEc6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OylNe5YI; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OylNe5YI"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad89d8a270fso994090266b.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 11:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748802293; x=1749407093; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/+1k67xEa7gHDAXY8Ae12RvGRIx4eE9l9TBw8KyJWk=;
        b=OylNe5YIcnEx9WLzXyR3m22n4QW4iBP5dz1+9x46roMsen04jsXVugwZjQAc3k99vf
         mxjCBpq1ovJeb9b2aw+0bUOSbGv5nWzgVthD4GFHl3Kf2371AZfxWlJAoYB/8zPtSmsA
         hvkRqkHH2NR/UQOT17a5Cgz2WgZGeqFDtcpFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748802293; x=1749407093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/+1k67xEa7gHDAXY8Ae12RvGRIx4eE9l9TBw8KyJWk=;
        b=GMjSnKCjZuRXI86LOw9n9Xg5UoCqRIRfc9W8ZHXmGbVrttgKpzOwvHVoWBPU/JB3t3
         0Dp/jWnU/eEJM/BQmMHh77QSpsBH2qxLY8Pf+xoVnuy+cHB4KlGgHEtxxoXD87USVWdm
         PdHm7IZHkUxktadFhfY5Xlha8I4yQzOLg7C3evyYQ1j8qGoAaj0oD1+XH5/IJEmOjhzA
         UoFqzrPZvKALT/GYj06dGEthrMkyiT4TkHcObWsxr/macZubHeWQ9er2JGq4J72wKrV2
         PX01kR5esdY4Jb68I5rEZ2gUOG4atIe+Me42sNfJOWeEcBN3hnw5u4Hb/O5V8JXRYIq4
         5WaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlyl0nzYAgbSbfxyBwODTzstpLmh2w5k41H4z5SnrQLIYN0tShpkdsjbaZLKJfoYaBHpaVMwYB0ELYgjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFChfj8/I3xQrsLO7URPwBheiOuf2CyNOyc+8heuZtHorighV1
	P63q7Y2mJE3gpzDjEWCYwOSgEzv0YjHd/hnmGVfbUqwm/zizsodHC65YFpsih9RSbHu0XHm/HhB
	AAnfBp84=
X-Gm-Gg: ASbGncuIVlE5mep+i7keNhG5YiJK4MnAVoGpnDWYjZNNBziWlOqA8Q01c6NXquCp6zv
	G0Wb3wQ7KyJWHjPkvSNd45Hjkq+VP8Z+LLT4xuoJ0k4xcXARrALm3vvngJqtFe2zh2TK0yI2oeF
	lDk8t9F7mNk3M2PaQH5ynkc/13vRK1ivWSbUalyEkOgIyl1VbiuWbzqR39+hR6W6/B/LZCCaddN
	jhS3Q6Pn0U0hTjWP9V0rF2N8xggSpC/Hv7HZUX6W10Upf+4h/Nfe/sfmCLpdwXWkMuh5fuoEgHY
	WWzJ4wnKxnAVbGenqbhAlCySIbGZ2gk86HssDmcVR7L059MHDgHakZC6y3BQAjp2R2rXUxLIoqZ
	HffBfxDbPUdT/anZb8S+8vfz7kg==
X-Google-Smtp-Source: AGHT+IEVN+/gqCQhhroSXWDef4SAUXz5cZdRaYtAdG0lTMF7WIB6YN4e4bLczH+POTpr+bJT3fGZEw==
X-Received: by 2002:a17:907:3e23:b0:ad8:6dae:11e6 with SMTP id a640c23a62f3a-adb3277a38cmr1088717066b.0.1748802292760;
        Sun, 01 Jun 2025 11:24:52 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e838sm676425166b.72.2025.06.01.11.24.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 11:24:51 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-602c4eae8d5so2207293a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 11:24:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNwJZ2MRsheNxFePvP5wl42Rf+QSrQY82IL01P3YxbpgdalRtMdNo5WKiTs4gyEFE1pdDl2szbOReuHNI=@vger.kernel.org
X-Received: by 2002:aa7:d7d8:0:b0:605:ff84:375b with SMTP id
 4fb4d7f45d1cf-605ff8437b0mr1509408a12.16.1748802291155; Sun, 01 Jun 2025
 11:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202505310759.3A40AD051@keescook> <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
 <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org> <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>
 <202505312300.95D7D917@keescook> <20250601-pony-of-imaginary-chaos-eaa59e@lemur>
 <CAHk-=wgcQdD0UzMJrNhQuYAC2wgGtfrCry_iokswaEE5j7W9YA@mail.gmail.com> <20250601-wandering-graceful-crane-ffc0b7@lemur>
In-Reply-To: <20250601-wandering-graceful-crane-ffc0b7@lemur>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Jun 2025 11:24:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiQLG6n97zuW3p_N_jTDtG-xWJDNGDAgvmjtwd5GYET4A@mail.gmail.com>
X-Gm-Features: AX0GCFtWDwqJnX0nDqQTH4OnllRkMXJFyd2lEiVDJ0ByDevZhMRMbJW7i9e519M
Message-ID: <CAHk-=wiQLG6n97zuW3p_N_jTDtG-xWJDNGDAgvmjtwd5GYET4A@mail.gmail.com>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Ingo Saitz <ingo@hannover.ccc.de>, 
	kernel test robot <oliver.sang@intel.com>, Marco Elver <elver@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Jun 2025 at 10:49, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> It's working as designed, I'm afraid -- git-filter-repo is a powerful tool
> for rewriting git history and will happily fire off even when you are pointing
> it at your own two feet.

Yeah, well, it's designed for rewriting the repo.

But it most certainly can also rewrite the committer name, email and date.

And I do think that even if you check that the committer doesn't
change, you *should* make it rewrite the commit date, so that people
see when the thing was used to rebase commits.

Afaik, that's as easy as just setting the 'committer_date' member in
the commit callback. No?

           Linus
