Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2461B275845
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377336; cv=none; b=DeyHeRg+dzM3VuaGLYy5UM5khPe8aYTNGjsYyctgmjGIIDh2j/XVq1dwhhSsf4kSrXQS4ccEV3FxOG+vgBAY6gWXCC0gF1LOSNaYqH3NYNXA8TTZvjy4nUjsHgC3f2XG3M59lzsPN+vU6G16gJ4/LeoeqTkqNlZQZ79O8hvceRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377336; c=relaxed/simple;
	bh=l53+up7iBS1qHbvga47bs+kjEPQBMaO+IwNLLfxJzHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zs3qviEttahx7Lgtoe/2gI0twB7/O0B+xJ6bbGPTOAMy5ZnwYByEouCLIYnFzbz+w+gtaVOYGUbH/q7UD2TjOjCES9XNY8brGChIGXiHqMECirCcReAeWcgh7zWwMo2MCmnvPgrJsTVmNtBImu3KkBvXztspa++2k58rR0QWL7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cn+EjoAq; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cn+EjoAq"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so9328a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 06:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751377333; x=1751982133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l53+up7iBS1qHbvga47bs+kjEPQBMaO+IwNLLfxJzHo=;
        b=Cn+EjoAqBbrDKOfHp5fqDsV8kEgPUGw285JhOjZ8uP/7i0GbWrbUpgLNlLW34DtA4q
         MTJ6FlH0sXf54PZREy6eLHI/ihyM63WmqVu/5uauEPoojPr52i9n+o5OOevidosts15h
         2zplKgeEc32bX7p0t01+roQ5cVe+28Cd0MSgaNTGLGE3INRPizQZVm2KfZkQE/8lF6Go
         SaD13qUc9LOLkF0DOxeXlZpAqPAH9Jc3TMyyXNrcbtS8AINT3Q1yiKltsHXoWODJwqNe
         2hel1RQ7ruaQILFo47Zo+jKo05d6DYp+JX/BS0uK0e7jAmckYNYP7cxgBw8Dfp16MFKp
         HDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377333; x=1751982133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l53+up7iBS1qHbvga47bs+kjEPQBMaO+IwNLLfxJzHo=;
        b=igWbcR4CiWJRF6OSeWpKdb+OHfB8U0mpBcHYYVBgqeUcHTdxzUOZnnNjFFKNb6Qa4Q
         G6tE+OiVXqYyiOEPM5rL2RUQWubK7fS3OPS0DCeY4wDrfoxlg3DpVJIvjhfJF67nff0q
         N4iUfDWOIKzyt3Lcr3bUyKZabbSprxh/r+1e39xFlg7N46/1ypygTaN0G83OhjiZpekx
         Pvdkvv2k34i/9NLXjHCTCK54mP7z84za0yHQE2pZfnnrNzKsx185uHpSmId0G4XEUvLF
         hGDhA4cFLJXJPgAvEz5V/jopuANJSnL8tDnRGC1IfX2PXupsFLPQhWRuip3qhkB7nXqv
         miUw==
X-Forwarded-Encrypted: i=1; AJvYcCXPmLAbLzJY9ABYR5lW3iNTYZwloNrSgocb7oN89sOsqjWvxBE3Npr9WSNdlZ3t6ttjEDoejI+V8KLoIPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzECKkuUXCXfENwjbbECgE0pOgOyiVKIbXgD+/7RaemDwmYaRPu
	/zhDN51KomVeph2xu9hT1abHbWFQfbV0lduNZOgfT2HrsTHRQCUuPmzHuzYb4oVPi91dCXcWjMu
	5Dc+jKR73/d7jN2EqQ2d+CcZvRXlDhIPYxK3zgctX
X-Gm-Gg: ASbGnctyffB07NuhbgbzvPfkjl63fgP2bHpxnpca6PbWgklytM3o+UmbrOswSfU6N1d
	MHKtE9gokl6EVHc58tKEfoe6Hpl2U53GjRgMenKFdVMF0lBT3PMczfGuZeRzR0H/lWA/FPn8Ok6
	wRzfgMAt71dXhsauhbTw/CQXauOLk6Y3B4HA/a3oAMMibSm8njcLWn8DDzG9vfHcvSYzaPi7Mqs
	VcdC8fMaw==
X-Google-Smtp-Source: AGHT+IG8i4Y7S9H/asInCH7TGD9/vuiOqqrIhQdHNEBY4YIe1hmb0pRdeOhNZmNhr9/Rh8lPWDairwcma09YPdiesMs=
X-Received: by 2002:aa7:c342:0:b0:608:fb55:bf12 with SMTP id
 4fb4d7f45d1cf-60e38a44816mr71027a12.4.1751377333023; Tue, 01 Jul 2025
 06:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628234034.work.800-kees@kernel.org>
In-Reply-To: <20250628234034.work.800-kees@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 1 Jul 2025 15:41:35 +0200
X-Gm-Features: Ac12FXwCp_bfivLffFtsPlz6EADiU4bpUi0pVVqVqpSbuvTlWBItorTjM1ha8VM
Message-ID: <CAG48ez0n1E0iuOxPe=jq4MuuP3w2wMSNixmfNmBbB89jyJBSbA@mail.gmail.com>
Subject: Re: [PATCH] kunit/fortify: Add back "volatile" for sizeof() constants
To: Kees Cook <kees@kernel.org>
Cc: =?UTF-8?Q?Jannik_Gl=C3=BCckert?= <jannik.glueckert@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 1:40=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
> It seems the Clang can see through OPTIMIZER_HIDE_VAR when the constant
> is coming from sizeof.

Wait, what? That sounds extremely implausible/broken to me.

https://godbolt.org/z/ndeP5chcb also suggests that clang does not
generally "see through OPTIMIZER_HIDE_VAR when the constant is coming
from sizeof".

Do you have a minimal reproducer of what you're talking about?
