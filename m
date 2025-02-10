Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E4E1CEE8D;
	Mon, 10 Feb 2025 10:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184001; cv=none; b=Lct9gPjxkuL5gSAweAxXDbC1maoSK/pP/Gspx82+ZpSDsvQAGt/sJKnsWxipaf+d75wX7RfGMe+KuTKJlyN4jDoSA5mS0kc5D1yTyVY2oBE4yVilLcsNBD86MxVG9dbkCy8ieX0vhaKMxtdosN/Lyzl5dnH9aZoKJm4uaLLOcXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184001; c=relaxed/simple;
	bh=i1tTlncfsAzhpr8nTXyAdFhGI00n2Yo3crVcg7JPdig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sTvnUMYmOb0CXysZQblFqVZ8LoLmyqQNaGFsd/X+s1Fhf5un1kOWmwaYiECbKJfFFCXWsrlKU+pXoBYhXGYRd/uD1qaNsxMkgeHVO3ilrmL2GmgEj60BIMHPo8pCjsiC6P5Nna21CGGKVSuH8X1y0GUih/fPQcZxNqAHaPHjvmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=RaqmZiDn; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="RaqmZiDn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QIq2Le2HWe7jkjLDLqp05Yofv2eXi3L5LHVAsPz6mp8=; b=RaqmZiDn5Lv21QyKcP6BRxkGmA
	DwLhyaASPhpWQalL/Y8pZi4nQg0h3dIRu6dh4gD7xEh3s3/1GQFdVQTWlCnz/zr2+aLgCgTVfSjik
	R4ubbnR9KGcovs4WHLneRry1vensJtxIGGxVHE11sMI7+KsBSUfgRUsLs9dshwvn/2BfnkKK6pzmu
	Lyu6SP0R1nghz+4IhEpmdvkycuI3TrzxZocxK/ctHE6PggDQhSntAp7h7WJB0sHRfPAGzo74vnJ3G
	efy693e9fGx8sgUtjnNqYXVnTzD2Xnukv2ZOpkLD1L8hs18JIXmOCN2+Mgu9nSzwZtYUV83UwZ9sd
	4JiBdvjw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thRCc-0000xs-Fl; Mon, 10 Feb 2025 11:39:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Maximilian Weigand <mweigand@mweigand.net>,
	Marek Kraus <gamiee@pine64.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: rockchip: add 'chassis-type' property on PineNote
Date: Mon, 10 Feb 2025 11:39:34 +0100
Message-ID: <173918381708.1055685.11966646265812211443.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250207111157.297276-1-didi.debian@cknow.org>
References: <20250207111157.297276-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 07 Feb 2025 12:11:39 +0100, Diederik de Haas wrote:
> Add the recommended chassis-type root node property so userspace can
> request the form factor and adjust their behavior accordingly.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: add 'chassis-type' property on PineNote
      commit: 18cb5cb58f4fcbd96d00e1d882e6b5882d1b272f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
