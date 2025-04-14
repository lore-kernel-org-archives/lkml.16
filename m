Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E6C23D2BD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642860; cv=none; b=OOxGJoUeGmh+fSvFdePuyQxi5n8uQFJO8l6V4WG29OHMFXCoAY2YeMwplOEPgZuh/Vr+ehYHMZPaIVuyXLXoBrc3ULkIxC4SMrt1Fc+B2n3A12l5eSbRxAYU1ikCqvSeebRUSnG0TLd2q/5HkD/o3PVUK2ZlFYGBV+6IxMKvwDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642860; c=relaxed/simple;
	bh=e4j8O/8ZHu8onOaKP9iGDUgsNXP6aniA46e0vk4sRAw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QZLG38N9B2+KXfVwM2yW1/e2H6CpRK96eazRatfXryOgfF1F2aR9dw2HyKcgUHBPgVmphSRvF5VCFxR9b6ljdlBe+zRTe2hpouWcLQgqsybs8yGhpcAsSci4V7i153CCz4hdoLyI2aAZEzGBzsac3wI6DhAWJFhCFw4bOijG9AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Gg2pbYMP; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Gg2pbYMP"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744642854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e4j8O/8ZHu8onOaKP9iGDUgsNXP6aniA46e0vk4sRAw=;
	b=Gg2pbYMPki5MNKxZxI/W8oEEQZd4Bzbn+rjcmbhOBZMfe2qbOZn9XWgeTkYLdizQS//hSe
	XEch+HoxGjy87bemeTPTX3EH/z4+sb1tf8P812zIrLF21ZH7aarlq1ArY32x65HlwWc0wS
	BT8L80r8UbuUAKYRSS8NnF0nkfw5wwU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH] staging: greybus: Reformat code in
 gb_operation_sync_timeout()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <Z_yztGweLAfJgwXh@hovoldconsulting.com>
Date: Mon, 14 Apr 2025 17:00:41 +0200
Cc: Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BF2CF4C6-5381-4266-9E49-9C81E9604007@linux.dev>
References: <20250413104802.49360-2-thorsten.blum@linux.dev>
 <Z_yztGweLAfJgwXh@hovoldconsulting.com>
To: Johan Hovold <johan@kernel.org>
X-Migadu-Flow: FLOW_OUT

On 14. Apr 2025, at 09:05, Johan Hovold wrote:
> This just makes the code *less* readable.

I guess you prefer the code with curly braces?

What about the Linux kernel coding style [1]? Specifically "Do not
unnecessarily use braces where a single statement will do."

My patch just removes any unnecessary curly braces, resulting in less
lines of code and no line break in the memcpy() arguments.

Thanks,
Thorsten

[1] =
https://docs.kernel.org/process/coding-style.html#placing-braces-and-space=
s

