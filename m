Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0D1291894;
	Tue, 24 Jun 2025 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776733; cv=pass; b=jc1aUXhZsTvgEmp99dUu9qwkWes17HE2otnhpWN8XhJ6Oiz+G/rygzXoTDzkwVF2HJ1r+1e//r8EVZBoAeC3PxZMHHpSQ1Nb7IUEIrNQxrDEPatsXGhuxEX7ccIeYrY2tHn7qd/nkTVwUxfynWef0zT/ODirXAkxdKXBlTlTVXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776733; c=relaxed/simple;
	bh=kSHnx67T+jpZvYiQlfO4tnE2dRkuMUOdaYmF/xatSC0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JgAn83IP78cqgsaQNS7TMmHG5uVLY3KliJMfUKLK7lS5Ewl7s3ll0wu5oHwjA5D2Hqccon+HMarphW+oAKONEYVlyVkT/m5/+5VtV4TlGqqgTptU1ikOkzpxIUEinouzAs3cEYfSDTUtll4aYQ3m9WyoddVlPIweR1JQ/YsWREE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=cYa51I6o; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="cYa51I6o"
ARC-Seal: i=1; a=rsa-sha256; t=1750776710; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xt3PJMc94npRzsKUUNOptdjji8xPxW1Sj2npQLaB59QHt+dQtACPIGm7YLYvNvY9VLs47yB6PUsMspBXQfQpvkOe/jtLu1Ixo2atntkpLvkOdRVzvJ9JLGE9zeWN1kSl+Z/0rYVJQeFHZ6CtKCetAAmAx9Bs8Em0Lbcfm3FbagU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750776710; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kSHnx67T+jpZvYiQlfO4tnE2dRkuMUOdaYmF/xatSC0=; 
	b=ECrpO4gdU/mi52UbTk8CsNhlEsyj2jpZnoIUDDVluuA8ZQmwrFczd3Z3J2zGwjIhwSqaBvBqhckV4BUFf/droeTTFWTYCn/nhq/iYJLseKfmiiau4BFexN8Zz/ijDNIdQEARmBDjba2YPXWyvz11xChuTvn3c3gaINkzs/39udk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750776710;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=kSHnx67T+jpZvYiQlfO4tnE2dRkuMUOdaYmF/xatSC0=;
	b=cYa51I6o5mFxTZmRxRBCZOruLKWUyntdzp3+fZ/EJcTKGCAoOpELxu6AHGOL2O5v
	8eJnoj7vJx7TdMIzT0q6mvTgdgAH38PI28V2znYj7/6IA8lY8p2UCdKl6zfVREK5y8Y
	7M2d0erJHzI4TpT9zpY/mQFBxIKDrnLL/QCpUdjk=
Received: by mx.zohomail.com with SMTPS id 1750776709269118.9496903087603;
	Tue, 24 Jun 2025 07:51:49 -0700 (PDT)
Message-ID: <30acde756538f532fed042a4679f8791cefb407c.camel@collabora.com>
Subject: Re: [PATCH v1 0/5] SPMI: MediaTek: Add support for multi-bus
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	sboyd@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, hsin-hsiung.wang@mediatek.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Date: Tue, 24 Jun 2025 10:51:47 -0400
In-Reply-To: <20250623120047.108961-1-angelogioacchino.delregno@collabora.com>
References: 
	<20250623120047.108961-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Mon, 2025-06-23 at 14:00 +0200, AngeloGioacchino Del Regno wrote:
> This series adds basic support for multi-bus (multi-master) SPMI
> controllers, as found in the MediaTek MT8196 Chromebook SoC and
> the MediaTek MT6991 Dimensity 9400 Smartphone SoC, including RCS
> interrupt handling and per-bus registration.
>=20
> AngeloGioacchino Del Regno (5):
> =C2=A0 dt-bindings: spmi: Add MediaTek MT8196 SPMI 2 Arbiter/Controllers
> =C2=A0 spmi: mtk-pmif: Add multi-bus support for SPMI 2.0
> =C2=A0 spmi: mtk-pmif: Keep spinlock until read is fully done
> =C2=A0 spmi: mtk-pmif: Implement Request Capable Slave (RCS) interrupt
> =C2=A0 spmi: mtk-pmif: Add support for MT8196 SPMI Controller
>=20
> =C2=A0.../bindings/spmi/mediatek,mt8196-spmi.yaml=C2=A0=C2=A0 | 138 +++++
> =C2=A0drivers/spmi/spmi-mtk-pmif.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 471 +++++=
++++++++++-
> --
> =C2=A02 files changed, 530 insertions(+), 79 deletions(-)
> =C2=A0create mode 100644
> Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
>=20

For the whole series:

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

(as I internally reviewed it before submission)

--=20
Thanks,

N=C3=ADcolas
