Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD35F22E403
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707950; cv=none; b=Keq/ftpMln2pYSfBABIBtGEJi+6zF3zYkduvTa+UFtXJHxWbXbYDfFPCHPiozZ1MlecXq2KpZq6LUJZolCzZoticylYBBPSMK5VgkPOfjAtM5xuY+JLFOenlENaf93MiCQJAldgRezg5tz+hDnUnKkz1T785kEjHHVb+/kJTqOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707950; c=relaxed/simple;
	bh=T5uoDV9HKncHWI6WuWJr72wllf/CE9rQIuIo7jAU41E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGfHdXqLfgs1GXItKwpyHrpUPKY+Sgmhp+nQNA4Omxzv8ueHBZsjOsQrY1tW152x9C+S2PCvh3vkTQQhRNQ+/MYpCxb6ZYcerFrmiX8hzjMgqzlCfMHQuJmnF3H/Em5HANRQ7mTcUD3+KKovwKG+hWqyE3TYQtU84GFr6qS8THQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=A4QKqm0D; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="A4QKqm0D"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so244677766b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743707944; x=1744312744; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xOJ+a6c7HX+Aw8dr/wh7QGl7onl6cqWKpJLTwkfT2G8=;
        b=A4QKqm0DKMkO8/9BQrvm3PoaYGAuSdnYKTO7weA7DN+7Ya0rqZPCMmWHmnPv/FBfx8
         cWx7xoTDaPxSVbsC02Tb0OLWhh8Y6BKJMn5Fkayqtk3iF5pJiOLRPaEZqAW8LE2KPtnD
         J8hL67DjpGQgms90Ys4QkJY8rlXN8JgEOCGek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707944; x=1744312744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOJ+a6c7HX+Aw8dr/wh7QGl7onl6cqWKpJLTwkfT2G8=;
        b=XkyVFuScgCGAnHiLooXCJPOg/zeeJEDHvMh1RNdXPQGgbjBsklXsbKFtKhw8XEzo0k
         ZTljaWGzjmtEx/1pIpr/3Dnj1opx8kTNZ052T/1g5vQRj9LCrPGzkJqIOahOdcx0mp6x
         7RGlAFfFsNa1m7e5oBhJk4brJkH8Y8MIFGkMsZ7mNCcr/RRCQOWxDmWFI/eltNQu9vet
         ZVtP4MLRwRikZEEPRj4/jLm5IxNqW0zHWx133NnfqoTeSCINsPd0IUOJXnYeNVNbmcpA
         qUe+5CCRa/OFxpwNgFA4LX2NmxnyhPD4TMHBcL4kt/hBw9P8FhxRmk46gl04BQqY4GbQ
         1Afg==
X-Forwarded-Encrypted: i=1; AJvYcCX7BqqO9lEyZyn7c8RiWoNFLJ/kYdttou/y1j0SpV0xRPv/8Rv86er/bMABeoENVKXl1Fl4R8qTfqSrGDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA+uUXrn9inDR/9FeNrY7duLb/TFy49HVg5H/ISonhrnLrD1IB
	BK8KwGqoS2tOr0wLmCn++6KFIM9oGqziIwX60zFVmpEEnRvXAsOBqBXdCVutOq+/YYE8/rDJ9c2
	lew0=
X-Gm-Gg: ASbGncuqbdUmhunvOQR1kmXnN7Yp3l+8ILG/7nx//Ja0FC87/jYm61nd6lyT5Z0WD8p
	mvSbcZYJJCipUOyoZrrLyVQPwd1rS3NU2D8f/rE/hp9ZXYJIIGPBcT5POuR4SFL7KO7Qs0FbnKZ
	KTWPuzhvFnzgPO3RxNPAyY44b1OUW/sKu0xkUUikMWgpTbB5vvzLI66Txv/76vHAbif2WSfvwU3
	52GQ4K2kn8/Go8raQBmI68v/JK1iuGnrPj8wb21bcwZBhIFTmCdzzQ9kpxhuRsVMbf/e8i0VJos
	Aar9Mi13/nJgSN8FMF/IwBQVmmgHQn4wxH4xcg3vUvLrbNyV5fS+5MX/8epqiIHLTO1NUVbYPqY
	MpV/OUU3ax1wXDtLcizI=
X-Google-Smtp-Source: AGHT+IGwvElIm8guevE6awAaOwvOgMQ6K9RqPCXQEu66OA9uXOo81HHLqpnCNCqfBnA46lFPQ8+bfw==
X-Received: by 2002:a17:906:c153:b0:ac7:364b:7ec6 with SMTP id a640c23a62f3a-ac7d1306b84mr72286166b.0.1743707943862;
        Thu, 03 Apr 2025 12:19:03 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f660sm134197166b.89.2025.04.03.12.19.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 12:19:03 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso221577166b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:19:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXU12CJnpIbyrQ+d4cJbLQ0Aw66NPXhxrvCxCpvFHwoQpwsQXK+PF/3WQYmtA9Sp3tfmFy071vv8OUBKAU=@vger.kernel.org
X-Received: by 2002:a17:907:9801:b0:ac7:33d0:dbe with SMTP id
 a640c23a62f3a-ac7d18cb7f9mr80311566b.33.1743707942619; Thu, 03 Apr 2025
 12:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250322-vfs-mount-b08c842965f4@brauner> <174285005920.4171303.15547772549481189907.pr-tracker-bot@kernel.org>
 <20250401170715.GA112019@unreal> <20250403-bankintern-unsympathisch-03272ab45229@brauner>
 <20250403-quartal-kaltstart-eb56df61e784@brauner> <20250403182455.GI84568@unreal>
In-Reply-To: <20250403182455.GI84568@unreal>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Apr 2025 12:18:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj7wDF1FQL4TG1Bf-LrDr1RrXNwu0-cnOd4ZQRjFZB43A@mail.gmail.com>
X-Gm-Features: ATxdqUFMslVpxLZQwg1CWi9MwTwtlcmOR2f0G9_2Lk6dEltjaQ2iJobffD6Dc_o
Message-ID: <CAHk-=wj7wDF1FQL4TG1Bf-LrDr1RrXNwu0-cnOd4ZQRjFZB43A@mail.gmail.com>
Subject: Re: [GIT PULL] vfs mount
To: Leon Romanovsky <leon@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, pr-tracker-bot@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 11:25, Leon Romanovsky <leon@kernel.org> wrote:
> >
> > -     scoped_guard(rwsem_read, &namespace_sem)
> > +     guard(rwsem_read, &namespace_sem);
>
> I'm looking at Linus's master commit a2cc6ff5ec8f ("Merge tag
> 'firewire-updates-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394")
> and guard is declared as macro which gets only one argument: include/linux/cleanup.h
>   318 #define guard(_name) \
>   319         CLASS(_name, __UNIQUE_ID(guard))

Christian didn't test his patch, obviously.

It should be

        guard(rwsem_read)(&namespace_sem);

the guard() macro is kind of odd, but the oddity relates to how it
kind of takes a "class" thing as it's argument, and that then expands
to the constructor that may or may not take arguments itself.

That made some of the macros simpler, although in retrospect the odd
syntax probably wasn't worth it.

            Linus
