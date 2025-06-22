Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DC386342
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 18:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750615270; cv=none; b=oND30wpVWpFlnyX8nyXUTPrYt2FgrEwHc9i63pAbTjbkouaVCcReOR9q3itA1afoiPM0iUkZ2Dv7E3JtIj+lTzhb2gddT7ocSwy3JKt+0ythmymJ58pe13Yg7IRSdnvEfHBQM4uO692ke7Ni4rNCwKmj42OVpv72pgD1az3rqWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750615270; c=relaxed/simple;
	bh=J9W5678xdEPVkrFGIESTOy49fS98LSwSbpQugn1ibXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHpiAb3Nv7tC+jP+eGz7t0SOPQDul3t0NoqxvI2ayLDep+ThG+YWEkm/1QxD8dE/twNLrkK6tKklUwu+Gl1lXXUOLBavPrVY8prYBfLuHWc293E50rnpXWGiIGLN6x3pjd4s1C9ZSnmDEXcn79EzcbaNVQhtA0RQtvobsCKTvs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=M6YPThtA; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="M6YPThtA"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ade5ca8bc69so597537466b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 11:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750615266; x=1751220066; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh5CufBu5Z6q/CIQPXB1zoIxJvSFHFQ8GCjbcL7K+Tg=;
        b=M6YPThtAsEQluNG6R/hnUTpip3DB3lbyfid13GOdmRc/vgIPJJ3lRTrzB3jTNPUadL
         ZrdbEWCs/Hg8Dth4BSgX7+WbOjcF9jj4rZaxcKvf3/qbaxlA1noe5gpmJ6o+j7CBhcPy
         ruLy+1vKtQzDpcseKz+HydejjudFjfCgdahJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750615266; x=1751220066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xh5CufBu5Z6q/CIQPXB1zoIxJvSFHFQ8GCjbcL7K+Tg=;
        b=Qw+K/HdVPcimrZ0sKIaSnQk0ECCLQklstRD+wD9Z57o0ZxVaFvDx89zO5VyEW4XxBi
         6fV+asUi7mLOtaX8SqTItnMWToll76qthcnqrQF4RDORNUwWC6RT/Qq8vGmbNL2MYI40
         3TJMLgGkvxrMyuEzird90gRaUjAz8ljAwcojL67NP1+gCEJS+xs23wOHQbm98w78jn8A
         McYAX/xLu+x/yLpbSl/p58dxBZz+hbHEgH0MbdWCaAKKNVg/hChTrniqox+KrgpPyApb
         yLO31bB8+zFatkAAE3SEt+XPYE+sTYAXlfsv1oSAFLz5TZkrmm5pLk2btCT0XczkrWtX
         AK6A==
X-Forwarded-Encrypted: i=1; AJvYcCWg9oL5gA0WOiqT4AHyivJzTvgtNtEGPahy9JX0a6xSZJ4DDcjJEufX/PfWuJyWEczZjPIYUeuR0/tPpfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHODe9XSbIqCAvlFzkdO11/ziqjCQn/aLcBYOYvtLFqpXPDbkF
	EoahD42b5Eon0Idb5sp/HJ0QuNJdwTYRJC4CFuS7Nl4Jg10gqcpaUQk7RGn84KFeMzCjzuS/1zu
	vgbjJswA=
X-Gm-Gg: ASbGnct+0Q+cXwCjZE9hoTRGTquIRVz2rmrXjUs351sAS5s5oR7tc4P7qTz2tSKyU6Q
	B7gsrV5As7xyfpd2k6tQb9CQqcTqy2JH4Wb8QZeYGupuV8ODicPJ4zdn+WeL2jZHub0Ud13YbWp
	GzZ6+NSfQQrjbserp14lDplKMlNajZEHbboCAODK0m9FAKhqhwhOPAVnqe77dhWXPVGB6Jt+cTR
	rU22pIMqO2ziuWA0b8ngoExCZYA+ubCp24OUMgq3hTsMIsKcmSJRKQazYeYxM2jgE24P1rRqxDE
	ZfpWmcyHTdnn2oEtJxQ99lVwIbmNqJF/Dr8mimb8LdqYCDE9CxPUCBAkRuM1+hJW/i9V4Tpghp6
	7b4Mkhv8V2JGEJ4m7JEHyHuQ0N1Zh31A2e0th
X-Google-Smtp-Source: AGHT+IEX4+3kJuASYht5rSLJQIipy7gRdOdDydZD5aq6f4b/YA4RNZMPhxM1lS25fx1u4xhH/rSnOQ==
X-Received: by 2002:a17:906:9fc6:b0:ade:9b52:4cc0 with SMTP id a640c23a62f3a-ae057973159mr839642466b.26.1750615265961;
        Sun, 22 Jun 2025 11:01:05 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053edc0c8sm575124166b.64.2025.06.22.11.01.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 11:01:05 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so5917540a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 11:01:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/8ZyAOa56xDNlmVc/xATTUSLLWl+cQ3bpt5l3hxbMiio1xg4QNZd35TG6qR8ZE9AaJ8XXAvYNmvgWXJ4=@vger.kernel.org
X-Received: by 2002:a05:6402:27cf:b0:609:aa85:8d6f with SMTP id
 4fb4d7f45d1cf-60a1ccb4e04mr8893295a12.11.1750615265058; Sun, 22 Jun 2025
 11:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFgDHBHwY5ElWILx@shikoro>
In-Reply-To: <aFgDHBHwY5ElWILx@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Jun 2025 11:00:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjCznJeOUSHcR5BszEUVv5BW6heO6jMX38MHXNaL3kbmQ@mail.gmail.com>
X-Gm-Features: AX0GCFvnn992nxigULNiH1gK6JAY71aQgYXmY-5YsNMdcvTo7T5WTIQaQFNAVDg
Message-ID: <CAHk-=wjCznJeOUSHcR5BszEUVv5BW6heO6jMX38MHXNaL3kbmQ@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.16-rc3
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Jun 2025 at 06:20, Wolfram Sang <wsa@kernel.org> wrote:
>
> - subsystem: convert drivers to use recent callbacks of struct i2c_algorithm
>   A typical after-rc1 cleanup, which I couldn't send in time for rc2

Honestly, this is just *annoying*.

It's made extra annoying by the fact that you also did some random
whitespace changes while at it, and almost half the lines modified are
just completely irrelevant indentation changes.

Looking at the stats, your pull is:

 45 files changed, 125 insertions(+), 103 deletions(-)

but ignoring the whitespace changes it drops to

 45 files changed, 84 insertions(+), 62 deletions(-)

all of which just makes it really really hard to see that it's just a
trivial conversion.

I've pulled this, but I was really close to just unpulling it because
it was such a messy thing and badly done.

If you do conversions after the merge window, make them DAMN OBVIOUS.
Make them minimal, make them automated, and DO NOT DO OTHER RANDOM
CRAP AROUND THEM.

          Linus
