Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25DE2CCDB;
	Mon, 26 May 2025 09:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250060; cv=none; b=mO+2JRx3swHx76Ux0klrBczH8p2FhVWlWP/LPbe15EZVRu+DmYSZKXECIzAabAIpQu4X4HYOz+N2X/r5GhDEPTcnjBgsfaFKS828EazWtp3QRxPkk8biFvQDShtETstRVWr3tttIrK+K2s6AOxdoXtPQfaHrZbvv7HFiY0U3GYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250060; c=relaxed/simple;
	bh=FMOC3MlD32KGtEwoDcJvLVvK6mtDklfnV924/z2GeiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hyg9XC2kPOwwZXnuJL0UhEj0G33wA/YanpbP7rPQfc23SSJ04ALzE1M0RbpU6FbtUmShQi6xhI0SdS5zjpt1rnWLyjcmlCSOoZnBG4K/RjXXOO7KQEMaOb3QrJIsA7Zd6EPcBZrqxhdWP3eetiRqxlW8PUEpsIMXXM+RVCCoziI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxHo+d7j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxHo+d7j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105A0C4CEE7;
	Mon, 26 May 2025 09:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748250059;
	bh=FMOC3MlD32KGtEwoDcJvLVvK6mtDklfnV924/z2GeiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QxHo+d7j7TKQEAwHEl/KKQ72oaQvnybqqBMfE7gSN+c2UUoJdAOAiiVY6NI5bPP9Q
	 Hz6td3cd2ylOPj3wcZtFY4bKrwgh95oFfOrXFIaNsroHonykU7TVza9762IrSVPcCC
	 K4GW7fC2vgRfMKZs8TaiGtUy/tGQ5DZIwbqQdyhBbawNMVzdKkdY19BumePhGRRE8F
	 rBQxdu3eleP2Bfr9vREAIT86PpYJcjA+/zPxpgims/tfnifqiu5JlVRXY+JmQCAwdb
	 v7Yf7pTNSvLL4WeE67ibo/4dfhApTXtjq0wkBBnudfAfEqjv8VfUShYsZ9soxU313D
	 U75UVOnP2/gHw==
Date: Mon, 26 May 2025 12:00:38 +0300
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
Subject: Re: [RFC v2 15/16] docs: add luo documentation
Message-ID: <aDQttljTkMINRO7b@kernel.org>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-16-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515182322.117840-16-pasha.tatashin@soleen.com>

On Thu, May 15, 2025 at 06:23:19PM +0000, Pasha Tatashin wrote:
> Add the main documentation file for the Live Update Orchestrator
> subsystem at Documentation/admin-guide/liveupdate.rst.
> 
> The new file is included in the main
> Documentation/admin-guide/index.rst table of contents.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  Documentation/admin-guide/index.rst      |  1 +
>  Documentation/admin-guide/liveupdate.rst | 62 ++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
>  create mode 100644 Documentation/admin-guide/liveupdate.rst
> 
> diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
> index 259d79fbeb94..3f59ccf32760 100644
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@ -95,6 +95,7 @@ likely to be of interest on almost any system.
>     cgroup-v2
>     cgroup-v1/index
>     cpu-load
> +   liveupdate

I afraid it's not the right place for everything :)
LUO has admin-guide parts, userspace-api parts and subsystems-api parts at least.

>     mm/index
>     module-signing
>     namespaces/index

-- 
Sincerely yours,
Mike.
