Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72FE221F20;
	Wed, 14 May 2025 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222637; cv=none; b=WX6MfBo8vf/DbaCAvR0Osq0AHcECc7U0U4PFZUMW31Mygbdr6XsaCJK6nhJf2EcbVTpCHDX3Tiq1kN4VHLawYR1rs6D/HDoHhGfb9C0lbse+8uvVyH74aeV1QJfl0rfgrqkA8XO4DUeyWvEm3xvkk+mf2RPiKXvZqRwaujf428c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222637; c=relaxed/simple;
	bh=IT/rqqrN2B02eom0BK/jGdQZGK6p0WHtvFi4frRfS/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gt3/nKSzPw7OPJEIjtE1ZzFJ1bzzsMMx/VenEm6Rq8pvmPv2zOc7C7vALtTAo9ECyQwhl8uaooESmiWLtuIwKvwV0sB5D+n3kKR7HDp2yArLdugOak6FYveU6TZXHVlR9X/EhLdEGyZwoSpqkzpG7zTZ3quQbwvXhOjZ4Vg2XqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9dyxvtH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9dyxvtH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0020CC4CEF2;
	Wed, 14 May 2025 11:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222636;
	bh=IT/rqqrN2B02eom0BK/jGdQZGK6p0WHtvFi4frRfS/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G9dyxvtHbzkDZp37KAkz/bk9eZrJuA4owLh1i0aK7CCyKTwVbSIa/hmSbYRCuI8mK
	 H4awQBdyBtq8MsSxrJw3EO0X3dzioCUT0kc0oCUZomfrT70yFrF3aTraEyUgg8zfMr
	 O8AeU9F11KMojNH+jHg7N4V6HH5uUHZ7jZcNQg7e558Vhc9XC/ljwLQswKCAaPCb48
	 gpRoZdVgCcJ6CrMjFTJFodr6Mjll3O6w1ulintDW8sje5eG/LntgU406ON6LlnerJb
	 I7ccDsDCcWDvUYtt5yd7Uj16dsJaGwMbst0k0u3XuDDaW/PJqeQxd2LBBzDNaJ661f
	 I1jLaMQJkD3Zg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, sjakhade@cadence.com, yamonkar@cadence.com, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srk@ti.com
In-Reply-To: <20250411055743.623135-1-s-vadapalli@ti.com>
References: <20250411055743.623135-1-s-vadapalli@ti.com>
Subject: Re: [PATCH] dt-bindings: phy: cadence-torrent: enable
 PHY_TYPE_USXGMII
Message-Id: <174722263362.85510.16134406396198337787.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 11 Apr 2025 11:27:43 +0530, Siddharth Vadapalli wrote:
> The Cadence Torrent SERDES supports USXGMII protocol. Hence, update the
> bindings to allow PHY_TYPE_USXGMII. Since PHY_TYPE_USXGMII has the value
> of "12" while the existing maximum allowed PHY TYPE is "9", switch back to
> using "enum" property in the bindings to account for this discontinuity.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: cadence-torrent: enable PHY_TYPE_USXGMII
      commit: e00c9aea31035f46b04a13effaa801f8b3419d2a

Best regards,
-- 
~Vinod


