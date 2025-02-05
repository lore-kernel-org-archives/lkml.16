Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA36E151987;
	Wed,  5 Feb 2025 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759287; cv=none; b=B+2PanJG6kV0X3UGzBtuk9bnHkpqWrmCNQIBP/H+NN7tXiARzT7UnbU3Y3Y8fZD456wT3LQFpuO6wvZB3qGvEzOEHNGF+Qbe4aYzushS83oqm+UZNN23ruvz6rGJ7eELwfTW33EMdCwb2dZwgmwCGpNpDWTpjDa5EcSkYY06Ilg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759287; c=relaxed/simple;
	bh=1Po9+REJ1tb5LWRezi2q/mNHQhS/dtpqdj45aFMP51I=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9nOokywTc061QXwxG2RJjawBbTzmpJsAnTGYJcX7NtSBh/Kt/U7vSbSulaKKfJjdGMRWDa/afd76DE/9zvtzJ6WnNXygvBV+uombWJqBvQox1QZuK+MBS6cHvQCbLbSilsYyiD8pZe47rPdLg1C3ouHSf+SJ3PeA1//tSSNOU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzfRz+Ov; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzfRz+Ov"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6edb82f85so959947385a.3;
        Wed, 05 Feb 2025 04:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759284; x=1739364084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zCPDM9ShX005wNG/ECrZxATKnuS3BwRmoFAnrdpehQ4=;
        b=AzfRz+OvOb+svhBJn8lJZuenJGf+2alypk4uIlOOhEj+e+iVlqtLhXUrbHScgSQAEh
         4g6lpq/DEHnDKeuSOwhYGxuVDVMGMmi2U+4Irr+5ElZzDF5iJQ0/yTKtjLnldMMxZPRN
         GosfD/5aI3gqw84/OGqr8UCc8QzogL+CKCivpyDaTIVxMPNYwdKAQLB7n5+zZ0mP6FoF
         reR8qo/hPQUt6CZO0uQDqu5d7NIaBFCK6VJxhrVMWneco3nFUNhkozFr23+n5U3a7NX+
         jVWkCG/orzkm6iM5nX7G6JHfje7Lzr0d/2N9AWVA+EEHYrPhfpf/BnjyhhkcYAxeWOLF
         +dRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759284; x=1739364084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCPDM9ShX005wNG/ECrZxATKnuS3BwRmoFAnrdpehQ4=;
        b=c6eedrGu56YJ/VRVtOlgQO2gFa75jQsEiIV0NLhV0DEHB10tr7clfOrvy465CHp4N5
         OSpZ3wXVhUSJ+RDhEifW9MXBK3d2QDcGjlcM3GhlFd1fPC2wVUInflpOKXdLIBjcAQ0G
         /LbHph/c8u33eudHwfRcAFO42oztoXho+1LgF7OMmgxXGJgZ65oSmhEq4hwozknEFQzK
         VjnrJcprT1uxOp5wsy0jq/ROd2AidL/QP1UfGsh5st8e7nmIDQDFi8CBpume2O8TELwN
         8s2V+zY/VMOPHWC/KJfIcsDooxSxAe3sedXm+UYmDq0JIz9jSp+mrLPCzYg6+nKN/hVX
         u66A==
X-Forwarded-Encrypted: i=1; AJvYcCUzEiXUBc7XGU494ps3DXRRur890I+mrh6ID+Tbme5rNIxuLO7QB+n3ckiZyobyJH+R9eqouu1+RQtKBw==@vger.kernel.org, AJvYcCVsNzRD+J8kOaMn4EP2dhSoEkTJ3/63NVUZKJmpHNNNOMmNc4A7tMCOkEdUYbouMvDKWyEJ1oDJ7GzpfKM6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4YFlZCUV7Neuoo3Gt7zy74UY1nQfkBHQvw9ib+Mt/uEnNvYR7
	14IbqDN3jrfxy0wBe9Ae/5Y6RnJ17FP6eNp0tCBKut4OPfBHkfbj
X-Gm-Gg: ASbGncuknkj6sC5Qrbu3HVCXhbTjLxLQIfrj3MCNvSUVYZIE8b6oy5id0YcPS8kNfAu
	U/Kyar0+UjVJ/ohaq4ko9Wp9Zp25gb3XPf74WXgpfdjZYmSKQGHZs9tFlJID+mGaese/uFORzVm
	B8fuQwm9q5Uk6PeTW/TtCIH5JDCq5+XOY4T4x7d/qicpPDmUokE+gQF1vP7ffzPchF+Bx0S4DHW
	ru/72U/UzeBKriM3q+jizNKj4Unm1biI7SiA2Wilf7ZJFx2gDGFUSak36FmYFB8IP0=
X-Google-Smtp-Source: AGHT+IETZ1/lxhOVPVfbGFXsPqTJENh81WZeiw40CoVC8WQQyk9S8fW0588/iG3jVk2LDuHOymbRFg==
X-Received: by 2002:a05:620a:63c9:b0:7be:3965:7452 with SMTP id af79cd13be357-7c039fbb9camr472006985a.32.1738759284368;
        Wed, 05 Feb 2025 04:41:24 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c00a90cc5asm744214185a.94.2025.02.05.04.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:41:24 -0800 (PST)
Date: Wed, 5 Feb 2025 20:39:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Arnd Bergmann <arnd@arndb.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: sg2042: add back module description/author tags
Message-ID: <4a3w46oi56bjps2ybhrzlcszccfojfesvsehgqn5s6fx6xo2hi@bf4dafabno27>
References: <20250205121419.373464-1-arnd@kernel.org>
 <kdvu3xjreyycftkbsomqzc3e3y6mkom5u25co5rqwqem4n7p47@xnmhg7mkxsmw>
 <Z6Na8fcitFSFGOVT@shikoro>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6Na8fcitFSFGOVT@shikoro>

On Wed, Feb 05, 2025 at 01:34:57PM +0100, Wolfram Sang wrote:
> On Wed, Feb 05, 2025 at 08:28:56PM +0800, Inochi Amaoto wrote:
> > On Wed, Feb 05, 2025 at 01:14:08PM +0100, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > > 
> > > A previous code reorganization inadvertently dropped the two tags,
> > > which leads to a "make W=1" warning:
> 
> :( Very sloppy, I am sorry!
> 
> > > WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/sg2042-mcu.o
> > > 
> > > Add these back.
> > > 
> > > Fixes: cd4db38c4368 ("hwmon: (sg2042) Use per-client debugfs entry")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Just wondering: Inochi Amaoto's email above is using gmail, below is
> using outlook. Is the old one still valid?
> 

Since the MS requires 2FA for email client, I uses gmail as an
alternative to send patches and reply. I may use outlook to send
in the furture if I find a way to login, or just update the
maintainance information if no way.

Regards,
Inochi.
