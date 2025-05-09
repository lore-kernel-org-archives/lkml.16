Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628A5219A7D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800927; cv=none; b=KwDpbxbN6qFOy3I7ZqIFUw71qp2kjJLrR48RKeM1gViDOQ1DMOL9gISUOWJyNqyyz+oBtbMxvFnEsAZejPZ6mqcQu9GGP2ks5u4N5uMqeJ/0xbTE0pUbQViducSPr9V0EwfRFl8Y/T6ULjLGIPQZsH/XMfkS1f3mb5XDsxCqc3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800927; c=relaxed/simple;
	bh=CgU3tjLzOyhvJq5Pp4GjEzks5l0APZ7dbooXRd0rgeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SuPIVWQbpvHfonwAz9cwvmwXvaoicJeVdMJkrE3qTveDkE+Vzu/syq1Fw4mMpBMRYR6PXmsvspIBYaonWcmcvqtglshEvjsLSoJc6cxOcXpXwnIFAp9WiwA3bCfpn7wnAqrl+hCJf2BIIS2KukMpky5d5go0q9AqKVwaq4fuas4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQtkc37V; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQtkc37V"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf7c2c351so1644975e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746800924; x=1747405724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGJa78Wq53wOh7pi/p5kq4kFJLRExrNSMcJZ7tCQjOo=;
        b=DQtkc37VaIisJfIUB7nM6WJLmTkilWMNo5rhH3OT0thZcKAO+2L/tWzZD3dH6vHDic
         8e0cDSvWmXvAPpvExSGQOaCSP/ll+/HfFWPUqPtavaDbmr+ll6t6Q1UvhjEkYQNaxSv9
         xOP5MLhewnMu4ng+Q67YIAk6OR1PBMWSFil4ylsVLg9r8DhOwOHpoMMJSbMwDXk0R4Sd
         T/cygQRRaUwN6sRPHTkdj20sxAifdcTbVKb/rJMkFfgCO7Ca/EMw+CwA6CjGLWd/l2Yc
         MkIaz3g4WiSNIW5siZihYkcigJbk9lFYiI+E/bzffQPd4QQxXDWN5zvtvkaJEO4KtHrl
         QbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746800924; x=1747405724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGJa78Wq53wOh7pi/p5kq4kFJLRExrNSMcJZ7tCQjOo=;
        b=n0FOCi5v2cagDKFJ+bVjiOQgznGb2Vf46SGt+Q3sgXsW3ATNwg/BVf7MhmO1ziXGno
         yxvxJYqTk34lVp0FfgJ+rysWtIOKJLDvtwsl6/W5aVxeeQ+JIsCXj1M7hE/vXVCO3smW
         DHW0pyYD1AfL4Qf9KlQknQPLqgwwSpXRqG4agCcWmGAprlp7pQOeszwaqFW/vCO5/qY7
         4Bu8xiNS1K25GYqw1waxgVE7Qyht+YGxm13T/Ed/P/Ll2t42JcZC4tXkCpfkNI1olfLV
         KbdWjpDlXHG8wdeJCLuPPTOv7y4gJlhmrhFglMu24JtWEhLv/sQsHsl/KDlXo8iHngf2
         16oA==
X-Forwarded-Encrypted: i=1; AJvYcCVSMZX9D0S7dyVjJDnkeBqpqFAC9bZ/nNxve/5EXEqE1Z8ug9Ln3JuWwKe7s6XeRnxmr9ncOrVnDKwao5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeENBAgXzguxN+ciC8ojaWEgZKeFKy1bQIJ9zCbq5N0EUNkcxn
	jEX9uIXcsGTh9gBR1S10/dfRlJkuc8K52LJVMI58GyEZ2ZDHZXCpIyn3oWtOEzM=
X-Gm-Gg: ASbGncvf7/qSH35pAEfq45U6Da4XKthZtB/YVIr0X5knB+lEEQfjQwNm1p+2KMUP5ti
	Y3d7jGz0o5xkL86fkYY/YfnIQjmfZ2q6MbHqvtXcm9LOP6uQGMQqiCHkh8CruZhv8peQAODVfxz
	Mbbl1bmtZEN8R78SxpsmjGbyAZYQnvos4eYhnAuusqJQBrwPefw6xDrb511prxEaGkTgokhmuHa
	UmMiYeLuHBG8gREJIS7l2cBpKk2/gCJDk+Pm7vv+d03K8WZcLXysiPnll4Lk+ryzuZsg1DW/ArM
	dyQv7NMjAC4ptyorB3GzD4R7Dr2FZ2zO9gxgWNSmlpKAuIvx+A==
