Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA6725761
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750521305; cv=none; b=VLgQeSaYosgYMTzthDdWW+jfRY3/Tphx5GEo53W5Ve3MXVMkFNPlvKmNB/bEbqoiG1CQWI85jrj/d5/T/FmnoUQkLUV60ODSKySJBVz/re51nIDGfM2FmO8mYnpfgEmHFqkyTvzUmIp0nedXTFUljQnOCku1rHR2sI+ooUyQQxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750521305; c=relaxed/simple;
	bh=CIn4Wr9BsGwm4DDKvO6sAJbx+1WscStWd1swyiS/SOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFyn9YJu4YJ/wc/3FNKaCI30qvHylMuEttfQiKaQ+LFFDpT9nS0aYRjVAzhWKndbq+IAWR+bN8UuvtGFqo/hUaSZ/IYsM8DNdN47x7puEepqGDC76+B30MWgS9x2wfiqOGSOx23cNOMKpFJcK7Ayj1K4EVVOeQ6MsTjU4kREqb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Zb1Q3umd; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Zb1Q3umd"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60727e46168so5220734a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750521301; x=1751126101; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s2+CEQ8KLOqllFWOyXKexOZmK5IQz1uq7JRBj/abZLs=;
        b=Zb1Q3umdCBGfhiw6fs2H/hsqUan1a37sLX+fnv3wZWZfri4iPAUhiN6FxYgKJjwT1r
         mp0+Ys/oR1TKF1YMBUeGnFwlB5VzBM8IVp3c0+vj9Zd7dsjoKbIIrZqF3jDsl/3PGq0B
         6sDvkVoUWLAljVSU4TMpTYX/qsJSTzvDENhq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750521301; x=1751126101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2+CEQ8KLOqllFWOyXKexOZmK5IQz1uq7JRBj/abZLs=;
        b=ANshMTGuhCiG2ooOVrClV8pi2PCB317uxMh+ccJCJ2LogLEY7yhDnDq939jNYV07PV
         EyreFCqLLuicn/15fNayHU26AwJYC2Gl9eegNCZQugOVNFn12nzNXnNN5rwD+LkpN6XJ
         jY3vkpVY2UJdVdTH1nig5BV72n4Qnquqr26rSSaKRVA7PLu6Is5Lz43SVV95WkP92KN5
         axkteu3CIqWs+e1nyVifPcSOc8m8hwyyc3hS7Ezt2txFYpZdJw3OpRfpHI3zR0UF4Ua4
         9JB+B0bVUM2aumFvcb+AZiRCaHidhsW715cY/MWoqqaQeOlod1UVBHQUXVGT1/q+WNgf
         /VNA==
X-Gm-Message-State: AOJu0YwOF7wPJpZkfWTbTYzuZZ21ku3PnCuJ+2uK/F+2Qy11lpHTb+qn
	T+EmlGC6UPh5tGR3vcyo27CBk5JuAysmQckbf7fRyOYttflQrq7jp5jrJML6o5D0BwBgLkGPZJC
	nASgwOUw=
X-Gm-Gg: ASbGnct9ebvDU4gFuPmXJTKYsb05nAx/OudtfcwB/kweE1l/pWyiYajbe8MOxvhefAa
	s7rCauekzM/BlG7X3cICRoBvwoLSc9DxcsXlqlR4PJWCypRFgB6tovexrkUHBRQ7ruWuQPzt6Jm
	JOCKWVtLri8m8rYG1nkamH3NcnufBxU7MPxxnK2EJS6nrppo2rL18Iqda6v3pymo8rtNZsRzBxn
	dSG7UWRdSTf3OMVBC7CGqIRkuE2zYqY8w5ItCp/5f8Eqs9GInX32RtgzLDvr3Z+t45AZkl8yV6z
	3d/MsGr95ex8CxPgJ0BCekvQh9139FgCt5Y3kiCZSz/WKFQfZdU7U+hrltT+x3Lq9OQciqjKZ3A
	tG1RKrasa/x3sqAe/noNykxX/oK35OtQXxRtp
X-Google-Smtp-Source: AGHT+IG93VElykLn72IAD5MZ1CFhxBKSNv6rsrbeRLwhCydhg3oip0IpO8qB80+xZJ5/tFjc7Oz88w==
X-Received: by 2002:aa7:d71a:0:b0:60b:9cf8:b218 with SMTP id 4fb4d7f45d1cf-60b9cf8b656mr1381787a12.7.1750521301517;
        Sat, 21 Jun 2025 08:55:01 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18516e42sm3435035a12.3.2025.06.21.08.55.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 08:55:01 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60727e46168so5220699a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:55:00 -0700 (PDT)
X-Received: by 2002:a05:6402:35d4:b0:607:4500:2841 with SMTP id
 4fb4d7f45d1cf-60a1cd33098mr5862983a12.25.1750521300614; Sat, 21 Jun 2025
 08:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH2r5mtz1-JLM8PEZngKOd4bwESBLU+bw8T=ap5aMmJ6LOaNiA@mail.gmail.com>
In-Reply-To: <CAH2r5mtz1-JLM8PEZngKOd4bwESBLU+bw8T=ap5aMmJ6LOaNiA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 21 Jun 2025 08:54:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZXRvTnAwO-EcheuHkjOmq2YMua9YC3sbaXYBQ+FC8og@mail.gmail.com>
X-Gm-Features: AX0GCFt9mVG_2r2gp_woN01q6-UhURhH801th1fVHPSJET8cZsUmhNVPCYqf_ko
Message-ID: <CAHk-=wjZXRvTnAwO-EcheuHkjOmq2YMua9YC3sbaXYBQ+FC8og@mail.gmail.com>
Subject: Re: [GIT PULL] smb3 client fixes
To: Steve French <smfrench@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Jun 2025 at 15:57, Steve French <smfrench@gmail.com> wrote:
>
> - Fix reparse points (special file handling) for SMB1

I'm not seeing this being a fix at all. This seems to be entirely new
functionality, with not even a whiff of "this fixes Xyz".

I pulled and then unpulled again. Because WTF?

If it's a real fix for a real problem, it needs to be explained as such.

And if it is what it looks like and the explanation says it is, then
it damn well shouldn't be hidden in a "fixes" pull and tried to be
sneaked in with the pull request dressing it up as anything else.

                 Linus
