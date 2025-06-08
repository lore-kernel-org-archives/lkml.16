Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96B08BFF
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749387194; cv=none; b=mlNN1p0zqjn6IcPlEhjimV5yK2XnpPzuwcVkXJa9OYXRrj6jO+7rICCXFdaLCwEUIWAuMDs9xlGJuqi11Doi9njsZmau9glE7n6z9/j9pK3GjIQO5ojkgrGG/rMo5zlc0v61M1zPqLl0xu8awKrdtG4lDJXDJJtIXnzYpmRhlYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749387194; c=relaxed/simple;
	bh=WpC1dLFp/Wi7G/2VKn3FpcBmL1fZHH1R+LC1nGQz4XI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OPLiKtMSMB33P/yJul3uWpDM6i9VV3bcgGhxeuHxeO4GrNUqhU/BghyMREK6mniYqSGALlRz4eCOmmHKOFRxjXTKqo0f3s8yEsXbOPgsEfDGrV7/3lzuUOAz6gHB6I1mFIL8Q9e5lWQ6TMOUj2arVdRpD4Le73xBn9GtOlBObRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEOYUUuk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEOYUUuk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96240C4CEEE;
	Sun,  8 Jun 2025 12:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749387194;
	bh=WpC1dLFp/Wi7G/2VKn3FpcBmL1fZHH1R+LC1nGQz4XI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QEOYUUuk+I3G6jM3pO9RbfGR+898/w4Y2pN+fZUPsDAF7cMV4QbNu3agrdZVs8ksy
	 rzcRdp9kjzmyg/fZXivBA6+weCSANn1fjyWlZJX4B3rWpTHwH//u0OF9M/siuuJAJs
	 apiab57LHQQknxKuae3NVM5pQaBefaJTxGKuqfkV76ZEFGeC5csCU6tF689OBRE9Xl
	 GjeeCbFie3xoWRhcsunj9slesLHvP9ASIvCdd2CmDv4iQmdefAjo05zc0jbtmyJqKV
	 IqajMtvPVrw/VFrLy97AMTmV9KvBiuoK767UXHL8Q2B8s75iovH2h8azzpZk0wgo01
	 sPzPSBWhz3ahw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Cheng Ming Lin <linchengming884@gmail.com>,  tudor.ambarus@linaro.org,
  pratyush@kernel.org,  mwalle@kernel.org,  miquel.raynal@bootlin.com,
  richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,
  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
In-Reply-To: <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
	<20250407075400.1113177-2-linchengming884@gmail.com>
	<d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
Date: Sun, 08 Jun 2025 14:53:11 +0200
Message-ID: <mafs05xh6pf7s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jun 07 2025, Guenter Roeck wrote:

> Hi,
>
> On Mon, Apr 07, 2025 at 03:53:58PM +0800, Cheng Ming Lin wrote:
>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>> 
>> Many flash devices share the same ID but have different part numbers.
>> To avoid confusion, the part number field is removed.
>> 
>> Additionally, since SFDP already provides size information and
>> functionality covered by no_sfdp_flags, these fields are also removed.
>> 
>> Furthermore, when 4-byte address instruction table is available,
>> the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.
>> 
>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>
> With this patch in place, some of my qemu tests no longer recognize the
> flash chips (MX25L25635E/F). Do you have a suggestion on how to handle
> this other than avoiding Macronix flash chips when working with qemu ?

Could you share some logs? Does the flash fail to detect, or does the
SFDP-based probing fail? Since this is qemu, it would be even better if
you can share a setup/reproduction guide. I have been meaning to set up
qemu for SPI NOR testing for some time now, but never got around to
figuring it out.

-- 
Regards,
Pratyush Yadav
