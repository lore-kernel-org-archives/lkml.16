Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1713926AA8F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357785; cv=none; b=OHWTz1aH41skjH9rYtAblFrnuWgzNH7cxPYV+0RIVWCSwTDrBRobq5UyDQfCAXHihlpJKrhW+IUBBrexTmbyVS+Uz/GfwXX6ac1iORyXAbsKh3xG0LRI1wWP3I4JoLcdosRMt7W9wdbb55LIi2tBQB1s+JSkqdeHf48gRwnEQYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357785; c=relaxed/simple;
	bh=cqO9Gh6Ed5X3G7nZke8eswDnt3HZEzQjQs+HR2ju8nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYLTKhphVJa2ml5gyG/JNL+ggbLmxDC9RpE5taKk1CLfyKZmEde8/gYvO4kbTAs9JigAzdgOrOooQNzw2t7XClb6nysBYZMNh8DY8zQBjgJEkRVHgkTNW8bgkPUnZuLgIdiKS8DbuhUeQFNKQKbfjMYjwvRgL28Xj0HpujdIXm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IdpTj6EO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IdpTj6EO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso25009245e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751357781; x=1751962581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cqO9Gh6Ed5X3G7nZke8eswDnt3HZEzQjQs+HR2ju8nM=;
        b=IdpTj6EO7dKRaeIX2pPDPl1m7V63kT+mGhavqnE5OiJq5fSjwPkLm15QAVQ0m8ZnYQ
         2SCyrbTT3GLraVq9Qa+E1pf5Mvy92xqwx3nYbZTJYm2r9V3pAlqMoz+h+vBhGD4G4F2U
         RzTy9EcZJLZRjMEkCLlUQLoJ+5APlyCf+WiTZ27zNXqRx3DA1LNagxnZVvjJqngudft+
         zpnU/JxICN0k3Z4umEgUnGWpm319AfUn/JyJ0fquAgWxrwuAKeMnxbVfI07LWqR5pUn2
         Mh9U2NgAwQ2tpes7J4Fy6XL4dqcKS4tqxjtIS4L9tsfW6UyJONSwFHrUStYbWBgsvxLP
         Q1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751357781; x=1751962581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqO9Gh6Ed5X3G7nZke8eswDnt3HZEzQjQs+HR2ju8nM=;
        b=kggUrnJOK57NJko25iQ+AqbSwUmL61y+UypAkUkTAuCGgABxBen+T/jqerAOkxz1Lv
         VTBr7hSNGoHwFFWaJzsLF8eUHC37YlDbk5B8bOP8tLk5cavrZzpX6hpSAVIvrC+DEU1L
         ZHmjKER3VWZlHksDV+YNroUXxEE7FpPV522q4N6c03X2nBkCv5Ahtp1hDSMXxbQDQE/V
         yZFpVRA3fBRnpKDov3lALU/Ooo98JIDcHe6oEbc9Ovhz5zvczPxOLM18naFlL0sn4hUW
         oav+a3Z5/5qLefuPduwQdH6CrweeY+bBgjLgFero2/drBWpKEP5ALcjdptvCBuU2zTnG
         QXSg==
X-Forwarded-Encrypted: i=1; AJvYcCU+wYLMj4NowYWlz70aS0McrD1XTEegbeCt+HBZ+MCMNaoCSXJV8FLxGowuf+T1hYjU/hQTx524HB0zcFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDJFmagIo7bBiN0xESp0BLvX00CdlW6wQea6Yg2iqQjOHzvC23
	fQB8s+XX8S/XL3XKZ9UGORR7M6+Y9LtLr3zh1hJQYVawFS4NAbrejr6c+o3oEaB9AyAvQebYyXa
	J8MxX
X-Gm-Gg: ASbGncsdIc3/cryleqDfLARa0qidrspr5q2Z/vDsamC7M3eqZG9jt8rCG2N2C6GMDCP
	/KEdI78qtQaM07nbExmgz3W0pFOaoyrfew7tH5cGND2bxgYP3MF6DtS/idnRMPhSWWO9MkiilR6
	n+s1Kwx3/EMbruNJZ+PQ6XofRg3jcrhuM9vVnzAnLh+xLCAhFCvGu+7lnD53DFFX4iQaqUBeRP1
	Ng/wFjzi/tnOEHJp/gcroH/Vm4s+0/YsBLbdnwa21kdXLmSnj9XeP3zjxzfNpc3KIFtEdQZsXQK
	ZVfbEUU3A15vENxQGu/V7Iytnt5UBaECOHwA2oAvXC7H5dlpcH08FQ/QLsMKm07/GdV2bT1qQcs
	=
