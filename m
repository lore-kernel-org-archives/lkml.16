Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95531B0426
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738225293; cv=none; b=quNArY5VME+FP9QBDYRBNDsbSujpKNa+AHFMVv0FakqiJ6qbfb7xp6ZWjsvqncNrU+Xw+lvkQnJgs4JIATcWGfKv9OiPrEKikDUzG6D8R2HG7k/PjPuzOToUH3uYTc0DcPOV+McyGW9jt+cIAYuthLJN6OeBKmbExL58mh4zxTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738225293; c=relaxed/simple;
	bh=DM9D4FDbGNU5mWpG91VU/qPeDc9li7yVy2LWC1+OY8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2HZlWcv90G7fslrtwzGhKXRBF9PuqZx2rtYt+IgbMTswuDAjc3DJuCBpB0rJoe3hojay+E6kQMeZ+WFdb4df0+NqhV55Xmbns+shFJxhE8+y6tcRIKUHk378uOkoe0jIj+L8QoCUSTTRorvXsmqL+ASPRM18AZMHZDYEgXtWI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4afdd15db60so172393137.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 00:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738225286; x=1738830086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaD/E6PXTaDQ2QuYo/3qqTDpp2nzD7hhPFRo29uLk0A=;
        b=jfvQNVJARqIK/EtXkpuHIgt3NAmmSJFD2WZkrhh2WLYO4F4wbZS2jDzgqgwpHhofHT
         zuGPUIF0tZhmwo4TdR+FEFURjMfvYK5DaVSuJyVByVBzC4v4L0BhkKcKzWfaN8VHHc1C
         cwuhmlVy7z6em+JDJxXYPAeVaBnCGnEG2VUwR0mcQNvUXoabQBDkPsUHFt2Lc4oCTH0F
         He1hryGMlBxyq9/0okVlxcPPCcU+6UKTnw25G4L2desvfYuC9jzi7UBMScsRNMqgShcO
         YCukjFsWOzPA+jHYjRlvU2tEzpzvwFg54sZrP9rh13HIFqaVQH9KVxrSrzQpbydVwid+
         I+5g==
X-Forwarded-Encrypted: i=1; AJvYcCWe/tidC7bsAmmoN9hsndZUaiOurZDYgLDy9TJ0Z4OUDdRkbsieQt5aR2cbXD0K61+ANXJJs7Sfm50auQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YytgeX1me1ffFb1CNCCr+spD3RU+ch61IVYUQalARTbRcpG2usq
	/KRdMQ2rlZ3y9y2NryaS8aG+5ceb65JFPBsN14BU+cICPMWDqxXAWzVzikKB
X-Gm-Gg: ASbGncsp8z+V4uMOn9YaOOHr9N15/FLx0Ons02DT1VlQ32MO6GxjmPoa/+BGguRw3T/
	PNaMe94j9CikrelYrpQIg5ZY5mHm+V3iExXgw3yHAS5ybn2IGxnaztSCg4VZOVGhiqlS2Lym+qy
	GLK0nrlMlNq/ww7MAJKOkQNdWHOzL8xvoJAvedpGY3/n4z9dt1ymVurNl/BTtejd1IPKoe++0BB
	3+eKGbQHilE+lwa+NsGhnCfYVFeq6IcDMuoQ4NxE/lDsfWKb++VHbKPf3Oir5nqDK4faGWm2PDd
	G/nl3UEhdGdcxW/8wLZkOS0oCTyFU+UNTN3N+JZuyx0VoDSItoH7hg==
X-Google-Smtp-Source: AGHT+IF/epxPK/mFk/Xqu72pdKW8sGeCULg59Uzd0hrcexvptxVX2bBzxWScgY2ejDG3WCJdFuuKWg==
X-Received: by 2002:a05:6102:330b:b0:4b6:d600:a35f with SMTP id ada2fe7eead31-4b9a4eb3fe8mr5500953137.4.1738225285836;
        Thu, 30 Jan 2025 00:21:25 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa13ef1sm159783137.3.2025.01.30.00.21.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 00:21:25 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4aff620b232so194595137.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 00:21:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYRx9mNmCPJ2lYNZaLTAKwnghf2ve3YRFXr3v5zuQrjYogHJ6zdJAbzjWzFsG6NV+BYBgkueE3KCyE4NU=@vger.kernel.org
X-Received: by 2002:a05:6102:a52:b0:4b2:7996:6ba4 with SMTP id
 ada2fe7eead31-4b9a5266e7amr5391829137.25.1738225284361; Thu, 30 Jan 2025
 00:21:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com> <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
In-Reply-To: <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 09:21:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
X-Gm-Features: AWEUYZniYx50uUBB4BKLzCpQ-mS0oONl2y__yoxAs6c6zYEzharbM-CAzfEZmbQ
Message-ID: <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Hi Liam,

On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> I've never used the kunit testing of xarray and have used the userspace
> testing instead, so I can't speak to the obscure invocation as both
> commands seem insanely long and obscure to me.

The long and obscure command line is a red herring: a simple
"modprobe test_xarray" is all it takes...

> You should look at the userspace testing (that this broke) as it has
> been really useful in certain scenarios.

BTW, how do I even build tools/testing/radix-tree?
"make tools/help" doesn't show the radix-tree test.
"make tools/all" doesn't seem to try to build it.
Same for "make kselftest-all".
When trying the above, and ignoring failures due to missing packages
on my host:
  - there are several weird build errors,
  - this doesn't play well with O=,
  - lots of scary warnings when building for 32-bit,
  - ...

At least the kunit tests build (and run[1] ;-) most of the time...

[1] test_xarray started failing on m68k recently
    https://lore.kernel.org/all/CAMuHMdU_bfadUO=0OZ=AoQ9EAmQPA4wsLCBqohXR+QCeCKRn4A@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
