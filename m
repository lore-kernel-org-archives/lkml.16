Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B286FC5;
	Tue, 15 Apr 2025 00:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744678084; cv=none; b=ICtb84y+bEMC8Bd1/OAYUKhpVC2C6NDSnyacyMpzMdBAuDILjuCbor728Hij/6NRSUGd5VbXVyyHuAvC+DxGQvEgoEblKAPPuexHSKE9doj96EYQDZD3Whic8ugRUYMr5c7FwGW/9YRRv9sHrl6FdN5pLzMJ93hesT9ACp/FiMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744678084; c=relaxed/simple;
	bh=RctWjOi2giJst7wLG7hJMf+486uMe6AiP6atMkwHVFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nGYKXxQv3r2iVpGAOLJrP4YzC0iypxVliqfkNWEaRo6nhL2/BZ5xe01QRDHxEBBIJfVwP2ckaW7ZgTtJdhNj2T1VJXHjAZomECGL4kw8riOUa5JjjBzSl5Tgk4xwcp8OoTfjBZg0ZtCWPfbqOaNGT+NSbXYYR/Mf/aQzaPZlBHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rYUJEomi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rYUJEomi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84242C4CEE2;
	Tue, 15 Apr 2025 00:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744678083;
	bh=RctWjOi2giJst7wLG7hJMf+486uMe6AiP6atMkwHVFY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rYUJEomi3t13v0k52FKZq1BfWI8eGCDRGljAyJxToldcbr/ynOjQkMsdwWECFTdi4
	 c7rJKZQFv1uEbNg3G7iys7O2BOZqzbut+enjmj7WmmAriF/jPbGsW9SiB6ITKmBmhl
	 2xUM75bT8eeqbiJfSGc+THgHhDh0s/E8TAdvQQZ5PTJ601jo+gFD9XJ8xdb/zjQ94x
	 SIluMEXi2Lu7fBl4mK9wbzHGKAR9Wd7xIg+MWq+07V1K0czh7Hu2z3xsgzcWFK3JNJ
	 TLjklGfuuB4ruIKMIjlBiFDgjbVYJFXE48AGHUA0Ba34rxsjVdt0MIlwSEG7Mh4TX4
	 eNTt6U6Auy1Cg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso6219030a12.2;
        Mon, 14 Apr 2025 17:48:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7tZeSPyVuCMPSmiGZv9hE2RGR12bv0coPGajv5fMlL2dQjg9IfhlQxYhU02iPiF3e8V39hDLfdK2e@vger.kernel.org, AJvYcCVWQ9rkr3cKTBO+phuI3sucM/fDidpNblJjcNGN+Q4zx8PrktB4aw2/roRT1/d0W5zRSiRq5y1KnVBZJ4zv@vger.kernel.org
X-Gm-Message-State: AOJu0YxLhm1FrmVrlZkU40NfYEu3M+rPaW4UZi6dH3SGWegxUyQY4+DZ
	tLJdEjJbWmp2mevD8CH9G4fR7nOE2xFa+FGY8eBgKgExC8jSAdxA3WVNYYOc5FxovtJVD/GMOOw
	Ghs5uIDdXYMkwg+hgl/2RCH6O7A==
X-Google-Smtp-Source: AGHT+IFFPfOrrDqgzpv3auvBWL0e6nlb0egIXX4wtTdxuwO1Kxz4UxhZv8bMmjzVcyJ70rS0tg3eelf7AFPeC8n1FUc=
X-Received: by 2002:a05:6402:2711:b0:5e5:be7f:a1f6 with SMTP id
 4fb4d7f45d1cf-5f36f527034mr10329827a12.1.1744678082088; Mon, 14 Apr 2025
 17:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414225311.1913480-1-robh@kernel.org>
In-Reply-To: <20250414225311.1913480-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Apr 2025 19:47:50 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+D832Dq6oHO6Vxg=oMEA6drwWpgUqwHS+5f3s8-LBNeQ@mail.gmail.com>
X-Gm-Features: ATxdqUGRL_jz_WBTa5GmqkL_V7H8md2ow6s-ckR8Dq1jEmPSQe6gYDCQzg7ci0U
Message-ID: <CAL_Jsq+D832Dq6oHO6Vxg=oMEA6drwWpgUqwHS+5f3s8-LBNeQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: phy: rockchip: Convert RK3399 PCIe PHY to schema
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 5:54=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Convert the Rockchip RK3399 PCIe PHY to DT schema format. Move the
> example to the GRF binding as that has the complete block.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/phy/rockchip-pcie-phy.txt        | 36 -------------------
>  .../devicetree/bindings/soc/rockchip/grf.yaml | 13 +++++--

Sigh. Forgot the new schema...
