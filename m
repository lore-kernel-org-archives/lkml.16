Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86231D619F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660807; cv=none; b=NphomG6VzCsCzt0AsCbM9JIEgdo8GFkNaOENDFlw7UXueo5tAZ4Zy6B/QvyqP0voyJ8tyQflpdHAZk3OpZa11QMuaBngUcfmcI643kabTwzUhbWI2XA2kPoWZQWkHmVZTDxeO+tjTYZUXzlInM8YLfwzw8DidWe5W3Jz92oFdh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660807; c=relaxed/simple;
	bh=Oe1595a3GbS+l5oSBeAY1QsFDtWEuKwGx59hc6WTWW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AEYYsTn/5SW2vtLs4wKPjCEzhVm0LTl34nBbxKF9Bm24wxdVRjg9liP9z3s5W9g9fm2NyveaX6hHdBGSJZ8hxLC3LtVsfGcmAzkAcnSeVG8cI9H8WUEwfFWTmL9+pNUwiSGGHDxLAPIdmaiBsWnbrBv7OZxsyok1HDOJDxirnVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OfAeYFYg; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OfAeYFYg"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acae7e7587dso349207766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744660802; x=1745265602; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GuKnl7vKvuhivlDBXfVU770x/Uehh0Z/3wv2E0YnWyo=;
        b=OfAeYFYgF3o0U0z1RNN+eZMGbiD4H3M31aIZgiaT0x+lZyAT9aqMXJ7UDS7NUblIp5
         siMN5TMse6Lc7BcrMRtQGTcBERBWiF5tfgOh5jk3pa2X/SK9QIYbMozYHCt0TeziKf0G
         ptHhTC1ivPvwjd3w4IsxRTylgz8ZVoKYgwtzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744660802; x=1745265602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuKnl7vKvuhivlDBXfVU770x/Uehh0Z/3wv2E0YnWyo=;
        b=AENb/+hfsHTZmXM0WWHE6IDBh6YpGBqMbh/yXQNyGE+0qfITQhHJrny32bkcivjy5B
         Y7jLC9bgC5aRAlmYUsR2SsTeeNFzsSF0M0rjBp5hNGOlbtlohhkaJjGurSpGc9ejiH0K
         VEPXRyVDncGWWoFHtcsossvMvPSoQOSaH+BDJcs/GA75ZacLq6Hp1vbjX3Ep+GxFFPKW
         18JI02Nq4eUU8vvGNHlbMt6XZOM61pI+0rnAvMq2MH7LZw+kianAAZ0NQAVRDodBsktP
         1QKkm82p7C24X+gjIKA2NNF3yjM0JBERySF8TqdBkX1jWN2uogEESicyKIMZgUqUaekz
         IqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHv1cCZQXZyzTAR4dAMGVFzxUckfNwk8I8v1HcUMSIB2shnPTtHY9j8UCger+LcwYjvJMV6Qu29mf658I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ecEuah9QVworNnmkV0YADPf48k791KKfJ4U2kB71RQrGJ0Zj
	nP3mt8czbXC+xBQPuBugUYDb3jJiPZPixKv4HaVBuF01yz33y5qcibqfPA0vu0OQR7zSAkJGMIA
	AAXg=
X-Gm-Gg: ASbGncuBKNHzMy5bMhUWPw6TIDv9w258o1QObpWY4MjXhB8jemjrdxulbzo1FW8K6W1
	I7wgU4yH+NcCYKYJR0HDiJCT4f0Thpqcueqe2HuTVmsnguQuMmJp/Ct9EpPeom4ILjuSV9g2JBv
	n+ElzNGjonzX/sAIm+6SPfjY5d7uOfhpaL9qAizYJDlo18KEMaRHcLPuneGDr4BVCmtDZm8yuZE
	MR+oelvJvt/bcvadQGGCbWttd6RlJ/gzg1xYHZ+jA8Pn2J8nDJEXR7jzdCY84liSvoRrj25QRuZ
	K9tyygjpq75f54M7hd7FnMJQD5rl4I8LUygehPtYl3WFzCAk6bd1qegQ3qx0A50BkzjVVlSlREo
	jzUGi5/ND/JCtlaw=
X-Google-Smtp-Source: AGHT+IGF0P3d7cejY5rFhfr+TTmp6I+3gDAanqBSXgLXN07osngXHDd6HCbG5VKWVqywYl23aoTmHQ==
X-Received: by 2002:a17:907:9404:b0:ac7:3817:d8da with SMTP id a640c23a62f3a-acad36bd176mr1028479966b.52.1744660801969;
        Mon, 14 Apr 2025 13:00:01 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee5500dsm5361984a12.4.2025.04.14.13.00.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 13:00:01 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso7547654a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:00:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2z9QuvztFPmlR5OpF/Le5oqvS7EaNdvL8kT5Shmnf57MBijYDfpgLa7EpU3wjtCEz2l4VpppX0VTMs/I=@vger.kernel.org
X-Received: by 2002:a17:907:d9f:b0:aca:a687:a409 with SMTP id
 a640c23a62f3a-acad3493c39mr1317258666b.17.1744660800790; Mon, 14 Apr 2025
 13:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414011345.2602656-1-linux@roeck-us.net>
In-Reply-To: <20250414011345.2602656-1-linux@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Apr 2025 12:59:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wir+NJgwwrmRzj_giQYBuXBh=NRhhnPEqMmOM-phANVNg@mail.gmail.com>
X-Gm-Features: ATxdqUHeq_tz9wbsN5mKAeuATH-Menst-DTjon-gy2q5nMRbAO1idwPR8rk3CJQ
Message-ID: <CAHk-=wir+NJgwwrmRzj_giQYBuXBh=NRhhnPEqMmOM-phANVNg@mail.gmail.com>
Subject: Re: [RFC PATCH] x86/Kconfig: Fix allyesconfig
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Apr 2025 at 18:13, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Solve the test build problem by selectively disabling CONFIG_KASAN for
> 'allyesconfig' build tests of 64-bit X86 builds.

I think we might as well just disable KASAN for COMPILE_TEST entirely
- not artificially limit it to just x86-64.

Apparently it was effectively disabled anyway due to that SLUB_TINY
interaction, so while it would be nice to have bigger build coverage,
clearly we haven't had it before, and it causes problems.

            Linus
