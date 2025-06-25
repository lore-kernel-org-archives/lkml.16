Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E905329C33C;
	Wed, 25 Jun 2025 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846376; cv=none; b=vDSZIt5mIs6EaNJiPZW4TM0z2ejwixMtq7BFeCGW8HAm3tp7LdcH4NQgLyO01ecDCqFSsX1DnTP1J8TekUJP/y5mEz+jLvP8RGuPBKFsVfVDiAhMchEBh1l4HwdnPPhfpaKDsd3pJeRGODdEYJX/3QFRKk4K14pvQ0GyOhQmJa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846376; c=relaxed/simple;
	bh=rv4hE/m/Wwv9+Rsy/pnGUhoU5nmf/1y40+chIyXMyv0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gcNJ/z291kze2kOOCyilzo6OIbK0dixoobuCt7pmEz/lIEkTKBmhE31MNmH8sRfBkReUYe4ws8+bk8bVb2AHMQ2yeuF1xGB+AWqQDUKaGBR5e91LPSPNEYCKGWZJpu1hIdEi+rOLVq3qyP0C+wXYR/4vIcu2wFuey3gwuqNhc4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/mW6RBZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/mW6RBZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE1BC4CEEE;
	Wed, 25 Jun 2025 10:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750846375;
	bh=rv4hE/m/Wwv9+Rsy/pnGUhoU5nmf/1y40+chIyXMyv0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T/mW6RBZt5ciP7aI9XEA9N05GdIoAnIB5BaU3KQv7LWKru3JxxaIy5Sazp0K7y/WW
	 0vQ0jp9XirLit8S8ccnIue5DyOQ38Oh5r4Q8W2HdsEtQMTkMUU1YE9Xew/Vvg3lfGd
	 3iAKCNUVLIq/MQ2EzsGoi7EnaFsE3v+Wftekn2MDjfxKcUa9i7xKBXKmyZFv6pKntr
	 ghEVjery7pBTwdF6mtdUIy/xe+ixT0etgccDqSZUzk+YbdHNKlIEzzBJaUSnZo6RN6
	 dPAIUgTSyPzrE4D2o+rJNlT/BLB9xLYKsOjGfVSrwoRFYC9blu395uu365mmDozAlK
	 oq7f84UN0ciEw==
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, Lee Jones <lee@kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <037e28e587ae899da9acdb45c606d75ec61f858b.1750501700.git.christophe.jaillet@wanadoo.fr>
References: <037e28e587ae899da9acdb45c606d75ec61f858b.1750501700.git.christophe.jaillet@wanadoo.fr>
Subject: Re: (subset) [PATCH v2] mfd: rohm-bd71828: Constify some
 structures
Message-Id: <175084637440.4142064.15452160092046627411.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 11:12:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Sat, 21 Jun 2025 12:28:38 +0200, Christophe JAILLET wrote:
> Several structures are not modified in this driver. Constifying them moves
> some data to a read-only section, so increases overall security, especially
> when the structure holds some function pointers. This is the case for
> 'gpio_keys_platform_data' and 'mfd_cell'.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   18321	  13952	    192	  32465	   7ed1	drivers/mfd/rohm-bd71828.o
> 
> [...]

Applied, thanks!

[1/1] mfd: rohm-bd71828: Constify some structures
      commit: e905ffecc34f66c35c9d3209fe5b111686adc28a

--
Lee Jones [李琼斯]

