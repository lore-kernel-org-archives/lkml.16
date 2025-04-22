Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFE51EEA48
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309016; cv=none; b=PpUh0cNblDPqBzF4pWs4HATBbfckfPfEYOEF8Ym+YbfhIAX72jeYlOfGDtaMnUji6JlGOOSoRStGY8gxf+1teGuu0p0Xke6WCOVO+Kgd/Aw/OtD77rrv85WGoYgRkjmo02Uwcg4lPcabr9DchzTtBiRTSi41D49SnTXrEcUAPrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309016; c=relaxed/simple;
	bh=B15xBAPchz5ywMp21Obx8RhOKJ8Ncht56THHaOS3fYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxo2+RFdSytubMjtOHVZlpoIsRxaHSQY1yaEwzwz15OdmqpIJKTfN384c/L8R76aNO7Dm5zpklKRTWhIuXzzEilPqnsXjP0leb5LhJfcFrWHO6dStDYhRHOf2yngSAoCJDGaLLTaENytreNJAHVPirMpSkVxQdbWiJtQ6UvlNHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QUt1uaL/; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QUt1uaL/"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so58594846d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745309013; x=1745913813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B15xBAPchz5ywMp21Obx8RhOKJ8Ncht56THHaOS3fYw=;
        b=QUt1uaL/uyuIT8mv0g8VxYlWci5vMfHayJTPvI3vbHLyz3VaJopYbk2fGix9qJMjEm
         6QQj8/q11dko/UOja/DcqeROpMb9s3b07F4x7fdCB+mJbq/ahyjTH2HnUacTfSVoJsUJ
         GPlfMQ5H5bdii+i/pElj4l11dgzQOoDyq2ulUZq19+fM8lRRqzYLTIWjlXPIUGpxL5u0
         UpU/tru8IeSeY0yDrBUhh0xdO8tnkJkvY6BQampRJGmRUQ81C8LqQ7WecL+5KN0LxzOz
         C++ZPbOl3GSRNy+l1TITD8ThgGXPPl785kyA2fXVe6mDiPk31iybIa6nRgDG1PE3vXPj
         ZJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745309013; x=1745913813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B15xBAPchz5ywMp21Obx8RhOKJ8Ncht56THHaOS3fYw=;
        b=p//RorZSslkWZOqPUdmoIjoE6xM8wX493uDhGb6ZY2w7u914QdJ7QMikl9KXb4W8Im
         nZXiZRJMa9lbAwd4Ss5TEPlJFo0PhavfQZTB1ppcooB3S4D8cFtQOyU6enZDSqtIp94V
         19JIXPK0tqcSt/bGyhdjB1HwmrjRhflOMN0fzQHWFt3k2sVt0U5vyvI8Eq3ByjJ5R4iA
         Wcp8YYJHKqVhzyVfa6mprHpwri1ZJ5rFobWx8LIEICawKlo7xiPOv69Eqq31zRDZ3akI
         j23sn16Zd6jS3wC9XGGbKxHedNzERzd0pzIlWpHkPZadGDWM57VS6qmfZXZxuwfq5CdI
         /IgA==
X-Forwarded-Encrypted: i=1; AJvYcCXJUEtfPg7rIn/v/ryoRXF5uN+vSVR1MRlBBqNnKUsADRrrDA/4kfjnN4V4G9Wi9UJOXXsT6IH06Tbuf8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiuoX4s55/Owc/yxvCxLgyqcbhEo3pQM8BFTnrolNHj/KBn3yp
	9+91NyV1R1WOaOPaSCPa/n/iEaADAHdObgfWwXkHW8gmafxUu/aTDXP2b06JWLD3aD3gw90t2Sr
	7B604AJRFfMWtpaNR7lHt3IPjsdzQB5Vg9Dz8
X-Gm-Gg: ASbGnctLNNWC7pjmQ9nAmusK9feo2mHUfVMF2+b+CYjkXLEBDn87xiyCQWtgDvKDSzZ
	kpMfrXz3az83YeL2EB0dI1BuJldOyHquhuJVZc5IPw3/KjJAYTf9o1JanBME5sOrQR6Ke8by10C
	CgMLRZcm+IhpEn6Z/7UanDZ6/TOQUPuHe4OM2g4oYqiqxAbzRWTNhlJbX0ISU4VVg=
X-Google-Smtp-Source: AGHT+IGfmqhC9twpa81s045VFKzBGMGROExAeMG4OV8y391jm/X3GKCc3QY4QOVt5b+TMJX1caLGGQnEn9/KgyXIoA8=
X-Received: by 2002:a05:6214:d6d:b0:6ed:18cd:956d with SMTP id
 6a1803df08f44-6f2c4f23ec3mr231676876d6.22.1745309013089; Tue, 22 Apr 2025
 01:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-8-glider@google.com>
 <CANpmjNOZyFeX2OfPsZkB3DfcFrdSWO9m+yGwB_rN3Mc+JySqnQ@mail.gmail.com>
In-Reply-To: <CANpmjNOZyFeX2OfPsZkB3DfcFrdSWO9m+yGwB_rN3Mc+JySqnQ@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 22 Apr 2025 10:02:55 +0200
X-Gm-Features: ATxdqUEV3LLGO1BgxF4pNLM0PztS1Z2EZNeNcVdBnMd8dzNWwGcBT20VpzP0_a0
Message-ID: <CAG_fn=WX4kK+dktmFbUsMqiNd2zumRNTafYbFXd0662Rob4YtA@mail.gmail.com>
Subject: Re: [PATCH 7/7] mm/kasan: define __asan_before_dynamic_init, __asan_after_dynamic_init
To: Marco Elver <elver@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 8:47=E2=80=AFAM Marco Elver <elver@google.com> wrot=
e:
>
> On Wed, 16 Apr 2025 at 10:55, Alexander Potapenko <glider@google.com> wro=
te:
> >
> > Calls to __asan_before_dynamic_init() and __asan_after_dynamic_init()
> > are inserted by Clang when building with coverage guards.
> > These functions can be used to detect initialization order fiasco bugs
> > in the userspace, but it is fine for them to be no-ops in the kernel.
> >
> > Signed-off-by: Alexander Potapenko <glider@google.com>
>
> This patch should be before the one adding coverage guard
> instrumentation, otherwise KASAN builds will be broken intermittently,
> which would break bisection.

Right, I'm gonna move it in v2. Thanks!
