Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAF12AD20;
	Sat,  1 Feb 2025 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738404548; cv=none; b=RqaJbj9ppujbKLvBq53toqCjeUUyYWz7MHr3p6GS7M2MXMBik2QA1oy5/BaE3KkVPdR7dj6oeLfgeoSRZ9b+A6Xt4w16kTGCRnJuPgwb7Hd7+mjeipeH7mgIFxZYgkXkCoUJSZmQp015bxR07U4SMaUHtHzKyJcMT6L3/vf7T+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738404548; c=relaxed/simple;
	bh=L0axFcIy5Xoe6iG8d7Cd2aoy/JITN6qhqoWOqTx0ndY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLydilHaB5S5YXXndzZOl0a1EtV2W0N/IHjnq25QkxW/hwZ7oKZJASVAmzthjlhVmMwPr2gWkw0bzETsnkBs4dlYrORlYdPW6GTTR/gpZL7R6Z8X41W5jMM7oB2OJ/Zv0X2ha2m3jcS4ddMTwo+0pv1t+YQTqTdo861ur104cX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 511A92Tw006238;
	Sat, 1 Feb 2025 11:09:02 +0100
Date: Sat, 1 Feb 2025 11:09:02 +0100
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] selftests/nolibc: execute defconfig before other
 targets
Message-ID: <20250201100902.GC5849@1wt.eu>
References: <20250123-nolibc-config-v2-0-5701c35995d6@weissschuh.net>
 <20250123-nolibc-config-v2-4-5701c35995d6@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123-nolibc-config-v2-4-5701c35995d6@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Jan 23, 2025 at 08:37:40AM +0100, Thomas Weißschuh wrote:
> Some targets use the test kernel configuration.
> Executing defconfig in the same make invocation as those targets results
> in errors as the configuration may be in an inconsistent state during
> reconfiguration.
> Avoid this by introducing ordering dependencies between the defconfig
> and some other targets.

I didn't know these ordered dependencies of makefiles, we learn every
day ;-)

Acked-by: Willy Tarreau <w@1wt.eu>

Willy
