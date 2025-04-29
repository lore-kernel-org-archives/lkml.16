Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367561F76A5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936809; cv=none; b=MkyiZCwzy7WJYJXGudgvb7RWyhsv25rfuDStNiExrpk8hxvYjAbaLfUy4xpE9fBROH5grERwu7mu9MfoiNXv8yg/RvjqGaMqk/ariyTHpZfk5lN02mCHzXHzK9i0bY2763QPeqXTUq5OOHkXvqy6aBv8kiy6EIKmL2aP2GRQo44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936809; c=relaxed/simple;
	bh=0sf2XvtvsbPwlXZeXsAd0Z2lGqKNVZNueCdndHslTJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQe+KeyHFnvG7srEkztwvRIyuIwwL+vlT9wcA3RpP/gyouO/bShkZRvEyt7yv2BMRWX//HwAK1TR9umHYFElgH4d66xsm8ptBXLV9Tf/6LezpSEzP1zsidmDNWGDGg54nM10p3mvAgnVtAjbLnFlHTffSF8yf5T2DjtnvVgUzDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Tx4irxhe; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Tx4irxhe"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so9613373a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745936805; x=1746541605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i11jWjMKjFB0m+5nZkJUQ48rdgc0E5ZWVkVF+qOAs9U=;
        b=Tx4irxhea53//mc0JHULm6QhEGUSjwWkBL/BQF30P2SmUn8BsEQq/o7VrBR01O8cEd
         ECZVXt/+aR/FrNRD/fYCzGaEV9zsLkk0MeMDkIJ1rQgIdCJFc2lkeke81dVcoiJ+RFa2
         SuuRVmgze+PH3Wcae31uAmAIiLqSMB/3tWRigk1UNd6uZ5xrmotLT29PDe9uSTK5RJJ4
         1XY8ei58xsXcDaMHyt2oBHvrUmkyHvRUBeVJjhHH9UpDxli+6TnpeAzx8wzTjzWWm7ku
         T2Ama52TSK+0Jh/KqFVJGL1dp85Sjrn975emiy1JN/ladNwGcJQpq0AbwEUbwsqXTm61
         On2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745936805; x=1746541605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i11jWjMKjFB0m+5nZkJUQ48rdgc0E5ZWVkVF+qOAs9U=;
        b=nBnWtXzf7V3owu6GZiBtk5EsrUxTaCn9OWR5Ijkkl6kM9dVxprFq+sEzxAl9JKqRGC
         9EwBtgoFTWOJe3axifwiaueP7Hry31IQvOQI0d8Xuf5YImqIP7GRf7WEsSyG1ptN5vCX
         dV+gQ4tjFsaNuW3znQYXeVte9t5OV/Epvg0/AmKDa+wAxkLaVSp/nNeeJYfjsaBnuW3l
         SXZTScPVJMustEZQ3wg3HfqOWTmLACFvcUUj9pLwiyNdupvIJ8CC2+APUTaRe8BdP3QX
         EbdT8pCSw65UFn27rshRbdXKmCCoc8zN5Nyq/+sS7oAcxzQS0bH/Hj3CvOyUkmkzkBJa
         +yYA==
X-Gm-Message-State: AOJu0Yw0ABX9TI21gGc2QDDVCxMrJv0LnvHFTxjBwicctNvekcKsfyP6
	qaLvRTfCEMrp/18MdnJd/k+hj6ZwBHoFYT61tB8io0ERCqrUwHpp48c+HrFDUYU=
X-Gm-Gg: ASbGncv7kyXlYX3ewYWQoIxEUriGULq1LoCpc2zkUuNDWwpiJO/zlwcQjbAFQ5erFue
	qYF6E7cVsS8cI9J8mn7k9OThQVNmIEDuV1JpAiNejFxdEbpDtfxn3uaV1TNa+m92J/HSsY8wIxx
	VAcL5JXHMioItJNNNunu+9xQr27cBT8FMmrRGZMQqYEyUP5C7sl8pBiB4LKtMkRJUbd9BMrCtMY
	yGnpY+eyUjh+U6mNIaaFobZ+p6XDVFP02nPO6AjYVQwotFNdoWupYFrTMtRYgR2wlEgnZUzsR4u
	LZJsoY1ZGkOUJyskPDt5n1+kAHXI2IXfdp20wLUQ
X-Google-Smtp-Source: AGHT+IGuMJucQb7G+wfByCfg8gyHRHAl6vF4qRmzkUAvzwcmFJfSVsMgvLMzQmuS4h1SA9OWg+05gA==
X-Received: by 2002:a05:6402:34cf:b0:5f4:c20d:499b with SMTP id 4fb4d7f45d1cf-5f7395f1d21mr11396671a12.13.1745936805483;
        Tue, 29 Apr 2025 07:26:45 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f70354514csm7447165a12.52.2025.04.29.07.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:26:45 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:26:43 +0200
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
Subject: Re: [PATCH v3 17/20] ratelimit: Use nolock_ret label to save a
 couple of lines of code
Message-ID: <aBDho6c7EYBWNZzU@pathway.suse.cz>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-17-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425002826.3431914-17-paulmck@kernel.org>

On Thu 2025-04-24 17:28:23, Paul E. McKenney wrote:
> Create a nolock_ret label in order to start consolidating the unlocked
> return paths that separately invoke ratelimit_state_inc_miss() or not.
> 
> Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
