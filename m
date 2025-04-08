Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A54263C65;
	Tue,  8 Apr 2025 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096684; cv=none; b=tpe8eDOQonx5DxgXYyD1ja/I6DLH92NYbIGnhMp0FPiuyntABt+TA2gQd3q0AtQzINU68DtqxFd8bAXC2gwGC2tPFa0o38juq+IgEAkFYJzTOIlMDq4RWpBk6PAgYCPGbjpI1fUYuTS79bxOqR/hKZQ58vjIJ6KZ7DC036ULe/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096684; c=relaxed/simple;
	bh=yLd6IcW6lJvsrk+LUvLGk1/gDeKYIQrK4q/4qyc8fXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0Z2b1bZbL4b7zGxzIn2yatvL0Z2DruRSASzKQIwbFNx5PMwnAqUQl2/PSbtXaGKMMsWlXOo2+LKfv5Wch2Ur4wbgtsPQcqMYw2CWOX+BB/tvEmMd9gMAFNi5Zgqh/RLNpsNNvGlxrV1t1+nrM7b82JOp0BYIGdsoGrEz6tQW2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDup7YAc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDup7YAc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08551C4CEE9;
	Tue,  8 Apr 2025 07:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744096683;
	bh=yLd6IcW6lJvsrk+LUvLGk1/gDeKYIQrK4q/4qyc8fXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDup7YAcj1ZG0KaL8ykqikS0/nd0X4dk22pG0/1XLReUm0Do+S7Si9likUiI1DG6Q
	 My8JGR6kxKa19eYbnjHJwJfZg/jQL5oCSaJ9nXLwtRcvnLyx9RYvQOVp2ESp8vtWjs
	 WUW2ZQq6bAvApeaekKsZinzWBlIIhXTYklfpUWIZo2UuNGqYrOywMBXJLn+RJBY2+I
	 4BSZnkTZZGLicMZqFl9cCYhssmunj6EUFSJlwFu19scF58UwVGN4lue6TupdSqzB+e
	 R5W7d/LwM3MR4rL5CloEZOVr2tr5Dh1NmdcoR81uxkfrLlUHtRKdJ7UHiaZ4v8cyqE
	 3bHRMeO8iDXJQ==
Date: Tue, 8 Apr 2025 09:17:58 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <superm1@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 2/2] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <Z_TNprjEqcivEkPd@gmail.com>
References: <20250407162525.1357673-1-superm1@kernel.org>
 <20250407162525.1357673-2-superm1@kernel.org>
 <Z_Qdn_WYAalNAHOi@gmail.com>
 <ebfaae8d-7186-454f-ba06-b86fea357d03@kernel.org>
 <20250407214624.GEZ_RHsCPSfyM4r56w@fat_crate.local>
 <Z_TLvoBDmCRRy12t@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_TLvoBDmCRRy12t@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Borislav Petkov <bp@alien8.de> wrote:
> 
> > On Mon, Apr 07, 2025 at 01:56:57PM -0500, Mario Limonciello wrote:
> > > Boris, your thoughts please?
> > 
> > Right, how hard would it be to decode those as much as possible without
> > having users go look somewhere first?
> > 
> > I mean, we can always go look somewhere for more info but for starters we
> > should display as much useful information as possible.
> 
> Yeah, and I also have an admittedly selfish reason to ask for this: I 
> have a Zen 15h system that is at times unreliable and will 
> spontaneously reboot, and I'd *love* to see whether this reboot-reason 
> register gives me any further insight as to the root cause. :-) 15h 
> appears to be the family when this feature was introduced?

Correction: it's a 17h system, and that also appears to be the version 
cutoff.

Thanks,

	Ingo
