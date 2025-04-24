Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889D079D0;
	Thu, 24 Apr 2025 03:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745466562; cv=none; b=iwNPpq4W4lGx98PGDvJWYDDlGHENcAOTVt7Ch4uiGNO0BSh15WuyTTOtFJUaqzqaGy741wQ6zW8w7HwjuDYJpVsYt4Qk03qQ+nRG3JJep3RbjVpHxk1D8dMEyBvtDCbmsP+PU2AbYg+FUzjrHBDcG/xcrQhnov7dSI4AR1nWyCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745466562; c=relaxed/simple;
	bh=qiBm6zIwFh426W1zp9XIoJz1GMAkurpZnR3ybgJH4gc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HpKDbtfqUCxFV7K0uxqhCcH+sWgLvSIQnTZls5heoaFzXf0tcjj8Sds/5BZLcE7XYaFm5sxAuTvcDdZRrDv9CHltE5AxOUUIIG26TtZKxdmfmL6veQPvUoSd7QcQT/8FzuseIOjkl8riVPgxJvHIS4cQwMvbsutYTAgcARJRC3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxs9KT5D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxs9KT5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8BEC4CEE3;
	Thu, 24 Apr 2025 03:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745466562;
	bh=qiBm6zIwFh426W1zp9XIoJz1GMAkurpZnR3ybgJH4gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cxs9KT5DIPkgDRWW/4BrtPeXRvDHlb5CwO4AzCugypuT7W7aoT8shFU2JpBVrsEhA
	 lkdxpRKCaWUQeVQ2e9r3W9Z8v5Zc8DrIYh9SqU2U2/B00pXFJHGTXYXswXKSyb3/us
	 qFJHSuNnYIRyV4nGp/i1o8WDxhpTnH063vKwYce/AJxU7XFCYyQsFEce1nO/Q7TycY
	 XiDQdALm9vQQdTRx5w8LDVzEYwNpSeUUT9TFoUCd/KJ8ltnrM6UpOpv9YIsRaJ/ZI9
	 t/YptrmpcrV5yDlr14LXe0hC5qGJg+Q2+FqSQztohWKfHhWZTttxz0hRwAjsIoKeeH
	 fWPOzp+NC7QyA==
From: SeongJae Park <sj@kernel.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	linux-debuggers@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-toolchains@vger.kernel.org,
	osandov@osandov.com,
	paulmck@kernel.org,
	sweettea-kernel@dorminy.me,
	liuye@kylinos.cn
Subject: Re: [PATCH v3] tools/mm: Add script to display page state for a given PID and VADDR
Date: Wed, 23 Apr 2025 20:49:18 -0700
Message-Id: <20250424034918.48530-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <973db2d5-4be2-492f-844c-a0f46c9e588f@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 24 Apr 2025 11:24:33 +0800 Ye Liu <ye.liu@linux.dev> wrote:

[...]
> Regarding compatibility across versions, this is definitely something worth
> paying attention to. Currently, the script is being adapted based on the
> latest drgn and kernel versions. If future changes to kernel structures
> occur, I plan to patch the script accordingly to maintain compatibility.
> 
> That said, I’m very open to suggestions — do you have any ideas on how
> we could better detect or guard against these kinds of breakages
> proactively?                                                               

No, unfortunately :'(  I'm a drgn newbie user and trying to learn ways to use
it better.  I therefore thought this problem could also happen to me, and asked
the question to know if you or others have a good solution.

> 
> Thanks again for raising this!

I'm so glad to hear this. :)


Thanks,
SJ

[...]
