Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4411F13B58C;
	Sun, 20 Apr 2025 06:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745131809; cv=none; b=VZxPvxaC37B21CM4D5roPgwLPgzIk/CbE1LK3iIqEdArUrlIGm+FRxuCucd6CZe5OMfEYCcWZKS8RHr4J4Q7qSFBOZUFdRIWO1czC2gdQu8vsMvvWFDeL1HPzBd/Rq0bOW47SlfzjarAjmBAjEJH0vtmDokm8sXRVsj3FtURADU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745131809; c=relaxed/simple;
	bh=fDADJArvnScxLm+H6E0s/rHtXcdd6ZSCjAGH3r7Ubx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqBNjs/GA9CAvTfxsdnbI6GVhDi36/Fek2D1f3/pEgwERf2Uh/j+G6ErxYvv4gnpKvebhsvxSz240WcAhuKxwUN0vJm3KJCR9MsRS8ZmrxaFqfw+bX9QmhJJeV0RxACh9kp9fuYwVF6/8CJfmyrBRmj92juHToBqWZBjjvnKoWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=glHv/EdC; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="glHv/EdC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+QJ9NHLxM5cKGmlBqUB8NrH5+0gyVL46oxlgUr/6MWU=; b=glHv/EdCI9Dz2oRyS76ax/VvbG
	8uRmaulVjGifHAsMFzLksxC3zoTT338J6/joLYfhFAGAgvxCLmVPqlLdByIGrv84Xa/kTCuPrWJdP
	mPC++farY0Sme17+x5wo2o1oRmP6RWOpgmUCNexgumhT/P+VsisTfG16fpqKyBvohCtKcViXX+R08
	8tMIuEekUJu2TF/GxdMPjffhTlr8wdL3bWOr4SjwbUVjFMdUiGLIkvkeMmndJlqPUHHgr0rghl9oZ
	xrIKqWrnj78YEiWAaOdwAvfpGpBSLWGYOhuypV0qIZACT+d1T11Ee5jNRmDmZvGXRd/EISaFDSUrb
	u0IbsyMw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6OVA-0000000BvM1-0Bmd;
	Sun, 20 Apr 2025 06:50:04 +0000
Date: Sun, 20 Apr 2025 07:50:03 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: fs/namei.c:232:6: error: unexpected token, expected comma
Message-ID: <20250420065003.GT2023217@ZenIV>
References: <202504090937.ZGGFamL2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504090937.ZGGFamL2-lkp@intel.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Apr 09, 2025 at 07:23:35AM +0800, kernel test robot wrote:

>    fs/namei.c:232:6: error: instruction requires a CPU feature not currently enabled
>      232 |         if (get_user(c, pathname))
>          |             ^
>    arch/mips/include/asm/uaccess.h:97:33: note: expanded from macro 'get_user'
>       97 |         access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
>          |                                        ^
>    arch/mips/include/asm/uaccess.h:177:23: note: expanded from macro '__get_user'
>      177 |                 __get_data_asm((x), user_lb, __gu_ptr);                 \
>          |                                     ^
>    <inline asm>:4:2: note: instantiated into assembly here
>        4 |         lbe $3, 0($4)
>          |         ^

Wrong cc(1) options, perhaps?  CONFIG_CPU_MIPS32_3_5_EVA (and CONFIG_EVA) are
present in your .config, so...

Looks like that's one for mips (and clang) folks...
