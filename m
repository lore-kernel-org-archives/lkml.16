Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B76626F466;
	Thu,  8 May 2025 14:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715618; cv=pass; b=mDOqk/UOds91OgU/lXECtI5iRNxm5PqYrTiA5MnSnkwDETX/8hzTzxTPrlpT5IkHTjgO0oqteXkijvwvo0nvnMoQSCBaiZtfAhiQa3lIc1C7snsp6QYaaR+tYAvuRPFNCO5qh+WgRA25VzINm9es4LtTqz11dvKo7jRc6yjd3rI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715618; c=relaxed/simple;
	bh=SWTsIokHh+47xFZwD/83i1vYbIDo859wWgVQ18yQ95U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UvJlEpuY6XQJDaI6SWwIR5yXnYpFkF67s6dZryTwpn56EvenCj+LkM61Umkoy14XYct4wtfukRtWGjeAg93/PWdbrZtch6a14T66KOvaNPUIBPGW8p+jrzVi2eXRLsACJdmV0DjK9DmCtn6gAAYB54Y8T/scYjqZRCXyYrAeChk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=BVdZ4iOz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="BVdZ4iOz"
ARC-Seal: i=1; a=rsa-sha256; t=1746715602; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gOgETbXPdjD9sLzY1UiXI2wgJt/e+pCrZbIV/+4fJ4Pbeq93eSIbG3OUNJOoya5QVFUsk8W53l+waxHm7mpRl0XXaHW0nah29+7/laHfwJH1BHewn/K842SMT1PNqZj+zSblKwGw5O8qxJ6sD8K337SEtoxIXRk5COMNfeWpfT8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746715602; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DVeaMIyud27ACIV2eA06gPP2ZeLSokpK9pE1Ha/4hoc=; 
	b=NGgGe93I/YCs12ddBhPrGOykk3RHe7X9GYml9NzbfJUH6wGROI63Pz84OQ7dzBp1L4XUSzKKIIbyaYIOTiVtdZMBVVLRyw5XjxZwNp/44sBjfwxG00DCM5kmONTDcaUHkOV09kODtnP24cz+1Lr2oBumwSZcB4dHY0U4nBtKDa8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746715602;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=DVeaMIyud27ACIV2eA06gPP2ZeLSokpK9pE1Ha/4hoc=;
	b=BVdZ4iOzDUQ6QlTqroB0R1STrdfAESXp0+JIzuZoeVq/xJG+LlAYW1v0o/2dyE19
	8EnZaxnyxpRaRnXSOjMj6kpYTk66Z4T9bUXjABzB0PG22sxLilrqWo2QJVekS5Su8KI
	+k6AxV1YVD4KRckZdYrYKcXKYwY0sDUvonKbFVk8=
Received: by mx.zohomail.com with SMTPS id 1746715600309765.3309141837468;
	Thu, 8 May 2025 07:46:40 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 2/5] arm64: dts: rockchip: move rock 5b to include file
Date: Thu, 08 May 2025 16:46:35 +0200
Message-ID: <4719179.LvFx2qVVIh@workhorse>
In-Reply-To: <20250324-rock5bp-for-upstream-v1-2-6217edf15b19@kernel.org>
References:
 <20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org>
 <20250324-rock5bp-for-upstream-v1-2-6217edf15b19@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 24 March 2025 18:04:23 Central European Summer Time Sebastian Reichel wrote:
> Radxa released some more boards, which are based on the original
> Rock 5B. Move its board description into an include file to avoid
> unnecessary duplication.
> 
> NOTE: this should be merged with the previous commit to ensure
> bisectability. The rename happens in a separete commit during
> development because git does not properly detect the rename when
> the original filename is reused in the same commit. This means
> 
> 1. it's a lot harder to review the changes
> 2. it's a lot harder to rebase the patch series
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts  | 52 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi | 34 ----------------
>  2 files changed, 52 insertions(+), 34 deletions(-)
> 

Hello,

this isn't evident from the diff, but the move + these changes keep
vcc5v0_host_en in pinctrl in the shared .dtsi as far as I can tell. The
follow-up 5b-plus patch has the correct pinctrl as an override, and so
does the regular 5b for its respective vcc5v0_host_en, so it can just be
dropped from the shared .dtsi pinctrl.

Additionally, sbu1-dc-gpios and sbu2-dc-gpios need to be moved from the
shared .dtsi into rk3588-rock-5b.dts. The rest of the usbdp_phy0 node
is fine to stay in your shared dtsi, but in the follow-up rock-5b-plus.dts
patch, the rock-5b-plus.dts needs the sbu1 GPIO set to GPIO0 C4 and the
sbu2 GPIO set to GPIO0 C5.

Regards,
Nicolas Frattaroli


