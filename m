Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D1A1C5D44
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171348; cv=none; b=pd/6crC9dPvmEdnG8lPzWGSVsXfa3pzhBUgHAPYF7zq97oqU4+SvPHtMoc0tff/zJLBeB894+5uMPA4wQUPRlt33GNTXvhPSzPMVkZsjgW12w6nLNqlPeCzZQPHa+XJpPJzyV7PxbCUPlTpSgi/SnqioulUnRD4pAMWTFHBfCd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171348; c=relaxed/simple;
	bh=pXfI8v0neVovdgH7g2pz1hEWDgarsRQ6GMXto38uxUA=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=kpgo4pmRSCJlah/l5onc1eScDIlyWZA51WEApvDDqCe0EqNWRYph7x7qxdGWSGrOBtLybX3eoI0Xo17IQiXPUK1Fspxwrpdga8dkbHpJls7SIeFutsspQ3a0DkL5joFN6lZzltATEa5IMYzcmBIuY2WnitdvzM+1LWHaNabOkcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSPG60e+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSPG60e+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDD4C4CEE4;
	Fri, 28 Mar 2025 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743171347;
	bh=pXfI8v0neVovdgH7g2pz1hEWDgarsRQ6GMXto38uxUA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=OSPG60e+ka7zEkpeCaQ+X3HP/LmC89ffbxDX4y2TuXz3Gr1FuUa2gNJeXXBGDtD92
	 Khb14GsTM5RQrRrcLi8ALgBfUc/CegU3x5ybHMoONCGqHIyWtFFMom0Bb2ApzllXAE
	 0RRUfPApQxGc0AnCZ+kUJ/LUuiI+foRYS3YHmCerdtslWgqkMrT/vKY520FK1aNfNs
	 LUdysLbOYxihdCnE+ZxBuXeZD3ZxrwwjRic1zXEREw0wIeXqKTdqSerwZXf5LIN5cV
	 PwGJUwAIvXEF7jKqL//SCbbGFK4SDT1HKerX38R6yJ0JY/2a+73FZ5AO7c0G8IQV6m
	 G+C4cE/ZGMQ5A==
Message-ID: <81402cf28073bd01aebc58a6cad1b656@kernel.org>
Date: Fri, 28 Mar 2025 14:15:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Raphael Gallais-Pou" <rgallaispou@gmail.com>
Subject: Re: [PATCH] drm: of: fix documentation reference
In-Reply-To: <20250328114148.260322-1-rgallaispou@gmail.com>
References: <20250328114148.260322-1-rgallaispou@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Fri, 28 Mar 2025 12:41:48 +0100, Raphael Gallais-Pou wrote:
> Documentation/devicetree/bindings/graph.txt content has move directly to
> the dt-schema repo.
> 
> Point to the YAML of the official repo instead of the old file.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
