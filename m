Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352EF26B2A9
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807568; cv=none; b=Ic9nSeSaj5VtoCmxb8U5E/ilF+KcYP4M4OAa24rTWvVOTefA7AMykvIJRHoHZ2Mf1T7iLUygplnJFltwga+tcRI6iGPBUFLKHGd4dyL0PFpeKtonKSK8b6YVjw0LDsWoxFbBQS/+ZI56Am56lss5jIUsuPNkwMzlSlZxpkmAl7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807568; c=relaxed/simple;
	bh=tlQ5FvOMjbX6Z8YhpXnrzKrOO8FlQxeVzUe9JhzvgiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxxuXgyumG+XUgQn07lQLgiOFPt1X8Zr3r8/yW4rxr8+SOG7YuOwhZ9/ekbKKmehnjQ9R+Ps0CFMGmcT9HP9QYtNY/gDrIQgclRXEE8iXFUGAQrpAp4ocsu1COBzOOWEliIOlN6U5aWEvVu8DVJNV498YF9qTde0QqYxQ7AbgYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=QJerJa5X; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="QJerJa5X"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-714066c7bbbso3306577b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1750807564; x=1751412364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5KAAp0hg3rI6FMNaXq3I4//0zQjQR1hKb9wxZe7KLQ=;
        b=QJerJa5XSXpX3z0qka1G2FdLIn5C2XLSIGsFBFpTEPkIlUdx++9GV2e4VuXWCszTJA
         9AGXX4NLoP7/U4t1JjJjVvI/tYOBxNsCWJkebJqYyAaXbCZ7ofjYXhqMJNyVPqs2FHMk
         JWoK18nalzr6WA76/MEaLPvgsfjRhT88cWmLrihb122RGbDk9q+aWzdfETbdXVyM3kky
         wlbGzGa0u2QXWKf8vp1jr7b4MNHZ2Vv06SMDH0t3LprWg66xvmBM9lJK1mLF2EBTT2e/
         4J2lobOmCGiTlaRPgrKstWYWCl3BlIvC9Cqm5bClMPGWUPS1jZ7Rp78WBRTBTHM8Ke0C
         Yk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750807564; x=1751412364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5KAAp0hg3rI6FMNaXq3I4//0zQjQR1hKb9wxZe7KLQ=;
        b=nB8CIp+rZuwOnfEizmqU2EoO7FxxpB6RvEqv/IL9bCX3k55YlyRNI1NIzUWt6c5uAw
         bemTWewpAgNUuwEk+rloMiQtMVoI+tnYGQExNW3ike6DMTu1cwzN8AEqVy7hRJpfVFH1
         Uf/sGs1Mwusp6ATL6VaVBfAnjYo9L9BxbJEBzBC4YlAJ2yMOdh4nvEtUXNOnAsXCCosI
         nSHWuJVLDWQAkJEBuNLGsFLDuo8KYvy2mm7igb01OsaAUK9045a2JCgk9I+BLnwSplQJ
         OvVspkLWZaw84604WW0G49jNfo/ED+pFCtJT+saVm2NYXZwUpGGgxCj7PLVKd38i54Cc
         D5qg==
X-Forwarded-Encrypted: i=1; AJvYcCV4prqoJVLXJ3csbeYALzeXBgN/jhM0aXpjQkosICMkEyzVIzxZ6C+qN3M9lEaPqYQKJ60V4fh+CzzN2Pw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcakv3SwbcU9gPOae1U3I2g/tbpbK/IaX523zXojJV3wHSfPXc
	7c7i8JwSkXdN+uo/IOk69lHcz9CwUhaPA2327KQv/pi/HbqI/gzqwDHQ1PAjoz6XIosL8xxowLm
	T6Gjg9B49M+K6hYcOvYFqR9XFeanU0vqJ3g+ur4aE
X-Gm-Gg: ASbGncsUZcaeyhqSs9idDF2vAXiy61GJ/Ab6eZkXUMCgsE7X+2dJJOCMzwK75h+citG
	7nNU+BX/5nOraeONmgRbFFNZLoEhkFDQ6xarpIOC6XE8AE6/EZUIU/QX6PaLE83mCYFypglB7iF
	SWgr5bTvQe1mNqhzUU5I5Gmv+qGqd2UxWXJarMDSFxj/w=
X-Google-Smtp-Source: AGHT+IFETM7yorOza0u5Xc4IPvb1Wj6Cy5A1k0l3kUM+G0H9Gtr1V6n15kmn5i3dgL3ZfArcgzsK9tCF6fhB/AUVhNs=
X-Received: by 2002:a05:690c:2505:b0:70e:719e:743 with SMTP id
 00721157ae682-71406df28fcmr14100307b3.26.1750807564156; Tue, 24 Jun 2025
 16:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-add_myself_to_lockdown_maintainers-v1-1-bed2bc934666@ssi.gouv.fr>
In-Reply-To: <20250624-add_myself_to_lockdown_maintainers-v1-1-bed2bc934666@ssi.gouv.fr>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 24 Jun 2025 19:25:53 -0400
X-Gm-Features: Ac12FXxqbHuHNKN2wU9KiVvFlrrwz5yfJ7Mf5VRJd7P5lrOrY1rBggH5fBMw9ks
Message-ID: <CAHC9VhS_QLEJrVVKNNtViFXcnaysseH5mFj9jMq7RK4u3to2yg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Xiu and myself as Lockdown maintainers
To: nicolas.bouchinet@oss.cyber.gouv.fr
Cc: Xiu Jianfeng <xiujianfeng@huawei.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 10:49=E2=80=AFAM <nicolas.bouchinet@oss.cyber.gouv.=
fr> wrote:
>
> From: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
>
> The Lockdown LSM has been unmaintained for some time now. It requires
> some work to ensure it works as intended.
>
> Xiu Jianfeng and I volunteer to maintain the LSM.
>
> Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
> ---
>  MAINTAINERS | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thank you both for volunteering to maintain the Lockdown LSM!

I'll leave this patch on the list for a bit to see if others have any
concerns, reviewed-by tags, etc. that they want to add, but as far as
I'm concerned right now you two have the job :)

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0c1d245bf7b84f8a78b811e0c9c5a3edc09edc22..776c7fffcaec08f71faf27405=
99f0b4570179832 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14060,8 +14060,10 @@ F:     Documentation/admin-guide/LSM/LoadPin.rst
>  F:     security/loadpin/
>
>  LOCKDOWN SECURITY MODULE
> +M:     Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
> +M:     Xiu Jianfeng <xiujianfeng@huawei.com>
>  L:     linux-security-module@vger.kernel.org
> -S:     Odd Fixes
> +S:     Maintained
>  T:     git https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.g=
it
>  F:     security/lockdown/

--=20
paul-moore.com
