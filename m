Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ED1215770;
	Tue,  4 Feb 2025 18:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738692017; cv=none; b=dVH35GKaAnqTq6lJGmzrImjVY5MKsu2D0omxut7bsHKTsZ1xCtFZhOk7N79fhCGmfWfn13QhiJvu5fiykkbS1LYpiaNwtTIEGiZi3NH4Kcwf64sRBBlJmLwQenb8wpZU5T71wAWK/4qmWB1t1my7zHJDnzc45OrCBGNRJF1O6d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738692017; c=relaxed/simple;
	bh=ldYrvOL4QM7opLBTruDCwpZjG3E9SBjtI7Rt0cRdNQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tRQShoplGSzOtZliIyj9GNK3Hd6CRpAW15nxblFAGpw/yuFNFpOqvpfahQthp46pNYIQVkkiLTOcWhvPjfUHxQFPe21BPtz/ccSZ9y7nN5xxKRMT3V6A33d5GnC20hFGOhXCqnao+JOBh8m5BMWsxF2enudD1a3HatF29FXJVWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTNMNKQu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTNMNKQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1001C4CEDF;
	Tue,  4 Feb 2025 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738692016;
	bh=ldYrvOL4QM7opLBTruDCwpZjG3E9SBjtI7Rt0cRdNQU=;
	h=Date:From:To:Cc:Subject:From;
	b=oTNMNKQuBLaTCsJ9QNGfltm97nQAyuGNP8iaSNHab9t+HJLq92azvks1AhQdt9Wke
	 DlcuQbPfKna2SefTz19dqXKVAAOzV/gaGNStJf9BBEVmMwG/qzyEPU6hjTjdbzzqs4
	 mn0lvNN7Pi7Hm0T6T9+pR/P75jwoU7ySOUy681+XO0E0EMvutrt5360zXvQCdGTjY5
	 AHgk+owGmYohAlNhUOKTFEC3chB8xJFoqga9MU/J/RwPtNSK8g493xfUFWH86/aw3D
	 5t+uNsoioYJ4Lrg29gOlu++kOqRGc9ZMFfBUAClCWUE48sT1oCyJsGn6aAOR6MmlOi
	 bI7OzZ3i+L9tg==
Date: Tue, 4 Feb 2025 11:00:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: conor@kernel.org, ojeda@kernel.org
Subject: Prebuilt LLVM 20.1.0-rc1 uploaded
Message-ID: <20250204180013.GA3940674@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 20.1.0-rc1 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before 21.1.0 final
is released.

Cheers,
Nathan
