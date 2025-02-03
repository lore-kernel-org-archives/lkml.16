Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617CF2080EE
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592908; cv=none; b=THCkvnwbUGJW56m4tmnahFdkdcOCLZw76mIckPl+PnFWROnaVgwHbehR0dg2jWDynUfhs8uhFAMrDs1Xc6vu+sueupefNWrwoKcaq7hA7I82bpxA+KnRGsf8AqG+eMOMUitJ5+ZvCpT8Dy6mlcMy6RVhvHN/osK6Y5RDfov/MB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592908; c=relaxed/simple;
	bh=cGTnJdwkADCS/rsw+snLIpAnNc/xI/HEQqbTpUxRrdU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=umimk+KXsx8Ngv+540IVbMO646o4feACT/82aKw92n3L4Qfu63JhN5nGMe9nUNa8fMo7pUAWmtc06VQW5rOtFxCsrB5ZsbVZq91u6Y57RZaPBbRyOUcarfBocDpU3lkYU6X6oanNgsPGbVq3jgQR0RDi/5C1pIOJFvlYdZ2hw5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWvVy8ZX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWvVy8ZX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CA3C4CED2;
	Mon,  3 Feb 2025 14:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738592907;
	bh=cGTnJdwkADCS/rsw+snLIpAnNc/xI/HEQqbTpUxRrdU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JWvVy8ZXcUlFWjwfOFHkUHB3NZFW7Gp+jIKZwmIUKsPmBmP+zi7u+NRM2dJzw/iN5
	 JnPX2AyU10+g5P7ZgIwOwHIvBJ1pak/sLiVWRomeHQRdEbXzKf2/E8hQq1p7f3cJZx
	 h3rA6xWdrnFqxh+vupLcpUK7vcYK28aP4ipiWyvi8l6V7KCj2xcbptuhdZs2nx3fQG
	 AnEgaFLw09ewRbKVM7fA8vsQwtxm8HPe+uxaD+E4L4fMEtrbK+XditYhexwv+/QIAG
	 B2kez2jGwRsfNw9zWTi9YIK0evJd4H4PPMZD3cdFmkqAK5mFnndn6+4nvcH00m6YHQ
	 lDbsFFL9C2iHA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: winbond: Add support for flashes
 with several dies
In-Reply-To: <20250110-winbond-6-12-rc1-nor-volatile-bit-v3-0-735363f8cc7d@bootlin.com>
	(Miquel Raynal's message of "Fri, 10 Jan 2025 15:49:29 +0100")
References: <20250110-winbond-6-12-rc1-nor-volatile-bit-v3-0-735363f8cc7d@bootlin.com>
Date: Mon, 03 Feb 2025 14:28:24 +0000
Message-ID: <mafs0a5b3je5z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jan 10 2025, Miquel Raynal wrote:

> Some Winbond devices are made of up smaller stacked dies, like for
> instance W25Q01JV which is a 1G-bit serial flash memory made of two
> 512M-bit dies, and W25Q02JV which is made of four of them. Internally,
> the dies can either be in the active state (only one at a time), the
> others being in the idle state. Problem: there are commands impacting
> all 4 dies, for which we monitor the state of the chip reading the
> status register, but the status register only gives the status of the
> active die. It was observed a possible internal deviation of up to 200us
> between each die when doing similar operations, which can lead to
> races. This series aims at supporting these chips properly.

Applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav
