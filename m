Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDB21A23A4
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641452; cv=none; b=M4jr9Md+coLkfKwdlLwVdR3lwJ40+MfrrYBfWIo4dZJDdpZWYFcUqgQBVvExO6A8ok3O4KxcRx3YxZpbA0GLrG6/FR2mJxGQxOUQhXWYwF+yxXtrU5uqepc1RDbudCC5vaPZYNLTJyUGHjue3+sp/zdVObWarpxitgvjOxwKhr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641452; c=relaxed/simple;
	bh=6jEukY665h7yREmNG3UGbrdCx0ti2EK1VaLCfuhZWIg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ipm6ElAH47X3s3HJ+g0qky8G/tub2WRmUdj8lR8CGgomuQdCr5igTDJAzNIP5ER8Ca85DDSLqEb3EEGYgjknPbZL2yNgevC7TR9dY+XT3RfhMt1BebqUBKBPv5uLP7kR55zyBSFoNjCy6MQ7tBvrLFv1HDcuiwG1ifR/lkXj9g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEx1JWHI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEx1JWHI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DE5C4CEED;
	Mon, 19 May 2025 07:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747641450;
	bh=6jEukY665h7yREmNG3UGbrdCx0ti2EK1VaLCfuhZWIg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=XEx1JWHI5ZE2eGJOd8r6HyNbrcaSqE42hELy1SHfxn5S9fraG6npi00Sq4BPwqWtd
	 1VCsiSxMHKTOgsTZrLjw8DYHg1iNksKb56GroOpmmweGL7lkC6BLFkffeCDcjrGj/L
	 6dIMwLj/ESN7+7oxRzIK8nJQ0mD28lt1YmOTDvPliiK4xm3Ppn/qzXg146CplVe08+
	 anMQTt9LCqwzEKiT6GRxmD0y+GxEcp+AaaI3Yq+4pz/F4wRt9qf4JOt2ziBaSi+itD
	 Ks9hVTyjlwhS5YcxndJQ+oQwBwvQ+v4wV7w6OAGFTUjRfeiF3PP2XEg4oNaUl0A/BS
	 KOPRJ3w/7/pHQ==
Message-ID: <c3d962eb46e2f217f8b2efe5dd7fbefb@kernel.org>
Date: Mon, 19 May 2025 07:57:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 17/23] drm/tests: hdmi: Provide EDID supporting
 4K@30Hz with YUV420 only
In-Reply-To: <20250425-hdmi-conn-yuv-v4-17-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-17-5e55e2aaa3fa@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Fri, 25 Apr 2025 13:27:08 +0300, Cristian Ciocaltea wrote:
> Create a test EDID advertising the following capabilities:
> 
> Max resolution:
> - 1920x1080@60Hz with RGB, YUV444, YUV422
> - 3840x2160@30Hz with YUV420 only
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
