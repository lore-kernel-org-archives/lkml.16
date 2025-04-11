Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58542BE7CB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373452; cv=none; b=HsIkifpuvOC3LSXYxP/fe1RjFYZ9EVivvNzfQW8TMPctRQgmAvzJDLASTiwt5dorufm+rWH8RzuLbgWWgGj0I/Tgxs6dCftxOor9uhltgXFVAdelOQ48p3E2JMxjuIYbBjJKwOX88CCU7gg/BH17myRGt1yqhEnsGx+ftrHDLOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373452; c=relaxed/simple;
	bh=P74WDZdHhoRO/BU2lkuYSlhGCVYVBQk3dgxRzIvow2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q2AkHxzNLW2tofIIZpNlxBnhF5Djw5/Y83lxJS8vP6zHSpW/Z1SERKYaJ0QXpyK4KP7dSyLE3VAzQ4wfA8vSkM2NdbZVn+pCsan/PHkKBZlug6yd/WPuBbyhBjMmBkz9jFlAWK3u/TEeZSuwy4h/wSGhX4ROLfuyt79NyYE8iFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tR+iBjkV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tR+iBjkV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8599C4CEE2;
	Fri, 11 Apr 2025 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373451;
	bh=P74WDZdHhoRO/BU2lkuYSlhGCVYVBQk3dgxRzIvow2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tR+iBjkV1EPSm3IjtqDHfgV4sZMYhVAV3yu4vxPZyl5E/Q+NT90lf2XF7a/oc5qkf
	 GODyXbRMyJccjl5wctCGWo34TZD0ko3apMsFR9jPLTScURR9kDyMB+bt+rCqEYl7kP
	 xEE60p0RpUL/I+BVbQ2P0aIx0ayyDL3lKtr4KX++nvyXKzkcALL0snL41oL+C4fMBw
	 vTDS4RmlsDW/4nKN5T8Q8E6U11hQ22kE8QOplQl5W32kX1jiKantqRctm4P4OAJXGw
	 +5oaB9imcBDTsi3SuetLivCz9c4kjfMDIsiI51Ow1LMH65LSIhMq8KVoHWk9AV0Cgs
	 HW34N1WRKWXEQ==
From: Vinod Koul <vkoul@kernel.org>
To: linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kishon@kernel.org
In-Reply-To: <20250329190712.858349-1-martin.blumenstingl@googlemail.com>
References: <20250329190712.858349-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 0/2] phy: amlogic: meson8b-usb2: two small cleanup
 patches
Message-Id: <174437344945.673939.17223237328558537287.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:40:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 29 Mar 2025 20:07:10 +0100, Martin Blumenstingl wrote:
> this series includes two small cleanups for the phy-meson8b-usb2
> driver. There are no functional changes.
> 
> Changes since v1 at [0]:
> - added Neil's Reviewed-by (thank you!)
> 
> 
> [...]

Applied, thanks!

[1/2] phy: amlogic: meson8b-usb2: Use FIELD_PREP instead of _SHIFT macros
      commit: ff02c5a3df4852819d9ec218e5c8ae48eb02b101
[2/2] phy: amlogic: meson8b-usb2: Use the regmap_{clear,set}_bits helpers
      commit: e60363bcfbcef903ef30540776f254f8b53bb4c5

Best regards,
-- 
~Vinod


