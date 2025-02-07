Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8DE63D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 11:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738927176; cv=none; b=Xa7ZfvO2qWqhxRXI8t2zs+l5jf+usLBnM6VCQfZThZMUfd+9prTveqERnsEuv2Z0XyzbpmFPNJ8QxCwzmxepdFqfoNUJHOkExJ8SkURRNalYH6r2kXtwuYQ5CIVYr5drZRKgEJ5ei87bAiaJW/iGm1zQ0IgWfbm7/MukNoUrofg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738927176; c=relaxed/simple;
	bh=Zbolg3PsLFDa0CGp+azUPJzrjvq7a98V8bN0/XS3ifY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XAX7GtrkZdm4scPKNnXE3XkVZTyNUctXcU+Wi74ZnrQpGAsXaUR9MWlPhTAGHltFtPzYrIEzP2QWAIPu4l3MuTUNUI4bP+AQ1l2eKETT4kuOBLQnevH6+RaGTS3800ZFmig+KmEI1ihDkDSC9BDxFMza9FfMVbxmMUl6jYXW5ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost.localdomain (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 33AAC33FEF1;
	Fri, 07 Feb 2025 11:19:27 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: Conor Dooley <conor@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Alex Elder <elder@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: spacemit: update various info
Date: Fri,  7 Feb 2025 19:19:10 +0800
Message-ID: <173892684286.8747.5832912324248040390.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org>
References: <20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Jan 2025 12:22:52 +0800, Yixun Lan wrote:
> Add a wiki page to track status of mainline effort, add a dedicated
> mailing list which can reduce the email's CC list a bit, the irc
> channel should be useful for people to communicate.
> 
> 

Thanks, Applied to SpacemiT's SoC tree:
 https://github.com/spacemit-com/linux/ (for-next)

[1/1] MAINTAINERS: spacemit: update various info
      https://github.com/spacemit-com/linux/commit/4a0c4e723c94172ae10cd6492a8a35f9aaae7163

The for-next branch will be sent via a formal Pull Request to
the Linux SoC maintainers for inclusion in next merge window.

Best regards,
-- 
Yixun Lan

