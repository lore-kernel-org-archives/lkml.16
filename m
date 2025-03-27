Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BB51DC19F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743114002; cv=none; b=Iyt14sm/oDTiUfgF5Zd/NAihPA7kMEw1KBjrElcl9ICG+nnRmFsZbGqpToPs0vRxAI+1XQkYzoxGbj00tK0ALGE8yuzvo7AkM8yyezzodL9kbpuxIeMBr04Jzrx4kY4Nsl0KEoK3BWHgY5rJb9mYgCguvwz+2UJDUYjf86Afc3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743114002; c=relaxed/simple;
	bh=AAjdEWhdtIY1izpQm20ocIjT3V/6u+JH7+pjReCTt+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sixLLDYecT5bo8tC3qKvoI9Iq6+pG1RKn/0Kc5VvvT4cBthOwN2MfpgDkqKagmb/jviinmWFoKEJW1PSKFREMH3zROVofMfN5tO07vbAlRpe3I00LkHAptl/MwgU62cd2VeIJw9nd4GR+0Wa2MIjCj7kznP0sP1QrFH5soN9rhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=A+gf5ugU; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="A+gf5ugU"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso2522621a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743113998; x=1743718798; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8OFv0t1E1RercPpEOKFj0bB5VB6uMSyYHEUWSiUYmsU=;
        b=A+gf5ugUCoaslnRHCqvBBr1ZuOiivXvC1rcaUEnuL9C5XjZygGEf69kQr3j2OShisL
         0BMiMtY0E90S/mrLatmyDCHXeNuVNE+2crP50/UulJwET3wr7QP2Lu6GPymDFMgkOB8l
         0tqVeJbKHvLIf9CgdiysMAY2BYW7HOl4Z1nPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743113998; x=1743718798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OFv0t1E1RercPpEOKFj0bB5VB6uMSyYHEUWSiUYmsU=;
        b=jCkIlIv33gm0oPSs5VMZ8+kG04xL/3N8mvRr4WafJy+QM2k4LJ/d8Mab2Jv727oDhl
         WTizFCoFP5pIjWlpKdQLedD5F6hzV1GEW0hHAYM3J18OMIg/JkRI1pxfKM7esw3AviQw
         UHr9LNlmSBUNiQMtSIuU0f3g+Stqyd/lnJKlVel9tXWaXyPx86OwbLP+I0dJopYOzuz6
         HVLO2J3niXASUHjvbAv2+12Re0+W8vInxUrJjH3kUcdXI0aCp4Dnf3I68xT7ks9g/z02
         GohV5t7EnZ6rY4NfE3JHem0cRku+fAx1HFM9KxX5LvZOv83JY4KwEnBw5zgH1EzaNWGI
         2DTQ==
X-Gm-Message-State: AOJu0YyBCMdgKoRIXBXsXughUHbaKSGdNcAgaTG+GuEyk0mgg4oZqSkW
	r/EX1g4uZE7wAlEaYKS6UWUGkU1oin5HFV+MnbJNhkE1Ofmn5HySBMpIL61T5a/Xzo9dMUbC+qf
	1M5s=
X-Gm-Gg: ASbGncvxhVtMsl4LznG71uh6e222r/fi5GypRByAgxV770hO1KxsElvYSSS3glsIUJK
	xG/mIHro4ReA/MOy1spFFMhdpSQ8h+YkgWRmROqwDlTw1hFhxdml7clZ/sXvX25E1Km8vWCBA0t
	ZbLr06W9xu6R7QFoE3ZVoAi+Kca+00ZcwuF4Tqfjk8wnPw/I83IKUOdZ0IOWa2EG8vKy7M/NayR
	I25ynxUpZxk5qSd9qx8yderCo6iIUUElhkl1G1h8cN2vhKy/Yl+rIWnO5Ev53QhHK70Dy2sSVot
	3pO28Kv3e5hR6VKpxr1f7QvMdeWTGMOBuSIb6htzExhsi1S/Smu3CLL7e3VbJSIBp2pkpoDHBPr
	f+Gq0QO0GqkdaG+p4MQA=
X-Google-Smtp-Source: AGHT+IFzYLHyKdn0p+ZY1d+qaiaqeS1g2eMtPaqx+//36JChNOKrl2TKuEeG9dUgtfBWsTuABno3PQ==
X-Received: by 2002:a05:6402:280f:b0:5e5:bbd5:676a with SMTP id 4fb4d7f45d1cf-5ed8f3fd169mr4802110a12.22.1743113998279;
        Thu, 27 Mar 2025 15:19:58 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16f213dsm409827a12.44.2025.03.27.15.19.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 15:19:58 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2c663a3daso287408366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:19:57 -0700 (PDT)
X-Received: by 2002:a17:907:8693:b0:ac2:8428:c5c2 with SMTP id
 a640c23a62f3a-ac6faed48c7mr436993566b.20.1743113996880; Thu, 27 Mar 2025
 15:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327205355.378659-1-mingo@kernel.org>
In-Reply-To: <20250327205355.378659-1-mingo@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Mar 2025 15:19:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjwuO8UVLP5N7972TmfVc+sYEekcnZMF4rQLr662j7oXQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrIok3g0Fr6tWCAor2slYyBhc97I3reAKGM_-3vfH31GvEIOduVzJ5uCWw
Message-ID: <CAHk-=wjwuO8UVLP5N7972TmfVc+sYEekcnZMF4rQLr662j7oXQ@mail.gmail.com>
Subject: Re: [PATCH 00/41] Simplify, reorganize and clean up the x86 INT3
 based batch-patching code (alternative.c)
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 13:54, Ingo Molnar <mingo@kernel.org> wrote:
>
> The second part of the series simplifies and standardizes the SMP batch-patching
> data & types namespace, around the new tp_array* namespace:
>
>         int3_patching_desc      => [removed]
>         temp_mm_state_t         => [removed]
>         try_get_desc()          => [removed]
>         put_desc()              => [removed]
>
>         tp_vec,tp_vec_nr        => tp_array
>         int3_refs               => tp_array_refs

Honestly, I think "int3" is better than "tp" as a part of the name.

"tp" doesn't say _anything_ to me, even though I understand it is
short for "text poke". But if you want to say 'text_poke", please just
write it out.

At least "int3" has some meaning in x86 context, unlike "tp".

So please either write out "text_poke" and accept that the names are a
bit longer (but a lot more descriptive), or use "int3" if you want to
save some typing.

        Linus

PS. The casual meaning "tp" has in English everyday language is short
for "toilet paper".
