Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC0533842F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 02:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498178; cv=none; b=tESFqtWEUb2noUU+WTQ5067Pkairm7YYEs9Lx3aCXI8UxgTs0tptEqcjk1qwpNk9hpDrD2fj3is/A0ImKClK/xGR15vG2qZPgyb39xl6uXYO21/N6rwv6PmK0Ax5nURj06CFybSj+0lVrxdRNkdVPKQfZp8ctn/9lsAH6/6OJ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498178; c=relaxed/simple;
	bh=CGwm+uClyM68lDdLpAKcYoogMH1nK0BFJ9x04hZGAXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLgTRijo7EJDzmfFiMFWC/NsfwZpdVIUCGE5XhrzV1rsGbXZGV2cgak/DN1c7/eghaKyNO0dLZIJfwkoPXMJCRCb7iQDbh9wESloPEyL1+yEnpYEILodAWcVZsixCOPi4ts9KGIVjhulcf4xBZDBTcL/qHDmm6hovzWiUqQdDT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wyzwk1q/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wyzwk1q/"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7396f13b750so6190625b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 19:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746498175; x=1747102975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wcToqMHkDpTdLEXjKroWxHP95+TmEN3Q5daky/KBWzI=;
        b=Wyzwk1q/ckeyL4Lg+Vc9WZ6BEhaouRchAGmJ2B/E8N9RA7Oy04VPw9gLUcbTDV9lv6
         wiYMzlQ412vCOgr67IyUIX4MHRVtZmsb7/N15J2bniJP9psvkTKKr5WY8uAJGDxB6NUs
         l5/USR3LpsSlsfAU7RSETB3i2hv7ahOg+kr94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746498175; x=1747102975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcToqMHkDpTdLEXjKroWxHP95+TmEN3Q5daky/KBWzI=;
        b=LTMqPJZTNsUPukRu/F+lCXeNlg0Ll5AldfNUYf4+NwX6HWgkY+HKpT0NPCTooxp72e
         paBseKkYBwlzlsy5Cw2sHozilaXQkOtATJ7VeNVNbMtD2tVZhTtsQWnvHj5zJejZJShg
         ciVVfIP4HfLyOrDHqahYuvK8i3aBcIjpmv9P1Uq8W1p9kk10CNlEyUjRWDJ1ZQyyTRa8
         Bvg9r7LYaUCMBzlt5v45Uek1iFUoFEoDOpqP2YEnqCYRM4Nr/Ml6vhJI9nbqNzD6zCt7
         ABUhw5uoZf1lEWZSF+Swcuj0qpgSpDTcVxv+9aIPbS9+lh1foUZg1cC30/gdg7qrtxUo
         RKqg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7S6skReZLMaEwlAwgq7KxAStFiuROgJrkm9Rnd4xbBgIRymlZp1y9iNq6P0Idprcmuy619LjEerfT5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeoPTOrTI/7VdENwT2KtwBh5B8012UIEHbDXZEYYCajVxqXrbc
	cOq+11yqb59H6hQaTQuXuQdBWho8VLfehd6T4NbveBEZCuuuD3gjHlpnnAGE6g==
X-Gm-Gg: ASbGncvCaiC6aXvLLOabRUwxpUqFpHcjgoAOqywYV++zLCPr7AM1d5GjlERxKVWS9OQ
	ls0WUzg+/gEi+41q/vlgF48YfQtztX6xcplAO2FWethKIQYMmtrFplusyMPbLvBKSDhzuMltmnT
	UWxDNmJToD1MUB9tdvrepb14UxzPs464otskRdmHt0MSZ0kmYMSIHGLs7ksvy0goq4ybdJTqQ8C
	CYY8KnnVDqLyaqS5Du/HSr0KU+pLAiuTRV5w5kzMXSIwwAfDeGlDdPjvRgjWEY57ipBHY93qBun
	FwvZBHvGu3tonHynQnHC5KAQROhqrI6sRQlVyerNSmZhOhyeYFj0VHQ=
X-Google-Smtp-Source: AGHT+IFc6wz2lLiTovWw/lmIDOLnGErdPqyw+m3UEoeaabqxUpsithWSUC6r2ammWN8skoKVjYaQ0w==
X-Received: by 2002:a05:6a20:3953:b0:203:bb65:995a with SMTP id adf61e73a8af0-211834a9d45mr2119227637.30.1746498175296;
        Mon, 05 May 2025 19:22:55 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:4dd5:88f9:86cd:18ef])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b57e2asm5261813a12.26.2025.05.05.19.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 19:22:54 -0700 (PDT)
Date: Tue, 6 May 2025 11:22:50 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Song Liu <song@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Matt Bobrowski <mattbobrowski@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bpf: add bpf_msleep_interruptible()
Message-ID: <bianejll3uuual7ffytpuraphcgr4xysmnuapk74x3owx4m45c@vwxgbzkwkt5x>
References: <20250505063918.3320164-1-senozhatsky@chromium.org>
 <aBiJnR5MEL5hVXXC@google.com>
 <wzxhhoiczrhsosf5bkwqf2yypdrhgrm6wskiusfg7iumpgk7ew@rcegtieelqco>
 <CAPhsuW4Q7cHyMHemnLtoys6uNgd-tzKARx9gX177PimAEwpszg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW4Q7cHyMHemnLtoys6uNgd-tzKARx9gX177PimAEwpszg@mail.gmail.com>

On (25/05/05 12:01), Song Liu wrote:
[..]
> > + * unsigned long bpf_msleep_interruptible(unsigned int msecs)
> > + *     Description
> > + *             Make the current task sleep until *msecs* milliseconds have
> > + *             elapsed or until a signal is received.
> > + *
> > + *     Return
> > + *             The remaining time of the sleep duration in milliseconds.
> >   */
> >  #define ___BPF_FUNC_MAPPER(FN, ctx...)                 \
> >         FN(unspec, 0, ##ctx)                            \
> 
> kfunc shouldn't have any changes in include/uapi/linux/bpf.h.

Ack.
