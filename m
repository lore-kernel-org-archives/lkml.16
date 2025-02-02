Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549B81FCFC2
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738521580; cv=none; b=YooxhJKRjbiYZg1DQSDKs8tV9xML44ATPcWhjKZqNz/VhfJycsuvtOhBXLLaf1z48bf4x/csbJKU/Ao4CLjH85FkQrJKxy8+IiR5HpgLzgj7SSo9OuuW2FRIUGXQfYbD5k0ifN/HQKajNC/g5qq4TZD1DSN7FmYTASWpZebb2o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738521580; c=relaxed/simple;
	bh=dzeuOtya3Wc7zF/kYzV6sgIqXXm9PR36oQDKg1A+d5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7TRKfI2y/Mobazg+/iMRSVj8Cml+2K6eqdOZ15k0zTB6F3AaanwAsShGmfm2WLb7ML4oZYoFXJF7t26zy3qHe7MPIfw+dnCDOPzs+cLpB2h9QIunBGPjtaqfElKlMssKpioq0OsV5hd9xzIfLvJVUbaXhM4ZKTH5MUVGLucyn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VETHQ57Y; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VETHQ57Y"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab70043cd05so489269966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 10:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738521576; x=1739126376; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H4S0RgGenjws27F+04GdAauVTnmbzhDtniffqBCRpno=;
        b=VETHQ57YPg/UNebtMFAOcACeZ792JKNTenAEiXE64PWXLLxyt+L+Mj/OjUeOzOg6UN
         RIm3ROQBg28ZJ5xqUrWsia0dX15DzKLHQsEXH+r2HnAcALNZUrKwT40ETbx1AczcUIx2
         dIS8asB4c1rbuVfULLqjbMgnsywOCzIvlqb6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738521576; x=1739126376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4S0RgGenjws27F+04GdAauVTnmbzhDtniffqBCRpno=;
        b=XugKnxM2nX6PabYgEWfT618TrdL+AWS2d4LmxI4dk/e0Ds+5+yj1cP/WhdPXAoEyx/
         +xQtCd0tXaka58D1RmP0tmnKTJIv8a5ijJIfJU6g+fo/uRXEBd7HvcoOMMd0+bzewWZl
         qREwrFzcZpFQh8tytI46hcIj5uV/7UneqUpggvsjqBLgoJ6x40FrAW9FPPpPscpTK3Fs
         qOpq13WK+gZhvO5kR9W0zqJt5lw66aJFjvoQAaozFtvtkAfmBO0hUP7f10/zz+BK71vR
         4vdR+WnuFgTM/VkrmlOkb6904OsbuowQwHL4M+Oel7Qu8gyqBS3DK0uV8BIyL0KUXMAh
         r2aA==
X-Forwarded-Encrypted: i=1; AJvYcCWEwOf5krQyx4Hlp5rY93LEha7rsKA6Fvxvc77GyLdXz082wWc0xWL9paheYlpGo5BlOyAHh0eINDzREbs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw84jYprr8KV2mz/oaonYWPNgcnS+rZi/5Hdx+I4wc49e6+iCJW
	6G5JfKMRcY+sCiGMfMCyo7wMT0xegOKjPAekGN9n/Y6aj7W8RVzQD+5V+tRRiDj/JE2o6lsuzZK
	HPn/Zsw==
X-Gm-Gg: ASbGnculuU9l7hjdsk1cMDIJlfkBjwZkbSzlCGPWoflo5OUj/RUqnvZ7hQYdGuwP+a+
	0IQn1iLHQ0OO6IaN8zWz+u785AaC3cUylrEJM/PgD9eFxFSaNmfFY5DdK+kcRhMDOlwaonaX+if
	W+kwwcA3oky78BoKYj7QssCbRmhVBfbkHydQciZKeBcSEfMYzJ9y1FqgYnTONWjtlAOv2xgmTdP
	CndZZEVbvsJxWS593FtAdnd/B09jaIPoQ8yN7UTW3uSyUdf7CcPz+SuvoH8kda8NQyjPWF8nDMO
	zdOrHIOCC8RTqw4h3wyCgqPv89t3McWZizhZJ2ASrPX8tZyZ5zFi9cCPB0jBvd+8dA==
X-Google-Smtp-Source: AGHT+IG5pOfM3CVShsi/En/OeC1rS4F04LIatKqb88Pw84gx5QDGoEd97VKn7GLVepf2nUei1er8TA==
X-Received: by 2002:a17:907:3f89:b0:aa6:7d82:5411 with SMTP id a640c23a62f3a-ab6cfe120demr1800175966b.40.1738521574835;
        Sun, 02 Feb 2025 10:39:34 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a31f86sm626905866b.145.2025.02.02.10.39.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 10:39:33 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so6703143a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 10:39:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJdt5C3X3MU9tcwjmUmuUivsJP/o3CeUcCcQJCsBq1IYjez+1nWKEPlyMKCEfLHcmqpKUA9j+9IBQec7s=@vger.kernel.org
X-Received: by 2002:a05:6402:50ca:b0:5d9:a55:42ef with SMTP id
 4fb4d7f45d1cf-5dc5efc4586mr23025684a12.17.1738521573175; Sun, 02 Feb 2025
 10:39:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102140715.GA7091@redhat.com> <3170d16e-eb67-4db8-a327-eb8188397fdb@amd.com>
 <CAHk-=wioaHG2P0KH=1zP0Zy=CcQb_JxZrksSS2+-FwcptHtntw@mail.gmail.com> <20250202170131.GA6507@redhat.com>
In-Reply-To: <20250202170131.GA6507@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 2 Feb 2025 10:39:16 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgEj=1C08_PrqLLkBT28m5qYprf=k6MQt-m=dwuqYmKmQ@mail.gmail.com>
X-Gm-Features: AWEUYZn1mLEEFZrVgRBTGnd3WXHbXwdvbyu7UVX6NyaMQEXW9txXBTkd09cMrv8
Message-ID: <CAHk-=wgEj=1C08_PrqLLkBT28m5qYprf=k6MQt-m=dwuqYmKmQ@mail.gmail.com>
Subject: Re: [PATCH] pipe_read: don't wake up the writer if the pipe is still full
To: Oleg Nesterov <oleg@redhat.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Manfred Spraul <manfred@colorfullife.com>, 
	Christian Brauner <brauner@kernel.org>, David Howells <dhowells@redhat.com>, 
	WangYuli <wangyuli@uniontech.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
	Swapnil Sapkal <swapnil.sapkal@amd.com>, Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Feb 2025 at 09:02, Oleg Nesterov <oleg@redhat.com> wrote:
>
> And if we do care about performance... Could you look at the trivial patch
> at the end? I don't think {a,c,m}time make any sense in the !fifo case, but
> as you explained before they are visible to fstat() so we probably shouldn't
> remove file_accessed/file_update_time unconditionally.

I dislike that patch because if we actually want to do this, I don't
think you are going far enough.

Yeah, you may stop updating the time, but you still do that
sb_start_write_trylock(), and you still call out to
file_update_time(), and it's all fairly expensive.

So the short-circuiting happens too late, and it happens using a flag
that is non-standard and only with a system call that almost nobody
actually uses (ie 'pipe2()' rather than the normal 'pipe()').

Put another way: if we really care about this, we should just be a lot
more aggressive.

Yes, the time is visible in fstat(). Yes, we've done this forever. But
if the time update is such a big thing, let's go all in, and just see
if anybody really notices?

For example, for tty's, a few years ago we intentionally started doing
time updates only every few seconds, because it was leaking keyboard
timing information (see tty_update_time()). Nobody ever complained.

So I'd actually favor a "let's just remove time updates entirely for
unnamed pipes", and see if anybody notices. Simpler and more
straightforward.

And yes, maybe somebody *does* notice, and we'll have to revisit.

IOW, if you care about this, I'd *much* rather try to do the big and
simple approach _first_. Not do something small and timid that nobody
will actually ever use and that complicates the code.

                Linus
