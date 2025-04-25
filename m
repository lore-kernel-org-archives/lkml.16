Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C8622D4C9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745562495; cv=none; b=ryfoSeU97u5o94iBt/HRtlQRntL4WrsMW8qffWSA0KJYyYzp/Q1MpC7etyFSFY2ViRMVKdQb2H2VlLc4N/GVIeXj/Q5lnICDrJY2z4175U75WtRvvJw5+9XEhCLcQFtba1OA26RAPY4EiJhgUaiDjKyKQueQZQG1xQfVfcg3x0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745562495; c=relaxed/simple;
	bh=3a4SD5XyhdVKey2Uc6alS6E+HQVONu3b+XtXoLyz5cw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rqbwa3EaNPCuOv5qUvXlOsmfniJew75gxL5RaGjL3M3Tt0Y08172fOoZFEP1rJmac2aW4Eb/hh2npUvyLtdvgcxohPQOJsZdy5fQ4qCBxeNHmakEFLuVetFmzGlOUI9A43PFaj34Wdw+GECR7BeMYV2I1MtPuSbu0h12ZHQXWFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqNNH+UP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqNNH+UP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08813C4CEE4;
	Fri, 25 Apr 2025 06:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745562494;
	bh=3a4SD5XyhdVKey2Uc6alS6E+HQVONu3b+XtXoLyz5cw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NqNNH+UPh3GOpd6Hkpw9xbRtYUCakDvdNlcg4N5zhJ2ikmcIZsI3S5Nedgomy4WLQ
	 gDC4ERHcjeyC8hP3WYExUzzNEQBxlsGPpBr/+wPAgvemgTiwcQlXKT/+4Ovzjx5sJw
	 2s41f7KEf+cfrUNW7KzAwbocRj8JUPCfE0LCAxGqINp0CyvPeKbi+YxB0Quxr63znd
	 EI2BT3O6c9CwXlNN18n8vcQ/yn5yUaZYLPJkfjUN60e8nyju92uYlqrxEJkYGlV6Rd
	 hYoFhNyjTXvk3AfAMZx46UdRX/7B51tV0MFqG/vFm04n8d2g5D4KWlXC1/hgvUtW3N
	 WA/oJytLTw8kw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: linux-nvme@lists.infradead.org, Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, leitao@debian.org, kch@nvidia.com, 
 sagi@grimberg.me, hch@lst.de, upstream+nvme@sigma-star.at
In-Reply-To: <20250420104726.2963750-1-richard@nod.at>
References: <20250420104726.2963750-1-richard@nod.at>
Subject: Re: [PATCH 1/2] configfs: Add CONFIGFS_ATTR_PERM helper
Message-Id: <174556246303.541073.9476765068827917682.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 08:27:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Sun, 20 Apr 2025 12:47:25 +0200, Richard Weinberger wrote:
> This new helper allows creating rw files with custom
> permissions.
> 
> 

Applied, thanks!

[1/2] configfs: Add CONFIGFS_ATTR_PERM helper
      commit: 052ddfe405efcad262278301abf809e31f08605c

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


