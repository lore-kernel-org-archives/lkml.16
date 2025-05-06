Received: from vps.hillapex-13.site (vps.hillapex-13.site [198.252.107.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90B2284B57
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 03:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.107.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746500877; cv=none; b=mo2+ygTAtWwWQQMNNht12VwO2xR+bNd3wHRrfWxFCiROVuUGcOU3N1zbf6ufTDWne/PA4rEq5HH1xcLQm5/aUV/kTeR/wamo5B16+t7ofciP3K49e3JZhlF7X+IJBab6+0EL8VbHKPvO9znhbKjahjKDHAmQR1vd/rP1mvh45Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746500877; c=relaxed/simple;
	bh=xUTLlm7EwfeB2h/83EPXSPHi88dI/4WpN4NTjh0UquI=;
	h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type; b=ZPc5geyjzPrz3rn+WU2x+INmdqDaeKr/5CJTFv2A/5Cxi/wPXWm1PfgLbyK/xquSiQYFPd58tpNHiAmweBQKoq5kbRQFhq7309JURKRgwWNyTdoXP+Qo3IxzsojG8qDG8XUEaH9kYeetCb159AilZwiuQl9kxXj27x3NhJ7vcKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hillapex-13.site; spf=pass smtp.mailfrom=hillapex-13.site; dkim=pass (2048-bit key) header.d=hillapex-13.site header.i=@hillapex-13.site header.b=OgNIiFfy; arc=none smtp.client-ip=198.252.107.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hillapex-13.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hillapex-13.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hillapex-13.site header.i=@hillapex-13.site header.b="OgNIiFfy"
Received: from Ynktw (unknown [39.63.207.134])
	by vps.hillapex-13.site (Postfix) with ESMTPSA id AFEC9CBCD0
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:02:04 +0500 (PKT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hillapex-13.site;
	s=default; t=1746500525;
	bh=xUTLlm7EwfeB2h/83EPXSPHi88dI/4WpN4NTjh0UquI=; h=From:To:Subject;
	b=OgNIiFfyYUEDid35dx4LR1Wz94UA2ggVxmpLohx/q3xFl0niOmg60OIwaFKwk8zbd
	 UeyNNPcsMOIEMTVlYatpbBTS4DbzjLlLY+zA08/8Dj+uwN282qRhlwep0gp/pq2uTK
	 8hPrHYTsHtfOMYfTbQ6lXT0Mz9G5OX0crea/9jj2s8H+ZlCwxpnu/2IxvORjslOzcb
	 LIjagp0uTw2ZAaMbM1n+sOurgb+PZh81/TXQeHoCRx9a4UsqujwA6xyD8o9cDazl1z
	 9CzSGrAMj3nGnp+1JZRu7tJus3b1FTN5i2wQ9u5zA8F6ZQZFwDfBauag7C3UyyomzB
	 MZPWzfA+b92CA==
Authentication-Results: vps.hillapex-13.site;
	spf=pass (sender IP is 39.63.207.134) smtp.mailfrom=saad@hillapex-13.site smtp.helo=Ynktw
Received-SPF: pass (vps.hillapex-13.site: connection is authenticated)
Message-ID: <4E92FF35E68E15C9BA8C4CF6EFE13F14@Ynktw>
From: <saad@hillapex-13.site>
To: <linux-kernel@vger.kernel.org>
Reply-To: <saad@hillapex.com>
Subject: =?UTF-8?Q?Custom_Sports_bag=2Cbackpack=2C_sportswear?=
Date: Tue, 6 May 2025 08:02:04 +0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="utf-8";
	reply-type=original
Content-Transfer-Encoding: 8bit
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5843
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579

Hi linux-kernel@vger.kernel.org

We make sublimated sports bags, backpacks, and sportswear. To get delivery prices, please:

1. Visit hillapex.com and pick an item.
2. Let us know your order quantity.
3. Provide your country name.

Best regards
Saad Afzal
Founder | Hill Apex
Email: saad@hillapex.com
Website: hillapex.com
Phone/WhatsApp: +92 300 7101027
Address: Chenab Ranger’s Road, 51310 Sialkot, Pakistan

