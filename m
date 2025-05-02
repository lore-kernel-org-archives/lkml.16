Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CC32561D6
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195088; cv=none; b=SYiojkhGBIdILG0Hxiam0RMk6i8fTeAwD4nw1BOz+30BvBj00sV5dEMobpnfQbjK2NfD+/3CggGPgTFiuXqYS3AesRQbUK4tNTcmQuUf9uD1D7qgFxrGC7Za3AKvNyJoA5wXqum+DCEEHUBk6rEy+xmrRSKy6zeynzMWminZmLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195088; c=relaxed/simple;
	bh=Vt2jUIItSucYOFtSbIcXHATgjkrt7oAf8nrQ6pmlrbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKxiGXnQyeQXLEYe0UDdi9wCG4weIjBbz1UQ8O3HxID8Y6iM+YJOzRhC5s6W21Um2pRRNn0pqHUxV3aWxhKVkFfDpFgi6z7MTfJBQreFYXdWcbwon76hdDCOFLJ7DKT7dCo/nsSOfgN110SwnRpoi46F+HPnbJWHWB+ZJYvU1Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YaG2OyDd; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YaG2OyDd"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so11045a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746195085; x=1746799885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vt2jUIItSucYOFtSbIcXHATgjkrt7oAf8nrQ6pmlrbo=;
        b=YaG2OyDdfxp6rWAfJEcX0jTBAp1bikRAEsb3RZ0sVY1Ci1V2Wssrwo01mcXZJQC6WU
         54g+QpeGj9ixHjP+K6GwtpMMFjA37mHJgEs/VhGrIO8v2DfLTnxnucVgZxd9EXz2DyCZ
         4aDbpLFVt6+opDL94J3CWeoXmHbWNYSOJ8lKhV0QPTCkp+v7vVUs11B+/vRqooR1IQl2
         PXHvLWRRElKm2AdKtUCg+P8gF/4x3gLwpKX5q77oSKh4QlC5gEGvnnlm+pjV5lMET0te
         b00baFbNlCj/haUM82JciErz1tJH3MeOH7qc1W27MnoBk8flsKSv+9un59puG8+t14J+
         CI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746195085; x=1746799885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vt2jUIItSucYOFtSbIcXHATgjkrt7oAf8nrQ6pmlrbo=;
        b=jg0hu1510cs29A0W/yTMbmKvI0tjJ9elMXtq7o4VxyYFh4qA5mO8LSirHmMMYCNNgN
         Dar1s0tjYyP6quWOnVqNIVeer5BaNfZklrcX8aga/LbC+xwhzY9d92m2QjkUOE3pZrR9
         poRVREODNpUSTlGg6VbRT0yx8NfZ2KAg00Qy6QpfMihfD21T5xuf6Rea9cCIrkjCrl6v
         odOEeZcTe+EUZaDgkpK//eEhTF6BIiQVf2Ebd7MT0ou69Y6VUuYgd3sPzw5ZyYqem6UY
         bfsLzAJJ13VjU7ic6DN6EyyQx9HF4xpQJ9ktsc7IxQD3e5c1O5KQ1E06LI213fbbTG35
         Gpug==
X-Forwarded-Encrypted: i=1; AJvYcCUlmt/ZKdupB4bxm8NpwEAvLhRLNtzNE80Ee/dPqMh9oI2xRVTBDGSg8Kqc3xG86FZOonBo1QRMXnEKnYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrZTIlXkYBquRJqi0uV5lX694HziR22Eo/g9FDh65dVKF+kA5A
	IseE+Y9Hq7ZP7vm4Q1yeSfq0G/ywY5iqUmlL5ZLDkMhhKnaHcM/ielWgREH0Gmia4pBx3kQNceR
	vC6EABgLbffIfmF1nTEnOBYKh0CbTAwyDAJ8r
X-Gm-Gg: ASbGnctVEWmL0mQ+h42Z4foTMPcJlGQcBYwrIovpvcUgDEtnLZ3ek10MsxPW242Q6W7
	N2ZC1CmmKDcPlz4i8y2Lxfmi7ppKkK2jZnkyRybWTNU9RS99ehUchnOc5OxEXjrawjh287faXcg
	cp+wBStuLjMfl6aEAqJrND8V6Y4jnyNR4rU8ixRCu42vep7rZSjg==
X-Google-Smtp-Source: AGHT+IEq4zZYwSq4JbP1XWIN3z7LZZH/ze1XMZW0I7CaF9AqWXRX3zQiHPa0jJanCkxNdcG6ojLB9VYf79HdE5YqMJ0=
X-Received: by 2002:a50:c018:0:b0:5f7:f888:4cb5 with SMTP id
 4fb4d7f45d1cf-5f918c08662mr174781a12.1.1746195084602; Fri, 02 May 2025
 07:11:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-work-coredump-socket-v2-0-43259042ffc7@kernel.org> <20250502-work-coredump-socket-v2-5-43259042ffc7@kernel.org>
In-Reply-To: <20250502-work-coredump-socket-v2-5-43259042ffc7@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Fri, 2 May 2025 16:10:48 +0200
X-Gm-Features: ATxdqUENxkugyPW7ElgtsxNZpy_Nh_FmjQSxMwJIlzlcl6CVeGfFkE7y7zUJP5s
Message-ID: <CAG48ez1x09k3neRXqZYtPwgcxN+8a9=HZCtUkok54bRwAk6BSA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/6] pidfs, coredump: add PIDFD_INFO_COREDUMP
To: Christian Brauner <brauner@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Oleg Nesterov <oleg@redhat.com>, linux-fsdevel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Daan De Meyer <daan.j.demeyer@gmail.com>, David Rheinsberg <david@readahead.eu>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Kara <jack@suse.cz>, 
	Lennart Poettering <lennart@poettering.net>, Luca Boccassi <bluca@debian.org>, Mike Yuan <me@yhndnzj.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?Q?Zbigniew_J=C4=99drzejewski=2DSzmek?= <zbyszek@in.waw.pl>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 2:43=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
> Let userspace know that the task coredumped and whether it was dumped as
> root or as regular user. The latter is needed so that access permissions
> to the executable are correctly handled.
>
> I don't think this requires any additional privileges checks. The
> missing exposure of the dumpability attribute of a given task is an
> issue we should fix given that we already expose whether a task is
> coredumping or not.

Yeah, it certainly isn't more sensitive than things like the exit code and =
UIDs.
