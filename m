Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C25B18A93F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937111; cv=none; b=tL9kVBYvEqIZPwgVCosSd9UPbMJGJqyFchYAXptjQye804BVYpPqUzAEQMNvdNDC6bYzr33e9Uc2emT1OD/MBUSyIW+je5DXfjTW0Nt2AhBeN41wUmjf5Xf7UHIiD27zwmpkbYxaH+H5J0Ac/sJH+oG5GOt0R4lRjILgAAK5F3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937111; c=relaxed/simple;
	bh=GjePFKB2d1SL0jkk71/qGpeIkutf08TbyfhCHSaqhNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYaWzsBfbixAcZfOumhYXy1r3QinXCTYYeKhNFwhfTzB6J5Wjxt6GrFLGShFUXDgnzWYN2T4MMc7rybY9PittLHi2fWdJdcGkkkQeLVGf6SuI13p6ntMcplq+qdZoRR899rBm5nExmFnqFZiVJ+0M3Ssp01iIb3xMfrS42kZZlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TqMT/Mkq; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TqMT/Mkq"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so326608a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745937107; x=1746541907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FVLuIB2lOtDkNgi7qMUsY4w36jbSzeBnpqcHl6UrPO0=;
        b=TqMT/MkqQTZuqvAx9yy/rkwd4Mn/p/z01Is1EKcmsvQNfLkPLHvsqbSKn9ExKqghXk
         zOoZc4z22gXDhtMc5orwxmo05A294Luy7Y4lYtHAYhdDKkK8EK3q0xwBJb5j7oLgqHP/
         u6Z7sWqET3PYPmGDO9Bp0L9agevuVL88gLsV015SAdWGlFmgxha4k9maDj1cowqEOh9o
         XZ7J6h4NswLeflS73V2LJanrRzVJ0b+ng6n99Ye9gJWffK7SNRuyUaypkihHfQkwW/ZY
         PegB26DRubaSO46dkykxbZGlIQeffdq3cKC0RtRTCU18eFqct1rJDYtfpWyGPJYS/FuF
         4WAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937107; x=1746541907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVLuIB2lOtDkNgi7qMUsY4w36jbSzeBnpqcHl6UrPO0=;
        b=q6/bs8czTlCnvoomOQo/T246iQ0MTuZZA7I9hupl5Cgmmd5WjiHz+KVg0CSUlXx1hy
         RLgv19lJ9vbWS78c2LgIHVAMYLI114kh6sMMTpVPynpRmE/hjrJQo989zbw3OTPYnKuJ
         2nKBVIhrnshcGZTzVQN/UqkOnQTmNhsFnCo2TII4mi/JOhvwAiq+ABRnfjpdLSgykBWK
         7LbnwxGC161gng3PPr7uQq+Zngba3cS8r5zkGQ4cAP7JEVEphMpNxkUljClUIZLoehM5
         XVLugmIkcYzQEmOk8MDgj5yWAf2YR8A63HZwCzNP4bZnz4pJ/blfzLXSDcGLPSdvoac9
         5BDA==
X-Gm-Message-State: AOJu0YykPree778b50UTF/7MuJexaqES7P9ob8Ro9xSphI0C52sRkpAc
	6nZ9AVwBtGaedcRPLqacdtUZ7tQTA6yhX9LntLuY+TWRrid8fQ4RX96n8Lq1LTc=
X-Gm-Gg: ASbGncudHzCT/q9PK0dDlpL6olPm1WzC5HBk0pxMx+2c/bvJE/SDdR4V3BAwCcozXTt
	90Gl5UCFa2iC6Bt8wzUMWbicysWym3ShhUDbfKDNReeEAaInnC9S/PExUsnJHa/Y5oER0DhAi0e
	y3yAse8I5gxY6gzmsT3lHYoJK6IZMULDdGPecaTGUpu5huiAVMgA3fOyIocotoW2aLnprDj8d4Q
	cgXB6MNqqTwubiMTMZzeWUaZhq0gOGQ3DTJ8wGfz4qK1mOtYqsux1wcxLSZnPsZ3MSUEp80CK7G
	MA0pMK7Nq4rUe9DLvik6iQ3DWicWZQcy1Z7BuhWV
X-Google-Smtp-Source: AGHT+IGrg0RU/sZM0brIEoAXFybZg4vKsrBCT+3DlRai6gjoHOfmWmJuHdAEgbYqaarkWnKCGueLEA==
X-Received: by 2002:a05:6402:370c:b0:5f3:fad4:fa75 with SMTP id 4fb4d7f45d1cf-5f83889fcfbmr3609914a12.32.1745937107540;
        Tue, 29 Apr 2025 07:31:47 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035451b3sm7577360a12.50.2025.04.29.07.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:31:47 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:31:45 +0200
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
Subject: Re: [PATCH v3 18/20] ratelimit: Use nolock_ret label to collapse
 lock-failure code
Message-ID: <aBDi0TD47UnByeN2@pathway.suse.cz>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-18-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425002826.3431914-18-paulmck@kernel.org>

On Thu 2025-04-24 17:28:24, Paul E. McKenney wrote:
> Now that we have a nolock_ret label that handles ->missed correctly
> based on the value of ret, we can eliminate a local variable and collapse
> several "if" statements on the lock-acquisition-failure code path.
> 
> Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
