Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E3C221281
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751315122; cv=none; b=ef4PC6agiIajQyRzN4ErSi04WURCJ53/Tp4eqiGUVDcc3Xy0aeiPFwcFQ366APZg+jLjqqTsbBXOvP2oP/zxivbVUAGtQrwtKQQvbPw7TjpfYIdH3Ojo79EJuDS6qN3pSmkTfuq9bUehyoGCV1JyZmp5HEppLr2Jb21W3zmXe1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751315122; c=relaxed/simple;
	bh=Wd8iVGImoZ4KGRRGZ13eWDlE5yPes2wVWWgg3oEX5Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IInk1iAXHmnzNY8QyB7cNMpenA4n3N/OZ7UYLXE7Z0ulIAJRxIjpwK/hA9YN6VJeE+bR8rGzObWIgdS9/UTeI8LxDzzL97YHGYp61NO7DZx3/PrCVbbbC/1P1DduQNccGNNz3DaSDQQ32OhZX5eHOFJWq/oo7l/cnyM6b+8s3mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AanQbKGq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AanQbKGq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751315118;
	bh=Wd8iVGImoZ4KGRRGZ13eWDlE5yPes2wVWWgg3oEX5Ic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AanQbKGq6x5chkKHukUYTWUa5+xgfPTycnCZpb6z2wyDIj79tWqot4YXh9ZXuqIqJ
	 GFWb198SWE8r57/NK/uQRNl6/kte5dyNbNFpTbksBc3W3MMcSEplpF7aWF0ix8laxq
	 EVDqUaRnYjH9wEWHS2oiQpTVH/6+VdUf9PbHWzZRs7Y9tRqFkFZqPzf9uRD6SroyNN
	 fU1hYwbfVQiWTqVQh4GvatwDk42ecfgMF6myQCuv2uXs1QU1PPin/PzdPZJFhpuwgk
	 sLPg52hDC/B4sctOhukETQBdeh0wMD1A+t4s4cs1c8cbXeL1iCaEmdarTg2qUfzyRY
	 AcmSmyaCwngmw==
Received: from localhost.localdomain (unknown [92.206.120.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gerddie)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE3B617E0342;
	Mon, 30 Jun 2025 22:25:17 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] drm/etnaviv: Add support for running a PPU flop reset
Date: Mon, 30 Jun 2025 22:26:26 +0200
Message-ID: <20250630202703.13844-1-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618204400.21808-1-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear all,

this is the third version of the series to add PPU flop reset. 
Changes w.r.t. the previous version are: 

  * initialize the PPU flop reset data in etnaviv_gpu_init (Lucas)
    - consequently drop the patch to identify GPU earlier 
  * also test feature PIPE_3D when forcing the flop reset (Lucas)
  * move a few defines around and fix formatting in some places

Many thanks for any comments, 
Gert 

[PATCH v3 1/5] drm/etnaviv: Add command stream definitions required
[PATCH v3 2/5] drm/etnaviv: move some functions to a header to be
[PATCH v3 3/5] drm/etnaviv: Add a new function to emit a series of
[PATCH v3 4/5] drm/etnaviv: Add PPU flop reset
[PATCH v3 5/5] drm/etnaviv: Add module parameter to force PPU flop
