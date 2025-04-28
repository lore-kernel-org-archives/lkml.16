Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FE4279359
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745852277; cv=none; b=Z4RSw4JaQ/Jb4E269JKwJX/0Vpa1n2QpNfKxkLJ5i0+AuGzTIKZj2t88NbNqsAQGRwLBEHO/H6mK4u/NlbvNMkTxgfXe9UoJ7At3w312MHORQqi+v0RUQDAFYkrY822TXIfdJ4vUenFFoFHpXp2ytYEiRM1AoAS8nBNXLwj5Uu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745852277; c=relaxed/simple;
	bh=jl/85CEp+jYn5edTqQooRO3DoXXM/9+6NLc8K/sY13A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8sUZZIZUAV/DP9xwq8NwPa1s1XQvbXBB/mgxMIhACm6QmbmWu+sOJHjmQ/MbIVcdWPd6JUPIsZ6YRr7tMW8m9o9+3DWVsoTzoXyLn/V+FyBsFyY5NQNkuki14NhtpCcUToRBNMhJY53hfn2XJnDS8FgMKhHTQ5hWCWRDjf0A2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TSyOEyPO; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TSyOEyPO"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso7551516a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745852273; x=1746457073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Makd3DTqklPXUuIAq4gszh2iW6GJfZJUHbvqfYYQa+U=;
        b=TSyOEyPOc8Ttlgq8ncUhZi6odhfSETVpbzLT80UnLV7uVrSh7PJ4p6l2OpeeYtswqi
         2cGW4ihWQmLJ5t/CQttl4bFs5kd78BC/6DbELt6MjtSR1O21936KcKXr3I1+MvZTTldn
         tsNrHDMa+z8qzJ3o+raP+J/2vFdgtZpS14myy4zS7ZE4xlfCLK13eSez3717U9axb5a1
         U9KZRdMzvQsAP90Tn3OzY7zgvOpYJ2euHito0b/fMwmHUhB3/f2qXY5eoVykBVFH3nPx
         1Oz9ziMgOgSzr8uQpmk4sjLPz4LFf+eCi55B+W3DqizRYzWS/b7GkvrjHmiiys+1n/Nm
         SbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745852273; x=1746457073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Makd3DTqklPXUuIAq4gszh2iW6GJfZJUHbvqfYYQa+U=;
        b=JG1XvGO7KH6QnPz0k6/FuaBvVPxrjQ16DOwA63MoCGjF2vHYVLVuz2z5ilpQ76CfGF
         oxuldH1q5IDU+G0M04ICFPjaCYkj7orLKRXWCCqLtgPNKfg4iu4DxiTvSz0B3XzuYbUh
         9uLQo/XnF9m3u/rSMP6okd6itQ6PdufoRG7f/jEk5YihXEDYUFZjFhCDgLiS0lC723/j
         VkBMqMJh3b7D3vN+KUzftXueiL+aLs5R28TpMmyphJjwcksIFxSIukOFUoU/UMizSxBa
         yQL84PtIHZgA4j6MJ0Y4WPLWbPwwaSaQfDqYmDOUFLEfTcTjitYNe6rjMTFaIrV17zsn
         cDdQ==
X-Gm-Message-State: AOJu0YzmWjt6/Yb4VcIKXnsnsbDY5F9SUOMeCxN2QOtIBRE4pIqgno3l
	0cwh4u3+zHA45cMyBXdzWLZRLqvxCDM4tsCA1r+LshyDXebm7vG9i1DCl2UKLrY=
X-Gm-Gg: ASbGncuIXeomoc2Ggi84Qyn2rxhQEq1Nf41+5hmnIvdVO3hQUgRIN8NvlJrw6u0gNmN
	10zi42vSO9Oh909252DPcZ/12Olj0mJZZywY7sfZ0KyYsOwnVKVa5/dX9toFEW1mYJqZE6mBU2c
	Sa6beIrRRQapWiGkGeUlN8LvK0y1tPXZzCSA9PAHs8inICZcGr6LI/ABxX/PH3IwMCi42l/9Dar
	iq/4xNe+NRBZjn/IZY85zZsTQfAW6XZg6mr6C3HysNgQ34lZdrbpL69H6n+emXWhiwNJLtqMTsk
	wm4ObXIoYB5+J678WsftiFyAKolqkP5Qh7fsQIip6n0=
X-Google-Smtp-Source: AGHT+IH9fOvXRR1ynG3jhwLzW7DEMUQtzfgBZz/+50IlIniGFg6YSl8bO+ybnmhVC8MvXEoyK3eepg==
X-Received: by 2002:a05:6402:34d5:b0:5e0:8937:6ef2 with SMTP id 4fb4d7f45d1cf-5f72278aa18mr9640578a12.8.1745852273455;
        Mon, 28 Apr 2025 07:57:53 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035464e6sm5926699a12.64.2025.04.28.07.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:57:53 -0700 (PDT)
Date: Mon, 28 Apr 2025 16:57:51 +0200
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
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Bert Karwatzki <spasswolf@web.de>,
	"Aithal, Srikanth" <sraithal@amd.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 10/20] ratelimit: Allow zero ->burst to disable
 ratelimiting
Message-ID: <aA-Xb89sgQd5ZaGO@pathway.suse.cz>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-10-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425002826.3431914-10-paulmck@kernel.org>

On Thu 2025-04-24 17:28:16, Paul E. McKenney wrote:
> If ->interval is zero, then rate-limiting will be disabled.
> Alternatively, if interval is greater than zero and ->burst is zero,
> then rate-limiting will be applied unconditionally.
> 
> Therefore, make this classification be lockless.
> 
> Note that although negative ->interval and ->burst happen to be treated
> as if they were zero, this is an accident of the current implementation.
> The semantics of negative values for these fields is subject to change
> without notice.  Especially given that Bert Karwatzki determined that
> current calls to ___ratelimit() currently never have negative values
> for these fields.
>
> This commit replaces an earlier buggy versions.

If there was another revision then it would be nice to explicitly
describe also the reason why both zero ->interval and ->burst never
rate-limits. It is the state when the structure is zeroed. Some
existing code relied in this behavior.

If I get it correctly then this is the difference between this and
the previous version of this patch. And the previous version
caused regressions described by the Links...

> Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Reported-by: "Aithal, Srikanth" <sraithal@amd.com>
> Closes: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/all/257c3b91-e30f-48be-9788-d27a4445a416@sirena.org.uk/
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Tested-by: "Aithal, Srikanth" <sraithal@amd.com>

Otherwise, it looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
