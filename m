Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E14E20010C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892988; cv=none; b=i1b70G73uDFKAGmwkHnvyutESK80NCDHQDySu73MNAxImgHOarA6eavmAp/XhfVZzUGkHV/A6KzbaPAg8srWfMFfWeYegyQkq21269tArLc8fjy+pvH1WSbEr0Sjeij3ozherFc1X9Ky/ij+SS9KILg0oBD8A3aHCAP/MRiyh8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892988; c=relaxed/simple;
	bh=KPnqWiL2m2VKTHNqcysco6Gf4y9Poqeia0SBD9/VpIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLVXT+Ur4/mU3Gg1YZ/5NHmbvISpXdztnTKu9ebcRBxL+TvJrktejMFpt5b9R0gZ1NZP4onfnHt2sf3NikA5WRXeOmZlr2Qkqh8xzx7snOAhEeKCTeiZWtNB9j7Il18tZsbP3p/Se9Sxrj0m50QsaBjK26kgcU3HMJOQsIVaUtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=dAkx+Vc2; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="dAkx+Vc2"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6faf66905baso45874246d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 05:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1751892986; x=1752497786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qk23V2JOAJIYWEJqL9VccK1Z/r5nCIAurwcBtCjyYA0=;
        b=dAkx+Vc2N9ndeDo9RI1vrSG+hc7dpyum3vkZ5/7/MoZDXd4FoggeKV9V1M3SgQtMLO
         wP+lJDr9PZJMqpxu/ThL319GeJZcm0jcxxdWHz1lpPy0wggx9sRERg+Ff/I6EmuPxJ6Q
         SIu9j6jbIOti4gmqayZD0ekSZpbPRj0ectneS3yzfDrvK5TVbgw8JlNdX+Y8ZhhjMWmt
         TA5zH0u540CWmVCfgAr8u6bYG0xxS0we0/a3NCqdYInr0EcsRUdNFLVP759qaawRJcuN
         2DQxz5Zf7v4rmdwO4Jj/j/77Fz8sFBlbt7wM4cvWS3Bbb0lJD4NsTjeFDXKLo5vJYVSi
         A/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751892986; x=1752497786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qk23V2JOAJIYWEJqL9VccK1Z/r5nCIAurwcBtCjyYA0=;
        b=nBLouYuFzfsGan1P0QnHVaHWTXibn8ysjQoL5bHV5WOtpYTrZ6Dd7coKKKLxwYDO0t
         3wDx/rH7ir9t7k+YKkw6A3sYPJaNrapxtFSjyuavrQAo4lYwZSZ5Ax5ohGpsDiaYs0ao
         CWlGTWlHi5SOd5eQ4p9zHHmgQAxI+w69g0jy0C8VpANnnmlClNf5ELX7Vy7n0SeGnzWw
         mVKNDW5M6wdNJxwBlcp43R/hlJMtaIeDaRPttRMKPbps7RZRQDWmUGFMmy2LlgAdrXjb
         qyn45wD2qj6lWkrLu2z8OVnXSu/pq4xLjIUmxWYh9cSKzrDWVVSJKEttJV1fKrXKAUup
         JZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7BA/n6GV+F1t7qyiJpJqbVvtGcC6toQt0Z9elv8VwoH7IBrDHcS/0aZJXd2llcURzv3qT5hpXgQSSJlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2m0twovbph2ObSgv7nwQsn2NE5SYlHKSFMQuFr05yjbsEUb6M
	Z5Yaxawjkngkhfj4Y/DXOjQxO27dEjQDxL9OpA3j82vs0qHv4OKKk2l5hcny6SHskho=
X-Gm-Gg: ASbGncuW1GyKOV/+8DHcQ7P7jYuu/V3D9OgwWfHnlLG4mIDLD4S5OdsbQath5w6+OVO
	qHNmoN1/iJ5p+w0h4CGBb48ulKrRbV0Tdqi7C+EI4yqv8A0f3J6FJfYk+jASxby9H/fJRdxUQin
	sA7eMukqr2jvVUdnVGcSabgrtG7vFRbch8Uyuhb8XZvZMjUkeuxHHfatpZG0/7G1X46/0R35ANk
	RFl5XJG70n/lLiU13BMB0/A0hwDxUJiwOvuBCYdSiSjrfW/cV38Z2oABT/Wa0vGXZorDr4/w9Vu
	jk1hk3m/xytPIIrnhVnNf+e1itP/obV1xffTnLDo5xUFCe72O5Zi/nS/4YOveCoMo6diP0++CAD
	8tDH8ZTxUAKfJ8+yhDC+bxt287NHrbyjQY7Fvtw==
X-Google-Smtp-Source: AGHT+IHpUaaVcJ5DRQCtRGMCJ6nO666Q1wL9WL24RtajZdpjAA2S6AsDZqcLbeUtsD0vEBZQLx+sMA==
X-Received: by 2002:a05:6214:2b89:b0:702:d60b:c037 with SMTP id 6a1803df08f44-702d60bd72dmr108206296d6.29.1751892985849;
        Mon, 07 Jul 2025 05:56:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbdb4bd6sm598121385a.28.2025.07.07.05.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 05:56:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uYlOS-00000006LRj-2Hey;
	Mon, 07 Jul 2025 09:56:24 -0300
Date: Mon, 7 Jul 2025 09:56:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, jasonmiu@google.com,
	graf@amazon.com, changyuanl@google.com, rientjes@google.com,
	corbet@lwn.net, rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com,
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org,
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr,
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com,
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com,
	vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn,
	linux@weissschuh.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
Message-ID: <20250707125624.GO904431@ziepe.ca>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com>
 <20250624-akzeptabel-angreifbar-9095f4717ca4@brauner>
 <CA+CK2bBu4ex9O5kPcR7++DVg3RM8ZWg3BCpcc6CboJ=aG8mVmQ@mail.gmail.com>
 <20250625-akrobatisch-libellen-352997eb08ef@brauner>
 <CALzav=d+XgS1bUs-v7+ws5nYU9y=4uc1c8oVLHrJ16qLpnUi9Q@mail.gmail.com>
 <mafs0sejmse57.fsf@kernel.org>
 <aGqJIFs8GpvHn_Yy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGqJIFs8GpvHn_Yy@kernel.org>

On Sun, Jul 06, 2025 at 05:33:04PM +0300, Mike Rapoport wrote:

> One of the points in Christian's suggestion was that ioctl doesn't have to
> be bound to a misc device. Even if we don't use read()/write()/link() etc,
> we can have a filesystem that exposes, say, "control" file and that file
> has the same liveupdate_ioctl() in its fops as we have now in miscdev.

IMHO for this application there is nothing wrong with a misc
device. The intention is for a single userspace process to use this as
some kind of request broker and provide the required policy layer.

Creating a VFS and then running ioctl inside the VFS just seems like
over-engineering to me. We can't really avoid the ioctls.

This is not really managing files in the sense of string named objects
with bytestreams associated with them.

I've also heard people saying things like configs were a mistake, so
I'm not so sure about this. IIRC VFS brings a bunch of standard use
models and their associated races that the kernel is forced to deal
with, while the simple ioctl here has none of that complexity.

> The cost is indeed a bit of boilerplate code to create the filesystem, but
> it would be easier to extend for per-service and containers support.

I don't think it really improves that. You still have a single policy
agent in userspace that has to control this thing. 

On the other side you'd have a much more complex serialization job
because you have to capture an open ended filesystem instead of the
much simpler u64 key/value scheme the ioctl is using.

Jason
