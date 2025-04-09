Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC17D268C79
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212812; cv=none; b=ddDuQzEG2BCrbC0Mr2767S+xRJQ0Mp4CJVKiwi3Etyp4gDj+3VakhY+5lTu7UavFF6f4GpIBlrTCKI6RBxMnAoEfkXoyV6NMA2lwC5aVc0sXb+c57l3wFUMrWylbpVkuev1CvcFx8RJnT7rywNbzLOPO2FJQHqqU+k6e9ZLLMd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212812; c=relaxed/simple;
	bh=Q+E+gm5uopjkervKkp2H2F4qs52H2bSWJcrVdOv471I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rb2umJeQakW6tMH18vIC+4oii7ISbxSGQPTau2FmsA6Te3785987UnakmFQkaAwA+A+BtL9UsPgRyh3g6FxQUX1hgoMdCeJ6cQ3IY0m93u8JRjkGsm2VNiddXqmZNXZizH93c8+1SIDnJirEFLwSIh0X7SBmHW3akTIV4vNeqiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LdTC/CCz; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LdTC/CCz"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86d75f4e9a1so2856784241.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744212809; x=1744817609; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TdxP6TrUHsK7q8J2aaqhZA0bVAluAt8YBqPZ1F5Nh/M=;
        b=LdTC/CCzxEDHcpl+vmw0+nZoiNNPJWQyHMiRmY8lgDaIrVUH2KYHysKgMCUVVGO3f+
         v8Ky9SFRkr9RVqGyMKdfGoP7wNDgazr9gi6y0n4BXaFJ6rLXHOgw/OCCYM9v7p4/t1Vk
         0uuSEZVIuhlE6r48TQSRFYU3lbQ07Dt8XZNec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744212809; x=1744817609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdxP6TrUHsK7q8J2aaqhZA0bVAluAt8YBqPZ1F5Nh/M=;
        b=D5VT6eQLaQjXZp3FiitClQ2ei1bR71uBCbfHpgApD3Ks2IqRbH+plDssOiOop1wMHi
         Y5Tp3sdBXs0Nofi9Lo35PLHdWo6Fca9LBX6B8es1C9P2QSBZYlJOR00Y3ALhIKZmD9J5
         +OZFDkQwKK7/yraYx/uibRD2tanWJ2K6lv/ehHzub7AQDFdNeL2XsKdZhzbg+Ob1u86Y
         bltxc1cI+pH2NB+HAFItVBu4asdsArToBwoNAfdVddBYz88vwWo5kqVdD1z0+1RDgrMs
         XHjd4NuWk4QwIBZM7/KOsoh9C2R+lY1C1naq7XShHN6dKJpYC/OQ/OhJkrJUinZYlS9I
         2f6w==
X-Forwarded-Encrypted: i=1; AJvYcCVnhoYN/mG6mfof1DsqFo5f9Rd4Wa8lixtyXauSLhy6wahhl9hXHmUtlqUcq6TfQX5hpogm3iJls3dKPJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH64daPowiN6fzBe40Vu45SA7lvwYaP8UsEe/vFk19Urf88ES8
	HQgcpi3PeUnpDFIMfsmx3UKhFJFXERwJWvH8UY1d6uSAm6rejouns1QG3SqVYSX7UO5KP7MrUZo
	a7XlRjQ==
X-Gm-Gg: ASbGnct+8M/a1qHdLCXFlydPV6X3Qm1lNpeg90pp9VnBPSGc2kY91RGLEIBS4FNWgY2
	ptTeK0/jqRE1ew1lgmhq8sRYIPRYy7PgqGenmSqce2bI/fPPcqGCrpXnD4F2CD/fz3WyBxJzpKG
	MbyeFQjq5Tsaxj+jrZne7J/2VPoP4qRtugzYTg/eDVnkOhGHENtM5+uHuOFqnAurTQu3edAR00k
	Vth2qoobeZlRDU3eN/faC0zkPRwa302RPJkSIxggKwf8Osemr2OpeHj5Kf3vaNlyhUBqU7b/RtH
	1sBrbFl4YH8jNXHjb8Q7TTkfG+mL+xSivF22gPVMin2hnH35UZebMmU10cBfI+gGctyAk62B1pM
	I1pzzwNcCxkniIiA=
X-Google-Smtp-Source: AGHT+IGUAbhM4ECRzdXqJk5O46ez8UfPvhrYWuWe8RQBr90U/8W/V7aU3V+cwQZSt4MeCBg1pijg6w==
X-Received: by 2002:a05:6102:f8e:b0:4c4:fd0e:dde with SMTP id ada2fe7eead31-4c9c41a2ed8mr3559254137.8.1744212809535;
        Wed, 09 Apr 2025 08:33:29 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87557137401sm260188241.10.2025.04.09.08.33.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:33:29 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d3907524cso2927430241.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:33:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJdyKXgzF1jyZ34myzjlVwSxlZnvWOW+Cd6qxCKkhyEruW/Q7MGW6itiuUwnIDx7BHd4l1rA2UjkdxgmE=@vger.kernel.org
X-Received: by 2002:a05:6102:91c:b0:4c1:6feb:83aa with SMTP id
 ada2fe7eead31-4c9c41a2f70mr3107478137.9.1744212808088; Wed, 09 Apr 2025
 08:33:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-kbuild-disable-gcc-plugins-v1-1-5d46ae583f5e@kernel.org>
 <202504081630.4CE88E855@keescook> <db50faff-7290-4193-b861-f60e36f1d1e3@sirena.org.uk>
In-Reply-To: <db50faff-7290-4193-b861-f60e36f1d1e3@sirena.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Apr 2025 08:33:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjc+piYyUw36s4ttEkY32jVkxhRtyrt431wew7XcDS2Qg@mail.gmail.com>
X-Gm-Features: ATxdqUE2pdW27qPIvkrpo9DrN9_CijkuWYa_if9ESQH0ro1aFZDLb4UaGrE4hZA
Message-ID: <CAHk-=wjc+piYyUw36s4ttEkY32jVkxhRtyrt431wew7XcDS2Qg@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: Disable GCC plugins for compile test builds
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 05:20, Mark Brown <broonie@kernel.org> wrote:
>
> Note that the patch is only disabling for build coverage builds where
> the resulting binaries generally aren't going to actually be run.

Well, there's a reason we do build coverage - we also want to test
that the non-build coverage case builds.

And it's not actually obvious that it does - it's in fact rather
likely that the gcc plugin is broken in general, and it just so
happens that it's the build bots that find it.

Which is why I honestly would prefer to just disable the plugins in general.

Because the problem is the plugin, not the build coverage.

             Linus
