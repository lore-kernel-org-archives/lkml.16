Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5DF199FBA
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671847; cv=none; b=EpUjlJquOYTJ72k1EKZeGfm8VDO8mzfREqoTjwWv9wj4hdeKjcwLQKuY0XXI8f7kNPfYl7c/kEZEe342gr88W6nicGxZgHYh7FW9IweCvHypfPrZZIW02QnKGiuIwD62c/qWUC90btEqxQvhwfW1Ods2+Pr+AlqUCLsZDiwKMkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671847; c=relaxed/simple;
	bh=TSQKjKbpV0/LI0K3BCx+yaJWInH5iUqXSzO58gDQgoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tlJD3O39Il5S7H3Luo05KFbsGpxwz8KZaOIn9rZzHO2/yECBuzNYlwAFRgH+5knLo2LBoHWMbMu5NbT+93Dp4LTHzFaqQweatM6KvcqvqG3IOFzgf67KODWmWmXbdczPVlfcW1eI+V0w3NZoZvQmVo1SZRrKs00kshhQQKaWrQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtLBcBlh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtLBcBlh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141D1C4CEEA;
	Mon, 23 Jun 2025 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750671846;
	bh=TSQKjKbpV0/LI0K3BCx+yaJWInH5iUqXSzO58gDQgoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FtLBcBlhaaLUav/6SGc+n+WgyyJMK2XGPcILTeS4d09jN2LOpK9c27uTYwEc+NlOV
	 za1SnCuaWMR4SgWYR8O1tQdAGeImwGP5W7LuVIQkf7H87cEeX+nNlRUk5AgvYt6Ana
	 5QhAwQoPy/T7Q7JYWQskdNgkz4gRcjQ0KK7oJy69bANFnfQMhjQNIChAehwbjSTHZb
	 W7vy08VEEajpKDBK1oOE20/iOfGYIRSG60qKHy8oV2faHuk5E25KZ2XPUqBcSTJkoZ
	 /7w6rxkLhEr+TCOcPzsfSJaJtJT4EOIe7HCbiov4Bb7jtI5VyCBLqVs9QO6RMueIAL
	 LAhlCJceFzDLA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org,
	Vignesh Raman <vignesh.raman@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	daniels@collabora.com,
	daniel@fooishbar.org,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robin.clark@oss.qualcomm.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	quic_abhinavk@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] drm/ci: Add devicetree validation and KUnit tests
Date: Mon, 23 Jun 2025 11:44:01 +0200
Message-ID: <175067183351.289902.11645446324178175765.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623085033.39680-1-vignesh.raman@collabora.com>
References: <20250623085033.39680-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 23 Jun 2025 14:20:26 +0530, Vignesh Raman wrote:
> Add jobs to validate devicetrees and run KUnit tests.
> 
> Pipeline link,
> https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1455734
> 
> Link to v1,
> https://lore.kernel.org/all/20250327160117.945165-1-vignesh.raman@collabora.com/
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
