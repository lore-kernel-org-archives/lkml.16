Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37081191
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819251; cv=none; b=C2aOZWiEPj0cmmZ1MN1QE4OFBR3bwClPgO7ziP3rQ74MiYfQWCp1sM7jtkXay03sW1PpHAHp9JNX5//oLIIAVym+MKLkSdzPFyyErQXUJlzKnrzf79EdWSdP+qMX3eW8aOZ5meMi9FXmQeE9GEi1Vzy3rcec0if1Emm/wbSthlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819251; c=relaxed/simple;
	bh=OQ2LUVURG5ZBoCwWh5loGiUwdSTfHuVc1849YbckkqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdyJeMzt0DK5GnuYrT+gcyHmCAmp2GxF0hv2EaDyGFcjJG7DY8xANmcLPKZQVguq7OIp577IGC9tKibpssC1GgQFWaeGp9b7QzM2Y/9v4zu/P59z8em2SBCbx3yvwvnJ5vqEW9fjDL1PLvkE7EE9VR4404lDhgJQLuAYgcwOPNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ceJY0ajc; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ceJY0ajc"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so6364988e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744819248; x=1745424048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBPmcg0bFH2XY3Hin8L4B6RZDr/nTgPQCfRGMZTM/dg=;
        b=ceJY0ajcpp4Etwtg/oRJQk7GiAqywh6FqfWax9RM6aOqARUGEnt1SyS4osZjvEebcO
         S3Uc/Vd7j2Ujy9gXs87Qer/GFW0/C7rdE/cLOsVyRIKcDSxwaeV0Ygqvlf2JrMOd59br
         Q9da2Oq5TZXBUk2wENpmLSlwtySz5sEe5k3SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819248; x=1745424048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBPmcg0bFH2XY3Hin8L4B6RZDr/nTgPQCfRGMZTM/dg=;
        b=WMBTV9/0zohVMPA//QWA/sqvvPfPUi9+a6UEGp4sNhT48FK1Mh8CdjwuNiw+DSJ2yZ
         36gYBxl9IESmG78RyJV6XekEuwfUaL0Z+5Jl7SPL6zQ4kDGzhbbO8xVC8Nckl6zSZzpX
         ZqH5EX8ag8zxx7N44KW5eeFK/Dos5bP919NMfdisvoQ3EyHVGEiD01IDndW9d1xrHtDx
         2TTlgCckFd7AAnS20Tmt+prBO+nFJa4Hrknsc+sJ30YPIfl4BJjuGJgdlmV41cvg8p0s
         F86ElHSQXvxejHLewFaHPr4Seipo5NHtrHa1gqRR9jgYtTF3OGO4YO0lOPDt9mzkDqLM
         2YLg==
X-Forwarded-Encrypted: i=1; AJvYcCVCv00I1uu1Sx23ZAyFcan1hbY18r+E/ghBEIeCvXrywyZ3nCae865XYccQZnsOpgcW4wjfs8md0NRC7Y0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr0RrFoLv9NsEe91sljSi0RvwXd5GQyQ1o3Ou5JQdwl1ejYLwS
	z3K4eIkC8ZyScEEYBI1RE9EFVCKakkOp53ZF8CZmqEkuGLGblcfkHVZaG4KlR/+ArKLk4eEr0mx
	Oo8kv3CbStehnMRA7W6cjeHJrYlO2jHlwrt8/
X-Gm-Gg: ASbGncslhzHd+svsftmRkRhiR4uh1/r999XDZig/Bdb4Y1TSajCbgAtgiT2ULUVXfbu
	XAtwqSTa19FQQX/e4Z9qaNQsVpTfH43tLphhegHu5qUPG0Wca/iIHVU4RcPgjXe72eXFRzi0+e/
	YCGg/vj8FehTyOkBOjQiuA/4UaRqJGOc7B
X-Google-Smtp-Source: AGHT+IFlK7R096/+OAh92R+N0wIujqmp0uU3OFtKyNa2K1gFmEshtOax20fuvbKOa8HxCYGz77KZC4LpcqUinUZDXA8=
X-Received: by 2002:a05:6512:1090:b0:549:912a:d051 with SMTP id
 2adb3069b0e04-54d64798c06mr830233e87.0.1744819248030; Wed, 16 Apr 2025
 09:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415071017.3261009-1-dualli@chromium.org> <20250415071017.3261009-2-dualli@chromium.org>
 <69763528-bb00-44c5-a3ce-8c30530b29ee@schaufler-ca.com>
In-Reply-To: <69763528-bb00-44c5-a3ce-8c30530b29ee@schaufler-ca.com>
From: Li Li <dualli@chromium.org>
Date: Wed, 16 Apr 2025 09:00:36 -0700
X-Gm-Features: ATxdqUEvTcc4Mrcasz-DJMu04qcEN1mqV4hfHibSLmGFJSE6dIDY98ewYmt9cyM
Message-ID: <CANBPYPgfW+3jeTPZmpHfkgr=hX8sRkMLgrEeLFYa6rOPftXeFg@mail.gmail.com>
Subject: Re: [PATCH v17 1/3] lsm, selinux: Add setup_report permission to binder
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	donald.hunter@gmail.com, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, maco@android.com, joel@joelfernandes.org, 
	brauner@kernel.org, cmllamas@google.com, surenb@google.com, 
	omosnace@redhat.com, shuah@kernel.org, arnd@arndb.de, masahiroy@kernel.org, 
	bagasdotme@gmail.com, horms@kernel.org, tweek@google.com, paul@paul-moore.com, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, selinux@vger.kernel.org, hridya@google.com, 
	smoreland@google.com, ynaffit@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Casey! I'll resend this specific patch to linux-security-module l=
ist.

Should I include the other 2 binder patches as well as they are using
this new permission?

On Tue, Apr 15, 2025 at 9:13=E2=80=AFAM Casey Schaufler <casey@schaufler-ca=
.com> wrote:
>
> On 4/15/2025 12:10 AM, Li Li wrote:
> > From: Thi=C3=A9baud Weksteen <tweek@google.com>
> >
> > Introduce a new permission "setup_report" to the "binder" class.
> > This persmission controls the ability to set up the binder generic
> > netlink driver to report certain binder transactions.
> >
> > Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
> > Signed-off-by: Li Li <dualli@google.com>
> > ---
> >  include/linux/lsm_hook_defs.h       |  1 +
> >  include/linux/security.h            |  6 ++++++
> >  security/security.c                 | 13 +++++++++++++
>
> This patch needs to be sent to the linux-security-module list.
>
