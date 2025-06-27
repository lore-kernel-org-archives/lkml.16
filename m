Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EFD266562
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026113; cv=none; b=JlWoRdnbUvnuFAU9/A7BfhI+7thLj+tDqOn+HH4q+MXgfZheYODTf7Nd1bbX6L8io4rcPchIen5f6baeqqXH4jhqDngXdbFup0EOcPkiot0z2oV3UwmSf2Ui3nDZvSxtlEgowruUj7jxgQHxCoQV6TLtevyVc9LesVimnmE+78U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026113; c=relaxed/simple;
	bh=bosySage1v8mvmttftw+jB5MVv9HlIxA9qcOCsluLdQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GF9P5C0+ISW9XIAbafFT7O8xLBqw8kwDW1odp0qoxUuIW3ALMyP4sJ/oasbY8brxlslzXbMwtpUy6WGMvanoivOJMb/5DQB+MZ0RFLqOz2YRXk2gX7a0XWlLMvq5VvoK/hM0cHi/Qjzm75+CHexrc0HCd+A1lfW6hbX0uu+F+aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kk+XsKaJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kk+XsKaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0ABC4CEE3;
	Fri, 27 Jun 2025 12:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751026112;
	bh=bosySage1v8mvmttftw+jB5MVv9HlIxA9qcOCsluLdQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Kk+XsKaJwpLwgvLO7wh/dtaVOiBvgw1rtfYjjUWkNn6u86aiKb+WiYLX3K6rzMKKJ
	 +JrmfY85rxEGf4boyy4g/2K0UkblFsO3Eq5X/xOMQaw6cvmiaPHfCkjgEGmKAoBBX1
	 xpYC8K3xNHdKMqTRQbOmVjhDIVu9Yt4XgtO/YPPYOLCwU/95hFBav5JhekJLdRWnpd
	 UZ5V2+sHUPsVu2klB2oGQenc7niCK0P/AV0VmGVlzQXCTbLmu+kygo4mHEObzPA7p4
	 tJFxpHfeTA7JfEauwJDn3gKYrES3nEeYI1U6ePUtqRylApduJhQyLu27Bmrlzxj4yI
	 MPpJh/E5nB0vg==
From: Srinivas Kandagatla <srini@kernel.org>
To: linux-kernel@vger.kernel.org, Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: darren.kenny@oracle.com
In-Reply-To: <20250615135212.1356469-1-alok.a.tiwari@oracle.com>
References: <20250615135212.1356469-1-alok.a.tiwari@oracle.com>
Subject: Re: (subset) [PATCH 1/2] nvmem: core: fix memory leak in
 nvmem_register() on error path
Message-Id: <175102611159.6832.14617431798504418373.b4-ty@kernel.org>
Date: Fri, 27 Jun 2025 13:08:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sun, 15 Jun 2025 06:52:07 -0700, Alok Tiwari wrote:
> Ensure that the allocated nvmem structure is freed if device
> registration return error code.
> The missing kfree() caused a memory leak when nvmem_register()
> exited via err_put_device label.
> 
> 

Applied, thanks!

[2/2] nvmem: core: Fix typos in comments and MODULE_AUTHOR strings
      commit: 98addb97db5d86ad18c831241c03f180d269438f

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

