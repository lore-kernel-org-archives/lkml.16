Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71812798E9
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 04:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746505418; cv=none; b=iH4SeTPkiYVvKCpyjKOy+d5x5q8YOINyP9oEETIFUqP4bTKfGOPQok52xvpTVzexSaquY2XbqkHA2psLN6ritnza9Oa2bXa11jUKMR2MNnHXopWGOf/15qAV7SyqN2Zwkenb3vRY3THN0rv5rDtc119UtOY4ni/Btte28bnTNgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746505418; c=relaxed/simple;
	bh=hn9c591dXJgjp1caC2arr6sOqTPBu/Sc8oYI1nnrfhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIg7Pq9ciiSBbWpCzneYDxwnw2BVceMfOC9I7qMSWTSe1W9nl2PxGhnXibw58NswS4QrCTIm04otbDpBfN+XhYwHkulvccXnfewt7oUDw0O8i3hIs0WDwu7wcYVAHg/o2/bXlEPinRNvoh2c9mkB6UF6TwvjGe64RNQNNYMIHXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=wyMyww7o; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="wyMyww7o"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7081165a238so37230037b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 21:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1746505415; x=1747110215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kk0rHIP824tzYSJd/wcdfmqz9sqjrngOzbFuZVahSig=;
        b=wyMyww7oVuoSHfIbHaQN31ZjFvVLsEkkh1UigINhxrJdg+2rrH+WK9v/6CdFhgsQG9
         Vcju+28T1CJxfTl8bxazhFwq4sNZ9d3daxaPMRRziyhVMeuO3EMa0W3tLQpsQmN1ijNr
         WQENFLoqJbsT4JcrRybyr82QbsuAm178stgTMsNJSatDJtUVbSdh0JXe4/N/3OFNy2AM
         My/Zs7kFLz4RaBP20Q9lWee/FmZVR83jkrMv+JHVLE7IwSgHfe+uBMkBWTTieL16nHru
         C3cDsgWvjoCwku/Wm2BbyrVANC8Cdbb5OpYEaYI9UslRErnWC5+5OBFs8h5T8j9NhN2y
         myiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746505415; x=1747110215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kk0rHIP824tzYSJd/wcdfmqz9sqjrngOzbFuZVahSig=;
        b=eWcsqWKnjm5hMOBTfCuqEytdZOWP5brZnON3z5AP4w3idZkG75DrDBK6hkHA8rZODS
         NT3lKUHjoDNClC2CNOKNsn6Nu37cCoKRrH6BjLPKpq0WVP3f4FRbZfdpl0m3r38f/Irm
         dSvHDzDFmxzIOSX4VcafRzRDaBgndPGlGwutn71Xk1JFegtAS9TVW7GG+J/5ygfRrDEF
         EHocPDOOuBL8/6TVhdaps+b9BgYF0/o3Gp+xfMB7VVYblildtq8Mub0PsctY/zvgZ4/g
         M47rvhqIkD20Ljgq21wFEoO7mxp3PfPhWPxT//+V9SER7B1E4WeV/bkt3oiUsLvySs14
         zPrw==
X-Forwarded-Encrypted: i=1; AJvYcCUhr1F2F6zNBBwq5ZPr7ZHTa39LpTqhAQH7R3PxDW3LV2U1AqozJgAQK18pfyqN6z2TNWngLCatuiVj1f4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZwtNtaiwakEppKsdpBLULFYgOP4YnriulGhdD8wwB76McKby
	1gItEfKWGPINBpMhnJYTcw1sKFfcM51D92SPpEqThtuXvq5OOXbKxfeluvldKdg=
X-Gm-Gg: ASbGncvINXHvcnxBT2KJNIgRi/vH5ur72zr+hCHLFHWKi8PYuFYd46lFyDE/Vh2G14f
	V7KlOAl2V/qLj2y5sQRv0+S6vY9ZK13qhMUHKkD2924P2mb/Vcbwin2udpxQeQ55dOw+A7zPo98
	fhV4M3M/AghyybOjTO7eG+iTKU8hF9/y+u0qdV+jv47V6C/jU+SaIScihTQEz7SiyH5V6InrUS4
	wCjDtjsxFDwLif7OLAKrfd+WSr6/RTx3byxoZWiUHGMiOeDyAeeyGVmwkS7P7mfLRDwF7PFWbVC
	V59XuFw/NwIXkNQ4+qNHs27aQtsc7Cg86kQjAtaMeI4ol2mnidE0ABDJ0QsSdvQ3Re/MgLUz25i
	27xt26qxOKtevRp1oGSVdp93B//Cbk3LElyrv
X-Google-Smtp-Source: AGHT+IGauOMcdmDl7gE3jT1FrLe8gRcfpx/0h850sWX5FJCsvFHooQ2WBnw1X6kYbTtIVDUjYEjHTQ==
X-Received: by 2002:a05:690c:7084:b0:706:cc34:daaf with SMTP id 00721157ae682-708eaefed5fmr142349547b3.20.1746505415634;
        Mon, 05 May 2025 21:23:35 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-708c3f0a86esm25385877b3.14.2025.05.05.21.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:23:35 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	contact@antoniohickey.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v2 1/1] rust: kernel: create `overflow_assert!`
Date: Tue,  6 May 2025 00:23:30 -0400
Message-ID: <20250506042330.281501-1-contact@antoniohickey.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CANiq72mvu54B=U+YCUmbFctj_wXgF5zjeE-BB-vHVnAP+3mPcQ@mail.gmail.com>
References: <CANiq72mvu54B=U+YCUmbFctj_wXgF5zjeE-BB-vHVnAP+3mPcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, May 04, 2025 at 09:41:36PM +0200, Miguel Ojeda wrote:
> I was thinking of just allowing any expression here. I can see the
> value in printing the values, but it makes it a bit harder to remember
> the comparison and is less flexible -- I can imagine we will have
> other operators being used, or even things that are not tested via an
> operator.

Oh wow yea this could be so much more flexible allowing any expression,
didn't even think of this now my approach feels so naive haha.

> By the way, would it be possible to have the `cfg` attribute inside
> the macro, so that we share the docs and so on? i.e. to make the
> conditional compilation as local as possible even here :)
> 
> i.e. as it is currently done, we can have mistake like not sharing the
> "signature", and the generated docs will not have the actual docs of
> the macro if it is disabled.

I originally thought we couldn't do conditional compilation in macros,
but I'm looking into it now and it seems possible, I'll have to test 
this.

> We could also consider using the `cfg!` macro to force it to be always
> valid code -- not sure about whether we want that in all cases though.
> The standard library does that, though, so perhaps we should do the
> same for consistency. If someone really wants to skip it, they can
> always do it on the caller side.

I do like the idea utilizing the `cfg!` macro, it's cleaner as it 
reduces the empty boilerplate currently required. I do wonder though
could that potentially cause warnings like unreachable code or 
unused variables?
