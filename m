Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0883215177;
	Wed,  5 Feb 2025 04:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738729346; cv=none; b=Q48x7f/555mPC4la/lavxG2vfTazgV8xYSzPNmEU3SFG3HRSrnT/OHYxNxrcBTtBqFSZFrcfd5m7X3npN3Rzg2e0JX4iuC1aDYGTMpBvcte88H0NMu760ONei7MR6UyDy5JK8v9WtQ06AjK5nyb4Ox6LmOGij2c0xN1z8LN335Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738729346; c=relaxed/simple;
	bh=NbJql2ZwXuvn0HZZPsoshgHS/pxPW6BBEjcZSJGyFTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHXsFZ+EjACZqASOFVzbt8HqCgMbm0f9R61oItKjiocmBCqWjxPK45yIvQoabKwwBhOmoQo61SqRrXA+K6vdxZX6K3e+A6CuFiNy31kj8jpzCn6UqR+YJmwvXDWyasWCcKmwqjM6haleO58YkVYRyglXLCC4KJ5aiiC3BqzdPks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fq7HmHqe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fq7HmHqe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543EDC4CED1;
	Wed,  5 Feb 2025 04:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738729346;
	bh=NbJql2ZwXuvn0HZZPsoshgHS/pxPW6BBEjcZSJGyFTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fq7HmHqeRSgoZRBo3F9Okar2vJh1TLs+2NFeu19EiOb+1XmPM04yADCsJa1JQ5QC3
	 KuLRgM1/Onkr6GYbhCFibJDjiG+pcehpMg71nZVJ0mkZLeb6t9Y6vudavJzoCkAjj9
	 LPVwv9GVmHnK7gI4CDURIheKYrbZ7/ujGXrD0hdN05g+sATm485rgVJ1z4rKc6aXN0
	 XZKCAyXhsV0Ykw8iekXKoZOs35KVj9uGiefOVRCnMbjs5sBjnjscTQUwm56T+7DBnL
	 YQbvgWOJ+NL9+NBh95AeTZXSwlqjcTmL3rBUR1s3sjhS0/7lE1nWAB4Q3TAURCjcNE
	 BT6+oiA3Dcy5Q==
Date: Wed, 5 Feb 2025 04:22:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Subject: Re: [PATCH 0/2] Add sysfs attributes to cros-ec-typec
Message-ID: <Z6LnfiPNQsh50OAv@google.com>
References: <20250203125947.2701106-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203125947.2701106-1-akuchynski@chromium.org>

On Mon, Feb 03, 2025 at 12:59:45PM +0000, Andrei Kuchynski wrote:
> This patch series adds sysfs attributes to expose the state of EC.
> These attributes provide user-space applications with a read-only view of
> the EC state, eliminating the need for ioct calls and facilitating
> diagnostics.
> 
> Tested on a ChromeOS Brya device with kernel 6.6. Verified that user-space
> applications can correctly read the new sysfs attributes.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/2] platform/chrome: cros_ec_sysfs: Expose PD mux status
      commit: e6a3215f78716d25ad60b002fd0585c04ffd5d01
[2/2] platform/chrome: cros_ec_sysfs: Expose AP_MODE_ENTRY feature state
      commit: 435a3d78b87a93c52a4f84e36ba4a0857554c958

Thanks!
