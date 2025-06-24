Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D9926ACB
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745573; cv=none; b=mGaPzfxSd2nD6CnczRt0TAfNiMcNIpjM1OYiTkbKw5pPjCvx5vrF/GtJ+E+OOlv+B6UfzgYqu32wyKWmEJAyihoR94FffneZjwEhvovjozYDzkym1giabji4yKavI1Plo8eTxH5RD/6xvkU4gxeOMhPqzBrZWzKsz7G9BmlvrzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745573; c=relaxed/simple;
	bh=WiidramzayasQSNuFTF66fqVrFNicrOJ+Zf/EoTCyBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ih82T7ewK67kPQZJl8js33AxYfR6va4scfBuorwiep0JouwQLnVx7Zn6FH2eXdq7Rv072FeRb2ePh5NBv6RtOATIbvy+HDGwBBLQmIGbwRhrA684HYjWyUkQ50QSjLHb932gnfC3+O7pkSxPOtJdZ5HLZIW5BfI2fj7jnf9HFEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55O6CiKf030931;
	Tue, 24 Jun 2025 08:12:44 +0200
Date: Tue, 24 Jun 2025 08:12:44 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: hide headers_check command by default
Message-ID: <20250624061244.GB30919@1wt.eu>
References: <20250623-nolibc-headers-silent-v1-1-f568facf014c@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623-nolibc-headers-silent-v1-1-f568facf014c@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Jun 23, 2025 at 11:29:34PM +0200, Thomas Weiﬂschuh wrote:
> If V=1 is not specified the executed commands should not be printed.
> 
> Hide the commands by default.
> 
> Fixes: a6a054c8ad32 ("tools/nolibc: add target to check header usability")
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>


Acked-by: Willy Tarreau <w@1wt.eu>
Willy
