Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7327022D4C8
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847416; cv=none; b=UJ0eeVlNM4IJ2R38WXSqyAWleDG+Y1LM+B+t2zFHR+/QxtSIPTIKeR8OrY7+TyIr8oCXGylPOezDYczcvKKzfq2EX9gDrOWtlzNMmgAzh6Iccc3DYuc4mpTx0vkctb0vJD/TWW3CTgYF9ssXd8PC12dUE6mjixqsEpJnlVYnwVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847416; c=relaxed/simple;
	bh=Zhl4zGvXDdpzXQ7GWRQAco7c9y4WnWXKQfhtR8UZKj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p0jvH9msnVdt6ZPH84hE9dVjy6Kr8P44ooFUX4RWFqmMINZ27XMwMTGf9NjT9McVct0l0/qrMMsUwZMzCUxR3MXOlvx6jSvIJAwjBgnr+66H/MG/1nJnBsn4bCgVVcpdE5D1vQM/uMebTKyJu69424xApjCHmTOHpXcm9tweBJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWZymsNy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWZymsNy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86635C4CEDD;
	Thu,  6 Feb 2025 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738847415;
	bh=Zhl4zGvXDdpzXQ7GWRQAco7c9y4WnWXKQfhtR8UZKj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FWZymsNyIvviUI84VwWutdAg2wlF31lzxAUnHilv7g9hVX3Ea3dG8Us+lqHJhGenZ
	 xBbzCL7+WuMcVNji42bcXPnKcwrW5E9D2UnNIPXZCSC5ypu9vlQA4DriVb9XDdSSxo
	 otndym1KbSaFxC2vyxHv8vTI7X++QlzB0+foaw/Wi4qR0trwzS3MIoBAcRMcp6itOE
	 g/VbHkyDmnt4Rs7utxkPb/96Fb4ySOALN8AeocolZjcIGkIO6jKGgCoXoen5jwrPtv
	 FhZew/13NodVBJiiW+xFma40/MeD+Xn3MPW1QJh6XZdMj2QHk4gz9IeJCdVCbrHYPw
	 /8Z9Ro74bovpQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] drm/tests: Fix locking issues (kind of)
Date: Thu,  6 Feb 2025 14:10:11 +0100
Message-ID: <173884739358.560732.9994156025100638634.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 29 Jan 2025 15:21:52 +0100, Maxime Ripard wrote:
> Here's another attempt at fixing the current locking issues with the
> HDMI kunit tests.
> 
> The initial issue was reported by Dave here:
> https://lore.kernel.org/all/CAPM=9tzJ4-ERDxvuwrCyUPY0=+P44orhp1kLWVGL7MCfpQjMEQ@mail.gmail.com/
> 
> After fixing it, there was still a lockdep warning for a circular
> dependency. This series is also fixing the issue.
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
