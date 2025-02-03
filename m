Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD2F20E336;
	Mon,  3 Feb 2025 18:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607384; cv=none; b=d8O2K/lnhR4MDCh7Uiw3S2lZy99pk4RhqfjQmSPugre6+1YQrmcjuBmCbDUS0rZjh4uZX70HPh4yUssm7hgghxpnol7bmPx8E5OWabF09yoiJeQFr0k0etkFM9aHiR95X4QfvSub01xd2AK1GDIWuB8vwOJw1YgzZvXZoW2Lj1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607384; c=relaxed/simple;
	bh=qRZxlpd4Gjd4SsniUYUOya9umzIMcHMSm2EG0mYUboY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+6U+0/kg1eqQQSJ7HnG50lFUDQhmneaNitJOMTW4kYBnhr6N/QgEp86gDyREaNAQHWJvKAW9ztaTFtv913jGZnjW+9BBYoGHgGVMYSF4in+En1+L2abV1vqunV9ZPsvgYk/4OIXbzNjk2UGTLKzcYOiYQi5yKqxsJVKiA2cedw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPIS7YKj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPIS7YKj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B795BC4CED2;
	Mon,  3 Feb 2025 18:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738607384;
	bh=qRZxlpd4Gjd4SsniUYUOya9umzIMcHMSm2EG0mYUboY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPIS7YKjG7u+XgKlZ2CLHlZ0bSro1K0vrhcQtm2hbBj32M1MY6j7UrEtk49eRN469
	 KJ0Hbe+uaoMq2dAB3dKmaqiw2vsRu1o7sllIyKXF+Lk4NijIida2+3tqIlPjYg42IB
	 TIDWJnDnh1PvbDdQw5QfaLjU7NTZ2Q3f4QQlP1qhh8lSB9f9rIaFmGoythsb264mKq
	 0DILWube6NuE9Y6+G64anwyOpIB52aN6OIXifVg9GLJC+xzC53Z039M2BQsV4xdgtY
	 59bFiSRNFttZzFQnTL6SYVtF/uSFJFonqaBVJrPptVBsbQzy7w/ajsNSdohmB0iNgd
	 CfwMlvwjhAVMw==
Date: Mon, 3 Feb 2025 12:29:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	linux-kernel@vger.kernel.org, monstr@monstr.eu,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	Conor Dooley <conor+dt@kernel.org>, michal.simek@xilinx.com,
	git@xilinx.com
Subject: Re: [PATCH 2/3] dt-bindings: xilinx: Remove description for SystemACE
Message-ID: <173860738199.3354889.11453485220913055293.robh@kernel.org>
References: <cover.1738600116.git.michal.simek@amd.com>
 <7ed73455057a5b3ffe9ba00ce27654c296bfdda7.1738600116.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ed73455057a5b3ffe9ba00ce27654c296bfdda7.1738600116.git.michal.simek@amd.com>


On Mon, 03 Feb 2025 17:28:39 +0100, Michal Simek wrote:
> SystemACE driver has been removed by commit 2907f851f64a ("xsysace: Remove
> SYSACE driver") that's why there is no reason to keep description in
> xilinx.txt file.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  Documentation/devicetree/bindings/xilinx.txt | 9 ---------
>  1 file changed, 9 deletions(-)
> 

Applied, thanks!

