Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EAD22F3B0
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800790; cv=none; b=bJKiOpvR8i5fQhveK6d2Rxsh0ksXzcW0qR5yyJp9NnHL/tdf5hahCVeCa8B/u/+Rp6IGS/yaoaGbwrh1rxN75y/5AXKVkJ0zY+SNbNfP85A+Sdr9omW7BmkHjQxoo9U1xzUCq7N9uJolVd8NUT6yBL0+RvGwiQ8roLSfVH/v9oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800790; c=relaxed/simple;
	bh=CzZplifB4yM9E8aHgw+DcCEuudnsO+hd8IgPL+dvMFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtIY56UygdBptKnRNw6OXOneE+dv6PHN/SMBT3jsKmXq+TEn+4hH39wBv7s4y7qsiipCXSBCa87Nx7QUywwkhhLCarqk2XI8cpLbuGlXiNjLhmNWDcGewvUJzMYG0DmP7Xo1XkUihblp+MGQhfkEcCMwg0an+lNS3wP/Vuhe4d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uZH/4zBx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uZH/4zBx"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-231ba6da557so638905ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747800787; x=1748405587; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0KXv+Ko44cUZ/uyfsrxurypyzmWgliBU+Xqfak3IgNs=;
        b=uZH/4zBxdBzJhhSg9z8ZH/U+QKIAAc1aXme2mVtl+ij8KPeVEfkJCTLyKpVKUtl6UK
         4vh3TEBzZofKvopxWD6TK7L8nQLWfXIVtJgiHYH6O1n6SpTusr8Q2UBtWQl/BqdloUaY
         FU+XgdZsjyy9bNFgZKJOsSCeK+3vyA90eQ4mMglZMZv4WJi6DXp1gTtXtBrRBdFjdO7A
         NP601Bf+duT5BCX3wMMjeEKHr+Ywstn4O3sXz+pv3doE+8zsZM14jNp09xlR8qLYp1XK
         E0Fugsw2zd0Wh+alGpMtGkEAUfaLAvZiq4KsPLoN5PYFG1JjOS/xKpKJZcy8N9xpOK7x
         fZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747800787; x=1748405587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0KXv+Ko44cUZ/uyfsrxurypyzmWgliBU+Xqfak3IgNs=;
        b=IS9qZYPD0LRKt3lAZvMwKO/2GusnRzQeH0us+tWsBo1vnpBxio8qKPUn7K/gmND2Qt
         hePzmKqz8WGR/fN9AslxU3K7pUgQSG4JvmdUuRmE6xTyrqehoKPb4HbZipuauN8hu2z2
         Y8ZUIxI+d4K1XykmzWXZRBj4qgxJMUu4EtZPD+E4oJ5yF9yH3XMQ2IDCnMUF1QVSAzpC
         f064/bJmXC5g/Zr5QhLrR0NADUMRrMDVImHdPMPPzi7U0fN7vqpC3uK6zxXJHLyDaNLy
         QAh2oKbh2spKKQO1wRRKA+8q8N+SO1R5S5Gx0GcWcafw9MNAtRmgwezNlSnjNYu3bAPJ
         KBZw==
X-Forwarded-Encrypted: i=1; AJvYcCUjfqO/uH+XcUa84S0x6RWuoX+2uWOJZeIvxKFM3p14KnJP0jvYnQ5a/w4EaOUSQbSog7homNG87hYGTqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJSt5tLugx3p6NxdYSJ1Pr8NA1X6bbk/D4H06+a3ATwkABa16J
	T6tktQC2rzM9mQ3758L1i1uaIpkn+iUA5GZ6thDQLu5B8nrzFeP8T9tR7LlQ0DjmMQ==
X-Gm-Gg: ASbGncvWM/Gom5g30vOTy+8I2d1KC3jYVMKGc/40Te+BCXa56UZvlGB4MU/54MO9RAO
	8l8R4mMIf7CC2zVwmPZzG9HjgJmHdv0YDUHYgXAUxrsf6E2Zu2EioC5t56FWBXOtnpdLKEnGOE6
	Kvp6XUAhEZAKxFBRK+o0W35HxAeaSjLSph0yKFlDw2B/TrabUSLMtbTInXdDNuL2mhcYlwUTTb9
	tcAX8YbVzUJziaJIlyz7g4jAt15IRBylVOGno/P58puGJ0FYCWbPNgT33OQdL4lSWTJep9Cfvcj
	bNgUrI3v+aSQ6FtSTf3jY02elDEv06zw5JBQSQ0OO4+HYPXt12lS9+P8qKrUg6tmJVkqt55QJsq
	IniXKBJv5UbPhwMAyk/4=
X-Google-Smtp-Source: AGHT+IEqOpF5edfEWArOiOQhVink5JvyoS5B9Tf3hRBGfOIcPhNGaN33iWUyuNmrSOLpeFbUNtsvcA==
X-Received: by 2002:a17:902:d54f:b0:231:d0ef:e8fb with SMTP id d9443c01a7336-231ffd0e311mr9558595ad.10.1747800787099;
        Tue, 20 May 2025 21:13:07 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a032esm8594503a12.65.2025.05.20.21.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 21:13:06 -0700 (PDT)
Date: Wed, 21 May 2025 04:13:01 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Li Li <dualli@chromium.org>, dualli@google.com, corbet@lwn.net,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, donald.hunter@gmail.com,
	gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	maco@android.com, joel@joelfernandes.org, brauner@kernel.org,
	surenb@google.com, omosnace@redhat.com, shuah@kernel.org,
	arnd@arndb.de, masahiroy@kernel.org, bagasdotme@gmail.com,
	horms@kernel.org, tweek@google.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, netdev@vger.kernel.org,
	selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
	hridya@google.com, smoreland@google.com, ynaffit@google.com,
	kernel-team@android.com
Subject: Re: [PATCH v17 1/3] lsm, selinux: Add setup_report permission to
 binder
Message-ID: <aC1SzdCwT90j1ajv@google.com>
References: <20250417002005.2306284-2-dualli@chromium.org>
 <eb68761b5a2d53702f4d6b80fe2a6457@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb68761b5a2d53702f4d6b80fe2a6457@paul-moore.com>

On Tue, May 20, 2025 at 05:15:59PM -0400, Paul Moore wrote:
> On Apr 16, 2025 Li Li <dualli@chromium.org> wrote:
> > 
> > Introduce a new permission "setup_report" to the "binder" class.
> > This persmission controls the ability to set up the binder generic
> > netlink driver to report certain binder transactions.
> > 
> > Signed-off-by: Thiébaud Weksteen <tweek@google.com>
> > Signed-off-by: Li Li <dualli@google.com>
> > ---
> >  include/linux/lsm_hook_defs.h       |  1 +
> >  include/linux/security.h            |  6 ++++++
> >  security/security.c                 | 13 +++++++++++++
> >  security/selinux/hooks.c            |  7 +++++++
> >  security/selinux/include/classmap.h |  3 ++-
> >  5 files changed, 29 insertions(+), 1 deletion(-)
> 
> When possible, it is helpful to include at least one caller in the patch
> which adds a new LSM hook as it helps put the hook in context.  With that
> in mind, I think it would be best to reorder this patchset so that patch
> 2/3 comes first and this patch comes second, with this patch including
> the change to binder_nl_report_setup_doit() which adds the call to the
> new LSM hook.

Ok, I can take care for this. I'll be taking over Li's patchset now, so
next version I'll reorder the series and add the caller. Thanks!

--
Carlos Llamas
