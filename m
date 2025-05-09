Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322952327A3
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746807586; cv=none; b=meWY9d/mIlNlzRAeY3DSS6D9RPO98sGjSMwL7rQzSAyaroex5zvFZTmgnr0Y0n/N9WT/oC4b61BRIcUAZ8aXubctP6DPsVyts26WE7jtlA+vCCbKMIOe1aPM5pTv7yNKW73Tg7pEQW5tRC8wzXgfCVuiWqoHRXg9xQcEI5i+1uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746807586; c=relaxed/simple;
	bh=nuZysdXq7nOnE0VBFR6UJOjGIN3aYFhDt0WDvBmJ1jM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ace8c2GSXDqW4NqYIq0hO7nEa8ESD95HBXmpod0IyVwLAUv0588Rg9I7ecnNuO/r+BvDFiCfc4WlLr1UxXq8utH1ZJhFfmt6/0vg4u+WzwvB0r8BBN6nKQVsfch4RKlvn26Pqr4w/tHJAN8MIkbBSVhh4cN1DO9ZSWii2qCWWaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZtE6me9u; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZtE6me9u"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac34257295dso377721066b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746807582; x=1747412382; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rrAr9gNCFzbksNQwY8jdv6TV8DefUAd1zCCFiYDNNAk=;
        b=ZtE6me9ufZc4uj7BHfTrTcMOoJlzUZ3n+hx5f1mJqpbHvUHZ74ba/SHFpz1xDkjtca
         4yuNbgpatP/OKh8YFkzT4zdO2C4iUr21AOtlRTZbXKdNoOCHeCXuZS+u3vY5XR2dkw5A
         qTKMFUCSxPsS9hFmWyk5DMk17KapAfTI0sk+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807582; x=1747412382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrAr9gNCFzbksNQwY8jdv6TV8DefUAd1zCCFiYDNNAk=;
        b=P98WTnQo4IMIeqgZeQeidWMepZtgyOhdH9fpW/U3FZjmNTUY6VgnzMNdGZIMyJgl4q
         1UFxDrhVnAKV5xkYpqDR2KCObuIh+NLtUPDhNgUlnwKzNHp59nLcQ3GO01zWupfhw4cm
         0ujWRxlvD/mZLMV8XAYz8r3myG81o3ZELGKXn/xw6HL+YbgOREp8qNR6NqK7qLaYNypt
         6sUs2BEJQivkadIaXyAnm6YT8i7yB+JcSdMGDg85WA3vuK0albBoXieZwbOifRMmz75E
         7y4X3jQwPeu4JhO3hv8OYAaFDy6FEJmjCz/adI+aAVnvZFfdYGPMz4DXrONK89yHM+Z9
         mc8A==
X-Forwarded-Encrypted: i=1; AJvYcCVIHL9LVYjJ/0hrCN+lpnFMv2fcnBMt/eYEANMVP+/WG6iGFgL/+Bu8aYskTKBXgWli5AwQZdvmSb0bYLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd+t2KYMzSWMKdioEgtY3LeuU52IanyGRLxa8NtEs9kdk6djEo
	8TPjbzk1xY6MP73cwMAVuy99iBZS1qbV4LsTp/hZMLSuO1aE9LflnYJ51jTIiuqH6MVFlqdB1Ye
	GMC4=
X-Gm-Gg: ASbGncsyx/i1oUxk5+yh8tJQJ2bh2s6chUJBDHlBOuYEbPwOwckcyHL2TGvm+TgpA9o
	ymQyTwxvWsgA9YxmOVHhNbI8Klv90gPBTWw9Io/FKyhkvlLdDYH4B1Jr+Iald3Ya5uH4LctTZO1
	4PTD0B4/g82Z4KqraYTGTSiRnDP4lwE7YIEs3IalaVdncVxdB7doBaUfUa7HhV883vbeoD7T/bR
	UPPRkxJALNylBjhznSnCiZcZJElq/fCFviuMoGWVjTNk/hcCwUfJW8/bVd+Muaa0w9GjnfnUE1G
	nrJ/Ia73Z7ZThh5n0jYMhX3AIs5aaw1E7AmcRICMuXflHHYNgtwD1Vanwic9Kz+MzyP/5A1KZTP
	sbwuFm0RCamTbR4k=
X-Google-Smtp-Source: AGHT+IGW5uE8fRO3QYMFw2Cp9tDD8ClojFfEoQMld4RTBjJAp77UcC1q9q4GJ4zHMql80qq0CjUmGA==
X-Received: by 2002:a17:907:7ea0:b0:aca:a688:fb13 with SMTP id a640c23a62f3a-ad219057ff1mr435088866b.36.1746807582233;
        Fri, 09 May 2025 09:19:42 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197471acsm169700866b.118.2025.05.09.09.19.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 09:19:41 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5fbf0324faaso4517802a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:19:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQng6mpPnuaB3+BQCjqr3yf10xCk13hj7wqSSxlmF477xuigT04sQyQS7Cu9Eoyoo8l6Pbqz9ycDiGzVc=@vger.kernel.org
X-Received: by 2002:a05:6402:50c6:b0:5fc:9759:395d with SMTP id
 4fb4d7f45d1cf-5fca0759b23mr3944959a12.11.1746807580754; Fri, 09 May 2025
 09:19:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0e82be0f-a305-4aba-b9ab-79596f595277@suse.com>
In-Reply-To: <0e82be0f-a305-4aba-b9ab-79596f595277@suse.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 9 May 2025 09:19:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjNj0vHh9v6-LTrbgtq=o6OS+RN3u3m03nV3n9V+urGtg@mail.gmail.com>
X-Gm-Features: ATxdqUE930vvXDaPhP3I929-LAWLeqQARrCJt4USO-NUSGrkJQtb4j3_xdmwKes
Message-ID: <CAHk-=wjNj0vHh9v6-LTrbgtq=o6OS+RN3u3m03nV3n9V+urGtg@mail.gmail.com>
Subject: Re: [GIT PULL] Modules fixes for v6.15-rc6
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 08:09, Petr Pavlu <petr.pavlu@suse.com> wrote:
>
> The fix has been on modules-next only since yesterday but should be safe.

Hmm.

At a minimum, the *description* of this bug is garbage.

It talks about an "uninitialized completion pointer", but then the fix
actually depends on it being initialized - just initialized to NULL.

I do believe that it always is initialized, and I have pulled this.
but I really think the explanations here are actively misleading.

Because there's a big difference between "uninitialized" and "not
pointing to a completion".

               Linus
