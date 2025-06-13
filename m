Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEA4221555;
	Fri, 13 Jun 2025 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829890; cv=none; b=TdGY+F7hHLx6WMAsaLw8sa7w+rIGmYcMVwtD9lCbL1Us51GGdVbrjNn/6eX4vo/XWdejBCYwdKn7nEOvZpPVnX0shiDIYoHhYds4pnRP9ntvUtlcEQINP7/7GVopRhaRucl+BY82s2BytoS2iGHDEbJ/9Obl/70XTkyUsBJ2CX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829890; c=relaxed/simple;
	bh=c4wwjySIvlE7LwxsLOn8GKJp5V2/5xXu72WI0PKQ4k8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CnWz+TKJfjqwf7ACYcxtJ0Y4wWEbQ4rWopUyKSoLZdfo7bzY5BJK0FmWUdDK/wMyZ4n5DgUUHAgDAlBrarkAW7O35C/7vV65wPUFXEy0Worioe6oznWRFnvLQjXFJOiSoV/KXQ8wfaNqP6kZpb2ihm0dU4vt5PzfnQ9NUzM07JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxxZf7BT; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxxZf7BT"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2363bd24891so2817995ad.3;
        Fri, 13 Jun 2025 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829888; x=1750434688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4wwjySIvlE7LwxsLOn8GKJp5V2/5xXu72WI0PKQ4k8=;
        b=UxxZf7BT6Hox1Qnw+4qO+R2ooJaXbGG3SwbGvREoNEkQzwABmHOlNwl0NcW1VsMlVq
         2tSXPsALPwrKTfgD1UdlwTyQMjcGvLSh9EKJsHw9kYnfRrKaIpzxEDpnK3e4HJ2ETyeB
         UIR0jSM7/Qk+/keht53zsVN7/ppFxT/hFMnyAiqzJsLacsJneBkTSegeTTISoY0g+u2g
         fOyCyd03hXPYwGSpgxFXsbw5sDPslOAktSiQQEYOZr5gXCO6IWoUXKNdeoeW8fUYeOXt
         Nrg4SsB3KXu8T9smWoxAo3roKLxbnNZ4/KWIkbkXL8OKn+gpJxIMWjXwWqPv5zgmejaE
         Pjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829888; x=1750434688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4wwjySIvlE7LwxsLOn8GKJp5V2/5xXu72WI0PKQ4k8=;
        b=vxtOTbF0ELoq8yviLmH3B3BH0s9EbFW/8yKCjZhqElARfpt8/7Cubqw41jcvtcDVkQ
         sH3qPQFsARqRN9yVUQ/YSlZ5HU9y3yLp4otRmWmHcxRzt0d4zPaErtJyoeoo/Jwk21F4
         IgGaxexaMGOFwZkwcertMxcb18WBMlUQQuVOQCFfrz6m82NKV3tZ1txC0i9fhWgFpjug
         cZ5j5PCckNZgGEU5vbJNbtoNJdmTRwiqXHbzpNcs4k56lpr9iZzFS7oxaeoIpooDdmW5
         8kY//FdR/39rybT6hfU0Bw/kg3m65OcXvT44rEFCnwRh9pYC9QyuaEABwULcKUOBn598
         WeZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW2lqRuG/IPORfBf27OhLy0Zw/JuhWyhJFdjKIa4o9XOp5FVYB647Nq/MMyqrK7V0mZZC1fpZjMQ9187k=@vger.kernel.org, AJvYcCUowynwehk5mZ65h1Dw6GxbBuzyiKkgt9VTXdFveMD8iW8jafNzda/yPH0xGSRagZBYtJPG0m/MwLvmgfEpPXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfKZzYkWWB/TkXguUZZJXHINtNTfsb6RqrGQoNV/N8eqEgRvp5
	XlYnhhUw4iWLVWsofemC1dmIIp/mfX1qAMIkr9mgH8Iv2IuimmiplFBxLqjKqaVN2mkLLH35YTB
	WN+ZlMZ6c66pL2RsDIJiBKfH2Sl86xM4=
X-Gm-Gg: ASbGnct1tTD5Gz/UnZs5DGGD+jNZ6w9htTJswvqmylj3dj1ww/xUwTJ7oRUexmj0DqX
	AuL80XY2481mskNSofRZkGNJDltP0344h0db1/dW5sGn+RZBhmtG8V5Qgnug9nh0UHRoMGsCVEE
	1X9RD1I7lY9NLjYWKNB0KdKRoLw9kjHKW12XHBDh5a8ZQ=
X-Google-Smtp-Source: AGHT+IHcPHYF94iRui/o4iCfw3hVlEAnn10MC+QUOtJfKBbbEt+l8sh4CVj6CXIMMJyZzu080k4/5V0scs/4oVMDiWM=
X-Received: by 2002:a17:902:d2c5:b0:234:ef42:5d52 with SMTP id
 d9443c01a7336-2366b202b0fmr133035ad.6.1749829887880; Fri, 13 Jun 2025
 08:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612121817.1621-1-dakr@kernel.org> <20250612121817.1621-2-dakr@kernel.org>
In-Reply-To: <20250612121817.1621-2-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Jun 2025 17:51:15 +0200
X-Gm-Features: AX0GCFuyedTR1iv9KApMX6o7VMeHD0a1tKeFY0C-NXSDraSK_3YKR9RF1Z2Lr0I
Message-ID: <CANiq72kpiGQCs=XJjqZn8pgXaRXfKxopGBvGVwOXn91Nit-W8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: completion: implement initial abstraction
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 2:18=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Implement a minimal abstraction for the completion synchronization
> primitive.
>
> This initial abstraction only adds complete_all() and
> wait_for_completion(), since that is what is required for the subsequent
> Devres patch.
>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

This is part of a fix, so it is a bit of an edge case, but it is just
the bits Danilo needs, so as long as nobody in the Cc list above
complains:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

> +/// The [`Completion`] synchronization primitive signales when a certain=
 task has been completed by

signals

Cheers,
Miguel
