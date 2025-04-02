Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935D52AEE9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743613970; cv=none; b=AJKDrsEDiQENPooXwVqesKkWUNhemiVqRP8I3kHTQ/b8df/Om1ntuPIrC5IJ/Yk6RwKcHgzQpbOxe3JE8FktNH6m7qr2GDrdqCfel5FkZn1Wuf8XQA0bhw8O86BlKoAncYbZVmEjwLzmhTeU2eocNmISuEUnqUPiU49B8sElPyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743613970; c=relaxed/simple;
	bh=M+88wIcibNXlkVrU9mXUvjqfg/rJqIG5T8+nWXQU314=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyanZKbk0e+JrDjAPx6uLvrPr2TmfSdQFMW3IgND5RhhxUeFAYytQ/gM5yqjzxCuVDT9UCHMSt61W3hSWZSK8Y6sLWAP6uDPGNsE6MvnIXccCP+F+InZHC/Nu/xzrI+XBydTEvx/mkTclTd5wOHXJx5EKVr5J2FKV9LCtA3MVkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YlYnM2oy; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YlYnM2oy"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2963dc379so1099231866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743613966; x=1744218766; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YVV1LWawFo1VyqHoXteM+f/Aj3/PTJr9pv2oltZdO1I=;
        b=YlYnM2oy43gAUaX0eLXeyQkm8k9lpGXmPYqja1J7UgJBvRXOCD35K6l4m9iaHUgfLw
         tIspvPoBQS6DcnWvC8fIjEuEzQtyyxl/npIY5opZw2Gsw60izkJBRuSA+hR4MGfLVNUh
         63ZSi10NO42j4REjFJcZRWgnJKgL6KuBQwQWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743613966; x=1744218766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVV1LWawFo1VyqHoXteM+f/Aj3/PTJr9pv2oltZdO1I=;
        b=CjGhgMeyigNuI9NxG06w1sX1PTJKrBaGWkvfjsrrynQnFmFJiQ+e1y4Pur3ZCersW9
         2dsbGAiuiKX4EIlwNy0lslY/8zK0OfTYbvMtXMr/BxBrkELurAqUn0fcse4Ne3RHO6w6
         yb1JuRtP2FK4REav0jFiB1KTZjIEonQ7g8rD+yE9iOrN8QS1dGvzDLfACPDNCnowwDZ/
         3t4/JkgZ7sUOtRUyD/ywQv3vRv5KtEygQz1NAQ4dM7kVBFG7NqS+l9IMpCWHRTzamrfN
         Bn7teNv4fCJefVj9z+EMSQDX0mjiHOhB5CFBLRhErEQSO2jT1ZDBzLU7OA+SsoNmvQue
         IulQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP2CY9y0TtOW5U6xlwOkZ+8TfonaqDS3KMpXm9PqkZxuJmA6hz+Bx+YdbJ7ccP/3cs9YQBk9TVWgCowDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXoeT8jbKcIwRn3EwnFRC5a5N/0Z0/Co361oyDqwkFPC0baT5t
	MgwyKiaK/u/BjtMuN2aHSfJotapvKYYiFTWIqGw5hcsJ28ddF6FzQNhQ97V10YTBDD3aGqDdBlP
	cL6g=
X-Gm-Gg: ASbGncs+OIE3bECNpO/okHZd5cO7bY79GXEhPFwx1AJOsvqOGp+Gw/qjgQ7Q+KdQhfS
	Gz6BqMGUbqxWZQOPvPhbGJa+q37wG2bVKwEF5CwUryAyOyg0kceqRN+LryJqT6JHE/xr+suePwT
	peeqHsnvbtACbBHNS+Rsi55tQASaGaDJHtE0TP9jq5gZ90lwjy+YbKu7bME1WdeXfcgTQQYk7P/
	1djC59gcT3ynLuAYnDGHFQ3IH6z7dZO7kJkHPmI53hdrh757rWar1aCNMzn8g2r5WU4b7973mjK
	xPJhH7ooqxspfbbM75pVe2+MxB0ZzsJSM3p0fFCeN8qxf1Wup/33cvfmI7MbQPG9u4i7UGdMTjI
	1hWtYDxoEkOUMNhLXXy5WYavgPEW62A==
X-Google-Smtp-Source: AGHT+IGG3JUuP822hqdQW5IsmYQT6ztBRZk6sWVBBGdwFSh2t0rdGr4tkMrfZ35RGLYgL486/to/7w==
X-Received: by 2002:a17:907:94c1:b0:ac6:ba91:ca4d with SMTP id a640c23a62f3a-ac738a5ad2emr1606213166b.31.1743613965574;
        Wed, 02 Apr 2025 10:12:45 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16d3634sm8696411a12.19.2025.04.02.10.12.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 10:12:44 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac298c8fa50so1151514766b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:12:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWA04szTHfKFN3wO+yAd4TJJRmZ4RpODTYdEIawfB4aUyJQ0UeG6BQC2oL7V+3fub2y6fBeIwRU61HZmaA=@vger.kernel.org
X-Received: by 2002:a17:907:c1f:b0:aaf:103a:e6e3 with SMTP id
 a640c23a62f3a-ac738b4fa46mr1501644166b.43.1743613963920; Wed, 02 Apr 2025
 10:12:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-00cAEKkfvyNto2@pathway.suse.cz>
In-Reply-To: <Z-00cAEKkfvyNto2@pathway.suse.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 10:12:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jrz4B-YeMv0VReyLm0sNwe0AKkz4BT05CVKnHGwIakoT1rqvU-uAhJPiUE
Message-ID: <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
Subject: Re: [GIT PULL] more printk for 6.15
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 05:58, Petr Mladek <pmladek@suse.com> wrote:
>
> please pull few more printk-related changes from

Pulled. However, I reacted to this mess:

  +#pragma GCC diagnostic push
  +#ifndef __clang__
  +#pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
  +#endif

do we really need a "#ifndef __clang__" there? It's "#pragma GCC"
after all, and the diagnostic push/pop are done unconditionally.

I can well imagine that yes, we need it for some strange and stupid
reason, but it looks wrong, and the commit message doesn't explain why
we'd need it.

And once again the "Link" is completely useless and doesn't point to
any explanation, only points to the submission that has all the same
info.

I hate those things. The disappointment is real: "Oh, an explanation"
followed by "No, just useless noise, doing a google search would
almost certainly have been more productive".

              Linus
