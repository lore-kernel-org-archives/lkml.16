Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48E986324
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 16:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687819; cv=none; b=TH6S+TNyzjfwfpx738mNHt7MHJ9DNZ3vkuw92eehLD0oWSzET3nVRyXX9jEi0H7JfWKdaawRDLXHe9Itw8xlZYUcgT9ohO9zB2NCRrV8pAHmOIgpbuOS005Lraa4kYpmnPdDP0s7Sjkxwg62fbGmDBraMmh2jr2aORMYUM9z4WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687819; c=relaxed/simple;
	bh=sVVXxPDM3J5k20ScDkP4lDTsX5f6d+e7XClPzHlZnyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0eJUMpj5QSQ7h53HCLuAZuVgyLs45VHhi9UfbzmJjT5F/edWl8rkzPIjiu3MgZk4XPT/c85Oghxx+HszetbC/dRrqDqgf5gD12CfsHdJ1a1AN6oLHGpgd+OXUtHmcWdEy396MATSDrtfga5sxhj5+9zCLVAGnYAOsI09FxrxVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fJP35hjO; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fJP35hjO"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7157cf352so637211866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 08:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738687815; x=1739292615; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MXig0vFmla99DEaZtnnvMhOZoyypf4UMNoK7jl84rTU=;
        b=fJP35hjONH/zHydGw/WPQo/c34ItcMxn+LlzCWCnUBhrRgmMWUawExvdkVZWVseSP+
         bm/KqPUTBu30Q4XH3ydbSlv5WCZE3yxImQIzWmnJoehQVn25FK+EGcqe7mR59dxApYK2
         ISKCOr22BsUuXTz+NpEsT1yDAOlVXNw/YVwnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738687815; x=1739292615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXig0vFmla99DEaZtnnvMhOZoyypf4UMNoK7jl84rTU=;
        b=J8wHcTSTgy0pyrWgUHxNLFQrbyd1LI3Oqm8n2Dn0f+e8R39jmYf7DV2HdPVKcaxCRC
         i51t402lcdlrgvd6vQd1O8ac2DwKrwlBgZL5Mh9NmWORzxrOHLNyTz9brxEO1oaSzR2i
         p1lE3+57Z995i4krGF49ejZbT4BgLP4kUADwXvMSGmNt8pqEWETyZEw8+wv+h+jr6CFa
         pfHKXwi01r8zSoXCEVP1iYuuTaut5dYS0sR5iBwRBd0Z2nb4qLLISWXKhhgQZY4uPtk1
         2VEQ/Ps7FVs2I898VMO+uEDS8JjrjTcgG8F2w9C1+KxA1RBAfUgB3Mi/wobbS2rx1gXE
         lFaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ7nDPzLaFykJkNZ6oAXqOE3pSjsWFCX4XgWCdhVILZC4NN64AwaSINRXVlslZOvFaZZPMbEkOqS0K4Jk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzegwSXWrNP3zHuCeWfvDf6fys1xhxNWit0s7oZY2X+vaEVugkv
	eEYS4AkphFgf2rGM/iXJzkxvVdJcdN6ZUDhWOmdUu86sAeqpLg2KzoYzaD0hZ6RAPQSCuzCN7ZZ
	Gjdo=
X-Gm-Gg: ASbGncugJun0KPbHq+qgg86k8ZGKS4br043HtoLtVM51dhoymuwHCqq+bWNYrUKoNOp
	dN/FZBA3dC9nCteMfUI1EyM7MmMu9XnmGJUitHFcEle7w3osum9QxcKey0DfiQ6Ib7kG8ZgJ7f3
	QnNovx6smWyLUhNornivIw+I2+9UtnGnuvwWMSSeRFyUJv/TYMZfYnZgJmhmJZqosUy2UGEWI8n
	J+y49d3nv+xdBekLW0hX5UdPrAgv3FBrIJ9jgcQ9g+6lTg6d0srATfW+zF2DVYvjfaKDl7IRZPX
	lCEYr9yjNriqUUUfm8eybHnHK0WJ3m2+ax5aOzheLjiTixxuCxQU4KvCfOCE0OOwvg==
X-Google-Smtp-Source: AGHT+IGZ3J9/sQXOw0VCLcNtHD9hi8kCQbEwFMFV5HtKTARJnn6sHbbx5HAbN/MoKV7W3HtD5M9/Sw==
X-Received: by 2002:a17:907:c13:b0:ab6:726e:b14d with SMTP id a640c23a62f3a-ab74854568cmr518596966b.23.1738687814712;
        Tue, 04 Feb 2025 08:50:14 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47cf27csm954910366b.39.2025.02.04.08.50.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 08:50:14 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab6fb1851d4so830777466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 08:50:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+yEZPh/YYXn6EqsbiabrHsE8m2UyKVE7CYd5ryOk/FFS+nbaKqecBVupoFZXU4P6aNWyKWCkodbzOyZE=@vger.kernel.org
X-Received: by 2002:a17:907:97c8:b0:ab7:462d:77a5 with SMTP id
 a640c23a62f3a-ab7483f9eecmr421592366b.7.1738687813567; Tue, 04 Feb 2025
 08:50:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204132153.GA20921@redhat.com> <CAGudoHGptAB1C+vKpfoYo+S9tU2Ow2LWbQeyHKwBpzy9Xh_b=w@mail.gmail.com>
 <20250204-autohandel-gebastelt-0ca4424b697b@brauner>
In-Reply-To: <20250204-autohandel-gebastelt-0ca4424b697b@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Feb 2025 08:49:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=whetxWT58ACKO3aGPZQAb_CCpono6U_siynPuvDs2J6rg@mail.gmail.com>
X-Gm-Features: AWEUYZlKVSy7A-MdCfhCcqwKNd9dWUldBuyPBz5QZ5ZLAI0s9CnsJBESrgH_bs8
Message-ID: <CAHk-=whetxWT58ACKO3aGPZQAb_CCpono6U_siynPuvDs2J6rg@mail.gmail.com>
Subject: Re: [PATCH] pipe: don't update {a,c,m}time for anonymous pipes
To: Christian Brauner <brauner@kernel.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, Oleg Nesterov <oleg@redhat.com>, 
	David Howells <dhowells@redhat.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, 
	Oliver Sang <oliver.sang@intel.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	WangYuli <wangyuli@uniontech.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Feb 2025 at 08:34, Christian Brauner <brauner@kernel.org> wrote:
>
> So really that mnt_get_write_access() should be pointless for
> anonymous pipes. In other words, couldn't this also just be:

I bet you'll find that even just inode_update_times() isn't all that cheap.

Yes, the silly "get writability" thing is pointless for pipes, but the
"get current time" really isn't a no-op either. There's all the crazy
"coarse time vs fine time" crud, there's justv a *lot* of overhead.

That's not really noticeable on a "real" file where you never access
just one byte anyway, and where any write costs are elsewhere. But
pipes can be very cheap, so the silly overheads really show up.

                 Linus
