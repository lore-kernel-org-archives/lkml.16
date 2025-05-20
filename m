Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F0825DB1C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747767960; cv=none; b=AxufXXou8tUUnUKCSKKWrq9YUS3oSsP5zfbfaHvpBmoPvhzooruheNkPfsR6jidHpJJUsvGwC3zEbKob4zhUyFta54JStMGDiKlWQaZrpGpC8ZNiOtfCyYtpkZs0tHA71ddFvlSJGxXhSlTNWd86sEtNQtx+FzuAo1uWuJjDoLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747767960; c=relaxed/simple;
	bh=43bmD7mHFNYmUiQi6vbJY157cjm0h/yt/bIfQ57VGC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0YCtcVFjdfJ7+9ALW+qcVX/vrbnUIF+e44/NBjJzWf+9psuyXVn5Z0bTWrDuex4cwj5FzRNEC3+iwMA8HgY9ZsYZwCCknARovRHpxtOGuySfXN8WUbEV6cQp/3C3jNVRjEAB/wS3jktPXlbj5FT4HxPv1nA47wUgzrt+aS6EWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFLEsI/Q; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFLEsI/Q"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231ba912ba1so5574575ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747767958; x=1748372758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43bmD7mHFNYmUiQi6vbJY157cjm0h/yt/bIfQ57VGC4=;
        b=kFLEsI/QG+CpYTSudL/17MhTHMX8lzTctLA1NWZsLcid6UU8t0COgIfRbfjNUpVEto
         5ymjqnpaFPiZ8Up4RWQxMM6yJQxdxPzhEg4t7oVWhxFG/d5D9dqNR+j07alrP1ia6KCG
         9w7D0+QKYsN1UJzwpvG4qM1pEMKcCZBWmPVS3p1b6gDIpNXJBS4HyikzP791x/KgyUpM
         5wZnQksqHWFgkjc276HscfRTKgXXCPu/ESsbRUw6yU4NvgoDZhAXcE5bU2qRSRy+9N4N
         iC9EZGQMR/Av+RwW24I7Iek8iFMRWooODVoUz89ubwyhqQmj4+XyFn21bvhZFBhFLsaT
         yVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747767958; x=1748372758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43bmD7mHFNYmUiQi6vbJY157cjm0h/yt/bIfQ57VGC4=;
        b=XOJJweSmsDQrHWRT3ONJO/ImOaWPOAKLrD5RacQNFTM8sCDPv1ui8crsn6O7qIDy2r
         mcMkr1huj5w9+DQPxBf7R4QEUMn3IHqCKNiH2YwbCV9R+wLy14sDuOVu4oXrlpitWp7K
         H9osMtxct5EEJt+lD3c9C79PLMJTW9c3Ok0o36QBQj9lz6rZQeJZSphx3is8HnwKPljB
         VyTlyOl3mPKsqBpcCazyytWmlj2FuW5Q4ffkCoLswoF3AXpuaTjioBNv9Go46+anJloo
         b3+BE7X2J+3bWS8tGu+//YrkTpV3CB9/ukAMM0UMsuMN1VvKs1RmoCvyZEWr5yWCkfCi
         rTjA==
X-Forwarded-Encrypted: i=1; AJvYcCXxO1qfAAMi6NgJLo36TaY+Dv16j17Mv7QMLgSGDEYaKYG+sYNWOJUglT1YTDJpFMYWzz1VJMhL+Grw1pY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoXiu3e08zAIQUIsttAxtOiPGAwXoKnS+5g433JKxo8xipmlD0
	GEX1ezIk2pYgvrTa51xVD2u0V9ZOuSQp/yiMxIk0l4Xy9rK4hbgUqfFFNSqXrey7sd/qfiTeMMc
	b6jYFEGablTwU1JB+Nb4Bqgm+bhtkDOw=
X-Gm-Gg: ASbGnctbbBTbb8lNjyfqo4IhfdgI7zV90Xx81l/AN5oFyotRdSk7QiDkZz+ZsGLMlPv
	QlTGCL/R/+MNjJagpdFann+FueoNoxhWsdXFQTuRCKuLOuIZcKqS9HFds4e0T/LN8P9wqG06M/j
	fGq50YnJq2z27E/ryd/VHUa6S7LBtq/NL5
X-Google-Smtp-Source: AGHT+IG2wm9/NZvxACTJ6e77x+OgL20H5qaU+yjzTx5/knRlF5hFHybG1enNtB3KLpEw6+LHkwNeVttNsCTzr7y2Bow=
X-Received: by 2002:a17:902:f791:b0:216:3dd1:5460 with SMTP id
 d9443c01a7336-231d437f031mr88495715ad.2.1747767958440; Tue, 20 May 2025
 12:05:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519175752.GA1041767@ax162>
In-Reply-To: <20250519175752.GA1041767@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 May 2025 21:05:45 +0200
X-Gm-Features: AX0GCFtrFY53UQEtkPuStb_FqRaQAKD8DfZGt-5G4wjY_Jtb6rmYtaS6kaUlUmo
Message-ID: <CANiq72mQihFoZBhoCYhm_DXQnt_-MWw5dcq2k8pp=+DgSN-E2A@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.5 uploaded (and a note about older toolchains)
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 7:57=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 20.1.5 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

Works for Rust:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
