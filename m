Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C7C2E659;
	Thu,  5 Jun 2025 16:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749140450; cv=none; b=ujTve/eWKYS3i1HmdHEhGT9eKCqbLRtSkR7llXgN7J/XgIZDOwuCQ3WPHLOzPGl21VKDPIfa8C8LiIytAAXjOm2wAzHkeks9wh9K/D6ZxSuukxf0oWgLwnz/cnIyU570wWMkDDLmbJKBC0MJFycC14NvzmtHk0k+Y1EruwbSFzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749140450; c=relaxed/simple;
	bh=dLjBR5olXRnbPGN7bgU92sDc99qN++d0vbehJ13dqYI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sf59i281/huVH133VhBg7n8FJ+c8YXc12QG0YFi/8dxqADNF/MD1O+nRrlacqofTf4doMXZpVFlHCHIr+JommpubXp6UeH6lZgx64zlBKBZ57oE/CqdpzKdNvDNFcdUPeJNBCSozyZId2BZBaewjSnOmAhHWeiN0lC+k5JDWsnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pslbklmL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pslbklmL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A14C4CEE7;
	Thu,  5 Jun 2025 16:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749140449;
	bh=dLjBR5olXRnbPGN7bgU92sDc99qN++d0vbehJ13dqYI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pslbklmLeEEzrp5m/EBAqtK5VnHNi2OqUp0iZgUOC8UOsZiR8EuzgKDnYAMpaFJTR
	 wDcoeMnH8umvUj5KEJFvuDoIs9h3b063j6z8ZMXEDHE279Vw7oeGYboLjSrDLFrVsG
	 MKVWBVpsey+D+gjfjfMn9K1CiwvYEGQeIXNwpbH3v8LPcSxVrynIaQv/6k3r6PgVLK
	 Sonj64B6xSYngP2BMG09DUj37gNkVZGk+ZnB7OWhmjxO6Bh+lzJW/pcaa381uECZgp
	 m8VFxFceN9FKR1CBQw0eNcxe1+8Uj89GAZfCemOpTwaIhY4YxNrUoG7ZXcxE7dsDJB
	 KXhDAVqIUOpaQ==
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
Subject: Re: [RFC v2 11/16] luo: luo_sysfs: add sysfs state monitoring
In-Reply-To: <20250515182322.117840-12-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-12-pasha.tatashin@soleen.com>
Date: Thu, 05 Jun 2025 18:20:40 +0200
Message-ID: <mafs0plfirwh3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 15 2025, Pasha Tatashin wrote:

> Introduce a sysfs interface for the Live Update Orchestrator
> under /sys/kernel/liveupdate/. This interface provides a way for
> userspace tools and scripts to monitor the current state of the LUO
> state machine.

I am not sure if adding and maintaining a new UAPI that does the same
thing is worth it. Can't we just have commandline utilities that can do
the ioctls and fetch the LUO state, and those can be called from tools
and scripts?

>
> The main feature is a read-only file, state, which displays the
> current LUO state as a string ("normal", "prepared", "frozen",
> "updated"). The interface uses sysfs_notify to allow userspace
> listeners (e.g., via poll) to be efficiently notified of state changes.
>
> ABI documentation for this new sysfs interface is added in
> Documentation/ABI/testing/sysfs-kernel-liveupdate.
>
> This read-only sysfs interface complements the main ioctl interface
> provided by /dev/liveupdate, which handles LUO control operations and
> resource management.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[...]

-- 
Regards,
Pratyush Yadav
