Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271D91F2B87
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 22:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739053862; cv=none; b=TeCe2KquHk1/+gvfTNZmVpog8tacKzJjwsK8WrjRGWFkFR/jInGT7gqzhxJWd21ZEzz8BhJJUiVgg/j6GLVTUPF9DulOzB7bIDDb0Q1PWKhD0w1Dfm3N74ImVefwKiHofjVVW3DgnDrfysZ8J27shoh0/vR/0qpbt3umMUzbM98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739053862; c=relaxed/simple;
	bh=TBDJ997VKmPJ1tZPOuA66AYxLKB/sngWskbkaskv+Kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9ZhN/a1zJ8oK5bMCCmtqajkUJt/84RESdnz3jxGlUA200ypGE8Zuk+78m4H4ozLILSc3uFTGEYI4CKKQEGwIuFd2aJ3OQPmJdGpVZfFHO/MrxH/3Hvlqhui+1lVObBJXKrUUXeB4Wn3DDTGz+ytmJJnqIszGS+WlI6WRu/fCLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W7hWDI0Z; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W7hWDI0Z"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7863f9be4so309539366b.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 14:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739053858; x=1739658658; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dzv2sei+8fQDzyEn7+PpLoRqxzbc/n84CuipDMqSkog=;
        b=W7hWDI0ZeQPYu+jzU7z+CWzodc87T7rT0arzlz24sgp8L8dfrYPxtCdiRtnj2U/dsK
         ByVURbadaL7Mosou7lxwMHoKAbVTfyRP28X+NJRmAL0uRGQmqtA9+VhBZB/TxVGyTeP1
         aMSyvVqpe3wBg7GHBoHPmXNBfkAmXNH7H2D8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739053858; x=1739658658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzv2sei+8fQDzyEn7+PpLoRqxzbc/n84CuipDMqSkog=;
        b=YXRCZadfNibEDZTf7vWj1oN1F3nvKFqmndcIHKkd4w+zeoKYNPVBkJAnUxLc6ivKkU
         8WwECpYJHWTkxa4mjPfDCdLaeNA0WtHNCA5IyiJqIsn9BKAWdm4LMlvI3n4lspMHP51Z
         LAouIjhqmQKSBywkOAlyhXwBpC1CGnGhcQunWSIzsd1gG/esvyTAc0AMcPFCXukYxvfj
         TPOC3+9vd0TELKm7fzZu1Pmwo1GiRSnY3il1m6FIKDlSMNHpG3fMoMMO8vug+1rgokye
         TftvnUw6ZxTrrM9RLw/109FE1tivPl7OKF3wDNc5eNvht377p4b4snO2CLk9iwkpwnJv
         mICA==
X-Forwarded-Encrypted: i=1; AJvYcCUDuFlbVWket5UKedyDm1zWeC7Dh3ll+PE70KOnOCu+ZAsngCP5m7X60TL9gPODbdeK/B3Kkd3R0wOyrag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu04RIaFejOO9n7QU4XygEmwQPtoceYWUQbMYE1253GZRzsHFg
	7GL/x9Eh3SbAdZCyOUmVfvo+SPrkkhOFJ3VI4w3oV0s8uTxIzTX8drQbDAp+HL/4YuR/1VmssYj
	fcZBs4w==
X-Gm-Gg: ASbGncsNs0aluzOhoYw1zxhJergeoAJermcjSMw+MRcQ5aC36l/Gtv9X4wI3QE+x4Gb
	qKSKbERq7ne7UjTBrUu3fBfFfCrrYZ6Cvb9fGLgIH51DOMDOjfRm1nqc63peLXhe4EfVjr1q4Az
	btSY9kcxq/Ou4hts2X/j1oEVUpHf3x4ezmYXh4+XaNsrbR51IucC/qiRiqKMC2HaEZDH4+sy03T
	TTKIRAcWWaW42WNu8nrQchwc2N6JXxlYVuMHSTB2GA7f6MeDeGt568W3ZvGwq3JZ5NhvHU7bfG0
	wBm4EjGdDkPZUHZWL6KWY+tESR8SugpiagA3yFdqVBMeIlQtKkfAY7LJnifqThgK7A==
X-Google-Smtp-Source: AGHT+IHFMd/cJx1mluQjqgps01pX3dLoWjK4Blu9C8z1yCCMVZ8cF5BbczjRbS4t3c7hn3+HEuHZBg==
X-Received: by 2002:a17:907:d1a:b0:aa6:3f93:fb99 with SMTP id a640c23a62f3a-ab789bf9658mr965445966b.36.1739053858222;
        Sat, 08 Feb 2025 14:30:58 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77dcb9336sm498722766b.27.2025.02.08.14.30.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 14:30:57 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5de4c7720bcso2730229a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 14:30:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW59z4WFgWoriw7KaTkUtupcm3/I6tcEd1GoM0iUhpFQ5B1jVaiGc49nPTDVmwPZuN38Pq6+8yYssRFC04=@vger.kernel.org
X-Received: by 2002:a05:6402:e8a:b0:5dc:d34f:a315 with SMTP id
 4fb4d7f45d1cf-5de450236a2mr10109677a12.15.1739053856195; Sat, 08 Feb 2025
 14:30:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206054504.2950516-1-neilb@suse.de> <20250206054504.2950516-15-neilb@suse.de>
 <20250207210658.GK1977892@ZenIV> <20250208220653.GQ1977892@ZenIV>
In-Reply-To: <20250208220653.GQ1977892@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Feb 2025 14:30:39 -0800
X-Gmail-Original-Message-ID: <CAHk-=whEbj9p33Cn_P4PawBqkav8zQq5+WjtzqYCK0o621p1kw@mail.gmail.com>
X-Gm-Features: AWEUYZkVdsbtACu21LpSl3eoLNK0ZCYNVhLM9NFFO3RNNCTRnheKiuYyzhwaC8s
Message-ID: <CAHk-=whEbj9p33Cn_P4PawBqkav8zQq5+WjtzqYCK0o621p1kw@mail.gmail.com>
Subject: Re: [PATCH 14/19] VFS: Ensure no async updates happening in directory
 being removed.
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: NeilBrown <neilb@suse.de>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jeff Layton <jlayton@kernel.org>, Dave Chinner <david@fromorbit.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Feb 2025 at 14:06, Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > OK, I realize that it compiles, but it should've raised all
> > kinds of red flags for anyone reading that.

Well, it's literally just missing a ';' so, the "red flag" is "oops,
nobody noticed the typo".

> > return + <newline> is
> > already fishy, but having the next line indented *less* than that
> > return is firmly in the "somebody's trying to hide something nasty
> > here" territory, even without parsing the damn thing.

Sadly, there are probably no sane way to do semi-automated indentation checks.

> Incidentally, that's where lockdep warnings you've mentioned are
> coming from...

Yeah, so because of the missing ';', and because gcc allows a 'return
<voidfn>()" in a void function (which is actually a useful syntax
extension, so I'm not really complaining), it compiles cleanly but the
lock_acquire_exclusive() is done in *exactly* the wrong situation.

Do we have any useful indentation checkers that might have caught
things like this?

gcc does have a "-Wmisleading-indentation" option, but afaik it only
warns about a few very specific things because anything more
aggressive results in way too many false positives.

I've never used clang-format, but I do know it supports those kinds of
extensions, since I see them in the kernel config file.

                  Linus
