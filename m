Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BA6230BF0
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 18:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748544645; cv=none; b=pTFZxT96C60wKxsTp0qDbxnlj3LNtTmf8PLQStduMf3RYpHFFnnUqA6IOv5nJuR/2R3BDbO3pB/L0pNaYyf0lr8sqM4La1rBeigUYu3VzLlg9/Ieq5FEiN7houVFQpijWGrz64NYFNb8XqmAcJPUEoBfA/Rt0ufwe/fmwST3grI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748544645; c=relaxed/simple;
	bh=wca2f04yGSNetikYQNq4fZhabQgWlYOojnVD8BcpKdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVCBSjR670pDzCmVRNpeX6uo64BdtMt2MKe1ddI5EPXnZxXilpAGeMDCTkBObAmN/GmIjTyHQ2BVgeaH062o2+E5YzIyDbqT+cUxjzLcJvvlYooMV4k3N83t/c4Kra0pNZflDyRJGMT8Dirl4vmofsNmyIGQD26O2NijPmRRvKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=PN2Ob3W2; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="PN2Ob3W2"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32a6083ef65so11518061fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1748544641; x=1749149441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZR+bV/RpEv69QT29h8o3+icO6BNVEjRkOnd0TqgTeg=;
        b=PN2Ob3W269WV9lE5hwiaOHucANKYmYvgncgsi7P/AAMb+Zd9m/tLBDLqYzF2pABmSv
         TuOOon5OSbfLNwT3SE4arJhXnofJL9mqq1CXnvvVQKIiyi5SsW8qKx3HYxilQkF1gA3i
         7PTmZ7qLP+TeLyxC/qge7TaVP9oOpOkK8HlaVAMY1A9nyPM1dLNveaOX8UWNB8e662cQ
         sIhznuFtfse4c81pCj7Zj5PowvQSXD6asRk/DtT2F7Wo16w/ktw5qIFb1AFvvg1gptya
         ap4ZAjyZCzcQtoe7uTqfbSxAZ9S/ay4BWYuKTQbB8C1Bw10D/1HMuPiqGN4yUUucJUuu
         qI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748544641; x=1749149441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZR+bV/RpEv69QT29h8o3+icO6BNVEjRkOnd0TqgTeg=;
        b=eyNLdkOpfccg/am/Px4PMskcPMuigmqs/uqecY/NtNtfvVoqm4ChtTtwK3+rNNhCJI
         mWAiZeCHMs7Qg9gKhJyLg2FTt8F1szEKbPbEnI6K+x4j3EQFZ+2R8bMgZE9O5OrYH0ZA
         4VJybdj3uB25H7+DMgelKF9LGetxHPGULQbmt7X0kEYoAq5iKK5MGwBg2zX8mLiT2nLW
         jKCE0dukbeS4LPFo23jEyqfYUXGbcDdyOqCMWLbhOlf0miiwINFeyaaYK68MS0SNual3
         AAKoy2QjIGWTW1XrihkU4nWPuHjg7UJnqt5w8c2pgbRGhStPKVIDQtl23ke1wTxu6Bey
         A5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVD7H0Gp0zDpN7plcCD7s/WS5PyI6AVf2JSRMk7/PJeCdhT8RTZF+6gjSHWgxtNizEoC9nvCr35poPWVwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKvKxWEI+VDd8yRRzlORbFErfGICcOiJVKGIzduDfYbNAkwGoL
	a5dgZLgvfDe5bovmDMFM5nfCoWj/JkbytodLqp/SvPkDo40je2AFertrnjmaB8QL8HPrTTk4eam
	/rkBiQ5Cdl5Jp94sFKS7WaWupfj6OrCZocHKIZm2e
X-Gm-Gg: ASbGncv3UVxExGlA2z1GTHV2E/nDLNWbDKOKQ5Kzl01NYfMOPeT2hOo9Vh2vQy8VUwu
	eH8Si22rTaJseRJEolUQaNiaYMRDqPkDaaJM8qjp+RW2RPkAoqY33Ev4AJ5t0h6N2u7CyVzkxUX
	83HiTThciGnfKHQj5MQxUMjyiipE+4cjPNJZHfCqAJwg==
X-Google-Smtp-Source: AGHT+IHvzZNFmorgbMvPjPmVBKaNoD8JL8vbWNjA3kvxqIbWCqlAQjdL2EaLHdbNkYIonfwMKxJEVmqVJFx1wvfSHiQ=
X-Received: by 2002:a05:651c:3050:b0:32a:8631:c41b with SMTP id
 38308e7fff4ca-32a8ce7ff5cmr3131261fa.40.1748544641324; Thu, 29 May 2025
 11:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <85778a76-7dc8-4ea8-8827-acb45f74ee05@lucifer.local>
In-Reply-To: <85778a76-7dc8-4ea8-8827-acb45f74ee05@lucifer.local>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 29 May 2025 11:50:29 -0700
X-Gm-Features: AX0GCFspfSh1KbGnhihvv0QMDvvSEVkz0UOx1CDZtHwOavk_KVICQNzB6RwmT6E
Message-ID: <CALCETrUdgn=eXiGR4pH+EdCGb69bw7n21goJGQbt6mNh0mhTmw@mail.gmail.com>
Subject: Re: [DISCUSSION] proposed mctl() API
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, SeongJae Park <sj@kernel.org>, Usama Arif <usamaarif642@gmail.com>, 
	Mike Rapoport <rppt@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Barry Song <21cnbao@gmail.com>, 
	linux-mm@kvack.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, Pedro Falcato <pfalcato@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 7:44=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> The behaviour will be tailored to each action taken.
>
> To begin with, I propose a single flag:
>
> - MCTL_SET_DEFAULT_EXEC - Persists this behaviour across fork/exec.

It's hard to comment without a more complete proposal (*what* behavior
is persisted?), but off the top of my head, this isn't so great.

First, the name means nothing to me.  What's "default exec"?  Even
aside from that, why are fork and exec the same flag?

Beyond this, persisting anything across exec is a giant can of worms.
We have PR_SET_NO_NEW_PRIVS to make it less hazardous, but, in
general, it's risky and potentially quite confusing to do anything
that affects exec'd processes.

Oh, and this whole scheme is also potentially nasty for a different
reason: it's not thread safe.  If one thread wants to spawn a process,
it should not interfere with another thread doing something else.  So
making an mm flag that persists across close can interfere a bit, and
persisting it across clone + exec is even gnarlier.

For any of these, there should be matching query features -- CRIU,
debugging, etc should not be an afterthought.
