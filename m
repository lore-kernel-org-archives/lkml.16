Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0765384A30;
	Sat,  1 Feb 2025 12:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738411727; cv=none; b=EQDVKDfVIin3ra4GhRrIYIn3d0mJMYoLwz/l0yBRXbgK0pJBcIgkJt37nJkZtTj2Ht79tEabbcXn6IGlWmuo867V1nJR1mMZlnjfAnutoCK9gg+7w+Jw0hY3rHXHv7aPmQpjbV9fTBqmcqR1qzhCCsO+PmYWfkemDqXh6z6vHts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738411727; c=relaxed/simple;
	bh=K2TI2jChlFirHpPjPa4bMyuM7luLYyAPORy1s4bA3Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACqxK3XKB4f5UZPXpjyvcgz5kbG/MWbffOPDukJW+nbPdUm4d6qTo6qhSDulZEVdOCgc6+hjCZut523njHYR+GoeKk3kLtMMEf1A+apkB0e9QPmTF3Gqc2oWrIcSaGc//4FK9gQpM8tKS7nUvKZC1mlJcMKuqIk25KEh5ioK+QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSmtFYCv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSmtFYCv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD3BC4CED3;
	Sat,  1 Feb 2025 12:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738411726;
	bh=K2TI2jChlFirHpPjPa4bMyuM7luLYyAPORy1s4bA3Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSmtFYCvzk71QyMtkqn+tsY++LPQvDFQ+IdzaJpejd0lsi0xFfZihT4476GSSb1RV
	 mKIBw4IvbS3SJll0wAh0y9DqJAxM7L36SPiztyPaQOIOvghW7N46j6/mdhKhkAAXym
	 zGcBSb8FULg3Y0dLf++qJ8SRj1cE42Ef/F6nzUhNyDcLX6noFcKBAAowSsB+ruxMFE
	 0HWp5/ZXta7CWnF+U2V7EAbEqsYXFpO9Jhefo/mXlGPE0GzWa8Ui3J8mOJOVBmznZV
	 G3R2zJ+KC1HHYT1Va0qG+yDPg0eRxdg5R/S8sOBaUE7axmObjsxW270OM4ZZ+ELbh6
	 HEs07R/ZQZQYg==
Date: Sat, 1 Feb 2025 13:08:37 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Karol Herbst <kherbst@redhat.com>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
	pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
	jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
Message-ID: <Z54OxV15TSvK5I9J@cassiopeiae>
References: <20250131220432.17717-1-dakr@kernel.org>
 <CACO55ttSTGTEV7_OTAGXft0JKV7o2DzSYX89ZWKS_+mZRgjEKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACO55ttSTGTEV7_OTAGXft0JKV7o2DzSYX89ZWKS_+mZRgjEKg@mail.gmail.com>

On Sat, Feb 01, 2025 at 09:14:48AM +0100, Karol Herbst wrote:
> On Fri, Jan 31, 2025 at 11:04 PM Danilo Krummrich <dakr@kernel.org> wrote:
> > +impl pci::Driver for NovaCore {
> > +    type IdInfo = ();
> > +    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
> > +
> > +    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
> > +        dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
> > +
> > +        pdev.enable_device_mem()?;
> > +        pdev.set_master();
> > +
> > +        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core"))?;
> 
> I'm curious about the c_str! macro here. Since rust 1.78 one can do
> c"nova-core" to get a &CStr, is this not available in the r4l project
> yet or other reasons why this can't be used?

The kernel is still using kernel::str::CStr instead of core::ffi::CStr.

> Might make sense to clean
> it up kernel wide (outside this patch set) if it's guaranteed to be
> available.

Indeed, there's already an entry in the R4L issue tracker about this [1].
There's also a patch series [2] addressing it, but it seems that the series
didn't get an update for quite a while.

[1] https://github.com/Rust-for-Linux/linux/issues/1075
[2] https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vadorovsky@protonmail.com/
