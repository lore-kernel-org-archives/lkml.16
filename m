Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4617470807
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271773; cv=none; b=gZGSM4QleKzadv2EpDudEgJGDQUhAff6Ec5dzuVZNF2JR0gFCMJIsDpvfJWWrIZauOAQf/zXRBAThf7lOXG6w+mhBdBbwGdiA1JsM0N2dCk4FPw9UTTr4JejUvZQ4+DDRgqAYVRZMXULPxAaV6qQjiJoV/mjgrrQBe93uKwi6hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271773; c=relaxed/simple;
	bh=ZT4G12wefUcykpMEvckbzgQ874X4vZCquiLKUUKJExM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RWnGwXZOwuj05BXtieaHceUa7+awJj/Wv5WMnfGQrSmRRFzeDozyjd/65Z9jZRU1n/zUndBnzpsINPzvXe2jZm8BUdE5l2W+rWKEv4DEVgF2WifbjzM8guEPJ8AZOHr35mSLg3bJFb/DLrIZ/PEgsPveDEl600SNRZukC2IYz/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oflqkrHP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oflqkrHP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FECEC4CEDD;
	Tue, 11 Feb 2025 11:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739271772;
	bh=ZT4G12wefUcykpMEvckbzgQ874X4vZCquiLKUUKJExM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oflqkrHP2MDENTEAj8eO9cpraEnhFcpfTYWNtBa3c7x2PxaT0FT+8g95WXpj+vrsF
	 sGzkg1fbAg5uU5eaeSqcGURh5wgiCyRQnaRGcSFsafelDda4h+9I6YyvpT5IOnSLAa
	 /RWRQxNmWCWEacZTb4NugdEIwT2noKklYBrcE2f1loO/uCphKZx6UfPOKpjDxzMLpf
	 aLTIMw3djvvs1ye5XrdiueK044bMfj9Ou2D1TfA4XNtb6uvKIL/oV//ZDxndsNl383
	 /f8YX77XfpfsBeatuFuXMl6gaBDsoqSmi9eFsHcEQo85wQZLmUkDmbO3FXVRqFXA0T
	 xU6qcM1Oy0y+w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: spi-nor: use scope-based mutex cleanup helpers
In-Reply-To: <20250211-spi-nor-guard-mutex-v1-2-05ed77a484d9@linaro.org>
	(Tudor Ambarus's message of "Tue, 11 Feb 2025 09:30:54 +0000")
References: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
	<20250211-spi-nor-guard-mutex-v1-2-05ed77a484d9@linaro.org>
Date: Tue, 11 Feb 2025 11:02:50 +0000
Message-ID: <mafs0wmdwyc9x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 11 2025, Tudor Ambarus wrote:

> Use scope-based mutex clenup helpers, it reduces the code size.

Neat! I didn't know these existed. BTW, s/clenup/cleanup/

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav
