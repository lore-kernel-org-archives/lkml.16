Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E271B4242
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750698172; cv=none; b=JZ7jdgeGkPOLl7qYqVkBBDXCwjoPWbjukkGzyt/KW3neuT2/IIRhFdicWJKfg/CmY7px02LvzdUKW4GerLJxkfKqMdTciwkepbXdHkQZnfWG7jl9iro+SYxIAK4UpgdZFsEgPwVPPIUWuzeSZYqbIc7tdKwm70PQBcdldv7UOIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750698172; c=relaxed/simple;
	bh=MhMfGlmeM4C5z3L/kbBx76/f30XBbi13AwE8phWRKp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvZATTS3sadBa5sd2ga9S7HITnPYW+PLkS7R49jaV2/qtHbJJ2Yomr4NCqVu1WKCrWGegjk9R84RkCg85afgPXQQ239IK1oaWv+prhLfDOd7oruklQHxCzNsRuO8fO4fZbfljm2vgTMb1hErWwymWIpljceQ+pXXoLqtZHu4F2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com; spf=pass smtp.mailfrom=omnibond.com; dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b=f0b7szUu; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omnibond.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="f0b7szUu"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso3446219a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20230601.gappssmtp.com; s=20230601; t=1750698170; x=1751302970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhMfGlmeM4C5z3L/kbBx76/f30XBbi13AwE8phWRKp8=;
        b=f0b7szUukz/zcLud/WoF9zUc7jq9YHwWgfGYJys5bi7RPsBqTjCOYLUPwjy3FgyjsK
         JO+RO5eWDszGI74OSKeNUaT4mFjlWbCqrmkZCzxZdfJ0MaFiwaXjFyJFWMPqwhXHZums
         WXB6IHGKpZhV3IdnNnaynXdC/2h84SahTJIUWQywxZEtp25JRuV7cSp6nlTMSzEEzRg9
         M7R+QVXscqmw9c3w200VLjKBcQTaQpQyYE9NdOuI+Xz92nuw88DBZw5CPkcnitbW4YWq
         2WPycnM8CYecB7tmtgfaMLZQLNnTnaIMg76NoZzpOxzwIPYUcUwPGPjbqW0sajBmy9wD
         DJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750698170; x=1751302970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhMfGlmeM4C5z3L/kbBx76/f30XBbi13AwE8phWRKp8=;
        b=T29EROtoxzFM1NBvU+vBfzxV0mRkfoo6W/6wvm1zkF3ri6FoAGE5T7HmJJCP4XwmpY
         tEuIjmLd1fMQTntY8HJiEdIG+QzAFdcsy7DtEi9q6cUvqh2KKpMeGjP+H3b7pCrpJaq9
         OaLmdbhhlg14+JjFwOxrSXylj3D7ReS2ZxGjkGqm5hp97ir8u569NBGQKwGzqEAXP11+
         9Zjy9wXxk6Uo2OrHMTq+3wyFo+pDXQTc2TZP99IKLiAoi9pxFEa5kpZR4BqRKxcH8irq
         Pz8W5Fk2H507nZWHUYBoQIG9AMIdFyZgxU34CAQM2hiAPf4pCugcrlwWnHMMzfvjNyV+
         5VJw==
X-Forwarded-Encrypted: i=1; AJvYcCX1bhvIK5Qtk+gk36VBHUroVPxNp/cZeQ1poWkgDLMfV1wP9ei9kPKJY5uvN9GePFMCmCR61Uo7T4/F6Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+GnUvIyj1HVTnM8CC11iw680y+a4XIFbLRkw/C9wv6A2zf83w
	SEW36ijbsGF2/hbwn75ZM76nZzJE5YTpVcoOdsrbj0SJT7ItMURM6jb5EqIjPBIdNItCwfKWgW6
	FaMOHeYGuqvNQOue0LT1F1dHtNlEVbMWF5P3bGAu6
X-Gm-Gg: ASbGnctwNwbmXmBOO224SjkUrz93qhYO+x5SETgxKZsc6dxSOqCE096rVTQALQ6W63j
	N2e8OuOTY3/qoRO6vacxUMsKcdUziculBRGqX8H3oXZ9bBqdZ6DDU1LNQu3KZumMWnElG5bxmVh
	HWGhtt/V+YW8p6DczE1OgXPQ3SVSM864wrvtyZSw1b75MaURJrOu0ArrA=
X-Google-Smtp-Source: AGHT+IHBUhmZyoZ2ZPKvz6pdpo2lOZcsTUG0V9m5Av3tGsK3wA1iQ6MlrsQOgQpjnluNSPr5QeZvuKJclzIuyQKHVno=
X-Received: by 2002:a17:90b:2f0d:b0:311:9c9a:58c5 with SMTP id
 98e67ed59e1d1-3159d643c15mr24825115a91.12.1750698169856; Mon, 23 Jun 2025
 10:02:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608163559.36401-1-a.jahangirzad@gmail.com>
 <CADf5TKvyKvaP3eZUR81ND6JQUfVqUEroCrXp=joZ8GHdu2EBbA@mail.gmail.com>
 <20250622184815.GW1880847@ZenIV> <CADf5TKvorgeCJ=6u6=jhxetUhDx3SCnUBe+cpbUQu5gADqRRCg@mail.gmail.com>
In-Reply-To: <CADf5TKvorgeCJ=6u6=jhxetUhDx3SCnUBe+cpbUQu5gADqRRCg@mail.gmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Mon, 23 Jun 2025 13:02:38 -0400
X-Gm-Features: AX0GCFtkqpzhmG4Q49Iqw-ox40GRzXvAovLgprfA4QlL9qfM2t5DZn7sHmIPDQk
Message-ID: <CAOg9mSQGNOrA0p4q+9Q_tLCMtBnCuEc5d+TYXdV+7XT4pqOQNg@mail.gmail.com>
Subject: Re: [PATCH] fs/orangefs: use snprintf() instead of sprintf()
To: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, martin@omnibond.com, devel@lists.orangefs.org, 
	linux-kernel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Y'all...

I was about to add Amir's patch on top of 6.16-rc3 and run it through
xfstests, when I saw Al's comment.

Al patched a similar bit of code in orangefs-debugfs.c without
removing sprintf:

45063097 - "don't open-code file_inode()"

When I look at orangefs_debug_read as it is now, I might be trusting
file->private_data's length too much and Amir's patch might risk sending
a bad sprintf_ret to simple_read_from_buffer. Al, could you be
more explicit?

-Mike

On Sun, Jun 22, 2025 at 4:10=E2=80=AFPM Amir Mohammad Jahangirzad
<a.jahangirzad@gmail.com> wrote:
>
> On Sun, Jun 22, 2025 at 10:18=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk=
> wrote:
> >
> > On Sun, Jun 22, 2025 at 10:09:58PM +0330, Amir Mohammad Jahangirzad wro=
te:
> >
> > > > Replace sprintf() with snprintf() for copying the debug string
> > > > into a temporary buffer, using ORANGEFS_MAX_DEBUG_STRING_LEN as
> > > > the maximum size to ensure safe formatting and prevent memory
> > > > corruption in edge cases.
> >
> > Out of curiosity - have you actually looked at the format used there?
>
> No, I just found this through static analysis. Is there any issue with it=
?
