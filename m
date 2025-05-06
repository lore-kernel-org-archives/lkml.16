Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48D925C6EA
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551916; cv=none; b=nkd4P8ENaodX6JOAoI41Wo5gWR7/2gF8O85lCcsd+hINl8TkkuCJVvaMEiMXydu6hs24lUKMo2chPziWGTPCjRa/B97PqE4iXB28ie+ohOND/QUUv2MSFNtFRRoC4mDopLHWWUPkDZ0l83OgKRpMhtMUXUy0ze08qEUU+amatv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551916; c=relaxed/simple;
	bh=I1GUKXRG1sS0I2MpQXF5etwohdHLhGjvcYGHi1qYNI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GiQXEyxTOw50hGLFKFBmiRMSlUpPpcjFgFXDu8mlIpEQRyiWNzsVeEbHDBE3AMLYieeiJO6D5LS2vLZjnwX6iqW2ZGCuuYNGzOOZqDISphiI9AlzNXAWbFKIeGeVTJt8CkhKjgrIu6yXfDHK5eUphHM3UjelQxYEaCYzu01xpNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqhQvu+U; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqhQvu+U"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso26552705e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746551913; x=1747156713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1GUKXRG1sS0I2MpQXF5etwohdHLhGjvcYGHi1qYNI8=;
        b=DqhQvu+UGezCUruYOXoyirXfW+qncy/2EymgwcGDMbx3m6yTpVJJ6U2FabZUQH6WMl
         2jNDxD1d0WFAOaicLffizzZ9EsGUahd1lhOBY+E6KkcRymC8oxi/6gDaEOf+4WIlgA4P
         8hCi5ub+waNfbNYzjA1nO4wT/YcOURpzyCOmE/al5hJVW6BL5tihL9x7MCP8KiF9UBkV
         9BAKfSx6CpAuZ/APC5Nyry0C/9E9ApkSwb7kUrkguHGJKdNLb92qkWUHsVYzmI9lTpJ9
         ZvRls81Gtd472kkrEIqnRvFI+HISwstDA+93LzPzU37YbjJf9/ziWEmcGpvRqQF5BTkY
         HeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551913; x=1747156713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1GUKXRG1sS0I2MpQXF5etwohdHLhGjvcYGHi1qYNI8=;
        b=k9RCpL4rrGkQRWICOY98EZAUmuIaSRGZ12Mpg8mnz8SLCk7CWDlnkdzH0wg5sWbHZt
         JtyrEIBwD6uRsl2ENufluoRgFyaUTxOfecoxYIwRR+4kHQKmPpxETKyCXX5Y789cSemH
         JggQ+kZrCLjt+4iLA6eiDNHkfXxgjTzb9FWHb3LWLzCvU4EwT41Q0Lh59fPBEZxHlMcO
         p7UMS04H6XglgHPk1XPcg4jsbD65yzrNDOk7r7SFudg2iRawb9tVAnrW1/VvjcElacqh
         UIHjSYmcN/UoVd44zei+vtnzaD+gBkGy++8VjFrm6rq1kDB8lo7+0gC3u10bLm59mnNu
         lrnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqSycccKCUJ6Vkkx9zGlYb2JsJzZDWGucbYRtrctPWpbdgnMWRkVLWJWhZzM9UCIgMlRYclHp6ANzC5KY=@vger.kernel.org
X-Gm-Message-State: AOJu0YymjbFKyOTmPcxK18wKWItS/S+WUeacUk+OAamaB5crGFO+9LY4
	UzbPXZ3vUQ8VpTovUYK0hngV2X/YSKGG+7Aj8YnThqktTQPo5bNUpwcYwNNcwzcC2pOYUlsT7Jl
	pwAkAsI9T6vsJdzffF4/gE9WmMWs=
X-Gm-Gg: ASbGncvr8knWkoda4/OuqdIF5uMoE5bVtX96uvEo57gz0L8hjROfVz0+UU0TdIS16/R
	GC3WgB4MmSrtYLma1VL96H2THno5eO7k4wSlgdBU/AYRAlVhOlJbG750zXyvZ1iBzFKTSXWN3mZ
	yWzGPyHaNoe83pElgcZx7Gvom05Fxa779iC4Z1gA==
X-Google-Smtp-Source: AGHT+IHQuJXcdGhW4RBQiLlShD7u+LNmA51eDaVMk8p5aLAsflo1j9UpfI+KpsgbKf6Fl3aQPBcsLRNXOtKLMLQaDQ4=
X-Received: by 2002:a05:600c:5491:b0:43d:fa59:cc8f with SMTP id
 5b1f17b1804b1-441c4948909mr87467725e9.33.1746551912968; Tue, 06 May 2025
 10:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com> <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 6 May 2025 10:18:21 -0700
X-Gm-Features: ATxdqUE1cPmGJ_z0_R-l8WcbQujf2UehrtXW9TqppyzEM5gu5W70jKsdFwzwy6M
Message-ID: <CAADnVQJMNqeEGwcLDFw36KCY+wr_jQNtK2t4G5pLo=+wcDE0RQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/page_alloc: Ensure try_alloc_pages() plays well
 with unaccepted memory
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@linutronix.de>, David Hildenbrand <david@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, linux-mm <linux-mm@kvack.org>, linux-coco@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 4:25=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> try_alloc_pages() will not attempt to allocate memory if the system has
> *any* unaccepted memory. Memory is accepted as needed and can remain in
> the system indefinitely, causing the interface to always fail.
>
> Rather than immediately giving up, attempt to use already accepted
> memory on free lists.
>
> Pass 'alloc_flags' to cond_accept_memory() and do not accept new memory
> for ALLOC_TRYLOCK requests.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Fixes: 97769a53f117 ("mm, bpf: Introduce try_alloc_pages() for opportunis=
tic page allocation")

Thanks for working on this, but the fixes tag is overkill.
This limitation is not causing any issues in our setups.
Improving it is certainly better, of course.
Acked-by: Alexei Starovoitov <ast@kernel.org>
