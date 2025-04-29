Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181A92D320D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936726; cv=none; b=R4dj8Ocx96h2s9Pra189wewV7D4GqxT3HxTe50UtCqg5f637LczD/vNCf+kjS9j21GAeDx+L4baG8OZeiG/vDIeAsPq3kCXUUKqJU5x2SbR99/k5dPQXWgQShq+JyzWmBFlYactdJbdoxD1ee/Bu/VHPMd6ZkrS4o+B9cIHpCG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936726; c=relaxed/simple;
	bh=mUpSfE2Rfdt8A2E6mNSWKRYmnN8XOD8gnmdgTI66IFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gw/KcGOHAU2xXbk0JEL/cZYD06/1eyG81ohgiuxXXfMaB0y5R2jsc0+iOTMGFgu2NxW4XaMdKgqPswD2blEbSfwubMyAnX3Wyb750qyyepear5XBSXkKfR2D4NTQ5KgCMUwovfhH3gJwRFeKdghvBSfAAYgYpDgYog6nOE0wH1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Jbg0RkWi; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Jbg0RkWi"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acbb85ce788so1186058966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745936722; x=1746541522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=InMRIAu+YVbN2ROxaPK1QyyPvyBxh0KaL1h40gmjQIE=;
        b=Jbg0RkWiHm3k3DNOP1Od6FerFDX9roLRK5UuPzJQxDry6IyaYFE73Rx/vUJwHqTEsJ
         CKKGO6+N4XQNKksaXBiXIc+t+YmFCA8TwsVP6R9o7AqygYJ2MSLyVxOmq2aAaychvPNh
         Qo+ywd1+JbsWqLaqbfU/TiOKTp+Peh20v3IC+l52LFTw9uIAutEjx9qEo5ZHERZ5upDD
         hwvcKdvFz52n02TrWkX+Qh9WkxqhKopzOEimsK2jpcVDPs6qZgnT44eQMbkl1RmCdEfX
         EFfgqV5rigxVAzCrrCF+E9YmA+o2jPjjai15xQiA6oPRKv3LkAU9Ad4+sZmhEa9iXXq8
         vW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745936722; x=1746541522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InMRIAu+YVbN2ROxaPK1QyyPvyBxh0KaL1h40gmjQIE=;
        b=o9msXcF3pomCpFHf+tJWEiSfEDmtcrQMjhaMAMebTDoK5eTSyyBOCksJmJggZnvM4X
         a0JfxBnfBuwRHgRRwNpKEPf2O2E62EYnovqhb/b9JNgRBNmRHA+X/GsyfLW1jI2AE0PL
         QRtqJRaQS3XhTE1dYhcO1J4tJrZ4awhj66L3kxoH2gEK8hODEXgNrRW2SfEI6vQFTK0I
         0xa2g/dA9tRD3V5CNAtmDVEYauM8FRKGzbqbmGXVwZ+cKX+QLS53C7yPzfRWIS5WIfTV
         2s2I0bZR8FqdlXQjvLTvUkaJsg94Bj07wJMxXGaJ57CZhYquuMh80oaZHdrFO/M0UYW6
         wlEg==
X-Gm-Message-State: AOJu0YxO1hy7JUDc/YcNf+GCDHz+YHnN71184QahseHFVZrZ9gmNLwpj
	d/A5d+lfnIc+Twzi1s9zFiKyHv8pUHo9aBCscaelnntAJcl0fOi9BxuuqjK+ZfNZLeVRmKtO9x7
	K
X-Gm-Gg: ASbGncsNNPtKabQo2Zj8/Due1p0G7/7n8pgi51EwBalvgOMW5UgA3NVo68TYKTXuq7l
	z2mCGI4SfRScbKDUO+E4yBc4QU4kbOSvnAP2KWaeyYlAQsRDSWeYrd+tRhAx5/hHblQc5OFnq9S
	gfUQtvqViOJv9qHuMRwFlb5w2jLRyM/OHUXepGcKUNTXyOoJBFDyFNc16+9t2RWZQYTeV9oIanB
	nIzS7IREtXhywnxvLv5Q38QR8AoYf/H68uzijfSxVDrFoqIZBAvp4N0cPYMAdz1Lo79q29Bj2cZ
	Y8AOtJwlPpbB4g1gNgQuhxCHKMf6godvL7SSAnzgZQMT0RLhzfc=
X-Google-Smtp-Source: AGHT+IHrMDPANgorP5TPzRVdxzGSy94esjJoDUu+iiC16mR+If56ds0hWBl3ZAqA5T61YSusBEj8TA==
X-Received: by 2002:a17:907:868b:b0:ace:3a3d:7e35 with SMTP id a640c23a62f3a-acec87b9062mr306128966b.53.1745936722409;
        Tue, 29 Apr 2025 07:25:22 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41b5e7sm807013166b.13.2025.04.29.07.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:25:22 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:25:20 +0200
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
Subject: Re: [PATCH v3 16/20] ratelimit: Simplify common-case exit path
Message-ID: <aBDg-3SP_p-lCo7V@pathway.suse.cz>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-16-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425002826.3431914-16-paulmck@kernel.org>

On Thu 2025-04-24 17:28:22, Paul E. McKenney wrote:
> By making "ret" always be initialized, and moving the final call to
> ratelimit_state_inc_miss() out from under the lock, we save a goto and
> a couple lines of code.  This also saves a couple of lines of code from
> the unconditional enable/disable slowpath.
> 
> Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
