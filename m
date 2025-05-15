Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A9F29B784
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747342421; cv=none; b=P6h2RqzDsiLYqQMHb8/QmY47sYkRJDCXdbXLZGLYKHfwt59SYq98hiAVSxIEYY3ALz2LGZgja1aOVFr3PvRYnP1Jz2DTbPLG6HIC9lBxQ1qUkcN71K2TjkArdh1TRDPP0Xdq+62HK7emR7BKngraL/TMPogR770xQIYH+wJXbFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747342421; c=relaxed/simple;
	bh=tRv9EmETRWPXZVHYTT7h73M1bxh8y8TuRvMu5qA/7F0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3dMnA8eXORUmyBV/jq9i5d+wEFjwLMAvLe0/GsgXklKe/B4Caeen5q0hweNlYBUedrCmxXUfYcKcOsEh/xwFSMVDHnyd5sWSYN6ayDTiGG27E1fK05Bi4L++gpVoKFdn3phx1iLVc2GN/qekn3iPKsvbHCj1FDUpvSeo0/bXX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2nKKaXMq; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2nKKaXMq"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so1214a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747342417; x=1747947217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRv9EmETRWPXZVHYTT7h73M1bxh8y8TuRvMu5qA/7F0=;
        b=2nKKaXMqiU+Y6HP+xLOkg9rKEusnHOmOeXkq5h/Lhxw2Q5GjKRUQzRj0ZWR+ijlJZi
         puAiKjv1EPimoohXSmZNbBrrwhMe8MUBiZB8yMz7p1tbx7cu0H6lSylVQldX2FmrKOeL
         R+9adWGLo8XvTiMS2VuZevsKr+JFhFDC5bWMsCu2tiL8l+ITcqOWfvoMyDO3VmhE57lg
         9Fb9xr/GIKkVsBl3ivleppN8dMfE+18jhgv9Obr+yCyjBTHUB2QTmso1wprAeKhn+0TW
         YpcMF5PSUrq+OkYDsycdVPNbhSu8VacQOHAEG0Axm7VsikxPJ/q9GYm5cc1n3Mo741a/
         nmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747342417; x=1747947217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRv9EmETRWPXZVHYTT7h73M1bxh8y8TuRvMu5qA/7F0=;
        b=gVOK0mSWGbnXJLMGhwd2DutJdkmjspktl62EWbjd++MY/s07nPEaj5gNiBS8zKIY0x
         bH2YnuLuDXMSXr5b0IN67rI8krG9lgO/u3zEVXDAEErx0gymUe9J/GQMwQbdvsiN2U/V
         8S+gVMLgZQ14pQBZyV905qTCTOKSH4eBRubU/di3jnNadeLfTdAXRVcFfowZfj+OAaiV
         TivumvoJ/mwRApCqhgBHfVRLICQ7MkGOOj19ztooGxcZ/FyNJFABZhLJH1U5UJX+9Uwj
         4ermSc67EfYWbl93enGqUK4CH6Xje16WJ2yaRddhjQm2rtLxn7Hzm/DQJlcpWQ56lvK1
         0JGg==
X-Forwarded-Encrypted: i=1; AJvYcCVks4cvGHgpnnSAeMPI3FY1DV7UcU3k+Utgq5VJR+nJzUyE5aT+41xeosUmgT+imwZmqMbzx/SXZ1OUFa8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz62a68CPRDN2YHLRpCVZUw+Ld62OlegjKUg1ocZsB3ZuHv9N/F
	QE7sN22iicGWOWsnMAQzGjT0vwLrx2YMtRtOg597SyjsTciTsvQNYH6xlZV1QT8e4iqaMmgAttj
	pvZP+LgfYDZgDA11JJRDJJZDA3qZKqSqabxTAU+IS
X-Gm-Gg: ASbGncvYmhG8NzP+CBZhPcNeBrGx0jEj26Ff0QfU4d5VZO2ky2ExzNKwd4XYtQKx5Aq
	izWbZIJYYv31vaDZTsHXkVoBNNyrdxp8CAEmESdBax8rK41lUElDEfTd2aTyw0reeNRVWbO4SLt
	0JSGkPNX+2VM4NySXOZf+IUDT3jW6XJAa/kO0f0ve2zxF/Q+IJ7c2xwF9+J3/k
X-Google-Smtp-Source: AGHT+IHZ9jFIvkL3s/WhGIrI4IThR5QXdM3cICdVMwLZGSJ4WKA5W38ar/Q+P8ZFLrgmTwdP5BUbeE+U40I1JEI8RSQ=
X-Received: by 2002:aa7:c392:0:b0:601:233a:4f4d with SMTP id
 4fb4d7f45d1cf-601233a4fc5mr3186a12.2.1747342415935; Thu, 15 May 2025 13:53:35
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-work-coredump-socket-v7-0-0a1329496c31@kernel.org> <20250515-work-coredump-socket-v7-3-0a1329496c31@kernel.org>
In-Reply-To: <20250515-work-coredump-socket-v7-3-0a1329496c31@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Thu, 15 May 2025 22:53:00 +0200
X-Gm-Features: AX0GCFv4nrwtDZxOQKAFnOch8tVFv6sz1vCJIdy3HEL5SN0W7L19J7ev9XtxuAM
Message-ID: <CAG48ez00GnBZZDjpYBmccgztaW+0206_X8__UiFxtBQhm7rvhg@mail.gmail.com>
Subject: Re: [PATCH v7 3/9] coredump: reflow dump helpers a little
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Eric Dumazet <edumazet@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Daan De Meyer <daan.j.demeyer@gmail.com>, David Rheinsberg <david@readahead.eu>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Kara <jack@suse.cz>, 
	Lennart Poettering <lennart@poettering.net>, Luca Boccassi <bluca@debian.org>, Mike Yuan <me@yhndnzj.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?Q?Zbigniew_J=C4=99drzejewski=2DSzmek?= <zbyszek@in.waw.pl>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 12:04=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
> They look rather messy right now.
>
> Signed-off-by: Christian Brauner <brauner@kernel.org>

Reviewed-by: Jann Horn <jannh@google.com>
