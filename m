Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461A1E834B;
	Mon, 26 May 2025 08:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748249578; cv=none; b=HNms7BfDOnOWJVTN4vvKZqfho8hxASK9ilFUK51gwxwZmpsk/iwWENaU4JSpLG4DpRBlOPiYSs2B2FSCmEJdXfjkSUSTEIePlM9HEyPmbDWsa+2uM53lYAt6dOlpizlVJINqftoodf5ravZ1CJiMDtO4iMt8QbsboYXAAVt5Phc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748249578; c=relaxed/simple;
	bh=VfuSt7kKM5zbhq1CtSFslTThQxTeKYACMDUcF/4c7eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0YvF9eQmJaRbm8+aiP5wubJd2Ad4mnooCQozz3la5BeBabYJcsyIKZqEuCwcHsqN5Mx/pVS+g+WsjdL9zDE4HFScpVhNLqjhTJqnvshjJmEfE9StVqv4KGQUhDYZP7vl1XfIvbDm9AJ3RQc1RzX0lbHZCw60cNhOdB/1sVi1Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iF9pvvSu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iF9pvvSu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC087C4CEE7;
	Mon, 26 May 2025 08:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748249577;
	bh=VfuSt7kKM5zbhq1CtSFslTThQxTeKYACMDUcF/4c7eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iF9pvvSuPzCA2oalIkwuKSJQlORfPKX5Dg3FIVu1zdLk0eh8sB7gAvfRFPFEuZ5ZS
	 VYfu/QUO85MaiFokb3R02Mr/oQPqThly24t98vvm4vaAOuSyr4UfRPVYpuUx4ctewt
	 /m4WfLmw2gTRK3g3tL4KLALrLQzAw+WJ3W98uEErQVuELu2BWcF1DKlJqIlRp5eSFG
	 yn5fUUPBwnu5nR3UXbJ2x6nbyvc77P8Y6bVnzkwWkkqx0ZcSErS0ejDS67NNq/gE+d
	 aRZ9scgA5O3XNCGu49Fo1t0WQzlDw4u0EWqF6V4966NRifSKTSJu9DQu0s6PH9Vkbv
	 0yyWz5yWV9/Ow==
Date: Mon, 26 May 2025 11:52:36 +0300
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
Subject: Re: [RFC v2 13/16] luo: add selftests for subsystems un/registration
Message-ID: <aDQr1E31Gw-x-XTE@kernel.org>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-14-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515182322.117840-14-pasha.tatashin@soleen.com>

On Thu, May 15, 2025 at 06:23:17PM +0000, Pasha Tatashin wrote:
> Introduce a self-test mechanism for the LUO to allow verification of
> core subsystem management functionality. This is primarily intended
> for developers and system integrators validating the live update
> feature.
> 
> The tests are enabled via the new Kconfig option
> CONFIG_LIVEUPDATE_SELFTESTS (default 'n') and are triggered through
> a new ioctl command, LIVEUPDATE_IOCTL_SELFTESTS, added to the
> /dev/liveupdate device node.
> 
> This ioctl accepts commands defined in luo_selftests.h to:
> - LUO_CMD_SUBSYSTEM_REGISTER: Creates and registers a dummy LUO
>   subsystem using the liveupdate_register_subsystem() function. It
>   allocates a data page and copies initial data from userspace.
> - LUO_CMD_SUBSYSTEM_UNREGISTER: Unregisters the specified dummy
>   subsystem using the liveupdate_unregister_subsystem() function and
>   cleans up associated test resources.
> - LUO_CMD_SUBSYSTEM_GETDATA: Copies the data page associated with a
>   registered test subsystem back to userspace, allowing verification of
>   data potentially modified or preserved by test callbacks.
> This provides a way to test the fundamental registration and
> unregistration flows within the LUO framework from userspace without
> requiring a full live update sequence.

I don't think ioctl for selftest is a good idea.
Can't we test register/unregister and state machine transitions with kunit?

And have a separate test module that registers as a subsystem, preserves
it's state and then verifies the state after the reboot. This will require
running qemu and qemu usage in tools/testing is a mess right now, but
still.

-- 
Sincerely yours,
Mike.
