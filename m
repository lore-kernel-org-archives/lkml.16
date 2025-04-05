Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305E520330;
	Sat,  5 Apr 2025 20:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743886643; cv=none; b=n0+0mzUdopC2Fxadi6P6eUf+YAsvm/YQ1+1fbYIG9T4WgV5kWkwJmHo0gGpLRP1EoZPI07/OG6wkPapRyI4pfWVmWHa/fU5UeOri9GX859kbIFxNt8u04MyFp1TTvU2Wp8+ku46hEb0GbvYOtVjaMWkpBsRm74ajmt+UJxnOoOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743886643; c=relaxed/simple;
	bh=Zet3Ay+Y2kSnYHJx1jRJwqh3eD2HJm4ptgSsSIOrzzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwHsu2VCYQ2G+mb1qYDeF1on5zArBLjiV0VbsMus+tbGd4kneKTm0LZYp41UqXSGwNMydBS/AXWLKX2VobUvOLBdWqYtTldSH84EBC5etFvI+Cmz6Za6x8O6fV49DVzauOgF1HPtf5PC/TvosF/2C1iIu5UNVmYk4LxdulFYQFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 535Kv0wE018056;
	Sat, 5 Apr 2025 22:57:00 +0200
Date: Sat, 5 Apr 2025 22:57:00 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: Re: [PATCH 0/2] selftests/nolibc: only consider XARCH for CFLAGS
 when requested
Message-ID: <20250405205700.GA17877@1wt.eu>
References: <20250402-nolibc-nolibc-test-native-v1-0-62f2f8585220@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402-nolibc-nolibc-test-native-v1-0-62f2f8585220@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 02, 2025 at 11:38:58PM +0200, Thomas Weißschuh wrote:
> If no explicit XARCH is specified, use the toolchains default.

The series looks good to me, thank you Thomas. For the whole series:

Acked-by: Willy Tarreau <w@1wt.eu>

Willy
