Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2708E1DA5F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 01:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749346656; cv=none; b=eKezdWN79pI11FDv7MuuZ1ujuNfLWPgCYtEsbny1egxm00yOZPMFT7oSgVvF+agLu9378hWLYZHrUd0usMuuOp0ID4OTd6W03en121JR6x2KGpqrAN/+tBWUiBgWxRy4Cgc/pa6GPUwUnld2m5in4NkoDhDtY6HHpEX2osdAJEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749346656; c=relaxed/simple;
	bh=gLa4wgs5SImvG9PqO0QQOO0v3MU7f3m9/nhn8/KYkdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQ4RGoHVMKuxADgZr/hxPFFOcPADqu+Wh1JOqBftF4GTK6NGkMuegPDp25N8mYMXvO0K7KWu6R1RezielT+aJWDEpmYM3v4YTNdn78xLNb7QNkmZsFd/srmd1tzPy9nx2t7OQB1MPYqwhQrMKHVngFK5g7NsIee7CE785ZN89ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXxA2AoJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXxA2AoJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235e1d4cba0so25626105ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 18:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749346654; x=1749951454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sqvYpLGb/0ZKu/5EGoiw9KApDKUisG2VJYva5h7mD0=;
        b=YXxA2AoJm+2UOlOM5ZPC7/JSl9HL8A8BkduOv5A1zAlgZDtnsYTqEmPSvIb1i/+9aX
         5fhFSWkd0jxu5z+V7DgkpgMs/UWWZI9OL3rG3Jo8tOhPc/aX5XSFo+Gvamdc98BXmwZl
         iCx6tDIMdYyQz5wZRvf2DpxD0XZRUZdhH/oF8GK7b9LboxQqxTwVzUXOyLivn6TTZztW
         RlWdeBJX6s0LdXU7V+iL+xe4+vIfu1JW+CrupyM+dB7zf/z3h7vV34oqwSeI9JtaBLYY
         Bt1xawu4LQyw9DaGKkLqontKcWrgSr5wNYnSjz9/MMWvwVbXwJ3RKrfKx+U8jwrogavT
         +xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749346654; x=1749951454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sqvYpLGb/0ZKu/5EGoiw9KApDKUisG2VJYva5h7mD0=;
        b=K57TUAx0WfNSWKCfS4D7iX6bM7ddExSjLS2YCfB2hiROyaPShSyIlGdLzs31/4iLX5
         AnFHcKSCZ5PTOyrvAgoZWEP5N3rYRiyr0vfk8bfYB50zKmAwyDFaG9BfmRwJuAwVfI08
         dpfxyALfOF+P+szMJ4VOXR1j8NviN6NQxGfJfPfmYX0Bv5nlx+cXwTZjVpfoo3XDpxOb
         7ava07IThrgTzODI/f7uiwItdvWvABhRsnmHKfMK0PN7dd/4ZVfXMlQqne06Jckoij4M
         Wf/xxutrsFotd5KN+TbjjRUkIUPQOe+pXT8wyO0gt8y2gRsp5is8vL0GYr8ylQKqi7qv
         CszA==
X-Forwarded-Encrypted: i=1; AJvYcCXxXNxcS8xgoHLZQtLZrPF608J1i592Vy+jF4unRMkkYellS5tQ8soRStvFLbE+Vn6xjXMAyiNr6JRyATg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy997stO/6x/ZESzuqPftg5d7MnmKTnVNKaQ/Ic4UvfuaSojPTq
	AdeP0dWelnPSCTu4/O5h3bORZZF3zBJuStyhVKxY2EJkJzhMK7D4yrCI
X-Gm-Gg: ASbGncsxtJmcDJRaIQGhAozO4/fAh/WbYUI3fl0g0dLY2gNHwHjkHTkk0neZAz2I7JZ
	TYxNWq/wdwVW5FDdlkx4eVUvrcbibNzPbBg01FBgH8v33zO2QfJf/cRktFEx39GmJhUnZyNdjyI
	wWO1GgbliGEoQOf5mEIh1pD2lseWJ+XFiC9ezE9cpMlt4UwHHoM87PT3IjXIfT3TKEU8/eQyrC5
	mQdoFDjmBVxIOBifRH9BP4nxJTgSftLKxT3W+q7HOK41OuXNjRIajuMnHUBekjRccF7n6QD2pqx
	3ZPMul8g1dYYWm+jSU28k42ou0e21vRLWD2jqXGD1fA9mXtfkP7wPKy1/aPp8KNZkkcaQKjSpQ8
	=
X-Google-Smtp-Source: AGHT+IEjsGLQhbeTJWsjluro9ebaeJGp9VHRlZ28GkxruIzIQd9kN018WpRicQMyZGKUiyZa1MSGIA==
X-Received: by 2002:a17:902:d484:b0:235:eb71:a37b with SMTP id d9443c01a7336-23601dce87dmr124564185ad.46.1749346654313;
        Sat, 07 Jun 2025 18:37:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360340f945sm32484705ad.192.2025.06.07.18.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 18:37:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 7 Jun 2025 18:37:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karthik Poosa <karthik.poosa@intel.com>,
	Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
Message-ID: <9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <20250302140921.504304-2-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302140921.504304-2-alexander.usyskin@intel.com>

Hi,

On Sun, Mar 02, 2025 at 04:09:11PM +0200, Alexander Usyskin wrote:
> Create master device without partition when
> CONFIG_MTD_PARTITIONED_MASTER flag is unset.
> 
> This streamlines device tree and allows to anchor
> runtime power management on master device in all cases.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Several of my qemu boot tests fail to boot from mtd devices with this patch
in the mainline kernel. Reverting it fixes the problem. As far as I can
see this affects configurations with CONFIG_MTD_PARTITIONED_MASTER=y when
trying to boot from an mtd partition other than mtdblock0, with the
mtd partition data in devicetree (.../aspeed/openbmc-flash-layout.dtsi).
Is there a guidance describing the changed behavior, by any chance,
and how the boot command line now needs to look like when using one of
the flash partitions as root file system ?

Thanks,
Guenter
