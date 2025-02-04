Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23F71DFEF
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682952; cv=none; b=ZxtacNWZnKsCU2os3mPnu3m1l2uAD0YlxCrHG+ic74KJykbmmnGIEbPcQ/Lrp30yaMjq+/xwZZohkuuegEYFNdGM5SDUK4VO0eDyn3Qeu9ZoDUQ3+r69JA0Xq33xo4VpOZ8X1q1lOx9ID8Ip0YKobuMk6zqEXbUUUWEJbKzOF7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682952; c=relaxed/simple;
	bh=hdVkR2fbEnn9MFCfmyF3oYEzkatoH2fAGmL02XOR8Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRLs3IrBllczyOPBk0ICQjZ7qjmeG75Bkb9oIJd5XdhyVrR5rhAQeoypOvYQGmUOqeH2GHb/kRqS5rXbom1HYQ4ES1rnZ9FARE05/S7DysosCyALBwoBW19u3Jgb7ZKJqd2mVXVUs3rlbSO1s55zDnJWe73dWt9pBFfaxMWwHHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UAPWjbnF; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UAPWjbnF"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dccc90a52eso1069877a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738682948; x=1739287748; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yrA6Lgj79fY+XnGOlvkpe0HoqZ2OKX6I5kMfzwHvccY=;
        b=UAPWjbnFpqpDlqQA7BenatXPUufJiYK+n7ZENSHe86fmxXe/MRfLe06yEz/Hn+PnTQ
         UGy3GyyN8oRMQu42om32dKo1EPwBtoX5d889GcnhctWv25h/sU8sdWTIihflUuE5hqnL
         FDNTDugpLO1VcmkLzh61y8/3yio9BIgFMjEao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738682948; x=1739287748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrA6Lgj79fY+XnGOlvkpe0HoqZ2OKX6I5kMfzwHvccY=;
        b=vJpQIsaVKOghfWLUUfg7HLCX54MBthhi1b1O7w05XJA1oYyRROi0w8UUjZHEQgxcVz
         /dJ7+xEdhndnK/Ko0tn+pjTRiuVGTizenNDknTWCm/vxGqj9nmCkOf4FVOM1gi99WH/4
         AmCAjTMCwoqiEP36cy4ZWxKFHEoZ+EAYbjkoU+v4wocqWbN1LAs70c9o8qsLZUkPiJCp
         pTbnHu8K7dvxERoxVdbOJQcGtmD3VaIicbsyfAG2E7DpyQwG6rg3l2zGh5QejUzW9NHf
         DAp5+9/Bqc0OSH2yZPo0d/hW1YoKnWF37TqB0ie5ZmhKPifdgm/xLyuwTvGXGO7k1y+1
         m9Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWcLbw8PJLRRdb5EyUbeLMymAElj4aZSU+gSl0M6gwIojRkjqvUqetMZH39yVFHHGcdSa1EkYVMBDlsT80=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ZF7PJdE/ayAdUtbbsU+5WFFL9NTCCAA1p6tf2KIoKR3znfmG
	KsEDpPKmKCd2tjMRHDWa4Q3Nk1tLskpXLAm3dILnr7owZu+SbN39Lr0R4ds7OmFQVM+jLToRXLR
	z
X-Gm-Gg: ASbGncvFjFjwFgw/BTKdSD4AZV0gpq1SxvhbHV1ORh3po0+VdtL7hhGW0psVFNOkQnQ
	EJ+vQS0XKk3ZEWUKxo2USyhczA/RbVFgB2dh5Ah9A2jfHUIp3foGMWhH9QMDpULOojO/aT6FM3F
	IMOr4CJXPHVXYrmeLoS6KRqoiV8xWGfs5GC+Kbf3bRV5zb6Y9pU8za9T7ksyoo5X9QylZVDzcLn
	85UVtPzNlZkWntGhtXcVG0rIXAe9CGlgg9RCTiPyV3uL1+MPApioVaweB+iJdWjxaDtsJNvAoiw
	eU5TKH+22I0rScJ0r6Z5HzgRvn2llE9gW4BZb1cUJ8oEflQrUNeF9hiqntuXc5I13Q==
X-Google-Smtp-Source: AGHT+IFDEHAY2spz6XN78q9tKTbovNRQcUGYJvyfetjPsHzMLFb6n2VUCFlOhhXQtXKzRR128JEI+g==
X-Received: by 2002:a05:6402:90d:b0:5d9:f21a:aa26 with SMTP id 4fb4d7f45d1cf-5dc5f01e919mr31131773a12.24.1738682947627;
        Tue, 04 Feb 2025 07:29:07 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcc9ae8567sm1002301a12.60.2025.02.04.07.29.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 07:29:06 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso1105620666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:29:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVfeNsKLUcVzvOTH3RRQepbyLDOa9I2iqA/oDhSWIM1UeI2veapuT4gtLCuxwkWZboIHQty7YXd0A1Aqc=@vger.kernel.org
X-Received: by 2002:a17:907:320c:b0:aae:b259:ef63 with SMTP id
 a640c23a62f3a-ab6cfd10a02mr3654141466b.34.1738682945934; Tue, 04 Feb 2025
 07:29:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204132153.GA20921@redhat.com>
In-Reply-To: <20250204132153.GA20921@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Feb 2025 07:28:49 -0800
X-Gmail-Original-Message-ID: <CAHk-=whwYt=hRk3EG7ASM-=xi3Xp7f82Ltqa=dtbVfZnGhN9ow@mail.gmail.com>
X-Gm-Features: AWEUYZmUYfzAccET_47o6avzVE9XrIdskZ_I7yuPc5k_QPJG0dx-dTFhKbX44Do
Message-ID: <CAHk-=whwYt=hRk3EG7ASM-=xi3Xp7f82Ltqa=dtbVfZnGhN9ow@mail.gmail.com>
Subject: Re: [PATCH] pipe: don't update {a,c,m}time for anonymous pipes
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, David Howells <dhowells@redhat.com>, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Mateusz Guzik <mjguzik@gmail.com>, Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, 
	Oliver Sang <oliver.sang@intel.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	WangYuli <wangyuli@uniontech.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Feb 2025 at 05:22, Oleg Nesterov <oleg@redhat.com> wrote:
>
> @@ -404,7 +409,7 @@ pipe_read(struct kiocb *iocb, struct iov_iter *to)
>         if (wake_next_reader)
>                 wake_up_interruptible_sync_poll(&pipe->rd_wait, EPOLLIN | EPOLLRDNORM);
>         kill_fasync(&pipe->fasync_writers, SIGIO, POLL_OUT);
> -       if (ret > 0)
> +       if (ret > 0 && !is_pipe_inode(file_inode(filp)))
>                 file_accessed(filp);
>         return ret;
>  }

So I really don't kike that "is_pipe_inode()" thing.

Yes, it has superficial naming problems (it should be about
*anonymous* pipes, and that should be reflected in the name), but I
think the deeper problem is that I think this should just be a
different set of read/write functions entirely.

IOW, we should have "anon_pipe_read()" and "anon_pipe_write()", and
then the named pipes just do

    int ret = anon_pipe_read(...);
    if (ret > 0)
        file_accessed(filp);
    return ret;

instead. With no tests for "what kind of pipe is this" (same for the
write side, of course)

               Linus
