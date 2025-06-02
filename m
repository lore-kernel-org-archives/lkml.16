Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEA11DF268
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748871265; cv=none; b=V9xTOCiFzmZSK1NZVjoMhSNSjwXfnuUvmh9XbV+gVmc5irAt5GTB1gr499kA8rxepmbs+6ktcq+rm+cywCKiilVNFnpFtK3uQrvfh0vRP+S86AdP/dPx7uk3TuqIIcuttBoHg+dxVhgi6t9pRjgOeq3OYAlMlsBu+FNMjJRqTbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748871265; c=relaxed/simple;
	bh=iAh6tlKS1N0yngy8kjpSeyHnxmLqYSaMj8n7cngvNEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UtS6DVSwrjS8UCjvbXO5OSrWqTPdgUUNzkRr8DS39fsMS0AXhv5EnMVBs1PBPU614xBUA7IVvdD7yUDYZmQL4FnnlSFVgxY/UJdL3EuEftoYTRa4QQ3cwDBK0evNJT1ztLYfxH2b0tDISssY+guBUcsFYf8yc0RGaY5uuL6O9uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=bRWrLpN0; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="bRWrLpN0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=n35nHQ4NhydIY8l0tQbb3fopghEWL66avIhylOL1mP0=; b=bRWrLpN0Ffka9JN39TJJ+IjgdC
	1yoWmkbO2mb+Om7kyycmcvnKMrFgbgjDEiperDHtXJLJLMKmEQ43wecQjhQI+EYo5uLm45gW49KZl
	E89bcu6AUBewtVk0Xly8CzhKFaUkmB3dlOoNPZZ0xZUwb36kXBwk8uWjyIQ9/U15XTS5GQZuBwvYJ
	36trOwW7TahGCwzazr3CP+7NU5YoOGeR8lH/6Rlh7Vre6xYOgGhKADX4mcUHaOwuP6xSLQp7797f5
	u9h7OQZS2DJNNCFdYDnqqq4UOrsaJypPZVwRTT6eYVJaY0UaBqIuNyhVBEDRI/bjureDgW+mJwdkK
	X7HYN+gA==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uM5Im-000000008IJ-0H1q;
	Mon, 02 Jun 2025 09:34:08 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	yu-cheng.yu@intel.com
Subject: [PATCH 0/3] TLB flush fixes
Date: Mon,  2 Jun 2025 09:30:54 -0400
Message-ID: <20250602133402.3385163-1-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some TLB flush fixes extracted from, or encountered while developing
the Intel RAR functionality.

1) Fix a potential overflow in user_pcid_flush_mask.
   I do not think anybody is hitting this in practice,
   but they could if they wanted to.

2) Change the early boot initialized value of invlpgb_count_max
   to 1, to avoid an infinite loop when...

3) Having cpa_flush() call flush_kernel_range(), which results
   in the INVPLGB code being called very early at boot time.

