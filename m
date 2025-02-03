Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92905206F3A;
	Mon,  3 Feb 2025 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570582; cv=none; b=hnhYE86h0JDHoPzNgjbllbF4QcsxvGiw/THHuSyXJs7Pg7O+/ahi3J4WqBhIrYu1+inioM1EvRE1/bm27PuBpLooW6TTY1MSC4BdL1xHXzP9JQZZxqmWquq95AZUlklJ1+NHAvBl6Mb32yWGMKuK4vWhjHD09asjMFf47gBCxlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570582; c=relaxed/simple;
	bh=fDfnTD/jnBdLem0v+cEPI9L//YYA5v5r7mZzMN3mAOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=esrifhmSAsDPHEwVxJrM1BdncX1OrrY8VJ/pbHDCFY1+3NLcMJOoVf0KM57oobzfpyvgrF6yMfO2smAEPrFXsC25msDzOHNtYoYAbrjiwjAYw3uNvlv1O5P94eaxCjdJC/SpEd99zXTqd9CFttOWcddgaGajCJmpvYBaPqg0l4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=MVBkHUZq; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="MVBkHUZq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r24954j0p83e4iaisXbIHzASJ/hedULNQIzGrOvva9U=; b=MVBkHUZqYiC0jbcoOvC2m9tlao
	uS8bSj5DCT7Rh72PREbBtwNYnwXwvZcN415feVn9KvXYFUE7b51dH0r4Clr/RAOucJLzpN5SfbtYV
	+c1/mGBTHTTAjPFOsLNxT7kph9lUXjuj1aoHzFNlcRxABgzHKNB+fKJCTsFz96zzvuI2rs3ltm/eL
	QaQbvRje1PyjItf9Vt67pymwMiQuhsN2O86vEjNYHrlZe4n8PQB0Wm8Nqld+QmaCMgWsbAMzkL4M4
	cmJz4xmmW9GSp1yQFCe8xeGZnFGqDbDWX7xC2YHQpmqI+ZcbKFWXOMvmijpAos8Y/klI/+ji+nWei
	8ObiVG/w==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tercm-0005Vr-Kz; Mon, 03 Feb 2025 09:16:08 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable HDMI on armsom-sige7
Date: Mon,  3 Feb 2025 09:16:00 +0100
Message-ID: <173857053621.78657.10703057328583669922.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250115023327.2881820-1-liujianfeng1994@gmail.com>
References: <20250115023327.2881820-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Jan 2025 10:33:21 +0800, Jianfeng Liu wrote:
> Add the necessary DT changes to enable HDMI on ArmSoM Sige7.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI on armsom-sige7
      commit: 1a6a05d15195f74596d5209b4fd8b781a33b7fbe

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
