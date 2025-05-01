Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475F6211710;
	Thu,  1 May 2025 12:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746100811; cv=none; b=oVgTsX0GErypdan+pDUAbvFrCylyop5IH0Z5aP2p2YZuz11jWQmmgr7ZD6GpQsbwWepKmGmGzOdSBNbWeTANDoixNezgRnXm2A+x/kBONDuf3iFAfbLINj8Hu1wZgR7ULzxTZlQsKcyoMbGbmkL8GU4q2UwWEIqSsfc6RkqSzhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746100811; c=relaxed/simple;
	bh=z2F6Iq0+hrQEpIkV1fcg1WaUZezRhDU2gz0ArU4vrno=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SpEgVhxo5JLyicjABoSrfeQcfk03A3eg0AHd9wpOVz1LG3fgB8+4qt3f5ofEwYmFFcqQwHcaFHrIuTMnJzeCsrwkEs4yvpOEKbTmPXEsHBg9DZKcnqnpQ1Aj6T2CBxG31qlToP6uLPNlBmq1tBrNboZrgDS78Dyc2THRQ/XZowA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYsGrvFL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYsGrvFL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA6CC4CEE4;
	Thu,  1 May 2025 12:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746100810;
	bh=z2F6Iq0+hrQEpIkV1fcg1WaUZezRhDU2gz0ArU4vrno=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FYsGrvFLffhiha4aqHkEGShXosDNpziWGUHgvmVDigxpuGtwUNOvtBoSTZDyYxdep
	 SZSx8/9SSh3vE39cBtXXqVDlyjm3+eLy+BoqTf+h5cIVkcJkwYfx+odlikVY+hgyfd
	 wXoOc71APf3R7yHeCOFcur+WgJq4lOF3LZIBavk2ngkmdxUc/SKG5eqgG6h+nzYTlo
	 VqREdJ/WFQXkkV52JcMGsj5+dtEAGoQIlh0H0KiDq0T3jqgCco3uXMTwXpQHb86Pth
	 l5ggML4+v6nvlahSCh2YLw99hh04tQdqnqOHwAQt+adta+U2bLYP38Bj0IsBvj7s4t
	 +bTbCajpFU7aQ==
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org
In-Reply-To: <20250422132438.15735-6-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-6-linux@fw-web.de>
Subject: Re: (subset) [PATCH v4 5/8] dt-bindings: mfd: syscon: Add
 mt7988-topmisc
Message-Id: <174610080698.3792828.16129247055603832189.b4-ty@kernel.org>
Date: Thu, 01 May 2025 13:00:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-39345

On Tue, 22 Apr 2025 15:24:28 +0200, Frank Wunderlich wrote:
> Add compatible for Mediatek mt7988 topmisc syscon.
> This hardware block contains 2 functional blocks
> 
> - a powercontroller which is not needed (switched by atf)
> - a multiplexer for high-speed Combo-Phy
> 
> This compatible is only for the multiplexer part.
> 
> [...]

Applied, thanks!

[5/8] dt-bindings: mfd: syscon: Add mt7988-topmisc
      commit: 4d54ce40400c215127ce24aa3a684a20e7d8493a

--
Lee Jones [李琼斯]

