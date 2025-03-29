Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC15123774;
	Sat, 29 Mar 2025 12:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743249891; cv=none; b=lEWyzjzYX0PyZRSuw0Z4NqynzpiFDtaN0MkvILVMT8lTJISf4GY+asNyoSNxEDnPs4kNZ+gL97Juq8F9qVVHb5yzedJm1JdEvCTMxe//yXmYFDHGqJ1YHzJw2yHTNFdAP/AIrDDJOhohIJRPGrTz1EhhVuLhCkPY6ipiFQmuWes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743249891; c=relaxed/simple;
	bh=wdGfX1nkkaOW4O4ujEOaMydVXl5u/twkpDKmuOuz89c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoVTyHNP65bDe1IRvjM03WYAl+iw5rCCmainpOvM+gmWNzTu2V4f5isYI4kHpSaxGvTePswNXzFrCEYWMgFPoDm9va9IAV3/yjWxJ7jLAbOIUVcFV6+pBaNJtEkwI8XHk0kYuBo+7lMZW/4+/sqxrICncWl7F+eIj00zbsGGqDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xq/sPumm; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xq/sPumm"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff5f2c5924so665133a91.2;
        Sat, 29 Mar 2025 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743249889; x=1743854689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdGfX1nkkaOW4O4ujEOaMydVXl5u/twkpDKmuOuz89c=;
        b=Xq/sPumm8MI92xzjYEbflbWpmBDnGCbVH2ZEDM6ZbFc5lVZ+fCbwfi4B7fPHlRMnrP
         TMZIp7xLJgn96WIdHWW8b6WeQ2ckRfENk/Fy507TUwZPMlGO3P7sLUY7mNyDpuoWJinQ
         8fpdSpfIDez91MtuXpCjYHiiac/vBvA9exvMGdBwaGC/2XzrprYGBlekW8SiSZE2T2fc
         Kr7LNGseghsRhKn2d4jsnco07hw/hI/W8MG3UnXyeBqr7ir/HN31JAVveop38nzDYffX
         7dBY6WFIZqwQHJ83KtoQh1B0ltc5D1hudFpsWH0oeqGDnlpYFrwtwFW0pPfWe9VM2g+4
         /51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743249889; x=1743854689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdGfX1nkkaOW4O4ujEOaMydVXl5u/twkpDKmuOuz89c=;
        b=nmoZCSfe4LF/4eQ0Caw4lxmK/SUyNQ9Tn09KXJKXw4eIFz1XhaWjpEZ56B0FNhkOKN
         0xTKYPnEuZyHzFRHGnmj++Rn41t7iqS2MLKTwDSmvnQxmI827+w+rfxfkFZ4aczP6hC+
         v2X+u9FNfQb18UzhzOjJSwYFCb0Gy8YEVdGc5I/4hhVxqSc0WhnsUFSc8qywUaXXkz01
         UjQ4G53wnexPnSv0A5fnZt9ui/AQOuTHGkJFP8hh1LQDiF2qDIEFnWaE8SdDxqXjvQc5
         591b4YCokzb80uqGhvYqi8RU86248BCgfgQQhOSfCU/1qXHnv2pIa3XNm81lv3hMCS2Z
         yn+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdbabJa37UI3/9N2lHNvAhkbglGvpqeKrCeWLLaPp4XVufLRD8gpyHXpVdlDDIvCPzT3PGHxK+RIr/1NU=@vger.kernel.org, AJvYcCXsBuUukvn9ohAYRumMqVP4qIN3MZs+x4HydN2CBMCNZ2z/vE0FG+ZWG67NjZ4RCpW6FvdEmio4I6cIbtAxMhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG05Tq3enChuFW9eHNqfLz43LCcnv95nqpfMrxQZ1GC//aqZan
	xe/KW9PwlEd5cxMWnjRGAlqvH/yOqfXAzXx72eE6yW/wO296W6GFCin5P0QqVQSJ1xxdHPoYngv
	Qul+aQFmgq1KbPqbgJ9gwxgh90eM=
X-Gm-Gg: ASbGncuUhwKQQRS3q2mSqxabB4btOO4xS+EKiJXGWJUZwOK2rpps+D7Kd9Wt7L25StG
	5Ma47W1q2/ur0iG92HRoQUBifc6VbdJ6gAp0/63EPyjT/VzCyWJwuP+9/IczgJV3L9/ItSN2Lwc
	PHRAM3sbsAHGglsnRFgwyjrNv0RQ==
X-Google-Smtp-Source: AGHT+IFo2UW5T+sFxhmwqIg+9PDnfH9AlwSZ2JIdsgHYNVzUvdlOAsTTCFjCh8UvJiZBM9onqJ46wvoqPc/VqkxO740=
X-Received: by 2002:a17:90b:390f:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-3053216fadamr1374643a91.7.1743249889149; Sat, 29 Mar 2025
 05:04:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325212823.669459-1-lyude@redhat.com> <20250325212823.669459-2-lyude@redhat.com>
 <87wmcc6ppo.fsf@intel.com> <4a7f76493305b0afc6ae8d14cfd7bc031316b3d0.camel@redhat.com>
In-Reply-To: <4a7f76493305b0afc6ae8d14cfd7bc031316b3d0.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Mar 2025 13:04:36 +0100
X-Gm-Features: AQ5f1Jqbd9HZU2nzqFw8nwbypmV9t7OkAeLVo0-UYJymAEYKQwYKoPABHjKi-rQ
Message-ID: <CANiq72n_PJWF=2Duxt_bTzzH2opAcNMRt+31WcDLuu1Qx2Nz2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/edid: Use unsigned int in drm_add_modes_noedid()
To: Lyude Paul <lyude@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"open list:RUST:Keyword:b(?i:rust)b" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 11:27=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> So - it actually does protect us to a limited extent on the rust side of
> things. With CONFIG_RUST_OVERFLOW_CHECKS=3Dy, arithematic checks are buil=
tin to
> the language. This isn't the default config of course, but it's better th=
en
> nothing.

It is the default! :)

Cheers,
Miguel
