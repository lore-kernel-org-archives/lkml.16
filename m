Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AF616C684
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920242; cv=none; b=sm06R6yXqutQ3FN7zWg36vsMu3fyQvVFwdBOMnae8FA+2xuLm5cCx6wz1jgklnWryr3pjDaq4zSnv0fPbS5/IvQ3IZCTxswJQ+LnsxPFx1jCiatVSqpTK22xER8wawp+rJZoMuKeH/nDB97+CwxCtw7zFEVDE5EvYLCmJYAO4wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920242; c=relaxed/simple;
	bh=OotmR6f/3q3xsLu3f2l9TKJVJRnKtgPzQWc3wfsrkdo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ThSnip4/gvIJZRawKon6Lrf+dE1WJB5V6dlGWp7m02TForLyqVDyq+kfYn62Kw3Pa5W8I0VP2LjHxskjRh/Rg9vjI0Ffx99n7Doc0hH6orkCOXrVwHLJYu+3PErJP+ZFItZSUaRT248Xf5B4oqdYfgIkvnv0xJh0DfcbjmWRugg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5zOY6Ja; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5zOY6Ja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15416C4CED1;
	Fri,  7 Feb 2025 09:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738920241;
	bh=OotmR6f/3q3xsLu3f2l9TKJVJRnKtgPzQWc3wfsrkdo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=G5zOY6JaCQKTuPJNHM4yh0H1oa3ktqE3zNYoTV5lE+Pwm3UJ8WQQSVxOXhhH+7Jks
	 L57ylKBVa9wendT5Ba0FCiUnCnJIHpEhqyyrxVB7/2eGegFWPgUfNS6UyB+LtusBKE
	 d/aGBDpzLejEArZIx7/bLZ3WGksfVlQVTJJtPSPCYmvJt7i5Rlu3XZdVQD5R8EPWts
	 XUaFM83EfOHnhv7Yd8LxEKs5Zl7hSeECzjedvBv0fDw4esSF/p+kpDarEQh0Hl6zBZ
	 utMIMHh9R8EB/lwM13Lz2BQUa8EVrQBmO2ucjCX5UgpGlfVRJ6Fi+tmxO9pH4T3Q4r
	 D3w2PfNYnYc8g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 07 Feb 2025 10:23:57 +0100
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add support for Macronix NOR
 Flash
In-Reply-To: <41c4d4ac-5f71-40b1-86b9-ae8ee33db538@linaro.org>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-3-linchengming884@gmail.com>
 <41c4d4ac-5f71-40b1-86b9-ae8ee33db538@linaro.org>
Message-ID: <23d2dd5b30cf25090ef947f9bb984d95@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

> On 2/7/25 8:18 AM, Cheng Ming Lin wrote:
>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>> 
>> Due to incorrect values in the 4-BAIT table for these two flash IDs,
>> it is necessary to add these two flash IDs with fixups.
>> 
>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

It would be nice to have some kind of references of the part
numbers in the commit message/subject ;)

-michael
