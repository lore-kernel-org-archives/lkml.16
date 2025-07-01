Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D272741DA;
	Tue,  1 Jul 2025 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379952; cv=none; b=AREH4bu5PQAbJJSj2rNH8ydEm062/agD9CvAHYmXplQnUp+oK42h2z6qkgEjjL9nHyGHei6SOGQi/+buvBRfZ+sTmVIp+yZwtcCjg/hjfsnBnKPVJidOLBQ5qvLzA7fp4DfNXRlD2WWp5mfEViDfx5cycHhIpUX9kDV1DBBxZRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379952; c=relaxed/simple;
	bh=fF2bUOzQpSBOFHuNq6Eq1S5hjtfwAl2FI5HwXhvyjlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTfYfZNlQ6uu4fKj4dXCEMm1IujIQdyicf9/q8TcTEbUzUYhGT4kC76EXicF6zgBabGE19Bk5hMiv9s1z6du+8FHM/LpdiwFYuClWOubLSyflv0IemWy+y+EwLPJ+EZBRE0T511ZyYyzuqDtadQa/U3VOen4RSPA+3cQlwzbwck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WHijCkm8; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WHijCkm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=kwmVPhn9mAUb/E0fy/YUOcKm0G2pKmKkb3h1UWnAPoY=;
	b=WHijCkm8X4zEyATUdjLnTIncBkFZDH6Y7W6eZQ0HQA133zLDcNxiMRqcKXZft8
	fK3Rc89t7WyZZioVYcCqfZyk19N0o+y7PP3aZKH3ZhpF1NJfZqYbDr0hteJzP9H5
	z+RbOs/Nj+8/j6hnTmb+DPOFF8u+xkcY8AYtMANALs/0M=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnx6S_72No6tsBAA--.4315S3;
	Tue, 01 Jul 2025 22:25:05 +0800 (CST)
Date: Tue, 1 Jul 2025 22:25:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/6] imx8mp: add support for the IMX AIPSTZ bridge
Message-ID: <aGPvv+PNpm6xwsmC@dragon>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
X-CM-TRANSID:Mc8vCgDnx6S_72No6tsBAA--.4315S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUrcTmDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQR9ZWhj6tENkwAAsz

On Tue, Jun 10, 2025 at 12:01:46PM -0400, Laurentiu Mihalcea wrote:
> Laurentiu Mihalcea (6):
>   dt-bindings: bus: document the IMX AIPSTZ bridge
>   dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
>   bus: add driver for IMX AIPSTZ bridge
>   arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
>   arm64: dts: imx8mp: add aipstz-related definitions
>   arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

Applied all, thanks!

