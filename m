Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02BA29A0;
	Sat, 10 May 2025 11:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746876981; cv=none; b=bNvD+D5lEr9Kgz34r5aQ1QAZTmEKc3RQi2k566Ny6vBcKcFRjHYWlc9OIPyicWAUildneZtdpjPBXVmjfPW6TFviIgSYojYBUKSuOOQHMoksNaf/7nR1HXUlSDgh8KeTNd/52G3s60g8bnf+5NrXsq3SAOrb8TS7pzBERX42DWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746876981; c=relaxed/simple;
	bh=CSbtJfYpYv6dmlPOIorqeT7hfT+eDvX+w78jdbBKPZE=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=XEnpNVlMbIDZH0wYdmINTjf/HMfu84qXVVJRHkiM91UaH58/rsVoGPIvMDmlsyT2HQsIRA8t4Rktu+DUxgON6WTvzwr9EAcHsHmBNc1TmvpmImGg0NnqEmBUk+sE0YuHsA1/Vipa//yfeFmOSFRH10nWk4gXszOreJZ+txD1Vz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=Pnd2hPr8; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="Pnd2hPr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1746876956; x=1747481756; i=frank-w@public-files.de;
	bh=CSbtJfYpYv6dmlPOIorqeT7hfT+eDvX+w78jdbBKPZE=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Pnd2hPr8NhqTEOL0Z894K9VvrtLD5MuuqAinM2SfezN7eEDHyzrMnIfWmv/kWzmG
	 xjJRi+BAhkgP1yzT+g5veLa7RgEFSKupdLOqgRQgSPIW9+9p3z/2+8bb3SgbCQqkS
	 Kn2G6ePJMwEgySMCXdcInTrczpW7C1kx7YmdGG6/dPH09Mt5cuIEhsHTP6wdeYsck
	 80/AGE4RQixvrwwaMyw0FajjARgIsZe4aha5quzhc+p18t/xe55tlPiDhXWu49oPJ
	 m0BoHvE8PRdt66o7Y36dyB48P1s4BqdIuZvU84nmwGTdQp/1vG0sTCItSIhp6AhAS
	 m8sDppr++ybIg8nkDA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.226.129] ([157.180.226.129]) by
 trinity-msg-rest-gmx-gmx-live-74d694d854-5prkz (via HTTP); Sat, 10 May 2025
 11:35:56 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-02bca72f-3997-456e-8182-d5ef1358ac9f-1746876955936@trinity-msg-rest-gmx-gmx-live-74d694d854-5prkz>
From: Frank Wunderlich <frank-w@public-files.de>
To: linux@fw-web.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lee@kernel.org, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: rafal@milecki.pl, daniel@makrotopia.org, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: Aw: [PATCH v4 0/8] Add Bananapi R4 variants and add xsphy
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 May 2025 11:35:56 +0000
In-Reply-To: <20250422132438.15735-1-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:/4ZNXZpfFmBkVPBZv3pK2+f9+sAC8ipN/KCUrOlFJ+XI0q2pfnjGjudw95LSMJy3sYr+r
 p40VQEXpm3ViXsio5PTNuBijsGczQ6tP9BAwub1Pm9SljuJoKuDJLDotP1VcRVWGHVfsMzO4cGIf
 b+ABPFKpfaoqcbvk8bW8w4jlwQra6/motLhEWqxquYLikgV+ZDP/bCxBpsEL2fXfBz7LNeE9ZdTP
 LAoZDCRCcadw+/LGXoOjUTdsgZXA0Mwo5yEo+MrPoR9uwPo9ulqAjionYURV0jM7FspBjvmZ9uev
 SnRgsU70+803FMCzjV/eHZ56Eaj6mf1Xh7mnRKTHNgHfFuKo7iEr8iSt5OhVGYHP2s=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ixHZ7+EpIYA=;iIZSgtviXbFJOi5roYS8ZQLGurG
 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

Hi

just a gentle ping. is something missing or can this series be applied?

regards Frank
