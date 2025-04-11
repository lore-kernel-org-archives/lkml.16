Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011A020D4E1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373464; cv=none; b=bAXYNwVWQwxAaUkKH2v+pJNlcrJklC7Js90vNivz1OySwWNBmlyc9Pb03iIBgivDpihoYYJx9oFIHPKDZUcdO/t7dxDynqOJNhMNlHGOATjfRd3LEE50qxl0X3xPdlZUKQeqOyceszRSqXD6h5XtjnNj/+dnROXkKvnGg4Rmk08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373464; c=relaxed/simple;
	bh=EVla19k7Xz+stoAyJo+yqYuYF6XV6eRPPI+AlLJ62TU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bAfmmtBvwbv7Tf7Utuc4bsHeKymTFdC3Lb5WEVYc97LcAvyAkH+IdKYWMNhEQ/2pYZRjgKLOwk1z/xasWy5Mii/5IeD/gUCV0ZN6HT4mL6j7QdouzS5/3pVUOtLSaDCst63nc/FzNHAptrJ8fdv+YyyvudVX4PbxA90Z2NPwMnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qT6QbywF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qT6QbywF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478BBC4CEE2;
	Fri, 11 Apr 2025 12:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373463;
	bh=EVla19k7Xz+stoAyJo+yqYuYF6XV6eRPPI+AlLJ62TU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=qT6QbywFqYsrdZFdqe20nIlTmNihKMZ+lrEgG5/C7gEaUewM5LBELkTBrqpdZjuRI
	 O/DjsxQpgNfd2xZrhmjeGVszCnpmAFkEgA40zr4Nhm9ZsGgIzup3Qir7rbxSSTpL3Q
	 xpGU7cToXWwkXxApwWT3pxdwEwwnzu1ZY3U3ftgWvnKiK1IGW78X6c6kVAVQ1l/REu
	 RFNrCBsL0tHgiXPkCRBdmbGrpCLc3j82Yr9wXGp1HtaBQAdF4j1DKsmrmdfA5XssOS
	 gjXithieX0VGwQFLQkNqVLZwNguljxQcmOgMTbf62mw/LL7k4lusUfSR9xMhoacxKC
	 euYyM3VAwNCyg==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anand Moon <linux.amoon@gmail.com>
In-Reply-To: <20250410133332.294556-1-linux.amoon@gmail.com>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
Subject: Re: [PATCH v1 0/6] Messon: Simplify error handling with
 dev_err_probe()
Message-Id: <174437346092.673939.9321583863717790007.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:41:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 10 Apr 2025 19:03:15 +0530, Anand Moon wrote:
> Use dev_err_probe() for phy resources to indicate the deferral
> reason when waiting for the resource to come up.
> 
> Note: The following patch for RTC:
> 
> phy: amlogic: phy-meson-axg-pcie: Fix PHY creation order in axg-pcie probe
> 
> [...]

Applied, thanks!

[1/6] phy: amlogic: phy-meson-gxl-usb2: Simplify error handling with dev_err_probe()
      commit: 05457917e50c3d6bf75d2e3b99c7e6709a4a6844
[2/6] phy: amlogic: phy-meson-g12a-usb2: Simplify error handling with dev_err_probe()
      commit: 9bff4ef29a6409850c27df705da54277a8e836f2
[3/6] phy: amlogic: phy-meson-axg-mipi-pcie-analog: Simplify error handling with dev_err_probe()
      commit: de39730f9258e9984892c0af68a3e884ad19acea
[4/6] phy: amlogic: phy-meson-axg-mipi-dphy: Simplify error handling with dev_err_probe()
      commit: a77e2e899841937798bff0924c03d4d0e4963aa3
[5/6] phy: amlogic: phy-meson-axg-pcie: Simplify error handling with dev_err_probe()
      commit: fef364bd4c9cf712c91e0013f5f304f4e7f09198
[6/6] phy: amlogic: phy-meson-axg-pcie: Fix PHY creation order in axg-pcie probe
      commit: bdeff6d8a211c832f5ce1a65aff17f4a5e6de00f

Best regards,
-- 
~Vinod


