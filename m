Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AF81EDA22
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743626325; cv=none; b=uOwBuPwFszQmXi3Lu7iV7FgGNsRA5Zh71Bh2ybh1ct2NQ9KGAjpCFFQfaCJlTKvGijXZ5V4f+cq7058wPT8k+sGGlRAQWu9e68MlzGHkv6dmQ2cwoTpaLBgwJ4O52hJ42q0etCUGSkZxd9JOWgtBhKYTgiDi7jCMYlITTEy5h8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743626325; c=relaxed/simple;
	bh=/T2pmxRuRYT5dmM8afSa07afxTtwCQy7pymfkWfY2mA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P69X6Tz000fnzFaQuzY/em1wcyxH0KXFPQfkTY9ZL+SyJHobDcxjz5tB6sqWLSpb16jj9meux2KHydl210Wg+WM0Q3PwDJaT9g7/9eYxwDCkriGix6uGAIw5+N7MIJpKt8Q2XmiYcRSKW0LPZxiNlRdjEfVARoF2gfIPaqBxLqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=DR9Imalm; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="DR9Imalm"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e6dee579f38so199675276.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1743626323; x=1744231123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhuc3Y3hp1dqy1B8GUo1mAHuHRbRWFPLzCIoduBmsXk=;
        b=DR9ImalmaLXp8R9dfeDeuvwpamKzX91NUAKDdRYYH3sJBQkRd7UVOw43ICXVClqhhS
         AwpTD0vSszAK+NXzkWJavjk3AV+rfY4pJGVjy6qgICV5l1GLZlx7k5TpnUuUkaPKev8P
         LHJmGM7AGBOTn6h+D1wfVbECODKHYez5TomwpznXCR1d30L+4/aGxsqP7AMGZElDpdPN
         gIvV3FTr+5hb52A8GQaEsLgj2YsriTJD1dWsU2bcxB2NEPrdxiLDUsSn8rg3lB1ttjJC
         1A+qkAcPuvSlvLUncNwpP7fK8+pgaARWSHx8j1Q7XoDXPqjLMe5Lh81eDTmeNNUY0EIP
         oekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743626323; x=1744231123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhuc3Y3hp1dqy1B8GUo1mAHuHRbRWFPLzCIoduBmsXk=;
        b=uKazpHkfhe9clJ5pRqBGJP0jSG3SFvpcCJkg5t2WovVibhUQjunqgtsD9ZR4egN9Uy
         2sac2j+RCVoP2T95aohUa97pulZQWH6VtolrfEy4Y+1yHeEV1rVbeg2fz4NTo8sjl0AB
         SjTg+fnHxzcFW5vQ3Pi2rXsvit2QS8mgDto0ndtgJoEuw+JAUVDAEHNh+nttFsp2om9l
         H24NoC9euB70fuV3MFxAbA87OZ1KyUHFrYDLdraX2JAhSE0yaFHVyoljVJq4RTP5SwHb
         ndJgyY3SoX8zk1kSvJ0iGooNMlbFM9cYTSoKAro95dgZKyUI3cDhh8MYyDNJbl1Bttdw
         ABjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmWJk6TXPnCjC32vH4XbTqgOAzEqZyy4XRFL3vFl/kL72GwbFZRO6qrMRy9TaEgm++BtS9VZAJ9iofL5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7qjLNtqeQ1W/wKTjCyxo8WJjxpgx1/b66wz+LtGKsH4nQlV5j
	+0nwY4P3nfPNWLR+SSahSFfRG7yOnOgIZY4+rrYxLxSYiTUeQ6O30SlEWq8mZiQEhHBHlZfyltq
	P7FHJLPD54Cbtyqak3YZXuogW+y5nMOblHXbj
X-Gm-Gg: ASbGncuZtegAfck8OAqbEfrAgwxnl1Qo4syoIhzV3K3KcdH7SBTXcZ0kwphlMc8Qy4x
	iPiWGiuDLndh9eERZsD4l+o1QfDQvKW48QaMtHiZ0R/q4MWHWnmvfXKVTZqDARUxC6mghpvRNnr
	c9X1TxxtcIGx/kWQfwAzOuClCryg==
