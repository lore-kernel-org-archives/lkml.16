Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED25921A44C;
	Fri, 27 Jun 2025 20:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751055828; cv=none; b=RwqwAVcb9kbTIXJoGpt+S4dZb9ze4xG06LeEW7xBURb64WLJgEmdqNJa/qhpXZyDD3eCE5gzg9MwEfUGt02eMnmVuhtx2Wd3MRKxD6th01sXWn6ccxwgkYFveexc5HqvqPJlJOZl0G0f6zyg4G+07Sy4eG0Zv47V0VgWRbMy1yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751055828; c=relaxed/simple;
	bh=ZUs7oMicwFryr12OGl0ndU7qfjIlyTt3/e0DKs0MGVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nn4f79dFKHmIhC7RB5a26FZ00r3VuV2n9PeskulMDq27N6g+i8VYCx+4V5/hCFBsCCGPZ6HviPBbHWHI4xj5dBzgah3KWiIUDyQm6do0AxZj5wQ8RNxHYN+JHKbbHuuDoYERJZ9NNKptJwkJh7up3/gB+ik9d2gA5Q+gjlZ2b2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYvqsoLC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYvqsoLC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55852C4CEE3;
	Fri, 27 Jun 2025 20:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751055826;
	bh=ZUs7oMicwFryr12OGl0ndU7qfjIlyTt3/e0DKs0MGVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYvqsoLCo0czRGJb19eWtrW5bHpMhPlUhmy3uB8g/ehHEVFMs0cYqhFkC6s1buEte
	 d3kuw4FX3ejzT8lKoG5vvM8t5pJLOpUD1C/l0ILPWGcpiDU+Pt2/zXqjzw6XZZJRBx
	 R83HUQ0OLhZmEFVYHvgTO6kV8+se8wkpCRZs2hWif0nEVt8crYdNOBjVGT3vI6xTZ7
	 ZQ+wk7leKA7qh/DwmmOEToGfD5FyMUa7slAWwXG4OB0WaIBO+P+ylzMZ7LwlLSB6lg
	 1vGJEWgbMfOrt9o++UWhJ8niIFR4SlzkluUyq7SEqmWgr4faAJDig5UNL7OJQw5lTZ
	 O8TFDLQHEogBg==
Date: Fri, 27 Jun 2025 15:23:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Alexey Charkov <alchark@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Conor Dooley <conor+dt@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Yunke Cao <yunkec@google.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/8] media: dt-bindings: rockchip: Add RK3576 Video
 Decoder bindings
Message-ID: <175105582524.23618.936234591360412095.robh@kernel.org>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
 <20250623160722.55938-3-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623160722.55938-3-detlev.casanova@collabora.com>


On Mon, 23 Jun 2025 12:07:16 -0400, Detlev Casanova wrote:
> The video decoder in RK3576 (vdpu383) is described the same way as the
> one in RK3588 (vdpu381). A new compatible is added as the driver
> implementation will be different.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

