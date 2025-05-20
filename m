Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E8120E713;
	Tue, 20 May 2025 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725946; cv=none; b=XbRH3EMnxc5GlRPPIebTpXsBuSAW0yVDZr2MbutIRq+JjWv9/MWJpv8XC+X2ab4d6Kz3VObHiGWTsdQeOFJws4t3hNgFB4HJ5jpxqN4TMCC3GGprMo2AUw9bDcEaR5+sKb846EDsW5T0UJAud7bdsNqrLCfTOd2ONA9UCuMd1z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725946; c=relaxed/simple;
	bh=NlCKjviGMl2oBhxvVkteSqnfTAzM/aoRaX9IdSxH8w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCH45eKVM/HW5ayXJ8zcYlf8zwkmK29HK3eCl5CGFcgpqAr0MwFSiISmBHcqktPdzKzdKT2Dium7pA6CpllbPetzhc2y8IK1xnZapkPjv8BL469MBfYeW6mQmau9bU5ePCcxl4j22UnUZxEAWPzXRRhhbaJ1OKS9SAcPZhIzdNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKniJGz/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKniJGz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F42C4CEE9;
	Tue, 20 May 2025 07:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747725946;
	bh=NlCKjviGMl2oBhxvVkteSqnfTAzM/aoRaX9IdSxH8w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKniJGz/hK08ttGkeziC+iXV/gv+Nr8FZ84+A+57tHf86NL4KXYT3trwKskjDQ3SK
	 Cc+OVboLQGuYDYWarMBqUCK1M6ykaSuHQeJGFa5L6L9l9x6xC3OpL5Auq4rkwPSt5z
	 eeEQwsH8RsoXdW/dq9vewY8lrok6DXjTrUGbn2bV2BuJSsxZDsGaBdi5rpxIkWlsLf
	 85H87CZA/7/3Kl+5T/efiKAi2MHFzYyCAqLSNdaaAPlnwFJX2nng8qOmGJ9DbAYdd8
	 h4Dcgt3FTD8AYWs6Y/uKsECkzha6BXORaMd3m5r7QgRLOOof8D4NgiSh+NVN3vhBxZ
	 zxSVDHhDsHh9w==
Date: Tue, 20 May 2025 10:25:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com,
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com,
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
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Subject: Re: [RFC v2 00/16] Live Update Orchestrator
Message-ID: <aCwuZI7ek7XGaLN7@kernel.org>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515182322.117840-1-pasha.tatashin@soleen.com>

Hi Pasha,

On Thu, May 15, 2025 at 06:23:04PM +0000, Pasha Tatashin wrote:
> This v2 series introduces the LUO, a kernel subsystem designed to
> facilitate live kernel updates with minimal downtime,
> particularly in cloud delplyoments aiming to update without fully
> disrupting running virtual machines.
> 
> This series builds upon KHO framework [1] by adding programmatic
> control over KHO's lifecycle and leveraging KHO for persisting LUO's
> own metadata across the kexec boundary. The git branch for this series
> can be found at:
> https://github.com/googleprodkernel/linux-liveupdate/tree/luo/rfc-v2
> 
> What is Live Update?
> Live Update is a specialized reboot process where selected kernel
> resources (memory, file descriptors, and eventually devices) are kept
> operational or their state preserved across a kernel transition (e.g.,
> via kexec). For certain resources, DMA and interrupt activity might
> continue with minimal interruption during the kernel reboot.
> 
> LUO v2 Overview:
> LUO v2 provides a framework for coordinating live updates. It features:
> State Machine: Manages the live update process through states:
> NORMAL, PREPARED, FROZEN, UPDATED.
> 
> KHO Integration:
> 
> LUO programmatically drives KHO's finalization and abort sequences.
> KHO's debugfs interface is now optional configured via
> CONFIG_KEXEC_HANDOVER_DEBUG.
> 
> LUO preserves its own metadata via KHO's kho_add_subtree and
> kho_preserve_phys() mechanisms.

I've only had time to skip through the patches, one thing that came to mind
was that since LUO is quite tightly coupled with KHO maybe we'll put them
together in, say, kernel/liveupdate?

-- 
Sincerely yours,
Mike.
