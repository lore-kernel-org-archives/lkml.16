Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816B618E1F;
	Wed,  4 Jun 2025 16:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749052996; cv=none; b=Rf11S15IEDm+1ufQIFT7z0DcLOD8lykyhCkEmmc7BeJcx4j/OP/tt/gSLXTHsFV3s7kppbgAM8XdUXCJPmw96hcvlc4OyFpa+a3F15WZnIZ2Yo1Z+3BhCBRAOus/jPyM+yjyIYpVhq9Q+8bABYGT72IXBKzePDDT8ZSl3U4i0j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749052996; c=relaxed/simple;
	bh=9aZRPwCzG+hd7s+OZOm2wdSI0vs5RWHmsaU+Uw6uWOM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S9IAs8fJt6Y0+9V6d2npkFypi+uaZiYpQOZ04F/Penki5WujTlX8dyeVe0T8m0vxph12WOBSzCiNY98jnUYhoXKq4EKYmPI77YOFDvLEN4IRYDxBbrXlhOzvayCMjWJhftX9EcOWbiyLX88OZmAroguqX7N8soKe1QZFWiKUBbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFRMqztp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFRMqztp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E11C4CEE4;
	Wed,  4 Jun 2025 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749052995;
	bh=9aZRPwCzG+hd7s+OZOm2wdSI0vs5RWHmsaU+Uw6uWOM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uFRMqztpQ+FUYtVBFJNoUYnCssGOmr5EK0+hMQr+XR5SFyd9buqw1hj6WtapTgX4K
	 W/lTxSrO8C3FOiq6rsRfvLnck9w+7hwuq+74VhqHqm/QTeGhwvozOobNxyDbaOBG5m
	 sE4ol0DTfioMdqVIwfnpVa1xWsfHbit7DJdC+Rw0LXTSQcs5DvPRotIjkDP5rMt8aY
	 Gbackjv5P9WvQzxa5sqRvFZ8f5gOhKTWwiLlNKogQOnsFggK/YyhPvvxK3UsB0u2r9
	 hKE0izLUmcDi1cWc2g+wEFlSM1TyEJVpxmOZBEHs8ovgLkJ4dZfbbRX1AmYFi8vGMp
	 WBN7rlPWM1ngQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org,  jasonmiu@google.com,  graf@amazon.com,
  changyuanl@google.com,  rppt@kernel.org,  dmatlack@google.com,
  rientjes@google.com,  corbet@lwn.net,  rdunlap@infradead.org,
  ilpo.jarvinen@linux.intel.com,  kanie@linux.alibaba.com,
  ojeda@kernel.org,  aliceryhl@google.com,  masahiroy@kernel.org,
  akpm@linux-foundation.org,  tj@kernel.org,  yoann.congal@smile.fr,
  mmaurer@google.com,  roman.gushchin@linux.dev,  chenridong@huawei.com,
  axboe@kernel.dk,  mark.rutland@arm.com,  jannh@google.com,
  vincent.guittot@linaro.org,  hannes@cmpxchg.org,
  dan.j.williams@intel.com,  david@redhat.com,  joel.granados@kernel.org,
  rostedt@goodmis.org,  anna.schumaker@oracle.com,  song@kernel.org,
  zhangguopeng@kylinos.cn,  linux@weissschuh.net,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-mm@kvack.org,  gregkh@linuxfoundation.org,  tglx@linutronix.de,
  mingo@redhat.com,  bp@alien8.de,  dave.hansen@linux.intel.com,
  x86@kernel.org,  hpa@zytor.com,  rafael@kernel.org,  dakr@kernel.org,
  bartosz.golaszewski@linaro.org,  cw00.choi@samsung.com,
  myungjoo.ham@samsung.com,  yesanishhere@gmail.com,
  Jonathan.Cameron@huawei.com,  quic_zijuhu@quicinc.com,
  aleksander.lobakin@intel.com,  ira.weiny@intel.com,
  andriy.shevchenko@linux.intel.com,  leon@kernel.org,  lukas@wunner.de,
  bhelgaas@google.com,  wagi@kernel.org,  djeffery@redhat.com,
  stuart.w.hayes@gmail.com
Subject: Re: [RFC v2 01/16] kho: make debugfs interface optional
In-Reply-To: <20250515182322.117840-2-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-2-pasha.tatashin@soleen.com>
Date: Wed, 04 Jun 2025 18:03:06 +0200
Message-ID: <mafs0msantryd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 15 2025, Pasha Tatashin wrote:

> Currently, KHO is controlled via debugfs interface, but once LUO is
> introduced, it can control KHO, and the debug interface becomes
> optional.
>
> Add a separate config CONFIG_KEXEC_HANDOVER_DEBUG that enables
> the debugfs interface, and allows to inspect the tree.
>
> Move all debufs related code to a new file to keep the .c files

Nit: s/debufs/debugfs/

I don't have any other feedback for this patch so a lot of bits wasted
for one typo fix ;-)

> clear of ifdefs.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[...]

-- 
Regards,
Pratyush Yadav
