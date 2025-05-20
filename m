Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256397E1;
	Tue, 20 May 2025 02:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747706489; cv=none; b=G+Xu5NaQHoLiG9vjdGVYVnoIsnPSIjshVxYVrovDMf50RktrevB7NGjRW5DjdEZ3Ux3eGvh2kNVP86AoG1UdhQ/yr6hGp+bXGCZn5lbtiQJKkZ0XOadtEdjIAB35/bevjZFPRj+Eo6XdWoDQ+wH4j8WuJQWvUF49FmneSKyGgSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747706489; c=relaxed/simple;
	bh=DaUCE66xeXpissASvXOD2lj71rIVnrG+KJJg8/flEbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VUqMfjqxRPjJbIdrrwTGKEKoISo3NlOHzdU0ficVbjlu4/RLlvOGcRO6kz9ETGunYwJJvA+BNg+YxGt36qmtJVugESq8yZb4E/oR9TCQYUxhBYwIEPnlKKmU5UgT+7dYJMAYjWs5Ht9DSHbZ46pMNgR8F0Wf/6ifh03GxXb6kWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=none smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chainsx.cn
X-QQ-mid: zesmtpgz7t1747706449tc2ca6122
X-QQ-Originating-IP: MJX7unsbp3LccLzJ3lQxq4cDUsWyjuL4NHekkcViH1s=
Received: from localhost.localdomain ( [182.245.65.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 May 2025 10:00:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8091902389389693437
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
Subject: Re: [v3,1/3] dt-bindings: vendor-prefixes: Add SakuraPi prefix
Date: Tue, 20 May 2025 10:00:46 +0800
Message-Id: <20250520020046.2387034-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519085614.2245892-2-i@chainsx.cn>
References: <20250519085614.2245892-2-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NYbMsSpWz/dLatlwQ0wtk+Ple6qz32VwzMOnYT6+O8BbvpafFRxDNAQA
	IuDTGFmDHbMtyDcyKRgLY9oZ0tgxIrtmoixupjb+AhQmhjkisBiQ7zByeH1mhu3Avp51mE2
	qrcTyE79wtJ061TtoiUeKESDv2Kr3tAKghr1cFBNZByLpF80ee0LsI8SLD+QZcbV8laEPGk
	id9FVQx9f3g0ysm6/388GPp4ges59Tf5YIP0+ts/kScO+9cwbvwYLEcYxAoXfi3RvphJEF9
	6AC8TrSug1K3lRWsNa9No/RIyLk0GyeTT2VEQH82tG0+23hBfMhLh0Xb6f7cYRnW90Xkm6h
	X9ckCR4jGLAPx8KQ7Zr+XEjMfc2WaWz17Goscpj5ePc+9RkeFlETSKLRxhytYb3GpGlcBfK
	g55K4Xp7CJ7IPay+wxNofsmxxN3+fLRCMx19wR/1gC4EC4RQkfcHptCZrsIZzwQ+VMaJBhU
	nc7xQbWH9tTK2Vd3zKjNCkKMAFBc73PmN6GgZ1G0oYD8Abdqd+uPepZE9l+hVIEJan5F73r
	QpG+CDyUBTkZVkhQUSw/a7rzhNrFspSM54m/SsejMO0Ktd1KMR53QkfdLLveKXry81VkQoj
	PPsROfdLyAiZUrtZCnvm80TXnuoQ4fS8Wz60M/ihb272fyH313zUDf/3jlLdD8YnQFd06Zo
	EOBY8DE6IWyhk3Czops1om6aISFn0+gnDKjXe/Iy0YC/9B8LMz70jwuuixntwjgnkrfFmTT
	oMgxwHjgJ1UKcLnB9FW+gzp9NxBgynwGpQ5OHLgza8H2JO3xji0GYGhgZYHpQm8gSmEzjPL
	EoYMHrZAhYvk+vJFUUtO+Xks0UPGUPM+TwY9H0Yd8dWRBXcs/Sb0YNk7UWygTaMHTpA6DZv
	Z9Llo1joQ7Rj8DSRnkS9lpaji14s9UvBkbMqu+ppkyCkgp4HIvUPb90nL4oTqOjqGhXzjS6
	IS8eANG9l+AQyQQXJO49SzEjR
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

On 19/05/2025 9:31, Krzysztof Kozlowski wrote:
> You ignored comments twice. Repeating same mistake, even though it was
> pointed out, feels like we are wasting our time, so please avoid that.
> Go back and respond to comments, then implement them.

> Best regards,
> Krzysztof

Sorry, this is my mistake. I have fixed it and will release a patch in the next version.

Best regards,
Hsun
