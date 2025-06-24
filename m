Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26FC2571B4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750804671; cv=none; b=bxa6MMxzZJmctpt91iqzF6sU5UhWiN3zhrdMZ4aJD9QKXALND2R0JxIXV3be9OIfm5NXnNM6Fe73/q4teI6W+skN9RPAwlPdIbjOJxSQOJyKnUq7Mojl9UPAy17LN4/hkatVp+nUTOq/JOgAohneUf5Iy/5a6U+T++Q4dbrAXlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750804671; c=relaxed/simple;
	bh=yqvkvZZvlS9/bOgEqxYcbtsKWtITOAr79gDOJhHlSdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGvCjCETRsPSbMs92GzQWHufT6258jE9GlcUvkmIfO+b8xZZx6QynKoEHkbjIjuTyaTcxrqWKXiS5RJ2UvlSadvsLpq2/lKdCIGzinP4DYc//GkctPIz87wamwyG9Rhs/sDwlvYXTzErYUbzgukHu7frEL4QoIPgp+gefYRufIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lYszVeyS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lYszVeyS"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso2424a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750804668; x=1751409468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+LTR+yGLGyDG4mNtaRppoEfvrEV+3aBoT+/CzTmxE0=;
        b=lYszVeySNFnimMDm6VzBsCp+jjuKB8Bdl++GDlbUA3uxtDj+Djf/fcV4S58ws/m8wt
         14BMHM6WmB6G5xbMnvNjoH4rMeJjE7LWggWucg6os3tf4i1NbSWMV02JImbYZXOjWybu
         osnYJeywGZZCj9d1ryl0Say+gap60WfS+bWVc04hdiJBbNvWRkR854ZZpL0Y9FwWCRq1
         ZV14kXulNeJhNT2xKI3JtqGv+Gzvh5anz+nsjeWl3shJWdAJWU5mEjHnlRT4lUoh/6RG
         kMX2gmOPs9r4KJhXkSlJKIYuMc4vPy2ZKpmo8KZ9qZzHLWbRYuo9hp7MCWsWdhIqReVz
         9dOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750804668; x=1751409468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+LTR+yGLGyDG4mNtaRppoEfvrEV+3aBoT+/CzTmxE0=;
        b=dOmu33csOXSdhoRooP/5eFVAf9+GCD5rzLoZCe+iKRAYmrowKKnoK2E8GISwnf1W5d
         XvpHKGJVzl3b2tJqqbWv8oAVSKulRc7MFqdMCSWkW0144BA62oihYEUjfqXTYlzpgGA5
         /ejHnT3p7gC/+SsGPAPZukml9CwwM1ZO+EErdCfhQYbiQ2WngrmTQWXot9uxm6rSgQ0b
         QJMuoCcUYCvDXfixQW3DwxK9rIhQ4EzkFfBUFjMYYAJ8O/I9TIG8OV3X+wvXkJAwY7uI
         l5cDCBvFW6sCp9WpjI8eZRm0gDGMX3laQuJi2Kmk3Ws6FomFZgFnVx/7OGJz0Jkil9bk
         4S5w==
X-Gm-Message-State: AOJu0YzDra2GwwV0wolB/waud0JxGHIv/bRr95BN6O9XdPscXr1qwcn8
	4pc0rRifuznpeFA7E4rSoOMT8QQZLp11RcdoS1cONL0dymubM3jSKt7IW+YLNcOVCx5Fc1tuHdS
	U9okpVyhWys/4/PQfC9Onn9HIdza3vCb74QTZry3V
X-Gm-Gg: ASbGncs4w9gsjVl5VZwGVgTRQsrJ6S7LSlP37SaINJjdWlya/KPF6ixmGao60LBUd98
	DLBhwS2W6VV8ZFSu+8c823tf9M01x6bAZbaTq8lCZtEf/zRcwQaeUqHAt/IlitD0fdKeOch0vxY
	oqVlr0zWkKYeVu1c5x4/RvXdY9oQqQITIKjfCVjebYt3U=
X-Google-Smtp-Source: AGHT+IENVZRLEn7PEDj6/WLvBEeRzhLq2UIfYqLVR56owc5IlIdrL2fzNuFAVT2CGwacJMIV98SfSWSfg6sa081HAUI=
X-Received: by 2002:a05:6402:44d6:b0:60c:3b41:6306 with SMTP id
 4fb4d7f45d1cf-60c4fd3ffccmr570a12.7.1750804668109; Tue, 24 Jun 2025 15:37:48
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530185239.2335185-1-jmattson@google.com> <20250530185239.2335185-3-jmattson@google.com>
 <aFsaH97Qxn7nUA86@google.com>
In-Reply-To: <aFsaH97Qxn7nUA86@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 24 Jun 2025 15:37:36 -0700
X-Gm-Features: Ac12FXyBUxK5P-foDM5mpKN6vUellwixIkbV-6MHUnNPTBeC3YvEcmK6uwCkcqw
Message-ID: <CALMp9eTBP5UJZu+++44XXNAn+xOFoBNwHb1JYgbG+EzwH7Uc-Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] KVM: x86: Provide a capability to disable
 APERF/MPERF read intercepts
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 2:35=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> This needs to be rebased on top of the MSR interception rework, which I'v=
e now
> pushed to kvm-x86 next.  Luckily, it's quite painless.  Compile tested on=
ly at
> this point (about to throw it onto metal).
>
> I'd be happy to post a v5 on your behalf (pending your thoughts on my fee=
dback
> to patch 1), unless you want the honors.  The fixup is a wee bit more tha=
n I'm
> comfortable doing on-the-fly.
>
Please do.
