Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5A940C03
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 03:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745121540; cv=none; b=ViEvr8rLiBP62/vJqncluVeF7Mzm6hy8Jsgq+u0hKkQk7kIrwy81hYWGqgqLTlfC6Qz2VZdjuRmbC6pUy1K3c3soOOo4tY8DJBDPfeUlPqzxPM4gYRajaUHKDmn1S9huF2b6tL0p5PDoZmVuRcsmnA6Xr6qGAeIAW3i8aewTZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745121540; c=relaxed/simple;
	bh=GjYv17lsIQFkNE3wU81F8CYHhwKdnIq/FRnHlWZNNWw=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=lazFALIQDblXlTs88cWVgGLRTarrpa0iYBxXal97R1IQ3Rw7mqcC+pNLHGfRGINR75knbHXJmUgJzIyDQXEQJDQmH+r2ylbH+nmaH6bgaX/vLOzn1RgII+tYf0HvY30kf1gX48f9OIbLUVtSDdLKV0MZYf5UIlY2toE5D36z3t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZgF9L6Z0sz501bS;
	Sun, 20 Apr 2025 11:58:46 +0800 (CST)
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl1.zte.com.cn with SMTP id 53K3wkKO030019;
	Sun, 20 Apr 2025 11:58:46 +0800 (+08)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxl2zmapp05[null])
	by mapi (Zmail) with MAPI id mid14;
	Sun, 20 Apr 2025 11:58:48 +0800 (CST)
Date: Sun, 20 Apr 2025 11:58:48 +0800 (CST)
X-Zmail-TransId: 2b07680470f810e-69b31
X-Mailer: Zmail v1.0
Message-ID: <20250420115848388DXE4HgOnwCNl4IjrMloB6@zte.com.cn>
In-Reply-To: <20250414063227.97035-1-ye.liu@linux.dev>
References: 20250414063227.97035-1-ye.liu@linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <ye.liu@linux.dev>
Cc: <bsingharora@gmail.com>, <linux-kernel@vger.kernel.org>,
        <liuye@kylinos.cn>, <linux-mm@kvack.org>, <akpm@linux-foundation.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gZGVsYXlhY2N0OiB1c2UgbWFjcm8gdG8gc2ltcGxpZnkgZGVsYXlhY2N0X2VuZCBjYWxscw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 53K3wkKO030019
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 680470F6.006/4ZgF9L6Z0sz501bS

Hi Ye Liu

> Replace repetitive calls to delayacct_end() with a new macro
> DELAYACCT_END to reduce code duplication.
> No functional changes.
Please CC akpm@linux-foundation.org and linux-mm@kvack.org
next time.

I think it's a good idea to use macros to reduce code duplication in
functions. So what about also use macros to define
void __delayacct_##type##_end().

Thanks!
