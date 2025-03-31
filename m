Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C47D142900
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410682; cv=none; b=MmOLVswpsmVgbGiJSevoDhh7y3hyB83MOwyWU1klDKleepIb0zn0nejCPbi4e34M+RVhQsl0hVjQ7ZYSadPAnXKmLbAIm/OREahspncQ83/LtncCwzs8mBE+Lb70YTuqz2Fu8W675Z8acqMfiYX6+CEt7u/p5yS+px8CC4w8Zgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410682; c=relaxed/simple;
	bh=l5eqc0C4HMu2i/7Vw0ixdGCDv5mPI6Lkr35xLYnO/IY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNKm6OI/Di5UXLQhYv8v8gHiwlVuHY7FNWFZi+SMYoACvV4GfJ876EPzHX51hhtAK/hvLDzOCZ6n0v3vX9KcHYQVReWBHJxKMUlolc1jU5FfBrZzgfldUFV2S7Hj963vQtmL39+TwkPq/ZExE1bWjuJhvZnGYv0UOqIPCuZM90Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86d3907524cso1748159241.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410678; x=1744015478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KK/y5pjkyd8lRB9OXOepCyh3Rk+OQD2KlAMo3Fl+x+4=;
        b=s2ME3M8NcJ8E2EUjwI0mirfeQY8zm9VQPkZx39fJHGxZ4QFAD6k9lEhUvB7kZUP5MF
         D7HSIkKxF6JiqfYqXAN/inIyQIRap4YU7l2z8Objrsiy04AnajltjEJwB0y60+ONoCJf
         IkTwqhzaaBE1mHJOM+WPgkyzpFcMHkhzW8gIvHsED+/EgjZ8Mp/Dt9j2l91QtUw+EJ07
         8pr/nmpLjk6tjX2EBdpjOCVTSlnSYSmDlKj12Ub1heKaaS9tuXA5jwFko32eeZHKpG1P
         /kFzGumrgZVCCWEZDWKO223r4dXHbLbHwG8JKOQjYWSywDXG8StHnLLOAd8KqBPqSaCm
         a8mg==
X-Forwarded-Encrypted: i=1; AJvYcCX0gbdl8j3xrH3I126REcmtvj0sSDG5urufADbKVfj7t9VhEuvaT0Ba+QokNuuDBn6K8NR+Y0Zy2NgNFNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNt4lA1Wp3LObcDgaJhUn8PcYsw6xdhmuyxF8o/g8JsvtbGq5
	KKYeuPnpoFry0/Lq+5NeBWq+4jOWSAJXYOfKe66lZzk/J4tENAK14D5Orz9t
X-Gm-Gg: ASbGncvPbiAaW3ZjE27CbfIYAqm+3FJVzXyl8nDqVPs6o0Gxfky+o5KTAnNdMsBWQTg
	cdWP6hlZMeW2KgWUC0LnAFo30wp0JdTvQdvlY78zzRp6Vpojm80SMbgX1HHomOul7QdgVS/9z5W
	Hg3L/gdyo1x34RHTDdt53TyDPTVOCPr3sNjFgpEwtp6deViwBKWKM6FdKHrmRQqhC+XqPiQnA9A
	MYZtQAo+bsj8tSpU4WdxedEDrt8n0u3RFwbt3OtaYiWkSv6LiFvn6/90B7RMBTtt3bTY4rlQ2Mz
	UHqUCbnEo6sAFJtfOQMHcPS+mOmkwGHmK19FAwgt3VVfsdZMmEQ+gZnfNyhT6CUE3c7K2qZOVlp
	ykMmoUpj4IZ8=
X-Google-Smtp-Source: AGHT+IE/TYG7txlVWREhGnhBK2hC+9z04JrdlbheXIn+NTcDwBU/0dhkafVHCcf8rgeEVW/WPUNakA==
X-Received: by 2002:a05:6102:41a5:b0:4c1:99cc:792 with SMTP id ada2fe7eead31-4c6d38904e5mr4344661137.13.1743410678143;
        Mon, 31 Mar 2025 01:44:38 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfcf28d7sm1470743137.13.2025.03.31.01.44.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 01:44:37 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-52446b21cfdso1808580e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:44:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWCIwz0rkBtMWFgvBDMn6EMF5blJ4FibelFXGr533guK1fmgDkJCRJINIvnGDPxUv8rbJcK/mQl49iQmA=@vger.kernel.org
X-Received: by 2002:a05:6102:149a:b0:4bb:e8c5:b164 with SMTP id
 ada2fe7eead31-4c6d3847bb8mr4591245137.7.1743410677525; Mon, 31 Mar 2025
 01:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54c8046f6ffcb16b3e4e7aa1a6fedbc4e576f16a.1743114940.git.fthain@linux-m68k.org>
 <CAMuHMdUxe3gwsWdb37P+SOxL3twEf9_Fdr82naR+R3yxHCObOA@mail.gmail.com> <b8150223-8bce-32fb-c146-e14bcaa91134@linux-m68k.org>
In-Reply-To: <b8150223-8bce-32fb-c146-e14bcaa91134@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 10:44:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZV96E4Xu-+yfV-FSO1a0WkJWr87s35M3QQDL-np3chA@mail.gmail.com>
X-Gm-Features: AQ5f1Jq5LoKd7NFb6qFQASTYY2tKI7IkMQW81XTHTmiopvk1xqCDLyhTcF_8r-o
Message-ID: <CAMuHMdUZV96E4Xu-+yfV-FSO1a0WkJWr87s35M3QQDL-np3chA@mail.gmail.com>
Subject: Re: [PATCH] m68k/mvme147: Don't unregister boot console needlessly
To: Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Fri, 28 Mar 2025 at 23:25, Finn Thain <fthain@linux-m68k.org> wrote:
> On Fri, 28 Mar 2025, Geert Uytterhoeven wrote:
> > > --- a/arch/m68k/kernel/early_printk.c
> > > +++ b/arch/m68k/kernel/early_printk.c
> > > @@ -60,7 +60,7 @@ early_param("earlyprintk", setup_early_printk);
> > >
> > >  static int __init unregister_early_console(void)
> > >  {
> > > -       if (!early_console || MACH_IS_MVME16x)
> > > +       if (!early_console || MACH_IS_MVME147 || MACH_IS_MVME16x)
> > >                 return 0;
> > >
> > >         return unregister_console(early_console);
> >
> > Perhaps the whole function and the late_initcall() can just be removed?
> >
>
> A comment in arch/m68k/kernel/early_printk.c gives the reason why that
> code exists: debug_cons_nputs() lives in .init.text. Platforms like MVME
> which don't use that function to implement earlyprintk don't have to worry
> about this.

Thanks, I had forgotten about that...

> I suppose MACH_IS_FOO is not a great way to encode that requirement. But
> it don't think it has to be self-documenting. It does have to be
> consistent with the conditionals in head.S.

Alternatively, check if early_console_instance.write() lies within
__init_begin..init_end?
That doesn't work with the current setup, as .write() always points
to the common debug_cons_write().  But it can be made to work
by setting up .write() with the proper function pointer in
setup_early_printk(), getting rid of repeated MACH_IS_*() checks in
the process.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
