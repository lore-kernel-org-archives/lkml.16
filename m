Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59DE182BC;
	Thu, 12 Jun 2025 00:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688289; cv=none; b=LK6ZMRdHSUOyWo8o73N5bftTj10ADV4Iuu24wR/CCbxneI/0e6+dXD4ppVKZgXtlfHOJJed1HdzP9XdVZ83WKCq21t/RZFXl7loYCOnTTw4C4+NLmps99b/fSY06yESSOCccAXbM8KgOZMzFQ0R3d4oHToSymk6GYyDmWVWwP5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688289; c=relaxed/simple;
	bh=ijocbW+3U9u4OfQLY/KnmpWW4kqwZpzaQZLNGMhL3Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRiEJgmWe07B7DNTAq8D7ZvMP1epQzcOQ3LZu3KDRn6wP89LsAHJ1kN40io40tM6KvQkFbBvQvdYSCGBpscy1/4W2RykhAT2yTVdsScAl9FTrbWvjTNMv39KVhNZT/e8OezQX+4aEZkkP7uITWrxR0gz14PuNzMMWhVva5pnSLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBW6FK/0; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBW6FK/0"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d094ef02e5so166063185a.1;
        Wed, 11 Jun 2025 17:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688287; x=1750293087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MDViv2kd0c1R0HWjXGJScGRZeTmMy+6a3qoFcXqkWrI=;
        b=YBW6FK/0+1F+a2XMWVud2XTbkJyXx6v1KKytQubiYQMmAHhUf2uOwH8fJzKVm58bnp
         DylUyQc6ZcWWmN0CKBymnIs8RKrGjJGeqiXMWTFn7lGA5sgx63aKW8UInoQx3Ts4mETQ
         phylvZqf955e8UC7feTCt74bFnk/LROyHWnrQPrlYuRkIhG8BEdkSF9UeevHqq2vGrMq
         P/Sn71Iq2p492XzaaRhIaXR14R1fzwqrUyxR6llPTcluZdbKakv1Tdq6PiuJ15NdlzsG
         vO3ueNSUm83cUYyIeKwkiQk6s17m3CSU/Px8PfKsMZMV/jScyGDV4/c65mkmwDQqmxrd
         qiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688287; x=1750293087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDViv2kd0c1R0HWjXGJScGRZeTmMy+6a3qoFcXqkWrI=;
        b=ain2t1FkcfJSwJ4iLtfXeNrS6CWPTrrmDMJ25Ji9DFtQnSD8GXoVJ5JRay78oq9hRJ
         L5vHnb0A39jaLXnCZipdZ9Cq0hrVQpman4tGyZWaAu0KVF2n3tAvjGTaPtokZgygmRHY
         ACL2/6arD1hyM9fRAe+t40HrfcOdoaAwGz+vVM1XIJhakCVBe3lre7XrTdzEppHsgk3p
         7Kx7t7NIcxABFo8aUacri2BSa8v2Wj7UwF90EkKwaSpVndLUfdAqmfCXmYdNmv8T0WOv
         adFWO+jNlx9IliMAvSTMC/nQH0zuq5ee0wDzorovu0N5a/gNoGwf1tffeg1IVriPXhPX
         Rx0A==
X-Forwarded-Encrypted: i=1; AJvYcCWV130bYZV5UW8s4E3nyvDhwTW/oInxTS0zNHSQ+Py2f44rP+Es8htmjVBCxjjEWzTTwJZf2NMZ2/Yg@vger.kernel.org, AJvYcCXDfJ3WLrPTK1AsKYrC0jPpSbSuPZLEVp0sc+lmReUwEm4LFYgBYn+nOqZLS8vrpCBGNpSgLjV73bSAjq9P@vger.kernel.org
X-Gm-Message-State: AOJu0YwR9GR9FSKhl5Ph8Xwn6ZzduSz4j3BCkrE6fq7BVfCbcyHf1Dk/
	TcosJ6rU0cjKglGjhEuaV3FF55Xi0rge7QC3cEjZhToOXdf1m+X+EZEV
X-Gm-Gg: ASbGncs27S9P9L06te2+47NFIuikI1gXlJn5XcxlhdiTUZfZEW8zWsQ/wCqq14iq4PG
	lxB8BhF0QGvdY8uyMUmxqEypxLQaePmKJ9V4sxDbM1HkjGgs6+wnUgNl5eN+oKsjeVnpwO6WaY5
	D94z+/1vXl6TMFe0fy1jGu6/7r1eNY4drXsR7PuEC7H7o74WUtBX9Dxi0mWufHSQ2DQiy3Ykjb8
	N0e2chhmmBdsQZMkR/kiig2F7+Ha0bGPztS0JE2yx3jnVnipwpuQvH0KvobzPGUWjmbRTveTMx4
	kxvWoVuQL+GIK4WmQCxcpV5szIL1zLh1KtG6R2KwpHkvC9ND
X-Google-Smtp-Source: AGHT+IF0my+KIilfiiQsa8f6QCZhL+Zpc88QOn7BlJUczLXOYa1+uUrywXOxrbxyAJNrFRe8whKRkA==
X-Received: by 2002:a05:620a:2711:b0:7d0:99f5:9bab with SMTP id af79cd13be357-7d3b2d16800mr226968485a.14.1749688286679;
        Wed, 11 Jun 2025 17:31:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb35c55ff4sm2510886d6.92.2025.06.11.17.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:31:26 -0700 (PDT)
Date: Thu, 12 Jun 2025 08:30:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: sophgo: add top syscon device for cv18xx
Message-ID: <t26cj5xhmkqro5wgf3vqycvgwqhtwv3x6mo25hde3zretbl5uu@xy5igj6vqejx>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611-doodle-storage-f1f23230adee@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-doodle-storage-f1f23230adee@spud>

On Wed, Jun 11, 2025 at 05:14:59PM +0100, Conor Dooley wrote:
> On Wed, Jun 11, 2025 at 04:24:48PM +0800, Inochi Amaoto wrote:
> > Add top syscon device bindings related DTS change for CV1800.
> > 
> > The patch required the following 3 patch series.
> > 1. https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.com
> > 2. https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.com
> > 3. https://lore.kernel.org/all/20250611081000.1187374-1-inochiama@gmail.com
> 
> What is RFC about this?

I use RFC to ignore the patch check, as the dependency are not merged.
This series itself require the binding from link 2 3, which provdes
binding of the USB2 phy and DMA multiplexer.

Regards,
Inochi
