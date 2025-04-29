Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C7625E804
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745955450; cv=none; b=Z3zzn1d9Wck8r7SQ6Z9NYOoaa25/WMCOghEPpXHO3zzKf/vcv2v04AHG5ljMAs4xCGkzWmCZdGQDFm6B8s9hZ9Le8zOIGYAOhsF/PMnvKy7MS0Qi2h+fkRmwjuI2easwwp6M7UFxYuIRDcv2eMSLLcgcHpHhlFnmaeceASh8QNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745955450; c=relaxed/simple;
	bh=kj3udJEQoV9Tt4bQuPrsENB1voFa/r5mlWekwEe2qCk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OfxEfi3trglArnHRIOhxI/+vC5a3SAY4Y9DioozwJaasnfEPQw6sxtMYz4vcI2xUqvPMHJfayehaV7A1BW0hp2cLZwgUrlIcQVhLTBMPgeyytxamxFJMjt0qap+oVxc5BVB0KLAAE3Xxb1xH9DrboCWYSJjqcCRLXzV3sZxjLVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSZ8jVEV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSZ8jVEV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD97CC4CEEA;
	Tue, 29 Apr 2025 19:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745955449;
	bh=kj3udJEQoV9Tt4bQuPrsENB1voFa/r5mlWekwEe2qCk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aSZ8jVEVv7OYNctdAo7+AGPLKkQgI9KYuR4mKRYWq+OJ/afdapCyJK9toaDOPZNXI
	 xa57mIVZGsGDbAUn4G6TaeRdFi0b1IZVyaIRphdj0Kv+9l41VkH1VIFdcNGREEC/TA
	 7xD7wQNZiGVhXQRliK6QVkVV92Fi6TB25RdFkiMnGZrF6KoNWOh43rgjdm3JP8MHv7
	 h+FpP4rE4oo8hicvVLg6UMM+R068HF8zIiG9qk9+0qNYra4TASxuZfMFk8gLC6L9fN
	 hC0InQ2aLth1eSouf3SWghgqtsLutoaUdIIdZJhefyEKJOSaMf08iSGrQTQPrJN8vP
	 OrbRLheFIUw9A==
From: Srinivas Kandagatla <srini@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428150831.4001255-1-arnd@kernel.org>
References: <20250428150831.4001255-1-arnd@kernel.org>
Subject: Re: [PATCH] nvmem: rmem: select CONFIG_CRC32
Message-Id: <174595544748.30657.382533239786356243.b4-ty@kernel.org>
Date: Tue, 29 Apr 2025 20:37:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 28 Apr 2025 17:08:26 +0200, Arnd Bergmann wrote:
> The newly added crc checking leads to a link failure if CRC32
> itself is disabled:
> 
> x86_64-linux-ld: vmlinux.o: in function `rmem_eyeq5_checksum':
> rmem.c:(.text+0x52341b): undefined reference to `crc32_le_arch'
> 
> 
> [...]

Applied, thanks!

[1/1] nvmem: rmem: select CONFIG_CRC32
      commit: f1a714e1cd0d29f7b0ffa5ec404784aac15e9af4

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

