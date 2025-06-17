Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635BF293443
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750173842; cv=none; b=GG+t78zZKZYdEFpXBAzPzQIVLdv0m2uQpczILGO2epSZExOIGg6pPhBDbxBZ7fd88uN7rFUIK0BHh3cSc9QBb/rFGJOBpuo8LnN/6g8fVwwYOkPpTSL+iUdn4hq/cAVAYNjvtO0E4EyRXkzchQVc+ZGyK+qW4RwO4/oK5kVd0vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750173842; c=relaxed/simple;
	bh=t73wsGBwQ3kna8QJXYRTLcNV/4ySU7J72gDs71dpIbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1KzMRHJlW35r79fu+XBJDP2mZpiwDJukYyrtArSYOJBATz0GHxWFhIJul7lnM3ID8G9mthcQ0yUERaUpeXlSdVr/R/961HFiy521UNXUbzO0+OGo+ThOaGXYjNnKL1Y49O9tt4yfG2WF0hp1M9IzXtQ2WRZHDu1JJ2Eceo9Tgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=RgT260GC; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="RgT260GC"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c56a3def84so598920985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750173839; x=1750778639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1G30twoTSmDNYqYLbQb9BVxeBr+2W0lftNV3Vff6vfU=;
        b=RgT260GCd46CZ2jvifkpokDkVcV+CLmJsF7MCXONdFNrq5IAeDvQ9LGTU9cMNgKzwD
         7OIFnLoSW/6YLEbBHcbIbWx6kepk9ndSckMIFLaqhhd/dOXBfFAZ4RBIQ1SHUrpKInsq
         oVXQkzsSn0uwk0yDtnqubJeHHYTHhiabIJ6iI8OV1zW9slZF3LzlGc9i42VIHFphpph/
         7uOpAukSU9/G7CNBRO2D3X05Dh6yZw265lZwHGWyhok8T0LCxRV9UvAUMFOdVoNpnf8D
         k4EaCZBi6I4zek5vTyaWavDy5JGMa+6QIqZdZTrfqYFtuzUhP27KNDvdc+vhsMmgX5hE
         N60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750173839; x=1750778639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1G30twoTSmDNYqYLbQb9BVxeBr+2W0lftNV3Vff6vfU=;
        b=m64HnF6whxy1olbP+S6wSyoRRoHOx5DMt4ZMK2gkiOa+erQm+DZlZ87lr+0+THiFIB
         AbAUM1rLTqr0XQiPiUV6xAbl07vs1jqdUZEyWVTBG5eBVVoBXOMq3b/ryXHvLwFJdx8u
         txHrCVipcq0mipPLyrUB+ngu2/a0sDQSpv+ufqFtz8bSe6gDDOKTR/MGuD+NVH4/1zPe
         9Z93ic5HStvgitKuJj7a4uqPFr3NpUcx3WZJe+hPftrLAEtFZXCWKq8z/RpspeXJP8nb
         My6vCabeWi66trmZTgFDzD1hgUjx/7ItrG7uH7MMlWeFW8kAP0tGcolWVEoqrvIz16+p
         uGDw==
X-Forwarded-Encrypted: i=1; AJvYcCV+c8W0WG156Z16vcc4Lu9+hPpDacbITHf7+0vL3GkDbs4a10x3Cb1bw5QWp2bVi/EBd41N6urTRdfwLWw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0eIj9qN/ZxDVUhWh317smeOWzWjjbQbXjQFE2DMSFd8zncXca
	Vy+uVF+skv5MuKepzDKJhICtxfwn+3HNDXaIbIewA4FilU/2FA47UkufDPTWTbG1Nhk=
X-Gm-Gg: ASbGncvLNebY2kOpAQobnVh6gTQUDFS2wRzA3LPUjf7bI1zvQ9X1Ja++4kwMILc3ZY9
	gxRWGM21nevjT1Z3OIU5FFnFq+d7vuHk2Jfpp/wwV8nXITim7wigmIRuNBVaeKtBU5nVs8AyKQG
	KuLB6aOL7nAyEhipy/tL2zsF367H+Hlh1fOMRPgMD9PyVGeH5+KvDG36HkccjO9QWsL65IgfPNc
	lFRRrLJPIC6BkOulxIbRgDS3ZeSck5cK5iNt1uGqoc2kfWqe9yUUEuboW1XvQGeJYyjqztZF7Rl
	TIquMx2XdJ6vE3ch99wPYe7uW7SJbsd7+Yj/5ZCAtsL7yplXvwrtfabjuoZhH+bixA1EkWygpCH
	0PYFWzI/3Yglnxtr1WVyWkeAlp/BxLPeWGgUO0g==
X-Google-Smtp-Source: AGHT+IEoD6WfW4XcrXeA6atAW+1ffW+wg1paWr3c3lf/SNV5jhl70hbs0VEdmHRG0GMaJ0zxaZAYmg==
X-Received: by 2002:a05:6214:20ea:b0:6fa:8c15:75c1 with SMTP id 6a1803df08f44-6fb4762f389mr178635926d6.2.1750173838901;
        Tue, 17 Jun 2025 08:23:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb5f63431bsm7780936d6.43.2025.06.17.08.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:23:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRYAH-00000006W0E-3mNh;
	Tue, 17 Jun 2025 12:23:57 -0300
Date: Tue, 17 Jun 2025 12:23:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, jasonmiu@google.com,
	graf@amazon.com, changyuanl@google.com, rppt@kernel.org,
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net,
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com,
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org,
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev,
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com,
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org,
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
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
Message-ID: <20250617152357.GB1376515@ziepe.ca>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-6-pasha.tatashin@soleen.com>
 <mafs0sekfts2i.fsf@kernel.org>
 <CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
 <mafs0sek3n0x8.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs0sek3n0x8.fsf@kernel.org>

On Fri, Jun 13, 2025 at 04:58:27PM +0200, Pratyush Yadav wrote:
> On Sat, Jun 07 2025, Pasha Tatashin wrote:
> [...]
> >>
> >> This weirdness happens because luo_prepare() and luo_cancel() control
> >> the KHO state machine, but then also get controlled by it via the
> >> notifier callbacks. So the relationship between then is not clear.
> >> __luo_prepare() at least needs access to struct kho_serialization, so it
> >> needs to come from the callback. So I don't have a clear way to clean
> >> this all up off the top of my head.
> >
> > On production machine, without KHO_DEBUGFS, only LUO can control KHO
> > state, but if debugfs is enabled, KHO can be finalized manually, and
> > in this case LUO transitions to prepared state. In both cases, the
> > path is identical. The KHO debugfs path is only for
> > developers/debugging purposes.
> 
> What I meant is that even without KHO_DEBUGFS, LUO drives KHO, but then
> KHO calls into LUO from the notifier, which makes the control flow
> somewhat convoluted. If LUO is supposed to be the only thing that
> interacts directly with KHO, maybe we should get rid of the notifier and
> only let LUO drive things.

Yes, we should. I think we should consider the KHO notifiers and self
orchestration as obsoleted by LUO. That's why it was in debugfs
because we were not ready to commit to it.

Jason
