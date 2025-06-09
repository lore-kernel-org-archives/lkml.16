Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9DF224234
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 22:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749507132; cv=none; b=qogupXFAqcfOT5fU6DEsXLUCLoQSzy+onnC9QA7hqlE4KZkcbGQAOV6KMpTlplL+7d5p3Et2fL2Hcbpm6WZsZiAUuQAuTpf1lJpVFVZRmttH3a1lK+sRmHc5RSfccbbzysiNYxRzGFEQKMcnRLoASrqmV7ypdFqx8T9DoP6Gi48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749507132; c=relaxed/simple;
	bh=Q096VwiTTUVf+mPt3DUqJJru+Vb3D0DDUtk3t41e+mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiTzyvB3uK1kpwf3eo0dSTAUYTNtawcmD9B0D1MSa2fa3LbJEMvMb/8wxAKXIKbaYOSYEfVL2dE/1GMWLroQmXNwfN6rkSUD0DY+/sBrdrbcVpixXC7EtDvYCICcJRs+o4xyQ9rjanNVNASrD9tmWP4KDLgUDOSH3cmrhTl0xnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T/bxh2O+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T/bxh2O+"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235ca5eba8cso17175ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749507130; x=1750111930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HOEpQR48459oRBgMpH+r3088NqHoqtjm5LRzsigSh8M=;
        b=T/bxh2O+Gbr5dVl97lML/A6ZxR+uehVTdoljFXZkysaypggDFM5ejiXqrHpcNcP3TB
         BErk8t6V9h6+ZcD8toi6oKiWNsuf37WhqmFPRbrkqgDW1NP9I/R7NHOk8fZezv82jHh+
         BjymawOPmBNELarNMPirCcRJji5RPy/IAxP3SReT20UVetTGEm+LaEgKhhKDS5kD5UMJ
         /pCTp5w58REiJvgiJsj/StWLI+jgbXjbNRBtsRHiQhcU8fBfnKgk4NFP0i7sI9GPoFhO
         VQiNbIxa5TxH7qziWd8lKz8CbSCMcYn/CKoTnaKMM7SiwTUk39nIekSw85Rgwz1lhgXk
         ViUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749507130; x=1750111930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOEpQR48459oRBgMpH+r3088NqHoqtjm5LRzsigSh8M=;
        b=QSF9TaWMwvKJTPIMOFOE9NuRWVgnTKYatdZDfHbYykmUb1eOauj/XmYwmpju2cHsbG
         5+0hlbTcEPpz0PMLfMmOarVYsmKrlkDFD01pQl5joIFTS1QAvSIMTWIQaDW+Q5dLbSqw
         RRqIL3zDPQ9XHpfIvZm4PfvK3odtjmT2w723OpodI3fSrqnbVRZYulYWMWAA1X0/xjw0
         moPU9lrsSq3qnzY/jAjEsQtlp6IzKy7Nr4vReNP0nsNyzom9Y3x/cAIgDExZ5S2Hro/3
         +ytOzb+3XDUI0W8xQ/Ap6rGHhyCnftWmCHORDDdAk7FuFtIq4sImNDeF7Nhy1nH6y7Fz
         5m9g==
X-Forwarded-Encrypted: i=1; AJvYcCWAv9txglRyB6+S2Zc8nirBMUTgWc1cxMjOi2WoVwISYAv5xyhlHjCpr3sFk8P8mo/JwyW4iZpCYF5Dzs0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5T3mD2b20rR6eDMvgcTTyugu1FcNprN60sI1FaSaMkkc7ji2F
	ItMgkcnSsgoXPp3ZbXSKCpLuk9p85JAyPKtKbDkecKoKmM26bVgEle6lwMa1qDERNg==
X-Gm-Gg: ASbGnct6Jw7SW8Ub0QBioW6g2KtWOS313N3Snq4R0bls0rrM7E37byihp/ns9gaLpyZ
	VRHH2AsiENXtQkSQrE+0TSGNwC+LYRc+C/VMiduRRDoZU+WTT9PG6+jFb0wkwIKMwrGQankhzL1
	csc7z+Ub/2SMXoKkwPpUVe7wwjRQqz4K4L11s62o8at2yK7FZhyPcf3J02W4UB9a5jWJ8ULflk+
	PgI3UiFx7Rjagvsa314qphxenNIbIeDiG1TAJk9msbs6nf+yHJCnYoNW0SoZPwBjGlcXdy8kNHz
	0NfkKEkt6VuDoND2lFZwXiv7cYVJMVsDQutpxpZ93KFyLJep8JNtj8CjvzxhVH4gXKr4ke984wF
	K0bDYRhwXtvDGGDsPFbTjEnipKrOTF94H
X-Google-Smtp-Source: AGHT+IF2AY3T20FOy8DmpoVu7vdEGvItzPx4tSajszVB/X4+P5zS/jWc325IG5gFLeSy31rddi6wAg==
X-Received: by 2002:a17:903:1b4f:b0:215:f0c6:4dbf with SMTP id d9443c01a7336-23611fd8362mr6331895ad.14.1749507130159;
        Mon, 09 Jun 2025 15:12:10 -0700 (PDT)
Received: from google.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313286f38c4sm6694653a91.0.2025.06.09.15.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:12:09 -0700 (PDT)
Date: Mon, 9 Jun 2025 22:12:05 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] module: Fix memory deallocation on error path in
 move_module()
Message-ID: <20250609221205.GA1439779@google.com>
References: <20250607161823.409691-1-petr.pavlu@suse.com>
 <20250607161823.409691-2-petr.pavlu@suse.com>
 <f6fa3df3-38d5-4191-96d1-9a8a2152cedf@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6fa3df3-38d5-4191-96d1-9a8a2152cedf@suse.com>

On Sun, Jun 08, 2025 at 09:25:34AM +0200, Petr Pavlu wrote:
> On 6/7/25 6:16 PM, Petr Pavlu wrote:
> > The function move_module() uses the variable t to track how many memory
> > types it has allocated and consequently how many should be freed if an
> > error occurs.
> > 
> > The variable is initially set to 0 and is updated when a call to
> > module_memory_alloc() fails. However, move_module() can fail for other
> > reasons as well, in which case t remains set to 0 and no memory is freed.
> > 
> > Fix the problem by setting t to MOD_MEM_NUM_TYPES after all memory types
> > have been allocated. Additionally, make the deallocation loop more robust
> > by not relying on the mod_mem_type_t enum having a signed integer as its
> > underlying type.
> > 
> > Fixes: c7ee8aebf6c0 ("module: add stop-grap sanity check on module memcpy()")
> > Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> > ---
> >  kernel/module/main.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > index 08b59c37735e..322b38c0a782 100644
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> > [...]
> >  	pr_debug("Final section addresses for %s:\n", mod->name);
> > @@ -2693,8 +2694,8 @@ static int move_module(struct module *mod, struct load_info *info)
> >  	return 0;
> >  out_err:
> >  	module_memory_restore_rox(mod);
> > -	for (t--; t >= 0; t--)
> > -		module_memory_free(mod, t);
> > +	for (; t > 0; t--)
> > +		module_memory_free(mod, t - 1);
> >  	if (codetag_section_found)
> >  		codetag_free_module_sections(mod);
> >  
> 
> This can actually be simply:
> 
> 	while (t--)
> 		module_memory_free(mod, t);

Looks correct to me either way.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
