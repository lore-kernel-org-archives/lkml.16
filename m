Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715EF2253F0
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844709; cv=none; b=h/E16wJtAyU0nGLfJHVGliCLsQoXTpuKPen+rQgFTEfoffi+skhZ5V3QXFFlCsiFGB7t5sHsh5GDtYuDRmQxzd+Hx8YSVA8mKmJ1zlj3a8GOtYHq8WFtv8cqtHOEccq9PTHQY0sjzAusteWZiwp92tr48oYiZmqLllqeBOmQdiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844709; c=relaxed/simple;
	bh=j2/+SP498dYBjqcJI8noDs+aVA3uMMVxFoWvRVK8+N8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RiW9iKk07yy3Vne+SlO69vyyirCjgjEzeduTo1QNtx90L9kow34xyG8EKUWANa7t5QZVljE/37hozo6CZy2XVGHZCdcHbMcXb3fmhdJSjAbhT8dqw/i2mGYP/gmQIVKDfeZkz4PW67OeWs7k4S/q1dx5dldYuUDVM1vSBPKmF6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XFlCgvwG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XFlCgvwG"
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3C881193;
	Thu,  6 Feb 2025 13:23:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738844633;
	bh=j2/+SP498dYBjqcJI8noDs+aVA3uMMVxFoWvRVK8+N8=;
	h=From:To:Cc:Subject:Date:From;
	b=XFlCgvwGgu0z1zZ5felqxsS3+kcEfQrh0hThlwaGw26DunVodZksPHj5NtVGZbLQ2
	 q2kepb3s3oAMMgqrmkwwapovv+8NhXldNOp0I4XiTUDuFtF9dUAnQ1rpFTFEHsKGcK
	 1ob5mfbzGVPiMdv/WB9MD3/F3gpsuxqutTpfQG5s=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: michael.hennerich@analog.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH 0/1] regulator: ad5398: Correct SW_POWER_DOWN bit number
Date: Thu,  6 Feb 2025 12:24:58 +0000
Message-ID: <20250206122459.197985-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch corrects the bit number that represents the soft power down
bit of the AD5398. This was overlooked during testing as in my use case,
the regulator was enabled and disabled via multiple methods, such as
using the power down pin on the chip itself through a different driver.

I have tested this on v6.13, and the bit number selected here accurately
reflects what is listed in the datasheet for the AD5398.

Isaac Scott (1):
  regulator: ad5398: Correct the SW_POWER_DOWN bit number

 drivers/regulator/ad5398.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

