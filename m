Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CDB2F37
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169918; cv=none; b=qAhtfgk9+pJSYvY7h9D0odO3YV6TYmaXFgRdDTcQ0Svdp/vcWuiHQkWUe7cZ3hEZP5fg4KEjArzm64J/TCWvfG+n7AfElWYMSOjof1bT9kEmI6l5Fv+xvLIccJUoidYbtv5jmzleKIGDjHKUvBckDIwQc+a35DhP40TqyuIa6uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169918; c=relaxed/simple;
	bh=7keX5FQHfuj5criWs662qvX5Y0mvZuQ+wEIWA+09qU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiPnTfPgzdwJwBaiLzJICRSVQ0s2Dn0tH5/w3UkXniCJLda+3N/RR9lR3GyvrTrJmtheYbRwV9NyHfI//HawbtnMUCM20N9JBa2FpF2yid2wUcKwQJTsKIyfpV34EtTT3VmbXSgTWzf5p3Y1WimxOG4XRjs2NH4ELuQEU2xa0DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ri52rTuY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ri52rTuY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-391342fc0b5so1689595f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743169915; x=1743774715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=olQvXU3SlpssZcd54ZBPK/yHAsySM9j/3+8owqmZXYk=;
        b=Ri52rTuY+auIlCiZoHCuVbwfsheeZHWQ1FjX+m0j7RQjXBzvmnDcfAW0Twomki44QH
         H/AY0m5enj43ba3w/UsyeJ9GYkolrQRZTj0eV53UxSJsBSqPM4ByLvPe0KqN2P6DMHRg
         MWFEjTiDp/OlbsZTBU1YrK/kxKLpkYT0M+O+QQrGU3FLG/EVTbYnGYumiplgEAWrlTas
         8ZiXqcstegbn4gbJHY/us/tanKGWOsdXyaTqBSbkLY+N8nQm0iA34YdQC/PAv17XtEBL
         o8WhJH1ljNGuYE0dLHBm937FxgfZr23qPQxOsi8XGvRb2KcmtiyRk75tfmlTD9gWb8bm
         SUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169915; x=1743774715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olQvXU3SlpssZcd54ZBPK/yHAsySM9j/3+8owqmZXYk=;
        b=CuggcjraziSYS/+vmOmK7ljCx4mgGdV5QoTVvNIDzGk+KywQMuZGELY1N3NTSQ7qIH
         77EBbg/CNEmX9ApHJve27+74DTm2jFYaJiAqTxnZ8mNf1RRrv9UYFS8QcFVtn3nSz+U5
         rHaov1rCajQdu/wWbZ980fazektARUSdVNBl9LecAUH5DLZ2o6BxDy/MmM+kNNRvxRjF
         84oGjguDeLm3JQPHinbfI/h0wv9B4QjE9NX1SZ24A+Z/k3HZ7FsA4snvQd9I0Nfifcsn
         xCRsXBI9yYI6Y6uIdGd4Jn5vnoIkNP2qUvds01W/3wiPTpju6DsKXoJoPEHRR09IeEFv
         uTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJy6JcgGjwQQyuDwx6dLMVRKlJ5NqOfas1Se1JY5cB5/eQj+olTmR1tngIlyJpAuEFR6ccSWhu0dxh48E=@vger.kernel.org
X-Gm-Message-State: AOJu0YycgFwV5T0vQkFi1rNUsydP8xFb+/RYBYggyTOC2PlfttWGNu+O
	J9dNfJddeDGjaJZzu+jdFVqLNSqVVeSAzQzAN0OtHTNjqi+NHx9xQUj6SiJdclQ=
X-Gm-Gg: ASbGncvGeHpwCIuOv8huEv5+g+7Cdn+/s7Wq+MfS94UlwP2umJqwdW+ZkL4XXbMmCK6
	m+cIr93zHsd2RTwO3f7JgcATZRxHxud5NnmuOvNcYcQOyPvN0u0HXNhInW7Rnnyx378cl75hEKs
	UI4/LyEdcQH7xQSIT6dvjelphrlSo/URGuAXuLopLNF+SYH8OAqMGLSEzD+dLNhCPrGCCtQutsY
	59QbFzXRRs5KBPS2NlnhiSLIiEUxRfeTqKD4GJ8fYFJ0fF5Tp+0doCfJXcD2Nn3EFfAR7Oam9Qk
	BXOmV8PRViFuUvULCKEytbPvzqrPPC4CXE9sag8AMQ0tvNA=
X-Google-Smtp-Source: AGHT+IHbfndbuHfkuasI/Cf4p6r8nuRFhsT5d5n30IcceIH6HCihEcayWTwO3EYsoj8rQdERKU6JoQ==
X-Received: by 2002:a5d:47a2:0:b0:391:3049:d58d with SMTP id ffacd0b85a97d-39ad1719a55mr6958877f8f.0.1743169915024;
        Fri, 28 Mar 2025 06:51:55 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fba4b4fsm29091505e9.1.2025.03.28.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:51:54 -0700 (PDT)
Date: Fri, 28 Mar 2025 14:51:52 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <kees@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2 0/6] vsprintf: Add __printf attribute to where it's
 required
Message-ID: <Z-apePufuwt19djQ@pathway.suse.cz>
References: <20250321144822.324050-1-andriy.shevchenko@linux.intel.com>
 <Z-KCNy7Qu2vFdwVx@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-KCNy7Qu2vFdwVx@pathway.suse.cz>

On Tue 2025-03-25 11:15:21, Petr Mladek wrote:
> On Fri 2025-03-21 16:40:46, Andy Shevchenko wrote:
> > This whole series started from a simple fix (see the last patch)
> > to make GCC (Debian 14.2.0-17) happy when compiling with `make W=1`
> > (note, that CONFIG_WERROR=y and all warnings break the build!)
> > down to a rabbit hole.
> > 
> > However starting from v2 the last patch doesn't require the first
> > part, I prefer still to have them since the functions, while being
> > _binary_ printf()-like, are still printf()-like. It also puts in align
> > the tracing stuff with the rest and fixes the wrong parameter value.
> > 
> > These first 4 patches are organised in a strict order and can't be
> > reshuffled, otherwise it will produce a warnings in between.
> > 
> > I believe the best route for the series is printk tree with immutable
> > tag or branch for the others.
> > 
> > Alternatively the first 4 patches can be applied first as they
> > are pretty much straightforward. They also can be squashed to one
> > (as the same topic behind), but it all is up to the respective
> > maintainers.
> 
> The whole series looks good to me:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> 
> I am going to push it via the printk tree. I think about doing
> so as a second pull request by the end of this merge window.
> 
> Anyway, I am going to wait few more days for eventual feedback
> or push back.

JFYI, I have pushed the patchset into printk/linux.git,
branch for-6.15-printf-attribute.

I am going to send a pull request the following week
if nothing happens in the meantime.

Best Regards,
Petr