X-Google-Smtp-Source: AGHT+IF/N5/hf0d2fwMzP5+TqXu5cETtfyyVL5Bb81xxCyv/IqnZpdoVIHLqUV7ToAyh1pCxOCMXgA==
X-Received: by 2002:a05:600c:a087:b0:453:a88:d509 with SMTP id 5b1f17b1804b1-4538ee42c26mr214486335e9.10.1751357781237;
        Tue, 01 Jul 2025 01:16:21 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm159969645e9.30.2025.07.01.01.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:16:20 -0700 (PDT)
Date: Tue, 1 Jul 2025 10:16:18 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: Tejun Heo <tj@kernel.org>, Waiman Long <llong@redhat.com>, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, muchun.song@linux.dev
Subject: Re: [External] Re: [PATCH] cpuset: introduce non-blocking
 cpuset.mems setting option
Message-ID: <p5dssax5ac6ndongdhp4bvnmy3gz4pswdxoogbmy66bhk5zqzg@bfurmve7htwi>
References: <aC90-jGtD_tJiP5K@slm.duckdns.org>
 <CACSyD1P+wuSP2jhMsLHBAXDxGoBkWzK54S5BRzh63yby4g0OHw@mail.gmail.com>
 <aDCnnd46qjAvoxZq@slm.duckdns.org>
 <CACSyD1OWe-PkUjmcTtbYCbLi3TrxNQd==-zjo4S9X5Ry3Gwbzg@mail.gmail.com>
 <x7wdhodqgp2qcwnwutuuedhe6iuzj2dqzhazallamsyzdxsf7k@n2tcicd4ai3u>
 <CACSyD1My_UJxhDHNjvRmTyNKHcxjhQr0_SH=wXrOFd+dYa0h4A@mail.gmail.com>
 <pkzbpeu7w6jc6tzijldiqutv4maft2nyfjsbmobpjfr5kkn27j@e6bflvg7mewi>
 <CACSyD1MhCaAzycSUSQfirLaLp22mcabVr3jfaRbJqFRkX2VoFw@mail.gmail.com>
 <jtjtb7sn7kxl7rw7tfdo2sn73rlre4w3iuvbk5hrolyimq7ixx@mo4k6r663tx2>
 <CACSyD1PhM=U1bxqYeZXHojSRWWPB3Y7j30jLLykjRzLuQQzn2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ghzklq2pmnvye4ii"
Content-Disposition: inline
In-Reply-To: <CACSyD1PhM=U1bxqYeZXHojSRWWPB3Y7j30jLLykjRzLuQQzn2Q@mail.gmail.com>


--ghzklq2pmnvye4ii
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [External] Re: [PATCH] cpuset: introduce non-blocking
 cpuset.mems setting option
MIME-Version: 1.0

On Tue, Jun 24, 2025 at 04:11:01PM +0800, Zhongkun He <hezhongkun.hzk@bytedance.com> wrote:
> The cond_resched() is already there, please have a look in
> migrate_pages_batch().

Thanks, this is enlightening.

> The issue(contention ) lies in the fact that, during page migration, the PTE
> is replaced with a migration_entry(). If a task attempts to access such a page,
> it will be blocked in migration_entry_wait() until the migration completes.
> When a large number of hot pages are involved, this can cause significant
> service disruption due to prolonged blocking.

migration_entry_wait() waits only for a single page (folio?) to be
migrated. How can the number of pages affect the disruption? Or do you
mean that these individual waits add up and the service is generally
slowed down by that? If the migration was spread out over longer time,
the cummulative slowdown would be the same.

Thanks,
Michal

--ghzklq2pmnvye4ii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaGOZUAAKCRB+PQLnlNv4
CLqrAP93FjIrFWvD3uXoAQYwirGWulGtE68jLEXl0TFfgWAk0gD/cmzZCwsHU4Qh
EqqezNCBFMoHnUOeL0+hkfekbIN5wQg=
=dVmN
-----END PGP SIGNATURE-----

--ghzklq2pmnvye4ii--
