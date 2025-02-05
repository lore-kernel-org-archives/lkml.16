Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318C818A6B8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771613; cv=none; b=EmoEDVeVjJql434rDiMuBs+wOwABBoDMBPy99LNIs8hMHzAVZhGLnhxvlhyLCKtm/Bo6ZrV3AuJx2rHp8MR6SH9XrhZ1116aGr1/06thu9sCNc4uHhfebH3mJitmqRW7570A6DPyViyeFfj2brklteX7v+sE8cc6XMVviGrVJ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771613; c=relaxed/simple;
	bh=RqbmmJCSs+vqeDfuEh3LyaagpG45I9aLSsrx8U8tdKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4qne6si0XcHM8/wgbhe55mxw4UbI5idHCMSP8thEYCIrqG1wRBXGLzC397BKdhZ5vFpMFNW8tN/aPEkCMoqMArChqjFhNX525Q1s5BUCLAsWU/EXZ6y6tcyyXb+Uj2z7uZkeZM3u6wUpHk+n71mej6yG1+zhvSKuepXPh7KWqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=euaXf8nh; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="euaXf8nh"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab744d5e567so218317666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738771609; x=1739376409; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yuUa4gQEbOKQJW4ZYh4orIOUTVK6GAF0b47tSOHp+ks=;
        b=euaXf8nhhjEYiOx98Eod1y0FcjzpauQ+1C/8uinx2dYl+2N6+/QqNOfOsSibE8LTnM
         CJWzkFxRHMmkWf9vglWnwJu7c2NqDgjjeBHB76Sx8OgTuD3GbKQOJ257uzOmJGgYYa8h
         j/vRcVDXlO7SCO14zky4VX5vBfxYIrgVkfo78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771609; x=1739376409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuUa4gQEbOKQJW4ZYh4orIOUTVK6GAF0b47tSOHp+ks=;
        b=jiUk2aYbtPAfjNPnoeH+lxUvbYjC8EGKz75jKdMR+NR1tv3L3uo0nP+IcSTEN0/zCf
         /XRCkbBlhAspzw6CeWpyg4BZyeCjgt6fLwRwEwAazuje/IdTBtWmZm2kgyc/5Yi9QR4U
         k2jhpQyCII/2sTQe4Adc69G1nwr8QYJhB7pj15cOgYNa2Slwilmh1aKWd8vQbfVsad25
         VxiFGwrzDpJXzmbXVrk3i8w+Y1V5oytX/N5XExnoTFzkotQ+1ob2AP1504nd0eZEnvss
         fn3W4F2aNg4qKhoMU53YS7amTnD5/Q3vOl/WRtYxajN/uppSYciYA54IuP1/kbL0y7q/
         Dj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6pJWmBWry7OCu0Y3tYfBPaiAeNAJ/wa67Yedv/wn8eJ7MQ6AWH0/uH6KqtvEkl5IpF0FJb/t4MfKuULU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1/aTgCNMlmsGKVBOhYfduE3i+HFyWGq60naxjUU141EU0xyOY
	QbtX0tp4O1c/q5oRlZP+r6Bg4ka1Y8O7Ww/9xU1oR2iT2xnU+q8oZfwCWjfePGARE7xGn6B0OaG
	cct0=
X-Gm-Gg: ASbGncvksN84DQANTd4qCbBSM21x7NpmmZhNpF/ZDubVNqgbn4a3LRXMqXx/uXIoPLr
	daXXJx56Tk7TLpxJNy73KI5k3nS5+sxPNK8feAZj4lZ2xmhbtB4evCbMv4nXElUZKLKCZpNPYHb
	HWP79c4DG0lkwBTsCd6QKFshXhW0vnxGThFb7VRP2HrnIDWTr7sca0LcMCcrr7bU8cxmBHgbL0y
	yJ3Gm43w3DBwMoq+P+dtJCFv0tYIKe9ydF/eUMbQQL1Oq+fL3SNry14krvy9qD8SgPB5Z0RSW7R
	32zaq4FLBk4toitHt2rFzQEevY0YAdndjNzQSQ7LTiLyYcExO4FTUR6Ik5fk6XNMkw==
X-Google-Smtp-Source: AGHT+IFqB1f5nbcarrbqUW+7o2g7NdPCHjdoA6CcNkxthnMCzQrRSoGTUbYH//d3xhLyra4ejR4AFA==
X-Received: by 2002:a17:907:971b:b0:ab6:f88f:bf1f with SMTP id a640c23a62f3a-ab74854b369mr761744266b.27.1738771609180;
        Wed, 05 Feb 2025 08:06:49 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd9c89775sm1931281a12.69.2025.02.05.08.06.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 08:06:48 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso2079209a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:06:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7pLQeI6rZkrwZh9OBosVz3wcQ3lLhnBg3ijCHdc7oBNq7bOfW0v9FF+38oW5TYTLNKzPu2LbiAO27lwk=@vger.kernel.org
X-Received: by 2002:a05:6402:27d3:b0:5dc:dd24:a7a8 with SMTP id
 4fb4d7f45d1cf-5dcebf087f4mr17433a12.7.1738771606125; Wed, 05 Feb 2025
 08:06:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205153302.GA2216@redhat.com> <20250205153329.GA2255@redhat.com>
In-Reply-To: <20250205153329.GA2255@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 5 Feb 2025 08:06:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiqUibNm0W-KcCb3H+aiSVr4Uz3COZq=LjqGd__6guFEg@mail.gmail.com>
X-Gm-Features: AWEUYZl4pQ3MfEjALYySg2NdNqfiE2xSNb-ZlC7tv2BTOe4-AKTgE2QsLD76NI0
Message-ID: <CAHk-=wiqUibNm0W-KcCb3H+aiSVr4Uz3COZq=LjqGd__6guFEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pipe: introduce struct file_operations pipeanon_fops
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	David Howells <dhowells@redhat.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Mateusz Guzik <mjguzik@gmail.com>, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Oliver Sang <oliver.sang@intel.com>, 
	Swapnil Sapkal <swapnil.sapkal@amd.com>, WangYuli <wangyuli@uniontech.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 07:34, Oleg Nesterov <oleg@redhat.com> wrote:
>
> So that fifos and anonymous pipes could have different f_op methods.
> Preparation to simplify the next patch.

Looks good, except:

> +++ b/fs/internal.h
>  extern const struct file_operations pipefifo_fops;
> +extern const struct file_operations pipeanon_fops;

I think this should just be 'static' to inside fs/pipe.c, no?

The only reason pipefifo_fops is in that header is because it's used
for named pipes outside the pipe code, in init_special_inode().

So I don't think pipeanon_fops should be exposed anywhere outside fs/pipe.c.

            Linus
