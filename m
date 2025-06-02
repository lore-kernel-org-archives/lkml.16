Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6D4222582;
	Mon,  2 Jun 2025 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748878579; cv=none; b=TYdhXhEbnr41wAUeOrTq1aWXoWphLJFuPZT7N83pi5jvQuMx16c2K0YKC62HgBTP0IwqRInKUJKyfvOffO1je0ox1DeHFhUL/w/g6EEFfR+uEE0VsZpqsIQ25UwiZFpJXOuanPYa2OkkrJLVddvyaVeGxuQl9+7CZZYKU41i/AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748878579; c=relaxed/simple;
	bh=c603DWBYqwlU/aWg2+WiVmQp9Ok9b798vC1nRwPD66g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZmTWaTOZFgjAak3ooWmefuzo/YxK741raJLPjTiLbGecdoMlrnO45cYDAk6/REu0uL8Lj1zgAx728UJNtl+cq1ySdC46MjHIykGD90GFk98QLzvQluRVfNXZP4fQ2TwQo4Fgu0Q27AxoR6d5R727V/Y0eio64t97+mZ5LuucXGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=pass smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpgz12t1748878503t61ff263f
X-QQ-Originating-IP: 6W6+bQXnVHQhbo8HPKV1XPMJMh78ckaDklHZl58FLdI=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 02 Jun 2025 23:35:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1004114850195244819
EX-QQ-RecipientCnt: 15
From: Hsun Lai <i@chainsx.cn>
To: i@chainsx.cn
Cc: andrew@lunn.ch,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	inindev@gmail.com,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de,
	robh@kernel.org,
	sfr@canb.auug.org.au
Subject: [v5,0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon,  2 Jun 2025 23:35:00 +0800
Message-Id: <20250602153500.1831349-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530031046.166202-1-i@chainsx.cn>
References: <20250530031046.166202-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NyTsQ4JOu2J2YHolm8kogsVjbbA1pNZRv2rLqpgswDE8y4EIOC64O2fv
	xxhl4aEvmolbqfeNzqIyi1fbrte42iaPLC8GCxC0WxrNNREil3cbIafsy+kEULItMMUcbiq
	Mj1r6zKWDB5jpEHimH3HFFItJWC4ZyyRfYXvn6znD2AXkPOowhJUnV1OsBPV2q0wCW//LX4
	iSBoUTEYZlaK4qexxjicBjQLlyOjZJkOkvBOEsKZvzLPYezjIS6CHlZrqvQaxGr3MFHvTx2
	i/IatOVoW7WcFNZoLLQv60igExwTDOeN8HB4NGUeSPO+zmlOUQJpYFfyn54qgC+YdKxcaVP
	0sYUzaJCR14vxxUrYGmNwJuQ+MLoVbnZwBxeavbNB9fWkYzhcDdoprNmWh64lMDs8/lT9MC
	l50IlKiI6uRJxgfL3riS3mfe3bahOLaBWSSiYQjMSSCH3X4WQa04AOpZAx+2wWz5Se010Rz
	OnLII59EiZPkM2al6IsjlpKNtKZaTlqjBDd0+I5FtB1K/QqJvTfY9uA3O4UE4/d3U56oT5Q
	v+eEYEEUMPCvxwclfDM1lpAGfTWujEerMFtw/EopiCAWKuaUj1XWwTcgDKWgyQM7Mia4h7s
	R+SK0GvoPWZcwBBoQUo4m1vSch4FdXwgrHmSXyadhip4t2IGiWo5mntEhMVlV5Mm0jn55N+
	zh/tKG+LMpLtpM1ckZiJ0WTxLoWK/lBzt+2pq+krJklxWdHHhNKoWgMwUQCyORddTXUYz5j
	nCxxCs31S42wAxn37+yDdxOHjGS+0bi+KhXk3to7ex7ZfogyA30zn44Ky3jC44QI2s+rBDm
	kKwelyE6Ho4UI5dH/ktF+dRzkdtjK3lSmFQmlz4GvNt1aFU9xZ3tcU57Vb+yFSTci/eIQQr
	XUYPSbad7GAe5BO5yyQ9kJ5/UH9sl/vJxcpK6Ofeac9mAIFAK2UO3AdIlzmV6/DHl+Cjzzu
	OVpD+irN55+sGfSJg0dS1Gab1zDfmofXMXlCE6egXutlErr1/dkRp42MOxKuXoamchVPKQ/
	AOw8gBlOoBBLy0nLmidS4kEm6olqoDD4KnaxGdMg==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

> I tried to replicate on top of master 
> (24de2b9da3e28df323c1e096538ae1e035751adf) but couldn't, so I guess we 
> can simply ignore this warning?

Yes, the same situation occurs here,
and it has already been answered by Heiko Stübner(#2):
https://patchwork.kernel.org/project/linux-rockchip/cover/20250516012402.580468-1-i@chainsx.cn/

Best regards,
Hsun
