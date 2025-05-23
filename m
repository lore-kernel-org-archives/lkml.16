Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1908F3FBA7
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747985013; cv=none; b=PLgLgtIkzZvXfxOyDrytdKrbhBpF82P6tSTQ2Yjg5zNHDRPJnnDcrheRbPXxRqNvqkn8DcSeFSmyld1vmejVINoaPSSDaU7YsGhIWTGlVGqYZizEMjdP1OEim7tqR+CLabZ468/0mB1m0xXZBsYRHtoCIohbteaoSBDoqyERGOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747985013; c=relaxed/simple;
	bh=ihoBSshL0YGNXRQl56dbipBQPrtOpSxEgiCWKUyk9SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nByH3jKplGCYZDI8Y0DNELMDvrzS9vKKbVBjUJyb9jQx0MQ23hRaTQ5yZYscD4WG4m824YfouKlKqmIvAyJv+C4b5D95z2tZbE7W/5NclcVrYO5IIhZuaNWe5Nn88DvAamwE1rW9KGEAfU0xFTuMOIhjE5nbHMpOwo1sKSkdbos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZSApMKd/; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZSApMKd/"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-232054aa4ebso50049915ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747985011; x=1748589811; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9oFOTJY+jM52XUB7bJEkukbArm9m+yq0+hVZWj+z6wQ=;
        b=ZSApMKd/qXasRPEv96HmP7k/98vVq6536qVucvH8vxog9RWDEf7spQauOjwmkwHmBx
         gUmxF7DR2GL+JLeIzD7NQj0N/X4Tx4ddnS8+nucnGF+N14V8ICvbsR9DMI5vOAQBEcpO
         zde+VvdBU3hcXQ/MpSvrLCAcsKYrITRKhfWls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747985011; x=1748589811;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9oFOTJY+jM52XUB7bJEkukbArm9m+yq0+hVZWj+z6wQ=;
        b=j+qIW6GlzdJ5yVbLErp8sXv84kG8vAo+A2EheYJmwxDjprCcrMsMVV9mR2MFrZZ9vD
         u7/aUPoCIOcSOwjDtQXY2FaHVOYhcIB2HbVpcJuIpaWA9agoLuLE6pJ7G6fGw6VRhj2n
         7WZcF/SKKFxYme6MSNsRRzSdtvc2VNZc4bYBD6TAk5Af9OJdO52SXJ2jrsyLka3DGd0Q
         LjX2M3hBsWstM+FOmOqJ3ID78uwL65NBWSS+ND5bTkaFZFkwvOprE7be/2smwxEj+jDe
         oaPw9tPhwN3jUpb40CwRvl/3+7BxENfQNA35wL4F70gc9xapQBrPY1pmtKfr54euA1Wz
         D3ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVIK+819cCN9lcYJie9E9IZzBELO5ayuqR6v/RLDwF7v4kRZ+rWaCvJ7263Mv/szWTxTjIJ34rsOKRMTt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzKoZ7gEbVCk2Zy0DKqjgbNkehUqDVWbOTeaZEXMkALoQloWDX
	SDWJoDJnF0q/2+aTuMH3ZOtLQ1zRh7wzrETqpZ1O9iBzuXwlajE0n6LNDWgO1GwTbw==
X-Gm-Gg: ASbGncuhbnbGmu90lkTojXQMW/2OGQDcOMYjw/SpHaUciz98zsB0S1MbgBhDGefJuOB
	CYxEAjwPs1ejTbfbfxfSbc6E9zF1jr5iYKQvMD3TW2AjZf3wHFMLlMJfjkx5t14Cvex2xdTClwk
	b0xqFvA++XFblyNwj2au9bXSi00jQ0ucuVTswSge8filQkFsMB9LsJIp6haeX3O/X+5ukWCCsHA
	Jcni4qEXugUJtou8lvr8Nr1b+QTAx8UJ6nUoyw//t0GDj+u0+XqiJLDD3OEleVCoRICmENvY28G
	VlC3IAi6VseNvxtRO/5qB72a+NEOlr8JtsaENaU9J5wMcGttAspi/vk=
X-Google-Smtp-Source: AGHT+IGV7jMy68tNUPRjmOEfAPOqB8BQm0nYihPU/YOpSm86JVssQhjOtx/DD3XxmepL/d4sIa0A8g==
X-Received: by 2002:a17:903:3d04:b0:223:f9a4:3f9c with SMTP id d9443c01a7336-233f21c7ccamr28916195ad.9.1747985011352;
        Fri, 23 May 2025 00:23:31 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:17f7:e82e:5533:af02])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed897asm118688185ad.250.2025.05.23.00.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:23:30 -0700 (PDT)
Date: Fri, 23 May 2025 16:23:25 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Matt Bobrowski <mattbobrowski@google.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] bpf: add bpf_msleep_interruptible() kfunc
Message-ID: <z4gvqyk3ktqhd4wmi7ju3qw67c56brf5klxcer3vqmp3v6sujn@2xq7j3ji4kic>
References: <20250515064800.2201498-1-senozhatsky@chromium.org>
 <CAEf4BzYTiPuOUbQgkNvT2haAupeep79q0pVu=fcD5fEgnAjR_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEf4BzYTiPuOUbQgkNvT2haAupeep79q0pVu=fcD5fEgnAjR_A@mail.gmail.com>

On (25/05/20 16:26), Andrii Nakryiko wrote:
> On Wed, May 14, 2025 at 11:48 PM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > bpf_msleep_interruptible() puts a calling context into an
> > interruptible sleep.  This function is expected to be used
> > for testing only (perhaps in conjunction with fault-injection)
> > to simulate various execution delays or timeouts.
> >
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > ---
> >
> > v2:
> > -- switched to kfunc (Matt)
> >
> >  kernel/bpf/helpers.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > index fed53da75025..a7404ab3b0b8 100644
> > --- a/kernel/bpf/helpers.c
> > +++ b/kernel/bpf/helpers.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/bpf_mem_alloc.h>
> >  #include <linux/kasan.h>
> >  #include <linux/bpf_verifier.h>
> > +#include <linux/delay.h>
> >
> >  #include "../../lib/kstrtox.h"
> >
> > @@ -3283,6 +3284,11 @@ __bpf_kfunc void bpf_local_irq_restore(unsigned long *flags__irq_flag)
> >         local_irq_restore(*flags__irq_flag);
> >  }
> >
> > +__bpf_kfunc unsigned long bpf_msleep_interruptible(unsigned int msecs)
> > +{
> > +       return msleep_interruptible(msecs);
> > +}
> > +
> 
> What happened to the trying out custom kernel module for
> fuzzing/testing use case you have?

Oh, my bad.  I think it wasn't clear to me that this was the final
conclusion, it looked to me that the conversation ended up with a
number of open questions.

> I'll repeat my concerns. BPF maps and progs are all interdependent
> between each other by global RCU Tasks Trace "domain". Delay one RCU
> tasks trace grace period through the use of msleep() will delay
> everything BPF-related in the entire kernel.
> 
> Until we have some way to give some of BPF programs and its isolated
> BPF maps its own RCU domain, I don't think we should allow arbitrary
> sleeps inside BPF programs.

I see.  How are sleepable BPF programs operate wrt RCU currently?
