Received: from gbr-app-1.alpinelinux.org (gbr-app-1.alpinelinux.org [213.219.36.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5814E275852
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.219.36.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379200; cv=none; b=M55WLYMy0GDZrhvdDXU3sV8OorowVx3g8HH7OKffPtXMD9NPsAryNOEdLKYwCodZir21jFsfXDFpQYRYNN8bLZByZ6GsKh5Kfh9SxoTqFd27LbAW7ElJF63EXZe98rfbONXMeikKq8zDUJRvRRFgKaP8sDIKKGkmE9x00YYEw+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379200; c=relaxed/simple;
	bh=Zg3PTbWHNLypaVroQqWRCPRItq2RQXyBU5YVvdtYWwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EH/xNtMZ7X79THfN7bxd5Q13qLf9HGdihk0/3McnydTHsDdh70FdZsan/Tee3n6yG7RynAf/M+IsF7aj65a5fkv4BM6YDxwi6xEeYf+VV4kXIpFM1aEWpiinWrOF34TBX2PbJlKwj4oE7HHXcnsw5TtTYhWXY1wExJEEhwsTOrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpinelinux.org; spf=pass smtp.mailfrom=alpinelinux.org; dkim=pass (1024-bit key) header.d=alpinelinux.org header.i=@alpinelinux.org header.b=ORdHVku8; arc=none smtp.client-ip=213.219.36.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpinelinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpinelinux.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=alpinelinux.org header.i=@alpinelinux.org header.b="ORdHVku8"
Received: from ncopa-desktop (unknown [IPv6:2001:4646:fb05:0:4470:81ef:576c:2941])
	(Authenticated sender: ncopa@alpinelinux.org)
	by gbr-app-1.alpinelinux.org (Postfix) with ESMTPSA id BC1012257EE;
	Tue,  1 Jul 2025 14:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alpinelinux.org;
	s=smtp; t=1751379194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zg3PTbWHNLypaVroQqWRCPRItq2RQXyBU5YVvdtYWwU=;
	b=ORdHVku8k85wserfmr5gZdDf4yWRLuexnePajY0KPny0UEhbewc1adFQjYZ03vtrzCY2X+
	P8IcBFsV0cX7wFseUKVEe6Iy/z1Bx2w+k455svNktlm8ud+db5F1CytaEPYw/vz60Kashq
	W3pP0EC9IgQFZt6KP8oe/yzwSsixlO8=
Date: Tue, 1 Jul 2025 16:13:09 +0200
From: Natanael Copa <ncopa@alpinelinux.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Achill Gilgenast <fossdd@pwned.life>
Subject: [REGRESSION]  (build) kallsyms.h:21:10: fatal error: execinfo.h: No
 such file or directory
Message-ID: <20250701161309.0f7984c3@ncopa-desktop>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-alpine-linux-musl)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi!

Commit c104c16073b7 (Kunit to check the longest symbol length)
introduced a regression that causes build to fail on musl libc systems.
The regression has now tickled down to stable releases and is currently
blocking kernel upgrades for Alpine Linux.

There was a fix proposed[1] which has not yet been applied, and Greg
asked us to get the fix (or revert?) in upstream first before handling
it for stable[2].

Since it appears to take some time to get this fixed, I wonder if
we can revert commit c104c16073b7 (Kunit to check the longest symbol
length) til someone has time to help us work out an acceptable fix?

Thanks!

-nc

[1]: https://lore.kernel.org/stable/DB0OSTC6N4TL.2NK75K2CWE9JV@pwned.life/T/#t
[2]: https://lore.kernel.org/stable/2025070104-ether-wipe-9c19@gregkh/

