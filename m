Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F5629B8C1
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747342413; cv=none; b=ddNfRF5HEIUtqlDe3247ibRIEnxvNkArS0XrwRyNHikzmV+Rfo7B1soqJGUkY+OVSfm34eb+V9bAEx8lSX8rQoK05swN0Ba+W6e3LQHaV3XXh9U9TOi6p8FgQZuGvc25ig4NlwLREpGfsZ8QvIysrdvwqWeQP50us2a0GCm6knk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747342413; c=relaxed/simple;
	bh=XMok27LeyvPMVk1wsLnM/8/aHhDw0CNgdmZ28O9DrS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cu217KfNbVG8bdjsBuyZIVq8RFWx2q1veofk2Mqg1UArh9U6H6kLkNpGsW406XeRH8OOqRaqFXTsZLbQWOoWtmbBmoiAHeH5xLlSJLNo1nwuL/rB5COEt5cozSBQA4VAj8ghAzCjrvKVx8myjIsQPs20Q1bO0MZDWke8b32fcbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dgMIKSY7; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dgMIKSY7"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5fab85c582fso3727a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747342410; x=1747947210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMok27LeyvPMVk1wsLnM/8/aHhDw0CNgdmZ28O9DrS0=;
        b=dgMIKSY7qCR1OgW5sBb03YdJPEHN5kAbtkaWQVcH9WAE6tvRKU0b5McF0GAeW3i8Uu
         TE8jbF2GWjNVROICmloT9YchArTuGtOJzbxD+xoHm4xIT8CZFxNzjQ/jdzBh193hsnCt
         BR+5IQnWqWuc3yOF0d78xp1JlCN1zRAS2HjDMYEvaAGQH8ImRdcfr//cwhGs7YLtBxxk
         E4KsoHt7mMgD4GYCoyfD4lScnqrAw7KKzbQSTJrYD/mxKjKRDzSZSYi3EKZQhVT4mVU2
         PfW7PXj7jh7RZs7LM2QYR6pcfB4FIIHa6/cOA9h02RsBaLoBl8EtzulbNM19ve4q6QmD
         aqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747342410; x=1747947210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMok27LeyvPMVk1wsLnM/8/aHhDw0CNgdmZ28O9DrS0=;
        b=iupKXm2oyLhdpTVgrxPlp6viU3LJ2PdPFiQIhsR4gu2RQtSBATf1m8J9ptH42df9wf
         l1/fkDaZYmvam3EKRKzCbzygjxaHMOn5dQ8LbNL0oF6uMzomnEzzBcRL7+BNhOXcRv0F
         zz/G9I1ahbgbOS6dV9R0glQTvotJViOvRML5F0GjubFyZvz0TMskXugF+cp3NOUZYZ5l
         f2HwLKoo7TPr/WqH3zvc7sdFrj7Y6Kj3Gmwz7K7GIclQh27hzXpY/mQpaO09VPaWf86O
         CR5wesB0F9hSGzYbHp7nGid4g5shFtQh0kxJk3UvY7znyxyC/rTLUWRsAQLBeRq9B2O/
         8KbA==
X-Forwarded-Encrypted: i=1; AJvYcCULQBOMYH2jUBdRQao52XQ9i5n6Le08AAYYkHaivKI0CS3/yySRRw2jGZKIWI0QEpOou5rCLCkQlGoEzTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPFnXb1/qoFcKluflhJjOMJ6LAR/ppP85PdiHxLFBQktFh88gY
	6b7I40GaE6Q1usud2BmWny9AhlQOjL47OnP12w/bxdlEJMcxP7EHwdsfZtvP1ifeZVIjQ2QRgyx
	xF24oJxP3pSIH80zVlD4J4b9xBCeqgkpV4IhFHyR0
X-Gm-Gg: ASbGncvtfipnu5wlqFl6pGSqeg83/PAWnn+gujonpUF9hmNWGUlboZnpIcR+FvnaIio
	B+iXSbGWA0H5s2RNB7snZHk6glBmtnxUvALLIg+4NBELcCwbOO+UQW7agl0+KcBKcJIUF9ekavQ
	3hIpovruTDOzYdr5PRxcCoeksACXDpnGYxkImimXTmdpyOOYD/l367JbOoaAGXh71wkOvG+j4=
X-Google-Smtp-Source: AGHT+IECLHFWIrRiZUC7O4hqEBDUksv17PKckJK1rnL5QMtfgaSKVKKd7QPmPRV/LqJk6d0BzJrKKJ5nDtiVXyuVaB4=
X-Received: by 2002:a50:fa8e:0:b0:600:77b:5a5a with SMTP id
 4fb4d7f45d1cf-600077b6b0dmr89509a12.1.1747342410107; Thu, 15 May 2025
 13:53:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-work-coredump-socket-v7-0-0a1329496c31@kernel.org> <20250515-work-coredump-socket-v7-2-0a1329496c31@kernel.org>
In-Reply-To: <20250515-work-coredump-socket-v7-2-0a1329496c31@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Thu, 15 May 2025 22:52:54 +0200
X-Gm-Features: AX0GCFvZyxY7ct4_THeym5x5LEYv3lsYRODqj4j24boe3WIKlaAJKd5VKjymUt4
Message-ID: <CAG48ez2HPOmWgY1riBJbt6tFzAJbJv_N5XnPwhAbVBfA1-sRBA@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] coredump: massage do_coredump()
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
> We're going to extend the coredump code in follow-up patches.
> Clean it up so we can do this more easily.
>
> Signed-off-by: Christian Brauner <brauner@kernel.org>

Reviewed-by: Jann Horn <jannh@google.com>
