Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0701F4CA9
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751793937; cv=none; b=TH7pbpRzyegIZgskvJSmXYCrq2XBdPlsXbQJh2z5K6XdRks+m55OkVjcm1T/w2elDTi8tkMkMLLIdkRL0b3VS7y4qmA2axSOOTLpwEV5eP2KV3DyPPHP3QR+MrHKZfvpnZdYcPvKwxuIgg3QGTg5GFIVB3ub4FLzOT/REWStYn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751793937; c=relaxed/simple;
	bh=MxO0CJB/LeaRXDyKaIun3lQmVH/9wclT5c9vNEFxP7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBGVtjSVsj9AvvZtY2JLz6jV82vTBli6kA/aqsdM0bWshodPjy9y4tpa31eorxIkkoQa3NJ/y8uMK2bWZGRkgWIzqecu03BeN/gf1T2bycXm4GZZwJ0LCEIlAMXUWbtHRifidC4LpIQpb/rzyQGYrL5Ukx94LxHvUrOEQIFVRqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-87f2adec2b7so657028241.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 02:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751793934; x=1752398734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5jxKlcTKhw58OTPT2j6i8pivLSTrpiuZ++DW2VQfLM=;
        b=IQH4/rafS2dAnW8pryKRDSkdoCL6RI3/RcN9q1VJ03oKy2hvwCaPNrnswCD+HtKQGV
         K4ipucttFW+yT+9guojOCwtDZyQ230OMg/1izGhv8YKgfHN9EJ9JVPgTdvEOS7HcfAqZ
         22OblqDIRHvnqUz4XUxhWA3ysh4HDmG2BQEIRYLlBAXyKzNs5mqMFFyt7K75LvAVIA4m
         LmnemdbsBzf/OGbkjJo6Zn1GPFk4OpPHxGRcYYrkp44LaUxrSnCUMPIb79xgbBqwlKkW
         dURbrjW/CD8ergMCdTF2Q89Ae95Xd2z1p9cZnNJqHKj/RE9aU25QzczsxOkRB90y9uaW
         jscg==
X-Gm-Message-State: AOJu0YyRochEIPtFAWUx25FufVO3Ggy7cL+ncpoh6J+2uIYj7j0Wtliw
	syX13RImfAf2hM6MeYRkHwegqN+ysiag0/4to1/zY8v5ZGMK9EafNEddiny38YHC
X-Gm-Gg: ASbGncujxkwuuf2mAJH+NDeK021lgyOv0xifTOjPW1/3ASOdL8kE+HtcvUXDOHwslcH
	6Fel1IhUa4tQJVGAcrtrWdayJ0giqkYZtexrqL1oUnEchXamLU9GzoanjHLVrn7IfDQIBZREbgQ
	AN6+HJuNHm2/x6mmIFViGslX+Tv5lcoQo+zSeiIrFUKBHbnpEiKnHDN9kBtjL2CnhVbKwSre+wJ
	qwx0I4mbPG6qxMm1/yb3zLcsHdhkhN5I+tl3LjK3waEUrOPz8JiTUqJDA05Z2fUpMzDnbwhzBSF
	XbDROd25BCEh1ykhY8AOAM60hGlVsOWEOZAFJHoZ0a2JaQa4pP9vSpwZqUflLT1eHqwunE6V226
	mFGnESVK/fz99PJoRKdnqYe8n
X-Google-Smtp-Source: AGHT+IGx5DkLM4sAGrv9yewt3nXrcyKucw0P8FSHOtJUS/2KqnK2NMGrA5hD8ZCHLTALcYdqjfkLRQ==
X-Received: by 2002:a05:6102:5087:b0:4e6:245b:cf57 with SMTP id ada2fe7eead31-4f2f2410be6mr5456469137.24.1751793934342;
        Sun, 06 Jul 2025 02:25:34 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-886e922f1aasm982358241.4.2025.07.06.02.25.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 02:25:34 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-88131f0badcso1423315241.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 02:25:34 -0700 (PDT)
X-Received: by 2002:a05:6102:418e:b0:4e7:866c:5cd2 with SMTP id
 ada2fe7eead31-4f2f1dc3efdmr5390786137.2.1751793933819; Sun, 06 Jul 2025
 02:25:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701135616.29630-1-Dave.Martin@arm.com> <20250701135616.29630-11-Dave.Martin@arm.com>
In-Reply-To: <20250701135616.29630-11-Dave.Martin@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 11:25:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwN7iMvMeC66SFD19s-xX6d=hDYZpvzBqEXSZ4_fPuuQ@mail.gmail.com>
X-Gm-Features: Ac12FXx8rr-AkaT3Va6DYyUOrBAjxujr4T9dfZ7LaO7cngz7jEDBpCtRAxW4jnI
Message-ID: <CAMuHMdWwN7iMvMeC66SFD19s-xX6d=hDYZpvzBqEXSZ4_fPuuQ@mail.gmail.com>
Subject: Re: [PATCH 10/23] m68k: ptrace: Use USER_REGSET_NOTE_TYPE() to
 specify regset note names
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, 
	Kees Cook <kees@kernel.org>, Akihiko Odaki <akihiko.odaki@daynix.com>, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Jul 2025 at 15:56, Dave Martin <Dave.Martin@arm.com> wrote:
> Instead of having the core code guess the note name for each regset,
> use USER_REGSET_NOTE_TYPE() to pick the correct name from elf.h.
>
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
