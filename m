Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF271F4CB2;
	Wed, 25 Jun 2025 19:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750879124; cv=none; b=f7N5iO00la+vsO+1ZCHxj0gAQwDZwqkm7dCL/jb8wpD3cqqWgPGq6srM55GatrrimNEiks1ZctqCIVAz9QWWCg0MvCRd5SusAE0gP8QHUXi2iSXiKD5ATLb4pre99on/BmjHPG+CMyGWSUY0u6eOutWlpEZBJxErJ9oO5JofxDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750879124; c=relaxed/simple;
	bh=sdblDTJQeyz1sgDktyomJDYPmm5GeOMZa9+3gI5xP4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJaYAWkuUBPnIVwwvUmB5F3hMBouHOz+ryme8lWlUPPBadRVoFbuoV58m/k4aM9Xa4ADuAJdD2T5FbfN9sITDa6BVV1hGZaFHvDyDO48d0tPBnJEARMCRuu+DDFSIo9sdGABn8YBjnuvxIH1sgAFeM55Bkxj5HI9ewD/Rl3jRjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMkfTvFd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMkfTvFd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A4DC4CEEA;
	Wed, 25 Jun 2025 19:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750879124;
	bh=sdblDTJQeyz1sgDktyomJDYPmm5GeOMZa9+3gI5xP4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EMkfTvFdV+1RCOOjIOnMSYy83hTNxVY4pmMA3Mkk3+BNWG6M0ec7wwejXLru4xJmg
	 u4p6JP/MCoCsek0UQD1+qa1ZOvL7kMtG7waWeaTOmuWSEfQfhiLXmThokvGC/OujSD
	 A5jK4umV58TzixgC4XGR3hLxYOFHogDdUm6Oy/AredvnutgvPZww/Iq9ZrEnz4SUfV
	 19eGBagAKDHCYLdjld8OE8e6pjUz3SeysvWW35DoCuAVuGtjHYvcNZ2kkPPBHwIllE
	 5OcTKwXZYHXnZvccx7JypqsAyagkpakxTYnlN0b+y9aax1VQukYQEqet8xvuWninSt
	 Nt16HqbHT6OBA==
Date: Wed, 25 Jun 2025 14:18:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: genesys,gl850g: use usb-hub.yaml
Message-ID: <175087912235.2066138.4582983176405795807.robh@kernel.org>
References: <20250608-genesys-ports-v1-0-09ca19f6838e@oss.qualcomm.com>
 <20250608-genesys-ports-v1-1-09ca19f6838e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608-genesys-ports-v1-1-09ca19f6838e@oss.qualcomm.com>


On Sun, 08 Jun 2025 19:07:30 +0300, Dmitry Baryshkov wrote:
> In order to reduce duplication, switch GL850G to use USB hub bindings
> instead of using simple usb-device.yaml
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/usb/genesys,gl850g.yaml          | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

