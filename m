Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C324B2BEC2F;
	Tue, 13 May 2025 16:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153784; cv=none; b=QmrZ3Evd5kIB6mK4U2nXtZzTTAr9xghQInKbG0Dgw5OfDimCcupC9GwN8bz5lip1tHQMeAw5WR1oplBJgIEUrSsQAlk4nFdJgzRJ6+XhBRa7ZqPNPQxIV3r/dv9KCQDG0U2ERPzlTRUDE6iwTRbXDqHeCL1kv0W9HQV6ENuztpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153784; c=relaxed/simple;
	bh=5lS/wK/Auv2ix8gm981VAe7usX4SgPlY95Uk0PphiXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oC1AXHPEkkII5svRthJzbTpqNcGhdCdKvxxpcBZ2Yo3uAV5T5sJog0p9nVCMUUy1CORqNu5iClw+RZj16ifM+NiReXzN/IZcTkh7QEcAwAI8+hANQlbvN1HtYSehg2b8VeXil1OJNwnyioCxMMEKsFnWeGL1J9Qv3eh41/oQ2xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE0DC4CEE9;
	Tue, 13 May 2025 16:29:44 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 917235FAC0;
	Wed, 14 May 2025 00:29:41 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michael Klein <michael@fossekall.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250508173657.8695-1-michael@fossekall.de>
References: <20250508173657.8695-1-michael@fossekall.de>
Subject: Re: [PATCH v3] ARM: dts: bananapi: add support for PHY LEDs
Message-Id: <174715378157.4016543.4493109479231149921.b4-ty@csie.org>
Date: Wed, 14 May 2025 00:29:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 08 May 2025 19:36:56 +0200, Michael Klein wrote:
> The RTL8211E ethernet PHY driver has recently gained support for
> controlling PHY LEDs via /sys/class/leds. The Bananapi M1 has three
> LEDs connected to the RTL8211E PHY. Add the corresponding nodes to
> the device tree.
> 
> 

Applied to sunxi/dt-for-6.16 in sunxi/linux.git, thanks!

[1/1] ARM: dts: bananapi: add support for PHY LEDs
      https://git.kernel.org/sunxi/linux/c/d010f85f1acf

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

