Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3661F4CAF
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746440438; cv=none; b=p1KfvB5ECuvHsbDANGKcztXFhlSg9BSfGc6NQn7kL7UpEItNjSzc5VcFDz5bUA5euikh6zSMD/VuUdIn/HcwEpY6ELXZi98freaS/xvECXh8lFNvoBZNr53Dmx1of/u7mMrvI9rAqpFURDCcaN/DSYE/iMMRxZZTW7T1ARLigwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746440438; c=relaxed/simple;
	bh=u7SASzk9B1qb0Z6HBxttKJAZ2Si/MjyY9aEcEYnOxaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gs1s/wNgUALAXVcp5cU/CiKTj78B5rjEUvmDyDt85A93TjqbUG2ogbXA1G6GtyrU5zwDAX8SqrnDb7FeOqUo0fzn3k4nEHL9Fjobl/nzYSvNiAAZqkduFQcatFMMu3yWtVkrgW9bZ6FbFp5GQlvRr2SqpZK0z81DdTNaXLNXL/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LEpGTtO+; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LEpGTtO+"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso8408184a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 03:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746440433; x=1747045233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+uJJhUKYfceGuW/WMXQtjwzbnKP4fzH4IrlmqJCfI98=;
        b=LEpGTtO+UY8Axz06Ym+Ou7b/oDMe1R+tfh9TYliPJGhGJPZi5+Qwc0TExOVQUyfpkt
         6EvT+2qesVSu7QzWz0JE7v2rrb0FKkPHKhYMU7FE1rTs0hcaVHK2ZV0oLUJ3nvASjgp1
         doWM7+QKfRfQTgMhJ0gKePjoVK2kUb7oh1vqqeYFEjtkwYbfQSfXHMokIwkHz7cZLlYW
         H3/VDXMvxJaRCgbCBVBf2XZu5QNFrfu8l1TY/bn3NxWdzcTPPZEbtstp8/RDVbPmWEnB
         bsjKheIDEMlFrEOL8OXI7BfJ99AbHRjPlQSl/gWWtkNVs0b2Bu98RHkuMSCooeBYXDjr
         J1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746440433; x=1747045233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uJJhUKYfceGuW/WMXQtjwzbnKP4fzH4IrlmqJCfI98=;
        b=MjPdSra1I3pZiyaI5eQzKFRI1i4QFRpGyzdNI2lVtMyPWpWiXnFRIFJb+ecnCJ7yC/
         kCn8dzmDyQBIFpzkU7aoscyEzLGWc4OdFq5jdbNuWNfPBxjy32J7ZFkLXilGlYXkg0oW
         N4/d/f5qd1S2mrJ7musBdd3RQhi7Kg+MlI5wYSDdHY46Z7oGjKKfMqxFJoupzAyVH5nB
         eIHlp4RI705GAG5i8muqAA7nBz/8jgUFMO4Queq2w6CX7Tu38/piiNAWUq5lCXAFWhFK
         3610TmTlAZMVuTLsYd6nhaTPPIs6HYup4IRoSvHtNL8Z0sCAmpE5nful2TuB7Os+WQYP
         Qlyw==
X-Gm-Message-State: AOJu0YxsX+GDYjM/xXTuw4axIwy1baR8TxEoXf+s53sBB20fSSiDtnSt
	5A4vjMBzT4ONpHvznqoaOyYlN12BFPTkzTzyGFe6z4zYJsXGauEQWlFh6RmAlTGSSPs6GSUDxTA
	0
X-Gm-Gg: ASbGncuqqbsA09ene3dWcQRjUyjEDj+CPQrtQUmvHMbj0WQ+pAhPhKkZbph7xqTPFdo
	qtg2+80kQ4+wd7RwJg0+B3KL0FemT4n1j4T5LaAEqkkrY6WYI9WY9sSC7txfwmTV1nbDWqC69nW
	N6ue38cqpfwfJyD2+DTK/Z07O5sIwpkUEAPydu1jGV/aYcF8G6+/7rdmGJu/qhaxx7pr7+weV03
	BoLSU8hsLWYKOX7m9p17dRW/bNY47eGe0GyvzAb5pNWENMgoiK281lm6JGfqWcn8C6o97Y7RTwC
	I4pb4cNB2KdIzpGrd0cDvxofEc5CYePGfy64QeoF6ZzLiwJQ71E=
X-Google-Smtp-Source: AGHT+IEQIhePk2r+9V+A7DdcgLKv9lsNGIMxjzbahFi41BQEakcywtuloLNZGACO28vRNOYKsGLfbg==
X-Received: by 2002:a17:907:1c1d:b0:ace:cae6:c85c with SMTP id a640c23a62f3a-ad1a4a8d651mr577728566b.39.1746440433276;
        Mon, 05 May 2025 03:20:33 -0700 (PDT)
Received: from localhost.localdomain ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891ef1e0sm469477966b.77.2025.05.05.03.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 03:20:32 -0700 (PDT)
Date: Mon, 5 May 2025 12:20:31 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH v4 11/20] ratelimit: Force re-initialization when
 rate-limiting re-enabled
Message-ID: <aBiQ3XTQpE3wD4nE@localhost.localdomain>
References: <b0883f20-c337-40bb-b564-c535a162bf54@paulmck-laptop>
 <20250430010524.3614408-11-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430010524.3614408-11-paulmck@kernel.org>

On Tue 2025-04-29 18:05:15, Paul E. McKenney wrote:
> Currently, if rate limiting is disabled, ___ratelimit() does an immediate
> early return with no state changes.  This can result in false-positive
> drops when re-enabling rate limiting.  Therefore, mark the ratelimit_state
> structure "uninitialized" when rate limiting is disabled.
> 
> [ paulmck: Apply Petr Mladek feedback. ]
> 
> Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
> Cc: Mateusz Guzik <mjguzik@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: John Ogness <john.ogness@linutronix.de>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>

Looks goot to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
