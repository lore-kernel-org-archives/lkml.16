Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B2A6EB7C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621031; cv=none; b=qPGTR/FMfVISEm9bTBQyANrfDPwJOuDUK+5UlGdiHkVBxwUOffpiY3jSq3Kz8xT7Si+UBaOhoN9X6QqyfM9J+btd9gG3AavfeEOrOCRbUkYdzGrPsnXMQxTZTH6P9604tXySw+t465FbKsSqAvMw5IJNGXhsoPcU+33xMJ+7tf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621031; c=relaxed/simple;
	bh=XPwJqN/DLwnx4UfHhvmJsw45VIYqMIHl4vnc5jJcUo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzY9/KEf6e+5u1kWudY/Asihzi3OsVcv95okQeELxj75K3QBxC/KVkWv0dLlI9gPRvY7eO7Zk19jKmx9lt6tL/kILlDr2PphyMtaiHrECbtxOyi1uRa0k22J6pV/cBkEcguuIf9+F9uxZY2XwYhm8wuIGPtdLjwfBw0Oo4K853g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SrstnAvR; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SrstnAvR"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso2342057a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743621027; x=1744225827; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J4g7l6kPCIyuZkAUkVMXFodKcGrS/UGZPoV2yKxx/ik=;
        b=SrstnAvRZGJbgXzJbWo3G8FZhuZYfkhw0obmxXDfO64J5Emh+nasOxM6691ajhKR/Z
         SJKv29RdyP8lltiEDT4opfTTO0bw6fh8dS8y6XsM/mxR0Wx0I3m1NUge9I4h6B8+osq7
         CFcs7+YkoOvQjqu2HLece03LWEVim+stzULL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743621027; x=1744225827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4g7l6kPCIyuZkAUkVMXFodKcGrS/UGZPoV2yKxx/ik=;
        b=o5dEzEtsIRaaYNQ9yMdky7tAa5yCsTP3wVLCPeMA3ZJ7lwhZj16aAxPpUvYQOUAKOJ
         nuXN8+Bt5rRUydCbl41mdgQboL8UQBgbMfrJc4JRQ3Jt2DVTfo2Ug5K4fNLkRwUrfVag
         +54x3mUKsqAvp3Zyx/DazCjL2gDSTy/UNdpGjVQq6JMGuS5NmoXD1zFeS8ELPyGT8Vwb
         ng7/0V7wjshBTyAwxfOvpMaDnyzaaa07PcRuuQ1aehqoDr3qwJCVFU3868zRr74UZCXx
         2erq+aLjGyv+cEygKYKS1+HSwODUmExytttKs3vtGFM4apmdNlPCLVQTrIMxVusFejYd
         /iOA==
X-Forwarded-Encrypted: i=1; AJvYcCXTQalBcOGLa4nMg/o5M4qK9vZR7DUJUxs9g81/jcnC6yk7FmIayo3IE/6coebyGtJeXk0fehnkcYCiPBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGfpHG16E3UXI5A9h16cS4X8IriSrsTrdwPYes461NKKQ+6Ppx
	/vERd6ZHTzXg46uQBnsgtuRnR9qG5R+neBjtbdJB17Xefdyal9yF08kuPNtQTwQg/RX4qpxds1a
	1Jew=
X-Gm-Gg: ASbGncvi5SH1rKGk8Pgm5c3z4JMyTVxR0vYOl8hUfBGTGCCXzmYIe9qBnBK7WeohDVU
	Wh4FDV2HYCdcDfRdDfl3dfWyiwbsKGhBYppwSBeqC9wlTwYIE5vqFvvHUBxjnzW+HhGTDTQYpF4
	G0JzrRL6HxJK4Hvvzn1H27TcOdKIQmkWZj90qZsprO6ma8YwX9Zs9wzg/5NsBrp6AjOgnJD7Gpj
	MZEz+LsJkiEPuRtaeONxHuVooK9dwo5STRbr6/0ggfDzFMrNLK/OmP+e1kNtUzw0rD63X+99Y2P
	oBsLDCf1Or6MJCyirZ4okyk+3x284yx1onBq5Hnf2BelmORDUZNFAbjrWMhHCzwKEMgIzsgfFx4
	yzUdBvfOYEfjMOQCxxrRWqt8j7VuSoQ==
X-Google-Smtp-Source: AGHT+IHpuYII0GgJPRJ1a0PH4XQw+gRPQj8Qz2Nr1MtqWQUE0AfWGm4g8NeU2Xr9OceeNsOPw31RNA==
X-Received: by 2002:a17:907:6e9e:b0:ac7:3dd2:db90 with SMTP id a640c23a62f3a-ac7b671e786mr59896466b.0.1743621027067;
        Wed, 02 Apr 2025 12:10:27 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196d76bcsm950967466b.155.2025.04.02.12.10.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 12:10:25 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab771575040so237378866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:10:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxqTiEiJ0ALXJTCl6rHtJ5F3fba41vH190CJ/p4CxUZuaGXvgGUxGLvZenVdW9mO0Tc4KhNkX/l+mKyps=@vger.kernel.org
X-Received: by 2002:a17:907:7f91:b0:ac0:4364:4083 with SMTP id
 a640c23a62f3a-ac7b6762bf7mr69469366b.0.1743621025347; Wed, 02 Apr 2025
 12:10:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-00cAEKkfvyNto2@pathway.suse.cz> <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
 <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain> <CAHk-=wgfX7yfDYVOF8VqRR60RaBFbK=FZMLqOx0nT4ckMnS0ug@mail.gmail.com>
In-Reply-To: <CAHk-=wgfX7yfDYVOF8VqRR60RaBFbK=FZMLqOx0nT4ckMnS0ug@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 12:10:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgWT4AOFgMxSBVqYD9dVPXTr775UAwyX9cUOz=0ahf3_Q@mail.gmail.com>
X-Gm-Features: AQ5f1JpnFHuWs8rMPpcVKyYa-fQGIVrag5A5SlDqPtSMoQK0ysXgxtTUrNNHE5I
Message-ID: <CAHk-=wgWT4AOFgMxSBVqYD9dVPXTr775UAwyX9cUOz=0ahf3_Q@mail.gmail.com>
Subject: Re: [GIT PULL] more printk for 6.15
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 12:07, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The whole "link to original submission" is garbage.

Just to clarify: people should link to the *problem* report. Or to the
*debugging* thread.

But linking to the final result is pointless. That's what in the tree,
and any subsequent discussion about it is stale and late.

People sometimes argue that it's good for belated Ack's etc. But
Christ - they are *belated*.

        Linus
