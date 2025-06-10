Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F259283154
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749590528; cv=none; b=NFpPjtRQ8mkjxFA0ap0hrwPNAnGoT/kgmAvPxzEyKNwJKwUil6APV+t7etPjvusS3lokMG3JCgy5RYpi17KAtrwiU/Yy+JCI0VmxjiV1TepMCAsUyaDlO4CLl/1aIgdZiBgTpvrc75JahQD2YOaPWcrGbhAIDqSUC/z+z4pnJyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749590528; c=relaxed/simple;
	bh=B0YSvzV5hnWs1AEK+pWpyZzV2VeygRyc9IWlMiMpMbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uH1VulxCtWFbSPVnL7pLQslB5eJ68AEjulbFbGQW9ksjqqM42IcZAn8faZkVyTyVBTc7/CNx7A7wzd4TG3TJWx+/cTqHcavhSSX1msNJMBn0qoj7ZoKJSTm/fzR3bGs4jPVZvznvYbPGbsiXx5tRcEw0Fah4c46mr4vo75+qfSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQYC9Pqm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQYC9Pqm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6920BC4CEED;
	Tue, 10 Jun 2025 21:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749590527;
	bh=B0YSvzV5hnWs1AEK+pWpyZzV2VeygRyc9IWlMiMpMbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQYC9PqmbW5p1oh8X57UTtE+rRJ5bKiY9Vh4fWdkUD+iKrtTcI1HXD6e5AWgHIUBK
	 FYzEN3LCdQqnltDuDbePJs3UiMm3qE3Y7Jy4ZDkgItJKyuLaYa/2yGck+/bQpAA+23
	 A3Q+savxruF52QoOWd7Qi/BwwvxyeUyQirwgurkfjNj+HnvT/bdjyM7Q3FdRAsPyif
	 e53bT0lT1y8Exw/qqLainr3MS/lwEzKMRKMiquo3hUSlIcxc9yzRughlZxkJTTWsp4
	 nveLunaRLFrJe2OnYb1X7QLspwwPEHnuQR2Fr+TTOd0IGrkJIdKRASXStkqkFfR5yw
	 5S2RguNX87F3A==
Date: Tue, 10 Jun 2025 14:22:05 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 03/13] objtool: Disassemble code with libopcodes instead of
 running objdump
Message-ID: <ixcq7mocz26ckbqhcncv2uuakqnpi3n5p47eopygdqoucl6quy@v7khswzpv5rm>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <20250606153440.865808-4-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606153440.865808-4-alexandre.chartre@oracle.com>

On Fri, Jun 06, 2025 at 05:34:30PM +0200, Alexandre Chartre wrote:
> +	dctx->disassembler = disassembler(dinfo->arch,
> +					       dinfo->endian == BFD_ENDIAN_BIG,
> +					       dinfo->mach, NULL);

These lines should be aligned like:

	dctx->disassembler = disassembler(dinfo->arch,
					  dinfo->endian == BFD_ENDIAN_BIG,
					  dinfo->mach, NULL);

-- 
Josh
