Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FF91A254C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738964581; cv=none; b=Ytty7bSG5CowIs6KkPwIMvKl31hBTkYaLGPfXzVfLZ+STGXiUd8SF38LDymVrtHXg+fLEINuhJBpAhpBDCxIV7rY2kRlzzgGLK8p1LpzgLs4I7dfFtR/oU6JLwFnZeafpa7iYlzLJToeQxJDVuOuJwAruP6Nq7FWAascX4CTn0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738964581; c=relaxed/simple;
	bh=YY45Gnycd+3o7hKOW8C8JWYriuERUUgTq475FPmCvGI=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=OlAlDCdrS6UXnvIau54TwncJ8anbXJ7HjNH2M5XVpYCHtchJNmpdK2mg6yBy8Qdh7Dc0+u5uj/0RpZZmODjyK4q/VhIm5ZAilOLeIlhJf6VBiH7b5x5cpGO+vWs6a00H2gkdDn0Jvxe9ssCfzg9Z7JNASu4lcBnuciAm5aIEdm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=U3lj2Y/H; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="U3lj2Y/H"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e45258610bso83116d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 13:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1738964578; x=1739569378; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvI4JoqoZo9YGBOkVNl+HIo1GyCi9K0UiyKNezQvlcg=;
        b=U3lj2Y/Hx5rw231y8IvfEZA+lYWKI2a/kzxlcQ8vJa/yp7+fGbyE40xukdNfaPhLBS
         eyeDnWgB5AA8dq9i/vKzwxnC9ODoz6u7VLzacFdmcaG5qP9mSgTEd/+akTpspOncMGuB
         eGO4GX9HdY7HcVy7hLgPRbXbexsqMMXVGXE3kNBNBI2wkNY6ApWORKUc1VjMhyX9ewfa
         AjWGpToEHycw8wORMj1lwuSUk17dnep90bRZD8M+Nhobnvrzm0sp4yMdyN3TuAYupkbU
         imjbUreNvBUyeHuWItTJeMTj8mBBy+8jETR8lPzeBfbDVpJ9TttR5w/t47qQFv6iVTj3
         A9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738964578; x=1739569378;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IvI4JoqoZo9YGBOkVNl+HIo1GyCi9K0UiyKNezQvlcg=;
        b=tAiG5Bvvnba33m4NlWS2WKKOJUhMOX8o2ivY+21O/N2gTbde8h7EloAkOgZshugFih
         YlbT1V3fjU8wPi+MCoPNpHDiHz7uevzPmo7Zsl7wkSHpHgGFr4zXfUqa3sYYZ3+kQdac
         ObBpQhfKjV29+GMOb1WGDEFjrFfNUNMKBc0hO4blvlbCgrlMlP1vde+F3xUHKWmYi9mv
         jhzUmpx0D0LsiUbsZQ+DpfhwwABDSbk2hFSiK0GWipxAlVu9V+dI3vg+mt3hTEv+oJO7
         zIJjuPoOXJiTCmCmYDEZ7p6P24BaLQf91fe9K9fZVg32hkUjiq1jMuO2xw21JT2gmP15
         mqyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuQMm8c5qc4HQ+ouoY6YTE97lRGvNUPgxIitbU2Lc/Re2/50LbMUqbMBgho14UatGvkvRw3lBMYAPxujU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmfteStmbbNTYetCne51F5psS7nGpG/x1/nUik4lTkBhjQcwgM
	l+K2EKjUNx9u3DV4UbBxqIVoiNwDNk1d7Lrj4SxhjJDcgFwC/qxaoh6vzi0Dxg==
X-Gm-Gg: ASbGncsRqnWYYlmWPPfa+qLFk8tnc0KfOmy1XQabChu1yu9asaD19Sk+CyOWc7zC3rd
	aFt9OeNK7z/To0nGtsu2pCUhEfnfyPuAj94Yz1WbplI05b9XF9XVOoZhcZI0B7jFymHnfE3fgpM
	sNCk5Uj8XbHhdEXDEG97fwC/bcZ/KUYUi/Rg1DIORBRJS2c1Jfw+yAt93E+avCtZF7TSmq/53r7
	K5TIE4Tvp/bYD9Hzx6qCtaPcDnImu+/pTfZEAP3UuoxictcPcOxNY+kr+gzcm1/GWFioP6bFIRz
	z8EqdkvDlg==
X-Google-Smtp-Source: AGHT+IFs+6UcZosHd2iDR62Ugi6tG8vmQY7p/Mreyxu8ihzV+H08wfaEH+7KqK5h9qrbMMnVoHlMRw==
X-Received: by 2002:a05:6214:21c9:b0:6e4:2479:d59b with SMTP id 6a1803df08f44-6e445a1f182mr86494526d6.16.1738964578659;
        Fri, 07 Feb 2025 13:42:58 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e44b159663sm8220186d6.100.2025.02.07.13.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:42:58 -0800 (PST)
Date: Fri, 07 Feb 2025 16:42:57 -0500
Message-ID: <a4541fab007858c599aed1d1e3e98883@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250207_1530/pstg-lib:20250207_1633/pstg-pwork:20250207_1530
From: Paul Moore <paul@paul-moore.com>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, linux-kernel@vger.kernel.org
Cc: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-security-module@vger.kernel.org, io-uring@vger.kernel.org, selinux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] lsm,io_uring: add LSM hooks for io_uring_setup()
References: <20250127155723.67711-2-hamzamahfooz@linux.microsoft.com>
In-Reply-To: <20250127155723.67711-2-hamzamahfooz@linux.microsoft.com>

On Jan 27, 2025 Hamza Mahfooz <hamzamahfooz@linux.microsoft.com> wrote:
> 
> It is desirable to allow LSM to configure accessibility to io_uring
> because it is a coarse yet very simple way to restrict access to it. So,
> add an LSM for io_uring_allowed() to guard access to io_uring.
> 
> Cc: Paul Moore <paul@paul-moore.com>
> Signed-off-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
> ---
>  include/linux/lsm_hook_defs.h       |  1 +
>  include/linux/security.h            |  5 +++++
>  io_uring/io_uring.c                 |  2 +-
>  security/security.c                 | 12 ++++++++++++
>  security/selinux/hooks.c            | 14 ++++++++++++++
>  security/selinux/include/classmap.h |  2 +-
>  6 files changed, 34 insertions(+), 2 deletions(-)

Thanks Hamza, this looks good to me, but we need to wait until we get an
ACK from Jens on path 1/2; he's pretty responsive so I don't think we'll
have to wait too long.

As far as the return/label issue in patch 1/2, as long as there are no
other issues, and you are okay with the change, I can fix that up when
merging your patches.

--
paul-moore.com
