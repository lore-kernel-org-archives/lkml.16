Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC5E1EDA11;
	Tue,  1 Apr 2025 11:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743505340; cv=none; b=tG2QYKLD9oQNCGzKqF3HSRjrmzc5kmmJaJRI+b2EwcENnLq82aia5fUYIhr9edynhuzbumPN5Osdg4pAiEWULxHCGQKeN4CSA+W4iPaOP15j7GP5IQQnaMXq8HuPqxMVpzRgLMsuL2Q5JkceL3tG9uMSspEcQA/xT5KrR7SEej8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743505340; c=relaxed/simple;
	bh=WM8uWp1n6LtHojEQ3XQ7/DrsURN0rpKjNln6ogHwAPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAtBN4R0wtLcXqRZLydHxdIOJ31tmXkREoAYFQZlI49OnsD8GnP8eYckF4uN1E9JzhwSder/dghkNa+sA83iEV9QpXkN8pRsn/nhPT7XGTzcjrGcTAkMh5kS6nntl8lQD0PqhniK28ZdNMXXIwkYk12tkN0bYEf4687wweJd/oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZC6i3kcX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZC6i3kcX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so1162102a91.0;
        Tue, 01 Apr 2025 04:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743505337; x=1744110137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIMYgWDoZA4nluKsAd+dlkqOPs7SwU4W2ipuyeJ7NLI=;
        b=ZC6i3kcXDgCG5QMdujeO30jxG77DdPLSjlnEPS9Ylm9ZbYo7xS/sNYOvQCEvffP14E
         UfJRq0+bXpIL/vWFlqxmfINGOjJsPLN23gj4LuPHmsqzxQMwGEKueOKUKSwZvuLmcye8
         uQWJdTmI3yqQGkLF/NDZDjVPdSQJBGtkA3pGzaQfclRMCmfHiwGoZxe6PPlBfGy/Oj7+
         ufT3432CPa1x0PWGe2UQpDUAZ8oouAhvBprYBiakADup3kcH6+SHCuEMAKFtbCSiXZvU
         BvRLhj0e1my/jIyNOu8Hm466hVor5WdhLLy7tfNW2bs1z3Lva43ySDa2QFRXkUG2g/ve
         m6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743505337; x=1744110137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIMYgWDoZA4nluKsAd+dlkqOPs7SwU4W2ipuyeJ7NLI=;
        b=PDvBjDDvdkS7Lln3GuorGCED4E0Y7L58Cp3cewbHvP2TXzOeYzSbwujc3bvbHxCPtV
         kGT1IUc60pFTudP66B+fJ1nfI27XSBGhrKDJEJNl+8iHGVHR1VZN6K5N+OAfNU3Bs42m
         3lO31tK/S3tlBiPWYYD9HmntNAks6+05hO4clJNTJVEQXt5v1HoJpRFxIk9QbA46LKrf
         hIHOz4FM0WvI9HqXPTQDtU7aCezfS42zDTuhCPlw44Sg4+TA/kVwSYdJmy5m3NHJEJSm
         q3sPEzEM6SM/+AvFRS4UrAuItGWUC8u9VEnPYX9JXwQMAxSmfWoMay+OUNrIXZiwbB+U
         0GaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXPw/7pWnKKHmJtrCkfFE/X2l9epsnm9uJzrc2LXvrEyBb4UDvQYYKHgX/WtxJzRehdPbGjRxp0QqzQtQ=@vger.kernel.org, AJvYcCWBVu0eJxxGVl3oGiIoxJD5qzNS7ZL9iwiy670SbZAiYwIJxXrtLAEOzuwRqxJsSOStwFwx3D2dX5rMS0cBFbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu3yjTDmHNS4LfsFn0+Z0c96LN+LTSHagjxNlvOTiOiFQ8BFle
	YxZLtYVOiO5jEf3qwA/S/MbTwJnhdEaL1q+okChgSAfyxSthIalWSIpT0kiw5+qHgBmaV5Q+Pnc
	Y/ioLRDQeHk8v36Y9lAW0sc2QiYI=
X-Gm-Gg: ASbGncuqy7ypsoNxt9WXJo6pV1E9BbBvuZ6du49+pArJNN1eEdF/QDPjC0NchVF/jmO
	3BPIl7vzKibTmdkTZogczFR34NmFD3kdLxj3KENaqCHskfrZt+12D1g8LNdY/HEockkfj9CwUbP
	D9GAMTb03btuA95a2aQP6cYrJ53A==
X-Google-Smtp-Source: AGHT+IGWpGpW6d5ZIfdsFzWaamUgj+TZ7rfkoUKHNrFDGQXG2niCef3YklVtnipGJqAFbJCaUpCJyFAcq1X/5kdmbwA=
X-Received: by 2002:a17:90b:1d87:b0:304:eacf:8bba with SMTP id
 98e67ed59e1d1-30562e63830mr1176346a91.4.1743505337443; Tue, 01 Apr 2025
 04:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331122926.607374-1-ojeda@kernel.org> <CAHk-=wgyOSX4tbq0qhAkk0OCZqwiCA4EtwKZOBXAdkBW6FOANQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgyOSX4tbq0qhAkk0OCZqwiCA4EtwKZOBXAdkBW6FOANQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Apr 2025 13:02:05 +0200
X-Gm-Features: AQ5f1Jo1sOir9D-7T1Zekx56nDF09h48BlY5ge96gd19VdjjnO1UUJRm4FiPLCM
Message-ID: <CANiq72kkjGVAtWNZjz5VGen4xoVLfRa+Wv399PUO=EfcA4TEfQ@mail.gmail.com>
Subject: Re: [GIT PULL] Rust fixes for 6.15 merge
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 8:33=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> maybe you can give a list of things that I should be doing when I see
> rust merge conflicts so that next time around I'll notice these things
> rather than have silly typo mistakes.

These are the ones we have:

  - `make rustfmtcheck` (or `make rustfmt` to apply): This one you
already know about.

  - `make rust-analyzer`: The one from today.

    Since it just generates a config file "blindly", the config file
could still be completely broken even if the Python script succeeds.
But running it is straightforward and quick, so there is no loss
running it on merge conflicts.

  - `make rustdoc`: What generates e.g. rust.docs.kernel.org.

    It could catch some issues, e.g. "broken intra-doc links".
Warnings would not be a huge deal, but any errors here would be nice
to avoid so that developers and rust.docs.kernel.org can always
generate them.

    This one (for the moment) always re-generates from scratch, but if
you just run it on merge conflicts, it is fairly quick (more or less
like building the Rust code).

  - `make rusttest`: Runs a few userspace-only tests.

    We don't really use or change the feature much, so it is unlikely
you will have any merge conflicts here to begin with, but it is also
quick to run. Perhaps in the future we may reuse the target for more
things.

  - `make CLIPPY=3D1`: A linter.

    I am not sure about this one, at least for the time being. It
could spot something that is fishy after a merge, especially if you
had to rearrange code, but they are lints after all, and sometimes it
may not be clear what to do (e.g. `#[allow(...)]` locally) and you may
hit bugs or false positives.

    We will probably end up defining a set of lints that we want to
really, really keep clean, and then that would be what you could run
on conflicts, and leave others to something like `W=3D` levels.

    Note that if you decide to try it, it is a different binary, like
a twin of the compiler, which means rebuilding Rust code. Also, if you
do `WERROR=3Dy` you may want `KRUSTFLAGS=3D-Wwarnings` when running Clippy
if there happens to be a lint not cleaned up somewhere (e.g. right now
there is one, its patch going through trees).

Thanks!

Cheers,
Miguel
