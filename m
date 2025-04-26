Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B5252F88;
	Sat, 26 Apr 2025 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745664496; cv=none; b=ArvNrZ+G1HF63cKmwY8ZZZeyFqSCZlXzL3a0Vp8QbLZt7w/DK9BX15FWfyqPOQ3edzNx1cv9MGfuay1STbySdo/gZYDslFtFiQ+/VXqhn2Y4FdM2o7NOMo0uTZipsqGCP81OROEnpiwuLh9LsVQ2Of5CN0b5AxFVvnsq34k8dKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745664496; c=relaxed/simple;
	bh=jUD+WsFp4tg9bqt2jHb707OV1HIiSOX7AYGgiMcqCpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJX7Yd3at0K3vVPxUa2UFW06UxkUBorNEoGh+ruk2SdSL37/qHM8vPoV19DvygKXUzBpK8kP6PVM9bieLnhIWmBgxHfPswFKN90SNrTan0Rvb3qjtDnJ+FsTSXUD++McjON+ieGRRKSNM/vEk1PxIlslwCDojXJzUEf+2JahaAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 53QAmAsH018755;
	Sat, 26 Apr 2025 12:48:10 +0200
Date: Sat, 26 Apr 2025 12:48:10 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 12/15] tools/nolibc: add namespace functionality
Message-ID: <20250426104810.GE17549@1wt.eu>
References: <20250423-nolibc-misc-v1-0-a925bf40297b@linutronix.de>
 <20250423-nolibc-misc-v1-12-a925bf40297b@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250423-nolibc-misc-v1-12-a925bf40297b@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 23, 2025 at 05:01:42PM +0200, Thomas Weißschuh wrote:
> This is used in various selftests and will be handy when integrating
> those with nolibc.

It could be useful to add a small note here mentioning that the test
takes care of the optional OS support, and will run it only if started
as root.

Willy
