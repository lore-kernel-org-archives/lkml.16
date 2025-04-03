Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932AA24EF6D;
	Thu,  3 Apr 2025 14:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690859; cv=none; b=RjDf4Ef778a6p/t+8CjBGtBaAdLWTB7gfyKa0M4JDoKruNwGHJDvJazFYvkDF7H5Jwauc+SW4vFMrjU4YKXuRB2srltHpcD/HnBghbMSseV0du3FPY0HqrT6g70my/XnCcFJ4CX/Jx6b/7xwF690clSDVlPRDBPtLpPhD3ARFQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690859; c=relaxed/simple;
	bh=9nhBH1ry74CQ3LyONta4ntpwEyT1Zw1ubPBWNa5MJbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M1/dU4C8sgH0l9A3yQY5W+5KkaF0QcM68kArOR+XC9uLln0ByfunWGyCp8DW5FOxsztdL0RqNHRLU3EyVYGm6+98sjGLWdTztdDdArQiWp9oDy+EsFx+73pTMCNJM9xdpkj7w7e5sOmbpkJe7a4ivqaHGLQHjM/GUgEKCr6Hk9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=iyZmffwu; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="iyZmffwu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1743690854;
	bh=Rr28166uaXmjmRSWl/gNWhkMkGMEc//2Jf5V3S17AO8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iyZmffwuj0pu9Y9ST91vW9AxgCQ7pQD7whv3n3OvCKfhy2CuFieKEhIW/nmKq9E2T
	 jAf7EJ2KGaHEFud5dTjqAncq7cCEAssPmOrB+A0MjFhk3YApu6JG9kz2OnfTt9bm06
	 ipxwRhvHd0RQMCe7qqqrzneGxzxBnwNxGvel7nhnj4omP8kXAhYayi1oUQ7G9c1y61
	 007f8GoJ8ceppvJ1Nz8KzgQoPqevKKS22gqi7bYBfUm2dO88d5lZVzv64ST3Anw9mn
	 tyDxTAtsKJ9EUuZPU3fzspH5UBVK8vQLxaIGBTUwErfkxOFkVQZVcId5+x4dO4FhvK
	 wkrU8aJx2O56Q==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D6ED17B352;
	Thu,  3 Apr 2025 22:34:13 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>, 
 "William A. Kennington III" <william@wkennington.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org
In-Reply-To: <20250401235630.3220150-1-william@wkennington.com>
References: <20250401235630.3220150-1-william@wkennington.com>
Subject: Re: [PATCH v2] ARM: dts: nuvoton: Add UDC nodes
Message-Id: <174369085137.3191483.5593938005824189048.b4-ty@codeconstruct.com.au>
Date: Fri, 04 Apr 2025 01:04:11 +1030
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 01 Apr 2025 16:56:30 -0700, William A. Kennington III wrote:
> The driver support was already added but we are missing the nodes in our
> common devicetree.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

