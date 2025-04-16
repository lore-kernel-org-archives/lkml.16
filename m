Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2648E22F384;
	Wed, 16 Apr 2025 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789921; cv=none; b=bJSm8MHRcDD9BSsh5K7hJ2Tor9JJkK/rswkIvVzVDn5Oqie1Zkm1GvUZPP0ST0aAHIF8XTKany5q3sj0j/brolggo3Gb7j9XWFdjK5rL3YzEqjYyoraJ76/WciGK6nPgen5WUr642B9V6AQkf91FUN1x3TKakGF56nu44aLiO6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789921; c=relaxed/simple;
	bh=uCBqYnlccBn6kD323ztcCaCIgVoqGL0ZzE2xDvyMfVY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9tPXLfd6kBaL3+c6BsRW69ilaZvAmyHolCbdMasueJbqyid0CNSqRFkIoH1Z0bnrMC1v5SssMb4l3lGwPcJVH/Ok8ogJ/j+N+CsfHqvGq6lIV9zcLPULGtDzT9LApfXQPEVh+TwlnnwhClR/xvSgf07Rb4yJ2FNC4A13eUuJ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pyV9XH/9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyV9XH/9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368E2C4CEE2;
	Wed, 16 Apr 2025 07:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744789920;
	bh=uCBqYnlccBn6kD323ztcCaCIgVoqGL0ZzE2xDvyMfVY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pyV9XH/929pKCUtu/jzo5+kbsxbegrQPoHoJP9O88jdotRKNaWxzO7m2X2oWUUnl5
	 YjXPNJsV1ZINr+le6HrIAFssc3MvMMmR6HUbk/dxFIZ34iS9fg7GE5N4XwHrBxypZy
	 OJ8KmruYUYNwuMAndxSlUIpk8zaahjjfcNQL/oTwW6VkvutoPHLLbaN6fKg4tOB+TH
	 zLVEySWQ+erOoB+bzKjf53wuI5BV0FCBpgft6oQ2LxV3BguSSPv7TTaQIi3mGCJf+V
	 R2l18Py0xg/PTe7jly2q2Z6dpfNpBgb+HjUxzxVTLQDLciecbf0QIoQZqpUaT1ZC2n
	 Jh6BPglevroqQ==
Date: Wed, 16 Apr 2025 15:51:41 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, David Airlie <airlied@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <20250416155141.7aa05bb8@sal.lan>
In-Reply-To: <Z_9asBKQ_9DGOH2g@smile.fi.intel.com>
References: <cover.1744786420.git.mchehab+huawei@kernel.org>
	<432f17b785d35122753d4b210874d78ee84e1bb5.1744786420.git.mchehab+huawei@kernel.org>
	<Z_9asBKQ_9DGOH2g@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 16 Apr 2025 10:22:24 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> escreveu:

> On Wed, Apr 16, 2025 at 02:57:38PM +0800, Mauro Carvalho Chehab wrote:
> > As reported by Andy, kernel-doc.py is creating a __pycache__
> > directory at build time.
> > 
> > Disable creation of __pycache__ for the libraries used by
> > kernel-doc.py, when excecuted via the build system or via
> > scripts/find-unused-docs.sh.  
> 
> Nope, still have it.
> 
> I used today's Linux Next with some local code patches (unrelated
> to any scripts or kernel doc or python).
> 
> To confirm, I even done again a clean build.
> 

There were one missing place.

Sent a v3. Please test.

Regards,
Mauro
