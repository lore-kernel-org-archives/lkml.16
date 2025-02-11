Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9F71B4243
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739281460; cv=none; b=OwOXml11tGf8imlfaNQxkKZplPV/WfQfCYj4gARTu1rigIfKHEk3F2bwuEBbh9fvPub1xwebrenCVhkMNez+v4d5BQisCW9yvq6VpRDf/GXmAcvQEPaKsOu2+LcJDWnO/U/XFlG1rHgj2b/bgkMTWdWsaBIAQLKG9LUz50Ss7R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739281460; c=relaxed/simple;
	bh=cNIqnWlSdJlb/cWl0lhUjOrguvJfMWF42XXBLdpiKDo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=just2LFRRjlRUEN5ucBgb89m+G9nlPViFcpDaz8jX+lC5d3iQ8Rh5zH9HwLMibYgkXpi3z7wG92CZ79YTE1RSReV+/Q5vCq9RVjgtmZjR3GAOp9XltSUa7xeBD4eHGZjyoddE+3cV/5Uf/COqx2YAAXzej3isGnrzHJk5YZvSvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBTK1dia; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBTK1dia"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0055C4CEDD;
	Tue, 11 Feb 2025 13:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739281459;
	bh=cNIqnWlSdJlb/cWl0lhUjOrguvJfMWF42XXBLdpiKDo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nBTK1dia/scbUf0NY4IJ8OQlUgiJ3ei2vXdq1ZRI1MzZTYvz8TWPlqxaOFyGT71iz
	 GEzjmfNTOOvZWTF44mc+7poqr+lWJmRV78nlhVaPBfLQkWvo+a6j3v/F8Xk6Y8ptIr
	 MpUPwwplVCKD9txWo/HpLN5czUdv+mG7PAV4n+mv0eP4cW5Wyxsy3ShrKOINicsUWx
	 9ar5TfSKdtc3PlPiVMkPpLtNgWWNmdtOxCSYldecibx2am24s+PKax+KZqPWvdv/VY
	 rcfBnQ6K9TuDkV9isDrxXCQ3q+5R3+wqqFtRKQmYA7Z4bWLBDhbITTtY2YUjbnocf0
	 o7EVXrJwfJV7A==
From: Lee Jones <lee@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>
In-Reply-To: <20250205122536.631252-1-andriy.shevchenko@linux.intel.com>
References: <20250205122536.631252-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] mfd: upboard-fpga: Remove ACPI_PTR()
 annotation
Message-Id: <173928145856.2165632.2289570185161116455.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 13:44:18 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 05 Feb 2025 14:25:36 +0200, Andy Shevchenko wrote:
> The ACPI ID table is defined globally without an #ifdef check for CONFIG_ACPI,
> so ACPI_PTR() makes no sense here. Also note, driver depends on ACPI anyway.
> 
> 

Applied, thanks!

[1/1] mfd: upboard-fpga: Remove ACPI_PTR() annotation
      commit: 22e8cd7693c65775147be81e8ed39a52305f6fc6

--
Lee Jones [李琼斯]

