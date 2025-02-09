Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874564594A;
	Sun,  9 Feb 2025 11:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739101875; cv=none; b=D9HfPRGoW54ek46ZKJtKjTd+ana3uIixtzuG5W4tSFVj994nfxQ/t4+d0Fb2XnMToTy+RvaUrOOa1xVSTW1Cx1+W8QVzxZRhKQZnZ9OdMJGDgcen2qzV9D5W19/BKwoh6auvaPEsMiiTSXt4OHbdYl5jsnJRXF5EzltkXa9Grn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739101875; c=relaxed/simple;
	bh=2Hp1tr96jyJyTU8RVII6RRgzKa8U4mcQc8H4bt4HBlI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Q/tze/k3Y9vWFpjb99LHFg3bV8TLNl+/ZI9u2DMzZSrRf3PrR/ya/E0UQqYlxNo/pqmA1SOjxaLYPl3uFWEduM2OnT0c7zqlkX65JGaZ5BVacOULOEmYRsdZ3muCw1fp35reyUAU/crJwUkUU4MdQKsRnbIlnM5BO+g0dbtmzRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=EDuZWUfR; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="EDuZWUfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1739101559; bh=2Hp1tr96jyJyTU8RVII6RRgzKa8U4mcQc8H4bt4HBlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EDuZWUfRgcVuDAQzosZXk6pt2V/pu4PFnB/8Y9QQ4yXpQxbieDyq4lbcEd2Iyunsq
	 QmcUkBPfM0iMH0ITirgrqhUKmPYkf4+jgoBdaHiRjLY1blSVGRBDSEUs/3o0BNamic
	 BZAvR4/xGKZ4F1hYhs/LC2jYr2BCSjr2C44jcgNU=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020.. ([2408:8459:d061:698d:6fa9:b5e6:266:b48c])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id B781FCFB; Sun, 09 Feb 2025 19:45:56 +0800
X-QQ-mid: xmsmtpt1739101556tmbw6rqrp
Message-ID: <tencent_881F52CC4B090D613A14738CF4C5F665EB07@qq.com>
X-QQ-XMAILINFO: MqswyhUqVe0Cl4GnNTbROT0SPfkCWigcEd+D3WDtpxfnwp5IPLflN333/ffaE6
	 6ay3PI3rbwG6fNYtHy8tVccl4UgQfxJonAlJhRQuRfS2/nF9dxmG4GUkmQGCXKwfo6+p2wAmcGio
	 YSJD5vP1NWdPNQW+yjlsn48aA+meCaR0fcp1NvpbUfHt9aPClQP7JvNbS62Azwk1bhW0GBz8mmiL
	 rOm6SGhhlcNmigszRSSzRChREZ4ttb8t7FjOaf6ji5HLa0gQw37oMP471NGBo88rHfvzqmSQEm1N
	 SrChV+GkLm0D+MOaRsUSyIEWMJXqHBLZak8KdcQt/RH/mhFGKn3/5RfasDKmqWNtgCEEw8nua38g
	 gYan75q/i7y56gHewc8Bl28IydQ/3EmvAbdYthMI9L9qNmWlFcUbUDQYvPXL+g9QIdN5pyYdMwAj
	 vcumxPf/f1qK/p1nflWH0fdzqjtklVqw1DDCJDwpcsbIAfdZpMm5WXRVxZBZV55YSRjRqCJzk5WI
	 vI0CXzzlYQXhp8iHqXBPLD4pgO/tEJQP1i2RzICqItupNMejn+zBgSqsTw+EyqkiZMBtzhwEbB82
	 QqVj6+aViytKtuAeqGyqjz7LMY9p5pVAVcnMj5Ub9O7ac8N96Vqxj0w4nOpu+XEZA+PfYgCNHyf4
	 UlWN4k7PCJYcU/ljuahX0ezIfr4aRwPuAupzxiGVQEf9uTFJVgqLVeHiEYOhoktyvJNQk1HbJyPB
	 4/BlqH0/pgoNtwLRe5GsSIY9RV1wBGTJENnlAXQzvisda9vUCyREp9oSlBNq+n8LiHMrltRMAnPZ
	 4qWLA52/jg5qDBh8GWvwfsCIbNW2oINQn8RRsAGn9jWrBPoGEIFiBRHIeHOTFSljt8R1/gJhEyF1
	 hzxCh7YkIE7cxPT0VJ0VObXwgzUs778d8Q/GkIFw45qicu7Bpx4YffCFRnsoXllPGCH47J1YIgo/
	 4KkFhrcLYcIywiI9jD+rIUXlfG37OJ3/W+IPDD5X9v2v1TNXc4Tg==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Guangbo Cui <2407018371@qq.com>
To: daniel.almeida@collabora.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.mco,
	boqun.feng@gmail.com,
	boris.brezillon@collabora.com,
	dakr@kernel.org,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	me@kloenk.dev,
	ojeda@kernel.org,
	rafael@kernel.org,
	robh@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	2407018371@qq.com
Subject: Re: [PATCH v6 1/3] rust: io: add resource abstraction
Date: Sun,  9 Feb 2025 19:45:55 +0800
X-OQ-MSGID: <20250209114555.11395-1-2407018371@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130220529.665896-2-daniel.almeida@collabora.com>
References: <20250130220529.665896-2-daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> +/// A region allocated from a parent resource.
> +///
> +/// # Invariants
> +/// - `self.0` points to a valid `bindings::resource` that was obtained through
> +/// `__request_region`.

Doc list item without indentation.

Best regards,
Guangbo Cui

