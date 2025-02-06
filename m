Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3796922D4E5
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844576; cv=none; b=cBI8XNDOkTiLdqUFzNjaE9zk844FRFfI1Kf8j08CO9J1EWVcuZQaBLiaQw8xuad4lAZNbxvoXjfOsUewKds9mrYQtFcVBEqT6c2vTvxK7UJ0kuBJ6GZXl0f7rRVmY8lB16oNulhif4DMVL/URISmEDl/Bng4obgMwGqe9pdugKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844576; c=relaxed/simple;
	bh=j2/+SP498dYBjqcJI8noDs+aVA3uMMVxFoWvRVK8+N8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dLRkUYc888nw0m98SwjVNKg3JjTuN4HvO9nFChos6DaXVfrNWrU6a/Y4aYTHoNDHLk2UUf0beY6AWR2Zl5g1IJI8JbesNbYQRDhwu4PfswYzYPPbltRcpAwhiW0whzUJ8emu5K63YhFOv7otOm/bQM/9fJVySw3pMxNjVY7rSVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V0gii+aC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V0gii+aC"
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9528C1193;
	Thu,  6 Feb 2025 13:21:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738844498;
	bh=j2/+SP498dYBjqcJI8noDs+aVA3uMMVxFoWvRVK8+N8=;
	h=From:To:Cc:Subject:Date:From;
	b=V0gii+aChbSbRI0spPIeHzBS9I+qY1uD3sIVgtNaw7i5LTVnzzddZTShvA/Xnf+a0
	 mfpp84KylZhgONHUMXJs0UyAnIgq7fzxD5k2ldJoeL7TRcZqtwJTBgP0jW646a6BUC
	 rmFnGb7+DMIwbQ/xDgdmoTGWiat4V8YvKTaj1d+o=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: michael.hennerich@analog.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.com,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH 0/1] regulator: ad5398: Correct SW_POWER_DOWN bit number
Date: Thu,  6 Feb 2025 12:21:36 +0000
Message-ID: <20250206122136.197793-2-isaac.scott@ideasonboard.com>
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

