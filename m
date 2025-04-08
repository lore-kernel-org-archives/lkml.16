Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD11925F793
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744099565; cv=none; b=qgvlHxp5ZjLflsHcYjx+RoarZA2JdRCxDzRepWwMUlGPfBMUdWHYs2HKEzIPce1JMMhERun+127FGI43ZH06mLd/9EObntLVM1JMi++J7O8VY76KscC1TaoLAOA5T35UckPcKzETUipJc9fsKi4sqjK2HrohNGBRjUnv/bsxU/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744099565; c=relaxed/simple;
	bh=L3P7yCll6COQBUDzboSQZpQlSMCJL2vX1EKw6F+HVrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbK3y6W8ozjo3pS8G9eO7LSBXGZ+n+SOgkQiUHqJDf4oKh01NqmpHcY8X2Wl63kSXv4gPycN7t5B+9fuYu6z1YCG94amTyD/VNhQ51bWXNdeb7yJG/TqkSHZOgbvOllekhjv681cp7ThgA9JlfVULlTfihzdhiy4YS7wMKb2Xxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86fbc8717fcso2315414241.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744099561; x=1744704361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlxvcoEn9hOCN5sqYCqBrFIWD2+u4/+JFIB32cw1JOI=;
        b=IpuwnQhf/+4r8KO6iMqzIcVWsOFgW1rWmtgrr5Ague53EU1yQ+fwYNqnFXgRMKUShj
         zAtWaX8nqbJ2zrkoThB90vzQYR8i/hZq2DRaHGBXPPv+dAxQeAcPTP50yUTNKfL0nJh6
         0fiLxHaXjY7GesVjrB0GwNmGjWT3gYN2vENnTKzj+A+nhUBEIg4dA18KpOrm/f9M/mqW
         wUyecxIIq/BaqpgjWQ3p14lMv1sXoUNui9HUbMkP6Mf0taVFi3jnrC5pMqLzztNcR/So
         +Jr9o1L9DFL5RNLQd6tmM9FsCQp0p3IetooGo31YLoGxDuhaoMgxGFZ2x3zOvzyWRPZb
         B/aw==
X-Forwarded-Encrypted: i=1; AJvYcCV9j9OCoiK6kGrQrItkj8I7OU1oCR93qwblgJCN+fn030rdIuZZYIQjAQwJ5r1ndYj5dTFpI69yUUd0E0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE3ni2o5ZfHzQVXXdgbFiRd9AsJBSirJ/TFydPK+NoXrxg64qV
	rkKZxkxeU+MdsfvP+e2AYshIb0hks9xD2QA9EED80wmmZrw2Avm1Q0KxtALA
X-Gm-Gg: ASbGncsTX2sdOksjZz75GWDEQAuBvwWAl8Z32gyDaBOMhnlHRFWAHLMlcy1MFyVBxwz
	wKmsca1cO2ZhB/WqqcDZmHTvUznq1ZSaQoLOUkl7R+paiMlsGR2PdmWdAS/Ak5iadi22vJ3cNgD
	VZtSYZ2LSibl2CazhHqf7bO/qKN1xhrF9NjELEKJl9b8Ws6cS4rGlZnnkuZriTiAtuK0PD5dovH
	QFjajgMzeF5rNg1LkVJydd0tJUtMQVB/eWdZbweI8LN9Iuh41625J3ZnxseTEDygtgI3Q74LXh7
	q9RrH/2CYYLFsCPlnaq/E0w2eqIrFbOXvc+M9Z47HXaSp4mt83xzJ8Cc9sa2bSrOwntYPAVRrHP
	HMZ+c9EKKe37uIoR4u7CpMg==
X-Google-Smtp-Source: AGHT+IFCBYwnMCkD1GCO/TRjmbqw+qyO6M8gIVm0goE04dKbw/fKOzY9yXOinGfyq7chjCdZCkavQQ==
X-Received: by 2002:a05:6102:3f8d:b0:4c4:fdb9:2ea with SMTP id ada2fe7eead31-4c8553ae687mr7294201137.7.1744099560886;
        Tue, 08 Apr 2025 01:06:00 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5279b591d38sm284690e0c.19.2025.04.08.01.06.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 01:06:00 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-525b44b7720so2370854e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:06:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6BHR35n3rc1tbVXchribuRUS+c3+bonpus0XSz3Xs71IxKTgWlxjqovxWhPO2a1rpxqsGGGQK2/0osqI=@vger.kernel.org
X-Received: by 2002:a05:6102:38c7:b0:4c3:43e:5227 with SMTP id
 ada2fe7eead31-4c8553ae67cmr11934847137.9.1744099560424; Tue, 08 Apr 2025
 01:06:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165435.2567898-1-fvdl@google.com>
In-Reply-To: <20250407165435.2567898-1-fvdl@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Apr 2025 10:05:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUeGjbOx-aJTvwOVBWdUFmY7wU-p3mKaCbEzQ4PbJDqNg@mail.gmail.com>
X-Gm-Features: ATxdqUHUDHQ6BUTLIhfVUZYR288fq3PDbDXvs9_PB1P4cdsqCrKbe4BPzg0kiFI
Message-ID: <CAMuHMdUeGjbOx-aJTvwOVBWdUFmY7wU-p3mKaCbEzQ4PbJDqNg@mail.gmail.com>
Subject: Re: [PATCH] mm/cma: report base address of single range correctly
To: Frank van der Linden <fvdl@google.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, gushchin@linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 18:54, Frank van der Linden <fvdl@google.com> wrote:
> The cma_declare_contiguous_nid code was refactored by
> commit c009da4258f9 ("mm, cma: support multiple contiguous
> ranges, if requested"), so that it could use an internal
> function to attempt a single range area first, and then
> try a multi-range one.
>
> However, that meant that the actual base address used for
> the !fixed case (base == 0) wasn't available one level up
> to be printed in the informational message, and it would
> always end up printing a base address of 0 in the boot
> message.
>
> Make the internal function take a phys_addr_t pointer to
> the base address, so that the value is available to the
> caller.
>
> Fixes: c009da4258f9 ("mm, cma: support multiple contiguous ranges, if requested")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/linux-mm/CAMuHMdVWviQ7O9yBFE3f=ev0eVb1CnsQvR6SKtEROBbM6z7g3w@mail.gmail.com/
> Signed-off-by: Frank van der Linden <fvdl@google.com>

Thanks, this fixes the issue!
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -724,8 +724,10 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t base,
>         ret = cma_init_reserved_mem(base, size, order_per_bit, name, res_cma);
>         if (ret)
>                 memblock_phys_free(base, size);
> -
> -       (*res_cma)->nid = nid;
> +       else {
> +               (*res_cma)->nid = nid;
> +               *basep = base;
> +       }

Please add curly braces to the other branch, too.

Or perhaps restructure as:

    if (ret) {
            memblock_phys_free(base, size);
            return ret;
    }

    (*res_cma)->nid = nid;
    *basep = base;

    return 0;

>
>         return ret;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
