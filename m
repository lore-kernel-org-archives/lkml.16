Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BE51DA5F;
	Sat, 28 Jun 2025 04:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751084374; cv=none; b=akjAZsT4TtaIaTT/O6Euw+73Xpw3iWUCj6Vpx2+RhWs4oXPZQitOvhp3EsvGopfGU4DkMPFwKmwZB52gh5cKMgZ+qI2/9WIgjggm5BRgiLw8iTSakCkqsBDtWf9T0zGS4jzJyymVNTHXKcH7UgUXB6k6gpOrrJ/YsOeFQ7uF1/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751084374; c=relaxed/simple;
	bh=3BIxLq5dxWnt6gQBjzbn0MlG0+6WOdN/H7GQfM8g6mw=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=g5kBMY9E38cxyq85Il9d9wnA1nTi0K1/7jSdvA/cqSK8ruioCQSEkXtShQQd1L8stNvcgafj0shAo7KKwPxZ/ajXtsbeEU5mvTgF/4otOEqzBe2QriafEpSQn/8TaBj7WK3aNFXEz8ebhqEzpG2mpmPQE3DeUjQ8IST6lLOqEi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bTfMJ4Q4xz4xPSZ;
	Sat, 28 Jun 2025 12:19:24 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 55S4JHwC009320;
	Sat, 28 Jun 2025 12:19:17 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 28 Jun 2025 12:19:17 +0800 (CST)
Date: Sat, 28 Jun 2025 12:19:17 +0800 (CST)
X-Zmail-TransId: 2af9685f6d45ffffffffeb0-7fabc
X-Mailer: Zmail v1.0
Message-ID: <20250628121917249q9r3rXmnBmRqbgFtJuDHW@zte.com.cn>
In-Reply-To: <20250627143212435mZ2WRnqC77Y-XxvFKrGsy@zte.com.cn>
References: 20250627143212435mZ2WRnqC77Y-XxvFKrGsy@zte.com.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <jiang.kun2@zte.com.cn>
Cc: <alexs@kernel.org>, <si.yanteng@linux.dev>, <dzm91@hust.edu.cn>,
        <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <fan.yu9@zte.com.cn>, <qiu.yutan@zte.com.cn>, <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2Ml0gRG9jcy96aF9DTjogVHJhbnNsYXRlIGFsaWFzLnJzdCB0byBTaW1wbGlmaWVkIENoaW5lc2U=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55S4JHwC009320
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 685F6D4C.000/4bTfMJ4Q4xz4xPSZ

> From: Qiu Yutan <qiu.yutan@zte.com.cn>
> 
> translate the "alias.rst" into Simplified Chinese
> 
> Update to commit 735dadf894f0("docs: networking:
> Convert alias.txt to rst")
> 
> Signed-off-by: Qiu Yutan <qiu.yutan@zte.com.cn>
> Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
> ---

Reviewed-by: xu xin <xu.xin16@zte.com.cn>
