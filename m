Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3FA2EF66E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750260053; cv=none; b=QYrXX1MlpuxmLthQTpzuwLbwc1jYGOr4c1ZiICKqDOKD/LM8JqYQJ8OIM+s/1fc9xf5NBmdkbHUXBZR9PRlYxe2iNhluwryYWPEnRYbE0//iuB3IQ59uHCvvwlB+EYP9mUeiAR9VJHWniGzJZeJNyqQ+/LaDzsLPJ6/jHrv2Thg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750260053; c=relaxed/simple;
	bh=bu9BXidHNtjmnwyuSNdRj9LB7CpuIo8NlQ/Pqo7N8eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpXLKvaLm4HIGa3XxySL4ddROiJ15UI3worHn3AE11p9icz/L6+P81dnfz/sCeGUfIKYks9XroElixKZsp5zs290U3difGVZnHzx8qUDZ1ZVPKhvQpFv3IETDE6SpsGkpVKe1bdjdgUz/OOe2otDWluspmRB0W2nWLh9Tzk/1rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HQv6i/S4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HQv6i/S4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso4787330f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750260050; x=1750864850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R2mixnOIloQHoWX2vcLi6dJzCof8rZSm4l18a4KpDRg=;
        b=HQv6i/S48uZirMImdmMJ9teZNgbhku2y60AGeaBL6lGDXxXTzKie9GGpw5rYfYND3p
         ZdcHx5FIp6gIhKo/2ulaLqC7y90B3yomXxQL2XHiIvfHwPS16k0fVQyk4ioWpY66w1Al
         Bx1KmfOEM5N7uxg5D/NnoNUKjdQ+HzO6khNRzND2IrS8Fcp51wiZNvPbP7WMA1a1y1ii
         To97blaS0n7tkFf0ApM2XeWKD/MDlIGvlm3wq+XnlFj4lNTq3uFdK5r0S64LmWE12uPv
         7CSk2Ww9RHs0zzXnyxF5r9rXD+YCd5R5EOLJCHMEeHo3QqKBXJtPGgQCNhrMxn+nbtw2
         lZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750260050; x=1750864850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2mixnOIloQHoWX2vcLi6dJzCof8rZSm4l18a4KpDRg=;
        b=e99rleWPigYXs/UiMFn1trfPrF9bYcnWPBbso799jla2UyW9YPpjUaGdtZqM1iMxD9
         A8s9fkc4H21eI4nqZowCfxFY1dna+g2w4E+lNRwk8lLZtYWCpu2AZIMOThIhD6lonWzN
         Xh4IJIxd0+YfyZrsZNnx5ghzXmuBQM0DF8vMisMukQRnZLjzGAwIMJ6mB+wsIQ1Ic+pj
         2KwcLxQrGlrAvq1WcD8YW+vOQ+YG7ywIeziIHLR6QP4wpuccUG6Xwf/edq8JxRja0RSr
         3R9F4eprqlIbSv3HM+G6NFDQ6qabS5CRtYIykS2To8tF9TpPl073+4Dh1RkOJ2e6vTrG
         FmZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeh5XQvJIcMvqhUiimJpbCi0nrjYValkGBW0g5EgTbfnUSv1ntqDoAQ+vKPgCP7IuAG/4egQXjNMGpJIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2+tSUeQexm8RL6ISCD8vWWDNrr7uHBtOaRtlRIbdLTxiACTUf
	HbzkCwrGOn0BkBzXtLj0h15l0ySJkLJDL9jjrLfKOTPFV1Byz1rHVP+/oUoJSwefJWg=
X-Gm-Gg: ASbGncu5wOwnAI0VVe8SfTUzEbk4JHPU7OCnlaKqUH/FkHf6F5aHf1SfLRxSIS44kW7
	seu7ROtq8XiBrJPUPrUj1K29rfypA4PVE9pO5/tBq73rnzV+UBaGBa6g66KML1FQ1shBjpkKPVu
	r5mLKgofiNkI3qMTnPQvOCajM3qRDRcxxuWERMGztrsHxigC5I1QQ3AxBFSEmFOxmOuN7mBcz0/
	WOMNnU+Kc3RS8PQmxxcWIdxyFq359FbAE16gxOoa/ePsYx3t41wc/XeDZYYReWP6Z0CEZKXrFi3
	j0FCMz7fgcG5Jwn4PEQ7C50YCD872+wX/CE3R8hymYXZMOCMHRDvVqNgOajS6NSw
X-Google-Smtp-Source: AGHT+IH/o02+oo3I6UQDONKE+lMSxWW2bFWP8iy5NSan2E4s86/5Ooep9MGM3MBi06jxWJGtRw+Oqg==
X-Received: by 2002:a05:6000:4304:b0:3a5:1f2:68f3 with SMTP id ffacd0b85a97d-3a572e2e049mr16035090f8f.46.1750260049995;
        Wed, 18 Jun 2025 08:20:49 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900cec72sm11126479b3a.150.2025.06.18.08.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 08:20:49 -0700 (PDT)
Date: Wed, 18 Jun 2025 17:20:35 +0200
From: Petr Mladek <pmladek@suse.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	John Ogness <jogness@linutronix.de>,
	David Gow <davidgow@google.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3] printk: ringbuffer: Add KUnit test
Message-ID: <aFLZQ4jb928NhBly@pathway.suse.cz>
References: <20250612-printk-ringbuffer-test-v3-1-550c088ee368@linutronix.de>
 <aFGDhxefzuWCwOOV@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFGDhxefzuWCwOOV@pathway.suse.cz>

On Tue 2025-06-17 17:03:13, Petr Mladek wrote:
> On Thu 2025-06-12 08:29:07, Thomas Weiﬂschuh wrote:
> > The KUnit test validates the correct operation of the ringbuffer.
> > A separate dedicated ringbuffer is used so that the global printk
> > ringbuffer is not touched.
> > 
> > Co-developed-by: John Ogness <john.ogness@linutronix.de>
> > Signed-off-by: John Ogness <john.ogness@linutronix.de>
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> Looks good to me:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

JFYI, the patch has been comitted into printk/linux.git,
branch rework/ringbuffer-kunit-test.

I am going to get it into the mainline in the next merge window
for 6.17.

> PS: I have got an idea to count the number of failed prb_reserve()
>     calls. And it really failed from time to time.
> 
>     I played with it and came up with two more patches. I am going
>     to send them tomorrow. I think that we should solve it separately
>     to avoid too many respins. The current patch is very good as
>     it is now.

I did not have much time to play with it today. I still have to
think about it...
