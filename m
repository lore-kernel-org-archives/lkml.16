Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BEF2BCF6F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866800; cv=none; b=eX4+cJbP0/8CoR+YIMUPxkZ8ddlc84LINeR3mSZmUqMlFVmZ162A6Ge7HAFmfR2c6eAZrWXCGl2GvojRPnSLQJRna3+nEWeKffnbANwlKwHMQhUJa6PPaKL1F3Imjsli7UlHw5vvf0tHwtRU8jkipzafJd6T6vDY4dTd0TsKu10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866800; c=relaxed/simple;
	bh=efuYxcvP+skPRYGGDBZaIE/0l6fqS0GIgaYwfjG5Be8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zae8BevPd6gB9plOff8rH10VfXGucc7EOLAVObL0MDhLb+43p9mwuQLk5HgAvIQpO2IOrZTXcKp/NbjAKdudQkifA9eeCbhB1qpxQaLrymmYptftCKhgSENiVpPcJ3pNsyW/j0HUVCdWcfhMzW6GuBpEiUigc9jvlqE7EkaN0ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PsfX00sT; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PsfX00sT"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso6418066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750866795; x=1751471595; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NrLwKO1XcHNnhg2ay9rGcu9ksg+hf0NCQY+Nwy5u5pE=;
        b=PsfX00sTSMhzYjG2FK3M0IdlHHZt8zgWWoqL/hSDGp26mhdNwRHWAHr3lYqWtWLng0
         7N00/nzAz7iYJEnVgObXmDxSjEPTC8dYzw06hyyJdrDXR7WpKo4vGiO9Tl+mXBd1DpDC
         8GtbUwluGj1pU91pWHiI68h8+cqskPIlxWnwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866795; x=1751471595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrLwKO1XcHNnhg2ay9rGcu9ksg+hf0NCQY+Nwy5u5pE=;
        b=tnSxjjxKmQDxunGLyx1iqwKsAP0/Vkg7VwzlpuZTyEgL9ilyWX7BikFMOGyv3xjg0G
         P1ER/h1qa2NCmZg+w9kZHl341iOFAwh749kYswrLCr+joNYPD92mkXsKetkJpZYBZou6
         R0N3jQK+Lr2OusyHSERNRdm6Qe93RzVbJmMEi1DQsTkAgYZOgjd0fVfXzKOuCHtDHTRS
         HMTXrKinvOyjm7nTxDH0c320HhxySBODMdqwoMDYqDvpnabtu3WzKjXCANgX4Bg7DmWI
         UUEz1ziT9w5mQMp+ZZdVZwnnvUre6lkzin9klnVJOddQoC34/g0CUBOyGuAMuHdlQO2a
         6Pmw==
X-Forwarded-Encrypted: i=1; AJvYcCV5q3QHE4WeV2XG1OqVcTKrhBEEjKhijaVoWyj3wUIhoSoIBPSiCjoFgmG9siJz3Q9soaIrkVwp47a8wa4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/wjLUqfy7aSQr8XwZnNW3LRml5XhkmxRNMqeVYtPRJK4Ddwz
	okJ5BdNx0m4w1RjwITI+Fxk6VzE7gf6MafhUK9SQDMwy5m8+mPkSVTYeJFYZgdFXOOSPRapMtMH
	IJWhHQQg=
X-Gm-Gg: ASbGnctzb4nP4ULpyMZZicKZtb2Ze/Gm9Lthropru50me71/t6/BPdNPxv0KG9LZg69
	yCSHq70NnHgOsEHN2x1/Hqve+C3Vk/fRk8dGyrkgGAuk0afza/kQzq+J41OQhYh3/vvy9SfvkGu
	KHSo/imu53CFggAS3tIgepyWejK5j03ZFtD1PzJrdKBZ4keqS/GyMpQn3sRT2+8PDrrDkSMM/Y/
	dBJtcuxEQYZpR9766hZw8Yyi3QxTF5rNJRof9C6v/PHz+FAWC3cfj8JrpqgIra17zsLsmd2wd63
	KVGac5cXu+8JXX+ICmHBU9BG85C20XfsGKgzXn52xvMifORXULugo1eLVrYbkrswcx4TTUgWhd2
	6Zr8mefgc24vepyxHylMwHms+ICYsJANwZ2th
X-Google-Smtp-Source: AGHT+IH23EvOgEx2nRwPKvKNGlS1XcmyErbN4DWV6eGW3fi6vu09rQp0TXQzDRLa76wB9XWtU7sExg==
X-Received: by 2002:a17:907:72c1:b0:ad8:9c97:c2eb with SMTP id a640c23a62f3a-ae0bebc5b3amr427049366b.19.1750866794933;
        Wed, 25 Jun 2025 08:53:14 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b74b6sm1065749866b.139.2025.06.25.08.53.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:53:14 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso13979803a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRhzno5CGHG8qDoa1oG/l8m+5Km0cFm9T/MGAIkYEbV4Mo/WOVaO6XMjhptolP/yoLImaSoHnBCd3Vv3M=@vger.kernel.org
X-Received: by 2002:a05:6402:5192:b0:601:dc49:a99f with SMTP id
 4fb4d7f45d1cf-60c4d35506fmr3264384a12.18.1750866793588; Wed, 25 Jun 2025
 08:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFgDHBHwY5ElWILx@shikoro> <CAHk-=wjCznJeOUSHcR5BszEUVv5BW6heO6jMX38MHXNaL3kbmQ@mail.gmail.com>
 <aFvAlSQICukBzt7K@shikoro>
In-Reply-To: <aFvAlSQICukBzt7K@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Jun 2025 08:52:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi+yt71aGSmn4WQjFouxoQuxAmjmM2xO_SD4KipCXjwLw@mail.gmail.com>
X-Gm-Features: Ac12FXxccCDQgyxAH3o8NoSDNlLJraqyT6j1-BMwC9gqJdDbvSHNUAqg9CvMSYs
Message-ID: <CAHk-=wi+yt71aGSmn4WQjFouxoQuxAmjmM2xO_SD4KipCXjwLw@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.16-rc3
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Jun 2025 at 02:26, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> I assumed that it was obvious that everything in this pull request was
> automated. I honestly really don't enjoy pushing whitespaces around
> manually.

Actually, the reason I reacted was that it wasn't so very obvious.

I took a look at the commit just because it was larger than expected,
and it didn't look very automated

If you take a look at that commit 614b1c3cbfb0 ("i2c: use inclusive
callbacks in struct i2c_algorithm"), about half looks very
straightforward and looks like a sed-script or something. So you have
things like this:

-       .master_xfer = bit_xfer,
-       .master_xfer_atomic = bit_xfer_atomic,
+       .xfer = bit_xfer,
+       .xfer_atomic = bit_xfer_atomic,

which looks like a very straightforward rename, and may well have been
done with something like

   sed -iE 's/\.master_xfer[[:space:]]*=[[:space:]]*/.xfer = /'

or something like that (same for the 'atomic' version, of course).

But almost half of the lines changed in that patch (ok, 40%) is to
things that didn't actually change. and is just whitespace changes to
unrelated lines that didn't change.

You do mention it in the commit message as "Fix alignment of '=' while
here", but that really did make it much harder to see what was going
on.

And no, this isn't a big deal, but it ended up annoying mainly because
the line count in the pull request was bigger than I would have
expected from the description, which then made me go look at what was
going on...

                Linus
