Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809AE8BE5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854827; cv=none; b=PVqe0OHdn+wVSna2fKCQ9ORBudSZqVKdHZK+3hJJ3yP47QEqM1mdtfMtiqrQs148ZPRKOZ6+JR/f7HCGSk1dt6LqKWjudTL+58icM/CPpvPY5WNjXUe8kU6ATo7DZpdji3QUYoeojmr9YoXqVcR6k2+092JTxw9xRGYx9wUqRzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854827; c=relaxed/simple;
	bh=gqKEMEo2Hg/ipOp9igJf7mdtFQcvy8AeXqRb5QzFDbQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=qpeScn1Qpf1k1EP4cpJSp882PMEYNiQvROKiKqDV/FI6u5/uXXf80zINrnoAvDi43eF6bC/nlqubjjELLhZY0w8pfl/CstVMon+pPANNMTfo5XJmpmfyMmBoUxZHtrLapeG9eYdYdKx29yqDMXJI4s9vfZE6ABedjD0tNYrdQj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqJO/rXp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqJO/rXp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BB0C4CEED;
	Mon,  2 Jun 2025 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748854827;
	bh=gqKEMEo2Hg/ipOp9igJf7mdtFQcvy8AeXqRb5QzFDbQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=gqJO/rXpVt0e+0EIhU1nLc3uqp2cLkodmstMrNPHQHL36rY073RDw3jgkAYarqNKA
	 qjHR0AEvmBm4OioZCu++bKDxvN5beIRy+WKkK0Y2/FtRoy7W6ext5HL5kJLoJ6t1ru
	 4TDRjXhVxVlGBdIsIgwzIuC2dGrm6i88Qc2ymNAN55JhggjLKVj/Pe50+u+w1PII5R
	 VoOKn3cpvLVyhZpILA/AU3sYPSDPwsJlWme1UUWopzQZdDtRTJ0JKJDx0O6IURtzgs
	 ZhiH6n7fV1JTp2TDxrQcAejb3Cx5/h8Osqez8SZrk5MOdGjj2bAHHlkXrKuhY38eRH
	 TGAcnJKNxzgPQ==
Message-ID: <441ae7c44624f4efbee5e793f13bfa1e@kernel.org>
Date: Mon, 02 Jun 2025 09:00:24 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v5 04/19] drm/connector: hdmi: Add missing bpc debug
 info to hdmi_try_format_bpc()
In-Reply-To: <20250527-hdmi-conn-yuv-v5-4-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-4-74c9c4a8ac0c@collabora.com>
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

On Tue, 27 May 2025 15:11:12 +0300, Cristian Ciocaltea wrote:
> The very first debug message in hdmi_try_format_bpc() is incomplete, as
> it doesn't provide the given bpc in addition to the tried format.
> 
> Add the missing debug information and drop the now redundant message
> from hdmi_compute_config().
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