X-Google-Smtp-Source: AGHT+IEKYVR9f4KNy2kwsH3spQ+bStFwlfaO9+nceNqCzdyx5f265pzrXCR2cXu644nD++9/3pxs5A==
X-Received: by 2002:a05:600c:1c8f:b0:439:a1c7:7b3a with SMTP id 5b1f17b1804b1-442d6d18d31mr10683505e9.1.1746800923692;
        Fri, 09 May 2025 07:28:43 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm31255865e9.37.2025.05.09.07.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:28:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: qiang.zhao@nxp.com,
	leoyang.li@nxp.com,
	nathan@kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Tom Rix <trix@redhat.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] soc: fsl: qe: remove unused qe_ic_from_irq function
Date: Fri,  9 May 2025 16:28:35 +0200
Message-ID: <174680087395.258053.1870729490363422870.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20230320125202.1721775-1-trix@redhat.com>
References: <20230320125202.1721775-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=883; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=fiZTHDyBdOc6qfmbBDJJ1y69SYbch4R9Dh77RsKvT8o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHhETObKRcExebKUkbIaGQ4dCmp1cl7Z+eKzDU
 2FxOq4jCDyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB4REwAKCRDBN2bmhouD
 12MFD/wKZlS5qkHWc9CUedyRVM+E7ub1Lod6PaAbk/31coox5iWvBj94XuurnOuKMUXmcfwl7rF
 +zIRQNJFPjPjkwOpJRjTwPg9vWktDjbBwQN5R64ChJnZt8N3aG2g6LGgFE/0YCOfJFzUVg8ZBFt
 62ZO1fWQod3iFD1Zu3PcjmwYvTaf+VjfI3VGUZvNHJaaHLA9OQjxzJ3ntJdV26Nf1yHtEYPWV7/
 FMHZjDxKHK0YbtTSDXeNg490LGK+pTCreHLrmjbYMkw6dz+RlV69hHcqkKzY9cZm/9wZeOs2okZ
 eG7gn/v7oAxxTESLh3rXiggeQ2P33lfAL9XVQz4dnqd+7QERPpUx64aDciyg2L42a2UQea0qA46
 W3XbvX2k9qDz1FM2bo6UNGsIi3SO/6eVgQT/4pP3+EPQcpLXjeIXWFABGWub4gabk4sNNyhzkiX
 XZ2hdozSp+Qf4G1PgSPe8YGgegbvavAT06TMWaZvmBCcIKj8W8u+ozmC6+8KVJAdNs2L8Hq1fOe
 akJTeH9uzGd7Ycd0pjjUh87ndgOeTHaIuDpoVNjEa7Mv7i6pyj8SkcOMi7I8ZyzOzxhPWKh1EIg
 qKU5+wwCNXNv2I9wmnTh6z29IndiEPrwcJQe+IGqjf917f6nKyC1AAWkPXU/nAhTXKZGgHiMUNe D03zhhwT7Or58DQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Mon, 20 Mar 2023 08:52:02 -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/soc/fsl/qe/qe_ic.c:235:29: error: unused function
>   'qe_ic_from_irq' [-Werror,-Wunused-function]
> static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
>                             ^
> The use of this function was removed with
> commit d7c2878cfcfa ("soc: fsl: qe: remove unused qe_ic_set_* functions")
> 
> [...]


Commit from 2021:
https://lore.kernel.org/all/1619002613-18216-1-git-send-email-jiapeng.chong@linux.alibaba.com/

did not apply, but this applies.

I am annoying hitting this warning on every W=1 build, so:

Applied, thanks!

[1/1] soc: fsl: qe: remove unused qe_ic_from_irq function
      https://git.kernel.org/krzk/linux-dt/c/d47f1233374597c348696c3da2142cc92a36fc90

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
