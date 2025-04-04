Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D216282EE;
	Fri,  4 Apr 2025 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743781067; cv=none; b=ieuRJbtkKKlwHxa1Cjz2oSq8YkxCyub7LDQlDQD4s7Hg5AbjfylqBuYCSJ99Hukg9mzj43UiCqtH5m1htfnMsnN/bHIDl+j/bNTq4ibQW+18GKBwuPK+jsyt0Jh99/gt2Ao4tIcHc7jm9Tlj8wk8KDpPi5O3C5Bvbjonc1knaRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743781067; c=relaxed/simple;
	bh=b60wnFizxMmhI0COYrDpyiTi94lDj4qxo701d2BiSm4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rgmQv5LDd3khYJuBtI/Lw/zTTVj0JVloxd+Qi57/Ew9Gwqqk5t7o3mzduhiIioigLdRlK9hccX23U6pnhZUQqSvmjn1TeFzTjuJvjTJmzaB6V6tXx53JATc/PDB7z+usnfFttW7cqXh5kt36ozPlOhiO80jr6+qhHrruHOK7fQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWtabXTL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWtabXTL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F912C4CEDD;
	Fri,  4 Apr 2025 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743781067;
	bh=b60wnFizxMmhI0COYrDpyiTi94lDj4qxo701d2BiSm4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UWtabXTLT+24bfGqZ5EeXDhVHuXGs/LK04FoJ9qUQrZu1OiTwohIqIRJ8KwF6Vnf1
	 Pay1EGARE24eKF8kvl4WhOsiDzdJjuhqvrFrL5GUrWYW/Pijs0zNKdMFnGGJOewOXm
	 6hRe93TLnvF9yQIp0VzJGCStzT+Rvk74FQtG/W0aKpcIPedbPol496sxTBahOc7zZm
	 ikR9a8jhLYdI2rbgoLXqsd8Ul2R6cmDdI94lZTQSDAxmihaokfK6YhGIhnHs2bB1dW
	 An4IH5Rg2gIFNZqVCY9G1AnW+c85t4U8T+9crIrxQLnIjOB8CCY7IrUOzYMk/2fC2i
	 Mip79xEU8gpWg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Artur Weber <aweber.kernel@gmail.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20250316-bcm59054-v7-4-4281126be1b8@gmail.com>
References: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
 <20250316-bcm59054-v7-4-4281126be1b8@gmail.com>
Subject: Re: (subset) [PATCH v7 04/10] mfd: bcm590xx: Drop unused "id"
 member of bcm590xx MFD struct
Message-Id: <174378106397.416874.14204933362434396940.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 16:37:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Sun, 16 Mar 2025 19:18:52 +0100, Artur Weber wrote:
> The "id" member of the bcm590xx struct is unused and will be confusing
> once we add an actual PMU ID storage value. Drop it; a replacement
> will be introduced in a future commit.
> 
> 

Applied, thanks!

[04/10] mfd: bcm590xx: Drop unused "id" member of bcm590xx MFD struct
        commit: 22f718d8e3a22abb30eb896b4630b9698429475e

--
Lee Jones [李琼斯]

