Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C161F30AD
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433637; cv=none; b=ZiwUSINgSfR/G2wfqeEKYWSa1YUhQqKJKt1OyfnCyCHtZUld0yRHwa8eTq85Ro9JcCyNxN3yMiNAzh2Utcj/SK8s8OYhCW3GhFIjbWjiBMbe5ItjRCRb403937b4VjGDNTaYJNKdPdz4fzvfnLwi9rqsj1q0bZZ7GaUvuf5yfOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433637; c=relaxed/simple;
	bh=M1Zk+r2vtR9x7gUzM+W7az9A5N7EJhF2tRtS5bUi1UA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwMEbfisclic8PKl+PB33h75eY3PAMe0IWwA79s9k5U6+inKTgJ//uqufnGAfv5+nL0D9sVrvz89xt6w86ronehABhQmRd7KjhoaI35EuiNZkXrn1MT6NOqvSIcPg7llt/xpzkMzK2p9KB9qZA8QRgMdwyRR5j05TB03nzxaIt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oa1l0fXx; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oa1l0fXx"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso42744531fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 01:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746433633; x=1747038433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1Zk+r2vtR9x7gUzM+W7az9A5N7EJhF2tRtS5bUi1UA=;
        b=oa1l0fXxRtVC6WMJy112427lQdJHcCcs0iPq8cmZvRLpDzMSa/ihIqhVGD/hWbfMqJ
         iUD6a/sT/uuqE0i5zNfDaZ87Dm/4NYEpkhZBeVBKULArOOGrJbc30JW916ovqi/1JY9u
         kwmK/sMELjysE0SaarRYn18OkgF+NmukL/9i+v3zFz4e0797nddvc1FDJWXjV/0dEr9G
         82PwA9r+T3fLGeHuabwEo8F9dMSBd0yFvR0UvjcItVK7gZHwWqnoRoEJ83IyFWRnfLC8
         i8H96JxnyQ3p2yUF00vQ5dTz55JY4OQym79Ci3YkAFeIKKKKsfyMMuVNTD0ATHI5VlE7
         GLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746433633; x=1747038433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1Zk+r2vtR9x7gUzM+W7az9A5N7EJhF2tRtS5bUi1UA=;
        b=Sq6MN/5BIbruLnbhOjdJ9wZrubuSQ1RBo9fCU/q7L2wwZno0lHMIPATxJegEnsHl2E
         Y5GFo/EcI9DLI5vtplXQ8O7Dd2vgEQlezhgi9V+eO8OGMdPl7K3BgF2FGOrobxEyDeuj
         Ya9tiYhKlrrpJymNq6xYOsQg+6Lq4FJNEcvE5VQIbCk3Hc+7xjQ9a7q1KYeJ2EW9rhjm
         LH944fGundsNMimi6yfgz223W9OLYZjnuQwpI/c5g7ZUd3vhO6wXX4QmYYXirgQJKqjP
         dF9E7rNOrZEciGJrrlF7TceeRI9nSQUegRsBIHzund0MuItC3VSmliIhfImtPQUUqS8I
         B/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVeycCNV9PYyjW0okR7Ev/IEBP5lOv4YHClytRld9HkxyBUUjK9ho9wQkvGuy5719tw/oU0Tlh9Rw8BYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0pvvaTz54FCbYV693nJEg+UFiJ+VKKJLBRAhfy+d2PWB0iWQG
	1cutuINU6LR9NmUPxQwa6NoszqOLRf0lwBvESxcTE+Ll9BkpE0Wq+oQ9v1EArUHFE6G5+ocecW+
	RAepK+tVhEdU2+CrIPoCY4x3/DQ3urwXziN3hGQ==
X-Gm-Gg: ASbGncseEXR0f42srOQJmq6DilD7hJUFbJ/oyDIDOgH/58d5SGYDgNZeCtw06iNUXtW
	NupKJ+XxqaFPyrx0Dr4131mkq3ReH6FbnAi5yD1njDFiFTX0tdJzCaKsyXb3G6t3rprAxh5QUHp
	UUb5s/LFFoc1fs25LstRc8M7eLYTGLVT7PBE1y0wDV10E0F+SJZXpwDzIdqp8IvP0=
X-Google-Smtp-Source: AGHT+IHf7bra6qLd4jFapSMOSkk7uqj4CZmzsxZD4DavOplkgTBB8Z7xFubGMB8Tg6/EHTbecqgT1v/8nBBEIl2rTq4=
X-Received: by 2002:a2e:a98c:0:b0:30b:a8c2:cbd3 with SMTP id
 38308e7fff4ca-32351f2210bmr22839721fa.28.1746433632949; Mon, 05 May 2025
 01:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-must_check-devm_mutex_init-v5-1-92fa4b793c6e@weissschuh.net>
In-Reply-To: <20250505-must_check-devm_mutex_init-v5-1-92fa4b793c6e@weissschuh.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 5 May 2025 10:27:02 +0200
X-Gm-Features: ATxdqUGuj45XYMkp4lg3kcxnY-fvOJikVTLfrsl12t-lLdNfV6dpSGDXb_9DeLo
Message-ID: <CAMRc=MdEUEw7eA7EgbsxBFO2UMBcBhtP6ZdicjDeaJNA1J4UEQ@mail.gmail.com>
Subject: Re: [PATCH v5] locking/mutex: Mark devm_mutex_init() as __must_check
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>, Will Deacon <will@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 10:00=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> Even if it's not critical, the avoidance of checking the error code
> from devm_mutex_init() call today diminishes the point of using the devm
> variant of it. Tomorrow it may even leak something. Enforce all callers
> checking the return value through the compiler.
>
> As devm_mutex_init() itself is a macro, it can not be annotated
> directly. Annotate __devm_mutex_init() instead.
> Unfortunately __must_check/warn_unused_result don't propagate through
> statement expression. So move the statement expression into the argument
> list of the call to __devm_mutex_init() through a helper macro.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

LGTM

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
