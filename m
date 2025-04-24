Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15DF1A23BE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745464318; cv=none; b=pQl1de1GkD5fR164TxZ8VgntvwaWcI2GySTqT9n5G2r8Ju1+y/KtVrQhAB+bd6IIdYKbBzu3uU0LMOSKJ/a+rHlcNaUFyPcfcICKyez6fZvLX47vHeOGFZCu9KMSOZYjKjfl+odXttdJlKrwSHYghHsTgAhD4hqSIQCY5RGk6bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745464318; c=relaxed/simple;
	bh=JwOksf4B29z069WOf69FaTunOS4j0GfB7eBpiEZONzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljuCIzEuBUcE/2zosxJAW4Y9xWEtXgnKQHaNznePydX9uxe/kTnkhreS1Cjos1nzVWVFdnrgyfuxcinzyjXby9cZYT3EyyNcS/iPuV8F7eT8TQxm9Zr1i6sky4A/frrg6sT9dlQxTVZa1vFy0B6sLzf0qAijtJbVX9vZ8JjsQEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIrBJVIC; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIrBJVIC"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73c17c770a7so595879b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745464315; x=1746069115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5KwGgD9VQC/2dUan7jrHG+qH6zjlfqwlPGHyOdQtows=;
        b=XIrBJVICFfqOmAoCwJdIRoMqnpNI+G1FUTT5qqBksipMX3GPBQVfXp7hG0KCt9GHnw
         yg1FbDnrLpFwcLoW+SnsaCbez9hHnwnZFA/9mwbRWEEY2R9xW9uJRnCHslxD05nnMNo+
         MkxuvS+DmQOo/+aTP5lgjmZwxUyzcsQVTWA4h+OyDyAdMFKBkNYDbM5bEPok7jj0ieCB
         Ul5jSAJzYF702gzC/ff7rTVzdv9hdVdy4WtYZWTNnQyghTWrAJtdbCR5taPrK6f8OFc+
         YtZti3fuMim4gRj8LIpi88laBCfB90makHpTw5ZW441SI49idpAedkV2F17SyUbfp//P
         Apaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745464315; x=1746069115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KwGgD9VQC/2dUan7jrHG+qH6zjlfqwlPGHyOdQtows=;
        b=ShVMIFW9f/92ySCUPirAOABvTSO/Of0SyXvmrY4JDmMggWKg0mOd9GKV9IE1Dc9vka
         tAtS6vHY8lIBvrr2ASi84UgVTFJf0qB5NbFdKb5OY4DKetYxX42nk/T5U9RPBPdjZqAQ
         BupzgfMyGGxFjRvO6KmmVil3dzecanCkB3eEVzOrmadtMiyQzE/4wvexoam8XF6Chsh2
         mWYWIahmcfA5oV/NowbfyKWXuytzLVmimCBXmYzeC1ZXHaE4MNOiOGbIhe1WbrqvsKRu
         zNc/5cleXhtVB4f7DBIYef8QANRelApwbE81cW4T/D8BySbTz7IlErOSkRvD1K47kBVq
         F8VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtnasg58/MDgdcy9d44giFBhNR7JCAkWs6DIvxR0VtbPYHbfozH1dx383baZaS9TeCb8O61u8ffGqw0Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX3y9X0KKNoNJnk+TKZokVkbHuBwFci8wa74JJFMMHxD4aNgHb
	5YhGfYFa9ZRACUjjwvGRkuE23PNU1wY/o3JCkc+ggALak5kT7dzn
X-Gm-Gg: ASbGncs73WFHnfudJthN9hDqFAUvz1iupyeATnng8fo/PcI0o6Venl/7VonDy+/vm0E
	ejkO55L4UlwBeDLvcKhG8z/MegIq4oulxtXKsXdpB99rFNO+RYcenT46nQfWGx3gD/Zq59h6NZD
	V9ZzwLcsJB9PvnfBWNEezt/hE05KLGVJta0KDs58os56AgQt4NZzozGKIail0yKKLW9aTI7gAEv
	vZwd784oh5VmV7Y1WMSl4UKjpd70mLjVC3B3EGYQbEhZnsdoeDlfKIqIHCvjGHUNJkPx6l6m8Df
	fuvWrmr747v2ZRnuKoFtAlU4zrM2jMYLngYkPNUQn5renz8lGPI=
X-Google-Smtp-Source: AGHT+IHvRakZu+AS1ZJ07+rcHCZ25CI0ki6eQKawATNdO9nx7I1xsboL2eIP8OhCYfuuXa87KsaqDQ==
X-Received: by 2002:a05:6a00:1483:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-73e246188b5mr1574407b3a.6.1745464315031;
        Wed, 23 Apr 2025 20:11:55 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912fc6sm353610b3a.12.2025.04.23.20.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 20:11:54 -0700 (PDT)
Date: Wed, 23 Apr 2025 23:11:52 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, x86@kernel.org,
	linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>
Subject: Re: [PATCH 0/4] cpumask: add missing API and simplify
 cpumask_any_housekeeping()
Message-ID: <aAmr-FktkJiI-bxd@yury>
References: <20250407153856.133093-1-yury.norov@gmail.com>
 <240d0962-b381-479f-b3ed-4e6ce72d6570@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <240d0962-b381-479f-b3ed-4e6ce72d6570@intel.com>

On Wed, Apr 23, 2025 at 02:27:46PM -0700, Reinette Chatre wrote:
> +James
> 
> Hi Yury,
> 
> On 4/7/25 8:38 AM, Yury Norov wrote:
> > From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > 
> > cpumask library missed some flavors of cpumask_any_but(), which makes
> > users to workaround it by using less efficient cpumask_nth() functions.
> > 
> > Yury Norov (4):
> >   relax cpumask_any_but()
> >   find: add find_first_andnot_bit()
> >   cpumask_first_andnot
> >   resctrl
> 
> (sidenote: above list of patch subjects do not match the series)
> 
> Thank you very much for doing this work. This simplifies resctrl code
> significantly. I do have a couple of comments that you will find in
> the individual patches. 

Sure, glad to see you like it.
 
> Regarding upstreaming I would like to propose that the upstreaming of
> this work be split so that resctrl changes do not go upstream
> via separate trees during this cycle. I am ok with delaying the resctrl
> portion of this work for a cycle. This is because we hope to include a
> huge change [1] to resctrl that includes the code modified in this series.
> Having these two changes meet during merge window will be inconvenient
> for maintainers involved. If you require a user to upstream these new
> helpers then another possibility is to upstream this work via the tip repo
> if that is ok with x86 maintainers so that that huge resctrl patch is created on
> top if this work.
> 
> Reinette
> 
> [1] https://lore.kernel.org/lkml/20250411164229.23413-18-james.morse@arm.com/

I can move all the patches with my branch (bitmap-for-next) if you ack
the restcl part, or let resctl folks (you, I guess) take over the series.
Or we can split it, so I'll move generic part myself, and you'll move
the last patch.

Thanks,
Yury
