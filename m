Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EFC2EACFB
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949999; cv=none; b=bPLYSbqU/MjK11Wc85sCmLZGcMkKslSF8Fo0R6zal54wAvXqO+XWKSqTVNo/E0WFMQYQrurDOAOJ3J0413MQZBZydnk2H3nRdTQ+0l7xztLb0yo99w/48i5/7YU+sW7fdMLQizpKg6cUdD7wX+BJjaoNZJ0q8UKs78e789Yud6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949999; c=relaxed/simple;
	bh=qKJ3TOgBVgAG191jBalz7NNV9sHrI5LIdnTqgeqMt7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OY43p9S0AAnfPeOCWFgDjMSwG3HJ3T2lSc8h4Yqu2yRn/7TLWiLaK98yCHJPcLRU/TnQXm3NicHNL6VUgJ6bBZoxhElTOFupHniFc28zhYeTjpQm4syT4/X1gDKcyWoXGhwO0gusNl95wOsOoo4vY+w51qnNRkBfRqKWSx1JaQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-87ed3b792a2so278381241.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750949995; x=1751554795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r88EEJAotUoVpruAcVJoQDPPsGCVaFlUVSarfnMZBus=;
        b=TWGFMEHnSQZewFLoq/2MlUiSNi9ia79DA3DdGamlVZPfu0AxTVblMjtptr3wy9t7u1
         8wAu3g3Aff9QhnQ/kSrP2LkpVP3K4so0SfyJ4h7GHCbfxypmJOthxJDIVTAXM5BwSCGw
         b39zFQBQkXm/GcjAPvSpa2hcSa2fk/ergyoKMnDr9+TR/RHDNhtDhJbkfSF2ChO8654S
         c9L1Lcbcu+jfSi+xhk5kay2dPBo9b/EnLsODowfiwjbO3qdFmMQvL5PeP9zVS5f74zMt
         z8qLSPT6oELQrXXkzT8lOkXULAJD+fkgcJy7gVCtAwOlD9TPGojxB0sXWMATXTHlUNkI
         3WTA==
X-Gm-Message-State: AOJu0YyWzjYRoH9gyiBkIKkQmj2borpyGb0ivZ66DouCQmGl54OBpNok
	cxwX3Yem72dcXqQoyJV6lXOBVqg287ykXT0xNHf/zPEtjWJAjEgk+Zs9+8YuxAhydCE=
X-Gm-Gg: ASbGncs+lik2HAanm47fsiciNm0A72iIz8++RfbMKQTjao6LO1KiqVK0ZCD1Vjl9nTB
	oRiJXezHo0sbnKCTAFKFNYVDW9rxUymdljkCV0YSc+To8VetcVmpK+51Kf6/hbvXr6FJZmeydQD
	/FoYbTmkTcZebS2t2shY2R0VPRZ3DgUvy+fZxSMGX/iaRA7r2NMSmJjt54KKYFJEaN83SfSL2qS
	GVhvD3xCo1miqCJaJBhsC7myin8uweYw/xibsieGRbzyR6gySxGbnseel1TnrO83XLQJVgGCkob
	A0hZN1Iqv/leYcUudAShqpP0iZRy4H3rb28IR9LfYsyIDtBYHpuHFozXqcg+YCBEqMh00Lw/iUB
	b3rFxrlIMmKz/5/MyOUwazayKQPZd
X-Google-Smtp-Source: AGHT+IEc7Yjq8X6rek4PfLzTOCzomzRWOySprQHK3VBSNhwVWgt+YslzwYP5TwMi4hAifDK7gOJyfA==
X-Received: by 2002:a05:6102:6c7:b0:4e7:db33:5725 with SMTP id ada2fe7eead31-4ecc6a6e9bamr6580715137.3.1750949994899;
        Thu, 26 Jun 2025 07:59:54 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ee4cb724ecsm12928137.16.2025.06.26.07.59.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:59:54 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5314b486207so321753e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:59:54 -0700 (PDT)
X-Received: by 2002:a05:6122:3985:b0:531:2afc:461b with SMTP id
 71dfb90a1353d-532ef3b9108mr6081914e0c.4.1750949993756; Thu, 26 Jun 2025
 07:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626145119.2048423-1-jani.nikula@intel.com>
In-Reply-To: <20250626145119.2048423-1-jani.nikula@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 16:59:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+tgMqHcU8Fwr_XVE9RfNEGHnbEYHQ1DraE=YRvQxJuw@mail.gmail.com>
X-Gm-Features: Ac12FXx-6bz0nK_P8UsF2VW3B2ShhCuX5ocsE3wCLtJQXSrU2FWYjeTIxhmMFs0
Message-ID: <CAMuHMdU+tgMqHcU8Fwr_XVE9RfNEGHnbEYHQ1DraE=YRvQxJuw@mail.gmail.com>
Subject: Re: [PATCH] iopoll: use fsleep() instead of usleep_range()
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jani,

Thanks for your patch!

On Thu, 26 Jun 2025 at 16:51, Jani Nikula <jani.nikula@intel.com> wrote:
> Sometimes it's necessary to poll with long sleeps, and the accuracy of
> usleep_range() is overkill. Use the flexible sleep helper fsleep() for
> sleeping in the read_poll_timeout() family of macros to automatically
> choose the appropriate method of waiting.
>
> Functionally there are a few consequences for existing users:
>
> - 10 us and shorter sleeps will use usleep() instead of

s/usleep/udelay/.

>   usleep_range(). Presumably this will not be an issue.

Note that udelay() does not sleep, but loops.

>
> - When it leads to a slack of less than 25%, msleep() will be used
>   instead of usleep_range(). Presumably this will not be an issue, given
>   the sleeps will be longer in this case.
>
> - Otherwise, the usleep_range() slack gets switched from the begin of
>   the range to the end of the range, i.e. [sleep/2+1..sleep] ->
>   [sleep..sleep+sleep/2]. In theory, this could be an issue in some
>   cases, but difficult to determine before this hits the real world.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

> Not really sure who to Cc, given MAINTAINERS doesn't match this. Adding
> some past committers.

Oh well ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
