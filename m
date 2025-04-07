Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6BB224253
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014856; cv=none; b=crZOadHqg+wC0Ed/1m3Cg/SxuNsCskuuyLpFS2Gps70mbwuB0J7INaYIpAYAYvLuelRDjl1WjLvCm+LmkJuexw/YiR6AtRKbWBDOsga8tQH9cGVmxD0PesQ0+//GVZFZgEm7PghGfDZFSdm8iIF72lUqgYdJpOuPYijtZGg52M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014856; c=relaxed/simple;
	bh=El7e2M7rFc/t6PAykKJndkxSK1Jx5JzrAuQLStmKrrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iYMgTArKh4u/B0tF38ewl2wyPQ/Q3myVf+/c80KCqFws/x+cBu5OwXgEweshf988RwNlJeVG3QBEHimaEZlUTQKeICJOK14Z6Skgt3BftmVcGoJtIxCj0BBxbo/xoog1+s9yGeZ3NYW+C3nE1S3AwWiUb7KKdJ8sZIBYfzakyMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8PATd2/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8PATd2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74906C4CEE9;
	Mon,  7 Apr 2025 08:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744014854;
	bh=El7e2M7rFc/t6PAykKJndkxSK1Jx5JzrAuQLStmKrrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E8PATd2/6V0G8rabK6kh7iog+6FdglCzojEAHUR0fNbDOA2vKhHWlO09Ej/HWHRte
	 uzGzp6AxiS1nAwltNCtOJAczI+kkPczm7gqtw+RxWnJtl4cgAS9EmpILrBTO9/02Pf
	 00O9VKNoXV5dF0e616nHO2WjsJTLR4vE+vqaWcuH8XANjkWvFDb/kdSi8rBFJT3rr3
	 UxvW3fUzpSIwk+vPX6A3ANI7Vw4/7PYlM5kZNEsRdfjYbXks/VL/O9xlBjX95lHiz3
	 1vyciGZB0OfKRsCTbAS+G0QxtRBDVsxw/B+4UPWhiN+hfN19GSsy4ijQjSfqTsfjf3
	 byvP2AGXCDQYQ==
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] drm/vc4: tests: Fix locking failures
Date: Mon,  7 Apr 2025 10:34:07 +0200
Message-ID: <174401483593.120970.3179575497463002882.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
References: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 03 Apr 2025 15:33:29 +0200, Maxime Ripard wrote:
> This series deals with (lack of) EDEADLK handling in vc4 PV muxing
> tests.
> 
> This was leading to failures with CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> enabled.
> 
> Maxime
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
