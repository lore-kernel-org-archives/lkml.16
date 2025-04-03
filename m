Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A802512CB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699133; cv=none; b=iSqDOZSbfj76qERXM4QaHTwJDjscBAsB3RXeyOgP24SyJI6yk2hDVP9wtlowbddlAX0Ls3sd07oxjq1R9INUF00Ma47/9l8VibAPQcpo3bGZWYlmGE/jo8g+QPpvl78MYJb3gPp4nM8pruDaMWBKdpZMjBcvzk09liM5gZXXpco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699133; c=relaxed/simple;
	bh=c4k/wLTjjWRN0G3MQ4/ueWmzFfj6tAoe+LhodSB0qc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMd2Os5VA2Zzy+kBYvnhAvroomESKaVl1ngpvNeRXErsBZFxLcx1wz4XQg04ORo21/2eg00QtZ8jJan3k3R+Xrmu2Y5xD+sDslHSvIEOLJyWQg82c5Z6XHhjveTu0VIUENhBkB0dQJNcujIL1LoImA1C0uFiVJEsNfq8H/ojPnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Qv7aYP79; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Qv7aYP79"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso4109036a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743699130; x=1744303930; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zxz3ZOpXSZ7yPtvl/GON9cIiqoopL7kPorpXa/Hocqg=;
        b=Qv7aYP79p0E9XYjOP35plaGcc3ao8rtOdXjwg7+BaxhFka4M1dqj6XAvsAZfgv+ZYt
         WjNriiZBFwzCdBMymnYVDZWJUEIVq58wP9GkFPOEwMI7va97nQqYxnWfEZIg+cLYYQwn
         LgNBmxuD54tE5UuinSw7sXgj9Y6KyiwAR5cIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699130; x=1744303930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxz3ZOpXSZ7yPtvl/GON9cIiqoopL7kPorpXa/Hocqg=;
        b=SX+U/L7swkaZ8Hpojj5yX38UZ4OXE7mN4MuGfvlqcuYkNg8nS0rvrOXLVst2sTdWM2
         JW9Kcw4LDIdsJE+UMYonM8GcV3fPwfzOjIPWVH664Mnx7yru2pb3N/F7ddYPjZ/YJjy/
         YzbHmZZlXT1//wk+aSBPAR+Hs4zbUVHTma3r5Lwlofraq9u4mJXlPeLr76FXPX3ArtKu
         0JfzmMrOYhWS77H9Ru2aDFA8pRp7zlR9bd1+apGxO7dFeOmcHqfMBk99qew37aX6B2Z7
         31jFU1+dcf4CF3dTnsKkJpDbSNEHaulbKN8spSbDkBwPcKrAPH/dqaBo7UZn0tiZ5kqu
         iQXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIhI2J+GVoVKOfaSF9S9N6q3ohmKGva+dIreceRuBR6RaR50Ia74wj/P8qmaQfTO8sNk5D7IvdnB6jOuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgOonykxqwoBonl2q2CDR82MRQUyhiAa2VNWqLoqb8al4hr3Ig
	6HD6byULwVjXKZ1Bh/VsyxNGmz4eevC0EA9iAQrA0XCx+PosVuhZQjTd78tJ6O8hZsAAb0Tpghu
	1794=
X-Gm-Gg: ASbGncsEgayUCMuOaak0HqYoWcDqr44wJ9obV8YtZvdD57g/qdML6wQaBMnGwU1Ae+f
	KpNKXbRM/KkeLjyEPKd2gRiBJMRfJ7HDN63NenGF+563Gz4y1j9vXA++qOxXFDq+Hn88jSk+geN
	s0/GvY9KE2AaSK/Ja5LY7FFsmxS9+f+qdyiNssYf+LLnA8PuSwstGg7m6tqawJ8/jHPisMphD07
	ZLtveSU0WIh9Pm86mcsXpqhQYZyr3NKpufuB30DOlLlU5VXnUw8Jk9PgiZPpV8Z1c2m0B3rqrzT
	yV7PGwO5Y9u2pLp+PFD2awXU56CxEs96SjFKnndBTKK4d82ej68G8QhZqz1jZpJT5MMFUBNKHYW
	k7JMFzThb5cWnqEcbiPM=
X-Google-Smtp-Source: AGHT+IEx2C8kZSu/0pev1oeyb7uHKzMlnGC9wv+H+yX9ustSDXv0KkLzIpuxO2BIu5vlTbDZPBr59A==
X-Received: by 2002:a17:907:7291:b0:ac7:380b:8443 with SMTP id a640c23a62f3a-ac7d2fb85d8mr886166b.19.1743699129855;
        Thu, 03 Apr 2025 09:52:09 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5c93asm120135566b.14.2025.04.03.09.52.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 09:52:08 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso201832566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:52:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTQshbUGDdFdlwE8y7/RHxZx/hJuP/MgbJadwYWFYSWvtRs9SfhTSjfxvxa6ruYT4mIhu7wdteat9oVOY=@vger.kernel.org
X-Received: by 2002:a17:907:970c:b0:ac7:3028:6d67 with SMTP id
 a640c23a62f3a-ac7d2e9734cmr3856966b.16.1743699127992; Thu, 03 Apr 2025
 09:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331143426.947281958@goodmis.org> <20250331143532.459810712@goodmis.org>
 <CAHk-=whUOfVucfJRt7E0AH+GV41ELmS4wJqxHDnui6Giddfkzw@mail.gmail.com>
 <20250331133906.48e115f5@gandalf.local.home> <202504030941.E0AA2E023@keescook>
In-Reply-To: <202504030941.E0AA2E023@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Apr 2025 09:51:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgwSx8Bm6c=UEe0Xh6MvkZ9aAYhYBTwUxYk3Fu6GehHVg@mail.gmail.com>
X-Gm-Features: ATxdqUGzamms3HBwS2oeFKY1M4I1ihINB3lWR76jBDO6-iwI1TuKjoGv0rxX3qw
Message-ID: <CAHk-=wgwSx8Bm6c=UEe0Xh6MvkZ9aAYhYBTwUxYk3Fu6GehHVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tracing: ring-buffer: Have the ring buffer code do
 the vmap of physical memory
To: Kees Cook <kees@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 09:45, Kees Cook <kees@kernel.org> wrote:
>
> pstore tries to work with either real RAM or with iomem things. What
> is there now Currently Works Fine, but should this be using
> vmap_page_range()?

Yes, I don't see the point of using vmap() on something that is
contiguous but is made to look like a collection of random pfns.

IOW, that whole 'pages[]' array (and the kmalloc/kfree) seems pointless.

I *suspect* the history is simply that 'vmap()' predates 'vmap_page_range()'.

But maybe I'm missing something, and there is some limitation to
vmap_page_range() that I'm not seeing.

             Linus
