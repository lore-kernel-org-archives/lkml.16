Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612EB22576E;
	Fri, 20 Jun 2025 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402516; cv=none; b=sMTqghtgLAnolFaUpAM0ZBJQz7NglgqC1GzYl9LbtH1t0E0UV1Db/PNroDqYbl8i1MZIZtB8zttdM5WLXZP9w9ImXeR4Qx31UiMMg145JbAEO5I4JMwmhQJgMgqvezEjJvqDc8IFJuXB8C0A8k0VcsnEDB2XWMdAGvWXXYi03tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402516; c=relaxed/simple;
	bh=g2VnxAUXtleHi1yhq9BMIa6p7PhFKqx9nTY7Go9203c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rJZC9oFVUQ00+qjogh6i6BU1fvES/VFrQPAkXDAtb+YlToLk/CBtzgp/CwvZSRZHC4rx+5qz0L+E91dn2Oz9tq5WCOd9hBWNu0oO76Z1DR6DD48pcUo6kTGBNN3JILAHZlRnxCownm80jR5wB2DUwAiet2Pdb7MICP+TZL/0Pls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrJKdlqu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrJKdlqu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC58C4CEE3;
	Fri, 20 Jun 2025 06:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750402515;
	bh=g2VnxAUXtleHi1yhq9BMIa6p7PhFKqx9nTY7Go9203c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RrJKdlquRLA4snTBHcyEDxFB9bG5zyeyVyrRlNoMow9Ah9DGNdF+DUELHobk9m3EJ
	 /HfneiB1MzjufOZpCtM3Y0mgsxWPpq2urJNMlHMrgISIbhGbvYeiLw7qqSaSoCFfBq
	 AvJnhcA9IyJilpk6HngyQoVxpaJ+FfYS1IjvezQcUOmDZ4RFEEnt2cGS9iv8aaWO4y
	 KOjGcrZLvwqJNT8u5i5M+LW9eWGqnp4FadwEVr+E/ezjyF2a6JIalfbvw3f32nZ9Yv
	 gKD1RHAY4wurtotNaYHCdWW3ltzBR+AxAcjrEc/Bf9ghbBNdx/558SJ1s2wB85es8t
	 BV63s16pWsb4A==
Date: Fri, 20 Jun 2025 08:55:13 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: VladTop46 <mcsm2654@gmail.com>
cc: bentiss@kernel.org, linux-usb@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] USB HID initialization delay (~8s) for Semitek
 keyboard on kernel 6.15.*
In-Reply-To: <c5a8fdd3-fc35-4055-9d1e-7a5b4b50db91@gmail.com>
Message-ID: <snor7s95-5961-o5s7-440o-7q02r81ps057@xreary.bet>
References: <c5a8fdd3-fc35-4055-9d1e-7a5b4b50db91@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, VladTop46 wrote:

> Hi Jiri and Benjamin,
> 
> I'm reporting a regression in USB HID initialization timing for the Skyloong
> GK104 Pro keyboard (detected as "Semitek Gaming Keyboard", USB ID: 1ea7:0907),
> which I observed when upgrading from Linux kernel 6.14 to 6.15.
> 
> Summary:
> On kernel 6.15.2, the keyboard takes approximately 8 seconds longer to become
> initialized and usable compared to 6.12.33-lts. The USB device is discovered
> at the same time, but HID input registration is significantly delayed. After
> that, the device functions normally.

Hmm, there were absolutely no changes going to hid-semitek driver at all 
between these two versions, so it's probably either USB or Input related.

Are you by any chance able to do git bisection easily?

Thanks,

-- 
Jiri Kosina
SUSE Labs