X-Google-Smtp-Source: AGHT+IFHjJsKKyqKBvb9el7hYxrLzC+Gwwmb3s7tqGC6agBs4p5NAHg8LnYnKViFVGx9xCuT5y4YM4gD9uoG2SB3AwU=
X-Received: by 2002:a05:6902:2681:b0:e6d:ee69:dd3f with SMTP id
 3f1490d57ef6-e6e0a0ffb22mr170729276.5.1743626322975; Wed, 02 Apr 2025
 13:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d0ade43454dee9c00689f03e8d9bd32a@paul-moore.com>
 <CAHk-=wjbahY4JjLCXNT4o3xVq2cejqBG69z+MNfHsN9FQBnbOw@mail.gmail.com>
 <CAHC9VhRExVqdhHqs0njs7NY6bFg0BfcE-gMpS30HW9O7MSDfWQ@mail.gmail.com>
 <CAHk-=wi9m8-_3cywQCohJQEQtuQ+teS4gOtBkWZrhFWzNy-5_A@mail.gmail.com>
 <CAHC9VhT3D7X=4SpO5xbYm=JUwJqTa7tn=J6QMDBV96c7VBUw4g@mail.gmail.com>
 <CAHk-=wiH3hoPTxX3=xTRzRuCwktf3pNzFWP45-x6AwoVAjUsUQ@mail.gmail.com>
 <CAHC9VhT5G6W7g9pB3VM6W7wCEJjWfYSUWNgWF+rRiQ4ZQbGMEQ@mail.gmail.com>
 <CAHk-=whwQhJtafHN4B1w-z2Gno__xLHS4NouKKHrYNTYa8kz3g@mail.gmail.com>
 <CA+zpnLeK2Ecj1mBod2rFe4ymd9eXiJkbyYwFh4Yrmck3DVB2SA@mail.gmail.com>
 <CAHk-=wiBH8FBL+pnXui8O-FSdyoG-yX81mUF9bsZcC6rR5ZtgQ@mail.gmail.com>
 <CA+zpnLe_AOpS_F1UBNOvN3YRswUSy_3=0jjUAy4GPxEHYumD0g@mail.gmail.com>
 <CAHk-=wgJ0gzYJD+MghfVW-YeGLW6sLU5soFY13KWmPAxobk5Mw@mail.gmail.com>
 <CABXk95AqgpqGtjzK2o=mxWJg5RUZG80dAEaKF9JdUT6n5eFENQ@mail.gmail.com>
 <CAHk-=wh1refm6JkAB__TmC8OBJyNdH2DmNQAbvcL=tKepkHrYw@mail.gmail.com>
 <CAEjxPJ6XnBmbzH44YVQxxv8WOyPN7N81fpj7OYonEOTB=rn6wg@mail.gmail.com>
 <CAHk-=wguzgJu4p_khuEXKHmh-6abSN7xLJdCTuyVEfjsopY7iQ@mail.gmail.com>
 <CAHk-=wh4H3j3TYWn6KSgznUsOXz8vfHMOfTNmFvjGr=hwULWsw@mail.gmail.com>
 <CAEjxPJ4fzoONpiy3z8QOZ55w35=WfWQ+hiTg24LMEHPpnaC87Q@mail.gmail.com>
 <CAHk-=wjbSRL7LM7CvckB+goQdUokMa_6G-iirdbtxrFSFe3mfA@mail.gmail.com>
 <CAEjxPJ4Np-_LeSQOPxRQggZjWxpJRhZm++XuEwNbMyUkZCvYjw@mail.gmail.com> <CAHC9VhS9xYg5_EaX83hyNX4EMr=c4EaDZ7N=+opv6BA6iZo+mg@mail.gmail.com>
In-Reply-To: <CAHC9VhS9xYg5_EaX83hyNX4EMr=c4EaDZ7N=+opv6BA6iZo+mg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 2 Apr 2025 16:38:31 -0400
X-Gm-Features: ATxdqUFyEHJS9PY6K5iY-ZrkT1ocLYPu6GuqP6AaEak7oZcZydsPhJOMs8z_xUM
Message-ID: <CAHC9VhSpYBxkGxL0r-58q8-+CcX6tQxQeqmn0T1NNiDGXo=0DA@mail.gmail.com>
Subject: Re: [GIT PULL] selinux/selinux-pr-20250323
To: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jeffrey Vander Stoep <jeffv@google.com>, 
	=?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	"Cameron K. Williams" <ckwilliams.work@gmail.com>, "Kipp N. Davis" <kippndavis.work@gmx.com>, 
	selinux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Kralevich <nnk@google.com>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 11:06=E2=80=AFAM Paul Moore <paul@paul-moore.com> w=
rote:
>
> ... I do have some other ideas that should
> allow us to drop the bulk of the SELinux AVC calls while doing path
> walks that I'm going to try today/soon.  I'll obviously report back if
> it works out.

For those who are interested, here is a link to the patch that
demonstrates what I was talking about earlier, with some performance
measurements using allmodconfig on Linux v6.14.

https://lore.kernel.org/selinux/20250402203052.237444-2-paul@paul-moore.com

--=20
paul-moore.com
