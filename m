Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836421F8676;
	Fri, 25 Apr 2025 17:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745601711; cv=none; b=c+1FJcIbRPOZLHqdAzVLASmdtzy53WoyfPU2vL5IlQjm6fE0Mf1SjsEtmmKxgGgRD+re5jwei2bRwUO7khK/SigR/evNNdXB01l6QVuWeXgSUbc4yij5mGnCStHAxM3A9pVzqGjfjZ0Vbs878kTWJhY2pD6mhiDr616r98jiG48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745601711; c=relaxed/simple;
	bh=Cku4Azk/Wps3gyHfsBQnYSugkesm+ln3JCpU+8NSloE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=METiqnjDFyyG0Mu6YpZgotfaF6kPFMtMjtx/dra32boJSo0dqnmzDwRM8HlPRtVksUFlxXwdSTPZIbvoC8U4zzGssql/Lsrlsp6quJfadChrtEKLT3hKU0dIyaOg2lIxECxzfJm7pI6hFMUvE27DRxAZkM+D2J12HkQZ/SnEKYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id E664F2C4C3DF;
	Fri, 25 Apr 2025 19:21:17 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 4D50713FF05; Fri, 25 Apr 2025 19:21:45 +0200 (CEST)
Date: Fri, 25 Apr 2025 19:21:45 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, changyuanl@google.com,
	graf@amazon.com, rppt@kernel.org, rientjes@google.com,
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
	andriy.shevchenko@linux.intel.com, leon@kernel.org,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com, jgowans@amazon.com,
	Pratyush Yadav <ptyadav@amazon.de>
Subject: Re: [RFC v1 1/3] luo: Live Update Orchestrator
Message-ID: <aAvEqZZeoCo8XF0G@wunner.de>
References: <20250320024011.2995837-1-pasha.tatashin@soleen.com>
 <20250320024011.2995837-2-pasha.tatashin@soleen.com>
 <20250320144338.GW9311@nvidia.com>
 <CA+CK2bBovJ68FPOqD5J-_xmzy_mm8gNhJW80EsWGLgq+NhuX5Q@mail.gmail.com>
 <20250320192601.GG206770@nvidia.com>
 <CA+CK2bDNoOe06bWAnAkgX-AF5zf5+KasNMeJOt3YcnHh=0893Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bDNoOe06bWAnAkgX-AF5zf5+KasNMeJOt3YcnHh=0893Q@mail.gmail.com>

On Thu, Mar 27, 2025 at 03:29:18PM -0400, Pasha Tatashin wrote:
> 3. Dependency Management: The viability of preserving a specific
> resource (file, device) will be checked when it initially requests
> participation.
> However, the actual dependencies will only be pulled and the final
> ordered list assembled during the prepare phase. This avoids the churn
> of repeatedly adding/removing dependencies as individual components
> register.
[...]
> The overall preservation sequence involve processing these handles in
> a specific order:
> 
> Preserved File Descriptors (e.g., memfd, kvmfd, iommufd, vfiofd)
> Preserved Devices (ordered appropriately, leaves-to-root)
                                            ^^^^^^^^^^^^^^

Device dependencies are no longer strictly hierarchical since the
introduction of device links.  However devices_kset->list already
has the correct order, so if you follow that you should be fine.
Just be careful not to assume it's always in hierarchical order.

Thanks,

Lukas
