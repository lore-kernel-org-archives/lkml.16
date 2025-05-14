Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A9E27FD45;
	Wed, 14 May 2025 11:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222681; cv=none; b=ATPoL3QwVkeEtJL44dbBYFsa+04uOSfv8GljcGdJKE9l73SEJq6djoSfKG+pO944h+IuZfrpL6VnhkvhE8tWYXge20nCmY4hWOtPHTpq2+VJDo0/OPOLdbK8v+l9z52IHkBrEpuJvuO/g+ZOyaGMA12KNQResk8JqXx06GByJTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222681; c=relaxed/simple;
	bh=VTTFlFqKbZj0R8bXBdiVnWfhHcHtgwA35tKgTuWcnVU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TZ6Swp0JSVJdH6Q5X+3kAg2kVPBVoVpcrq1Al4LP+80MgGqib9A+Fgy6gRYRweH+4+DObYOulzqSchlVwGiWKSpgcXKFqQZU9tsw3/qsBsa5GUMqS4fhRa2dN4uqYuNmfBuDUKvSXk80dWwUMOobV3vz8tVEzPSwp1R0+8T0vuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYEdMW7L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYEdMW7L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8EFC4CEF1;
	Wed, 14 May 2025 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222681;
	bh=VTTFlFqKbZj0R8bXBdiVnWfhHcHtgwA35tKgTuWcnVU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hYEdMW7LCyn/VajqjaK57h7r8AIr9wN+sZU6do3nH9g10ZAapJSRlZ7IyL2jTwJJT
	 E0lHBkvqO5apGHk6vnvxGBjrEoF2CraczeBykW5lB/gRMGzgUFSMkxCefMcxj6X55z
	 I7mzAJqyT/H5Pyu6J5uo6NPluCkc4lphFKhQ45JHGeajXxZksrdY8NJveHmAt16luC
	 aidw2Z558EqKwupkCgSK4Xp4BY1nx6hK/zPRInmK0wxuqeEJk+gORwD/pBWKEPnjt6
	 fyU33tAJdUv3u0X4g0yD2l2uUS89g1EMqnbrj+6oKcy2XxK54rRyRtrGk3EmGQMQZn
	 h4p/WzsjKf5Sw==
From: Vinod Koul <vkoul@kernel.org>
To: heiko@sntech.de, Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250415050005.52773-1-kever.yang@rock-chips.com>
References: <20250415050005.52773-1-kever.yang@rock-chips.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: rockchip,inno-usb2phy: add
 rk3562
Message-Id: <174722267864.85510.12860114066219144808.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 15 Apr 2025 13:00:04 +0800, Kever Yang wrote:
> Add compatible for the USB2 phy in the Rockchip RK3562 SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: rockchip,inno-usb2phy: add rk3562
      commit: abf55cdf9c5e58bac1feaff2e21bec43b898746c
[2/2] phy: rockchip: inno-usb2: Add usb2 phy support for rk3562
      commit: 80edd21db00c0829c276baafa8871ae02c6e9d91

Best regards,
-- 
~Vinod


